Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1394850C125
	for <lists+linux-doc@lfdr.de>; Fri, 22 Apr 2022 23:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiDVVe7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 Apr 2022 17:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiDVVe6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Apr 2022 17:34:58 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA702DB5D7
        for <linux-doc@vger.kernel.org>; Fri, 22 Apr 2022 13:34:50 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2f7c5767f0fso2398957b3.4
        for <linux-doc@vger.kernel.org>; Fri, 22 Apr 2022 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Rtw47IYRlPBnpU7mknX4u/YqYH0e3bVGo7t2WYy8DXA=;
        b=Sb8Kz3K/t58l2JJzi+B4Lxo3XiHnuU1E74WGivYnOxRnOb22ZJnVhE2cIqtKjxm82R
         /GikiT9ZntuvuCFqPZb/qxZheCcHD8F3984xKEVo3Sul3rCBVo0uMshADr+WxwvDmVT5
         IEpTMZou0wq4s+xzl1lS9fjtCr4Pi6ZsR9C1lLPrpNakzZm4JWqBIAoI2Nd3WDS7tWMe
         45t6/flhGub6WoQX1GCHGedCSfjBH36HLdOHKArUAQpMxVAlvNq73Bytx0D1IxfIf6Lw
         QQnftDMBxvVKxAsxABLX/hh44x5TPJYy3YoVF8TGxRqZvps4d5NLVcOm8jeMHc3q9GEy
         zhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Rtw47IYRlPBnpU7mknX4u/YqYH0e3bVGo7t2WYy8DXA=;
        b=s4bNte8iw0kvdVXJtLMXII2JCJGPjSSp1F4kdJM+BQ7K3KtVf8kJQ9DomKV24fs7GD
         SG3vgFFYXUKfm5fsG/Z3A6Jz6zV87WjQ0llEZFLYQPwJoWcm+UhHCz0p9Iv5Rag5E12m
         vWENG13/hH4mWdLILbebOEBNa36pNtss06IHXOefz/Akbp6M5BDlJWwRKOlH/oj4Wc2a
         WrgTRb4/01rM2Cgg/q/jkq2iPTFhW7vn5Lra8XyQ2u95q0nqoc6y9NNbxH2jdQfLEtvB
         ojkmsQ3ihFK+6HcuE8mWLpvnt33zMqH28Rm8SnCC64N8dFnuf/3ntjXwK0LPpsX6r+Qm
         po6A==
X-Gm-Message-State: AOAM532BxQWyEHLNC3o47AreS/N1VR/NtdrcbAKtzQ5WGmqoaSciDLoj
        D/1qYNNtnnL3qeq6c5qRJdyQdhE=
X-Google-Smtp-Source: ABdhPJwlSBRysV28yvlV36P0v0XqtGzJPs/Tc1k0sOxUu8wSpi6y4pyJeaZ37iwjbSQKdIuoGqf4+HM=
X-Received: from pcc-desktop.svl.corp.google.com ([2620:15c:2ce:200:b874:60b4:62b:9c7a])
 (user=pcc job=sendgmr) by 2002:a25:b8c5:0:b0:645:77c5:f35b with SMTP id
 g5-20020a25b8c5000000b0064577c5f35bmr6507595ybm.11.1650659360111; Fri, 22 Apr
 2022 13:29:20 -0700 (PDT)
Date:   Fri, 22 Apr 2022 13:29:12 -0700
Message-Id: <20220422202912.292039-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v2] arm64: document the boot requirements for MTE
From:   Peter Collingbourne <pcc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Brown <broonie@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When booting the kernel we access system registers such as GCR_EL1
if MTE is supported. These accesses are defined to trap to EL3 if
SCR_EL3.ATA is disabled. Furthermore, tag accesses will not behave
as expected if SCR_EL3.ATA is not set, or if HCR_EL2.ATA is not set
and we were booted at EL1. Therefore, require that these bits are
enabled when appropriate.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Link: https://linux-review.googlesource.com/id/Iadcfd4dcd9ba3279b2813970b44d7485b0116709
---
v2:
- only required with FEAT_MTE2

 Documentation/arm64/booting.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arm64/booting.rst b/Documentation/arm64/booting.rst
index 29884b261aa9..8aefa1001ae5 100644
--- a/Documentation/arm64/booting.rst
+++ b/Documentation/arm64/booting.rst
@@ -350,6 +350,16 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SMCR_EL2.FA64 (bit 31) must be initialised to 0b1.
 
+  For CPUs with the Memory Tagging Extension feature (FEAT_MTE2):
+
+  - If EL3 is present:
+
+    - SCR_EL3.ATA (bit 26) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCR_EL2.ATA (bit 56) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

