Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93C043A3C8
	for <lists+linux-doc@lfdr.de>; Mon, 25 Oct 2021 22:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235698AbhJYUDI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Oct 2021 16:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237791AbhJYUAu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 16:00:50 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B7DC036D4D
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 12:25:07 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x68-20020a25ce47000000b005c198858e6bso2554218ybe.21
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=9Ql4uehadw2j6BVRhe3fDBuv0Q3sPrmeMa11sG3Mghc=;
        b=CjK3qa+LRnQlrKD32MixlMBHWpmyPuaXfyrhPr29OWVk8ewAxNn+DC0BHIAzDtTjlL
         2BqBiqVSHV4UrnVMNHuw7xGeKbjBbAVaeKQ4zA/r+R51XbksUQXHfn+8oH9rcKXFUEty
         KOWBw1LKNoCUsGt5ybafmz/39ZElM1WB4o21hxObJ5xVP6BGC3ccpLJ2HmVbOySGK5bk
         VhwlwMDX8U36F7f4xYMeKV6fvCuX3Ii81RXw2zM1+anZxHqhFq4kroM7p62+ckopc+Jq
         v0a+o4BiKNsJzEtGYyo+cnqe0bA6c+VoORdYVgTEM4vd5S1gs4epYdhTH/SStB7ggfNy
         q9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=9Ql4uehadw2j6BVRhe3fDBuv0Q3sPrmeMa11sG3Mghc=;
        b=oupEOBF1eaK58PBBZEs8uwQmHsQPV2otAzGBqV/enNXlKoTfMWjui/ksDcrNwQ0vxE
         t+gcOy8GVRLI7n8VAfjwHUpyD4jqq5zwQDIbk5P65EZMv2CaW9pzn0PPrLFJoJL+oJAz
         XRILNDCILIRZAtcfSoAoCpVM+dkl6pHjyq6kDCJIHzZQmGD/TO1Z1620gRf2iyl/1Vnq
         jgBrKvsDiazuh84RR6D4mkAi3TCJYp2SQdFX+MhZNXQ1JFvFwHAXhqteu/ma4r/gyHiU
         3qeqqzM0Pe8UWoOlEyH5rEVXEsBZtbpUectrsks/rLHeU6PY3AHIq+FSR9QbiFrl9cw7
         d+dw==
X-Gm-Message-State: AOAM531rE3e+m4QrJvkN7oAVaw1g09gxiWFc+OtvtqlTDwmktDAkCYFY
        T6ZM/d5JbHHblNIeLa0UCPDHT7c32r8uDXrwmQ==
X-Google-Smtp-Source: ABdhPJwEU718QD6CYBzlo0tkEFiliWh68r9hbOSAJN6K80wLyxtEhFO0eCAz5+0x8Zxjhkv8UpJU5Mr+B9UjHtdvgw==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:b783:5702:523e:d435])
 (user=kaleshsingh job=sendgmr) by 2002:a25:86c4:: with SMTP id
 y4mr17365728ybm.258.1635189906533; Mon, 25 Oct 2021 12:25:06 -0700 (PDT)
Date:   Mon, 25 Oct 2021 12:23:16 -0700
In-Reply-To: <20211025192330.2992076-1-kaleshsingh@google.com>
Message-Id: <20211025192330.2992076-6-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211025192330.2992076-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v3 5/8] tracing/histogram: Covert expr to const if both
 operands are constants
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, Kalesh Singh <kaleshsingh@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If both operands of a hist trigger expression are constants, convert the
expression to a constant. This optimization avoids having to perform the
same calculation multiple times and also saves on memory since the
merged constants are represented by a single struct hist_field instead
or multiple.

Change-Id: I83388bbbc6e109980f08eac437172238576055d5
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_hist.c | 104 ++++++++++++++++++++++---------
 1 file changed, 74 insertions(+), 30 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 34aba07d23f8..db28bcf976f4 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -2411,9 +2411,15 @@ static struct hist_field *parse_unary(struct hist_trigger_data *hist_data,
 	return ERR_PTR(ret);
 }
 
+/*
+ * If the operands are var refs, return pointers the
+ * variable(s) referenced in var1 and var2, else NULL.
+ */
 static int check_expr_operands(struct trace_array *tr,
 			       struct hist_field *operand1,
-			       struct hist_field *operand2)
+			       struct hist_field *operand2,
+			       struct hist_field **var1,
+			       struct hist_field **var2)
 {
 	unsigned long operand1_flags = operand1->flags;
 	unsigned long operand2_flags = operand2->flags;
@@ -2426,6 +2432,7 @@ static int check_expr_operands(struct trace_array *tr,
 		if (!var)
 			return -EINVAL;
 		operand1_flags = var->flags;
+		*var1 = var;
 	}
 
 	if ((operand2_flags & HIST_FIELD_FL_VAR_REF) ||
@@ -2436,6 +2443,7 @@ static int check_expr_operands(struct trace_array *tr,
 		if (!var)
 			return -EINVAL;
 		operand2_flags = var->flags;
+		*var2 = var;
 	}
 
 	if ((operand1_flags & HIST_FIELD_FL_TIMESTAMP_USECS) !=
@@ -2453,9 +2461,12 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 				     char *var_name, unsigned int *n_subexprs)
 {
 	struct hist_field *operand1 = NULL, *operand2 = NULL, *expr = NULL;
-	unsigned long operand_flags;
+	struct hist_field *var1 = NULL, *var2 = NULL;
+	unsigned long operand_flags, operand2_flags;
 	int field_op, ret = -EINVAL;
 	char *sep, *operand1_str;
+	hist_field_fn_t op_fn;
+	bool combine_consts;
 
 	if (*n_subexprs > 3) {
 		hist_err(file->tr, HIST_ERR_TOO_MANY_SUBEXPR, errpos(str));
@@ -2512,11 +2523,38 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 		goto free;
 	}
 
-	ret = check_expr_operands(file->tr, operand1, operand2);
+	switch (field_op) {
+	case FIELD_OP_MINUS:
+		op_fn = hist_field_minus;
+		break;
+	case FIELD_OP_PLUS:
+		op_fn = hist_field_plus;
+		break;
+	case FIELD_OP_DIV:
+		op_fn = hist_field_div;
+		break;
+	case FIELD_OP_MULT:
+		op_fn = hist_field_mult;
+		break;
+	default:
+		ret = -EINVAL;
+		goto free;
+	}
+
+	ret = check_expr_operands(file->tr, operand1, operand2, &var1, &var2);
 	if (ret)
 		goto free;
 
-	flags |= HIST_FIELD_FL_EXPR;
+	operand_flags = var1 ? var1->flags : operand1->flags;
+	operand2_flags = var2 ? var2->flags : operand2->flags;
+
+	/*
+	 * If both operands are constant, the expression can be
+	 * collapsed to a single constant.
+	 */
+	combine_consts = operand_flags & operand2_flags & HIST_FIELD_FL_CONST;
+
+	flags |= combine_consts ? HIST_FIELD_FL_CONST : HIST_FIELD_FL_EXPR;
 
 	flags |= operand1->flags &
 		(HIST_FIELD_FL_TIMESTAMP | HIST_FIELD_FL_TIMESTAMP_USECS);
@@ -2533,37 +2571,43 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 	expr->operands[0] = operand1;
 	expr->operands[1] = operand2;
 
-	/* The operand sizes should be the same, so just pick one */
-	expr->size = operand1->size;
+	if (combine_consts) {
+		if (var1)
+			expr->operands[0] = var1;
+		if (var2)
+			expr->operands[1] = var2;
 
-	expr->operator = field_op;
-	expr->name = expr_str(expr, 0);
-	expr->type = kstrdup_const(operand1->type, GFP_KERNEL);
-	if (!expr->type) {
-		ret = -ENOMEM;
-		goto free;
-	}
+		expr->constant = op_fn(expr, NULL, NULL, NULL, NULL);
 
-	switch (field_op) {
-	case FIELD_OP_MINUS:
-		expr->fn = hist_field_minus;
-		break;
-	case FIELD_OP_PLUS:
-		expr->fn = hist_field_plus;
-		break;
-	case FIELD_OP_DIV:
-		expr->fn = hist_field_div;
-		break;
-	case FIELD_OP_MULT:
-		expr->fn = hist_field_mult;
-		break;
-	default:
-		ret = -EINVAL;
-		goto free;
+		expr->operands[0] = NULL;
+		expr->operands[1] = NULL;
+
+		/*
+		 * var refs won't be destroyed immediately
+		 * See: destroy_hist_field()
+		 */
+		destroy_hist_field(operand2, 0);
+		destroy_hist_field(operand1, 0);
+
+		expr->name = expr_str(expr, 0);
+	} else {
+		expr->fn = op_fn;
+
+		/* The operand sizes should be the same, so just pick one */
+		expr->size = operand1->size;
+
+		expr->operator = field_op;
+		expr->type = kstrdup_const(operand1->type, GFP_KERNEL);
+		if (!expr->type) {
+			ret = -ENOMEM;
+			goto free;
+		}
+
+		expr->name = expr_str(expr, 0);
 	}
 
 	return expr;
- free:
+free:
 	destroy_hist_field(operand1, 0);
 	destroy_hist_field(operand2, 0);
 	destroy_hist_field(expr, 0);
-- 
2.33.0.1079.g6e70778dc9-goog

