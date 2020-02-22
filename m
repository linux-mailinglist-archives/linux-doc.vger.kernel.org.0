Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E47168DCC
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2020 10:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgBVJAQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Feb 2020 04:00:16 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60486 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgBVJAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Feb 2020 04:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=0gU+Ww+lXyNnbCfovazHo/QlVd1+/Lpel2osANT7sOc=; b=indTi53XWNQFszSF7G9eNjgnOv
        KJMFNOLCOT+35EXCHrvhZy3y2Un7JkrShSGvhVnt9aDeSdN6kzfe56S1xrPpREUoE7tkT3KwYpvN3
        Hqx3LtRw+39RJDtA5AMxOYxxqMt38A38oCSyh7OZsiaof2qg8QA1wTxEShO7Z3+nH1RqUAQ1lykiF
        y1GtgLeJwe9RS9PJ+eeLwLY9VBDpssi0oZjNemjLbVHXEmH/JDKbTJt39au5gQZtTkNNW0DGJQTIU
        /+JODLPSbtp3oRbJdudeTP+ORlFRci3azh8dnyeoUqOz44mcYksjQtlntMvrOdukq5T+QoYOy5Q4h
        iivr3VDQ==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5Qdz-0007Hs-Bk; Sat, 22 Feb 2020 09:00:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j5Qdx-001N4b-MI; Sat, 22 Feb 2020 10:00:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 6/7] docs: remove nompx kernel parameter and intel_mpx from index.rst
Date:   Sat, 22 Feb 2020 10:00:06 +0100
Message-Id: <934144ad8199db837c3b21479e6966c597706dab.1582361738.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Intel MPX support was removed by changeset
45fc24e89b7c ("x86/mpx: remove MPX from arch/x86").
Remove the corresponding parameter that were mentioning
a removed document, plus its entry at x86/index.rst.

Fixes: 45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ----
 Documentation/x86/index.rst                     | 1 -
 2 files changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e0fe9f70d22b..50a0cd2726e6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -987,10 +987,6 @@
 			Documentation/admin-guide/dynamic-debug-howto.rst
 			for details.
 
-	nompx		[X86] Disables Intel Memory Protection Extensions.
-			See Documentation/x86/intel_mpx.rst for more
-			information about the feature.
-
 	nopku		[X86] Disable Memory Protection Keys CPU feature found
 			in some Intel CPUs.
 
diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index a8de2fbc1caa..265d9e9a093b 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -19,7 +19,6 @@ x86-specific Documentation
    tlb
    mtrr
    pat
-   intel_mpx
    intel-iommu
    intel_txt
    amd-memory-encryption
-- 
2.24.1

