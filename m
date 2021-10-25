Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F23E43A3E2
	for <lists+linux-doc@lfdr.de>; Mon, 25 Oct 2021 22:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237843AbhJYUHO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Oct 2021 16:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbhJYUFc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 16:05:32 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294F5C036D6E
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 12:26:04 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id o15-20020a0cc38f000000b0038455e36f89so11676020qvi.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=kE3Nv1lKwT793xJwq+iC3RoCHqpYdQS3Tip3semgyOw=;
        b=gbn9eg9008NdXKZ1/pxplWbq1W+HOEpi3W3HkUpPW4ebJu/REMlQr1QF8rl6mQIeob
         euAGzvS+dOzo0OLG8Dvw/ls/OC6sl5N7rY/bFIaEZ6MMC/DFS3XjRDLrySKoPcl0Onwf
         TR3XD9K2yr65MzjufGS4Maq/H7ORSIxQQeGN/v+vTFrEH7F7Uo1xD6t4IqUj10V2a6GA
         RwWq00Ic7WNkanKG1SVkDRvdAP398xy1awfqdfjX+8zrnFqsgafTBYlGR+ZD+rxq8olq
         Qlsg3CtIduhiPG9cLfEDQ56Rujasnsz4EppRxtlTl7M8mxnvBNOn73lnj4mIxM1QQ5/s
         TgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=kE3Nv1lKwT793xJwq+iC3RoCHqpYdQS3Tip3semgyOw=;
        b=1nbbaAn8Qp7ogypa61V6IUIoLe3rvLe6/gql9yiDiQUm6btN5iO4UU4vlmqr0NNChn
         6CuvswiJEY6/4aV6PtLVirUb5mcxvt2jGn7/BdrN0VaWXSPDSNes97KKvbl3fz7aSDGF
         UJUXLkOYkMF1GzYMolUsQDNeoKA+lrxdxmZd/I32NQovE+06M1A/RxPkXTryrDm5gQwV
         wClGLPwIw9wiOf3WlDHhTXhUfRgJzgojRtn6m4FUtaMxymhhGexk11KPG3scyaw1Z36J
         L/QuWzEUZtkbs+6ti9c3thC8U5DtkvclxdKOk4ud26YrBoMFog+VS6beqx53RJyjUn1Z
         ZNhQ==
X-Gm-Message-State: AOAM530cLvklsLizxNPqetcgNSO1QdI/1EScYq9IUjzkVf1AD7wbPeMf
        B/D25guIlYWeKotIBZfdgRnXvJm8FGFUEKNbTw==
X-Google-Smtp-Source: ABdhPJz0CM9pT2MDiX5onT9xQHkFssm++CsGBJiIKiL0pdTsJ/7A8JCL2uHFhTnN92yeJZ01BIcWoG5+gyc3y2cP1Q==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:b783:5702:523e:d435])
 (user=kaleshsingh job=sendgmr) by 2002:a05:622a:1a0b:: with SMTP id
 f11mr19780649qtb.133.1635189963298; Mon, 25 Oct 2021 12:26:03 -0700 (PDT)
Date:   Mon, 25 Oct 2021 12:23:19 -0700
In-Reply-To: <20211025192330.2992076-1-kaleshsingh@google.com>
Message-Id: <20211025192330.2992076-9-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211025192330.2992076-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v3 8/8] tracing/histogram: Document expression arithmetic and constants
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

Histogram expressions now support division, and multiplication in
addition to the already supported subtraction and addition operators.

Numeric constants can also be used in a hist trigger expressions
or assigned to a variable and used by refernce in an expression.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
---

Changes in v2:
  - Add Namhyung's Reviewed-by

 Documentation/trace/histogram.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 533415644c54..e12699abaee8 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1763,6 +1763,20 @@ using the same key and variable from yet another event::
 
   # echo 'hist:key=pid:wakeupswitch_lat=$wakeup_lat+$switchtime_lat ...' >> event3/trigger
 
+Expressions support the use of addition, subtraction, multiplication and
+division operators (+-*/).
+
+Note that division by zero always returns -1.
+
+Numeric constants can also be used directly in an expression::
+
+  # echo 'hist:keys=next_pid:timestamp_secs=common_timestamp/1000000 ...' >> event/trigger
+
+or assigned to a variable and referenced in a subsequent expression::
+
+  # echo 'hist:keys=next_pid:us_per_sec=1000000 ...' >> event/trigger
+  # echo 'hist:keys=next_pid:timestamp_secs=common_timestamp/$us_per_sec ...' >> event/trigger
+
 2.2.2 Synthetic Events
 ----------------------
 
-- 
2.33.0.1079.g6e70778dc9-goog

