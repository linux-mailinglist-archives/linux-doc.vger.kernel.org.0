Return-Path: <linux-doc+bounces-15739-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B678BB2F3
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 20:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39695284E26
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 18:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9DC15CD75;
	Fri,  3 May 2024 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GhmKXuib"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3615B997
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760357; cv=none; b=LxFYUKesCvG8aT77yxPD+0IYC1lWkRfpV0tQw3UgZ/TwIf7sU9mqXM0+GeFoxMAK1tb/bWs5C8eYZ72XRCqRkPGPeVsLIDdEZOhnTfibYzoy+5sLnkPK0S8LiRx6FMlWx4vIV7lsiaNMn92MmEkniKTNaiQ+gQqxAOMlyBqIjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760357; c=relaxed/simple;
	bh=CUBdyiNhoSP4ACo+iTYp6MRGKjg8W3HE2pVBTFyz0Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsKHiTNTgc4VhHNUFznMzpTcOJ7uoB4PGpKY8+eDETyMvGl0024aTAjkV/s+vu3HkXXli6hG3oZpG8Zx3aStVl8M9TR3LwUPwohbOk/AGoC4YxxiLZY1AK4wOCax/90HmjE4zCqKyVOH6hEzp2Yw7k8TzBGSiLyNYb0Lq5beeFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GhmKXuib; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so1977b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760354; x=1715365154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZNu49cB5jIU+scPc/LTeIomrER6yojN6Bu9P2llbm0=;
        b=GhmKXuibBlNA0yiJon04WfY72QUFZArKu/hlu9keDNOwCRAO6toz6hzkfX0+2DCPn/
         cfifck2QCZjPPTv71TEFgB+rTWP4prd7eLzwxYJFLBekilmPJgBSuyDHpxuO0VL17PEu
         M/3FG2SvVeeRciuJnAnjVvBsz4RHYEia240PT7PZqOUQCou26VnDIGMnEqfdPOMCBG5Y
         p3OGKbHqbgYJKZcNb6iL/Knsx6BR4hIBG0eMNYD7YsL8KaZFDViADgq2UbRpOhd0yrEa
         qG2a+XnF0bnnXE750YpvNbu+hzGZoCvdolPmRYw/iT5HmLAuYzw1ct5oegQZFRkj/1us
         wKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760354; x=1715365154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZNu49cB5jIU+scPc/LTeIomrER6yojN6Bu9P2llbm0=;
        b=GMkCvwm8cX72uvzv5VTljpHDjZ2FOakK3sMBwz0BhVe/ZnzGZPhO+vEIU/6XCoL2k/
         mGx6NjEGfKEkyW9mUl8C/ali01lMWjf74jZ2cGE1TB672I0hOv8O4EnSNZJX8BAJI0ZV
         K1bzHhM++ubc6xln57+LSGdXb/511bOKlN2xYD130PFvzsjX7FQhRuXSyyyOALqV9kle
         ULGbDbFTIBP7veAqfObO20sZhpWRf7+p2VIYE12MJ+xBabpKpgmcd6RIy5nMMY5EEgQI
         GXt4q0mQRlW47vq0iHPIt76PzPQFOtUY/du4/8HMpuyLwuCiQTpj7CLdddTFYP2J0/Mo
         1CIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMgcSaWThInGCjB0NZQ0hxiEisNRdJk5jfky/67n53ObZNCtENljDbt5hCZhsQGcxgqFiPZcNpT+5AN+L4lkIbdRmfQM5/+d7V
X-Gm-Message-State: AOJu0YwTmEwIP8jmrDilgQtoPFP//mPFOgLN8ZE+dVs0mM/AArjmJ5AS
	31OOLeDRyuqe2/mIhJ7fI5XQcweiwt8obx+KT/GVyxyKf3vhRToyXtZZPppkLXE=
X-Google-Smtp-Source: AGHT+IEDiBdqfsXvGEcow+/xXhFzmm8QJToAgACIY7pUp3n7rDHD0x7GsayE074DmQ273Ns6HlLwYg==
X-Received: by 2002:a05:6a20:320e:b0:1af:6fe9:5039 with SMTP id hl14-20020a056a20320e00b001af6fe95039mr3721586pzc.1.1714760354553;
        Fri, 03 May 2024 11:19:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:30 -0700
Subject: [PATCH v6 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-15-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=CUBdyiNhoSP4ACo+iTYp6MRGKjg8W3HE2pVBTFyz0Ws=;
 b=LJgbuLGSxVyIdCFiPOjJ4kcjKkqUizdoh8dgNf3DO8NV0Ma7wpUEikvJ7F3hAU0AjgkpzXZDh
 YRf+T8Yp8P4A58deAYlr+lbGFAdB7N8Y0VqXB0uIqrC2OQnnArji8iw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0


