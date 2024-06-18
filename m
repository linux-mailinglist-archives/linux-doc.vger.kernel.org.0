Return-Path: <linux-doc+bounces-18787-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03190C32D
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 07:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE047282BAC
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 05:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1CC1B947;
	Tue, 18 Jun 2024 05:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZ03mlje"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B46C33FD
	for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718689191; cv=none; b=BX/Eop8Q4CsLOAeGGrGIO2+1cfKDSjrfvmbQzbuxUI3aV24VtaYYnE0/F50Sj+xQZPM1fs71D2WGRWzmKr5cfuGW/+IZP83VsCUkkZuErPmPYgil2lzoRzfNoblOgTjVtN4OQrwQjbjBXtaBUGjMEpJMVbEnG/2TDkUwBwRReCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718689191; c=relaxed/simple;
	bh=qFD5TFMw8vKMqjI7BQitEyeqLcT3q7Me1rYn6PV4xIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEcurJ+3jLDU9JbXT2qGKgFbPq2sSXcjB0k8vdgFblQmZxn53Erjf7VSrOH31OsvZIt1UtmT4wIa9P4ZEyFYE3BZX4wZ6Fm5jFVeEorC1ur14lt/fD9Cxe0mxaa/18SVCORp8gvO60iLyCIcvyGXejYF7d4IwW50/6OB1DDNSlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZ03mlje; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718689189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z2LV6dTQz1eiBF5FWlcj3QVpuw08o7/Lb6CzqLQdxCc=;
	b=cZ03mlje0xEGHvs0fMBiUecndWufZz0DRARbhoLr92jWTN1mQgTMKuqXVgBBcy7lCnY/g6
	0wtAtDMOzgb/fIWcLRXBMIOrB0iPU4ECxmVX/VUoPCI74iOVgvigWgyw/7g7eG1w8TuGoA
	jkdjFLtBtPonC6Heb5Q2Ml+J6Eyzido=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-u3g-wq2hOS6ndpraKCEapA-1; Tue, 18 Jun 2024 01:39:45 -0400
X-MC-Unique: u3g-wq2hOS6ndpraKCEapA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6f0d8b466dso168637466b.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 22:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718689184; x=1719293984;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2LV6dTQz1eiBF5FWlcj3QVpuw08o7/Lb6CzqLQdxCc=;
        b=KtkVHeNg8jKjUzMP0nRayk7cvqDksGR1czbUY+NOc04oM/LqkepKjeA/jkJ5WOdqgh
         xTZdDTz6sHhSnKWcoCTl8qVyP+AEsecbXkKQGFysSjB2jgQ3Q/kxMRv4465v3umAfbua
         Aal0JRcW3yfu1oIJR2UIdHxLBK+Qivjd8GZ4NYhVwTZzXuDAdr7ZtDg1dqON18D8Yjaz
         GzlD5fFV8EsWJmURsp1Rwr5b6gBaKIwLKMDfyWkQC0Z6cHYvLIizDofzXaBd4PsSoybE
         opYeqUOfNDe4nWCOf5eiCbCBIMe7zy5i8wlwIj/fGF2kFydfTLuTtVOBdmy2UJaNkVlZ
         kZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWB1txI+dklFmP5DNytzXjhs5wVz9gQLbCj61DdjT6KuMWcd7rodLu1MXOr2FbzL0xGTyWDs3HSWYoA9BIRmwDDFYw6VorpUIvB
X-Gm-Message-State: AOJu0YxE3pkAtKVRXJQ8dUf/u48UaP3ALAkz0wngw5r6Yd6qHgbUkok/
	1VXUprdosUz76WjdlJHpr8uvCobaf6apvZjpHX/aUweKgAmFDRZDLc4JF6Dr06/Jdsfomu2oEiH
	b2wOjMLmZ5z+SACtHqasfeO7VPqFCDgQM4Z6/ezJAIyBI2khh4eFXiuwszw==
X-Received: by 2002:a50:955a:0:b0:573:55cc:2f50 with SMTP id 4fb4d7f45d1cf-57cbd8daf3bmr8787490a12.37.1718689184648;
        Mon, 17 Jun 2024 22:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsEkgZLO/gDLW2qWN1q9TUM5UKd/1al9Fu91ddEfr0GvIiXC+aasvIJrC6JEYxyTtayJaZlA==
X-Received: by 2002:a50:955a:0:b0:573:55cc:2f50 with SMTP id 4fb4d7f45d1cf-57cbd8daf3bmr8787484a12.37.1718689184286;
        Mon, 17 Jun 2024 22:39:44 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ccc173673sm4640001a12.44.2024.06.17.22.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 22:39:43 -0700 (PDT)
Message-ID: <76226735-d1d3-4741-9c8d-44a3a4d1606a@redhat.com>
Date: Tue, 18 Jun 2024 07:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Remove "mfgpt_irq=" from the
 kernel-parameters.txt file
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240614090306.561464-1-thuth@redhat.com>
 <8734pbi4y8.fsf@trenco.lwn.net>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <8734pbi4y8.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2024 00.23, Jonathan Corbet wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The kernel parameter mfgpt_irq has been removed in 2009 already in the
>> commit c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code").
>> Time to remove it from the documentation now, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index a9b905bbc8ca..756ac1e22813 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3426,10 +3426,6 @@
>>   			deep    - Suspend-To-RAM or equivalent (if supported)
>>   			See Documentation/admin-guide/pm/sleep-states.rst.
>>   
>> -	mfgpt_irq=	[IA-32] Specify the IRQ to use for the
>> -			Multi-Function General Purpose Timers on AMD Geode
>> -			platforms.
>> -
>>   	mfgptfix	[X86-32] Fix MFGPT timers on AMD Geode platforms when
>>   			the BIOS has incorrectly applied a workaround. TinyBIOS
>>   			version 0.98 is known to be affected, 0.99 fixes the
> 
> So I am unable to get this one to apply; which kernel version did you
> base it on?

Looks like this one got picked up via the x86 tree already:

 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9b9eec8dc284f33f505cec48d88b42ebad4da9cc

  Thomas


