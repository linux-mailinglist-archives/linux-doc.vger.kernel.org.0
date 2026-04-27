Return-Path: <linux-doc+bounces-84818-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PsaDGSx72nTDwEAu9opvQ
	(envelope-from <linux-doc+bounces-84818-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 20:56:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1A478E51
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 20:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BAE3300683D
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC593EDAB2;
	Mon, 27 Apr 2026 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9238WJ7"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54EA3EDAA2;
	Mon, 27 Apr 2026 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316190; cv=none; b=GEA/u9dmM6L92+4YJfZW7vd7vftP0J2/w1G6X9qFm6OokUz3pYaCMiUcI0BBMnDBTc3weAbCPy/6/pX+jOLeR4IEnImRfWb93e6qiFv4tiaTwH1Nm2SXJUrw/kfkQO+acCma765Ayvfycxvj5JjdKfwpQeaww+ln0LZS2tR+1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316190; c=relaxed/simple;
	bh=MpePPJ1H5FdPyHmRmIns0IGr3K1GdEibm8qRgpRvHlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSgtjP+MUnIecr+YtrmJcRGnC6vWgnWc5xWQLQ2JPMSajMKmi4Ai1iaaFInhA2K3on3jV1vovM2KTl0Vy2pw4U12X6Ukwi9nxtK0QUgMeArTBkfHAY6a1CvLfBULqzpdUGkXjZybXtmL8QrmLOzqKJlx7rMyDX0D259ILMXE4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9238WJ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0876C19425;
	Mon, 27 Apr 2026 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316190;
	bh=MpePPJ1H5FdPyHmRmIns0IGr3K1GdEibm8qRgpRvHlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9238WJ7iV4t1t3oKjhnDqXFZakWlqZ4NNess3dlMDMIZDHFzAz+6JpkMSch/DGdq
	 yqRIdGKSMaWAyjx2gBngUZs5V4pr2d5q93yVOB3ZvorK6njgG5HQgFeuDEtn0oRHXF
	 Ckwmx05EscNn7uKnmfgSB+miF+SNL+JE9vaSYRwImrmW+Ot2mJKBqA7a6Nyv/IjMcw
	 bUtDgf8BO0YijpQhD1orjHfpR3dfUMxKBSl2P06VHVraZvhkcBFNBcaS1Y+7bBLpE3
	 MaTPGUsbci4BfS2Q1OcojHi9GuML14TlOK15iKFoR3hB5d2dIuYbrWifEuU9CaLMO8
	 YpkWky560Hz5Q==
Date: Mon, 27 Apr 2026 14:56:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, akpm@linux-foundation.org,
	corbet@lwn.net, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, skhan@linuxfoundation.org, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@nvidia.com>, Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: Re: [RFC 4/7] mm: add page consistency checker implementation
Message-ID: <ae-xXHUGfDiFcBUk@laps>
References: <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps>
 <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
 <aev-DS4YTp5soVPd@laps>
 <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>
 <aezt96xgz_qyf4d-@laps>
 <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org>
 <ae9ucgtCNf0JQtGu@laps>
 <c50aeb03-538b-4dca-9a81-ab84bc19a333@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c50aeb03-538b-4dca-9a81-ab84bc19a333@kernel.org>
X-Rspamd-Queue-Id: 31A1A478E51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84818-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 05:40:34PM +0200, David Hildenbrand (Arm) wrote:
>>>>
>>>> For something like a datacenter deployment I'd agree with you - the odds are
>>>> too low to care. For an unsupervised self driving vehicle, where there's no
>>>> human (locally or remotely) available to take over, I'd like the odds to be as
>>>> low as possible :)
>>>
>>> I thought that people usually use special RT OSes (with proven logic etc) for
>>> any safety-related systems. Using Linux on the core safety system sounds ...
>>> scary.
>>
>> RT OSes are indeed the current approach.
>>
>> s/scary/exciting ;)
>
>Not so exciting for the passengers ;)
>
>>
>>> But, I'd expect corruption of other data (user pages? page tables?) a much
>>> bigger problem than page al locator metdata? What am I missing that this here is
>>> -- in context of the bigger problems there -- a thing we particularly care about?
>>
>> You are very correct! The allocator work was fairly standalone, so it was an
>> easy first project to tackle.
>
>But in general, wouldn't we just expect ECC memory to give us an MCE, so we can
>detect what was corrupted and act accordingly?
>
>That's how it usually works: hw detects a memory corruption and injects an MCE.
>We detect that we corrupted memmap state and kill the kernel.
>
>Why does ECC not help here?

It helps, but it's not enough. ECC doesn't detect all errors (For example,
SECDED corrects single-bit, detects double-bit, but triple-bit errors can land
on a different valid codeword).

>> In general, the approach depends on what we're trying to defend from:
>>
>> 1. bugs: an ASI-like MMU enforced "context" system.
>> 2. physics: just like in most other areas - lots of redundancy. For example,
>> consider redundant variables in safety critical code which exists as two
>> copies: var_v1 = value and var_v2 = value XOR mask. When accessing them, read
>> both copies, XOR the second back, compare.
>>
>> There were a few sessions back in LPC about this. Here's the one from Bryan
>> Huntsman which gives a good overview:
>> https://www.youtube.com/watch?v=ie_ClBCed94
>
>Thanks, but I fundamentally don't understand how RAS capabilities interact here?
>We have mm/memory-failure.c for a reason :)

We do, but self driving safety requires way more than the current hardware can
provide.

I'll point you to https://dl.acm.org/doi/10.1145/2775054.2694348 , which
researched these issues in a datacenter environment (so no sun exposure,
temperature controlled, designed to avoid electromagnetic interference).

"We call a fault that generates an error larger than 2 bits in an ECC word an
undetectable-by-SECDED fault. A fault is undetectable-by-SECDED if it affects
more than two bits in any ECC word, and the data written to that location does
not match the value produced by the fault."

[...]

"A Cielo node has 288 DRAM devices, so this translates to 6048, 518, and 57.6
FIT per node for vendors A, B, and C, respectively. This translates to one
undetected error every 0.8 days, every 9.5 days, and every 85 days on a machine
the size of Cielo."

[...]

"Our main conclusion from this data is that SEC-DED ECC is poorly suited to
modern DRAM subsystems. The rate of undetected errors is too high to justify
its use in very large scale systems comprised of thousands of nodes where
fidelity of results is critical."

The passengers you've mentioned before would be excited if they knew how high
the bar is around their safety :)

-- 
Thanks,
Sasha

