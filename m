Return-Path: <linux-doc+bounces-95181-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VoceOlTXS2r2bAEAu9opvQ
	(envelope-from <linux-doc+bounces-95181-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:27:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 587187133E9
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:27:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=MOHAloyd;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95181-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95181-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AD1F32ABD5D
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 15:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A398422528;
	Mon,  6 Jul 2026 15:49:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896BD41DED9;
	Mon,  6 Jul 2026 15:49:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352963; cv=none; b=h6wUJIBK2zFU2RHAcwrp4JKnk8upDX+yoQsgjkSGb8tsXBMWcwGwHIspi3cKUo2nHfGDShbEhj8sYOcGxVz8IRQ1yez+z/XuiwcG344hquujmCD8G90IxXY24pYjYiSKPP04y39LJO4R9Wy38bFOZyd+wkEwNBnLsjaYP947/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352963; c=relaxed/simple;
	bh=4pV7GGRE4+B12sGcbtHLfldXfMh6UfXhgLyVeuaZ+hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfLcGUCf+IUclRrnCq4PQ8cqkLoQ+S8F0I+cdoEZ40MPFWCS65Z290kMoN26amhUJ2Qtt7p87N7f6EYIqQg6n4miZvwJXOXmrVSKxHB3xxd47S39gIrjCXXfc+no1LLFqA39j4X53D8yBC29Vty2qOyGwWzsHSevwODzYOjWbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MOHAloyd; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BCC51BCA;
	Mon,  6 Jul 2026 08:49:16 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C5AA3F7B4;
	Mon,  6 Jul 2026 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783352960; bh=4pV7GGRE4+B12sGcbtHLfldXfMh6UfXhgLyVeuaZ+hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MOHAloydZ3OtDpev36IzbSM1TojqUQx0V2RZw12oHqukAvb7FfkRzJ2CdCcJP4sQC
	 Ue3FBf008FZCN2yv/arqAjGKDGK9EQlC8x10GO7LFNumliK9tQTKmljfS3XSQLcQx9
	 iLeq33o4FCGFfCf+ghHJ/xGST9lNKzR0BNfWVsi8=
Message-ID: <49436a6b-ab0c-4c57-8eb7-a332cd6c6f6e@arm.com>
Date: Mon, 6 Jul 2026 16:49:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260515140612.1205251-1-ben.horgan@arm.com>
 <d53df455-437e-458e-a7f8-72681ab4d3fa@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d53df455-437e-458e-a7f8-72681ab4d3fa@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95181-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:reinette.chatre@intel.com,m:james.morse@arm.com,m:fenghuay@nvidia.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:corbet@lwn.net,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:dave.martin@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 587187133E9

Hi Reinette,

On 6/5/26 19:41, Reinette Chatre wrote:
> Hi Ben,
> 
> On 5/15/26 7:06 AM, Ben Horgan wrote:
>> This is a new version of Dave Martin's patch [1] to delegate rounding of
>> bandwidth control user values to the arch code. As there is now more than one
>> architecture using resctrl, I split the original patch into two, a core resctrl
>> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
>> break down and ordering is sensible and whether the pattern should be followed
>> for any future similar changes.
> 
> This ordering is sensible to me. I find the patch breakdown a bit fragmented since
> the logical resctrl fs change is split yet I also find that you did what was best
> to ensure bisectability. I find small changes that are local to subsystems easier to
> consider and believe it would be ideal to only have patches touching multiple
> subsystems when it cannot be avoided, for example when doing otherwise would break
> bisect. Even so, we may learn of better ways to do this when this series is considered
> for x86 inclusion.

Thanks for giving me your view on this, the review and the R-b's. I find
all your proposed changes reasonable and have included them (and only
those changes) in a v4 which I will post shortly.

Thanks,

Ben

> 
> Reinette
> 


