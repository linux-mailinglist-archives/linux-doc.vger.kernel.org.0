Return-Path: <linux-doc+bounces-25149-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88A97754D
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 01:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9A5280DB7
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 23:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314AF1D1307;
	Thu, 12 Sep 2024 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BlJsdzHR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4F1D12F7
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726183120; cv=none; b=eD88f8gUJr2Ynbc+9nIwUhDZ57JNkizL/UDMm0OOq8ML59wAuEllnydZ1Es2yneJFxgBXfMtjTcNb6jYt4cJs0NxZIJ88zPpsUvNWwDUTVWpQZc2IaGfHCVRXp1X46svyt/aSutrdSFefKdwU+2x/C6kaSnfF+NhsoZeJBK0Dx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726183120; c=relaxed/simple;
	bh=yQYiUmfqTRCioslo3W5iUAP/mU0pJb637UjQT2Bf1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui4RQNBQUHL9SNefMrk+ELxLy01xIfamDyPJtPIQAZnQ8S9cs3QS8XFSibBbiPMgHGlX25dDHD0udVu5D2e+topONod2wvG8rhr6gQoAqbicubXEEupNpM9QkiH6Mc1SFEBFMWHci0BBHkhnypp3Sb/4lbARAWywAenv7RuRTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BlJsdzHR; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso1405021a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 16:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183118; x=1726787918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXfnoEa3i1wyQd1F0z4P7UzjOQKWsjZf9fduhQBzJq4=;
        b=BlJsdzHRGj0IkIcmbrmxCujp+CO5ipWjR503LU13t52RCFpsj8NzjjP2Bmc0pY6EnN
         zwT4NCf313fQ6lUna0fp0on/LBGgBZzHx75QOZlXGFEFjI9OYlJwg8DncAEAg5U+xacx
         bnCzNEgh8BmEltI/VEIO5ygtpPJ9Nne45+KuhYR2JnXlBH+LW/bH2wD3J33J+fHm/oA+
         gG55DpT5Jnft/e6EqwG+eXDBW9bWygN6DDzGSdTAb+yPcJXu1m9FGpndFbDgd2sPLWry
         +JM6hYibU7kJc5iYtor37hkKRtPWyZuNjC6ZK9Yx/vGjFkrIsVhLd/m4AAsfPKqRX8Iw
         LgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183118; x=1726787918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXfnoEa3i1wyQd1F0z4P7UzjOQKWsjZf9fduhQBzJq4=;
        b=cYaZiFvF671Y6Fq5atii1OfFR55SgdYYw+OudG26NFFXhqhwJGUjyFH1Aqt9wIcFkq
         QanxFB86bpZOcne34GnwWD2RUHl1RiygxH0BULwaQ+r3w7G25ON66wAl48g31AFh2Gtj
         KglS+fgOwSZZQOJAIurR+9Zo1VqE/Mf6hXpkD+jaWu7BJiONoHwdZj14UeRoQdFtD3rb
         VIIKQOHs7lK0stwZJo7vTt3eUJ2E5/kxVAWULaqEgMS1jpaJJLhQUThONhAD69HsM02c
         X0wzuKaBwFmX2ihXAr26ZIGh00f0zHnBGgg/s8NTjLk5BmkulY5nzlxBWmGoNszzxd2Q
         aUuw==
X-Forwarded-Encrypted: i=1; AJvYcCWWT3d6OfswdaqerEoGiD9e1bTl2avje9ccgoiY2NIXndutOJ1of4evh+ixGB5gO1HSS/fJmrbIbpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAD0FJteNHrahf0oHmOdO46ZMR+PYXL78dab1bnTcJkOKP3Ack
	I/1sLw/xL9JB10KD/Ynn90u3T6thmCeqNsXgEawhYn/dTZDnRhfYqZuIBu0psqE=
X-Google-Smtp-Source: AGHT+IFuYD8h65+1U6P2mbP/p4Fa/VUP3aMNny81RffweMyQhp3hs7nPg1eND2jqWBezKJj0ChZXLw==
X-Received: by 2002:a17:90b:1043:b0:2d8:aa9c:e386 with SMTP id 98e67ed59e1d1-2db9ff90b77mr5493054a91.14.1726183117828;
        Thu, 12 Sep 2024 16:18:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	krzk+dt@kernel.org,
	oleg@redhat.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	kees@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lorenzo.stoakes@oracle.com,
	shuah@kernel.org,
	brauner@kernel.org,
	samuel.holland@sifive.com,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	greentime.hu@sifive.com,
	charlie@rivosinc.com,
	evan@rivosinc.com,
	cleger@rivosinc.com,
	xiao.w.wang@intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	atishp@rivosinc.com,
	sameo@rivosinc.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	david@redhat.com,
	libang.li@antgroup.com,
	jszhang@kernel.org,
	leobras@redhat.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	costa.shul@redhat.com,
	bhe@redhat.com,
	zong.li@sifive.com,
	puranjay@kernel.org,
	namcaov@gmail.com,
	antonb@tenstorrent.com,
	sorear@fastmail.com,
	quic_bjorande@quicinc.com,
	ancientmodern4@gmail.com,
	ben.dooks@codethink.co.uk,
	quic_zhonhan@quicinc.com,
	cuiyunhui@bytedance.com,
	yang.lee@linux.alibaba.com,
	ke.zhao@shingroup.cn,
	sunilvl@ventanamicro.com,
	tanzhasanwork@gmail.com,
	schwab@suse.de,
	dawei.li@shingroup.cn,
	rppt@kernel.org,
	willy@infradead.org,
	usama.anjum@collabora.com,
	osalvador@suse.de,
	ryan.roberts@arm.com,
	andrii@kernel.org,
	alx@kernel.org,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	revest@chromium.org,
	bgray@linux.ibm.com,
	deller@gmx.de,
	zev@bewilderbeest.net
Subject: [PATCH v4 21/30] riscv/traps: Introduce software check exception
Date: Thu, 12 Sep 2024 16:16:40 -0700
Message-ID: <20240912231650.3740732-22-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

Additionally it implements a cfi violation handler which checks for code
in xtval. If xtval=2, it means that sw check exception happened because of
an indirect branch not landing on 4 byte aligned PC or not landing on
`lpad` instruction or label value embedded in `lpad` not matching label
value setup in `x7`. If xtval=3, it means that sw check exception happened
because of mismatch between link register (x1 or x5) and top of shadow
stack (on execution of `sspopchk`).

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
SEGV_CPERR was introduced by x86 shadow stack patches.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 ++
 arch/riscv/kernel/traps.c               | 38 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..4068c7e5452a 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -39,4 +39,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ca9203e6d76d..2ec75ba864a8 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -384,6 +384,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..32d1453bed72 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,44 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if (((tval == CFI_TVAL_FCFI_CODE) && cpu_supports_indirect_br_lp_instr()) ||
+		((tval == CFI_TVAL_BCFI_CODE) && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+					  "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
+}
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
-- 
2.45.0


