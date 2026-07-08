Return-Path: <linux-doc+bounces-95658-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Eqy4MqoKTmqTCAIAu9opvQ
	(envelope-from <linux-doc+bounces-95658-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 10:30:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A611C7232D4
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 10:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PDbBrbjk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95658-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95658-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D33383016C6A
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1873B403B0C;
	Wed,  8 Jul 2026 08:26:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBD3FF88D;
	Wed,  8 Jul 2026 08:26:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499193; cv=none; b=DJlpy257wo0GUadcmipGvm6q1GvNHs4Ymf4lZdS2Y/yRK0u7adjlPs3jTRqWhmVIHdrMeVExewl+Ly8BKZ3HLlNhrPqel4rGyuO+qt5YRurqxaVIsxLNce/8d12oYsPZupHHUP8frbKV8MNv0ZsrdUAWatf3uB9gjYdeBBR1kcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499193; c=relaxed/simple;
	bh=2rbRSYYAKVsxwEQ1SKtO08FrLJoHwAJY4BdmthThYeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSdaClv44zSSCNcmlXD0qmR8a7q9yASZEIzpUDZgtCXtW253E7G+VxaHikHqS56DScyYwd9jHT8PSKiim7tlPgZp4KgKNbfTAwmZr6XPWEsti4YzkIp7UQW3IIA9NPDYNmVslQUH1j54mXSaBcgTzSZyINV7vlglYK+QQBWapD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDbBrbjk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0731F00A3A;
	Wed,  8 Jul 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499191;
	bh=KfIXZqSgSsUZkySMKxA7SKZcwl2Zc6IkJcaMTw/YlhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PDbBrbjkPqdVS5TD0vAimCfeEp4blPivZriBE2HX7XOgXGaecJZzeftn4t1gYCotr
	 5E6eDrdYBo/GmEX8RK2v/RQVfYsmyy6nXiGDXFTSudi7JSNSsl4ojeIhdeDGinlvpG
	 x6UQHphDexQbaiVQpmGW839TpNkCGA5W1JMz2kvXArr4esBX3VTINld1V360zcGRU/
	 ITdXfNUJ3yxcteVsj1F4XfypLdJb5KNkkN0An3Wn44niXV7CQfSVddpg8gWIH9Emla
	 FVeXYahfi2eoj6Bpn7t3vT0XK6O2mjtrRjQuWG53acrfbthLXqAGinGGaXinBzKtic
	 sSxE11kH+/Ijw==
Date: Wed, 8 Jul 2026 09:26:18 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Sourav Panda <souravpanda@google.com>, muchun.song@linux.dev, osalvador@suse.de, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
Message-ID: <ak4JiBcvi29sYx0v@lucifer>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
 <20260707062428-mutt-send-email-mst@kernel.org>
 <b9a48d89-74f1-43d4-b7bb-be988b6855c9@kernel.org>
 <akzZr2jfJ0J8zox4@lucifer>
 <20260707095843-mutt-send-email-mst@kernel.org>
 <ak0xWgpJPSaNWPsl@lucifer>
 <20260707152755-mutt-send-email-mst@kernel.org>
 <f9bad4b3-93ee-4daf-84d5-97f6ca305240@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9bad4b3-93ee-4daf-84d5-97f6ca305240@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:mst@redhat.com,m:souravpanda@google.com,m:muchun.song@linux.dev,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mhklinux@outlook.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95658-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,google.com,linux.dev,suse.de,linux-foundation.org,infradead.org,kernel.org,suse.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A611C7232D4

On Tue, Jul 07, 2026 at 09:46:14PM +0200, David Hildenbrand (Arm) wrote:
> On 7/7/26 21:32, Michael S. Tsirkin wrote:
> > On Tue, Jul 07, 2026 at 07:46:28PM +0100, Lorenzo Stoakes wrote:
> >> On Tue, Jul 07, 2026 at 10:01:55AM -0400, Michael S. Tsirkin wrote:
> >>>
> >>> Fair enough.
> >>>
> >>>
> >>> Lorenzo, do you know *how* you want it reworked? Could you write it up
> >>> at a high level?
> >>> Because if not, it's not really practical to make it the asking price.
> >>
> >> Michael, you're an experienced maintainer, I'm surprised I have to tell you that
> >> the burden for that lands on the submitter.
> >
> > Oh sure, "fix bugs A,B,C before you add to this mess" is a classic way
> > to actually not end up with even more of a mess.  But I usually do try
> > to be explicit of what are specific issues I want submitter to address.
> > I don't really feel figuring that out lands on the submitter.
>
> Sometimes it's certainly easier. With things like hugetlb there often just isn't
> a feasible way to integrate it nicely into core-mm. It's just too special.

Yeah exactly :) once you reach a certain level of 'specialness' it is more like
pointing at a flaming trash pile and crying ;)

>
> --
> Cheers,
>
> David

Cheers, Lorenzo

