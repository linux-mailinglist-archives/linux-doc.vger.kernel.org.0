Return-Path: <linux-doc+bounces-82698-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDN5CYsf1Wnr0wcAu9opvQ
	(envelope-from <linux-doc+bounces-82698-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 17:15:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5D3B0C47
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 17:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A690C3004425
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4657A35837C;
	Tue,  7 Apr 2026 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WfxbU98J"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EFE349AE0;
	Tue,  7 Apr 2026 15:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574776; cv=none; b=aIVI5XbB1nY+xyMj6caa0uxl9LT/m0+TPuk/TNjiq4nfAlGct9uBQOniSEf8ht7JJuId7CKX6EvD7wZwrd8n4YxRdvnEETtTZa4XhR/m3Wzwxmzno24+h+eJQ/qaRES2HqVubE8jl4g43iWcHylWFTJaUlBpBR3twX2ulml7EbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574776; c=relaxed/simple;
	bh=eN18IrONevsoo58gEUdDHXiEgoDM2LKGg0S0uh2Re5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiOLjHs06Qs1Kl3EGlqYacAuPiZjtCkvu3DLzbgWVH4dAEakBwPXCRxbusRXrUr4edA2A0NNmTn70GdeSjuqEPj+usXy0GRRUyDzV8muZuLBgl3LVFP8IfiRN7Nmj5LW7nJ/oVpMJR5KP/0E1O//kDq+/FL/xxDKZdzj3VLhYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WfxbU98J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFB623293;
	Tue,  7 Apr 2026 08:12:47 -0700 (PDT)
Received: from [10.57.62.47] (unknown [10.57.62.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322143F7D8;
	Tue,  7 Apr 2026 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775574773; bh=eN18IrONevsoo58gEUdDHXiEgoDM2LKGg0S0uh2Re5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WfxbU98JLhxx24PyPN7oX1VXAEQLQ6QcE8Vg6D5u/gaffXdgZeCi06wkdKW/utfk+
	 kokY0lqImfvFUceZ40JU4ui5cLu74Pn57bZ8IZB4pMS4A+8oeHdwgL0dbLP8YJgnQt
	 0mTS6c1gtdFIdg8gXhskpAs1ikGD0tuxSxwByk8A=
Message-ID: <2d2aac86-2780-4a29-9eef-116c26485812@arm.com>
Date: Tue, 7 Apr 2026 17:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: proc: document ProtectionKey in smaps
To: Dave Hansen <dave.hansen@intel.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Yury Khrustalev <yury.khrustalev@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260407125133.564182-1-kevin.brodsky@arm.com>
 <98880cc2-09be-4bd8-b8f4-f0f0845f939e@intel.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <98880cc2-09be-4bd8-b8f4-f0f0845f939e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-82698-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 46C5D3B0C47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 16:42, Dave Hansen wrote:
> On 4/7/26 05:51, Kevin Brodsky wrote:
>> +If both the kernel and the system support protection keys (pkeys),
>> +"ProtectionKey" indicates the memory protection key associated with the
>> +virtual memory area.
> I think you're trying to get across the point here that the kernel needs
> to know about protection keys, have it enabled, and be running on a CPU
> with pkey support.

Indeed.

> To me "system" is a bit ambiguous here but _can_ refer to the whole
> hardware/software system as a whole. To avoid redundancy, I'd say either:
>
> 	If both the kernel and the processor support protection keys...
>
> or
>
> 	If the system supports protection keys...

I see your point. By "system" I essentially mean the hardware (the SoC).
In general I would tend to avoid "processor" because not all CPUs in a
system necessarily have the same features, and some features require
hardware support beyond the CPU itself. Terminology is hard...

Happy to replace "system" with "hardware" if that's clearer :)

> But I'm ok with what you have in any case. Folks will understand what
> you're saying:

Hopefully!

- Kevin

> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

