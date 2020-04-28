Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01FE1BBFB2
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2020 15:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgD1NiC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Apr 2020 09:38:02 -0400
Received: from smtp.asem.it ([151.1.184.197]:60277 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726846AbgD1NiC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Apr 2020 09:38:02 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Apr 2020 09:38:01 EDT
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000224851.MSG 
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2020 15:32:56 +0200S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=s1024; d=asem.it;
    h=from:to:cc:subject:date:message-id:mime-version:content-type;
    bh=28fmM/Mc4puUfyAGMkuNbmm1IJ99YCUvvMXvlxEraDA=;
    b=rf6A7revh95uWhta10EFGqUBJ/fY2gkSSVKVxyjhVu5gV7jp/MnTl2u1VpjdW7
      o0EVmLG5g2NXHgncMjZG2C4NeCqKvKDI+cE7ZGoxh1Vqr00uCOTzV7+25GoaJD
      RxB+9QqubQfIhXRct9fYrFJaCDaParJYldyY5PNjvKbW7Mo=
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 28
 Apr 2020 15:32:55 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
 Transport; Tue, 28 Apr 2020 15:32:55 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Changbin Du <changbin.du@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] Documentation: x86: fix space instead of tab in uefi doc
Date:   Tue, 28 Apr 2020 15:32:25 +0200
Message-ID: <1588080745-21999-1-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A09020E.5EA83088.0010,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/x86/x86_64/uefi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/x86/x86_64/uefi.rst b/Documentation/x86/x86_64/uefi.rst
index 88c3ba3..3b89410 100644
--- a/Documentation/x86/x86_64/uefi.rst
+++ b/Documentation/x86/x86_64/uefi.rst
@@ -36,7 +36,7 @@ Mechanics
 
 	elilo bootloader with x86_64 support, elilo configuration file,
 	kernel image built in first step and corresponding
-	initrd. Instructions on building elilo	and its dependencies
+	initrd. Instructions on building elilo and its dependencies
 	can be found in the elilo sourceforge project.
 
 - Boot to EFI shell and invoke elilo choosing the kernel image built
-- 
2.7.4

