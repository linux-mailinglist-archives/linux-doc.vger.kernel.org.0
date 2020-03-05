Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D8217A742
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2020 15:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgCEOVX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Mar 2020 09:21:23 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:55683 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgCEOVX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Mar 2020 09:21:23 -0500
Received: by mail-wr1-f73.google.com with SMTP id m18so2335925wro.22
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2020 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KkLXOOSG3EccFvXnveAsAjlCd4Cuj/e0jkzvyAbgB9g=;
        b=JAEu655oVlP803DUPmFEFcJtMF7GKi5Pm8Xu3AvJKPaTPuv327j4Lf+gB68JWk4HMl
         B3hwPYZscDeQERssWDU8vSj7Q9yHTc7PBHYpnN8pIMbugNaNo/HqWTbRXUQYGjw3gs6g
         RHuaQWMJJQ4oLChBSxN5avIbljDKL5a4v+ac/QVRlPkHN9DznJq0WUGnxpWzHQjEEfq4
         GRED7ydakxpgmyx+Guvg5RiiRbKa74Xh5waQXMTwloEFhoUz+QL0AhgXCJLoyYq89Pef
         HkIm0IK+TKicJOqAxd/y/P+3dVaYAuoUMcPnzahdAwY9fvhkfmzpYXuEpxdLzw8l5bwm
         qCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KkLXOOSG3EccFvXnveAsAjlCd4Cuj/e0jkzvyAbgB9g=;
        b=GQtUo/cbCxkk+IImSUP6c1GcNN+emVsNhBaGUEMDCY3nqYiP3XrZYGU4OWYYZfiHKb
         AElVMWRYyEiofzUwJz9EKtnQ05Q83ubmPTYqo24NHrYutkUFKxRN97mxbP0zHbfIWBzm
         cOD024f4Dw9zMXJKsuqg1UoyxO5ijULhlRUMgY694hl81vshypMwiTFOTWkAF8PhPCQ6
         +BB8VmIjl+D7YEZr+54n5sCwhny7ECnC7Evp49s80uV7kRIM8VFqNUI0I+l/v8O9ZA+8
         zWblTnJVUl3oEMpzMnD4SQTJooXWC9m7esKQtNfOf+XmyLrSTAqN74o+fhcFJNFe3Jtm
         BKxg==
X-Gm-Message-State: ANhLgQ1Dr+qqbfVRKXsQhzVEPh5/QLowZgjN5rHUPqqMvTUsP1IxbfYy
        TsPG9w2cTanJRUhc1PDq5vq0hxwKWA==
X-Google-Smtp-Source: ADFU+vsojjuV2Y3WrRp0OMv8B+DtoxHhJ5q8hgHCEutNmwosAt9lgZxbEoh1Igdb87PKMCkR88PhAWtEjA==
X-Received: by 2002:adf:e742:: with SMTP id c2mr10459658wrn.262.1583418079894;
 Thu, 05 Mar 2020 06:21:19 -0800 (PST)
Date:   Thu,  5 Mar 2020 15:21:07 +0100
Message-Id: <20200305142109.50945-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 1/3] kcsan: Fix a typo in a comment
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     paulmck@kernel.org, andreyknvl@google.com, glider@google.com,
        dvyukov@google.com, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Qiujun Huang <hqjagain@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Qiujun Huang <hqjagain@gmail.com>

s/slots slots/slots/

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
[elver: commit message]
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index eb30ecdc8c009..ee8200835b607 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -45,7 +45,7 @@ static DEFINE_PER_CPU(struct kcsan_ctx, kcsan_cpu_ctx) = {
 };
 
 /*
- * Helper macros to index into adjacent slots slots, starting from address slot
+ * Helper macros to index into adjacent slots, starting from address slot
  * itself, followed by the right and left slots.
  *
  * The purpose is 2-fold:
-- 
2.25.0.265.gbab2e86ba0-goog

