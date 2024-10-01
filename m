Return-Path: <linux-doc+bounces-26148-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFC98C2FA
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 18:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5371C239C6
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 16:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F6F1D0BAE;
	Tue,  1 Oct 2024 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B7BTv3sd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082901D0B9D
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798899; cv=none; b=qxAAUAffHZZ2Omq9YAngdAm6UArR9b9t7oYZfcGXYAzQ1eb0otbM6NWFnR+7eFg5AOXBBTqkX6xOrDFMsshOAlkQOa+M85heAhB0QSjowHEeqOHDBPxvldsBvfYan8GDnPIApLXm+QbE5OKrF8wDUqjuQrrbImeOioozsaly/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798899; c=relaxed/simple;
	bh=mBtuw10GlZPIxd2IoPDLCzoGBEu9fwLoesZo541Ti1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5oh6Q8ELSwPWXAyDGJsizJ8kGwI0jXR4Eery48UJYeXkJq4FmN522uZS5engAuKFVNceRith5xCMUCyFVfvGvCNlSTpw6Lo1eGofvXpqdzZMXw9LY2ehkiCUJXLrHye769osy//Zle5DAl6ZoaspdtX0d6rtmkhdrsxtT+AukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B7BTv3sd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b5fb2e89dso22851645ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798897; x=1728403697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xdKLFU+R+/xaPo3sKfaOPe5nwRayI/Mj3nw6nC0RbY=;
        b=B7BTv3sdh11qYB2fn0xFqJ+B3p66A/hjo7GYfSQyMiZGddSJA0eVeExjW7ObQNK03D
         ftmSxbBIVeC+N++Gh0NA4RnNNvOEYqAKUxPmbakJPPjE3xrfqsQju3yKon+X3RvqogJm
         e0xwy4HS6JG5DUG0armyxb93cX1d3nUAR4XW1nmojm3+qU54fiXDbGsp7ZKR0Wa16mzW
         p3Y8ucgEKWoJEm+wj5kKn6+1nxe9Or/n28mWIJ1q1ArI/TM0jQVPueaItrIDSES7IfAJ
         dchBeeAmL0aSRuA749mahnnmL/QEg9rvwkMDEUvRyzCd1Z/4JKt5FEP2OnpZLFM/OA3w
         36Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798897; x=1728403697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xdKLFU+R+/xaPo3sKfaOPe5nwRayI/Mj3nw6nC0RbY=;
        b=mVxbfYLgf2l4XLkvk6uLkj9PY3k8Xn/09tVttXWQLzWySCSDp2CGiMpMIfNcTZjt7/
         Fff+OTBI/PilYWE7slrZmFgzybqk5zt6yblUWauL2uGzz+dg9GoZ1+x053vLnoWle3Nz
         zRW/LTrxLI7kYcmRP8FCy+HiBy7WOQ1Pn4Td3RGtFUBpp719FilnNRZCXYU6pnkKcYj0
         Jw344zHN3nNKu1P8HfXyAxEKbQDr+pDfSryDh6F0l+gv1EoaK2FersTZbLCnqzWnEbHQ
         AiQPAas+0Sw0IT/NSr51kPDusn+YcOijYrLu/22Ha8nmETqY118G599IwDPzf9GG7+aX
         PzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWagJZUiWJtnxRSwycO1qQ42plu73JKrLLUek7DSK5eHebI4+P6MedTQahJdxrbBSqjQ2v+z9LRNGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKXQAzBhSOia2zj0Hg5U+GPDoFhPaqA5aoiIzRgX5Kwrvq78iI
	nr0XlP2c6ZWsucOOU8lLyq3UhHuW3GYvE6Mj7atNPI9S/EiRC72s/x1+q8Yl+rw=
X-Google-Smtp-Source: AGHT+IGSPOS/rjJlw+fxdYuzivcwlYhVRY55jtXIOD8f6jn9tgzzpKbZ8nfdXLTRzGnEFUMQVR22nA==
X-Received: by 2002:a17:90a:f494:b0:2d8:8ead:f013 with SMTP id 98e67ed59e1d1-2e18452dd9emr235870a91.7.1727798897223;
        Tue, 01 Oct 2024 09:08:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:34 -0700
Subject: [PATCH 29/33] riscv: kernel command line option to opt out of user
 cfi
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-29-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 40c32258b6ec..d92b49261b58 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -393,6 +395,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -472,6 +477,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -504,3 +512,15 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n", (disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.45.0


