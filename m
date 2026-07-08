Return-Path: <linux-doc+bounces-95769-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYSvL0eJTmqTOwIAu9opvQ
	(envelope-from <linux-doc+bounces-95769-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 19:30:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC272939A
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 19:30:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=TBRFV00U;
	dmarc=pass (policy=none) header.from=alien8.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95769-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95769-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB9A330115BB
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7A342B32F;
	Wed,  8 Jul 2026 17:28:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D442DA56;
	Wed,  8 Jul 2026 17:28:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531696; cv=none; b=PybqvsXXuowTRF4QvOkYm+kW+i+ttyk4UgV7ddVLecHrILndScxLj8Bz17xmk0HkudghV9U6/nyUAU7w3IrH+SQ722KrF33AlwGUxk1MDhYJM/NjraoX4/Jr3WBl54crmss2jI3aTX3lVMJ9V4/+cyEHWPqMLXR/bNiox4+FUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531696; c=relaxed/simple;
	bh=m484dPzJKeAwhDFIs/WhomQIuIDOqXhmgknaK142i40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o/YyICrULFp/IQOx/tdo60l4HB7Uws1jPx+oYCMgNivyUMzVRfoJXefBtYnOseYjuFtfmTQEesuSlMRkE0yVDdP761DQo1M/VRqVvFUQOsmZmTDOe4TaU5sJFMNjUleCGe4SuUJ1NCzjONEjFfcwINNs2DFkhgv/VSlDcg++Aos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TBRFV00U; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 34DE940E0031;
	Wed,  8 Jul 2026 17:28:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ERSV0ycxTNzw; Wed,  8 Jul 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783531680; bh=m484dPzJKeAwhDFIs/WhomQIuIDOqXhmgknaK142i40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TBRFV00Uc9pwBa51dZm/TWhVzmLPt8v/j1U4TaIPLoF0EwjLaglU7wbEVl3XVZdF2
	 xyvqr7mmIiqSd9pFeTtGC6KpmGR8vNUS/JOZvQBdlOiAL3H71JDhHvhpT+31B3b+6P
	 a051ed6vCuHWg6t45xs5FqlSB2MEXJPdbWSYvuYDR6ywDqBr4nBrXasHD2YjZmLiu1
	 wklqOp2ngGnBlQ0crnvpPFteHEI61/tDGQNsWaBbDTl/y1PlLZXGDdiIk/JDqBUdXF
	 13nUiaHKOytLjhf3AlYb1Yfvl88InSGTLYTr9RQz31tVfT0yzMVrbz8L+k21WXHNOp
	 sgB5PZHTRou97eF3UdpSd7Ihzlq75mhKUmePzeXtLSOihc5lW6QXLN6kzpgPTVcL7m
	 A4x7mc7Dl9iCwfV58N2C0VZ1FYw3jmrQKb5tYwTqPsmRpRkNQVXoE3SxeXNI53Dzyg
	 Af2qAU0ebXcZJPvtq+E5QKw9/83Md+X+APLNm4ovRTtz3AJi9YGV+/aYFc5uMuSkk6
	 CicoMf/L47BmqYga+Ns1EtHngxY9XrNDChOdx6/m6GlS+ZTE47SkHzUttHw78ZiJMn
	 JsVrosktNaHHACIhU27ozjge7wcGfnVgpvSET/hcmG0guOuD/xUNMNuGfnXHpGrmPg
	 5ikhjN+s/1zOsZU0AL3pJxJA=
Received: from ehlo.thunderbird.net (mobile-166-170-42-114.mycingular.net [166.170.42.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 147C340E02B1;
	Wed,  8 Jul 2026 17:27:17 +0000 (UTC)
Date: Wed, 08 Jul 2026 17:27:10 +0000
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>
CC: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
 ben.horgan@arm.com, fenghuay@nvidia.com, skhan@linuxfoundation.org,
 x86@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 akpm@linux-foundation.org, rdunlap@infradead.org, peterz@infradead.org,
 feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, elver@google.com,
 enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
 lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
Subject: =?US-ASCII?Q?Re=3A_=5BRESEND_PATCH_v4_01/15=5D_x86/resctrl=3A_Sup?=
 =?US-ASCII?Q?port_Privilege_Level_Zero_Association_=28PLZA=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <017ac20b-851e-43aa-9043-f3a2def2a2e6@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com> <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com> <20260707220116.GFak13LChoDbSaCh1O@fat_crate.local> <017ac20b-851e-43aa-9043-f3a2def2a2e6@amd.com>
Message-ID: <4B062170-48CF-4D17-A288-E8C90461BBC2@alien8.de>
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
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,intel.com,arm.com,kernel.org,nvidia.com,linuxfoundation.org,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,amd.com,microsoft.com,linutronix.de,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95769-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:babu.moger@amd.com,m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com,m:qinyuntan@li
 nux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[alien8.de:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alien8.de:from_mime,alien8.de:dkim,alien8.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18EC272939A

On July 8, 2026 2:51:02 PM UTC, Babu Moger <babu=2Emoger@amd=2Ecom> wrote:
>Will change the text to:
>
>When memory bandwidth associated with a CLOSID is aggressively
>throttled, and a task with that CLOSID moves into kernel mode, the kernel=
 operations are also aggressively throttled=2E This can stall forward progr=
ess and eventually degrade overall system performance=2E

Yes, pls keep it generic=2E=20

Thx=2E

--=20
Small device=2E Typos and formatting crap

