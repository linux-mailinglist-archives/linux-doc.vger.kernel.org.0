Return-Path: <linux-doc+bounces-7488-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC183B9FF
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 07:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE021289B64
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 06:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624721BF4D;
	Thu, 25 Jan 2024 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cXZM+H2l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91011BF42
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706164220; cv=none; b=HgvDj07ksec9i6zwWaQvnFB0u9xZhSyVF5y6e0TEMuCV1XWrA7279pl7d0a6iU1QbtlEqDyrvKwDexGQvZMC/6ZnynzupS/I0pdoIui79T5DK9T+/zEAV5DIhe6VT/y+Jons4tKyozlR+QKiJmVTSpWtcY7s78rRj9fnWiwtrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706164220; c=relaxed/simple;
	bh=drWNP+C3RFId48CDnNwtwPxYu1mXt8WOEYQaNRSm07Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh8kxCUcJwMlYMgaQHVphZ4GK6pJ1y7N4tU42ct3k5CM8gjnKUZoNdhLiG6tZMKBQy2QJcqE0tPIYKQX5t5+u7JKdyoeTz/MsAFtR7Ok7/N/PYTew67Yjw8bYxQG49Cr3IaJew24aouiC9PWbF2CKYdX8AyD8bJ8KoPlz8NLhMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cXZM+H2l; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-599d1fd9cc1so705827eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164218; x=1706769018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ROIIq+tfSuVQ8U/gtdFWUWXai61z50x8X9vsARg+kI=;
        b=cXZM+H2lpHfaoT215v6JdSm7JkoLHducq+lN37LmAIDTN/7qX/aplYulx8qFSVnFAy
         L8BTAKPymi8ePF8ZYptgSifjuH3aFA9DMVph6diozc93qfdaW5+w+2CUfP+ZZJk7ZKqu
         5fcssep8LSD4YoF5iEsXtTdiCcBgoZ1rq37Lkrpj2Q7OJNW6CXRuTOFMCEbgSUJLd0Nc
         iWRsEqSZ8tVTYn7dqdKTiA5HJ1E8gVdAfTWCzjIV4DoEZ4PgVciw8PNeap076tWMdx68
         trpdBkpXq4ZIS6cdgX4cO75NUDhz0IcfRIDtUzMV7A7901ZANsKYEyyDzoYITxy6Rq3r
         hXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164218; x=1706769018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ROIIq+tfSuVQ8U/gtdFWUWXai61z50x8X9vsARg+kI=;
        b=F3WhXMdSDufOEekkxLHDaxiwHf19FXUKjt2J9mXox3JI8ROXhRvysvXGr+CWZ95Wq8
         aXwPRwT4BUDnTSoaa9S5DvrRJ6icv8CLLo5IA6aS82H8Mjx5aCXUIOcRbZST1ApMtc9X
         5kQcfgkC9ofU9haJhhlLM4jm6mYYt95/OpycL/tHXgcb+QuTEyYgBdKPZbFJjr3rN15c
         30dPQJfWQQzYOBfHvXrQ9vDqjS2mmOc3u66AMZxeF8okJVhrvS79GijuEJekqJbb9bEP
         Et/AayDXpwEA6RojvPyX9ntdDuX4dKaRbfwesz8WlSozLg+nlHRtBJPKUKrJo6SKskIc
         79Hw==
X-Gm-Message-State: AOJu0Yzr4ifTKNhmupv28l8+ZxUoKWFf6HFq73A/Hr+hMSTiBIjXaBws
	g1XlUyCzyIpdpCnBIvR6aKmPL8ta8n9zUibeaTl1IQCcB6w9wAi94J3uzlM1i0o=
X-Google-Smtp-Source: AGHT+IFCTO1aRpreluHW/C5C9tNmtfREjRA/JGLkNEyuOfgIi16e6JM3wL9ZmcIo8frDDBAlk8/Blw==
X-Received: by 2002:a05:6358:94a9:b0:176:1227:8735 with SMTP id i41-20020a05635894a900b0017612278735mr688376rwb.58.1706164217947;
        Wed, 24 Jan 2024 22:30:17 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:30:17 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 22/28] riscv sigcontext: adding cfi state field in sigcontext
Date: Wed, 24 Jan 2024 22:21:47 -0800
Message-ID: <20240125062739.1339782-23-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Deepak Gupta <debug@rivosinc.com>

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
2.43.0


