Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87F472D6A5
	for <lists+linux-doc@lfdr.de>; Tue, 13 Jun 2023 02:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjFMA5H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Jun 2023 20:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjFMA5H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 20:57:07 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F2910DF;
        Mon, 12 Jun 2023 17:57:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b038064d97so28240665ad.0;
        Mon, 12 Jun 2023 17:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686617826; x=1689209826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qi4PeOZo2vU+xRAlis1A/+jn+qWPnCcNV2PSkHL+ac=;
        b=ZEn+wta+JFQw2D4LDfM980j37cic0mS9lf/0O7avWvZFm9gXXCzLnxImvKdv5HCFK8
         o51v4WeNDiCXzBtA5ihXd1MRoCKJNGojclcaIZwWd4vofCzxGN5QKGrvJJ2lTR0/TLKZ
         cQWRje7eZrqtVN3pGg4P3+TQfmhVWY5xHJAaDcBCmgfbzAwFb47lUWBNF3shEOSG3qW/
         QJAmw13ujHz9S6sOsRdjQFSjMV6MnFTNAdiT/s70YvtD4PPpGHjhEsewj1CPnbrRNwb8
         T1LWcYbz+ZFHGriWxLUdr9eYBs/J2ryZO2qdT/MVkD1wS0KXoZtdsjV2V2zgL/w/zGW2
         v1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686617826; x=1689209826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qi4PeOZo2vU+xRAlis1A/+jn+qWPnCcNV2PSkHL+ac=;
        b=hilz93ZUlhEvzwpnmOZQnY3mBcbqjQjJcDoAB8+b0bdWsZRIwYvUuYQR4HmhsNV6vu
         E7eRgKA79M0EaHAFlekZV9d/MtXmGF/q5PMaieiaQzr/gpw8t9fEWLx0ginQz5tXqsmu
         FwXvWHt36xXzi6FnJC9u7sWoD4Aqn6Rpz/Gw1ozw1dLvNZ+y2Tne0pAL3uMF+nJGnAQ/
         jBEXZMta+f2S7GQaZPYMnFYAcqHW82Lpyphord6/7cWI76g8YaAjc/765xLlFUncJbIs
         wiA6+pG77lXtTCtBSNK263gs0EoMJL4UZgUkaBRSW9kw50WbuOJeNgdK6yDYJVQttCRu
         UbFw==
X-Gm-Message-State: AC+VfDyvXUCYRB7uq4R+Z17DHOKarU6yywfwcvzliomNq5uApAjoiyo3
        Td7js495nosS59dR+N9Ec6YVqW0oHkpZ+7bZ
X-Google-Smtp-Source: ACHHUZ6D+GQXefFheeozGz95cYQHBHAuK8F1LPEZJgrgpdRY1La5WeeUG6x7iWbaDq9xiD7ZY3tWIw==
X-Received: by 2002:a17:902:e809:b0:1b0:10a1:3da9 with SMTP id u9-20020a170902e80900b001b010a13da9mr8489245plg.32.1686617825916;
        Mon, 12 Jun 2023 17:57:05 -0700 (PDT)
Received: from localhost ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id n6-20020a1709026a8600b001a0448731c2sm8800304plk.47.2023.06.12.17.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:57:05 -0700 (PDT)
From:   Alan Huang <mmpgouride@gmail.com>
To:     paulmck@kernel.org
Cc:     corbet@lwn.net, rcu@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v2] docs/RCU: Add the missing rcu_read_unlock()
Date:   Tue, 13 Jun 2023 00:57:01 +0000
Message-Id: <20230613005701.8728-1-mmpgouride@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We should exit the RCU read-side critical section before re-entering.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 Documentation/RCU/rculist_nulls.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/RCU/rculist_nulls.rst b/Documentation/RCU/rculist_nulls.rst
index 9a734bf54..0612a6387 100644
--- a/Documentation/RCU/rculist_nulls.rst
+++ b/Documentation/RCU/rculist_nulls.rst
@@ -29,8 +29,10 @@ algorithms:
   rcu_read_lock()
   obj = lockless_lookup(key);
   if (obj) {
-    if (!try_get_ref(obj)) // might fail for free objects
+    if (!try_get_ref(obj)) { // might fail for free objects
+      rcu_read_unlock();
       goto begin;
+    }
     /*
     * Because a writer could delete object, and a writer could
     * reuse these object before the RCU grace period, we
-- 
2.34.1

