Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E86A168911
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2020 22:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgBUVMz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 16:12:55 -0500
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:36704 "EHLO
        10.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgBUVMz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 16:12:55 -0500
Received: from player786.ha.ovh.net (unknown [10.108.54.74])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id D9A5011FCD7
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2020 21:57:51 +0100 (CET)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player786.ha.ovh.net (Postfix) with ESMTPSA id 11382FCCF25F;
        Fri, 21 Feb 2020 20:57:42 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] docs: remove MPX from the x86 toc
Date:   Fri, 21 Feb 2020 21:57:33 +0100
Message-Id: <20200221205733.26351-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4922152920520740229
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggddugeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

MPX was removed in commit 45fc24e89b7c ("x86/mpx: remove MPX from
arch/x86"), this removes the corresponding entry in the x86 toc.

This was suggested by a Sphinx warning.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/x86/index.rst | 1 -
 1 file changed, 1 deletion(-)

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

base-commit: ca7e1fd1026c5af6a533b4b5447e1d2f153e28f2
-- 
2.24.1

