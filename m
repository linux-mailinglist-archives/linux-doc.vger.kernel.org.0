Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD9271631D
	for <lists+linux-doc@lfdr.de>; Tue, 30 May 2023 16:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbjE3OGp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 May 2023 10:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjE3OFI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:08 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7D6F7
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nyj2l8PY3qAzzBlei2fGIlbkY3GLY8pUVEJtHA0LwRE=; b=W7nmtbT408cEZTFXKzvM8r4hhL
        u0ofMJxHijW1UPdwrPW2t9bCDCfpownf0sr8OcasGxJdNzSELGxkMbB+UzjHr7rwnxdPViDUgsK/H
        Dh+WI8BEHEzhlX0+3EFo33Aj2AZCJlblF9m6NYDHAO7N/FEaNCYnTUMaoasejEk1krgqqB/uCGaKJ
        /azzEDxtBoK6UVfjBXa1433K4ISkBy/A2xJN/BCkFCWI1BQtCxOQAPbqatZweAmWRFZL3BCK9DipL
        aCp+jngwUFmj8FCPywcAV/ieTo20SJCbJI1bt0RLf0Ntvgxu1Xl3P3SLtqU/FX2E7LZTZfi6wCEhE
        Eom/9Ppw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59742 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zy9-0002qw-GV; Tue, 30 May 2023 15:05:01 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zy8-00A5KY-SD; Tue, 30 May 2023 15:05:00 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 06/17] arm64: text replication: add sanity checks
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zy8-00A5KY-SD@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:00 +0100
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel text and modules must be in separate L0 page table entries.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 3a8d37c9abc4..901f159c65e6 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -3,6 +3,27 @@
  * Copyright (C) 2022, Oracle and/or its affiliates.
  */
 
+#include <linux/kernel.h>
+#include <linux/pgtable.h>
+
+#include <asm/ktext.h>
+#include <asm/memory.h>
+
 void __init ktext_replication_init(void)
 {
+	int kidx = pgd_index((phys_addr_t)KERNEL_START);
+
+	/*
+	 * If we've messed up and the kernel shares a L0 entry with the
+	 * module or vmalloc area, then don't even attempt to use text
+	 * replication.
+	 */
+	if (pgd_index(MODULES_VADDR) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as modules - text replication disabled\n");
+		return;
+	}
+	if (pgd_index(VMALLOC_START) == kidx) {
+		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
+		return;
+	}
 }
-- 
2.30.2

