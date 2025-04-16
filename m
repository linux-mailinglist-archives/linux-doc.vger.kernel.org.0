Return-Path: <linux-doc+bounces-43249-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63993A8AAFC
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 00:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6971517DEBB
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 22:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74A02749C8;
	Tue, 15 Apr 2025 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Y9+kIl2p"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82B22686F
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 22:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755175; cv=none; b=DCEq8vziQ7kc0QQ3x8O03Rtu61EgeJhBwCGNfEla8FOWIUHD9T4wCAeAOU5h/xhEjsuvB3qC9EGMvROjSdDb481hbT46ka4PseosPlUCQ2uiA+JVGLUQdgygjU9AU3irWoOE6jq7sA/DrQFS+f3oIHzZoRp3xd1v4j0lENN4coA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755175; c=relaxed/simple;
	bh=OA6xI7hqO5jrJ8K575jApn7TkXssdd7vTrMbDXVITdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB0OLKKbTciQSqm1lsH5CPqt1xY/yIH/6dyLTxvorsX06VaOHq2Qd8pihKuS8Plagk1B+VY6oP48ITWJ8GyntbpFGmsb0Nx8h0r0LRrF6ZYsHA6TRRf3Yzz+uGH3cPQEehkeG9QelwlVk4I7MK/4UlqBVr6dWZAJwgjBshMD52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Y9+kIl2p; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso46062255e9.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 15:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744755172; x=1745359972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Glra7fMFRLxrPIzQwxk8Qeb1or+7AFryoPxji38Wm8U=;
        b=Y9+kIl2pTvTNtKptfWoXwbO4WfA4ZnV/MmkRAY8mNJgHO8wWh8fhkTL9ta5oNI3gAP
         JyX5jtNeFFi6qnWvzUC+W+K1+LaizCj2/2MkD2dF68VRSF7rkthebLJTOYHaCXTwO9MH
         HzjMHr03lDL5cNmXgTrIajzH7dzLPfRarVLOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755172; x=1745359972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glra7fMFRLxrPIzQwxk8Qeb1or+7AFryoPxji38Wm8U=;
        b=DykIDxG7y13QBBzhRorc54yB03k29dLwzF7eHty4SewhOmZd1Ky0Zq/Evom8MAT/5F
         4naO5qjO6l5va1GMhqk1fXbRfF34Eedyq8NtgGEQy/NlndY61XwxIMU4OaHYWU9bBZC0
         VDiXBsFqXbBcQIeiAHAn7xdG9VZ0un00M3Ha8dIdsERfz6Tosdb5GiQymUp+zyQJH5xV
         9kRNV9ZYm73z2DskMsEMhVIuJNwOXyETQPjtJ8Q+tTRvPwEDJne+WA76B9eNjGfkHYB8
         OkK6igxNLcxgmnwDAxv1ARvKTBIhAYvFrE93RsUc78klZTEruhkOUfKZrTViPN/vlXCr
         0L7A==
X-Forwarded-Encrypted: i=1; AJvYcCWKaONPMKJgh6aCQif0ON3zI1oqAxJUO7Mr+aEuDq5SMjMV6kTt70WN40Uu2VuuznS41i3hDYUHc7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/6d5c0WDQzKs5h16bh3UnwSOSe717hATR77vGEsTGpQXEyDk
	dEA6T3d/+RPdQp8/2MIHNMLTYtoG1DU9Mi4iEBSqap5v9vTiXmt0lZHZIsD9n5w=
X-Gm-Gg: ASbGncsXombZJxkk8DwqS102jxTMq0+PmtZdCi4jqXSNLn3JpWauhz+smjSOYYcnjrx
	CV1e+Vo6a3ujaGhSSuL8mAafgBZdL/mvYoVNuIwUnoiwc+KsFqMI9vwSfOdQn8d5GoP2laBmSkQ
	6rIV5eHThceJAu+rjo3oqiBPmXCuXQTH9AKZ3n1XbbgHPxu00eCxBfuaRazPaYwxDd42jxZi/q4
	S16Ew2SomN3+IN2l3yqukoN7HYXXaWvBc0OJWsy6o9LXjs+MSHg9flj36vU1FoudhQ7og1NFT7I
	N5MwaGF/+oSYAlKjESnnNGwNUHki+thV8pzA7ExS9BjR7E1nYscNFc0eroCRXOpj/U1wgwVNozs
	1w99vYQ==
X-Google-Smtp-Source: AGHT+IHMt3F9pL0n8daCGA27MStUQTKqmwZC5+FBFhrh37dgHkJZdg1MMLEuJ5Tc1qMw2mZGLdp7Bg==
X-Received: by 2002:a05:600c:3ca0:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-4405a0ec7cbmr5103475e9.33.1744755172019;
        Tue, 15 Apr 2025 15:12:52 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2cfesm2246405e9.19.2025.04.15.15.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 15:12:50 -0700 (PDT)
Message-ID: <e781cabc-90ee-48cf-9a09-116a8edace1e@citrix.com>
Date: Tue, 15 Apr 2025 23:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/19] x86: Secure Launch kernel early boot stub
To: Sean Christopherson <seanjc@google.com>,
 Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kexec@lists.infradead.org,
 linux-efi@vger.kernel.org, iommu@lists.linux.dev,
 dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, ardb@kernel.org,
 mjg59@srcf.ucam.org, James.Bottomley@hansenpartnership.com,
 peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, luto@amacapital.net,
 nivedita@alum.mit.edu, herbert@gondor.apana.org.au, davem@davemloft.net,
 corbet@lwn.net, ebiederm@xmission.com, dwmw2@infradead.org,
 baolu.lu@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com
References: <20250410204149.2576104-1-ross.philipson@oracle.com>
 <20250410204149.2576104-10-ross.philipson@oracle.com>
 <Z_mMaAykU0IVKsjU@google.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_mMaAykU0IVKsjU@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2025 10:40 pm, Sean Christopherson wrote:
> On Thu, Apr 10, 2025, Ross Philipson wrote:
>> +	 * instruction can return for a number of reasons. Test to see if it returned
>> +	 * because the monitor was written to.
>> +	 */
>> +	monitor
>> +
>> +1:
>> +	mfence
>> +	mwait
>> +	movl	(%eax), %edx
> Why load the value into EDX?  At a glance, the value is never consumed.
>
>> +	testl	%edx, %edx
>> +	jz	1b
> This usage of MONITOR/MWAIT is flawed.  The monitor needs to be re-armed in each
> loop, otherwise mwait will be a glorified nop.
>
> More importantly, the exit condition needs to be checked before monitor,

after monitor and before mwait.

But yes, the prior logic was definitely wonky.

>  even on
> the first iteration.  In the (probably extremely unlikely) scenario that the write
> to wake the CPU arrives before MONITOR is executed, this CPU may get stuck waiting
> indefinitely.
>
> E.g. something like:
>
>
> 1:
> 	monitor
> 	cmpl	(%eax), 0

$0

Luckily, this will fail to assemble, rather than dereferencing 0.

~Andrew

> 	jnz	2f
> 	mwait
> 	jmp	1b
> 2:


