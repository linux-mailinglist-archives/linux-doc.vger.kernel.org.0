Return-Path: <linux-doc+bounces-13083-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5884891296
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A01128A7C6
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A5D3FB2D;
	Fri, 29 Mar 2024 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ni3KCJcR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE13D388
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687574; cv=none; b=fF/0tSczt65PcwUVleOBejSHHhCUOJPBTE6SiIrzrcC2LnfxHcOMIuUqv/KkTyoV3Me5dz/zS7CRDwwFwzairCQ+0iK8KdJMaZyWBxH+i1iMNGmF8DT7cvcvscMbMXtossK2qiU2UWChVveQSuP23GmvOiW4MLrozptRCyrQ9OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687574; c=relaxed/simple;
	bh=cOSTrZrguK0vS2cg25DDGwmYtDVYXdvyWqvAYuObj3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CuTrOxbPZDYnSyb/Yv79U1XfeM72aMSw+YFb8ndj14lzDGoDzvP4TwQ3KkdbOVXNragiWueGsvf1g4YXajuS/veGtj3WXwuFy5Dhy5Bj5eHfjSHQzqyqh1nBceit7A7sTTxFUmUcDBpBSAmluZO+t6HbYpZtwcA6N052b2v1zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ni3KCJcR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso1196524b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687570; x=1712292370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4DMhRzx46RlnO0Cr4Xo2ac2UzARWIzMLM1MQTYcvtg=;
        b=ni3KCJcRqC3tr5D4tCmA1lEhmuiluqwTeU6Txh+75hZt3u+XjJiw4sPzLIRoB74ygd
         f+RE9T0fZDfNpGpI6DFynpSubrxleNE+NVctkJIM9hZr3N4b0O9Rzg84D+TH8aZNdfEn
         BERY4TzDYzwRLfnk4jLzgzrHm4/5IbcPD3c/DtzP+ADcud6RQVs2cgUOKRejFxRrBtwl
         y4dUYbSxfjImuDAcQZuRLfsrlEWhvg5BZED6HcxIqJLDDpyWqTY8w40l9CVylxHfTMwJ
         FD+EpEr9qOGZr10vTWylI4/BRUCdUNlwCIXF82OWg+jUwoYhtoku3n46VjiWJf2Rr5s5
         3jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687570; x=1712292370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4DMhRzx46RlnO0Cr4Xo2ac2UzARWIzMLM1MQTYcvtg=;
        b=w3EuMmnB7I/Sl0/VaBTnBxGYhR03K6gjnqTPNSB+NvVJm/GU5I84dmNA4xXf8Y1hRG
         qVXDLgRKAkDlCr38bn9MVAG3weo3aKTIVFDnfIKA6ra+rEIiV2qDJEsVDbXegS9ityPA
         NM0BmxFK5c2+KN0sKGjYonnnFJujx9o3DEBVZuzWO2zf668lEGbtejybsHKJPe9DztB0
         allHWJPlLVagAz1JXmLEB2rx2wQaXDqEah4bLp+so/d1ZSkfRPPHqgtmKTL7QPvT0j9w
         WQNjt4fAs/3tmJ+uCpsM2e2yIww9Ld/QFM1Kd8ngsG2RGpdFqu4m2PUV3P0a6H+TqOLF
         REEg==
X-Forwarded-Encrypted: i=1; AJvYcCW8YrZBk/7pYhMUO0sqJLRT30O16+Raksy/WJGd4M5F6D3ZhWtJUvpV6o0rQf++N1HlY/76LljA8gC7WjY+qE6dOnYFMTOmpcwK
X-Gm-Message-State: AOJu0YydIzWOStRDj+oj7DXF2MOUcnwFPgLu+WB1/dVMAhryGOCFbssb
	ajvLRPb8GQ+s6RwE9St4bBBWeNbFfPkEqozu4eixohHrjOmb1VfNLR7sD55Awf0=
X-Google-Smtp-Source: AGHT+IHO8nERPTyOdDNYqVk3BGsMD1zsiX2YsaTJD0v0/gtzyZaZ9G+70tI4pNq8Z6R8uDRiI7Pabw==
X-Received: by 2002:a05:6a00:4b49:b0:6ea:b606:6548 with SMTP id kr9-20020a056a004b4900b006eab6066548mr1848385pfb.7.1711687570371;
        Thu, 28 Mar 2024 21:46:10 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 07/27] mm: Define VM_SHADOW_STACK for RISC-V
Date: Thu, 28 Mar 2024 21:44:39 -0700
Message-Id: <20240329044459.3990638-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.

x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
arm64 follows same path
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

To keep things simple, RISC-V follows the same.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f5a97dec5169..225af437ecba 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,25 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#ifdef CONFIG_RISCV_USER_CFI
+/*
+ * On RISC-V pte encodings for shadow stack is R=0, W=1, X=0 and thus RISCV
+ * choosing to use similar mechanism on vm_flags where VM_WRITE only means
+ * VM_SHADOW_STACK. RISCV as well doesn't support VM_SHADOW_STACK to be set
+ * with VM_SHARED.
+ */
+#define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+
+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return (vm_flags & VM_SHADOW_STACK);
+}
+
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-- 
2.43.2


