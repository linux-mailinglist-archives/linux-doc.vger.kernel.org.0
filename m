Return-Path: <linux-doc+bounces-19194-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70723912F7E
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 23:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECB61F23F71
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 21:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B7716D311;
	Fri, 21 Jun 2024 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="duKeNpFN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AA14A3F
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005107; cv=none; b=f34fpnrAj2IuzOajpqmGWpfp0ILcj5BMX6N9yPx/idrc1L+lk3iBw1IHr/kCMmk3T0POmMsZV4iqzyzACR9AX/mgGml4lYLbbguJ1PCNufljrDYC7bqnS0+/0OTiBePpBW6psyNbxjTC5wfkcQ9FRSNYmcAazYsqOmR3cIEfDzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005107; c=relaxed/simple;
	bh=HgH94SAiel5N/27VWMnrYXJ1lcszHPSht6Tqgt9BIvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDEGNj7RUZX18RrPFW3iAqq78hZy5U41Ge3/AVcvEUwU752Wcb/ny/Y51yYspMC32rhYW5RWOLnAfM2O+gcj5cMihEkVCiw72THIPS4XL9klDTfNzNSnv/zFDKPoIyzPCaTyz4/Lqhk8k+y2x9dvnieSAWnImRrjCZJKRLnaiuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=duKeNpFN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f44b45d6abso20012055ad.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719005105; x=1719609905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OAWqcpZjfMBBVTGOxE0cKfoKLh5aEjtUNj7HbAVkgME=;
        b=duKeNpFN9irpocup/e9BvjrSA2Cw0kpklC3JO/624msMuTv0QJ2Q66Q7rk5DYLxUTd
         Ft994gUlDOL6MEngCAF5PlDeBt0/uPeXtCgszdH2s4H68JkMo0mryUdbx51YTKJ2qH5O
         A1nE8IB86JMQl0dG+I5jXwQ5MnT4YXYg28wlCBU7kKOrFc3Ce29Qyy/kwbaA4nv33LZm
         1I4miTps3dRCwD/Imo78pLZC/7HsjS3aY3b/T9zVDWHT/09FrYZ8Wp1VeHfIHhbystg+
         9S2j/jGAIH5HMa7L4DCESUS+OIQ5NuXFtl7pNPhPjK+2LPPHjPPDrrer9ItbDy/rz62r
         2uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005105; x=1719609905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAWqcpZjfMBBVTGOxE0cKfoKLh5aEjtUNj7HbAVkgME=;
        b=aH/RxN6galX75SPY3Sj9kyC+V7OnpqKyua8oU5JaP/r9cMKMiGkQsP9GTmJI8mSElS
         wYELtHXZ4Up11ECcfrjoIF8orsGgsX/ezQni3B2AlRV/KZdl5Y8Lz3oKdx3yvXm9zjdH
         WPHvcfaauMLb+fB2PvD8WcXdZ4fabYpAX0gocJ5ff6Wr8QSu/5U7uqMeDKU2x7uz+9BV
         AXgqsurT72jVuRTDeTONSOHEY5cazUkxrOIVSmgHjbhSa7CyNXBEfeTcmll0xbbc0+WI
         7nsevesjaEvxQ8ZiQiZBIE/UgWHB9KdwTVItgKr0S6LKS3voaQMLOzJWFVvGuYP2QV5j
         0GBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgbGHCMC16qtdw1FM1F3R5LVTZJZA+Zz/YSPggJV6Z9WS+nZLlMIQoWD2SRa3QfjnpII4FTnBAsrKpCbRJSIZvM0V7NsMdUpi
X-Gm-Message-State: AOJu0Yx5o9SJECPEIxcC4lw5UemK1mzu8YUT7wxp2Rw+Qld6GBpQzjbo
	tTgbhiqFiatE1x1Or8UyvJviWrkwtMF5yJu6Dpt+K2pTnmwfA+NbcdVB+TUbwH0=
X-Google-Smtp-Source: AGHT+IH9Bs+ipsTsXt16f5uX8i2k/D5I8yP/X5dwYRWVxkQ1SJHtSfQOrN/UNKQAa1hTtdxOZgQiyg==
X-Received: by 2002:a17:902:ce85:b0:1f9:f1e1:da93 with SMTP id d9443c01a7336-1f9f1e1e25bmr33558015ad.4.1719005104784;
        Fri, 21 Jun 2024 14:25:04 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f03c8sm18709365ad.16.2024.06.21.14.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 14:25:04 -0700 (PDT)
Message-ID: <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
Date: Fri, 21 Jun 2024 17:24:53 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Yunhui Cui
 <cuiyunhui@bytedance.com>, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
 evan@rivosinc.com, conor.dooley@microchip.com, costa.shul@redhat.com,
 andy.chiu@sifive.com, samitolvanen@google.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/21/24 07:31, Yunhui Cui wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> A handful of user-visible behavior is based on the frequency of the
> time CSR.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   Documentation/arch/riscv/hwprobe.rst  | 2 ++
>   arch/riscv/include/asm/hwprobe.h      | 2 +-
>   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>   arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>   4 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index fc015b452ebf..c07f159d8906 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -229,3 +229,5 @@ The following keys are defined:
>   
>   * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>     represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mtime`.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>   
>   #include <uapi/asm/hwprobe.h>
>   
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7

Please rebase onto palmers branch as MAX_KEY is already 7.

https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=for-next

Thanks,
Jesse Taube

>   
>   static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>   {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 7b95fadbea2a..18754341ff14 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
>   #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>   #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>   #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	7
>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>   
>   /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 83fcc939df67..fc3b40fb9def 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
>   #include <asm/cacheflush.h>
>   #include <asm/cpufeature.h>
>   #include <asm/hwprobe.h>
> +#include <asm/delay.h>
>   #include <asm/sbi.h>
>   #include <asm/switch_to.h>
>   #include <asm/uaccess.h>
> @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>   			pair->value = riscv_cboz_block_size;
>   		break;
>   
> +	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> +		pair->value = riscv_timebase;
> +		break;
> +
>   	/*
>   	 * For forward compatibility, unknown keys don't fail the whole
>   	 * call, but get their element key set to -1 and value set to 0

