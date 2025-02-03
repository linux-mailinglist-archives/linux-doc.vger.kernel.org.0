Return-Path: <linux-doc+bounces-36662-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74ABA25B2B
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 14:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D9B3A2D00
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1829205503;
	Mon,  3 Feb 2025 13:41:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4F1E87B;
	Mon,  3 Feb 2025 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590075; cv=none; b=Pt5/7svYtLr6Pyck2gahdNt3Ju1ePAZvnzqmSDRwdP2h7WnnplVdSGaEnFhxOweqC8xBkrbxxTx51XXoKseIBuYv1Mu/9dIZuN43FVVwwiTOZ4WwRbuLnhd0/gheVwyoQ1yV6x1UEjx1ySP1qM08grd9T5AUK2D0Z1IyN88jGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590075; c=relaxed/simple;
	bh=h6bhzCdC/XdIKc0wfYHxRITaB+fnzQlZwKg/cU21AUM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dVt13OryiOYhllDjiBWStTqj1Xin0DpQzoxtC9W1cbEAINgkbC/QlGuYiXx6fP4ukfbfxkY3FnKctwTzmWrBtkj+w99orrt25ccygtM8vOdbb7sfgJJ+Uas+ZZmWDFhl0xGGGO7Stme+n29byQR51BXBWU3rzERlDGwRy1wHQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso8722727a12.3;
        Mon, 03 Feb 2025 05:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590072; x=1739194872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+F1lnnIcSDRLy4MPQwaPFGWlzQAk8gGAL+Me/U3S2U=;
        b=GLRUd9xEv1S4ht6XYabu085YF/HQEmfOF3qGwoC7B5HEHwYQLycbcghosXnDrFWO1U
         5AmjedMkgeQTzBc/kg5bK4fZhRGdM4xeiO4l0zERRr2JPSBG1zx1hP6K33+HaanmU1UG
         r0cKRbv9Ps7T1KE5T1bpus0u15znUG40+np+5nsM9JZ37KV7XCroa9i7iVJCb40mXRfu
         20y2NOchDoElho0x2JSiY1zP5LlUM1nR39hxc5tE2eZl/7iMyZ+5O3WPxqvmSXTxs408
         9xqAlY//6RgmkNgVBqERXP9RkVHPh5UAJXFt9+OJrJ2KJerbS5Ph31Kq5PQuvnQt7xNf
         g90w==
X-Forwarded-Encrypted: i=1; AJvYcCU9+9nvzEd+3eKMgo7WXvtb0dy/4c3uyEH36ZZg7Sbbk1bnaCLnoR2583gWhZeeA4b4L3tR/plUo9EZ8JjX@vger.kernel.org, AJvYcCVEIMUbhNuWzZnu26hIAPt2gfV8zCLlckMR8C/C4gmqxBVvXYdYm3TX5AI6knxuM9imsI0ica+PUUQ=@vger.kernel.org, AJvYcCXFv+WACB1pDvq0hWpfXtrHVHBU/cJPuQ0aMYHsz+k0/CRcRp/SJgWgZpwf+lc2RJzwPoauowzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyinEeG8DPSGcaAIIQX/hxvdOfYrukAJpKCyy2etZ+fCRSVjd93
	PuPhoC0sUlqDszFsS9BXR4eP8KE1NXNv1dckbfq/LLftbl9h8PtO
X-Gm-Gg: ASbGncu/ImnShRkpV0Gu2ysSVXeOcP+0xryQUZIvInL16KaYdaWnuiJVbDa3x52Uy49
	uFhlmky7ZY5+O3ESJkJfFaBP09O2sIQlLH6UvuCMivYNwqI6EcUy1hJIkhFbr7kmCBHG57zTWUT
	9Rn7BJeHydGHT6FPsw8m17IYtz8cKUi6jXlXYKfaRQOqzFL4oNoxDtfGFVrOBaQeBaK5oZrJxAR
	YRBqVEUlFYJp2kBti/UKF3bF56ge9b1M9arzjmFtLn0eCj6M2ySeOdeQ1EO8ykRdVdUPKspXBaZ
	Tab++jUnDC5b6HA=
X-Google-Smtp-Source: AGHT+IGZKOwmRbDWVJVGLjoQ8O43uA8bmKjfSJS3gCgM6DUqrNV0SxAkWB83R2J3g+1QoDXtUVfHlw==
X-Received: by 2002:a05:6402:e0a:b0:5dc:8f03:bb5c with SMTP id 4fb4d7f45d1cf-5dc8f03bff0mr13033465a12.11.1738590071967;
        Mon, 03 Feb 2025 05:41:11 -0800 (PST)
Received: from [192.168.0.13] ([86.49.44.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724a9c5fsm7718184a12.54.2025.02.03.05.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:41:11 -0800 (PST)
Message-ID: <c455ea03-de72-4eb6-99c2-0769e159f0a4@ovn.org>
Date: Mon, 3 Feb 2025 14:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
 corbet@lwn.net, pshelar@ovn.org, dev@openvswitch.org, edumazet@google.com,
 ovs-dev@openvswitch.org, pabeni@redhat.com, kuba@kernel.org
Subject: Re: [PATCH REPOST] docs: networking: Remove VLAN_TAG_PRESENT from
 openvswitch doc
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Andreas Karis <ak.karis@gmail.com>
References: <20250203113012.14943-1-ak.karis@gmail.com>
 <Z6DEpDT2cFn3pMKR@qmqm.qmqm.pl>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <Z6DEpDT2cFn3pMKR@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/3/25 14:29, Michał Mirosław wrote:
> On Mon, Feb 03, 2025 at 12:30:12PM +0100, Andreas Karis wrote:
>> Since commit 0c4b2d370514 ("net: remove VLAN_TAG_PRESENT"), the kernel
>> no longer uses VLAN_TAG_PRESENT.
>> Update the openvswitch documentation which still contained an outdated
>> reference to VLAN_TAG_PRESENT.
> 
> Hi, it would be best to extend this doc saying that the CFI bit is not
> usable in openvswitch (unlike in other parts of kernel).

FWIW, sch_frag does the same thing.  So, it's not only openvswitch.
Though, yes, sch_frag is probably doing that because TC mimics what
OVS does.

> 
> Nevertheless,
> Acked-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
>>
>> Signed-off-by: Andreas Karis <ak.karis@gmail.com>
>> ---
>>  Documentation/networking/openvswitch.rst | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/networking/openvswitch.rst b/Documentation/networking/openvswitch.rst
>> index 1a8353dbf1b6..8d2bbcb92286 100644
>> --- a/Documentation/networking/openvswitch.rst
>> +++ b/Documentation/networking/openvswitch.rst
>> @@ -230,9 +230,8 @@ an all-zero-bits vlan and an empty encap attribute, like this::
>>      eth(...), eth_type(0x8100), vlan(0), encap()
>>  
>>  Unlike a TCP packet with source and destination ports 0, an
>> -all-zero-bits VLAN TCI is not that rare, so the CFI bit (aka
>> -VLAN_TAG_PRESENT inside the kernel) is ordinarily set in a vlan
>> -attribute expressly to allow this situation to be distinguished.
>> +all-zero-bits VLAN TCI is not that rare, so the CFI bit is ordinarily set
>> +in a vlan attribute expressly to allow this situation to be distinguished.
>>  Thus, the flow key in this second example unambiguously indicates a
>>  missing or malformed VLAN TCI.
>>  
>> -- 
>> 2.48.1
>>
> 


