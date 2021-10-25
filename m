Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642CD43A472
	for <lists+linux-doc@lfdr.de>; Mon, 25 Oct 2021 22:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbhJYUZl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Oct 2021 16:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237500AbhJYUZc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 16:25:32 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10C0C04A411
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 13:10:07 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id gt5-20020a17090af2c500b001a218bb02b0so219361pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=+/27iLcVwsoRtZBbebC5PI/8sCrYV9o5nqqwoDvFwLQ=;
        b=JOtZFdoO+mQ/0k/uB+I/6TEKe/WTlXcWqeaRbPbw/SEYw+rdJRFMzl7/KpGcBfaMNa
         6ySASfiBInMTzXb5+cvAcqUQA/aotl9IWl1W6kqoTU654K2C6p4num5nY2n0LsAbTjwU
         zPVwn+Zo2dMaO2117CzE2hFJyiWjNlIhTEvvQxe9YQTPNHT8Zbr+HxIO7HIbhNum+YOl
         nRxyfA2/aTxth9biy+qAEXlgUN/gGY9au25feTgdGdDp1GWGWqqmC8FkFpK8Pru+cAcF
         StnnbMpF+TNLIg4+5DFjZWVRJ87W9zQo6FSiIwVx3V3XKSlNkxn7ChQpjplxfwicbFj3
         t/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=+/27iLcVwsoRtZBbebC5PI/8sCrYV9o5nqqwoDvFwLQ=;
        b=CE1WGABahPjoDXZoghS6LoWsXKjyc7S7PPK771tORJnL85hom/lDcULHnpysTpnvpZ
         OiG7bPJ7umU47+l4cMBlV3Pfm7uO222zkrxOySGnqebxJqT9K2KI9FRRjoIREjyQ8Ul5
         wW0HxRF/oqFk3+U1w0D8wZ6syffF0noQ9hhEHiVRyqJJzF/gEN8po+0+2e8cc9CV9ANu
         v9xbWNfooLRJT+jqllEGM1qjp0WiYyVpbAjJtLO1m7TPlgNq2+gLFh37pXH52SeRuRyK
         LWtnVCsaqsvIWmaKZig7c+tXiJWwEtE1nFmDcIumAZ/tX51slLk9qWscgassmZGtv0G3
         nzbg==
X-Gm-Message-State: AOAM531eH4DBw/sWVYm/TTkymv8hu78PTMe/1487xo8dWsrk+OJbQYcN
        P9UbqwZHHO4r6TWi5HYUCGWS+5/j9iqMtvD0IA==
X-Google-Smtp-Source: ABdhPJzkBLtClwx2VcWf/leMtZ/jaMFE+YFih9XQQYoQEY9CXn/SM7ReenZtrU64gtgqJHTypDnKVRQqtf+KaQam5Q==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:b783:5702:523e:d435])
 (user=kaleshsingh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr157982pjh.1.1635192606982; Mon, 25 Oct 2021 13:10:06 -0700 (PDT)
Date:   Mon, 25 Oct 2021 13:08:34 -0700
In-Reply-To: <20211025200852.3002369-1-kaleshsingh@google.com>
Message-Id: <20211025200852.3002369-3-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211025200852.3002369-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v4 2/8] tracing: Add division and multiplication support for
 hist triggers
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds basic support for division and multiplication operations for
hist trigger variable expressions.

For simplicity this patch only supports, division and multiplication
for a single operation expression (e.g. x=$a/$b), as currently
expressions are always evaluated right to left. This can lead to some
incorrect results:

	e.g. echo 'hist:keys=common_pid:x=8-4-2' >> event/trigger

	     8-4-2 should evaluate to 2 i.e. (8-4)-2
	     but currently x evaluate to  6 i.e. 8-(4-2)

Multiplication and division in sub-expressions will work correctly, once
correct operator precedence support is added (See next patch in this
series).

For the undefined case of division by 0, the histogram expression
evaluates to (u64)(-1). Since this cannot be detected when the
expression is created, it is the responsibility of the user to be
aware and account for this possibility.

Examples:
	echo 'hist:keys=common_pid:a=8,b=4,x=$a/$b' \
                   >> event/trigger

	echo 'hist:keys=common_pid:y=5*$b' \
                   >> event/trigger

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Use div64 helper in hist_field_div() to avoid faults on
    x86 32-bit machines, per Steven Rostedt

 kernel/trace/trace_events_hist.c | 72 +++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 28f711224944..522355a06f58 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -97,6 +97,8 @@ enum field_op_id {
 	FIELD_OP_PLUS,
 	FIELD_OP_MINUS,
 	FIELD_OP_UNARY_MINUS,
+	FIELD_OP_DIV,
+	FIELD_OP_MULT,
 };
 
 /*
@@ -285,6 +287,40 @@ static u64 hist_field_minus(struct hist_field *hist_field,
 	return val1 - val2;
 }
 
+static u64 hist_field_div(struct hist_field *hist_field,
+			   struct tracing_map_elt *elt,
+			   struct trace_buffer *buffer,
+			   struct ring_buffer_event *rbe,
+			   void *event)
+{
+	struct hist_field *operand1 = hist_field->operands[0];
+	struct hist_field *operand2 = hist_field->operands[1];
+
+	u64 val1 = operand1->fn(operand1, elt, buffer, rbe, event);
+	u64 val2 = operand2->fn(operand2, elt, buffer, rbe, event);
+
+	/* Return -1 for the undefined case */
+	if (!val2)
+		return -1;
+
+	return div64_u64(val1, val2);
+}
+
+static u64 hist_field_mult(struct hist_field *hist_field,
+			   struct tracing_map_elt *elt,
+			   struct trace_buffer *buffer,
+			   struct ring_buffer_event *rbe,
+			   void *event)
+{
+	struct hist_field *operand1 = hist_field->operands[0];
+	struct hist_field *operand2 = hist_field->operands[1];
+
+	u64 val1 = operand1->fn(operand1, elt, buffer, rbe, event);
+	u64 val2 = operand2->fn(operand2, elt, buffer, rbe, event);
+
+	return val1 * val2;
+}
+
 static u64 hist_field_unary_minus(struct hist_field *hist_field,
 				  struct tracing_map_elt *elt,
 				  struct trace_buffer *buffer,
@@ -1592,6 +1628,12 @@ static char *expr_str(struct hist_field *field, unsigned int level)
 	case FIELD_OP_PLUS:
 		strcat(expr, "+");
 		break;
+	case FIELD_OP_DIV:
+		strcat(expr, "/");
+		break;
+	case FIELD_OP_MULT:
+		strcat(expr, "*");
+		break;
 	default:
 		kfree(expr);
 		return NULL;
@@ -1607,7 +1649,7 @@ static int contains_operator(char *str)
 	enum field_op_id field_op = FIELD_OP_NONE;
 	char *op;
 
-	op = strpbrk(str, "+-");
+	op = strpbrk(str, "+-/*");
 	if (!op)
 		return FIELD_OP_NONE;
 
@@ -1628,6 +1670,12 @@ static int contains_operator(char *str)
 	case '+':
 		field_op = FIELD_OP_PLUS;
 		break;
+	case '/':
+		field_op = FIELD_OP_DIV;
+		break;
+	case '*':
+		field_op = FIELD_OP_MULT;
+		break;
 	default:
 		break;
 	}
@@ -2361,10 +2409,26 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 	case FIELD_OP_PLUS:
 		sep = "+";
 		break;
+	case FIELD_OP_DIV:
+		sep = "/";
+		break;
+	case FIELD_OP_MULT:
+		sep = "*";
+		break;
 	default:
 		goto free;
 	}
 
+	/*
+	 * Multiplication and division are only supported in single operator
+	 * expressions, since the expression is always evaluated from right
+	 * to left.
+	 */
+	if ((field_op == FIELD_OP_DIV || field_op == FIELD_OP_MULT) && level > 0) {
+		hist_err(file->tr, HIST_ERR_TOO_MANY_SUBEXPR, errpos(str));
+		return ERR_PTR(-EINVAL);
+	}
+
 	operand1_str = strsep(&str, sep);
 	if (!operand1_str || !str)
 		goto free;
@@ -2436,6 +2500,12 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 	case FIELD_OP_PLUS:
 		expr->fn = hist_field_plus;
 		break;
+	case FIELD_OP_DIV:
+		expr->fn = hist_field_div;
+		break;
+	case FIELD_OP_MULT:
+		expr->fn = hist_field_mult;
+		break;
 	default:
 		ret = -EINVAL;
 		goto free;
-- 
2.33.0.1079.g6e70778dc9-goog

