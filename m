Return-Path: <linux-doc+bounces-95324-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPMQBZi6TGo3owEAu9opvQ
	(envelope-from <linux-doc+bounces-95324-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:36:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8307192E4
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:36:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=RQ6Y0C2W;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95324-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95324-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEB1A30158B9
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 08:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0989F2459E5;
	Tue,  7 Jul 2026 08:36:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684D221F26;
	Tue,  7 Jul 2026 08:35:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413359; cv=none; b=eR7G+JsfRQdrXztmzsCoHlZB9Qjlb7oQ+dLDWeCMm5xRmP+iXwq4+Fb0mZloKKxOAMnwrqiS8OfpMP4xserMGC8fiN3/CHvNAf5PCOHW1JTSFb0SlW+uwFelXJWZ2OBWTjqc33vYLiUmxtByYHbObnGZdXWdYxPBjo0tcHYlhLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413359; c=relaxed/simple;
	bh=u3RlVTowKqTUJwgRzp3SA9YrCrbi3lk5EF2OOQEph4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/+0XpgI6mXOPjWBWhBQd5hrN/51Flp2HI1g6B+c5MRo9dtef+jw/6vJA8Wk97HeegyPWqndT1YRh4ht4/9QtUQfk+f4khLylNLIaCjVwuSrpQVlvh5RDt/Dh2zWKGv7FagrTzS5Cy6GzJgnMSPjNUuPNKlqvKwxnQolhT+bMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RQ6Y0C2W; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDBCF2379;
	Tue,  7 Jul 2026 01:35:48 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E5E3F85F;
	Tue,  7 Jul 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783413353; bh=u3RlVTowKqTUJwgRzp3SA9YrCrbi3lk5EF2OOQEph4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQ6Y0C2Wptt8NGN3y917WJAMNoPF9+mkViw0HKaM+pw37cU5w3GN2wq/zSyBfkaPQ
	 douyxLGmNgkVyeJzYO7uti42uJmucdVttqpysAYMQ9G+LnV4dh7WrDzO9Bbla8RDM6
	 pN19sG4XRgGtc5XGE2xYWPrh/LDVrceOe3vBzEcs=
Message-ID: <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
Date: Tue, 7 Jul 2026 09:35:49 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
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
	TAGGED_FROM(0.00)[bounces-95324-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D8307192E4

Hi Reinette,

On 7/6/26 22:33, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/6/26 9:06 AM, Ben Horgan wrote:
>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>> MPAM uses a binary fixed point fraction format for MBA rather than a
>> decimal percentage, this introduces rounding errors.
>>
>> Without this additional rounding, if the user reads the value in an MB
>> schema and then writes it back to the schema, the value in hardware won't
>> change. However, with this additional rounding, this guarantee is broken
>> for systems with mbw_wd < 7.
>>
>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>> to specify the conversion resctrl does to the user-provided bandwidth
>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>> conversion.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>
> 
> Unfortunately the "---" separator is missing here.

Another silly mistake.. sorry about that. I've corrected locally and
will send a respin in a day or two.

Thanks,

Ben

> 
>> Changes since v3:
>> Parameter order switch (Reinette)
>> Add Reinette's R-b
>> ---
> Reinette


