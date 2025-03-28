Return-Path: <linux-doc+bounces-41883-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CFDA74F35
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 18:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B44188C27A
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 17:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D241A08B1;
	Fri, 28 Mar 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="IQGhsRLv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCFF23CB;
	Fri, 28 Mar 2025 17:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182787; cv=none; b=cFXFmpRttjnT7Wv8DFwa9iTtMxtPCQzMxZRBuoGVtaDC5Cdv/QBhgeMKwnVUQa6Fl09GxeVfZMbewGBnK5FizSQIjHNHniEEgsp2F4i4mc8IiO0eL05SnKwIvn/KKpliukouZeSXPdv1hgXYUZqUFU7sJCUJM4v2A4caaSjorOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182787; c=relaxed/simple;
	bh=NuLgCqHmnQ0wvILrKWLCFbD5y2KRQVi/PxqscccoZZs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j0iEtRL2NgPhIsKx7uDMvmWeqE++ZB7wRZVEIfb6fmQFKaNAYJEZRVo+wnAn2q5QxgJFGbiJe7XmM4WSwYxMf83PgKjLCKAV6I1Nwp04tOViIIU8R2CkHJ3lQeg6/X5/YffadcQv8h+BshSfGzb1PYbXlsi8If0oY3eWEhKFprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=IQGhsRLv; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52SHPuMJ2035654
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 28 Mar 2025 10:25:56 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52SHPuMJ2035654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743182758;
	bh=3Q3WizmAsVjpsON47KnbDqn8XHmFer42sXL5XTkOsnY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IQGhsRLv6QYNGoeHugz3a/SEvN0EW5nPtTHHtcDAZ7HqsVD2+sq5dVKv/eHHokQGI
	 kQXWKqX9a7E2MAm+xCEKVAMKTZRURRICj63dCPJdE/IrMd898QHl5W5vkJX3v9+ckH
	 BS2D24eFj+ld4P11z/u2q1UC/PGQSPd3ZhhO/tAA9RzDvGwu1e0iVlAMIm3WqJ099C
	 jxuPdk4QKvVkXddLUBDHjyl5L2nNxjZ6Wgxn6x+Hkx9zfNAfuV2enoREbHk/jqxjLi
	 tsMP6/GxWYmDOHg3GQjDVaKB5O35v1I+NnsgJsYJ9KPfuit6mOP0HFPaMXxYkS0V1u
	 cXMdqoKbeYViw==
Message-ID: <d243d203-7514-4541-9ea2-1200f7116cc1@zytor.com>
Date: Fri, 28 Mar 2025 10:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] Enable FRED with KVM VMX
From: Xin Li <xin@zytor.com>
To: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        andrew.cooper3@citrix.com, luto@kernel.org, peterz@infradead.org,
        chao.gao@intel.com, xin3.li@intel.com
References: <20250328171205.2029296-1-xin@zytor.com>
Content-Language: en-US
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <20250328171205.2029296-1-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/2025 10:11 AM, Xin Li (Intel) wrote:
> This patch set enables the Intel flexible return and event delivery
> (FRED) architecture with KVM VMX to allow guests to utilize FRED.
> 
> The FRED architecture defines simple new transitions that change
> privilege level (ring transitions). The FRED architecture was
> designed with the following goals:
> 
> 1) Improve overall performance and response time by replacing event
>     delivery through the interrupt descriptor table (IDT event
>     delivery) and event return by the IRET instruction with lower
>     latency transitions.
> 
> 2) Improve software robustness by ensuring that event delivery
>     establishes the full supervisor context and that event return
>     establishes the full user context.
> 
> The new transitions defined by the FRED architecture are FRED event
> delivery and, for returning from events, two FRED return instructions.
> FRED event delivery can effect a transition from ring 3 to ring 0, but
> it is used also to deliver events incident to ring 0. One FRED
> instruction (ERETU) effects a return from ring 0 to ring 3, while the
> other (ERETS) returns while remaining in ring 0. Collectively, FRED
> event delivery and the FRED return instructions are FRED transitions.
> 
> Intel VMX architecture is extended to run FRED guests, and the major
> changes are:
> 
> 1) New VMCS fields for FRED context management, which includes two new
> event data VMCS fields, eight new guest FRED context VMCS fields and
> eight new host FRED context VMCS fields.
> 
> 2) VMX nested-exception support for proper virtualization of stack
> levels introduced with FRED architecture.
> 
> Search for the latest FRED spec in most search engines with this search
> pattern:
> 
>    site:intel.com FRED (flexible return and event delivery) specification
> 
> Following is the link to the v3 of this patch set:
> https://lore.kernel.org/lkml/20241001050110.3643764-1-xin@zytor.com/
> 
> Since several preparatory patches in v3 have been merged, and Sean
> reiterated that it's NOT worth to precisely track which fields are/
> aren't supported [1], v4 patch number is reduced to 19.
> 
> Although FRED and CET supervisor shadow stacks are independent CPU
> features, FRED unconditionally includes FRED shadow stack pointer
> MSRs IA32_FRED_SSP[0123], and IA32_FRED_SSP0 is just an alias of the
> CET MSR IA32_PL0_SSP.  IOW, the state management of MSR IA32_PL0_SSP
> becomes an overlap area, and Sean requested that FRED virtualization
> to land after CET virtualization [2].

Hi Sean,

Any chance we could merge FRED ahead of CET?

Ofc with proper changes to FRED code.

Thanks!
     Xin

> 
> [1]: https://lore.kernel.org/lkml/Z73uK5IzVoBej3mi@google.com/
> [2]: https://lore.kernel.org/kvm/ZvQaNRhrsSJTYji3@google.com/




