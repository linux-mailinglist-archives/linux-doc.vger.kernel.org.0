Return-Path: <linux-doc+bounces-16339-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD768C46E2
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 20:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 912111C21717
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 18:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD263A1A2;
	Mon, 13 May 2024 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cI219oHU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552C39AEC
	for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625238; cv=none; b=CbgmO2T6oqUeLLN7O8XGXFbFpZJI7v7o38i99eJ6EolShn0zBaffiDUQ6XlqXLWgGrcQ7qM1uPvBDfoO+K2gKf8EnWY736OQRV2wckT/scYlGrexEPFHEcUaXO4WD3t55Hct6yCxgdQ2vl1H8ueWN+VY6zh5KVZcByUCI9g5vDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625238; c=relaxed/simple;
	bh=ZhGoyOdOjcmUxuRvGYfZ21j9wUJSigWgiEp3GvOaARc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNWQ2q8XuD1IlP5JiJxSM4GON7k8sOwdgPxMGJUJn8dwYyEzLBogqad/h/hV61oyHutmYmfhayTGtoEHDLu0lxPKBUR/Elccg40bm0/UirwRxeh58WVR0aDSIO/4HjhrBZyCH9lkoe8VT3zV+/twaQWZwgnK+2f4aqQYK8DFkwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cI219oHU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1edf506b216so31653165ad.2
        for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715625236; x=1716230036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIieT11BAyr5eCbucIfDMPYSpqd8uK7xxfWKvzozEyI=;
        b=cI219oHUC0wtkNiVocTset+PBiDs5eJK3V6BFR6OirhH72CqstHXt7jWEfEu2iP12n
         Vognay3eDO4jzFzjjCvw2kVOTt0AphWpimk1pLo8wpYp3g3HXLrPlqmjYVHk+5STmkzr
         q+Uuy6dt5Wm2bmini1XluZ9s50wNg8OgPfguioN1Z90UAh2ekHFe3SUTLTTWIN+Dt0R1
         cUPCDJ0sxs9Pje0nw66EU0Ml8LY2kpR6Z/sM9sxPpDLadlfjDtZJ4wcR5sDokIbZau2o
         AAXE7gCaud4H6iJJGQYC4iwpvVYkwppI3yTd3k/NaBix+Hs/cBw/jWIvYbjUmhdA4+o2
         Db2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625236; x=1716230036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIieT11BAyr5eCbucIfDMPYSpqd8uK7xxfWKvzozEyI=;
        b=t56hS0BqwGGZL/lEeLK/a0XYfruhUx+CW/nFr1ik3lKCJgy6Uu/tMLCzklF3c9zNPL
         zmEkkNvfAFB9m6tw0Bfwrohjr3OqR8jSf8eJ4UFUjcC3bwaX6rzJSz3ajmsppWdZICS5
         PgWkYPfhavmNZu9w38eipv8rJ4XK/m98AI/5kplEzrtpIgSa2JcxpHXY2jfUJq0H39Ls
         Tk0zy84NURHlK1X/ibN9qKuzjHV3eHCY1yxHQUf98U/u97Ci1fLmgteiTp37kOHGtoF9
         XF+Rxzn7tcR2GwWBSZIpOdV7WnDv3Qz+QLJhWuOUzs4U3dEWfypwZl0oZk8Q8vczKMeg
         IMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUXE193Uufn7wacIPSB6VrKWERvUBm1c2DNiQfCGejjd/iCdxf9bF6jTWvaKOw9Ww1EbixMRZ1u8NQPFcp5zUKAMs9/WAgT/yXi
X-Gm-Message-State: AOJu0YyPATRRk3+cxdLeeQvr56jDvYKAPZXcE5VAUuPFt72Sx3/FbkA4
	jXk0aRmNsvOgLnuAoUzUa1ZNowmxTM8ZjuY60f8RL4j3R0N+MUczgdDMxyT7taQ=
X-Google-Smtp-Source: AGHT+IFnbLXicXE+Y/UKuSVClJLtlfBWO7CdnrEkpjnDppDvuoBtNhLdA/briBDaFchoAw9tI2ob0A==
X-Received: by 2002:a17:902:f68e:b0:1e4:c07b:a8e0 with SMTP id d9443c01a7336-1ef441a76fcmr123301465ad.66.1715625235664;
        Mon, 13 May 2024 11:33:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf32b4dsm84209665ad.137.2024.05.13.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:33:55 -0700 (PDT)
Date: Mon, 13 May 2024 11:33:50 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 02/29] riscv: define default value for envcfg for task
Message-ID: <ZkJdDnfjm+DMzgEa@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-3-debug@rivosinc.com>
 <Zj6gwFvj2gA04NJq@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zj6gwFvj2gA04NJq@ghost>

On Fri, May 10, 2024 at 03:33:36PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:34:50PM -0700, Deepak Gupta wrote:
>> Defines a base default value for envcfg per task. By default all tasks
>> should have cache zeroing capability. Any future base capabilities that
>> apply to all tasks can be turned on same way.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/csr.h | 2 ++
>>  arch/riscv/kernel/process.c  | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 2468c55933cd..bbd2207adb39 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -202,6 +202,8 @@
>>  #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
>>  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
>>  #define ENVCFG_FIOM			_AC(0x1, UL)
>> +/* by default all threads should be able to zero cache */
>> +#define ENVCFG_BASE			ENVCFG_CBZE
>>
>>  /* Smstateen bits */
>>  #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 92922dbd5b5c..d3109557f951 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>>  	else
>>  		regs->status |= SR_UXL_64;
>>  #endif
>> +	/*
>> +	 * read current envcfg settings, AND it with base settings applicable
>> +	 * for all the tasks. Base settings should've been set up during CPU
>> +	 * bring up.
>> +	 */
>> +	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;
>
>This needs to be gated on xlinuxenvcfg.

You're right. This csr read should be gated on xlinuxenvcfg. Will fix it.

>
>- Charlie
>
>>  }
>>
>>  void flush_thread(void)
>> --
>> 2.43.2
>>

