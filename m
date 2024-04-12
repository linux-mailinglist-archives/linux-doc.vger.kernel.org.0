Return-Path: <linux-doc+bounces-13931-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DF8A24C5
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3432E1C22F59
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 04:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4800210EE;
	Fri, 12 Apr 2024 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0E5wWmdO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E31BC44
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 04:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895102; cv=none; b=rah7RUHYEtjTI06J9LP/1i/6aIVRvEBM2EB9kAAklK9HDypQbnLlAhJZx4B1AP0Lne7h2aTTtkSJ40Esr1NxH42oQaLDJVoS4hTUmKKUqi79jjALD12AJ3YbM5+ZVQQbWG9dgcqN7CQSvJfdnNmogVMce/OMaQEGNrrQsJ8+UyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895102; c=relaxed/simple;
	bh=oL6I4ETw+/5YBi2SkRJ3Nc3nJsbymuJaBJHYjR4VtV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/te17K45nLFBJMTfp0QvSF8NZ/V0dL+p2tJgUW9BsaK8Bs2OnBCu3Lox9DsyfVYTRHcW5R6Nf+uoRp3dm/QI+AVWznCTBAd/oQgry05s+p9Ef7W6f2C/BubaG9nVgVs2CRHi6lg9MV0XUIYHz7Zt0ltsQci8UsLpzKpO1IWiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0E5wWmdO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ecff9df447so554305b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895101; x=1713499901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=0E5wWmdOOwJOyXQ9RI9l1BgSQRa9PJUfT9+5H6/GfLtxfUObuOpMGkn/RsgVrnOXdO
         oqQDXcewdv6m0h6pX3DMye8Ra94AGjRXVfZO7mgTJyNPeChHtoPUw4bdE+va2q1wTxjn
         6Br2c3hB7VY42KCG1OUOk8xycClAJF5cHl418G5UCxzdkfib+D/zo5WjItcI9cIJ6uSZ
         GbkDXoh76IGhLbij1S0n0zqpZeqW5gY56G6WzIJOZ8N9LAFfSDCvubiqDHrtJrqoS7Su
         tJfKXgknZIqgfHAHSLZq5N9n4x/b6u+Bd8PfqYMpD1L+SF3vxQRa8TNINDQ/LEyaOu+F
         +iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895101; x=1713499901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=hWcJ/ehVAlwYp0LrQEpiPSvV/doljGr0qaddpLRI4MmK0e3bK+LqLW6ZxTqaB+L+a7
         OyZUfNhZXlSazMZio11PnmeQbAddGRiIuz0vwVj/FEGalKMumhIb8CHX/knzPDCEQUCP
         jSloBC1hFvjur6mVYhMaB7DadG1dxgLeEk+/KtsBx0D9Jzy73E6mdmk8APq6a6AjyWH7
         YGC3ABtujcfOsZ4FdvdJ1rYNGBMv3VNbhkYvysSzxgi3osX8UckCyVXbwixBUS3BtTC9
         Bmw1B2Q/WeabjfNF0nID5kmQiEFzGHDiil1IkJBT+/JUWXOUZvfKf5v1d+AS8tUpP8jF
         Ec4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuqCVhZoz38Vuco2a4fIeJ33GCsipYBIK28K5p1BYu92MYwpDDnzIL10YjZyuNMYtpjNiFd5ENkfVgatV9iU+nut0HMyyj9Aow
X-Gm-Message-State: AOJu0YyktgNQbld2ePLDixul0xUN9Ly+XHK+wgd2PhRE5cWVYCk70/Go
	WfoZfw0ISQNNj4/XCMvjdK3LDJbAQxOJ5LLiwb0myOCgdWVg55l6rSP8IFZUicE=
X-Google-Smtp-Source: AGHT+IEba4NqNqNEkKrg/H8FclHdYVWy4WtxCQBbHrwXnwjMt5W/XGMP4yXrN/YV5Oq23+OyoGfHWg==
X-Received: by 2002:a05:6a00:c90:b0:6ec:da71:9c4c with SMTP id a16-20020a056a000c9000b006ecda719c4cmr2110137pfv.34.1712895100866;
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:10 -0700
Subject: [PATCH 04/19] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-4-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1004;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oL6I4ETw+/5YBi2SkRJ3Nc3nJsbymuJaBJHYjR4VtV4=;
 b=g/DzPC7a8tBrQ6gAdGC+lnd01Uz42ouki9Lrq70WlwEn3H44BQoong66ZykBP3aEbqygAr8DM
 /XZlDueiyI1BQs+8dexnhDJd/2hv+RQ1wih9R3Vr2glQhBTFzUpkdD5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector which should be included in the
devicetree. Also include vendorid and archid for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..aee07d33a4d3 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,9 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vendorid = <0x00000000 0x0000005b7>;
+	                riscv,archid = <0x00000000 0x000000000>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


