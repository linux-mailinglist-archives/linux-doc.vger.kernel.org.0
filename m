Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1894C4557
	for <lists+linux-doc@lfdr.de>; Fri, 25 Feb 2022 14:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbiBYNIN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Feb 2022 08:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiBYNIL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Feb 2022 08:08:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9442B22A2AE;
        Fri, 25 Feb 2022 05:07:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E35E61C61;
        Fri, 25 Feb 2022 13:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B4DC340E8;
        Fri, 25 Feb 2022 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645794457;
        bh=KddJdFqVOnq0xfhpG7XfrROWOOfyL2vi8LybdSNAuAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JbNt+sP2X2eKQyR7gZaIfMwEbiQ+0FtEweZtCp2UjCUckOS6Eb5sTtCE5GhQHDTAk
         yTcx0a6OSOnaYvYDfHgAgW5p7w8RhakdmNTF3Ns51PkReNdD59VJSI+zNl7nZGtfzn
         DofnNUGJiTDu2NPP4VliOscKdZCj3T3kNaDGyu26moW5sIkwFuSNLpdXd40LAkRfMw
         fWiYVHP9JMKLl2HNEATVQ4TvDLKhQ0FlQtzq/ujtLOayHJcURvKPpcqNnE2a8xWSeI
         CjUDSS+a+1EpqfH2EVFOdinSBabBb/zAImBSBQa17VZ06bCn/tD0gWjw+J3w13m3e0
         /2qvLLwrmZGiA==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     corbet@lwn.net, skhan@linuxfoundation.org, rientjes@google.com,
        xhao@linux.alibaba.com, linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: [PATCH v2 04/13] mm/damon/sysfs: Link DAMON for virtual address spaces monitoring
Date:   Fri, 25 Feb 2022 13:07:03 +0000
Message-Id: <20220225130712.12682-5-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225130712.12682-1-sj@kernel.org>
References: <20220225130712.12682-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit links the DAMON sysfs interface to DAMON so that users can
control DAMON via the interface.  In detail, this commit makes writing
'on' to 'state' file constructs DAMON contexts based on values that
users have written to relevant sysfs files and start the context.  It
supports only virtual address spaces monitoring at the moment, though.

The files hierarchy of DAMON sysfs interface after this commit is shown
below.  In the below figure, parents-children relations are represented
with indentations, each directory is having ``/`` suffix, and files in
each directory are separated by comma (",").

    /sys/kernel/mm/damon/admin
    │ kdamonds/nr_kdamonds
    │ │ 0/state,pid
    │ │ │ contexts/nr_contexts
    │ │ │ │ 0/operations
    │ │ │ │ │ monitoring_attrs/
    │ │ │ │ │ │ intervals/sample_us,aggr_us,update_us
    │ │ │ │ │ │ nr_regions/min,max
    │ │ │ │ │ targets/nr_targets
    │ │ │ │ │ │ 0/pid_target
    │ │ │ │ │ │ ...
    │ │ │ │ ...
    │ │ ...

The usage is straightforward.  Writing a number ('N') to each 'nr_*'
file makes directories named '0' to 'N-1'.  Users can construct DAMON
contexts by writing proper values to the files in the straightforward
manner and start each kdamond by writing 'on' to 'kdamonds/<N>/state'.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/damon/sysfs.c | 192 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 189 insertions(+), 3 deletions(-)

diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index 87cf28ae6a6f..9221c93db6cc 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -806,22 +806,208 @@ static void damon_sysfs_kdamond_rm_dirs(struct damon_sysfs_kdamond *kdamond)
 	kobject_put(&kdamond->contexts->kobj);
 }
 
+static bool damon_sysfs_ctx_running(struct damon_ctx *ctx)
+{
+	bool running;
+
+	mutex_lock(&ctx->kdamond_lock);
+	running = ctx->kdamond != NULL;
+	mutex_unlock(&ctx->kdamond_lock);
+	return running;
+}
+
 static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
 		char *buf)
 {
-	return -EINVAL;
+	struct damon_sysfs_kdamond *kdamond = container_of(kobj,
+			struct damon_sysfs_kdamond, kobj);
+	struct damon_ctx *ctx = kdamond->damon_ctx;
+	bool running;
+
+	if (!ctx)
+		running = false;
+	else
+		running = damon_sysfs_ctx_running(ctx);
+
+	return sysfs_emit(buf, "%s\n", running ? "on" : "off");
+}
+
+static int damon_sysfs_set_attrs(struct damon_ctx *ctx,
+		struct damon_sysfs_attrs *sys_attrs)
+{
+	struct damon_sysfs_intervals *sys_intervals = sys_attrs->intervals;
+	struct damon_sysfs_ul_range *sys_nr_regions =
+		sys_attrs->nr_regions_range;
+
+	return damon_set_attrs(ctx, sys_intervals->sample_us,
+			sys_intervals->aggr_us, sys_intervals->update_us,
+			sys_nr_regions->min, sys_nr_regions->max);
+}
+
+static void damon_sysfs_destroy_targets(struct damon_ctx *ctx)
+{
+	struct damon_target *t, *next;
+
+	damon_for_each_target_safe(t, next, ctx) {
+		if (ctx->ops.id == DAMON_OPS_VADDR)
+			put_pid(t->pid);
+		damon_destroy_target(t);
+	}
+}
+
+static int damon_sysfs_set_targets(struct damon_ctx *ctx,
+		struct damon_sysfs_targets *sysfs_targets)
+{
+	int i;
+
+	for (i = 0; i < sysfs_targets->nr; i++) {
+		struct damon_sysfs_target *sys_target =
+			sysfs_targets->targets_arr[i];
+		struct damon_target *t = damon_new_target();
+
+		if (!t) {
+			damon_sysfs_destroy_targets(ctx);
+			return -ENOMEM;
+		}
+		if (ctx->ops.id == DAMON_OPS_VADDR) {
+			t->pid = find_get_pid(sys_target->pid);
+			if (!t->pid) {
+				damon_sysfs_destroy_targets(ctx);
+				return -EINVAL;
+			}
+		}
+		damon_add_target(ctx, t);
+	}
+	return 0;
+}
+
+static void damon_sysfs_before_terminate(struct damon_ctx *ctx)
+{
+	struct damon_target *t, *next;
+
+	if (ctx->ops.id != DAMON_OPS_VADDR)
+		return;
+
+	mutex_lock(&ctx->kdamond_lock);
+	damon_for_each_target_safe(t, next, ctx) {
+		put_pid(t->pid);
+		damon_destroy_target(t);
+	}
+	mutex_unlock(&ctx->kdamond_lock);
+}
+
+static struct damon_ctx *damon_sysfs_build_ctx(
+		struct damon_sysfs_context *sys_ctx)
+{
+	struct damon_ctx *ctx = damon_new_ctx();
+	int err;
+
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	err = damon_select_ops(ctx, sys_ctx->ops_id);
+	if (err)
+		goto out;
+	err = damon_sysfs_set_attrs(ctx, sys_ctx->attrs);
+	if (err)
+		goto out;
+	err = damon_sysfs_set_targets(ctx, sys_ctx->targets);
+	if (err)
+		goto out;
+
+	ctx->callback.before_terminate = damon_sysfs_before_terminate;
+	return ctx;
+
+out:
+	damon_destroy_ctx(ctx);
+	return ERR_PTR(err);
+}
+
+static int damon_sysfs_turn_damon_on(struct damon_sysfs_kdamond *kdamond)
+{
+	struct damon_ctx *ctx;
+	int err;
+
+	if (kdamond->damon_ctx &&
+			damon_sysfs_ctx_running(kdamond->damon_ctx))
+		return -EBUSY;
+	/* TODO: support multiple contexts per kdamond */
+	if (kdamond->contexts->nr != 1)
+		return -EINVAL;
+
+	if (kdamond->damon_ctx)
+		damon_destroy_ctx(kdamond->damon_ctx);
+	kdamond->damon_ctx = NULL;
+
+	ctx = damon_sysfs_build_ctx(kdamond->contexts->contexts_arr[0]);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+	err = damon_start(&ctx, 1, false);
+	if (err) {
+		damon_destroy_ctx(ctx);
+		return err;
+	}
+	kdamond->damon_ctx = ctx;
+	return err;
+}
+
+static int damon_sysfs_turn_damon_off(struct damon_sysfs_kdamond *kdamond)
+{
+	if (!kdamond->damon_ctx)
+		return -EINVAL;
+	return damon_stop(&kdamond->damon_ctx, 1);
+	/*
+	 * To allow users show final monitoring results of already turned-off
+	 * DAMON, we free kdamond->damon_ctx in next
+	 * damon_sysfs_turn_damon_on(), or kdamonds_nr_store()
+	 */
 }
 
 static ssize_t state_store(struct kobject *kobj, struct kobj_attribute *attr,
 		const char *buf, size_t count)
 {
-	return -EINVAL;
+	struct damon_sysfs_kdamond *kdamond = container_of(kobj,
+			struct damon_sysfs_kdamond, kobj);
+	ssize_t ret;
+
+	if (!mutex_trylock(&damon_sysfs_lock))
+		return -EBUSY;
+	if (sysfs_streq(buf, "on"))
+		ret = damon_sysfs_turn_damon_on(kdamond);
+	else if (sysfs_streq(buf, "off"))
+		ret = damon_sysfs_turn_damon_off(kdamond);
+	else
+		ret = -EINVAL;
+	mutex_unlock(&damon_sysfs_lock);
+	if (!ret)
+		ret = count;
+	return ret;
 }
 
 static ssize_t pid_show(struct kobject *kobj,
 		struct kobj_attribute *attr, char *buf)
 {
-	return -EINVAL;
+	struct damon_sysfs_kdamond *kdamond = container_of(kobj,
+			struct damon_sysfs_kdamond, kobj);
+	struct damon_ctx *ctx;
+	int pid;
+
+	if (!mutex_trylock(&damon_sysfs_lock))
+		return -EBUSY;
+	ctx = kdamond->damon_ctx;
+	if (!ctx) {
+		pid = -1;
+		goto out;
+	}
+	mutex_lock(&ctx->kdamond_lock);
+	if (!ctx->kdamond)
+		pid = -1;
+	else
+		pid = ctx->kdamond->pid;
+	mutex_unlock(&ctx->kdamond_lock);
+out:
+	mutex_unlock(&damon_sysfs_lock);
+	return sysfs_emit(buf, "%d\n", pid);
 }
 
 static void damon_sysfs_kdamond_release(struct kobject *kobj)
-- 
2.17.1

