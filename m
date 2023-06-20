Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2B5736631
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jun 2023 10:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjFTI33 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jun 2023 04:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjFTI3S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 04:29:18 -0400
Received: from xry111.site (xry111.site [89.208.246.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A7619B
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
        s=default; t=1687249754;
        bh=ws2mVaKpjnU8ybLqDA7SxP6lWwW5L1Aqe3T5RaUjTYQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Z6JSPufcZ6m8j/Fd9aDDBU0tesdF6Mm7fT44oxzhQLpCljPsXLXxknbKyN7Bw0IdO
         77YqNlOrewxG+vhAHEVEEEBIPPGUNgxDy4X6WO9hD0wV755EAllpPnJB+0qR29/3Ko
         I/l1XgCQSbyUvE2MCPBFG6UeXgMN67BAKqkzYYBs=
Received: from stargazer.. (unknown [113.140.11.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@xry111.site)
        by xry111.site (Postfix) with ESMTPSA id 6BA9B66426;
        Tue, 20 Jun 2023 04:29:12 -0400 (EDT)
From:   Xi Ruoyao <xry111@xry111.site>
To:     Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] Documentation/features: LoongArch supports ARCH_HAS_ELF_RANDOMIZE
Date:   Tue, 20 Jun 2023 16:28:37 +0800
Message-ID: <20230620082837.10006-1-xry111@xry111.site>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LoongArch selects ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, and the latter
selects ARCH_HAS_ELF_RANDOMIZE.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
index 15164f36f224..21f3bbef5ef0 100644
--- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
+++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
@@ -13,7 +13,7 @@
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
-- 
2.41.0

