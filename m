Return-Path: <linux-doc+bounces-13079-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C151891281
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FF301C23CA9
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C773B1A4;
	Fri, 29 Mar 2024 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PFSrz0GA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C283A1C7
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687558; cv=none; b=ovWgVWCpgmYpzz7MxZjoaSFCwjtdNpixab549vnPBHGf8NlixvgkcCpOMVngJjM6InOecm1kry92+J5qx4LFXzDXTl4AeeN7y/EbhS8So8c5UwIg4h5CueMHblcWS67tNhXGteiM/EQw4RzQIenXBm0kkjPsurxvaxRDlC2vCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687558; c=relaxed/simple;
	bh=vRWXVEM9xb56Q7Mqdkjo9sVJAKe9N+KayoZj+4xiEu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ImYs/MMeMn5eWCZgKCn5HqIKpChXgxXttjO4RGYTGn5vv60qgP69btfJMBuU5CAniCsL6pXF697TUdIsQ0yWl48PopqA9dPXwm6cE/F9RDoHuV+tMcN4/yVAS88VgHxcLnK/tzJioGw2nUInn3I1r3psnkFNEGyOUftUAizP/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PFSrz0GA; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e677008501so1009083a34.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687555; x=1712292355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qng37K3M8eikqBpPaGOFEE/tLaKw4gdTCP/Sk21HmlA=;
        b=PFSrz0GAlS1qzLSphEL23gAKOoeuyFLtO460hM2DUsZ1Wtj0OL/2SfltZz19LMce7g
         geeWgOmdboFMxPHDA+cDubL4AEycxll8vwv7FOt3eFPUfARBRZtBeBrKbc2QxFpnPzuf
         5gBq9atL0zBkzdNOn6sEjiJ+PJ/nhwLjuYffRuefY7MkmVMAcCO0KQD2Wunf+8oQmR24
         aQ0S6xhJwNKfI2lFRnwuDRxf6W1JnkrDj7m8SR5Za657/8cfFYfNBy3wtnIJ7IGx8ziD
         hUl9YERhTrhc+2dMglZO2kCrJOT4a7gtG+yBWQGPnI/irNLvZoqbVJLThXJFHy5fKU4l
         3tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687555; x=1712292355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qng37K3M8eikqBpPaGOFEE/tLaKw4gdTCP/Sk21HmlA=;
        b=mk313AGlsq1ywm7hFTa9pLsZ3cFMgnZdNglFV2eXt0G2BW4CMTgy6vWBgjGSd8vQgj
         S8H543hT36v5XoOs9P1sFkc2TDvobWgYDGaOEV4C2BxvInZ+xu/N8Uuuy4DEctdMrBRV
         +VWlGuNrt5nTf5SvcvqpXgY34UmOhPQcXTIgUzS9lY0b8m44Ng698W1QW9DabUKpa88V
         ujdGvZeUKU5zCtnPkzufyinKeB2zOtAAaApeNE32gKFKWJMxvrWfkNFNiwfxlbdIhLeA
         +9v84lqH46ucshvBLUhas3zhCDanLf+1tQuCcusGfR0IXo5BOs07q2xl1V83sACJPUnw
         wfLA==
X-Forwarded-Encrypted: i=1; AJvYcCXDIVg2yuaMd3HmAqgdakpZau0dQ1A68ID/ndwN5pDufiM0F4utAMSAR9pgFHdlAT7X+q1uLHNwb8nwOB1YB71EB2maOjqW5EdG
X-Gm-Message-State: AOJu0YxYKrmobGyEsJJ2MCco+9lQK4lm4kK6OV/lkUYvDeltxDW768i9
	lUEpzUtSx2alY4vEx3ju3rf3JzuoNf85lyZtOcFCc2M1fhqtB8YcEzNbelp6iqs=
X-Google-Smtp-Source: AGHT+IEKOjTE3dTftWOMe2SOt89v3AzQ5X6q/KOwkPfLyYHAC9S2vY+NFOYACNL9schcS27A//V0AA==
X-Received: by 2002:a05:6871:4096:b0:229:9cb5:4fe3 with SMTP id kz22-20020a056871409600b002299cb54fe3mr1713256oab.14.1711687554880;
        Thu, 28 Mar 2024 21:45:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:54 -0700 (PDT)
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
Subject: [PATCH v2 03/27] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Date: Thu, 28 Mar 2024 21:44:35 -0700
Message-Id: <20240329044459.3990638-4-debug@rivosinc.com>
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

riscv will need an implementation for exit_thread to clean up shadow stack
when thread exits. If current thread had shadow stack enabled, shadow
stack is allocated by default for any new thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..7e0b2bcc388f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -149,6 +149,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 9a85c9d4c902..d864eef5a10d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -195,6 +195,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	return;
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
-- 
2.43.2


