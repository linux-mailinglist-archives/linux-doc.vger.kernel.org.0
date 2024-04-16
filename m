Return-Path: <linux-doc+bounces-14265-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809608A621B
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 06:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D421F23B85
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 04:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523983C064;
	Tue, 16 Apr 2024 04:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BLx9TTqn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFCE3A29C
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240730; cv=none; b=Kr1Waq4MuWrVdqkE8FJ3FQbiylDJCNp/wjJ1EE99sdEDTz2wFmTbXrqFM0t8oIY7HKWci4Z/eJ3a4r+skpcB86asrKOmkDwGEtGHWlBBLUeIIiM356TxTT2UT5UbSeyusS1yXxr0PLzmNeimUWF+V8dbHqM4FbZSJRp+Y2dnrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240730; c=relaxed/simple;
	bh=Ck0zYUhgFjnqfJEM6nA8CPhR/S6l/5RzqpopDML2wMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVXMkPbjnNIq7UBuDySqnZ5V52/yW+lpQc92MssKpz064vRG5HAlKpPZDI1+MLeCApOuCmBZnsOD0kyL1hEwdRjgqr8KY/XepCkhip5p2CX9j0cE1u6T8Fw4ekGPkJj47eMxa034eYOXpY0fRAmbSMAQtTMV5OhWuV+Ad8+TcIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BLx9TTqn; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5aa28cde736so2319482eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240728; x=1713845528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnud37/LSp4TdcsuxNdCbGLksvKJqKVQs/r9uH0ClfY=;
        b=BLx9TTqn4sgizCTZ5nrMzgELsvmtJZVj7XGsoe6PxR/QrjEySdb/wK9OMCDSQ5+R+I
         7buik+bFqNhlEq5IXaJlAUuZ2qcdRnFsMV+KCsFGDeDXrmIFIRTNVXkszOK8eR9XTo/d
         KRCEJaNS+H31b0siphcEVpXB5V6IfseGtWbUSxVGo/MNONrrlq30rS78vDf6SQyf9FzS
         hggKxpvns/6z3E7Dtb/LEqv4DBxBKDTcF9n4eDwAc8J0A+GXfHbdu9hv76upBfr/axea
         29ZvXtP8E1sPuINRl84mPqZL7mFv60bAnv9qJenXKNV/H/tY8DhTb5/k0FMxxIn+Kb5n
         z6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240728; x=1713845528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnud37/LSp4TdcsuxNdCbGLksvKJqKVQs/r9uH0ClfY=;
        b=tPeuZ0KwtT/iEPCzqRaGdq58nF4j09RBNJd53fota+xjQA54SUuFituKZQQ2137EC8
         OgrZ9b20QCCVds047bt5+/n0x9v41HGQRR0KRMECSFpJZs7O9QrZ01U5y1D5UwYxfJk2
         g39ruivBukD+Ot1Qe5UYWY8L2f8S00hY1i8G3KKiF2Mrz74Mvf60CAaGIUEOfZHPz8cz
         aqnt3wz6cxcGoRWCZEkr0qJQWbdx9lkMoGmWnjF+KnnEA/he+iCplvl53n7x4K3DD+ET
         zA1o7sqmYZey7OBNQbxhP/45NoHF99gysxGm9Fr/9SsaqrlJAQz3/TdlnZ8llQ7YJhE+
         Fc4A==
X-Forwarded-Encrypted: i=1; AJvYcCVvGjMB0l34QJL6JvlwGCuDT/RBFee81j8YhT59JLpbJBfju01kRGB8besonIxVf0ByktRXppEGElCszxx9758uC9tFee17SVqF
X-Gm-Message-State: AOJu0Yzeg+WPTcVZFIvICIOd/rwlZJhVbu3mH8MJZs4f8JiV+0XsJaKp
	atB4dH482UfsPZG4fFnqBnOqh0xc8zpPtrKwIpp9OEf5YEaebtH/VUYqoXDPztc=
X-Google-Smtp-Source: AGHT+IFxMNt6OiEW5vjUvYJAf+xw1NYHkKwq3y4P/c66nYzW42C1Wkh9jXIXtCQGEkU9Vk7Faj7xGA==
X-Received: by 2002:a05:6870:207:b0:22e:c5a1:f739 with SMTP id j7-20020a056870020700b0022ec5a1f739mr15219542oad.25.1713240727879;
        Mon, 15 Apr 2024 21:12:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:01 -0700
Subject: [PATCH v2 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-4-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=932;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Ck0zYUhgFjnqfJEM6nA8CPhR/S6l/5RzqpopDML2wMA=;
 b=g38hbePdpNwUugnCC3/gayvcqJQzC4qQSqPcs+275Mbe9bHEm948pONu+sRybahFvsJSa0I96
 lkJTrD9x0FmA/ycZHi8a2Qro1bkRD2YEmFCRO+oAtJ9HssshWfD3/UK
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector which should be included in the
devicetree. Also include vendorid for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..4788bb50afa2 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vendorid = <0x00000000 0x0000005b7>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


