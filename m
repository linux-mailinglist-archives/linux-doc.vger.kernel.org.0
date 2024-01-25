Return-Path: <linux-doc+bounces-7533-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4915783C983
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 18:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC967282096
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 17:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F5D135A78;
	Thu, 25 Jan 2024 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eDwc1YOn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4476EB56
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706202308; cv=none; b=U+x346S2ahO8xJPtKXD+VX2jXld+48s8TVqqbIY6A22bk5c0IXBKd9Hp4k/doYDsYJR6f+y5U6QNhJGAXBAdyxcYf3BhREGhydnWEOFWw3nkgX35sEpqec/5lu8q9wHWeCkZWV+5b8RqFMdo45eyWp27hQuCzI46l73GJZgB5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706202308; c=relaxed/simple;
	bh=LLkk+XyWSf2hul+3hfadqRUCEloPPAO1nysWo4yOhq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a56bc1AExiEN2yBOlBbxxp0/s9f/B8q1liGK9i5OxqPjhFufuHcOKeGX2eSj1IAOMcAspXuLr7zU0X557JEbl/Zh1nJT1t9hxAmO3UecFHS2d3qckgLjpGbz40mErxcWly6kMMR109EHvFvMF9hpV5SIlP8sSs0K9ajvfuEiS7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eDwc1YOn; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ddcfbc569dso647150b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 09:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706202306; x=1706807106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0M1FGpzVNcThtLlc0xGfB6RVNT85al2FAnsQAblSAe0=;
        b=eDwc1YOnRH9TFFp+t4mhuc7zuHH5nSqW2jYrYcOH6TPR7Pwdtc7kMW75kMFfhf7HGA
         AUo07UOPAm64CDYODvspAHuFQzHJ3JzEyL+Rz8zNtmJLiIPwEXuYvNhcGjzz1GnSVEIU
         Ck0Qi3HQvhvJQ8Osqi1v8O72yTztPL7+yDxevJrwB6SfG7UTSW/xOirebK/a0nDQ29eu
         UvbfVQzMr0oKeZCupZSaE6D+d8K2wEDDBOkhLcG1cpizxH6qK7WL/JvQ9QSuXoAJ7/UO
         oWePVE4QHB4iS+f5mf/V/GSU9xGxcHITVb6kiHBp7bpnLGJ01W9mcdXglkSiq1FoE3ak
         mzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202306; x=1706807106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M1FGpzVNcThtLlc0xGfB6RVNT85al2FAnsQAblSAe0=;
        b=gmYG3mLAP6WwqSud2k1d2KsfHFLgAkM/k6+N/Id5NhWW4wVtJCp68BrNgAn7bk7ZUh
         1J8ycv/IyHllRma7SSHgkuKlqY8Y5qfXaw3/Ri7Au39ACQUzRLToxG/88E7upAWdc4C6
         gZw9Qb0306TGHku9Ty7xB6HP8utyDx33j67SzM3Nnmz7wyypvSryozmHnNvq6B6yTyEh
         I4uYxqpBwtOK6RvF2Smucrwa2+oo4Y9rMaLVCxbXbNmdcR5vTOZ1aPV8ezJGyAkvGhA3
         ym7EvRkyMKh5ZlxxG8MmJnSTMwEZP0EFzDIUKDdDSwtMZ+v2jMqCMhA0HanNpcycKLVr
         GcVQ==
X-Gm-Message-State: AOJu0YwwjKpLp6roz6HtLmN4AUmj0XrZ6eOPsXFuXVpG0dhz+OSzECEO
	slQESksz774CFiAhh+bDMf7rTDoQS4TELMVQw5geDO+Yif0SAxh0lgAP8JIRXQA=
X-Google-Smtp-Source: AGHT+IGut0SQXr9AbScsdtYRLtI9Q1u0TcXDVvdxEucMFGumMjEZ81k2C95PoDlDDNCwCXrQvmnyWA==
X-Received: by 2002:a05:6a00:1a8a:b0:6dd:892f:e2a6 with SMTP id e10-20020a056a001a8a00b006dd892fe2a6mr2044pfv.23.1706202305670;
        Thu, 25 Jan 2024 09:05:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s19-20020a056a0008d300b006d9a6039745sm16078660pfu.40.2024.01.25.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:05:05 -0800 (PST)
Date: Thu, 25 Jan 2024 09:05:01 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 08/28] mm: Define VM_SHADOW_STACK for RISC-V
Message-ID: <ZbKUveOKsT/bdd+a@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-9-debug@rivosinc.com>
 <a6f3ccf5-26a0-45f1-adaa-56a8df569548@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a6f3ccf5-26a0-45f1-adaa-56a8df569548@redhat.com>

On Thu, Jan 25, 2024 at 09:17:01AM +0100, David Hildenbrand wrote:
>On 25.01.24 07:21, debug@rivosinc.com wrote:
>>From: Deepak Gupta <debug@rivosinc.com>
>>
>>VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.
>>
>>x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
>>arm64 follows same path
>>https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r
>>
>>On RISC-V, write-only page table encodings are shadow stack pages. This patch
>>re-defines VM_WRITE only to be VM_SHADOW_STACK.
>>
>>Next set of patches will set guard rail that no other mm flow can set VM_WRITE
>>only in vma except when specifically creating shadow stack.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  include/linux/mm.h | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>index 418d26608ece..dfe0e8118669 100644
>>--- a/include/linux/mm.h
>>+++ b/include/linux/mm.h
>>@@ -352,7 +352,19 @@ extern unsigned int kobjsize(const void *objp);
>>   * for more details on the guard size.
>>   */
>>  # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
>>-#else
>>+#endif
>>+
>>+#ifdef CONFIG_RISCV_USER_CFI
>>+/*
>>+ * On RISC-V pte encodings for shadow stack is R=0, W=1, X=0 and thus RISCV
>>+ * choosing to use similar mechanism on vm_flags where VM_WRITE only means
>>+ * VM_SHADOW_STACK. RISCV as well doesn't support VM_SHADOW_STACK to be set
>>+ * with VM_SHARED.
>>+ */
>>+#define VM_SHADOW_STACK	VM_WRITE
>>+#endif
>>+
>>+#ifndef VM_SHADOW_STACK
>>  # define VM_SHADOW_STACK	VM_NONE
>>  #endif
>
>That just screams for trouble. Can we find a less hacky way, please?
>
>Maybe just start with 64bit support only and do it like the other 
>archs. No need to be special.
>
>When wanting to support 32bit, we'll just finally clean up this high 
>flag mess and allow for more vm flags on 32bit as well.

Noted. I wanted to give a chance to anyone who cares about 32bit on riscv.
Will fix it in next series.

>
>-- 
>Cheers,
>
>David / dhildenb
>

