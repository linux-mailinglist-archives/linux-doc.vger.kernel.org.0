Return-Path: <linux-doc+bounces-95913-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SWftOippT2r5gAIAu9opvQ
	(envelope-from <linux-doc+bounces-95913-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:26:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60572EED9
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:26:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=soghxfur;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95913-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95913-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 688B730264FD
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223A43F0746;
	Thu,  9 Jul 2026 09:26:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05222D8773;
	Thu,  9 Jul 2026 09:25:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589160; cv=none; b=fk9AsQY3d9H37ZU7vaipvfNHxNcHtSdz3B9Mpb+7WefRyYt+JBH/1/8fMMt6pnFrVppxEKRH+1Upo9AkU0y6thudJGh2wskKwoqSgH1RBGqzrNGJGD3a4EK6qcSZKVNhVmqyXZfMxwSUKmoG06o95922JQutCe23zIj3JvOxr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589160; c=relaxed/simple;
	bh=r1QShwB/9V/I0bdqwOV4mWuyphrL3DCBdCUyGIHA03s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ec968/s8qL+jwNap6WXStqLSlU3YP9EY/iCe/nKS3YLfbc+4Wxn/CDwaj76Y0el49jkfjIFnglpKkgtvoNxRiiXWD2ckkFD0GkRO2qSqQ9UL0zZMJCg3p8/quIBuuGCFv3040wPiOHHgWj6mkFFPTa2sTKWywGoNQHTMUIMoaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=soghxfur; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E42F9357B;
	Thu,  9 Jul 2026 02:25:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57F2A3F66F;
	Thu,  9 Jul 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589158; bh=r1QShwB/9V/I0bdqwOV4mWuyphrL3DCBdCUyGIHA03s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=soghxfurEEX84ljf4uRd93H+Thd3S0QZKTyNgrf/Ga7kG0mU7NGwTqf5c5fm7BGmg
	 ssRgcMOUX3GkElbF48HVNBWA7lbZD2IhMGp/DpGGXtU+Uq57HwQr8MPEgUzoiNJLu7
	 fDDtZKikUufCT/CUuIZD8Kr9mEAwoj3rR4YNMHKM=
Message-ID: <0aa3bbbc-c0f0-404c-b03b-9113a1e91ce5@arm.com>
Date: Thu, 9 Jul 2026 10:25:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
 <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
 <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
 <8d5d9c98-54df-44fe-8795-189554ea2399@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8d5d9c98-54df-44fe-8795-189554ea2399@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95913-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:reinette.chatre@intel.com,m:james.morse@arm.com,m:fenghuay@nvidia.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:corbet@lwn.net,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:dave.martin@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C60572EED9

Hi Reinette,

On 7/7/26 15:51, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/7/26 1:35 AM, Ben Horgan wrote:
>> Hi Reinette,
>>
>> On 7/6/26 22:33, Reinette Chatre wrote:
>>> Hi Ben,
>>>
>>> On 7/6/26 9:06 AM, Ben Horgan wrote:
>>>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>>>> MPAM uses a binary fixed point fraction format for MBA rather than a
>>>> decimal percentage, this introduces rounding errors.
>>>>
>>>> Without this additional rounding, if the user reads the value in an MB
>>>> schema and then writes it back to the schema, the value in hardware won't
>>>> change. However, with this additional rounding, this guarantee is broken
>>>> for systems with mbw_wd < 7.
>>>>
>>>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>>>> to specify the conversion resctrl does to the user-provided bandwidth
>>>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>>>> conversion.
>>>>
>>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>>>
>>>
>>> Unfortunately the "---" separator is missing here.
>>
>> Another silly mistake.. sorry about that. I've corrected locally and
>> will send a respin in a day or two.
> No problem. 
> 
> When you respin, could you please add a snippet to the cover about expectations
> how this series should be merged? This will be the first piece of work that
> touches the x86 and Arm driver as well as resctrl fs code. So far I assumed it
> will go in via tip but I think it will help to state this from Arm side.

Yes, I was assuming that too. I'll make it explicit in the cover letter.

> We still need a plan for if/when the Arm side touches the same code though. Thankfully
> this work is small.

I'm open to whatever works best for you and the others involved.

Thanks,

Ben

> 
> Reinette


