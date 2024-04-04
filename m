Return-Path: <linux-doc+bounces-13440-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6E897C1B
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 01:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E7828B40D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 23:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B61156F52;
	Wed,  3 Apr 2024 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VbLmMI/V"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF799156F3C
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187695; cv=none; b=VQvFvmFeD6wzz7ZIic+btNomikiqBoVuzhIfgQwnT0g6C9S7HhKrSwun/Srgt5418mJc6qF4zxUqbX5dTlUAP9CwVH3/yVxCw+0hh8YiZ7imQEkzA76/tdeAp6WRel2eoznkWt7EXTKqjZjpKE7YQWMAP4swS2GwpoFs+UGDbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187695; c=relaxed/simple;
	bh=DyzxnXYOFHCz6d4trVGJB39+6FjfyRM78o1GLQGA+r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ti8fIP8fngzR2aMuvgJfRChtM83Kmwa4kCn4e1XIlysrT53MTihUhX5RyulRT8coTDVA2+os2Ud7uiPMOairfC7cmJbg5JNv7W6NXYohyzEul6pLS1/cnlRszuWrebMwvJhfkS5zJZXOB2Jlta7WLRzjc2kgcruEaH8MpXJi2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VbLmMI/V; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6eced1dab1fso27700b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187693; x=1712792493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1lL5f6yq9LaiF8GnxAfpEDQQL4kAkav9nCQOWb1C3Y=;
        b=VbLmMI/VIxUJ4bM6wZA4v9O/lS22xRM1g1jl00ifbHN3KyhaC5Z1iO14LjEKjyhBl7
         tF/aZfOpg2Jgi6v2XklA5tB9HHSxW5G1Q1khNU0lUGIVrXr0qIU5GMR7bOK3pP9D2/Ap
         7ISybqmy4/+aWgC3esEuZ895KLahu2m2gc2Vs3S90OPVEQ0Mc77vT0MgkWU5wlXK9EQN
         T+2mtVVSFQM8Eb2zyaQKwWzKJJT1kC2qLLU7Sc92nXkquiIQNg8xS+QhesXFgZXPry18
         7CjswXpglJ2VYzFKYYnQCI2cdN52XmWC1nlZ2FKZbMVxho5C2xAj/6XVRXRYcnd3Pxkd
         92Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187693; x=1712792493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1lL5f6yq9LaiF8GnxAfpEDQQL4kAkav9nCQOWb1C3Y=;
        b=pzWno9j9MTDtVxDvD5I06LC26dQhaAN/aCUYfnT+6JKSAoa8bHvf+v6ZDZNW8J6Skw
         0fsZNBqQzPIkg5mWRIadVvzAjJguizoaykiwWyZs6mv1VEMGm1Jc7+uPCGVfhtYp/yIO
         fIyR76qRcEFMSjOgZPHqt37jkTSBIEsvY0YmHUyDVX6ujP9jreUz8ZLQDSCAe4i+GL9y
         b3TjqjBNhdbDVxt3aEQDT8ZWM9/6fPZBcydw/Fl4ND2loyJ1ZrPviB2E3EJpjfgHB525
         bSpsEysEtmwcKjHSZ7g4C1Uyq1h6gZSbU/nUA2UyMIokXwk8OdYTtV7pdals0MuqPh8u
         EgGw==
X-Gm-Message-State: AOJu0Ywe2tIQFeHaXzv0Of+qKBCJGec8QUICTysUxfa8yG1uhvMmVenx
	Y2OX+GANVNbvA1zAHWOUB/oMsnLfyY9OHwrTbRoT525fHbdWbdY52k6aH3EmIYc=
X-Google-Smtp-Source: AGHT+IExKU8/z/0Uf5Y5wAMW8Wut8qP6zJCIHgHh0jSkN2g23nIAgrJWZfYYYsTzy3HfTPFShjsbrQ==
X-Received: by 2002:a05:6a20:de16:b0:1a7:1df5:1699 with SMTP id kz22-20020a056a20de1600b001a71df51699mr975407pzb.27.1712187693134;
        Wed, 03 Apr 2024 16:41:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:32 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 01/29] riscv: envcfg save and restore on task switching
Date: Wed,  3 Apr 2024 16:34:49 -0700
Message-ID: <20240403234054.2020347-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

envcfg CSR defines enabling bits for cache management instructions and
soon will control enabling for control flow integrity and pointer
masking features.

Control flow integrity enabling for forward cfi and backward cfi are
controlled via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and
adds logic to save and restore on task switching.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..2d9a00a30394 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	register unsigned long envcfg = next->thread_info.envcfg;
+
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
+							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
+							  :: "r" (envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -80,6 +89,7 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	__switch_to_envcfg(__next);				\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..a503bdc2f6dd 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -56,6 +56,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
-- 
2.43.2


