Return-Path: <linux-doc+bounces-64506-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E7C08722
	for <lists+linux-doc@lfdr.de>; Sat, 25 Oct 2025 02:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D7BD5662E4
	for <lists+linux-doc@lfdr.de>; Sat, 25 Oct 2025 00:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14F51D5151;
	Sat, 25 Oct 2025 00:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcQvV3mY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AEB1CAA7B
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351972; cv=none; b=MThk/gthfhXxYwIfwR2i/CwzWPJZqrb0CTuojG2KoBjoj+qjkt4fk6xPfP47G2uQMuZFhum7wISzB+T4EAjXc4dGM5ehcH8CG8of2Q7beQtQtdwrvPMWDxDI+QCqJnEUaHIUz9C01LGd/nf+XM+yDfFRGmm4liWRHrJE3CezjGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351972; c=relaxed/simple;
	bh=aj4aVwNnkYZP/VgOnJhsAwtvL4XTAa/u4ZaKgBAEh3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEULTv8hU8ubW+VvNL1yXioE1imumogShHzEQnjaYV5DTCiXr+CP/M4to8SjFDtbaS7lF+gGs11Q012b8fkqnQOvfRqLP2dMAmNOUbBq7CkU+6ClrVKI/w1B+bfdhQ6F/KFQ0JSc5ehLZVtFLMvk0O1t6xaMGu/ZuFLG4Qdq1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcQvV3mY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29476dc9860so20011145ad.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351970; x=1761956770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=GcQvV3mYF7B79ax1rkdHGufwtMG6W9dGQzFord+OUpGkacoQg0jN7nfbKNXE521E6U
         R5nRPNDkFT1U8CwHl45pZVVxU9AEmeZs2pUQitf1SGSqtPuIsXFCxHUxV5cLuPnHPG2l
         hxQW9UzQIymVogSH8cJYMpz1MWDxqjby8jQZwwu7DAt4q942BqC0BHm12mK6S7G9jvYo
         0SHhBkyGWjCTg227X5bAcMd9reMmYnXaWxpgohsE7iseuWWzyiOa6haUiZUCa3eIaZFP
         7QijLqNcSpB7KcRnOP9weLpKxCpm799XtiTbJj3APAUW28RMXlBn2SR1RmemD0BHDQCm
         0BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351970; x=1761956770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5nftmpeMNxILQOhfvmkuo3ny/kYcoPK9w/ov0DMU2I=;
        b=cfU1Gs8REtHZx0HdbUmuxvQFmIqchlMpf0VhErSCRPX1Y6D53j5y+vOjejfVRR/JRu
         +RQDwiKGuKcQvaE+glZFstoDpCy++1RhdEUCx5e+zZdCDnQCaCm68HgRCdt1rcZmwu1I
         uBpYG2XuBdwVk85e9wuo6srV3USv2Kt+Iz+WwdQx+KOH3puIfl2dqdW49t/ET6nt/D8v
         0SmsuvY6UoX9nXLwKkzz0A7fSYtoPhqmPh8xmZHNNoiOqkhQxP3EfU9jJB4FFoLCT9fP
         yyurqJcEbZCZUaoYW5intOl9B34dZ09wkjUF5m1jxbAl0EW/yb1JXUucT4ZG5A16Oy8w
         0NKg==
X-Forwarded-Encrypted: i=1; AJvYcCWRkvhX1XJS2QJoZS9MYpdpMOUzHR900ogTSi24fZ+bJHegWLmFwTVwWDyEt6rYylczo13K98oKqMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC65LtrNbyB59iDaARSv/a3MX4vduAe87xV/rRqy1ut8LnA0+c
	rvq1aWB80o7Uky6/6GRgwDZM8WgicSoNyPKIOhuNKh20Gs8rckfQzlq9
X-Gm-Gg: ASbGncv0ZoeWzV7Krnvdu7qHiYWNuXs0bGMwBLKUfm2tY8dSnye0ohye2e+kQz/+8WA
	pHuSQmq7LnWClwuQtInVMQRgEd9F7z5loQaFGZUi9N/3ZNOVp+3k94ViaowNNqi6o3wjQN83prE
	twQuxY2tBDUBkSiTdm3/mA3X3s3PFQj0dL0O227pHEPRUe8clA0QTNpLkTRmoSiWtT5+8kNHP3L
	GOKFhstWwIUen40Sy2vVWP5yzAkvsaQz6Lo35FSWTy4DTNfBIluMrVJKOKo4jZERg4mPq+Trf2x
	HPcbgVowu/NAdpqx5l+NtjYoGInCsShi7NdeLPo2FgUFtrLZf82TbMS+i0XNhgPUVsdZvp0wMNC
	gc5xpb8PE1qkoTd45Qc+rMIu31sbeuYumlH70jNNNOSO7DXwsCj2e25mi+ER3wA7vKLjdPAlar4
	oJY1SLbfOPrVa0OGY4YeXszEdrxcOuRP/I8e0oBiltQiHyItOsZG328EtrX3uqVE0ICUzLsDLeI
	ujYQTzmYrbbVH+3NX0dSva8VhLgvJ89ssZHh9lfnt9RsQUbAEDykw==
X-Google-Smtp-Source: AGHT+IE8KakcB5GHMGG8ECARmltmRt3k8h0a0+JIbETOJrnh8ND1oGT/dCjWnKYo35ORe4+xL9/X1A==
X-Received: by 2002:a17:902:db05:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2948ba5b73cmr48845065ad.53.1761351970277;
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:10 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:41 +1000
Subject: [PATCH v4 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-10-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2GQnZlbwDgkFgLSJTTlkgGVtMUC2q8Y46wlmJNb88ZA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM59fOHE8XGD1q5TTvfe1J0p3i1UNPndGn9/d7OLU
 d1ZTR9rOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNteIiRYdmlmbkMnxU871/kSnOszjRcPnf5/0tbq3w+nJg8l2vSeQ1Ghlvlif/
 yF+yz+2l6ZbLx3N8bhLcfEPusO+nlav2A3Ss3neQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.0


