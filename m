Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646C7354DF3
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 09:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbhDFHhw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 03:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhDFHhw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 03:37:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCCBC06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 00:37:45 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id w23so4060595edx.7
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QW9SvoK7tPGzupur6oNug9PQ17U1PYn+uokhnisEorg=;
        b=dByXFrv99kSKwmUdwZJqXGxKM6jB108zGixyLCXnDZTC4OPfYaIzA+ziGjBNHBnDCG
         lcy6onPWK+VDgqaxyi66RBTnXgDVQRPSnBRTP+vJwEv/41eCMmnaVEYSZhFsj6G4ZzYo
         jxDZVFYA7t1Z9oHRlNgetRwSbrlLmY910SB3ZLQi9XPCK5mpM8sq0u1IiL+W+QYD09rG
         XgBnvB7UmAP76aTS54pNvIFqYI1jHQMRWQwwEBHIgi4+HRORTkZJKkcg+ghSfPMpMynF
         /b2TiJPLQU1ePN2kEkalhhgmBW0eyLlCGPaIkk7NtGgb4eh6fPJquU8/IEHxAJPCDp+g
         NCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QW9SvoK7tPGzupur6oNug9PQ17U1PYn+uokhnisEorg=;
        b=EMMgb2flHwseqIGLzIf1YLd+QrHxbemqluD81zlP1HQoBQVett2fPMcvjUfgft3eF1
         MY2KtPMiD7vyw5eUelEi/34e8bZmkR3hXvlhuUeeiLQbk6xsTO+IbKt+kHknCsuKOcu9
         HnVAfmSX8ksfQwy5JYMHQwTaRmkH82EWX9XOgBxhojnp4jadF3oClbV1hv23vhwEzHUE
         T2Aeql41qD6KQYI8pOdoXWuGcqC0SolQPUOyDznYcoTI5nzdPmFYq35LJ6KRgvLsuBhh
         5vUgIYh53Z4JlfrKGELnrH9MBnztwmaoubklM7g0K4hLU/zpdC9RH96f6ETEIGv6gX3z
         q8QQ==
X-Gm-Message-State: AOAM5303g26MN+fMVdRj6JqP/rp4yvKkp2/8QDNqP5LSJzkAkgsSqxJB
        sVaiImBO6+jraPPlnMs9SkjYow==
X-Google-Smtp-Source: ABdhPJwl6076rO8C4xyJTe2l6wy/X5Ef3SxZagDWFYPLMUJsA/xwn1cBju0dw+ViiuoKe/KB33qxfQ==
X-Received: by 2002:a50:ee10:: with SMTP id g16mr35689573eds.215.1617694663984;
        Tue, 06 Apr 2021 00:37:43 -0700 (PDT)
Received: from gkim-laptop.fkb.profitbricks.net (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id o6sm12843305edw.24.2021.04.06.00.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:37:43 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH for-next 2/5] block/rnbd-srv: Inject a fault at bio processing
Date:   Tue,  6 Apr 2021 09:37:24 +0200
Message-Id: <20210406073727.172380-3-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406073727.172380-1-gi-oh.kim@ionos.com>
References: <20210406073727.172380-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

If the fault is enabled, it sends an error to the client
so that the client thinks the target device on the server has failed.

Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/block/rnbd/rnbd-srv-sysfs.c | 37 +++++++++++++++++++++++++++++
 drivers/block/rnbd/rnbd-srv.c       |  7 ++++++
 drivers/block/rnbd/rnbd-srv.h       | 13 ++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/block/rnbd/rnbd-srv-sysfs.c b/drivers/block/rnbd/rnbd-srv-sysfs.c
index 05ffe488ddc6..03fb26ac435e 100644
--- a/drivers/block/rnbd/rnbd-srv-sysfs.c
+++ b/drivers/block/rnbd/rnbd-srv-sysfs.c
@@ -253,3 +253,40 @@ void rnbd_srv_destroy_sysfs_files(void)
 	device_destroy(rnbd_dev_class, MKDEV(0, 0));
 	class_destroy(rnbd_dev_class);
 }
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+void rnbd_srv_fault_inject_init(struct rnbd_srv_fault_inject *fault_inject,
+				const char *dev_name)
+{
+	rnbd_fault_inject_init(&fault_inject->fj, dev_name, -EBUSY);
+	/* injection points */
+	rnbd_fault_inject_add(fault_inject->fj.dir,
+			      "fail-bio", &fault_inject->fail_bio);
+}
+
+void rnbd_srv_fault_inject_fini(struct rnbd_srv_fault_inject *fault_inject)
+{
+	rnbd_fault_inject_final(&fault_inject->fj);
+}
+
+int rnbd_should_fail_bio(struct rnbd_srv_sess_dev *sess_dev)
+{
+	struct rnbd_srv_fault_inject *fault_inject = &sess_dev->fault_inject;
+
+	if (fault_inject->fail_bio && should_fail(&fault_inject->fj.attr, 1))
+		return fault_inject->fj.status;
+	return 0;
+}
+#else
+void rnbd_srv_fault_inject_init(struct rnbd_srv_fault_inject *fault_inj,
+				const char *dev_name)
+{
+}
+void rnbd_srv_fault_inject_fini(struct rnbd_srv_fault_inject *fault_inject)
+{
+}
+int rnbd_should_fail_bio(struct rnbd_srv_sess_dev *sess_dev)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index a6a68d44f517..447fb0718525 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -88,9 +88,14 @@ void rnbd_endio(void *priv, int error)
 {
 	struct rnbd_io_private *rnbd_priv = priv;
 	struct rnbd_srv_sess_dev *sess_dev = rnbd_priv->sess_dev;
+	int fail_err = 0;
 
 	rnbd_put_sess_dev(sess_dev);
 
+	fail_err = rnbd_should_fail_bio(sess_dev);
+	if (unlikely(fail_err)) /* over-write error which will be sent to client */
+		error = fail_err;
+
 	rtrs_srv_resp_rdma(rnbd_priv->id, error);
 
 	kfree(priv);
@@ -230,6 +235,7 @@ void rnbd_destroy_sess_dev(struct rnbd_srv_sess_dev *sess_dev, bool keep_id)
 	rnbd_put_sess_dev(sess_dev);
 	wait_for_completion(&dc); /* wait for inflights to drop to zero */
 
+	rnbd_srv_fault_inject_fini(&sess_dev->fault_inject);
 	rnbd_dev_close(sess_dev->rnbd_dev);
 	list_del(&sess_dev->sess_list);
 	mutex_lock(&sess_dev->dev->lock);
@@ -811,6 +817,7 @@ static int process_msg_open(struct rtrs_srv *rtrs,
 	rnbd_srv_info(srv_sess_dev, "Opened device '%s'\n", srv_dev->id);
 
 	kfree(full_path);
+	rnbd_srv_fault_inject_init(&srv_sess_dev->fault_inject, kbasename(srv_sess_dev->pathname));
 
 fill_response:
 	rnbd_srv_fill_msg_open_rsp(rsp, srv_sess_dev);
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index b157371c25ed..120e6d64cb82 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -45,6 +45,13 @@ struct rnbd_srv_dev {
 	int				open_write_cnt;
 };
 
+struct rnbd_srv_fault_inject {
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+	struct rnbd_fault_inject fj;
+	bool fail_bio;
+#endif
+};
+
 /* Structure which binds N devices and N sessions */
 struct rnbd_srv_sess_dev {
 	/* Entry inside rnbd_srv_dev struct */
@@ -62,6 +69,7 @@ struct rnbd_srv_sess_dev {
 	struct completion               *destroy_comp;
 	char				pathname[NAME_MAX];
 	enum rnbd_access_mode		access_mode;
+	struct rnbd_srv_fault_inject    fault_inject;
 };
 
 void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev);
@@ -77,4 +85,9 @@ int rnbd_srv_create_sysfs_files(void);
 void rnbd_srv_destroy_sysfs_files(void);
 void rnbd_destroy_sess_dev(struct rnbd_srv_sess_dev *sess_dev, bool keep_id);
 
+void rnbd_srv_fault_inject_init(struct rnbd_srv_fault_inject *fault_inj,
+				const char *dev_name);
+void rnbd_srv_fault_inject_fini(struct rnbd_srv_fault_inject *fault_inject);
+int rnbd_should_fail_bio(struct rnbd_srv_sess_dev *sess_dev);
+
 #endif /* RNBD_SRV_H */
-- 
2.25.1

