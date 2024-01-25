Return-Path: <linux-doc+bounces-7474-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C483B9B8
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 07:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48CE1B24E5D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 06:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8031171A;
	Thu, 25 Jan 2024 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MlBNrdFr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D817543
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706164152; cv=none; b=CHUnO8Cgl7Iueg/6/fadm0x0BgCznyH1gYzB9ErZfZCmQ9WMvz1gQWsCZEkrsDcBiVl4jsZIWHjWYvuekpCak4GkmbyI7f72Fo5uDwGGG8W4PprDr3OhOvhiyf69PvjrZWTfGkkIQbWirMe5ASZQ4A26JzvaUWjUi4eMgJfHv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706164152; c=relaxed/simple;
	bh=YOP4K+DKiAnz0Jji3XIKk9AXAI7kwxzmy/xw9j2XMaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3awepzETPuXz5n0CDZTQG3+UN/RfM7duHobcexHqJen6WdRcl34cxpQ4qOI9/O+6g2SxSmE4aIgmSU3FoUkT/ObZyeTC/Tty20WTyv+jUGk+NSDt5XAEABQDgK6FKlDQgkHo00X1fSqMRMUsLB/CdRJhJmzJaopV6Ljc/7tWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MlBNrdFr; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso3058156a12.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 22:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164149; x=1706768949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqhJyw4qKw6ttxWAjpEt4kkwqgUPwpH+MlNDa4SEbVQ=;
        b=MlBNrdFr+fR3YH8tCDcoaZrtlQXY2vJ/kp93E6iPWe+2KHu2cw6AbUhU7ZxfTmkTkd
         ygtOZp9C9ROUq4wfplrV66IEj2MmW1wRuLCNEhKUvmqeOi6sOBlBgz9V8thCzMsqCHZe
         03wx8KwQwC/Wc+S0d/Sj/zMwq++jCO/yHFFSx8ywUIzgnUQxB2VlF+89d630ChOZgPme
         gAz0W+7Ma/Jqf+pqW3bmvezEh3TYLiTNc5smiCuvvZaIwFWsdjfDNJp4Ge7q83V2km0t
         FwyluvEBgzx3n9RSa3JgngAe1kUyWhtLMZeezz2bAIDIeQJ5b04m7yNdxR3EMpQV4Agu
         5VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164149; x=1706768949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqhJyw4qKw6ttxWAjpEt4kkwqgUPwpH+MlNDa4SEbVQ=;
        b=OcwI/YlXINhN4KH/4hkc7OdTBjzjcRi3XgMwOVpDEsNT0jO0fclO0T11CwQrbH6nR1
         S55WkDWSavHCFbpoTfvhiNPM1/0rRowkwa5JnjMl2LkJPmomBspqPlh4AdFyRzPj+hX8
         iSBOq8xwSU+OFue9n2TD7FGFA9EENYSf642j8U5JhIUwz235kjZ19ollw2owGPD0GV0v
         ai73C1Kj40u7LrTqXU6eoV26N6p4QpORfoLGLYlztSQOMM4/FF+j4c0U05ixhnvrS2jr
         n3kc+Fs1kKnokiu99xjjBqr96kmydtPKHRLa7UouHoTPZdQQzyN8z0i7VRs0NQAERYGM
         dTQw==
X-Gm-Message-State: AOJu0YxJn9GRC4NzZxZbJ/WHX3p0jcr9UOC1rl1LxwwNXeFyQwcI9x6O
	usv7zWmF65kl1jFF+HxQbLZqyXr7MZ1eUKfwGJAb2+SWDGrxyqMQ57t3ocNr+jE=
X-Google-Smtp-Source: AGHT+IEl63VLMXT2mHqAciM7L/Xopf+jIyT34V6he9kHeUuUlxwxwREqJzJ6MMes7H6nQTQcNzI7AA==
X-Received: by 2002:a05:6a00:2194:b0:6dd:c69f:1e31 with SMTP id h20-20020a056a00219400b006ddc69f1e31mr202939pfi.51.1706164147768;
        Wed, 24 Jan 2024 22:29:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:07 -0800 (PST)
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
Subject: [RFC PATCH v1 08/28] mm: Define VM_SHADOW_STACK for RISC-V
Date: Wed, 24 Jan 2024 22:21:33 -0800
Message-ID: <20240125062739.1339782-9-debug@rivosinc.com>
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

VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.

x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
arm64 follows same path
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

On RISC-V, write-only page table encodings are shadow stack pages. This patch
re-defines VM_WRITE only to be VM_SHADOW_STACK.

Next set of patches will set guard rail that no other mm flow can set VM_WRITE
only in vma except when specifically creating shadow stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..dfe0e8118669 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,19 @@ extern unsigned int kobjsize(const void *objp);
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
+#define VM_SHADOW_STACK	VM_WRITE
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-- 
2.43.0


