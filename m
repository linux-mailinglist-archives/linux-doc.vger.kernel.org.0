Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 915A3D03D3
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2019 01:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfJHXIb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Oct 2019 19:08:31 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41252 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfJHXIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Oct 2019 19:08:31 -0400
Received: by mail-io1-f68.google.com with SMTP id n26so704564ioj.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2019 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:message-id:user-agent:mime-version;
        bh=t3QL86pnLLp7H0YYwH/FdnAoL7Vq3h3qOuyHpBMWRk0=;
        b=b7/9uQ66uupBgYsVJw0ZQPL+EeFq27QaSUNsKPah4m0OvuJROtA65r5jxaJDF6YnlX
         iab1ki5mx3Sz+PRjV2NBtM3e0agwYbL0MUmyzBc+FrmvdBPAMPnrn7DQl2TsOa4ilXBB
         TPlk8zNqG+fZTqi2FBhsRM5PJ+QDfRKHaC7s3/fft/hXNXzQDOuuFjutP5SgSKQErlFi
         lXfOIHBDmRgk54rWLXvHgOQ4ihDsxsCN7V6ytatzlbO6/BbM75VTkSAwd2qMSEv8mEyo
         u8Rs20zqVaO+JNiGR3XyoVsxl3YHYkxOOTD7H7SgKxtQrdfsLWAIntkXUsKP4qOvUtEZ
         L+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=t3QL86pnLLp7H0YYwH/FdnAoL7Vq3h3qOuyHpBMWRk0=;
        b=ID6YmmVH+UlTkbyXShO7RTgOLFMtA6+GplqsJ0VAqTucMXNbEY3dgrWj1Z5Pmqgs8P
         JGUThe5YsyE3hOZHzS6j2RFufvVMfBglyttwkkVqM3n1S+ieVv7tFsxFcD76hrpogsKQ
         BGzqs0EvdR+VTgzXND0yi0MnHzKWt9an2JllINXuCYBFCEFo5jMraQNIzGSHoov4k+5e
         tpuu0jeFk4d+puSAetb2dWIs/T0enWn1u5wWE5vNfmE96T8pz5+UTXrJc/fiMQAEg+sr
         Hgp4CBcz2uAIawZonMP9iJpWGdAAg8LLLRWbYwqnt3CqStnxaIrTM0S378i9YKn8um8R
         29gg==
X-Gm-Message-State: APjAAAX6wwDHmTgQ5NhORxPcGInPmmCYbIOZXFy528u+AMCZvKvKphAm
        WTTyjdJEDc3xzkzJ48/T2pzBVA==
X-Google-Smtp-Source: APXvYqw9T/3Qa+z2vFNUc/+LzFnPBHh8p1vHwRgtUolzXIAAClxQUyxSFD7Sse4Dm7TGhqZE04GXvA==
X-Received: by 2002:a92:8fc6:: with SMTP id r67mr121939ilk.25.1570576110234;
        Tue, 08 Oct 2019 16:08:30 -0700 (PDT)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id d26sm195329ioc.16.2019.10.08.16.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:08:29 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:08:27 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     corbet@lwn.net
cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, schwab@suse.de, hch@lst.de
Subject: [PATCH] Documentation: admin-guide: add earlycon documentation for
 the sifive serial driver
Message-ID: <alpine.DEB.2.21.9999.1910081606370.11044@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Document earlycon usage for the SiFive serial port driver in the same
fashion as for the other serial port IP blocks, since the SiFive
serial port driver supports it.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Reported-by: Andreas Schwab <schwab@suse.de>
Cc: Christoph Hellwig <hch@lst.de>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c7ac2f3ac99f..90becb00221b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1106,6 +1106,12 @@
 			address must be provided, and the serial port must
 			already be setup and configured.
 
+		sifive,<addr>
+			Start an early, polled-mode console on a SiFive
+			serial port at the specified address.  The port must
+			already be setup and configured.  Options are not
+			yet supported.
+
 	earlyprintk=	[X86,SH,ARM,M68k,S390]
 			earlyprintk=vga
 			earlyprintk=sclp
-- 
2.23.0

