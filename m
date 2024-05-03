Return-Path: <linux-doc+bounces-15673-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C38BA630
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 06:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430C71C21C76
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 04:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D9C224D0;
	Fri,  3 May 2024 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bOB6lElm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075CC139D01
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711614; cv=none; b=CQklPt0al+uZCkm5SMNjkeysEVKb8o4ZDF/+D+Ai6KgFXIAEuZXNbHrCaEB7Haib1Wi4JAAQtn9UORTRAPxbKQM/sZvKMY1SzSiXda5ZHAagwTFAta/Onh9RqCTnhwcUc3wmb/L67ejuy6FyUS9SSIAUHT8DTvamekGCgAkQbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711614; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGU8GQay0u7Z6lOirfhhlQ+ATYUiPS7OsSPE3dLUFmqNHTinJdG3YY/WhOO5/c3DiNKuiH3le84NiEg8O7xiyZc//LC0KSvi/NETQhbWqU40a+GuYxXbmSu9+WN5sHmiIyt1Dlq5U5TaawQVxVFn80fl03ClW495tpsrd/yk9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bOB6lElm; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so7663116b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711612; x=1715316412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=bOB6lElmS6SNA4Kp6jRre3LuMAkD9gpCnA+N1P0J9wmP2PjnremYegZaHkqEW1nOLj
         ZEtff5ixFJaV0f/iRf/swA9AJ34XQCrFZUtrQUC8mioGYlXo+AdeevA1Vfd7Mlbw2+jm
         YSgtPA+Eyq3i9ejXiG8JeeF6cfnDQNeI1ppzrWdwWj99iJ2ZQLOCUsb0ClRa6sy736Z8
         HHAmwG7Hht2MZV1kca+F9cczIj/2pqJLcVyw9SVAovHeUZEP+PaTKcI9vKwzlYbPX54i
         oFBgum1hYOr3SnaSCemo/Aldc1tFmbHbNLbOowtwpWqOIWRgNK9OfuLdiiPuqo8Hyakp
         crOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711612; x=1715316412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=ETN7lsZSTpFdAUJfqjjShlAYaBMpaZ+CplmvMCrBIDksNJMLem+P487jyZvhqIpbOm
         A3mLTp5d3Q91BixTd/kthC/5YD+2AhuO7KaLFyC6VixfbPozO1TSWrbEYmcTRawJ6EZ/
         westx6lZcQzQwRFisqLKqM04tEVDYdXopdz/2jDpJZ72ot+JE4MVJmRj3WcXLy/skVk8
         Sc+eaCuMj1/kluxaFNZJVKL30g7sR/uox7W6BirvqxeYuBBsKuYIAExbT1RPdTR34Var
         h+874owQ3UPE5XaFfrtbocW/gJa29lLtj+rzy9fJsapVJNbnTx27zkny0ndIg2AqDu5e
         dadg==
X-Forwarded-Encrypted: i=1; AJvYcCVpp+tDF3HUaK9aEMitAoM1gJmvuhrva2rMXcb7ipzyXz4XYVtNXnNKReljAxyXH9yFRi0UTrTdB4bW/V3LMstRf4x4E2plaMe4
X-Gm-Message-State: AOJu0Yw5fh4JzE7yqLqMFkDJwSkl9GzMWq3mGhN8aQHJfEOzl2GNwVra
	/QBALiiWccEnI8S+5z4DiCTnYC7gqwqkdHo7dTX9z9FTn3kuhxmNb1VVKyG3rWY=
X-Google-Smtp-Source: AGHT+IF41hzKf/haVFQvven/JbxBJ+u/Mlmilmw8xyMi++Oyo7SayUCiC8aXNcvJL+QSQBIxRKdnGg==
X-Received: by 2002:a05:6a20:6f8b:b0:1af:59b9:74e9 with SMTP id gv11-20020a056a206f8b00b001af59b974e9mr2154976pzb.2.1714711612474;
        Thu, 02 May 2024 21:46:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:39 -0700
Subject: [PATCH v5 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-4-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=8IiFogJx9JBBPQ5oODZ/+sRV7hNPdv1Ar9s5kqJOcntxexJjJ6jCBV/6P4yvKFz+I1naMnzjp
 ueolnUb0+eoAAIxaJQM00OvIraOUtrlv7jCWmPGAhRsCznbLEKcwh5j
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


