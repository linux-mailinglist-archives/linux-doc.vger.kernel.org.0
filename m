Return-Path: <linux-doc+bounces-15679-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA28BA64A
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 06:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92ADA1F21C63
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 04:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C48C13BC04;
	Fri,  3 May 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UJjAaBs4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFD13BAE8
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711627; cv=none; b=f6oO1Dly3N18ic93Xu4mBtZyXe5/aC6NrBhZ8vX2G/ptc77ezxN1pA/HJZDQ7wG3IotlDmFq9DufhcSQCxQSmwZYqM40O9E6Odcf1/hFSoeUTPxe+QrzFJjUSAqwg+AosGIEOuxDwWwmsAeOknsiDUTuVkXUYB52/jP7H7T7oBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711627; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juzPVp4bSRZVptvW8+TeiSP7oz6uGgO00gBlJgcnb0TFdn4xqWvzJ1wKQDOYcTvuWGWcyUkWM+C/e/KmYgkzW+2+4hiscbtlL6GL26oKqmWAzfxH6n4OggV+5wPq+sTHjU3cjjksbWzmEFiMcztTpf9D4KvQ9Hpt0V5SRZ4yaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UJjAaBs4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ecd3867556so17297425ad.0
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 21:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711625; x=1715316425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=UJjAaBs4bAxzMvwKs17x0flRlci48xOa1OgdGWZZBXeVCJ5CBr54wueaXl/kCg5jsv
         s1hklwRzBWcK4Nia0B2295bVrHt4SGILxAGFw8+1uNa3mhxIjPgzTsXQ9IkK7coDy3Ft
         dfXlOS6vx0ugG1tFuVtJmYlm+iz3Er4YXw9JTljhwolHBjJMml/NWeYtiWGUSiP3nnqR
         59RNw0wk4CpjWPHHflkyEN7qMr2ES+Zy/OGxTelff0bZBM1YVV0tCz2ZrmMxv4qb2Izt
         oXwuN1iSqdZVI7NaqqFwTiYjKHOIP+vr6FEn73/rLRrp9XTFmCQcRFNygtU4eIBetLz+
         55/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711625; x=1715316425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=buQNgBbQv+/9bQ0SmtOdPckwJcKIEbxds804jHVXNYiaKTpwEEQeHQJVvanfpV4S/U
         BmMiKGPzmd8yHfRBJTAyqpWhRIEeEbCXyt13rj/xdKLo0p/uZMB/Hl+e94nQsjv5t24D
         bDIVS1QHLY5BaMb6W/9S5CvvyW3KIxTmJYisAHOtXM0/koSZrt9eD6QhCz3CwdumrX5K
         AJN3afLCUgxSaHX70XKOzlBkQMS5Xr1oriW65km58HU/TgvmtxWvnpSEHkFunVD3oGYD
         UoGP2BNGJy6COcPppq5SC9E12AK3s1e6v+UH1Gjjtawkf079dvRaeyi+oQLHMpOMLtpJ
         uW0A==
X-Forwarded-Encrypted: i=1; AJvYcCWjAEUxHpvcV2MxkXf+X6TD0Q1xBMxFuvOrSI287OKHjOVRgMyAy8/POedC/Vrm31a0Ndy5ISXLCsFYERnZF+LnfEXnXPb50mEV
X-Gm-Message-State: AOJu0YzoXT599lyvqlVNlUvOnO12s9xL8nVrx1HCOO5Nn5hXuXzf3YmQ
	BodaB/+GcucTc6RP92DxeoQAX5C7vmRJodj9wZzq8uZ3lSDciaBhDCbqv79LQB0=
X-Google-Smtp-Source: AGHT+IEsLo+sJPSi2a0Hv7lEXXuplTtHBmjvJGQqJ+J4Qga0XMWmIW/w+sEAMQqk0rkMrnR+elhy8A==
X-Received: by 2002:a17:902:6bc1:b0:1e3:e242:4dc9 with SMTP id m1-20020a1709026bc100b001e3e2424dc9mr1627010plt.33.1714711625059;
        Thu, 02 May 2024 21:47:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:45 -0700
Subject: [PATCH v5 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-10-d1b5c013a966@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=hL7t9YD70TVJ9RCYIa7iCFmk1VSkj7KUU8JdWDeJG/jxY1JZSDl/mWwHtuMDQBiOJ0PIZdgaR
 iKOSKxqaBWZA1yRAFkHEI4kLmPLYbdTrOUVL8YrpVvOwp9MjfHRvnF6
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
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


