Return-Path: <linux-doc+bounces-30609-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C049C644E
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 23:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCCE283CC1
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373FD21A4D0;
	Tue, 12 Nov 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JSmven7a"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD41481AF
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450769; cv=none; b=FFMns7kfFXEgg1RNL4/5RVF2gPQN2QH0JlWO+tJrBPNKa2sHkcBwgTkQfCshu4GuRoZC8RqfZajN5w4fC8ue2iMmXXVdufWNU6Nf/b58GZg2mzdB4zRIXlyiHdUPIQKJ+U+tUj3cjf3fSPa8dg0NcuhZbPTUWhW5af2+2AkIomc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450769; c=relaxed/simple;
	bh=mJc35foEwAPboPsY5krIFy7+u0SbnhLTgFGpw9XK0X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMg4JjIpeZI28dAZYhhOdQ9kw6YHIoQnvSu0AC20SwK2LN1PIvU54ktvErzYWCAjG/Tn/Hxc95XTwiPYbv5/6E8rI5pBDfZO5C6KZZFDjslG6sDtjqi8fmZa/ej067U9xzT4o+s4jFOsAAkH9vM6Bfd1f2rL+fDM6YUVi7K6Zhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JSmven7a; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a5e0a3ac48so27023285ab.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731450765; x=1732055565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASczx2jknW39BdU+iF4bvWFRKkWfgG1bJTYZq7CVguY=;
        b=JSmven7aIsB+Ms0/WedOSek67WgXEp0o6CQ/FQOpAzY437SfcxYgryLYsAv629+hPn
         IVeaSpYAX9PueqD6RndbZ4YY9k1OfwLdLrIVvPlPOyyzoimztKpFIdUITateOq/aVQHo
         kJkiGx5T6mphcrLrApR7wnHjvaRmozqy2FkHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731450765; x=1732055565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASczx2jknW39BdU+iF4bvWFRKkWfgG1bJTYZq7CVguY=;
        b=FCmdbobTm/p8iHhrJCzhdf3PHrOVsMCV+QT8vVXjzNacT9Pc65Nln6kNpkMjiEhB8T
         I/BiYaJtt9dIpyJ/gUQEt0h9kRlyWiK92nmN7qUJioXVdv+NdlOLnrBta9+hP9ezx+VT
         4lqnN0vUAyLiznaCODz4nN17t0o4ZEQ2+9BDr6ybsHUgbKMp/n+KD86DqXdVxSTn3Q39
         XRV/dECbeNuCSx0oDMhlBPnJXi1rOqJ0dw5uYTfp88wXytJc1XDXvDpKlgtCkRnUdsMU
         nA01tB2wjs5L1Jfx+m1nmAJ0aPUQzAkoatIY4ySYNakNSh0ImRh8gE9lldFQ9wuS7xrX
         VBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVugtuad+HdQMZiEADwBS9jp5O8EbzBYMTW6lPsos4xxSjn/Wuduy+/tVKvSk0oB/K/g2WD2xILvAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ3pBowP1wTHaBgFwItFH2v7jn40i6JBNsfCZmb9Fdk5UoeRJX
	8EzEjftbUh+7+ZsEATfyR79EA7r2pPNDSQ29cyXL+AUe/DMuWtkCQV4oUhqkGTM=
X-Google-Smtp-Source: AGHT+IEJcaQRbdb5iXSUbFFTFd5Dx5u5dU4+Z4N8yBGL4k/7OMu5AD0NgVT0ltSdZPiVS9E8vuQf2A==
X-Received: by 2002:a05:6e02:180c:b0:3a6:ad61:7ffc with SMTP id e9e14a558f8ab-3a6f1a6441amr217814515ab.17.1731450765379;
        Tue, 12 Nov 2024 14:32:45 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f982101csm24740125ab.9.2024.11.12.14.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 14:32:44 -0800 (PST)
Message-ID: <f0afe22e-60c4-4389-8bd2-ff79d65f002c@linuxfoundation.org>
Date: Tue, 12 Nov 2024 15:32:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
To: Daniel Vetter <daniel@ffwll.ch>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241111163723.9002-1-skhan@linuxfoundation.org>
 <CAKMK7uGS3FJVp690She5d+XbQV5x7yQFPozta4cfnzga-BYAOQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKMK7uGS3FJVp690She5d+XbQV5x7yQFPozta4cfnzga-BYAOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/24 12:21, Daniel Vetter wrote:
> On Mon, 11 Nov 2024 at 17:39, Shuah Khan <skhan@linuxfoundation.org> wrote:
>> The Code of Conduct committee's goal first and foremost is to bring about
>> change to ensure our community continues to foster respectful discussions.
>>
>> In the interest of transparency, the CoC enforcement policy is formalized
>> for unacceptable behaviors.
>>
>> Update the Code of Conduct Interpretation document with the enforcement
>> information.
>>
>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>> Acked-by: Theodore Ts'o <tytso@mit.edu>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>
>> Changes since v1:
>> - Updates Acks with Ted's ack.
>> - Fixes subsection formatting as per Randy's suggestion.
>> - Fixes a spelling error.
>>
>>   .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
>> index 66b07f14714c..ebddf218341d 100644
>> --- a/Documentation/process/code-of-conduct-interpretation.rst
>> +++ b/Documentation/process/code-of-conduct-interpretation.rst
>> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>>   Because how we interpret and enforce the Code of Conduct will evolve over
>>   time, this document will be updated when necessary to reflect any
>>   changes.
>> +
>> +Enforcement for Unacceptable Behavior Code of Conduct Violations
>> +----------------------------------------------------------------
>> +
>> +The Code of Conduct committee works to ensure that our community continues
>> +to be inclusive and fosters diverse discussions and viewpoints, and works
>> +to improve those characteristics over time. The Code of Conduct committee
>> +takes measures to restore productive and respectful collaboration when an
>> +unacceptable behavior has negatively impacted that relationship.
>> +
>> +Seek public apology for the violation
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The Code of Conduct Committee publicly calls out the behavior in the
>> +setting in which the violation has taken place, seeking public apology
>> +for the violation.
>> +
>> +A public apology for the violation is the first step towards rebuilding
>> +the trust. Trust is essential for the continued success and health of the
>> +community which operates on trust and respect.
>> +
>> +Remedial measures if there is no public apology for the violation
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The Code of Conduct Committee determines the next course of action
>> +to restore the healthy collaboration by recommending remedial measure(s)
>> +to the TAB for approval.
>> +
>> +- Ban violator from participating in the kernel development process for
>> +  a period of up to a full kernel development cycle. The Code of Conduct
>> +  Committee could require public apology as a condition for lifting the
>> +  ban.
>> +
>> +The scope of the ban for a period of time could include:
>> +
>> +    a. denying patch contributions and pull requests
>> +    b. pausing collaboration with the violator by ignoring their
>> +       contributions and/or blocking their email account(s)
>> +    c. blocking their access to kernel.org accounts and mailing lists
>> +
>> +Once the TAB approves one or more of the measures outlined in the scope of
>> +the ban by a two-thirds vote, the Code of Conduct Committee will enforce
>> +the TAB approved measure(s) in collaboration with the community, maintainers,
>> +sub-maintainers, and kernel.org administrators.
> 
> This is a detail I missed at first, but I think it's a very important
> one and needs to be highlighted.

The paragraph after this one clears these questions and concerns.
> 
> Years ago when the kernel CoC was put in plae, there was a very long
> discussion around whether maintainers are required to enforce the CoC,
> or not. The rather strong consensus was that they are not responsible,
> but help is appreciated, as documented in this patch: c1d1ba844f01
> ("Code of conduct: Fix wording around maintainers enforcing the code
> of conduct")
> 
> This was also acknowledged once more in a patch merged two years ago
> with c1d1ba844f01 ("Code of conduct: Fix wording around maintainers
> enforcing the code of conduct") by changing "decisions by the
> committee" into "decisions regarding enforcement recommendations", to
> make it very explicit that they're just recommendations to the TAB and
> maintainers and that the CoC team does not have independent
> enforcement powers.
> 
> The approval by the TAB is still here, but maintainers don't seem to
> get a say anymore. Is this the intention, because it seems to be a
> really substantial change? From our experience on the fd.o side, there
> is a subset of maintainers who do not appreciate this responsibility
> at all and very much would not like to have it. Given that, and the
> kernel's strong consensus a few years ago against this I don't think
> enlisting maintainers for enforcement without a wide agreement is
> going to be well received - even when personally I think it's the
> right approach to CoC enforcement, I did not put an ack on that patch
> for clear reasons.
> 
> Also, if a maintainer refuses to implement an enforcement decision,
> will they be sanctioned too? Since this is all an entirely new section
> and does not touch any of the existing sections I'm also not clear on
> when one or the other rules apply, and how they interact.
> 
> This part looks confusing to me, and a bit in a scary way.
> 
> Cheers, Sima
> 
> 
>> +
>> +The effectiveness of the remedial measure(s) approved by the TAB depends
>> +on the trust and cooperation from the community, maintainers, sub-maintainers,
>> +and kernel.org administrators in enforcing them.

This paragraph clearly indicates the scope. The key work is "cooperation".
It isn't the intent to force maintainers to enforce it. On the contrary,
the Code of Conduct Committee's ability to enforce a ban relies on the
cooperation from the community.

There are several checks and balances for bans can be approved, such as
the CoC Committee has to agree on the ban, the TAB has to agree on it
and vote on it.

This document makes that very clear.

thanks,
-- Shuah

