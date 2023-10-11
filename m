Return-Path: <linux-doc+bounces-62-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D097C5197
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 13:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A57C282697
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7BF1DDF1;
	Wed, 11 Oct 2023 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PuLNF2Cg"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA41E51C
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:22 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D505B8
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:20 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558145e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023159; x=1697627959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g725wX2RCgDIINxrzRtFutbEjhHX5ADwHJWwZC8SBbE=;
        b=PuLNF2Cg5RGSdpGERBv3QTnAuQcebT4gS1PP3Lo+v3kMyZdfh9YlB9PzmUtELT3qIX
         bIaRdMUBNQ7RrriKku+PtOfDuZhU1exswKBWbhmRJ2ntejR9kOuVY8q4gMbxWnDwXMla
         Hx8+OE2uO5tCYln0f+wHbyCuiPAxMTA2qJd2KcfmVsapTHs8venuZLpijWLNJggDZaew
         D4GkHKoJ4PhhQqIw35LiZtr4O1vtbRhygjTct0p/r+DURwYLb1+j8HlliHTsGXukPGos
         ovJmBIKJCymVwxE1iooMD1O2DIStwIaIkAJDtcwWHG3LZrJ0OaRqZD0vZDGVzMOe6V32
         ENDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023159; x=1697627959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g725wX2RCgDIINxrzRtFutbEjhHX5ADwHJWwZC8SBbE=;
        b=RCQOQEIZ1ABAqOm5RZgTFAFOgWuS9Xp2b52VLgnN31oMG9dFxpDTcxBqU1tnXwkD74
         8/Ns6gpfZ+Z8Zdq8etPtagCTtYY9SBmMOd0C6nkQTxLgfqwZZd+Lk7ydgWElwUZBHLMU
         er768blHsdwR8avKC74YdZQu5H0EaVP39/Uswl0YcSUOIBaK3QZNyebAKjVW54rv0Gn+
         1nY2DgDspJWgPi5QSauYrayW9qLNfWTmXJBE7qqdvs1qF0OIAprj7i+eqZdASdtfaC8z
         GVF/UMlFyjFNlW7R+2lWfF+ZgAFkzEbn5qZi4smxTg7/RvIWEuyJ7DFGoKlmzsCHi52Y
         Ctlg==
X-Gm-Message-State: AOJu0YyRqc3zotHp5G1ii4KvdLSBMLcguzxN8NYxh6k5HDrZsLsxdvkS
	xpnMiJpV3Lui/h+8ZlaK8+Keiw==
X-Google-Smtp-Source: AGHT+IFgom/TIlAu8EKuMky9Jmmxxz32ca6jsPP6UxfW3Jt+YWoUsDLXeIU0gmICwFa4DCfiE/iZ0g==
X-Received: by 2002:a05:600c:450f:b0:405:358c:ba75 with SMTP id t15-20020a05600c450f00b00405358cba75mr18845618wmo.0.1697023158386;
        Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 05/13] riscv: add ISA extension probing for Zfh/Zfhmin
Date: Wed, 11 Oct 2023 13:14:30 +0200
Message-ID: <20231011111438.909552-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add probing for Zvfh/Zfhmin ISA extensions[1].

[1] https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4e46981ac6c8..35f00401afc8 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -74,6 +74,8 @@
 #define RISCV_ISA_EXT_ZVKSH		56
 #define RISCV_ISA_EXT_ZVKSG		57
 #define RISCV_ISA_EXT_ZVKT		58
+#define RISCV_ISA_EXT_ZFH		59
+#define RISCV_ISA_EXT_ZFHMIN		60
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 859d647f3ced..9ee7814641a4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -171,6 +171,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
+	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
-- 
2.42.0


