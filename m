Return-Path: <linux-doc+bounces-95820-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X360KAfoTmrjWQIAu9opvQ
	(envelope-from <linux-doc+bounces-95820-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 02:15:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F359272B54C
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 02:15:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=A6HDH6gT;
	dmarc=pass (policy=none) header.from=alien8.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95820-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95820-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6A73007F7B
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 00:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511F11CBA;
	Thu,  9 Jul 2026 00:13:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350D28E0;
	Thu,  9 Jul 2026 00:13:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783556027; cv=none; b=fNsP+dDq+CfmQCMbYD8E+KOTvRgr2wL1o9R4hF05XYJv+EZRLEDehbWm1ntf473UIQuWZgbUraig1ehLabBJ+ROVbafvdbnvxcJV34rr6SDsxv4MS0RCpr/6QLZb56HaJJP6tMBRjnX4a53NVNvlpZYozpU4kvq0Tb9FejZXdsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783556027; c=relaxed/simple;
	bh=o6+FdIK32ujbiAy8E040lU6hw/zhNA+0f/tqyf/tniY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EElvcD8EGAFROENQCqPi6Nm6AX+2j0Vep66vEqY5Bt0/cobfrILfN7y257APgMNlwKlFJbvdB37Zt0VLwC+c+bN6xoTIu/GC6c+mjS+aenKdOkAR4CUKzqDpdOcppCYsQS2KJs35Q4hmUk4airSMZatd0oD3vJVJ9vXTScCot20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A6HDH6gT; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 70FDC40E02B3;
	Thu,  9 Jul 2026 00:13:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Nw6wzWAasnRp; Thu,  9 Jul 2026 00:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783556010; bh=Dm142gdEcTFW/K9q2hEUYlWar6YFLyEh07MT+JePuXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6HDH6gT9tSmpGm7gFBb/zhdlHgbVz1vAN3hdKCTt8avHG6GDcMqOkm2q0UeWJgP5
	 mPP7npwtAwMaukjfTKWu2skzW4OjvT+JzT///eMqXXa+eLQAk6I00tt8mP8X6njaiF
	 ADj5LN3F5Q2en4+1YDGo5EWz/VuSNxnnFB6Pffh6jGAsiiHwyRQTBbMP/xwZBKMdPv
	 D3WVZXc47avg+tru4fyObIuSqbx+6St68K6I2e4HhvK2MwzwtuCCfdWEELBfJrl0mC
	 YdosmLKT9bzZ+7o7Y7HhTfMTiGH9rZ2wGspOg/NLCWOfxHN2S+HVyNCDl84Usgls71
	 Y5tY7Hp/s+REbrGk7pIV+KLTgOKBRTHmnyjHE+fIwWOvAt+okJ24D854k54RJJ0MPt
	 /WzzC73Sg8+Uc3TiZ7xRhNuI1I38BXQa9rPDweLrCjLSS6T4mHfQE4tog0mmj7QkHD
	 UgfrBbg7CjWePrEMpl2R4LXn2sGFcVmAH5yuwuY6Yv/9EHoGhjW9Q6xbWXb9odyAI7
	 5nYQbQfDXaGdwaqPvFlaKSeUH5MLY0+c+r0D9OVE0ZJDwiy8Y4hkd1R6e+ipOf4JuH
	 z9Wh9BhVB8Ab2Lx7P3JHFZ0z4XwwFN6FmHGKH6pts1rO457NWF8udf5FRXbTPqHdoK
	 csHy5RojnCi7B+bg/++YBpo4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C4F1540E02B1;
	Thu,  9 Jul 2026 00:12:45 +0000 (UTC)
Date: Wed, 8 Jul 2026 17:12:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Babu Moger <babu.moger@amd.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, corbet@lwn.net,
	tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, tglx@kernel.org, ben.horgan@arm.com,
	fenghuay@nvidia.com, skhan@linuxfoundation.org, x86@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com,
	xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
	tiala@microsoft.com, chang.seok.bae@intel.com,
	kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
	elena.reshetova@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
	eranian@google.com, peternewman@google.com,
	qinyuntan@linux.alibaba.com
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
 Zero Association (PLZA)
Message-ID: <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
 <ak7kgJZyKmEVUdMj@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ak7kgJZyKmEVUdMj@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95820-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:namhyung@kernel.org,m:babu.moger@amd.com,m:acme@redhat.com,m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com
 ,m:peternewman@google.com,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,redhat.com,lwn.net,intel.com,arm.com,kernel.org,nvidia.com,linuxfoundation.org,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,linutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[alien8.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alien8.de:from_mime,alien8.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F359272B54C

Hey Namhyung,

On Wed, Jul 08, 2026 at 05:00:00PM -0700, Namhyung Kim wrote:
> Well.. it's changed as Linus wanted to not update the headers for
> trivial changes.  The script is still there but it's not running
> automatically.  For perf, we used to check ioctl and other user-visible
> changes for system call tracing.  And some headers moved to the
> tools/perf/trace/beauty/include directory to sync separately.
> 
> I think the headers will be sync-ed less frequently.  So you may need to
> update the header for tooling changes manually.

I'm reading this as, we should not touch cpufeatures.h in tools/ and let you
guys decide when you actually need bits from it? In the sense: only when you
really need bits from it, you'll update it and other, unrelated bits which are
not needed, can remain different...

Or?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

