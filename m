Return-Path: <linux-doc+bounces-21163-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B04E9395E2
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jul 2024 00:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67AE01C216DB
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jul 2024 22:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADB345007;
	Mon, 22 Jul 2024 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="S6JCyKDt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FF4597F
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685507; cv=none; b=DQGAggfDrL3tXbbG8s/h1VpKMssIWKy5/1WZ31P+aErvaa1wWw4ukSh+ZjAnnzfkqp/5VfJiwKEajTUlz2qUNohDHhGsfsxMojpYKHevzs2ZWuQ2RRslP2TB3VcSVFvXscql0aaoi9wo4dyt6PjDd1yP+Ph+ykWbPq4h4ZxwS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685507; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKJfDfzrTgvE12Htm7WYiWoSvsY6/SKoWnMSHN908p7v7tD7yhJ60RdkO0K3nd9hkFXVgpodjsYMu/b3iUSMsMg1uDH6Ha38R02GKkUnvxqW8MeXb9fVWx9ixqnu+W2Tpi38S7Zu5jh0Rqwvwlwo6WBmHpnrltyxcSq1RvBvoRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=S6JCyKDt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc5239faebso173165ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685504; x=1722290304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=S6JCyKDtlTjCD2AVeql+DLdmwxa2fIcfB91V8PCvJnhxBaQolx5ebx5XUIRtWWvNbu
         b/lzk3NHPvPY/27Xnq0g+AJqC6yZUT5tIriSw+KI9tusARIDSrtumuBZNpsXbweNlY66
         vY5TBVXEl33B3/L84qOXX4YhxuQwJvwCTJiFtFLpGZJO1GjnbAwxFiYNJuS0BTLflDlq
         aU/YmGcojeHT35ucXhK9dc1+PvjsF7RM2B7vrvM+shxIqwyEUTyKPe+W9ZQC6EQUfnt0
         iFDhqEyuoHCRLaHrO8wl16YULePcqPGNB62nCHvq1vyqF3M98CHaHzAHQjyR3ZjcmlXx
         /teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685504; x=1722290304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=ddFX7Oww22GGg3kA4aaJiewyQY1TNKdRm0W9MsqX5sVxyoAAxV+HpdXPpQLj3ohnwX
         ocCqgyIfyPUNn4dc8YUvhHjEB276ZPFd6ZPRX+YENzS+rL2qzzzLy2kE0INC3TJvHl6y
         L/s2pJMFvj8xE5+8wcEZoy68qfVER/e71zCIGYlqKqUJe/oZBnYJhnyf6gRMk7SV7IrX
         UxADebnzPry3qsAzymP5aVrxHQspYweYXN4zoSavede34EkUu0fy5ubnPmv00C99HMwx
         hm9q5MQ9dR7IxHdYvK3n5pk6gg0pBQkNyMDBa+UF96v86kd96JExn/60SKrKYZipd/8B
         fXCg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6PoS76i0CfO7/NvINzM6ESOwui25HZf5fD3m/mUPnyY/OBFD4A86j0LaPkiQTyHLdlomAP6AHfbGaoI3rxOKrqvwYket6wyz
X-Gm-Message-State: AOJu0Ywlb+wQ4r8mvYwyoyV6d88dh75mZHtzfSlvaTd7B6LPQSwZ+qbZ
	1wJd8bsTYV/nPGagjOtjcbJUP6K2OqjsZ6asd+O2k8nrF0yI5mgehryO4UmnRYY=
X-Google-Smtp-Source: AGHT+IEoJN1pCcgoeebixEMdeRFm+lX7Fz51AAK3F3aCHBFtjYtz91oZywD8oyA7iNOCpmg2SBax6g==
X-Received: by 2002:a17:902:e5cd:b0:1fd:96e1:802a with SMTP id d9443c01a7336-1fd96e181ddmr34308645ad.59.1721685503730;
        Mon, 22 Jul 2024 14:58:23 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:23 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:10 -0700
Subject: [PATCH v6 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-6-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=0RZc5Y7+dPFte3RfQycOhdYrS0o9oSHCnJx5nucXwKbADyIcT6a8rMi+tKbs59EJDNFM7h/IW
 hf3xB+tD++5AswmTbacfCC/pWDHRloSyAPnBD8iVQF4NrrEQ4Jj9uG8
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0


