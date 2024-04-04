Return-Path: <linux-doc+bounces-13441-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A265D897C20
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 01:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184AB1F21F82
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 23:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3753715748E;
	Wed,  3 Apr 2024 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gK2BR1d+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2E157464
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187698; cv=none; b=vB16jgu9vwQ9+9SmJSed6zzmMt9hRR+x/2DAbf78km0Qwv1s9TCfbuzJt796L1JQKCLBYeVQYqoyteiZkFf97FSzVNfU/oJhgHuCTIhcpPCTPOjXdWMTBayrpevg+TuU5ZMJGIrv12Omikvotyw5WT19XbJGUe1cZSF2813zRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187698; c=relaxed/simple;
	bh=VB2jbs+vxtDiHVEwV3s3rhPAS0B1SvKfxXhLcO1CdzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEl7ZbywFupvSSNUGq7T4crBqe+j5PghML6rlvlhyLaXE5z5gChm1ZUyN4FiUhvMx8hDlEE+u75bcj1xnH70CV87DSjZAQI5+hl7W3GFpzqQr7rxPMXOd8jbLDQvNiXrjyxKkpQ3yGdEowotpkWAW7L98NwXH9I4AmRWTxtFX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gK2BR1d+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e0d82c529fso3639535ad.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 16:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187696; x=1712792496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZyd6VrWHdcQvYv7dwWjrHMr68qSu7kdpqu35DQkCbw=;
        b=gK2BR1d+gUQUJbiA8W4PnC1mounbh0xMQUgBh4uErfjreVcOuiGUP33GkFVzvNS8r+
         GoHmtE59N3UtunnPSnZv+Rc0csLi5GTNSrfA9cF6xirJeZi05R6RFBoq6gttct4d8PvW
         gqtv/aab8xl837kogFoPGogxsSOYs2yyrC90Vig597+GIF7OiR5++QhQrWOTPpPlEpxK
         ua/DAfGOyth4DmxBO2UfUhLIRVhN+RVzd5qb7M6KBvanBYiq4K3ZbluO4zqae+dPpM3y
         16Py30Ow9jteJl89gS4hWe7QevcS5v9alGxexgXk4+bqbqulsvnrEO2T9Wzs1CuiWtiJ
         pcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187696; x=1712792496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZyd6VrWHdcQvYv7dwWjrHMr68qSu7kdpqu35DQkCbw=;
        b=j+VSPMA7lYjJO6hZ2OdHZGFRJH8VjRegQ5ddIvqtkHfsIBskk31qQWc5Za5wEwrjwJ
         C2nlVoX+1Zn7KZUcXqiaHqndvH4UIeovs9k18B5q7BW1T1X5IoUcvkhbz+e65szzQBHL
         4+ErxjEeNrTBheMghAAK6bTRJWegwsQ20D6Lk8yqrCFV/wQs3MEQlMcp9GHe63YhFHia
         nbaM2ZM9+pX9f8HGzLkxZdBNV3oiwVHGi67HNAWYu/fMC/ri1PqE7IKKl+LKz/FXBzxK
         gmArQOISWMhfAM5PlvXupppNv2CkUB1AmEsj29mnclQv25kW37DCFjLkaSuES8s6S6bZ
         XTtA==
X-Gm-Message-State: AOJu0YzS5Z3GVJ93jxi9I+BcfNF/125Z2u+8u6eBlr9oFW3agnslhLnO
	a001Ov21Agr+H3boK7lPrQpJMRoI9dJq/TMK1gb/eLLy0sL4eZyf4cdkZcbGGXE=
X-Google-Smtp-Source: AGHT+IHZ1DeudjBR3oiYEW2qXm9zKF1SD2kfhoLrPxZT3yYrf04a37H+jHkRe47joBAEcaPm46pZuA==
X-Received: by 2002:a17:902:778c:b0:1e2:aa07:37d7 with SMTP id o12-20020a170902778c00b001e2aa0737d7mr551009pll.22.1712187695773;
        Wed, 03 Apr 2024 16:41:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:35 -0700 (PDT)
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
Subject: [PATCH v3 02/29] riscv: define default value for envcfg for task
Date: Wed,  3 Apr 2024 16:34:50 -0700
Message-ID: <20240403234054.2020347-3-debug@rivosinc.com>
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

Defines a base default value for envcfg per task. By default all tasks
should have cache zeroing capability. Any future base capabilities that
apply to all tasks can be turned on same way.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kernel/process.c  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..bbd2207adb39 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -202,6 +202,8 @@
 #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
 #define ENVCFG_CBIE_INV			_AC(0x3, UL)
 #define ENVCFG_FIOM			_AC(0x1, UL)
+/* by default all threads should be able to zero cache */
+#define ENVCFG_BASE			ENVCFG_CBZE
 
 /* Smstateen bits */
 #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..d3109557f951 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	else
 		regs->status |= SR_UXL_64;
 #endif
+	/*
+	 * read current envcfg settings, AND it with base settings applicable
+	 * for all the tasks. Base settings should've been set up during CPU
+	 * bring up.
+	 */
+	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;
 }
 
 void flush_thread(void)
-- 
2.43.2


