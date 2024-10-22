Return-Path: <linux-doc+bounces-28271-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE39AB410
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 18:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183ED1C22CCE
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 16:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0121BC08C;
	Tue, 22 Oct 2024 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="DqEUv5sS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C649652;
	Tue, 22 Oct 2024 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614681; cv=none; b=VHAsmAfGB7KRHIGLzOpSbYeqopLHdXGfhMYI+5q+D/rwsBdT9BbRy6KU7C2YSjVjtpZDQzhTCxnB2Q0GzMcEH+JTuXQY9y/ZuZN6XWnbCO/piui48mX0/CO5UpStSxo3NKFS2QWkSWPsjwj6Gd46qjYdBpdgiwKh1y3cSHHi1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614681; c=relaxed/simple;
	bh=VJwj7MA066z9kHAFfL/2sU7sqKINqbMoM+lr7owpILc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KR6M/zlYjrkSxii4LSroXNZU+qJ7uYB9mqzC9QWEwAoOpUkEkETM054RcUgAoZzhS1mY3LEConxqWBabqjtPR7pGfXViURX6GPsJ49JG9+f5DTezPbp53MAZf0TvO7JVNKvpjff6jZUyZf6B7jbsoAMD768Y7+MoNZ+r/RHO/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=DqEUv5sS; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [192.168.7.205] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 49MGUlQm814998
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 22 Oct 2024 09:30:48 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 49MGUlQm814998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024101701; t=1729614651;
	bh=CXELoJvoHyovP8cYyonhwjwqYSsgW6npVYhZM7l3PFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DqEUv5sS1M10ZxZfbA22WXJBks/LmSjbytQxrGg1FbV69rKiZmCBXiJJGUu7YyDtV
	 tw8dtZPgjFvKnHtUmycexjbzpH4bs7f59uYLUa0u9yJkTudRHRGQOqmp8GzUR+IXQG
	 Kxc+ui5uSfKfG/rAxhHIBdbn5bbjVy87nnMlLlcbPwZTDcdnUK4Q2Bm7qvr2ccwrDP
	 6dR38i5joF9W1TVwEk4PsWJUf68jk536cntE+NKXF9o1mEMtbqZq6gKHOTUjS4SO0+
	 VyjhK02qkdJnPV9cDsXBk5cAl5sfcSx/agGpWGv6AD+SEgi587LD/nHTsNIxYTCbnN
	 kjBBiwkdAflog==
Message-ID: <5582cf56-0b22-4603-b8e2-6b652c09b4fa@zytor.com>
Date: Tue, 22 Oct 2024 09:30:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/27] KVM: VMX: Add support for the secondary VM exit
 controls
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
        corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        luto@kernel.org, peterz@infradead.org, andrew.cooper3@citrix.com
References: <20241001050110.3643764-1-xin@zytor.com>
 <20241001050110.3643764-4-xin@zytor.com> <ZxYQvmc9Ke+PYGkQ@intel.com>
 <10aa42de-a448-40d4-a874-514c9deb56a3@zytor.com> <ZxcSPpuBHO8Y1jfG@intel.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <ZxcSPpuBHO8Y1jfG@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> 		_vmentry_control &= ~n_ctrl;
>>>> 		_vmexit_control &= ~x_ctrl;
>>>
>>> w/ patch 4, VM_EXIT_ACTIVATE_SECONDARY_CONTROLS is cleared if FRED fails in the
>>> consistent check. this means, all features in the secondary vm-exit controls
>>> are removed. it is overkill.
>>
>> Good catch!
>>
>>>
>>> I prefer to maintain a separate table for the secondary VM-exit controls:
>>>
>>>    	struct {
>>>    		u32 entry_control;
>>>    		u64 exit2_control;
>>> 	} const vmcs_entry_exit2_pairs[] = {
>>> 		{ VM_ENTRY_LOAD_IA32_FRED, SECONDARY_VM_EXIT_SAVE_IA32_FRED |
>>> 					   SECONDARY_VM_EXIT_LOAD_IA32_FRED},
>>> 	};
>>>
>>> 	for (i = 0; i < ARRAY_SIZE(vmcs_entry_exit2_pairs); i++) {
>>> 	...
>>> 	}
>>
>> Hmm, I prefer one table, as it's more straight forward.
> 
> One table is fine if we can fix the issue and improve readability. The three
> nested if() statements hurts readability.

You're right!  Let's try to make it clearer.

> I just thought using two tables would eliminate the need for any if() statements.
>

One more thing, IIUC, Sean prefers to keep
VM_EXIT_ACTIVATE_SECONDARY_CONTROLS set if it's allowed to be set and
even bits in the 2nd VM exit controls are all 0.  I may be able to make
it simpler.




