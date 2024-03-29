Return-Path: <linux-doc+bounces-13097-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963688912D9
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DB2528A874
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A7C56B99;
	Fri, 29 Mar 2024 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0eaZ3ofs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F158231
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687615; cv=none; b=cK3WckF03f2jaao7+/GsEm0K5OCXwfh310CFsbdzhwMHCT134I/A1LoZBZZhIjV3XkgR5JQGAaAmVU/ozVwYbZKR4SWvk0FEhW8W25yHyYVmOQPeOFLPTxMwhn4AG5fYFAMIF9afQbaNC9G2dNEhB0hOYFeE8Du2i/O9R5HNp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687615; c=relaxed/simple;
	bh=pKLFkKzJOJ8TVEvV0fhdtvjJa4v5yVb6+o0QMASZ3Hg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FekAYiUDpgVG8YkikZeWzCdDEsW0LDDE6ymo0VDH0oWdAFzMd1dDS1gg/wDqsLHUGxZgUYZsTe2shXPV24LplwIPo+8FZjwdSEAbJ3y4mkNxJlCVbXWyvgNtsh74THEdanyXcL+Ht/bB3Wy/2GIhVX893x+SBEUgOfqc5cFNTWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0eaZ3ofs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so1615507b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687613; x=1712292413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=0eaZ3ofsbWKFgxlqDr3An+QUrLxduM1UOCknLefK9QhY0TdLp0Xlyi+JHsMm/emrHL
         K0RvF2i3TWdR3fUR7t/nk5q6S6xsU/dc0h5jZDITdWBjLXAfwxo+JvRnkp/Fqt1f7HIe
         tOaKmbLf6+MXl71rp0RUOFVsEo/O6CBX+oC9o5CRW7VqWS61Hb1lO2xNWRl2MOg1Y7n6
         QHXjfcD/NbhNPlkg7v1gKXFu2mgu5D99TUwOQk049ymK3tQVJbxB2y3SZRuZj/3LCRfy
         W3EAVLXpwTKt99027+aJbwsn9PiPVxwObnw/nv7ywunkj9FApbK9XjQdhO0MKnceIbck
         BL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687613; x=1712292413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=hCgF4AHY1+eq3SHR1qB8g34aR74ATd/pMEg4ihw1MK1YXvGcTDt2Vd66L1fBqM97ll
         mAF0lORBRmwdOYSl0cZtUF7Z9140Q2fpBh0v1VkdyzTWBZVfPqNxbEGPaHLnPcqCXboD
         xbrTM60r3Y8dPd+X9yCXXoU5P0SrXeF2Mu+x+Rtq/erGEWgAwCRwR0cGBhaNvSwgWRux
         u2PeXRL4+dPvcUckhmapLm9V78h1LP5SMR8+GbnBy9Qtkua2VtcYfAvq7FtF67WnqeKU
         cZCuJHrs+EAYf9kjip6qhUt/oxCv2jr6ZcJX4uim7uNySuZVnFweL5yeADiBIFnbMKGI
         056w==
X-Forwarded-Encrypted: i=1; AJvYcCVnURGTMSJSRW0WCSJc1nw2M9yG0rGU6Tczd5qVSW66jNfZWagUfZO3V76LE7pR/xZTOya0BcUpAf+f87orOxU+sbYGfetBmNpu
X-Gm-Message-State: AOJu0YzmnfvpeWoxBHxz2azMmQkZH5Tsh4MkfKNRgdWuDkbRSCrMyG11
	fikT7fnAJZieliwA9jvDfXazB8G3YwsSWQu09i3IyNCFvyC17MgU4VvyFIU9vaU=
X-Google-Smtp-Source: AGHT+IFBk57ft/Dc+APgv9AeEcPOk/3EIqo0N/RGN7QySteb+aQBmtUdNC7Hb3LMWHIl2juUfBH7Ig==
X-Received: by 2002:a05:6a21:151b:b0:1a3:dc13:9146 with SMTP id nq27-20020a056a21151b00b001a3dc139146mr1392928pzb.8.1711687613465;
        Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
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
Subject: [PATCH v2 21/27] riscv sigcontext: adding cfi state field in sigcontext
Date: Thu, 28 Mar 2024 21:44:53 -0700
Message-Id: <20240329044459.3990638-22-debug@rivosinc.com>
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

Shadow stack needs to be saved and restored on signal delivery and signal
return.

sigcontext embedded in ucontext is extendible. Adding cfi state in there
which can be used to save cfi state before signal delivery and restore
cfi state on sigreturn

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..5ccdd94a0855 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -21,6 +21,10 @@ struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
 } __attribute__((aligned(16)));
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;	/* shadow stack pointer */
+	unsigned long rsvd;		/* keeping another word reserved in case we need it */
+};
 /*
  * Signal context structure
  *
@@ -29,6 +33,7 @@ struct __sc_riscv_v_state {
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
+	struct __sc_riscv_cfi_state sc_cfi_state;
 	union {
 		union __riscv_fp_state sc_fpregs;
 		struct __riscv_extra_ext_header sc_extdesc;
-- 
2.43.2


