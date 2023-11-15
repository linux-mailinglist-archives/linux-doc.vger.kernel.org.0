Return-Path: <linux-doc+bounces-2254-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C257EA283
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 19:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B218280E79
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 18:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22ABC22337;
	Mon, 13 Nov 2023 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACbHE/IG"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251A22303
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 18:04:00 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20944F7;
	Mon, 13 Nov 2023 10:03:56 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507adc3381cso6284988e87.3;
        Mon, 13 Nov 2023 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699898634; x=1700503434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O0q/lzuG/y6HTyakaCBvtK6ZK/WSABJjsotgMFppjk=;
        b=ACbHE/IGA3UTuZilHmpQDpV3QTnfeJwgumcLo+9/v6XtofQql7PJKH4ORIhIMFRQlg
         EuyoPr4I61FKWbPAe8Rs4ySlQawcHubk0gAlrirf+x/GG20snMxYAegcQwlaXAq8wl4W
         8noo3xBdO3Sfrf8/QGCJSL/6BaBeMDTKWTJT6Dhu3lBS43AMZcLI/1KY+zgFCX11ubFk
         2bcunBhxHpp5uSbFZPYAr7+/X+hj6oH9H8vJatp/WK6SFIPjP7v0CDGsp4Zx/GEVRe7P
         NoN90tUEmsY7K4BamfTsoTxXGw7vxfxiV9ttvHEt0nw/JxHh70oKG/LPXi7JdpPNkcfD
         4ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699898634; x=1700503434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O0q/lzuG/y6HTyakaCBvtK6ZK/WSABJjsotgMFppjk=;
        b=IIN4m+bvceJGAL4zfiToDPlA99F0MaRzV299KRQ4LoZPKDo2IMrjGHHqQhIMwW+1am
         NB3Fnp5dDZ/WQhiCdsUXaepBcmK7/8VQyPKPrqm7rCmPLCt22ssLO0c77EjctXupouj1
         +tOd9lVFB/fvSz/VzdGFA0DzT1Sk3/eMwciEfLNAhGOlmSjK4sZs7MBndyn3y5TPJgJN
         V94XqMVnoTsB1Q687m+DBhYul+LPkqGOZsJTmhn2CQraSene6BOf2Jk+jGRJxsCpKvOf
         cTgBm6DglnuPpvRuRqkFqa2LRj/WmEWU8WSgcm3USh+YRabYEZJShVfaJt8S8waOTzfo
         OyaA==
X-Gm-Message-State: AOJu0Yzdp0te5EBFTiwM/l9q/ya2KagGUHs4L0MetfKqxPeycBDc7VHy
	+hGLDBlawDnCAlH3rrFzFIRo+VN+1/RZ8Q==
X-Google-Smtp-Source: AGHT+IFvxHvtwQFnCbx89TySZ5USbYzzV8ToIEUPQcEA4JAAEGrkRqMEgQWbXpqPN1Gnl9/L56l/mA==
X-Received: by 2002:a05:6512:3d02:b0:509:31e6:1de5 with SMTP id d2-20020a0565123d0200b0050931e61de5mr6654349lfv.47.1699898634002;
        Mon, 13 Nov 2023 10:03:54 -0800 (PST)
Received: from desktop.localdomain ([109.95.114.4])
        by smtp.gmail.com with ESMTPSA id ko14-20020a170907986e00b009dd701bb916sm4329966ejc.213.2023.11.13.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:03:53 -0800 (PST)
From: Tadeusz Struk <tstruk@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tadeusz Struk <tstruk@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stable@kernel.org,
	Tadeusz Struk <tstruk@gigaio.com>
Subject: [PATCH v2] Documentation: PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
Date: Mon, 13 Nov 2023 19:03:25 +0100
Message-ID: <20231113180325.444692-1-tstruk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <6eb84bc5-dd58-4745-8e99-ccc97c10fb63@deltatee.com>
References: <6eb84bc5-dd58-4745-8e99-ccc97c10fb63@deltatee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

From: Tadeusz Struk <tstruk@gigaio.com>

Update Documentation/driver-api/pci/p2pdma.rst doc and
remove references to obsolete p2pdma mapping functions.

Fixes: 0d06132fc84b ("PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()")
Cc: stable <stable@kernel.org>
Signed-off-by: Tadeusz Struk <tstruk@gigaio.com>
----

v2: Dropped a section that talks about using is_pci_p2pdma_page()
    function by the client. Suggested by Logan.
---
 Documentation/driver-api/pci/p2pdma.rst | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
index 44deb52beeb4..44efed79d908 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -83,19 +83,9 @@ this to include other types of resources like doorbells.
 Client Drivers
 --------------
 
-A client driver typically only has to conditionally change its DMA map
-routine to use the mapping function :c:func:`pci_p2pdma_map_sg()` instead
-of the usual :c:func:`dma_map_sg()` function. Memory mapped in this
-way does not need to be unmapped.
-
-The client may also, optionally, make use of
-:c:func:`is_pci_p2pdma_page()` to determine when to use the P2P mapping
-functions and when to use the regular mapping functions. In some
-situations, it may be more appropriate to use a flag to indicate a
-given request is P2P memory and map appropriately. It is important to
-ensure that struct pages that back P2P memory stay out of code that
-does not have support for them as other code may treat the pages as
-regular memory which may not be appropriate.
+A client driver only has to use the mapping API :c:func:`dma_map_sg()`
+and :c:func:`dma_unmap_sg()` functions, as usual, and the implementaion
+will do the right thing for the P2P capable memory.
 
 
 Orchestrator Drivers
-- 
2.41.0


