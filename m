Return-Path: <linux-doc+bounces-84850-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEWAH0Pw72nYMgEAu9opvQ
	(envelope-from <linux-doc+bounces-84850-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:24:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4247BCF8
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 826FA300AB06
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879923B2FE4;
	Mon, 27 Apr 2026 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjLv5oKi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B993A75AB;
	Mon, 27 Apr 2026 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332288; cv=none; b=Ofg2l63FNJS6Zws0L+KJNp7F146WC5jlayf6ZObpD3KANfVn5xhx17uD3faiGbGusGbKH1Nsudr8xQOvLBeb/mlLc3gA9Gm3SNjkPIpRRnQ/LUhYyBq7v99j/Kwma1Ol0VTFGw2D4LgtEG6+Z2r48G8tvFJK9v91vTZ6dtrDSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332288; c=relaxed/simple;
	bh=k5LX/iOGfg4DxgCKRlqxi9ADeIVkwGAirV5Y9IyAgzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZE0w1uVTjnoy+hJLMdmvpEJ5bBWstxc5dZ9hWKqCKuuS1Nh7o3V/QOzVQnxCi0LBYaK/RJN5KTWmH1HXB0o03DcbHFWXzeg+qH8Js9IuoO4yW0EzPF6Q0JZxQz17ukOWm5xVT0Mr2DPu88Jq+bKMeWHmxHBj/niEKa0V1auY3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjLv5oKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC19C19425;
	Mon, 27 Apr 2026 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777332288;
	bh=k5LX/iOGfg4DxgCKRlqxi9ADeIVkwGAirV5Y9IyAgzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjLv5oKior0IPXlcphMDQ0Syj88J3E7v2IyptzNqXJxsLs1ekNkLlz+9KQFauh2Kf
	 725yqf9BwAoImAJ5E9gZJumdsgaWFPpOuSf5ZrdF+WTFcjw6re4QjeFT1tPyiVAfbk
	 3tmgCvXrggQ57O5l/G/7a01xIa3ahlwqhBerQ6vSklF4eU7GCHCmsUc8a/yboCz7qR
	 d+OF7BvAZHNU85QNIZzDPucHETj8II6wQbF5+ssUAfe26N68mFJ9hHLaLg7XNcmwsF
	 eIUbrxtqV9cfykkr1XmzGm/SY3s/03X9WVRdc9opk93qdkARptYxgDwaXKVDr1RQEs
	 PLCmp8PJnOiVw==
Date: Mon, 27 Apr 2026 19:24:46 -0400
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
Message-ID: <ae_wPuqYpVxicOUq@laps>
References: <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
 <aev-DS4YTp5soVPd@laps>
 <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>
 <aezt96xgz_qyf4d-@laps>
 <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org>
 <ae9ucgtCNf0JQtGu@laps>
 <c50aeb03-538b-4dca-9a81-ab84bc19a333@kernel.org>
 <ae-xXHUGfDiFcBUk@laps>
 <36d82055-67f3-4c29-a605-a9848a28f7cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <36d82055-67f3-4c29-a605-a9848a28f7cb@kernel.org>
X-Rspamd-Queue-Id: 1CA4247BCF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84850-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,elisa.tech:url,acm.org:url]

On Mon, Apr 27, 2026 at 09:37:02PM +0200, David Hildenbrand (Arm) wrote:
>
>>>
>>> Thanks, but I fundamentally don't understand how RAS capabilities interact here?
>>> We have mm/memory-failure.c for a reason :)
>>
>> We do, but self driving safety requires way more than the current hardware can
>> provide.
>>
>> I'll point you to https://dl.acm.org/doi/10.1145/2775054.2694348 , which
>> researched these issues in a datacenter environment (so no sun exposure,
>> temperature controlled, designed to avoid electromagnetic interference).
>>
>> "We call a fault that generates an error larger than 2 bits in an ECC word an
>> undetectable-by-SECDED fault. A fault is undetectable-by-SECDED if it affects
>> more than two bits in any ECC word, and the data written to that location does
>> not match the value produced by the fault."
>>
>> [...]
>>
>> "A Cielo node has 288 DRAM devices, so this translates to 6048, 518, and 57.6
>> FIT per node for vendors A, B, and C, respectively. This translates to one
>> undetected error every 0.8 days, every 9.5 days, and every 85 days on a machine
>> the size of Cielo."
>>
>> [...]
>>
>> "Our main conclusion from this data is that SEC-DED ECC is poorly suited to
>> modern DRAM subsystems. The rate of undetected errors is too high to justify
>> its use in very large scale systems comprised of thousands of nodes where
>> fidelity of results is critical."
>
>Yes, I read before that ECC is insufficient to detect certain bitflips.
>
>But I don't understand how this patch set here is going to move the needle in
>any reasonable way?
>
>You have your magical self-driving car algorithm.
>
>Bitflips can corrupt your algorithm, your data, the kernel image, your user page
>tables, your kernel page tables. Even a pointer to a bitmap :)
>
>... and we worry about the state of allocated vs. free pages.

Do we agree that this is one piece of a (much) larger puzzle that we would need
to tackle?

>Please enlighten me!

Definitely! This is a pretty hefty body of work, so outside of trying to get
the code out there we're also working on documentation, talks, webinars, etc in
the context of ELISA (https://elisa.tech/).

The concept itself was approved by an independant assessor as compliant with
the relevant safety standard, so the story is there, we're just working on
getting it out.

-- 
Thanks,
Sasha

