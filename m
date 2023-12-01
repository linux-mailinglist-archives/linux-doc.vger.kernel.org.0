Return-Path: <linux-doc+bounces-3758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DC800B77
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 14:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9DA51C20AAB
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234691C6B3;
	Fri,  1 Dec 2023 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gpz4Lq9m"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F7B10E2;
	Fri,  1 Dec 2023 05:10:58 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E5B1C0009;
	Fri,  1 Dec 2023 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701436257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6S+SeJyJSSx13s7SoQDTcyNB66xoOdwpxFSTRy/oEw=;
	b=gpz4Lq9mexHB7eDRII3Y6WaRbFaseHxKbbMWZeG4Ek0q2zRg6Mk4FdfLHoYKRsUCOKWgAU
	t6xERSduhW/g+qqZ/3nXnD1D+xuR3U7WzB6YiNjvywwbCIst5FeL4HQSpNQXGY9LFzGJxW
	eCPG9RunxECaIXDQtuh9VsJrPcGMpeBy/7QRfcFkiHjS33yAehHj8KDz6w/JN3/sr9voPl
	eWjQJdKaLq0f+DWJV2SeH8ym9uGywwYjapDKboD3N7T7IDj3GisHKgrPqEl1fHh5WZo8RJ
	L7NkjbPMyz18yXH7Dte2uGJAZfaVoZJpkMj69I9fjk/f/3BvKPhWec2+9EzXPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 01 Dec 2023 14:10:43 +0100
Subject: [PATCH 2/2] docs: nvmem: remove function parameters (fixes
 hyperlink generation)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-nvmem-docs-kerneldoc-v1-2-3e8f2b706ce6@bootlin.com>
References: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
In-Reply-To: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: luca.ceresoli@bootlin.com

Adding a parameter is not particularly useful here, and it is definitely
not done elsewhere. It also prevents the generation of a hyperlink to the
kernel-doc documentation. Removing the parameter to enable hyperlinks and
make the style coherent.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/driver-api/nvmem.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/nvmem.rst b/Documentation/driver-api/nvmem.rst
index d5655b95c0f4..5d9500d21ecc 100644
--- a/Documentation/driver-api/nvmem.rst
+++ b/Documentation/driver-api/nvmem.rst
@@ -41,7 +41,7 @@ A NVMEM provider can register with NVMEM core by supplying relevant
 nvmem configuration to nvmem_register(), on success core would return a valid
 nvmem_device pointer.
 
-nvmem_unregister(nvmem) is used to unregister a previously registered provider.
+nvmem_unregister() is used to unregister a previously registered provider.
 
 For example, a simple nvram case::
 

-- 
2.34.1


