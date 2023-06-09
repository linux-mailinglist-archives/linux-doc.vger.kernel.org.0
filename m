Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956F7729DCA
	for <lists+linux-doc@lfdr.de>; Fri,  9 Jun 2023 17:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241756AbjFIPFs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Jun 2023 11:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241816AbjFIPFf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 11:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A3A359A
        for <linux-doc@vger.kernel.org>; Fri,  9 Jun 2023 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686323060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BTFUs8gxr9moRkZBUGlN4k/3c1CssODo/4E7AM+Boo0=;
        b=Vg7K9JS4bOMbwrEcDs4akby2ih6nbdr1QD+EnhN1wYTM3kz25MJ+79AJxDn6VPGZ2Zak2U
        iwk0KVdQRMok82Lp+5JS7JoIisORvQ5oe1AIWdsmkK/12wg/kbSX/WuNkeSd7Ycde5y+3y
        4TU4n9Ul357RN2DLcz+EYmq+qx5oD9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-vuAZu9-eP4-7JP3ypZOA8g-1; Fri, 09 Jun 2023 11:04:17 -0400
X-MC-Unique: vuAZu9-eP4-7JP3ypZOA8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83AEB101A53B;
        Fri,  9 Jun 2023 15:04:16 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.42.28.16])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 17BEE4087C67;
        Fri,  9 Jun 2023 15:04:14 +0000 (UTC)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Leonardo Bras <leobras@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: [RFC PATCH 3/5] tracing/filters: Enable filtering a scalar field by a cpumask
Date:   Fri,  9 Jun 2023 16:03:22 +0100
Message-Id: <20230609150324.143538-4-vschneid@redhat.com>
In-Reply-To: <20230609150324.143538-1-vschneid@redhat.com>
References: <20230609150324.143538-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Several events use a scalar field to denote a CPU:
o sched_wakeup.target_cpu
o sched_migrate_task.orig_cpu,dest_cpu
o sched_move_numa.src_cpu,dst_cpu
o ipi_send_cpu.cpu
o ...

Filtering these currently requires using arithmetic comparison functions,
which can be tedious when dealing with interleaved SMT or NUMA CPU ids.

Allow these to be filtered by a user-provided cpumask, which enables e.g.:

$ trace-cmd record -e 'sched_wakeup' -f 'target_cpu & MASK{2,4,6,8-32}'

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
NOTE: I went with an implicit cpumask conversion of the event field, as
AFAICT predicate_parse() does not support parsing the application of a
function to a field (e.g. 'MASK(target_cpu) & MASK{2,4,6,8-32}')
---
 kernel/trace/trace_events_filter.c | 92 ++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 12 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 8af00caa363f7..99e111c237a93 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -46,15 +46,19 @@ static const char * ops[] = { OPS };
 enum filter_pred_fn {
 	FILTER_PRED_FN_NOP,
 	FILTER_PRED_FN_64,
+	FILTER_PRED_FN_64_CPUMASK,
 	FILTER_PRED_FN_S64,
 	FILTER_PRED_FN_U64,
 	FILTER_PRED_FN_32,
+	FILTER_PRED_FN_32_CPUMASK,
 	FILTER_PRED_FN_S32,
 	FILTER_PRED_FN_U32,
 	FILTER_PRED_FN_16,
+	FILTER_PRED_FN_16_CPUMASK,
 	FILTER_PRED_FN_S16,
 	FILTER_PRED_FN_U16,
 	FILTER_PRED_FN_8,
+	FILTER_PRED_FN_8_CPUMASK,
 	FILTER_PRED_FN_S8,
 	FILTER_PRED_FN_U8,
 	FILTER_PRED_FN_COMM,
@@ -641,6 +645,37 @@ predicate_parse(const char *str, int nr_parens, int nr_preds,
 	return ERR_PTR(ret);
 }
 
+static inline int
+do_filter_cpumask(int op, const struct cpumask *mask, const struct cpumask *cmp)
+{
+	switch (op) {
+	case OP_EQ:
+		return cpumask_equal(mask, cmp);
+	case OP_NE:
+		return !cpumask_equal(mask, cmp);
+	case OP_BAND:
+		return cpumask_intersects(mask, cmp);
+	default:
+		return 0;
+	}
+}
+
+/* Optimisation of do_filter_cpumask() for scalar values */
+static inline int
+do_filter_cpumask_scalar(int op, unsigned int cpu, const struct cpumask *mask)
+{
+	switch (op) {
+	case OP_EQ:
+		return cpumask_equal(mask, cpumask_of(cpu));
+	case OP_NE:
+		return !cpumask_equal(mask, cpumask_of(cpu));
+	case OP_BAND:
+		return cpumask_test_cpu(cpu, mask);
+	default:
+		return 0;
+	}
+}
+
 enum pred_cmp_types {
 	PRED_CMP_TYPE_NOP,
 	PRED_CMP_TYPE_LT,
@@ -684,6 +719,18 @@ static int filter_pred_##type(struct filter_pred *pred, void *event)	\
 	}								\
 }
 
+#define DEFINE_CPUMASK_COMPARISON_PRED(size)					\
+static int filter_pred_##size##_cpumask(struct filter_pred *pred, void *event)	\
+{										\
+	u##size *addr = (u##size *)(event + pred->offset);			\
+	unsigned int cpu = *addr;						\
+										\
+	if (cpu >= nr_cpu_ids)							\
+		return 0;							\
+										\
+	return do_filter_cpumask_scalar(pred->op, cpu, pred->mask);		\
+}
+
 #define DEFINE_EQUALITY_PRED(size)					\
 static int filter_pred_##size(struct filter_pred *pred, void *event)	\
 {									\
@@ -705,6 +752,11 @@ DEFINE_COMPARISON_PRED(u16);
 DEFINE_COMPARISON_PRED(s8);
 DEFINE_COMPARISON_PRED(u8);
 
+DEFINE_CPUMASK_COMPARISON_PRED(64);
+DEFINE_CPUMASK_COMPARISON_PRED(32);
+DEFINE_CPUMASK_COMPARISON_PRED(16);
+DEFINE_CPUMASK_COMPARISON_PRED(8);
+
 DEFINE_EQUALITY_PRED(64);
 DEFINE_EQUALITY_PRED(32);
 DEFINE_EQUALITY_PRED(16);
@@ -889,16 +941,7 @@ static int filter_pred_cpumask(struct filter_pred *pred, void *event)
 	const struct cpumask *mask = (event + loc);
 	const struct cpumask *cmp = pred->mask;
 
-	switch (pred->op) {
-	case OP_EQ:
-		return cpumask_equal(mask, cmp);
-	case OP_NE:
-		return !cpumask_equal(mask, cmp);
-	case OP_BAND:
-		return cpumask_intersects(mask, cmp);
-	default:
-		return 0;
-	}
+	return do_filter_cpumask(pred->op, mask, cmp);
 }
 
 /* Filter predicate for COMM. */
@@ -1349,24 +1392,32 @@ static int filter_pred_fn_call(struct filter_pred *pred, void *event)
 	switch (pred->fn_num) {
 	case FILTER_PRED_FN_64:
 		return filter_pred_64(pred, event);
+	case FILTER_PRED_FN_64_CPUMASK:
+		return filter_pred_64_cpumask(pred, event);
 	case FILTER_PRED_FN_S64:
 		return filter_pred_s64(pred, event);
 	case FILTER_PRED_FN_U64:
 		return filter_pred_u64(pred, event);
 	case FILTER_PRED_FN_32:
 		return filter_pred_32(pred, event);
+	case FILTER_PRED_FN_32_CPUMASK:
+		return filter_pred_32_cpumask(pred, event);
 	case FILTER_PRED_FN_S32:
 		return filter_pred_s32(pred, event);
 	case FILTER_PRED_FN_U32:
 		return filter_pred_u32(pred, event);
 	case FILTER_PRED_FN_16:
 		return filter_pred_16(pred, event);
+	case FILTER_PRED_FN_16_CPUMASK:
+		return filter_pred_16_cpumask(pred, event);
 	case FILTER_PRED_FN_S16:
 		return filter_pred_s16(pred, event);
 	case FILTER_PRED_FN_U16:
 		return filter_pred_u16(pred, event);
 	case FILTER_PRED_FN_8:
 		return filter_pred_8(pred, event);
+	case FILTER_PRED_FN_8_CPUMASK:
+		return filter_pred_8_cpumask(pred, event);
 	case FILTER_PRED_FN_S8:
 		return filter_pred_s8(pred, event);
 	case FILTER_PRED_FN_U8:
@@ -1602,7 +1653,8 @@ static int parse_pred(const char *str, void *data,
 		unsigned int maskstart;
 		char *tmp;
 
-		if (field->filter_type != FILTER_CPUMASK) {
+		if (field->filter_type != FILTER_CPUMASK &&
+		    field->filter_type != FILTER_OTHER) {
 			parse_error(pe, FILT_ERR_ILLEGAL_FIELD_OP, pos + i);
 			goto err_free;
 		}
@@ -1644,8 +1696,24 @@ static int parse_pred(const char *str, void *data,
 
 		/* Move along */
 		i++;
-		if (field->filter_type == FILTER_CPUMASK)
+		if (field->filter_type == FILTER_CPUMASK) {
 			pred->fn_num = FILTER_PRED_FN_CPUMASK;
+		} else {
+			switch (field->size) {
+			case 8:
+				pred->fn_num = FILTER_PRED_FN_64_CPUMASK;
+				break;
+			case 4:
+				pred->fn_num = FILTER_PRED_FN_32_CPUMASK;
+				break;
+			case 2:
+				pred->fn_num = FILTER_PRED_FN_16_CPUMASK;
+				break;
+			case 1:
+				pred->fn_num = FILTER_PRED_FN_8_CPUMASK;
+				break;
+			}
+		}
 
 	/* This is either a string, or an integer */
 	} else if (str[i] == '\'' || str[i] == '"') {
-- 
2.31.1

