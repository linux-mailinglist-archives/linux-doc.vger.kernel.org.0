Return-Path: <linux-doc+bounces-95008-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OIyVMNzUSmqHIQEAu9opvQ
	(envelope-from <linux-doc+bounces-95008-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 00:04:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524C70B900
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 00:04:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=VQijEMIZ;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95008-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95008-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56EE530086F0
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2026 22:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09778322533;
	Sun,  5 Jul 2026 22:04:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707E62FE56E;
	Sun,  5 Jul 2026 22:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783289047; cv=none; b=lziW6UnqzDcDr4IvzUfuDbpW9M0DRwFAe7S9AESMVMUJjkiSK5o7INi8ajW7VQo9HLKMEsGB9tE3ujkSswQcSoV8Owsfo5+wFo3am0JCoa6GgAiWvIwzDPPKspWGvgu4NVaIARcR0DPcu1dkkkhviIq9uvEyjxuzrYulCTybokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783289047; c=relaxed/simple;
	bh=u4k0JC79kPq1Usqzfa4J16+JyPyiU5/UIsZhwkienl8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J1ahYrvbyfDE3zffDOnB4hJyvP7wGx7i10yoJ8ri7wejovtAboOtuPNgT7Em8TGKt7oJ+lAmpYwFFItJt5mRQcaWrITFyTAiHo6pe9EOmEx4ChG2AySYi13FDCURG2663hNagmqu+YArnHiADAeKPys7NlEzKyd93IviTQQb6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VQijEMIZ; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZuqbzA7lYFGaHTnxsLh/YzAq2Vmzjm6qxnsQ+inYRkQ=; b=VQijEMIZSEDWd1z3K0fEPXE9AH
	7Ba3C9SliyFKqNBJm62TbJt5g8z+hYUOveVu/jGJPbbEZdfplxpDNSM+et/5kORKbLYnkWj/Aud4a
	ngiXMkjG4J6YNzSHVcjcet2Dl/98C9louARtyr22bGxwNCvNoQs+8Jvv+JKxOahPkZQBrItjQxOKV
	EdblR+iMobZTahPRHirDAgjvuTUdoBsXbFPyK5ZMGgH+C+v/K+yxlDgyNKgvSPahaiKuv+om1hlPg
	EUgELXBAKBymbnUgh/OaYYMSV4FFhRSbVQiyC/kgEJ9gTUgp0WfH3/RR9toLVUIm1kNHqAJ8pfZfi
	l2eBlcFQ==;
Received: from [129.95.232.135] (helo=ehlo.thunderbird.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgUvu-000000062XC-3FS9;
	Sun, 05 Jul 2026 22:03:43 +0000
Date: Sun, 05 Jul 2026 14:49:56 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: Matthew Wilcox <willy@infradead.org>, Gregory Price <gourry@gourry.net>
CC: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, peterz@infradead.org,
 luto@kernel.org, akpm@linux-foundation.org, feng.tang@linux.alibaba.com,
 pmladek@suse.com, lance.yang@linux.dev, marc.herbert@linux.intel.com,
 kees@kernel.org, leitao@debian.org, joel.granados@kernel.org,
 lirongqing@baidu.com, nathan@kernel.org, xur@google.com,
 lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_syscall=5Fuser=5Fdisp?=
 =?US-ASCII?Q?atch=3A_Make_it_configurable_in_Kconfig?=
User-Agent: K-9 Mail for Android
In-Reply-To: <akklLLPZ1fbcZRML@casper.infradead.org>
References: <20260704015859.536580-1-gourry@gourry.net> <20260704015859.536580-2-gourry@gourry.net> <akklLLPZ1fbcZRML@casper.infradead.org>
Message-ID: <50697183-B97D-48A9-B0C4-A288B88324DC@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95008-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:gourry@gourry.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:lance.yang@linux.dev,m:marc.herbert@linux.intel.com,m:kees@kernel.org,m:leitao@debian.org,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:nathan@kernel.org,m:xur@google.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9524C70B900

On July 4, 2026 8:22:20 AM PDT, Matthew Wilcox <willy@infradead=2Eorg> wrot=
e:
>On Fri, Jul 03, 2026 at 09:58:58PM -0400, Gregory Price wrote:
>> +config SYSCALL_USER_DISPATCH
>> +	bool "Syscall User Dispatch"
>> +	depends on GENERIC_ENTRY
>> +	default y
>> +	help
>> +	  Syscall User Dispatch lets a thread have its own system calls outsi=
de
>> +          an allowed IP address range to be intercepted and redirected=
 to a
>> +          userspace signal handler=2E
>
>I was very confused when I read this=2E  IP expands to Internet Protocol
>long before it gets to Instruction Pointer in my brain=2E
>

Ditto



~Randy

