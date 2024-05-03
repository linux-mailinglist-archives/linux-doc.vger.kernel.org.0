Return-Path: <linux-doc+bounces-15728-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 048518BB2C3
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 20:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358131C219FB
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 18:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29629159215;
	Fri,  3 May 2024 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Dl14eVK5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199E15921A
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760332; cv=none; b=tDR0ZuUiBjAHE5omJkonKdyqGi2gozzjiNz+vWtIkV1PazzpiIKLf+9AWg9QAL/onp+aKvQyiLt61hbby1rLMcJjN7sRI0PsIcOvv8EZvqiizCHX9KTSddzgHgyN9et/eVw2PuF2qbaEwCZ5MFgiTu2qNnwbVgwemkT0CJWuGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760332; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw+vrEE5HtmQVl9M+cdf2kBtuJN3yI0yMnnHtbSWyWKvCH0Hf8bupFvluFOSpjeIckAA+q40iC06STYlIWlD5oLBaQEoY4UICx731UhntE8lU2OA/7YVV+vUeYIx5/Qtw1YRzZcBIt/WhpqCsiqaLdtOt7P4orEF8Qwf295mtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Dl14eVK5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso6422258a12.3
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760330; x=1715365130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=Dl14eVK5AOK/YGsz54ifFptcjgJkFJBSUGLdx03++zyRnNlH4V6sQ/qMuyKzhdTVXI
         nr/0nIWfEVsMcV9v5EJYYyk/xkNrMkXilCv5WlyDma9/qil4dQGfNkfKJ8XdujI/vYcv
         0HljhaIYlrebrF9FGWNGmYGEKc2sMqM3bYQFM95uxe/jf+Nq7jJvu1Us3q/sS+vyCpVr
         +vfT0wDDym3MLUstGZLqkBhXsCUmpFLTMeHK6LU8fd8UuYh39GUuuhG+49DlN5FkaQM/
         9jSasoahDRPyqm7fwIjN4o8vTvZB0Ft2mLJLN+N4YA60Jlhcv/y+qwKETkcCoSqMkDgV
         ibmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760330; x=1715365130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=IKXXrLAsoLTB5GH2WD96pKX32Q7yAO7NLIPCYqeOWO1ZWGGVcyNOz1L2a8EkfCGpgm
         fHZUGQKOXMAhVvpwYXNnTHEEQvkAir443aMuO0WD/bTYbQIIncTsAXCS1XOuJNpBTnyD
         7R4sL+8sTwGmZidX5Rj+lHRF0qlUci0CD93A2rfY6lwe9YyYl7KPU4iv7jBHxv6Q0SHa
         UDTs30fBt4OJ9KbWrpGap+Zp/ZTq+qlUXcqgu1Dm/OVG1ZOa3+Fv6c0WeawJRbbRaa98
         n0OMv8MSS+7aLK62tWpDfRMGzwEoglC1FoPq1QT/3dhBU7RCdZvGMOBpr1xsLyfBuhGV
         lZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSw9/otjtb4SDaH6ei5IjeeBRPweG5mAbNyZX2gZ98DRueTJ9LGjgobNlBFSrqR9E0C7rw0WhkEVrq2OeJWZizGPwKslDwloSJ
X-Gm-Message-State: AOJu0Yyye/puIeS8YwN22a9BAqErExwCwmZVnNJZbxQB2ABt5Tq6DC9o
	vkWmlxdaQKVD9CjxjNVrYJ5Z0D+cfJT71w5+/xSLsQFOnWdgEjg0bYZRcqSsSdg=
X-Google-Smtp-Source: AGHT+IFy7bjwb5Tc2k3ELswk0ckQlxflBBtAMpFeTTm74dAZvij2X2R0LCw+XDzJCWrMJUDPuSACWA==
X-Received: by 2002:a05:6a20:f393:b0:1a7:4b40:96db with SMTP id qr19-20020a056a20f39300b001a74b4096dbmr3340804pzb.10.1714760330034;
        Fri, 03 May 2024 11:18:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:19 -0700
Subject: [PATCH v6 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-4-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=6g1xI1qEsC25DUPbbFpRsxXutxb45Sm732q6PItZvN9xNDcps0BAvC/bY1rPUIPcJI36yR/lz
 CNxoaMn0OIdCbC6bJdMpDz6ehBx1GiDP/MZbJJlSKdQjCj7lyJtPXxb
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


