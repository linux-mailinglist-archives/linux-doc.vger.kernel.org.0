Return-Path: <linux-doc+bounces-13087-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D998912A8
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F19D7B230BA
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83E743154;
	Fri, 29 Mar 2024 04:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zPoZC6rx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168594207A
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687584; cv=none; b=cOWTU+UB0BeEymSGmM65xg0XXwL5KGT+bDPQhzNGMJ8DAztqXjY52EdgHYRMzghGuxOn4cjEpsRa492ktRQN6WgPXzRL6BMOyB9GevBLKzx8INHnsSZVSVH372xwv0xo5hCgi7JgavCx+NkvcU65jMb4Ss01Nhm6tXE1GtaOdKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687584; c=relaxed/simple;
	bh=Ey9rKImaBfgbvkp31PLRGg6Gsl3Jy9d+ryThu1n6T+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ceNTTav2NRp0vdosIJ8pXS6DUTXuVt/au6+tZR7ONZu3m97VY4RiaQl162no+lFFtA9deIqqpDCVukic3hrIhKaS4Qll2T+bspqvv+p8wLfXVMvysy/KBcJhqAEbbgC6WZFp0ijkC1mr55QRvVpwkAV9PaaRlzhxccfuraDQH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zPoZC6rx; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c3aa9ca414so1108002b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687582; x=1712292382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEO9ZqLZNdtWaEHlnNa/VDfM4+2OUD4uT/m4nT0q2gI=;
        b=zPoZC6rxgIYSxY+BMmiklFVpaTjK1TpwVKIXHV+uFzUXZ4WycJ04Bm2Ph2sCh727SC
         MvSF2bDtiifmMX0bFmi9ya1DVwc4uVYRSvBfDwU0BOFxN4JmvRwdnxbVI0z08ShwBbfe
         s001iD87I64acAwdzJxtH2SroogW3EwfYAHJwDUlLDPkQtkRo10EPUcINFHiB8xW4x1M
         96fLUcncXkOt/iYmuZbSUe2D1/8iungumyphV6waCqtv9yaev0mzedxKm1bLjbqTuc9A
         7WjuD4SR+9tNNLkmN7xz6oj0m+30vxcfFfeIDkKgszJJtldqg68mpLuagdpeZSNEeZsv
         fxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687582; x=1712292382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEO9ZqLZNdtWaEHlnNa/VDfM4+2OUD4uT/m4nT0q2gI=;
        b=XNRucgFBXHOvtxUYWcqBGetn8r6PNtCkYk3RFuod7Kp9fhD4TCvUQwjtQta16+xMaG
         4mlAuzTL/7FYOfus9/0qLgCoN1rcHHVlDctKSqvBh7rfRpKfH4BjSa8lN8xMMSCnSYG3
         Kekq9ymxnn0a/J0ln3Wvtby5jrFXtLIiGvBgKmVHeZHO+MY9J2iFY7aJgB60/afNRwCJ
         fxYK8/+c4R/y6WxfFUwjj6W33ib/EismG/drogUmj64lOITavWgQQ9gVDoE4+Rt3Bet/
         3z46Vr6BrkVc3HhqyKZDbRfjhwgh5aGkQ+0EZbxgDBf0a8+k84mkqcJXUfNRvTARwiTW
         e3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV6R+R5pOA2RKZK13ImcLdseA0sVm+e8GB+VbhWHyCaamYjZMtuFdaT17rwdgDedNTLq0Y4c6F7AhThv0tcc6/HBtD1XE1Gt02
X-Gm-Message-State: AOJu0YxHkhARHFD9MWX7QA7QS6nHhSVcck2ZurBjoQ+U/Q/b8urb6rxR
	+sAHgi4tS1nQyrV47NjDqokltTPec+/w2dq/W07m8KqTiHQ9pPnLI6xe7trwqug=
X-Google-Smtp-Source: AGHT+IHkNGwGYsa0lxSVV6I7rhUYi4wQsB/IhRzR2mYXyandS5eg+YGt4M7UftNEIAsc9qZb2HdgcA==
X-Received: by 2002:a05:6808:3385:b0:3c3:ebba:2cdc with SMTP id ce5-20020a056808338500b003c3ebba2cdcmr1352197oib.17.1711687582182;
        Thu, 28 Mar 2024 21:46:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:21 -0700 (PDT)
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
Subject: [PATCH v2 11/27] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Thu, 28 Mar 2024 21:44:43 -0700
Message-Id: <20240329044459.3990638-12-debug@rivosinc.com>
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch. Underlying
arch can have two types of writeable mappings. One that can be written using
regular store instructions. Another one that can only be written using specialized
store instructions (like shadow stack stores). pte_mkwrite can select write PTE
encoding based on VMA range.

On riscv, presence of only VM_WRITE in vma->vm_flags means it's a shadow stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>

rebase with a30f0ca0fa31cdb2ac3d24b7b5be9e3ae75f4175

Implementation of pte_mkwrite and pmd_mkwrite on riscv

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6362407f1e83..9b837239d3e8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -403,6 +403,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -694,6 +698,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index ef887efcb679..933c5f23ef73 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -142,3 +142,24 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
+		return pte_mkwrite_shstk(pte);
+
+	pte = pte_mkwrite_novma(pte);
+
+	return pte;
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
+		return pmd_mkwrite_shstk(pmd);
+
+	pmd = pmd_mkwrite_novma(pmd);
+
+	return pmd;
+}
+
-- 
2.43.2


