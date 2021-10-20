Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34DA4342F8
	for <lists+linux-doc@lfdr.de>; Wed, 20 Oct 2021 03:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhJTBg4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 21:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhJTBgz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 21:36:55 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942CAC06161C
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 18:34:41 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id h185-20020a256cc2000000b005bdce4db0easo27826233ybc.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 18:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=qaKijHBDbg4MDDE34AX+1Hb/Rx1aDbvkQ77nEsegoWQ=;
        b=VpP3BTmOG0fnhKEfwY8k6rT/1onZ530niR+thm5TzCJ/3FKc7MNT0Ovlut9zeHT2q9
         Qphv/40SX9s/lPEp4mslzDJ8p5nDc1GqKHzilgxAmwtlL6IKxkM5m2IEECIJHdh8SCay
         JHuil2cDGQdeM2qVTD/SRyl7mx4z3iVINK0nTlWHoLZpxCyJ1ChRZ9Ew6aNnFeGCweJE
         zXLeil2hzFbNlwdQpVdtkFhhT5oGWDgtEGqIdlEUZzAF611SJbUT8db0kmz3H8N7A5Va
         X3gmmx9DvVheJlO/nQcdfDNXQ0Czq7qtIof85Qt1wLDGqajh1mht+awk4wz0VxAOlfRX
         SUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=qaKijHBDbg4MDDE34AX+1Hb/Rx1aDbvkQ77nEsegoWQ=;
        b=XvLJBz888Ejt3XpyGKoXLc4tWyrcRn/8Kn07zt0pqv4jzpp22XFAjNNZChuyE94h3d
         S13QD17TREtzx6rzCh1HOOCglv0eRyugz00/z9hxvb/dowDyoSRVZExmWRSUOULlWZsn
         Ly8eXsjm0aQk1ym11gHLnizRkLhQmc1nL1s5BPflgz2gACW/q53crxq8EF0QZB0fPh2w
         M6i1JohwVp4r047acIYGxKmJ/PHd0Sm91+X9ISlbm1+O7LMej0goSRoLWfaKX0KS2p3R
         2yme4ZQoF6xqJdEESIljA/4A4tAjkb//JeW5TzyyLGH7jT0u5SNVTpUVuKwGA0r/QCH7
         rW8w==
X-Gm-Message-State: AOAM533jeov3c1D101QFA8speZxlEPBgjAWAAsEO67ZDcrm95kx4G9/K
        LZLrPjMroKkc6ehCZq4k0n87xEnTddz9bphCFg==
X-Google-Smtp-Source: ABdhPJxYPBcKJ3w/+ILnLwmNfttJXo+ix+IexGVCqGCpVl2gYD2z8hAMxXucyfpNzN6YWDg035MdjovJmo2IqxMWqw==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:1953:b886:7a6c:bf0])
 (user=kaleshsingh job=sendgmr) by 2002:a25:217:: with SMTP id
 23mr39826833ybc.205.1634693680869; Tue, 19 Oct 2021 18:34:40 -0700 (PDT)
Date:   Tue, 19 Oct 2021 18:31:41 -0700
In-Reply-To: <20211020013153.4106001-1-kaleshsingh@google.com>
Message-Id: <20211020013153.4106001-5-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 4/5] tracing/selftests: Add tests for hist trigger
 expression parsing
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

Add tests for the parsing of hist trigger expressions; and to
validate expression evaluation.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
---

Changes in v2:
  - Add Namhyung's Reviewed-by
  - Update comment to clarify err_pos in "Too many subexpressions" test

 .../testing/selftests/ftrace/test.d/functions |  4 +-
 .../trigger/trigger-hist-expressions.tc       | 74 +++++++++++++++++++
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc

diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index 000fd05e84b1..1855a63559ad 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -16,13 +16,13 @@ reset_tracer() { # reset the current tracer
 
 reset_trigger_file() {
     # remove action triggers first
-    grep -H ':on[^:]*(' $@ |
+    grep -H ':on[^:]*(' $@ | tac |
     while read line; do
         cmd=`echo $line | cut -f2- -d: | cut -f1 -d"["`
 	file=`echo $line | cut -f1 -d:`
 	echo "!$cmd" >> $file
     done
-    grep -Hv ^# $@ |
+    grep -Hv ^# $@ | tac |
     while read line; do
         cmd=`echo $line | cut -f2- -d: | cut -f1 -d"["`
 	file=`echo $line | cut -f1 -d:`
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc
new file mode 100644
index 000000000000..45399fce3483
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc
@@ -0,0 +1,74 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: event trigger - test histogram expression parsing
+# requires: set_event events/sched/sched_process_fork/trigger events/sched/sched_process_fork/hist error_log
+
+
+fail() { #msg
+    echo $1
+    exit_fail
+}
+
+get_hist_var() { #var_name hist_path
+    hist_output=`grep -m1 "$1: " $2`
+    hitcount=`echo $hist_output | awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "hitcount:") print $(i+1)} }'`
+    var_sum=`echo $hist_output | awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "'$1':") print $(i+1)} }'`
+    var_val=$(( var_sum / hitcount ))
+    echo $var_val
+}
+
+test_hist_expr() { # test_name expression expected_val
+    echo "Test hist trigger expressions - $1"
+
+    echo "hist:keys=common_pid:x=$2" > events/sched/sched_process_fork/trigger
+    echo 'hist:keys=common_pid:vals=$x' >> events/sched/sched_process_fork/trigger
+    for i in `seq 1 10` ; do ( echo "forked" > /dev/null); done
+
+    actual=`get_hist_var x events/sched/sched_process_fork/hist`
+
+    if [ $actual != $3 ]; then
+        fail "Failed hist trigger expression evaluation: Expression: $2 Expected: $3, Actual: $actual"
+    fi
+
+    reset_trigger
+}
+
+check_error() { # test_name command-with-error-pos-by-^
+    echo "Test hist trigger expressions - $1"
+    ftrace_errlog_check 'hist:sched:sched_process_fork' "$2" 'events/sched/sched_process_fork/trigger'
+    reset_trigger
+}
+
+test_hist_expr "Variable assignment" "123" "123"
+
+test_hist_expr "Subtraction not associative" "16-8-4-2" "2"
+
+test_hist_expr "Division not associative" "64/8/4/2" "1"
+
+test_hist_expr "Same precedence operators (+,-) evaluated left to right" "16-8+4+2" "14"
+
+test_hist_expr "Same precedence operators (*,/) evaluated left to right" "4*3/2*2" "12"
+
+test_hist_expr "Multiplication evaluated before addition/subtraction" "4+3*2-2" "8"
+
+test_hist_expr "Division evaluated before addition/subtraction" "4+6/2-2" "5"
+
+# Division by zero returns -1
+test_hist_expr "Handles division by zero" "3/0" "-1"
+
+# err pos for "too many subexpressions" is dependent on where
+# the last subexpression was detected. This can vary depending
+# on how the expression tree was generated.
+check_error "Too many subexpressions" 'hist:keys=common_pid:x=32+^10*3/20-4'
+check_error "Too many subexpressions" 'hist:keys=common_pid:x=^1+2+3+4+5'
+
+check_error "Unary minus not supported in subexpression" 'hist:keys=common_pid:x=-(^1)+2'
+
+check_error "'.sym-offset' modifier not supported in subexpression" \
+    'hist:keys=common_pid:x=1+common_pid^.sym-offset'
+check_error "'.sym-offset' modifier not supported in subexpression" \
+    'hist:keys=common_pid:x=common_pid^.sym-offset-2'
+check_error "'.sym-offset' modifier not supported in subexpression" \
+    'hist:keys=common_pid:x=4/common_pid^.sym-offset*3'
+
+exit 0
-- 
2.33.0.1079.g6e70778dc9-goog

