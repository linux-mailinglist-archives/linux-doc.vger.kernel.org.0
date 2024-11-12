Return-Path: <linux-doc+bounces-30570-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD99C6112
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 20:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B2AB62710
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 17:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DF8214429;
	Tue, 12 Nov 2024 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NfnSOfX1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF52141A4
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433475; cv=none; b=HYiLBK9xyho+DZA/eiS5l17TbGurHmVx4FWZ0g1QD9wbkWChFqyv74+o9mMqpsu5k23IffEu6cJk3Ht5hmiFNpkS18aOYW71IcOFqfiZ4jiYEaNzerbow/0gbOg4uWy82TX4EnJ5MmV0PyRmGq2hnKN0vynTtx6q9y6wo15945E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433475; c=relaxed/simple;
	bh=y4lqmUbMc1YD6SObguGdeCheozLDWGjBcGm+iitzX+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjTdGaX/X9CKo5RD83tfFPBWGzcgjO970KInQeno4b/JCwP2XIaCH2JrS98eaICHfcGSKKkpEMKtV8EzvXwnfoXt0Yc3sb86gEVYXKLtz6ocy11KydLtx75Ssw5CqzaYUpi+lHzwqDVHYpVQfxCn/ICV+roR4awvOAgrpA4MRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NfnSOfX1; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a6e960fa2dso23319365ab.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 09:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731433471; x=1732038271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CO66k8vdkf1/7W/1z4gXCToQvhnpm1AaGiCOH2Lt4I=;
        b=NfnSOfX1DbC0/j0XDzmcXmQycvkUhOlDpseuM6hjn8bp4GwKCDEaRk0KdTKLF+jfON
         tQ6tMsn36JKFVu29d9fu5SyKnytDsoR06NKuNgSVkNuhDTLw2TbjWbBxQM1gIjAvygWu
         jaWzXNhPhR9+lakXb8K1VNLTZQr4mhs2HJKFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731433471; x=1732038271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CO66k8vdkf1/7W/1z4gXCToQvhnpm1AaGiCOH2Lt4I=;
        b=FKnIZhzoAFJoYqqUiEyy2TptStJ7gsHcHkk18q6dGhpTZF5wWXOHuCzWVG1ppe8X+R
         MPTfqfCcgHPAsX3+1cfEIw4TirbA3r7PQUQGfGDSzgGhdcJybc2S4Oz3hhz07fllpgH4
         bPt468spLJDL4HSGu7mM4t31XFe1ZXRbsnzngofA4LgZySUC1okOUredmVcYvmyVRky5
         lqgnEzNRfc4zAh/2URM7H1+e4EWyRzm0L9SGITfrVM9HUyEZp3KALFEESmALlMYNu60K
         jNtstbszjfTGHtAjACJdsofpjDq/RsXkJ1jyk9hq9yE0bKsAjwdv+NRz9Aim/gu5NXe/
         MC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVgb+dt5g6/5tFXL5u1xsby66+G4yvtgIzfcYuNd+D9I9w+V8YvF5yS2aG8Tz80Ev/6X+FcWhXvh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LrFNq50n8VR887PVTQ7I9C/2Alw2kTJ7xXG7buR6AC8gqhdo
	OwavXV9UkgL7/3R2K+pynOWFSCN3YYh8bAK6UqgJnHCg0RaF8mOqOZYDXuJChek=
X-Google-Smtp-Source: AGHT+IECbH3zWN1YuCJheg/fgVRxjKKKOBSvEmpjxoBY/JlifdtX6pbym1LtHeex/CjxSfjeXuUQAQ==
X-Received: by 2002:a05:6e02:214e:b0:3a2:f7b1:2f70 with SMTP id e9e14a558f8ab-3a6f1a759aamr171429245ab.21.1731433471302;
        Tue, 12 Nov 2024 09:44:31 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f984cc0fsm23324225ab.48.2024.11.12.09.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 09:44:30 -0800 (PST)
Message-ID: <ec850949-7987-41ec-ba1f-a0c90b465661@linuxfoundation.org>
Date: Tue, 12 Nov 2024 10:44:29 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
 <20241111223538.GD17916@pendragon.ideasonboard.com>
 <7d14de47-119a-42e4-a911-f8accae4abf1@linuxfoundation.org>
 <20241112051836.GF17916@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241112051836.GF17916@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 22:18, Laurent Pinchart wrote:
> On Mon, Nov 11, 2024 at 05:35:11PM -0700, Shuah Khan wrote:
>> On 11/11/24 15:35, Laurent Pinchart wrote:
>>> On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
>>>> On 11/11/24 13:07, Simona Vetter wrote:
>>>>> On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
>>>>>> The Code of Conduct committee's goal first and foremost is to bring about
>>>>>> change to ensure our community continues to foster respectful discussions.
>>>>>>
>>>>>> In the interest of transparency, the CoC enforcement policy is formalized
>>>>>> for unacceptable behaviors.
>>>>>>
>>>>>> Update the Code of Conduct Interpretation document with the enforcement
>>>>>> information.
>>>>>>
>>>>>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>>>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>>>>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>>>>>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>>>>>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>>
>>>>> I think it's really good to document these details. The freedesktop coc
>>>>> team is going through the same process, we've also done a talk at XDC
>>>>> about all these changes, and I think this helps a lot in transparency and
>>>>> accountability in practice. With that, some thoughts below.
>>>
>>> I've been thinking about replying to this patch for a few days now. I
>>> think I managed to sleep over it enough to make that possible.
>>>
>>> I share Sima's opinion here. There is FUD around the CoC and its
>>> enforcement process due to lack of transparency, so I believe
>>> documenting the goals and means is important and will help.
>>
>> Thank you for your feedback.
>>
>>>> Thank you Simona for your review and feedback.
>>>>
>>>>>> ---
>>>>>>     .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>>>>>>     1 file changed, 52 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
>>>>>> index 66b07f14714c..21dd1cd871d2 100644
>>>>>> --- a/Documentation/process/code-of-conduct-interpretation.rst
>>>>>> +++ b/Documentation/process/code-of-conduct-interpretation.rst
>>>>>> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>>>>>>     Because how we interpret and enforce the Code of Conduct will evolve over
>>>>>>     time, this document will be updated when necessary to reflect any
>>>>>>     changes.
>>>>>> +
>>>>>> +Enforcement for Unacceptable Behavior Code of Conduct Violations
>>>>>> +----------------------------------------------------------------
>>>>>> +
>>>>>> +The Code of Conduct committee works to ensure that our community continues
>>>>>> +to be inclusive and fosters diverse discussions and viewpoints, and works
>>>>>> +to improve those characteristics over time. The Code of Conduct committee
>>>>>> +takes measures to restore productive and respectful collaboration when an
>>>>>> +unacceptable behavior has negatively impacted that relationship.
>>>>>> +
>>>>>> +Seek public apology for the violation
>>>>>> +*************************************
>>>>>> +
>>>>>> +The Code of Conduct Committee publicly calls out the behavior in the
>>>>>> +setting in which the violation has taken place, seeking public apology
>>>>>> +for the violation.
>>>>>> +
>>>>>> +A public apology for the violation is the first step towards rebuilding
>>>>>> +the trust. Trust is essential for the continued success and health of the
>>>>>> +community which operates on trust and respect.
>>>>>
>>>>> Personal take, but I think a forced public apology as the primary or at
>>>>> least initial coc enforcement approach is one of the worst.
>>>>
>>>> Seeking public apology is in response to unacceptable behaviors which are
>>>> serious in nature. These incidents are exceedingly rare. When these incidents
>>>> happen, they usually resolve when another developer/community member points
>>>> out the behavior. The individual responds with a voluntary apology to
>>>> mend fences and repair harm.
>>>>
>>>> The CoC  gets involved only when it receives a report which is the case
>>>> when normal paths such as peers pointing out the behavior to repair the
>>>> harm haven't been successful.
>>>>
>>>> This document isn't intended to be a complete summary of all actions the
>>>> CoC takes in response to reports. There is a lot of back and forth with
>>>> the individuals to bring about change before the CoC asks for an apology.
>>
>> See below clarification on above use of "actions"
>>
>>>> The CoC seeks public apology only when it is essential to repair the harm.
>>>
>>> Limiting the CoC committee to seeking public apology, due to what it
>>> means in terms of both process and goal, would deprive the committee
>>> from many useful courses of action. I was expecting you were not limited
>>> to this, and I appreciate that you are stating it clearly here. It is
>>> not however clear from this patch, and I believe it would benefit the
>>> whole community if this was explained better in the document. A more
>>> detailed description of the different means of action and outcomes would
>>> help balance the fact that the proceedings of the CoC committe are not
>>> public.
>>
>> The actions CoC takes prior asking for a public apology are working
>> with the individual to bring about change in their understanding the
>> importance to repair damage caused by the behavior.
>>
>> Since these are measures to bring about change, the document doesn't
>> go into the details about the logistics.
> 
> I think that's where it falls short. The private proceedings policy that
> governs the CoC committee (I'm not interested here to debate whether
> that is good or not, the question is out of scope) needs in my opinion
> to be offset by more transparency in the procedures documentation to
> avoid the "secret court" image that many attach to the CoC committee. I
> do understand this is not a trivial exercise, as any policy documented
> in writing can have a limiting impact on the actions the CoC committee
> can take, but I believe that this patch, as it stands, gives a wrong and
> possibly damaging impression of the committee's work.
> 

Thank you Laurent.

Bulk of the Code of Conduct Committee work involves listening, talking,
and discussing the best outcomes for all involved parties.

I will add more content to the document distilling the discussion on
this thread in the interest of transparency.

thanks,
-- Shuah




