Return-Path: <linux-doc+bounces-16717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D278E8CBBDA
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 09:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8983B1F223E4
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F367B7CF16;
	Wed, 22 May 2024 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yxEbtQ3j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D47CF30
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716362415; cv=none; b=g27zHtLPVqN2a8P6cnFJ+4DLRqxzWEh7bW7AN30DXNMIubI2CqEzZDT2C57X628CpdCmv7X1ol/0YHoFWC5lKDYMdruVBz/KJ/ZDDb9GKvD/VLmhfci5Uv/iYEFCqMo2H9gR3/+MmmWcwaSgDKAuMdyanCKGaxi5yB6Njw+oY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716362415; c=relaxed/simple;
	bh=91UIMoBqJuIXzScrNoeDbzNCRnDbmKh3LQPWGD3QPxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+1z+p32mlgpvNdPn2/wivFHtTG7Hks1rcvm5gnHK2yWVpFZJwr8y8WPimDfu8aocqcN4ey/V1z7bcaY92SolTJDVfzfchkj60ov3uFA4z1TGI9wDlfW9xDdXX9r9MYweuoqcOWTgmx4E2awq0JUd91ClIDrlHf4lEh2ptNvRzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yxEbtQ3j; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-354c84d4604so95354f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716362411; x=1716967211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMBhFPY2RLtVbP9uMG/kHTkoH5FQv+/qbKIQ531cWpY=;
        b=yxEbtQ3jBAiY1LpsMAoWuQU3Vaj6RXjkYDZGyBUphNOwgccUqyjFhXkjlwa8gp45eb
         8o9QXJ8wqST8RsWfjHawpZ2QXwBcX6Bg4aVQrOYeUo5DAf37nwwhoW7t+R0P9NScrCFP
         hEwIygrBPCrpTwdtJQM9MsPOP3qfrawdiQBqCI0Bg0YOVPrBMsBPOqTfCpHpgO0ZCzIW
         XgrUrb8JYI7tmql124H9Ip53DhMDhck6W1wFnYqF8f25BmXEcEjMz828NPw5xIbuzvgn
         l1Iba4rfhlBwFdlG6hBBYLIymcTqItTO8L5RR3GHGzQw478K2W9t6+/q9Uba9ByS0Iil
         jW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362411; x=1716967211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMBhFPY2RLtVbP9uMG/kHTkoH5FQv+/qbKIQ531cWpY=;
        b=cWDLqA62NCxxIxJ7hlgLjDKgsLOPhg3xSPiaLHcBySe1pdo632hSc5YvQmLNryMsw8
         XOoXeGg0P/IX6+7KcC6oHbgD56htjviRnrLNiVitP7WwG/HtJD9WvnriRyS2F11wxj/c
         TSl2ZcOTPZxftfDvtHVnOmWyKov4gp9hvTCQO2ffgq9hFYai6VPmTn1wWnXvSWEML/AA
         as3Io3UjPNRoG3E4tGUi7Z9RsS3fXn9M7hG20W1ArrCiTo04Ap0OquFq2wvWEPgtALhP
         tvNEWd409Mvm0FCScGUYrs+vu4BpmS3v40vdwXYNj80JzryXqRV94jKrcyiVMeF9kpJh
         PmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe2dYdLFsqwDqqy131OnEFGe/FELKQQoXEtuEIvXjAGtqVPK268jCUWFh1XocBXDQDOaIDoV5yPpHRoY/TlE91ZPlBr8EctVaC
X-Gm-Message-State: AOJu0YyBAGcizollHPxHO7qfF8hgmyuso4b3gzzqHIvDDo0aj9XQG8Qi
	ewlyKnxNQoxnKrdlconotfFNEsfLlmWL0B6PdglxJHYEyeB9x38ptdHMINe5Irg=
X-Google-Smtp-Source: AGHT+IHWVY+wf0lMzIRvSFmzGRBEtlk7+RZmAm7eEQ/Zt8L9I28gKKUkeR8X87R48p3Psaag4VJcvQ==
X-Received: by 2002:adf:f5c3:0:b0:34e:bdf9:32ff with SMTP id ffacd0b85a97d-354d8c7c2a0mr765925f8f.1.1716362411076;
        Wed, 22 May 2024 00:20:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:2d44:5824:d42d:899? ([2a01:e0a:999:a3a0:2d44:5824:d42d:899])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad037sm33448437f8f.71.2024.05.22.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:20:10 -0700 (PDT)
Message-ID: <de2c9064-bb01-42b2-9c0f-884dcabf7c40@rivosinc.com>
Date: Wed, 22 May 2024 09:20:09 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-9-cleger@rivosinc.com>
 <20240521-spiny-undergrad-efa1a391ad3d@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240521-spiny-undergrad-efa1a391ad3d@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/05/2024 21:49, Conor Dooley wrote:
> On Fri, May 17, 2024 at 04:52:48PM +0200, Clément Léger wrote:
> 
>> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
>> +				 const unsigned long *isa_bitmap)
>> +{
>> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) ? 0 : -EPROBE_DEFER;
>> +}
>> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
>> +				  const unsigned long *isa_bitmap)
>> +{
>> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
>> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d) ? 0 : -EPROBE_DEFER;
>> +}
> 
> Could you write the logic in these out normally please? I think they'd
> be more understandable (particular this second one) broken down and with
> early return.

Yes sure. I'll probably make the same thing for zcf_validate as well as
removing the #ifdef and using IS_ENABLED():

static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
				  const unsigned long *isa_bitmap)
{
	if (IS_ENABLED(CONFIG_64BIT))
		return -EINVAL;

	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
	       return 0;

	return -EPROBE_DEFER;
}

> 
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.

