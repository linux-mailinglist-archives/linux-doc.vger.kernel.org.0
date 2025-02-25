Return-Path: <linux-doc+bounces-39333-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B3A43E52
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 12:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 645807A8B93
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 11:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341AA267F71;
	Tue, 25 Feb 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XVHhDF2g"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4475267B1D
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484437; cv=none; b=PHLYqfupbxodHe+02+VFAzOb+q5FUcpIlo+JjeOTQW0xHN9ceHDlpDVnzVoSifPyc60VIHhCeTVaVhBO9N+whGCoCmkyHB0oPgMEzk8RF9m+ow4IbzfsRFhSFuYci2jeW+gpn6RG3a5C6riBZ0Wkqbtk1AQfuItNCVOebF0xDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484437; c=relaxed/simple;
	bh=2Cm1/5hdJGpRsXa5i9WUTLuqLOaoa32H6ewApOaGaR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sS3ShFE9aQogwp6nOYm4T0Z5ZM6uIcaEMhhSiQKApwDe95IjmhfX10TT/p9C+pHz38cg6NOXOHDCopjRavGiq5WXVaILQUinxUZTGhZi3oCTxI4DfHrLqq6uqKjznsughB8VZUvrbUqa4laDpB5+iCyUHT0qoltGhI8Oa+QBSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XVHhDF2g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740484433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbzJ0ciiaQnN9IyipfcPCPIA+1eXfEZQWeSNaJG5RbU=;
	b=XVHhDF2gG4hJ939Tj5AqcJ5NPcStH4XaVTcvs6A+XamdAxIDvG3sCaO0FaRQf9se8AVhFD
	gUMFiqeCznF77A4B9LI0N/xzy0WfYV0n70iSwZquupC6i0HaUZ5whDo1p+wd3cEr8XHpPz
	EvqeLr99X9C7kWSXHiYTChjHUXicvgI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-lD4NCuyIMka-xliID3KMnA-1; Tue, 25 Feb 2025 06:53:52 -0500
X-MC-Unique: lD4NCuyIMka-xliID3KMnA-1
X-Mimecast-MFC-AGG-ID: lD4NCuyIMka-xliID3KMnA_1740484431
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43943bd1409so38128515e9.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 03:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484431; x=1741089231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbzJ0ciiaQnN9IyipfcPCPIA+1eXfEZQWeSNaJG5RbU=;
        b=ATI1s6a7RlcvUuuyFtxm9aycuVgON3xAmrO2iBtD0MXNI9vkPj+IJgdKHKlU8M4oFp
         Lri2HzOHQ31yUx3sZGlYeXz/heLGJtC6mKuk0q9B9UbnIDtFRfqeRCUiip7sGGsEqA9w
         YO2so7DM5u3QwvaMLKTMd89WbbkCsje8+SD2hNkFieACSDwfX/46QTRMSowdy71BD/Pr
         9rp0gRA927MCUf9jFWP7w0HxijAqtyg62aTFyrbA3puPZxlGB6b7Q6BDpSGmkKzFbw6O
         w1oCdi3+TD/SYrZ4tw1TGOJXhbuwUv9w32PdulrWCFZ/Uf2apk4v8dh8zmL4mjdEiZyj
         6+pA==
X-Forwarded-Encrypted: i=1; AJvYcCUtqZt+DTofSmBmEVvBtf3fUeSZA9IeZiDZsTbpnSqlZQYQSrHfmDYYCFsox9FNlylUwMgFBXADG7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTK6q3PeRWuzSEo3U32C9iHuhxe50+siSAcPQb5eFUVQqzAX3
	AjrdU7A2eLrNTvt2HcRdGackeVHBOaTay2zrmpWuipvMooldisJbRY+ZgsJuySjR6pSIvlM/TfJ
	JQGnG/+oWYBBLxBFTjlwde87ni8Y+de6x0xQjsd8e6kOCoiDLUOK/OLxV7g==
X-Gm-Gg: ASbGncuVbE6HZTk3fd0Ps6CSnxPgeplQl3fnNBUSzYYV2Dm5BEo16RntjyeBWpi36Fa
	IzlqiZpKviLXyWf2DzNWbzkAaG0J2GQ9mm8OLUWcrVi6aKt1SxrzsWrS9P+E48j00l7ies4cXOx
	ymDi8cHqJagStRvrJyqxuLZhG3JfPxchxHs+ifRTKdt7jjl+4wgv/IUzW5vVZg+ZkginEr4tpER
	8NY9GcVd5yQUKlTLkeyyRX7LEcUMTouqjbAcH8xXvHR28VO0/vcxczlPa+DVKL/fdU+6VSiSCkp
	apP3TioPqssuOnvcVYU3CYPywCHTkC6jcvT7QW1QTBE=
X-Received: by 2002:a05:600c:4fd3:b0:439:9543:9488 with SMTP id 5b1f17b1804b1-439ae2196a6mr115868605e9.21.1740484431011;
        Tue, 25 Feb 2025 03:53:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp6HFbG6WupP50Yn0TY2alNimRWue32zDYWfmPTAw366oKsyjmPv7qJLmsbiU0vrQ+3ZRviw==
X-Received: by 2002:a05:600c:4fd3:b0:439:9543:9488 with SMTP id 5b1f17b1804b1-439ae2196a6mr115868405e9.21.1740484430642;
        Tue, 25 Feb 2025 03:53:50 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866f0asm2045732f8f.12.2025.02.25.03.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 03:53:50 -0800 (PST)
Message-ID: <d0e43d0a-621d-46ee-8cb7-1e5c41e76b8c@redhat.com>
Date: Tue, 25 Feb 2025 12:53:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/7] netconsole: add task name to extra data
 fields
To: Breno Leitao <leitao@debian.org>, Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
References: <20250221-netcons_current-v1-0-21c86ae8fc0d@debian.org>
 <20250221-netcons_current-v1-5-21c86ae8fc0d@debian.org>
 <20250225101910.GM1615191@kernel.org>
 <20250225-doberman-of-scientific-champagne-640c69@leitao>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250225-doberman-of-scientific-champagne-640c69@leitao>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/25 12:17 PM, Breno Leitao wrote:
> On Tue, Feb 25, 2025 at 10:19:10AM +0000, Simon Horman wrote:
>> On Fri, Feb 21, 2025 at 05:52:10AM -0800, Breno Leitao wrote:
>>> This is the core patch for this whole patchset. Add support for
>>> including the current task's name in netconsole's extra data output.
>>> This adds a new append_taskname() function that writes the task name
>>> (from current->comm) into the target's extradata buffer, similar to how
>>> CPU numbers are handled.
>>>
>>> The task name is included when the SYSDATA_TASKNAME field is set,
>>> appearing in the format "taskname=<name>" in the output. This additional
>>> context can help with debugging by showing which task generated each
>>> console message.
>>>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>>  drivers/net/netconsole.c | 14 +++++++++++++-
>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
>>> index 5a29144ae37ee7b487b1a252b0f2ce8574f9cefa..625f4c0be11d8deb454139b1c526abc842697219 100644
>>> --- a/drivers/net/netconsole.c
>>> +++ b/drivers/net/netconsole.c
>>> @@ -1179,12 +1179,22 @@ static int append_cpu_nr(struct netconsole_target *nt, int offset)
>>>  			 raw_smp_processor_id());
>>>  }
>>>  
>>> +static int append_taskname(struct netconsole_target *nt, int offset)
>>> +{
>>> +	if (WARN_ON_ONCE(!current))
>>> +		return 0;
>>
>> Hi Breno,
>>
>> I gather that theoretically this could occur, but it isn't expected
>> to happen in practice. Is that right?
> 
> That's correct. `current` isn't expected to be NULL in practice.
> I've been running this code on several servers for days and have never
> encountered this warning. 
> 
> While the taskname feature isn't enabled during early boot, netconsole
> might be active at that time, which is why I exercised extra caution
> here.

So `current` can't be NULL here. I think it's better to drop such check,
it's presence would be misleading. i.e. like adding checks for UDP stack
being initialized before calling send_msg_fragmented()

Cheers,

Paolo


