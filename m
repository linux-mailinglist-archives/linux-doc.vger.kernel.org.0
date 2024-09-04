Return-Path: <linux-doc+bounces-24386-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C096A08E
	for <lists+linux-doc@lfdr.de>; Tue,  3 Sep 2024 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6360B285EE2
	for <lists+linux-doc@lfdr.de>; Tue,  3 Sep 2024 14:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AA4187860;
	Tue,  3 Sep 2024 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nZEvQmf6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFB13D52E
	for <linux-doc@vger.kernel.org>; Tue,  3 Sep 2024 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373627; cv=none; b=s1JznofqHnhvUF4nQ6sJdozGpSJ9mAyE3GulwmsSkBi+Eadry4Eb0DcqQPJKcxRlNRpJoQN/5R5qkBE/TOMZbyYhAWYejuVkGgRJE8kwdBl4q0HaFez4f7Z6cgfckcvxy+JjqJ0BECY0VtAjmU5nV8Z3mphI3X8p3OYm6SLoZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373627; c=relaxed/simple;
	bh=YJZad+gj0lbbhihO+iH3TxZ51TS0VnirXp0wz604WKQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=NY4Sa3S6ZxyQhoJsrAyC/Emt8lBuURVtkvW3d1cpNE8Ya/gav/mVkeITOoQ1yM4WmUFOndLnZ9Rp3YddLR1TcYIIG82kXH7oHSqx18tH0WM330hDnsP1WsdjtIwZcIxbpMUnS5AuYS8uzoa7z3gdsPmX6ogWRYeh+LzvJnvTYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nZEvQmf6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2057c6c57b5so11764345ad.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2024 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725373624; x=1725978424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoTw6t0Be8aKNozeOjjMtSaTe5hpCqncxCg69X7v8Z4=;
        b=nZEvQmf6uAOW2qS8vmhA5JnieVaPl3/T2pwH3w3jIIjgSnm9dXRhSkMl3WO/BHlUSk
         ZWRxArZmPu1ubKWXmpP7a1O94ZtDaZJRoEi9GiKy2G+QhXyN6ecdhOD7QxQzWxhaVPZh
         sMpsdBeRDz57yao6mx7x2vXXdk7E7xTjJhULrrcJxkXGRukb4caxpaXViADG6LYLwBLR
         7lTtNr5IR71TV9iHTyFaOw2YZuZsyD0LFaSh7SIGt9LXutGjS/o6e4xb4D74w0FKgZ/v
         RxqAxuAJKFVQ0Kb/uc/dAP9J4mPkBJyjguSGdQrKn/nh3AuUsZpotBEJjNdy7yGS5/Qh
         ipVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373624; x=1725978424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoTw6t0Be8aKNozeOjjMtSaTe5hpCqncxCg69X7v8Z4=;
        b=LBVZQHzOs25DhR647RXpAFm5Nj5EtVXkZ1u/ImCzm7uqKYTrreWBAdXY4r6dixFRir
         eSxekOlR4BsfI47esRK3zVRRfExDZRzJ0Cz8Fb3YfNdAjcSoFJSUCnMEdolPdTZj4sq+
         qfnExhr4DVNSHqpfjPi/3wCu3K3Gl+Jp4m2PkGhLguCCDTLCWZ63tsdeiJGC6oriM4iB
         OCC/ac98QLibkq5E6g60jrAfGqBA3TyRsaSQtZUVtrKjq8PsIzZBIn/T4lTa77ofga3p
         XhypjVFxDrHBFfwGj0iO5TRaMWSp/JaCg5jz/DQSrb/uEkG8Z0SQWlT7u1ZZjLhd7WcU
         uHYA==
X-Forwarded-Encrypted: i=1; AJvYcCUsjAlyRRJITlZ90qY0GZ4QNlT6foIzJvkf6JejIJFODrNU82DOyxOqXEDzSWjdBu78wblpAbQivTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzIfGdUNbnJyrRzl9OutDO0C5RFpSMkwP7zx4zcZPkKN4qflH
	Y/JbbH9uM+P2O863i2qz35wBH/q1G7ei3DYHHkk1rQtp6O/iQa88aVgF55MHOho=
X-Google-Smtp-Source: AGHT+IFEJHC4rZXRkLgfnKMPzqA7B9JvTzO3tbZukAMVMQi69t3KSZUdjoFwdxWGHbJK+agz7xqErg==
X-Received: by 2002:a17:902:dace:b0:205:8b84:d5e8 with SMTP id d9443c01a7336-2058b84dad4mr100289045ad.18.1725373623730;
        Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555140csm82048875ad.244.2024.09.03.07.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
Date: Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Sep 2024 07:27:01 PDT (-0700)
Subject:     Re: [PATCH 3/3] riscv: mm: Do not restrict mmap address based on hint
In-Reply-To: <tencent_A414DA7D8E69B831317A21368D057C378208@qq.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, shuah@kernel.org, rsworktech@outlook.com,
  alexghiti@rivosinc.com, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cyy@cyyself.name
Message-ID: <mhng-ad0c8c3b-568a-484d-bc3d-49b56a11dcd6@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 26 Aug 2024 19:24:38 PDT (-0700), cyy@cyyself.name wrote:
>
>
>> On Aug 27, 2024, at 00:36, Charlie Jenkins <charlie@rivosinc.com> wrote:
>> 
>> The hint address should not forcefully restrict the addresses returned
>> by mmap as this causes mmap to report ENOMEM when there is memory still
>> available.
>> 
>
> Fixing in this way will break userspace on Sv57 machines as some
> issues mentioned in the patch [1].
>
> I suggest restricting to BIT(47) by default, like patch [2], to
> align with kernel behavior on x86 and aarch64, and this does exist
> on x86 and aarch64 for quite a long time. In that way, we will also
> solve the problem mentioned in the first patch [1], as QEMU enables
> Sv57 by default now and will not break userspace.
>
> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> [2] https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/

I'm going to pick this up as it's a revert and a bug fix, so we can 
backport it.  If the right answer is to just forget about the sv39 
userspace and only worry about sv48 userspace then your patches are 
likely the way to go, but there's a handful of discussions around that 
which might take a bit.

>
> Thanks,
> Yangyu Chen
>
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
>> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
>> Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
>> ---
>> arch/riscv/include/asm/processor.h | 26 ++------------------------
>> 1 file changed, 2 insertions(+), 24 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> index 8702b8721a27..efa1b3519b23 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -14,36 +14,14 @@
>> 
>> #include <asm/ptrace.h>
>> 
>> -/*
>> - * addr is a hint to the maximum userspace address that mmap should provide, so
>> - * this macro needs to return the largest address space available so that
>> - * mmap_end < addr, being mmap_end the top of that address space.
>> - * See Documentation/arch/riscv/vm-layout.rst for more details.
>> - */
>> #define arch_get_mmap_end(addr, len, flags) \
>> ({ \
>> - unsigned long mmap_end; \
>> - typeof(addr) _addr = (addr); \
>> - if ((_addr) == 0 || is_compat_task() || \
>> -    ((_addr + len) > BIT(VA_BITS - 1))) \
>> - mmap_end = STACK_TOP_MAX; \
>> - else \
>> - mmap_end = (_addr + len); \
>> - mmap_end; \
>> + STACK_TOP_MAX; \
>> })
>> 
>> #define arch_get_mmap_base(addr, base) \
>> ({ \
>> - unsigned long mmap_base; \
>> - typeof(addr) _addr = (addr); \
>> - typeof(base) _base = (base); \
>> - unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base); \
>> - if ((_addr) == 0 || is_compat_task() || \
>> -    ((_addr + len) > BIT(VA_BITS - 1))) \
>> - mmap_base = (_base); \
>> - else \
>> - mmap_base = (_addr + len) - rnd_gap; \
>> - mmap_base; \
>> + base; \
>> })
>> 
>> #ifdef CONFIG_64BIT
>> 
>> -- 
>> 2.45.0
>> 

