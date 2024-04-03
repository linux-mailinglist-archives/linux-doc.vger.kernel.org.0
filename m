Return-Path: <linux-doc+bounces-13459-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C0897C7F
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 01:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4586AB2A278
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 23:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B461598E8;
	Wed,  3 Apr 2024 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hcRRCZ/o"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7393157476
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187753; cv=none; b=YNCdSKwrb846iATobvgpBrdbv4w5p7Sw5zie5/YfWo1pY41Um/Shjr5yIL//eWextpkfbesdPRIqhccBEtFjp5JZ4lncpkDgB17rccuHGrKcsStdQlBWVCgoD4j/v1Hw+n1YrOHim+Yqfj61OlLNXoAzCPTyjqyBRyqU+fWw2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187753; c=relaxed/simple;
	bh=+UdJVnxzhmL2rdbI+oZOPCA50rkIsX+rxI4MUuund6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqnmFvjORc9G0DhKVTlJGOn4i9zmVyPFsf6ggIbZ+chvN/XOkVbrrXTBew1XLpRIqH6BsJ0G9x+Ib+OlRXi6t6R/YtIT0rIN3Si1eWqoQIYnMghVj47Val38wHvWgNU09pTpWlJnh4+CIs39gH1hy6vDL9A6XByQ8K1/x3jfOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hcRRCZ/o; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e2235c630aso2253175ad.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187751; x=1712792551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSiG1xhiflfyI9bPxIgqPsLfJsD+ZxoOiAqpJ0kRoxs=;
        b=hcRRCZ/o9lYHMulcB9q8PwWpcv9PXJNWRi3viSgowhd9ObyUXJdpqvwbCCa7m2kRi9
         2skbIqH52jYKm4bftBNANkcezUv7bfpamfL7bCZZsCDW4/2876HeequmTQXmHrn48uZ5
         NLLTcd/zo3JBbBMkKXDbBgHMqsJusiw9I+idCq48BYWbq2s/9+ZCivPUpPJw+8zRujFT
         E37QRbZAj4A7gG52o0sFHqjPUXD73arbeAOEAcjDd3x7SdACh4gnyKobMP98+Tbj2lEX
         sBYCcYojfIbeMW1L/RUTtvdb1aa1VtbOLN2C+PlSKwmARrHFxzP9HcIwK5wAvkvrD710
         K4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187751; x=1712792551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSiG1xhiflfyI9bPxIgqPsLfJsD+ZxoOiAqpJ0kRoxs=;
        b=ZUdRkfnk3jKE2NhLzVqWrDuLyZ/93xsZHRYt0RGCLCC0u4uY4NzFJqDxG8g/NrAKwF
         ABb8HUwaj0h0gFJUBWRKwIX8/zMj3722RT6QgbfuSwZhJE7hX5yBDJ79YbtyFMpjEtFA
         IzyegovsfSQ0UZHceR9w+YFx6gmF9SYrmD5SVUtbJceRW/Jyw9vmPN0g6d0KGwfssHvd
         bRawqwjoLYnMe5vSkefryv+I9mkmhgCZYeIupF/X6XzmLXOW/MS05qRMKt4xj6441mFC
         Z5MPi+v6NMztLeXPzrwvX9sp5F4Jn+CgomcHmZDp8VDSXHLt9MAzoz0TIbO1Zw1klb6J
         60uw==
X-Gm-Message-State: AOJu0Yw5QErQ897JIBz3I7+9SRNjjxZA3rIflIj4b2iG9XMRNeCIWwDp
	19m37QC19wV2zBduOtTbogdCioIzeZQoUifTijhnCqZW/dsu5aicjmwkmHM5Q44=
X-Google-Smtp-Source: AGHT+IFMW5tbyyAjWJEE1nX9dbuRREm7VgmFXgOohN5Mrb4B/RniQlSV9gFzsZCwXmsG8xWhwnLhWw==
X-Received: by 2002:a17:903:487:b0:1df:f6ce:c9b3 with SMTP id jj7-20020a170903048700b001dff6cec9b3mr824638plb.43.1712187751469;
        Wed, 03 Apr 2024 16:42:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:31 -0700 (PDT)
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
Subject: [PATCH v3 20/29] riscv/kernel: update __show_regs to print shadow stack register
Date: Wed,  3 Apr 2024 16:35:08 -0700
Message-ID: <20240403234054.2020347-21-debug@rivosinc.com>
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ebed7589c51a..079fd6cd6446 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -89,8 +89,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
-- 
2.43.2


