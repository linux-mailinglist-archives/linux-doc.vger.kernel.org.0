Return-Path: <linux-doc+bounces-41629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80818A6D626
	for <lists+linux-doc@lfdr.de>; Mon, 24 Mar 2025 09:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19E52188BC17
	for <lists+linux-doc@lfdr.de>; Mon, 24 Mar 2025 08:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03E125D20A;
	Mon, 24 Mar 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gMsoovib"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E125C6FE
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804988; cv=none; b=qi8jyhoRYnvi3kY72ZVu6M+5uoZfIdEUKHBfUecJrJGpv6QBS/XL31NSSnF99PfF4Dr4Xro6jS+RHCcOEC8rFRfHgOmHObxT8bK0jd2s8JaQFucZpmVvOWNFMtWI9FteUe/Ey21oq4lKIVXhBAKQ98LzlFUvkGKuSkD9f8jBSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804988; c=relaxed/simple;
	bh=NzJP8TqEb08WGj9kYfvDbx+CpZLoCO3wvBykc6g+6mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSyTS5AIuRI2nhP9FQUO3tS2JGv2Ax4CYrU8QeyvN5kQGHwmDosooh/Yu31e+LB5xpPpUW8YvEHPVYiU2MzeZXyzoTZ11P9AdkgmsknRwyy2hIqKJG0SOgm6fld6KmUGlrtwRDzF2npgwJFjIb0QLgFOjJkF3Panx1m+OhRwtD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gMsoovib; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22398e09e39so79412285ad.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742804986; x=1743409786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qMUlDAaek7Ax30c0AGSTiyhNrDt/tYOpdl5MsMoLow=;
        b=gMsoovibKmSv81FaIAbJ9TjBXOxhesE6qDSuZej0OaUgJK9k9PZ43q2GBOsJ50HJSo
         BYlXxmAt2EBq60V91lo6qmWoOn0u4ZqDiCk75leuCFnH0zqpcKfhaAHbs9By3tswSTN8
         FPNGMuA6ndcnQkQ9JbLkSMR3WHZ2q4aQFQ02bLbfmTt2bIb2a9+UY2bLUjQ+75Socqol
         VuiT85EyHZ0AN1NHVNdSSDxBm9sJGn8UAK6tGtMGXqI4BR+2AMb9sMTBqaYAsugBxydW
         e1pTLS7nN4aKWsSUWv5d9DOYThG+qTy11Fi6a4Q2eZngH2BeEVLNl2Noq+E3cVZ11Rdm
         KA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804986; x=1743409786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qMUlDAaek7Ax30c0AGSTiyhNrDt/tYOpdl5MsMoLow=;
        b=N75Zw5n6l+sA0/0KTAYHrkENxavjCCIRmgxnOC8bAIRBQjslU9pf1NeJQPgHImyo9f
         jSFpcMBk7aAwkmFm58O4MORgzmtn3WRek38P4fo/OOWNniH86SO0BrTPrisHSG2yJLTh
         2HgC00E24yMo6ImGuED0CIM0OylMv6vTpv532DLpGWv21RZ5zWjFn0Aenio/v+K1+Kx8
         owzJpHciyU0a519EHzAZgRXbp//poGBCT/Kwm9YJWKIYx0S+c/0foAs/2kiOzb1zL4DQ
         mGOFhEmk05KDyzf0j4HrI7QM37+LNyqqCiDjjkgItrv+2EKxCach7OZY5gHEEWxNKPIQ
         AaoA==
X-Forwarded-Encrypted: i=1; AJvYcCW+eNvFC9WNAtsmd/uwBO3yo8XBMnbCw6ghAaKNBeHq2tW6jX3SrXS1R0Y8QyrUxgdRGqB4fHofalM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmzDHX6Yt0FqfOPA518qi2PvkHWUTrCbJOdi3KRWXYE+cPnve
	xksGz0AvL5pn+BcJErSjOX1eHMQD/8rrqzu6B1cfo3eZ6FeIDLE/fG9HCH+haVE=
X-Gm-Gg: ASbGncv7pV/vFxZovK9yoDYmD9gII/ZETCv2xSznFHrjviG6HqDfAI0RLFV2pbcLD5v
	zOBShPlepYshesesLxXinTIe+hRpVei31gc3Re+L4PUNom4q9weeENPWUS3izJfJeCKOk4iNT3X
	i+WLuKG23oQRPXuf2U+jrx47tbXKuIZ+RNIHk7d2lYucDmcN7ePEiRdpVLhIeN/IySSAtPDazEm
	5yO+Zv6BtieM5UhT1R6duYwxU3J2evLqLBtdHnBY+suwhJw36n/HkdKUppZrw5Pf37IEW4bS7vo
	2ULI+byGQBEAortbQoNxGU6HK3+jVSHakItYF6IE0CftrlbEcKmqLyIUjPWsyKfKfJlJlqinJCX
	3+pOzJivzDBiwfg==
X-Google-Smtp-Source: AGHT+IE/svKRMr10qo5TWA29tMIKA3okBWKKu6uK4vQbAlDiEPBzS0bf2OPavcRs7sE+zsZm2iXV3g==
X-Received: by 2002:a05:6a20:a109:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-1fe433193c6mr24677051637.37.1742804986196;
        Mon, 24 Mar 2025 01:29:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4747bsm6509935a12.68.2025.03.24.01.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:29:45 -0700 (PDT)
Message-ID: <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
Date: Mon, 24 Mar 2025 09:29:33 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
 <20250322-cce038c88db88dd119a49846@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250322-cce038c88db88dd119a49846@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/03/2025 13:06, Andrew Jones wrote:
> On Mon, Mar 17, 2025 at 06:06:08PM +0100, Clément Léger wrote:
>> A few new errors have been added with SBI V3.0, maps them as close as
>> possible to errno values.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/sbi.h | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index bb077d0c912f..d11d22717b49 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int err)
>>  	case SBI_SUCCESS:
>>  		return 0;
>>  	case SBI_ERR_DENIED:
>> +	case SBI_ERR_DENIED_LOCKED:
>>  		return -EPERM;
>>  	case SBI_ERR_INVALID_PARAM:
>> +	case SBI_ERR_INVALID_STATE:
>> +	case SBI_ERR_BAD_RANGE:
>>  		return -EINVAL;
>>  	case SBI_ERR_INVALID_ADDRESS:
>>  		return -EFAULT;
>> +	case SBI_ERR_NO_SHMEM:
>> +		return -ENOMEM;
>> +	case SBI_ERR_TIMEOUT:
>> +		return -ETIME;
>> +	case SBI_ERR_IO:
>> +		return -EIO;
>>  	case SBI_ERR_NOT_SUPPORTED:
>>  	case SBI_ERR_FAILURE:
>>  	default:
>> -- 
>> 2.47.2
>>
> 
> I'm not a huge fan sbi_err_map_linux_errno() since the mappings seem a bit
> arbitrary, but if we're going to do it, then these look pretty good to me.
> Only other thought I had was E2BIG for bad-range, but nah...

Yeah I also think some mappings are a bit odd even though I skimmed
through the whole errno list to find the best possible mappings. I'd be
happy to find something better though.

Thanks,

Clément

> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


