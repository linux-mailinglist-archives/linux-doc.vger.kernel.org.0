Return-Path: <linux-doc+bounces-2166-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D97E8A08
	for <lists+linux-doc@lfdr.de>; Sat, 11 Nov 2023 10:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33806281209
	for <lists+linux-doc@lfdr.de>; Sat, 11 Nov 2023 09:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01655125A7;
	Sat, 11 Nov 2023 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W87PTl0i"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1D125A6
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 09:22:59 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91503AA6;
	Sat, 11 Nov 2023 01:22:56 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9e62f903e88so208267666b.2;
        Sat, 11 Nov 2023 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699694575; x=1700299375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf1eecC3Yo7gOC7YXtpAGe0WJRP6o6FR9hdwtJ02C9s=;
        b=W87PTl0iq594q1PHel9X6InVGdMqFOPoAf6TxyjOeW2Ly1jQx1THftIe/pOiSkgFKu
         SLP6iFDnkG3FXOYvt8yAZSGJPaiUHqFL4nenhHY+XZvhlTG9YI38lnqK/LdTJlLyDkOi
         J6T+5NDb0Bo49MBdKkBV7AigoczAzjN0bjvub53wHdUNXYXdb4OlIoX8dqMVS9MDTdza
         X5Wz/bPJET3DUJMGxLuYqGLYL1n0T2azXmSYM9rnhXGsDnVdijuamQWLkup4hJgnc4B7
         cAV+6DyfOx00hEP9LEKs6ZAQeS5FN9IFsCy+tbqjLamocZl4NrxaFoUTwWyJVgTrY0l7
         zrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699694575; x=1700299375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf1eecC3Yo7gOC7YXtpAGe0WJRP6o6FR9hdwtJ02C9s=;
        b=XrJ+ij1beXCpBKJ8AlHiyony6OGBcpIlbltZs9sWxtcXTKT03rzfpopUC/7r5vhOoG
         gx66fUmkmD/FHWJwyZD8Mad8nMF4kAzsaZXjuehy8GL3QfBFpXClLSNR/TMBd9nKNGII
         vdqVgHBBAepqqsEhw+CgO6LrjjPyaPDf0t2t0PtEy+2xvwRelSDdkYAKs2FY4/Xx/m2K
         GbubrSocqfpiXkyt4SunG7U+QxR1q5YC+DJt5dcM2BazUDp7bXiXbacRYXx+Cunk64H2
         6FSe4QHk3em//WK6FNeX1Dy4SnKHfT6o5uCmRtLkqDujimQ3wRCDVzBkc1Ihv15BrE9C
         ZBIw==
X-Gm-Message-State: AOJu0Yzn1LMmdpMNB7+HDLYaU8pRjRwcbUCpyk9F9QwJofhYHUt61F67
	gxzFRE+7Cn8xaWgiBoiI8/A=
X-Google-Smtp-Source: AGHT+IEDC7DeH/pyjS24XiFRf34wIT7xA0ESvF+ILQ6b/JcaSmo/XV7xrxMQDmjA55MQzca81xr7sQ==
X-Received: by 2002:a17:906:3655:b0:9ae:5253:175b with SMTP id r21-20020a170906365500b009ae5253175bmr1053088ejb.34.1699694575052;
        Sat, 11 Nov 2023 01:22:55 -0800 (PST)
Received: from desktop.localdomain ([109.95.114.4])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906358700b009adc77fe164sm767684ejb.66.2023.11.11.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 01:22:54 -0800 (PST)
From: Tadeusz Struk <tstruk@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tadeusz Struk <tstruk@gigaio.com>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stable@kernel.org,
	Tadeusz Struk <tstruk@gmail.com>
Subject: [PATCH] Documentation: PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
Date: Sat, 11 Nov 2023 10:22:39 +0100
Message-ID: <20231111092239.308767-1-tstruk@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

From: Tadeusz Struk <tstruk@gigaio.com>

Update Documentation/driver-api/pci/p2pdma.rst doc to
remove references to the obsolete pci_p2pdma_map_sg() function.

Fixes: 0d06132fc84b ("PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()")
Cc: stable <stable@kernel.org>
Signed-off-by: Tadeusz Struk <tstruk@gigaio.com>
---
 Documentation/driver-api/pci/p2pdma.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
index 44deb52beeb4..9e54ee711b5c 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -83,10 +83,9 @@ this to include other types of resources like doorbells.
 Client Drivers
 --------------
 
-A client driver typically only has to conditionally change its DMA map
-routine to use the mapping function :c:func:`pci_p2pdma_map_sg()` instead
-of the usual :c:func:`dma_map_sg()` function. Memory mapped in this
-way does not need to be unmapped.
+A client driver only has to use the mapping api :c:func:`dma_map_sg()`
+and :c:func:`dma_unmap_sg()` functions, as usual, and the implementation
+will do the right thing for the P2P capable memory.
 
 The client may also, optionally, make use of
 :c:func:`is_pci_p2pdma_page()` to determine when to use the P2P mapping
-- 
2.41.0


