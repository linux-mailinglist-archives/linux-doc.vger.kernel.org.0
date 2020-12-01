Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FC52CA23D
	for <lists+linux-doc@lfdr.de>; Tue,  1 Dec 2020 13:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730840AbgLAMKi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Dec 2020 07:10:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:40514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730748AbgLAMKh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Dec 2020 07:10:37 -0500
Received: from mail.kernel.org (ip5f5ad5d9.dynamic.kabel-deutschland.de [95.90.213.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F7D120870;
        Tue,  1 Dec 2020 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606824555;
        bh=MWzs6YxgYg7fROFNR9vsW67We3XIPoCkbHknC2xLTnA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CDIXQw/OHgdzxnjC+R9IFrkWSFXUCVXSpwwbSPL4jsd2PIwSJjENwvPeMloRadqco
         FJ1HdlgZAnENhiKt0f/aPEBywhgmev9/HIY09bpc98wADsfU/kQVNLatLe38ImDtBi
         m/6BsNgOD2otZD0nPIxLNA412CmyYQkWrSB+JGvs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kk4T3-00DGdF-50; Tue, 01 Dec 2020 13:09:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/16] lib/crc7: fix a kernel-doc markup
Date:   Tue,  1 Dec 2020 13:09:03 +0100
Message-Id: <550250d6cf968fb3dbc5da1dd36615c73493384b.1606823973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606823973.git.mchehab+huawei@kernel.org>
References: <cover.1606823973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A function has a different name between their prototype
and its kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 lib/crc7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crc7.c b/lib/crc7.c
index 6a848d73e804..3848e313b722 100644
--- a/lib/crc7.c
+++ b/lib/crc7.c
@@ -22,53 +22,53 @@ const u8 crc7_be_syndrome_table[256] = {
 	0x64, 0x76, 0x40, 0x52, 0x2c, 0x3e, 0x08, 0x1a,
 	0xf4, 0xe6, 0xd0, 0xc2, 0xbc, 0xae, 0x98, 0x8a,
 	0x56, 0x44, 0x72, 0x60, 0x1e, 0x0c, 0x3a, 0x28,
 	0xc6, 0xd4, 0xe2, 0xf0, 0x8e, 0x9c, 0xaa, 0xb8,
 	0xc8, 0xda, 0xec, 0xfe, 0x80, 0x92, 0xa4, 0xb6,
 	0x58, 0x4a, 0x7c, 0x6e, 0x10, 0x02, 0x34, 0x26,
 	0xfa, 0xe8, 0xde, 0xcc, 0xb2, 0xa0, 0x96, 0x84,
 	0x6a, 0x78, 0x4e, 0x5c, 0x22, 0x30, 0x06, 0x14,
 	0xac, 0xbe, 0x88, 0x9a, 0xe4, 0xf6, 0xc0, 0xd2,
 	0x3c, 0x2e, 0x18, 0x0a, 0x74, 0x66, 0x50, 0x42,
 	0x9e, 0x8c, 0xba, 0xa8, 0xd6, 0xc4, 0xf2, 0xe0,
 	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x70,
 	0x82, 0x90, 0xa6, 0xb4, 0xca, 0xd8, 0xee, 0xfc,
 	0x12, 0x00, 0x36, 0x24, 0x5a, 0x48, 0x7e, 0x6c,
 	0xb0, 0xa2, 0x94, 0x86, 0xf8, 0xea, 0xdc, 0xce,
 	0x20, 0x32, 0x04, 0x16, 0x68, 0x7a, 0x4c, 0x5e,
 	0xe6, 0xf4, 0xc2, 0xd0, 0xae, 0xbc, 0x8a, 0x98,
 	0x76, 0x64, 0x52, 0x40, 0x3e, 0x2c, 0x1a, 0x08,
 	0xd4, 0xc6, 0xf0, 0xe2, 0x9c, 0x8e, 0xb8, 0xaa,
 	0x44, 0x56, 0x60, 0x72, 0x0c, 0x1e, 0x28, 0x3a,
 	0x4a, 0x58, 0x6e, 0x7c, 0x02, 0x10, 0x26, 0x34,
 	0xda, 0xc8, 0xfe, 0xec, 0x92, 0x80, 0xb6, 0xa4,
 	0x78, 0x6a, 0x5c, 0x4e, 0x30, 0x22, 0x14, 0x06,
 	0xe8, 0xfa, 0xcc, 0xde, 0xa0, 0xb2, 0x84, 0x96,
 	0x2e, 0x3c, 0x0a, 0x18, 0x66, 0x74, 0x42, 0x50,
 	0xbe, 0xac, 0x9a, 0x88, 0xf6, 0xe4, 0xd2, 0xc0,
 	0x1c, 0x0e, 0x38, 0x2a, 0x54, 0x46, 0x70, 0x62,
 	0x8c, 0x9e, 0xa8, 0xba, 0xc4, 0xd6, 0xe0, 0xf2
 };
 EXPORT_SYMBOL(crc7_be_syndrome_table);
 
 /**
- * crc7 - update the CRC7 for the data buffer
+ * crc7_be - update the CRC7 for the data buffer
  * @crc:     previous CRC7 value
  * @buffer:  data pointer
  * @len:     number of bytes in the buffer
  * Context: any
  *
  * Returns the updated CRC7 value.
  * The CRC7 is left-aligned in the byte (the lsbit is always 0), as that
  * makes the computation easier, and all callers want it in that form.
  *
  */
 u8 crc7_be(u8 crc, const u8 *buffer, size_t len)
 {
 	while (len--)
 		crc = crc7_be_byte(crc, *buffer++);
 	return crc;
 }
 EXPORT_SYMBOL(crc7_be);
 
 MODULE_DESCRIPTION("CRC7 calculations");
 MODULE_LICENSE("GPL");
-- 
2.28.0

