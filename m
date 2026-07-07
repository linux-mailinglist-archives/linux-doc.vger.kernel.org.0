Return-Path: <linux-doc+bounces-95437-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYXkBrxKTWoPxwEAu9opvQ
	(envelope-from <linux-doc+bounces-95437-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 20:51:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C1671EC04
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 20:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Q2kwS1vQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95437-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95437-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A16BC30544E0
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 18:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341C034C140;
	Tue,  7 Jul 2026 18:46:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E749620;
	Tue,  7 Jul 2026 18:46:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450003; cv=none; b=rwVjbKE3OP52Y330RB3TZbo2u6qLxkjBcF24vlqne6O3pBJC4KRKRE2ApBg3ROM9mfUiMb4EGB/gAlt4VNUgmAm2NXvWU0KLFA/sPq/7nx+ct/9c3F2SJGioLjivOje5hCL+i5528+r4hsISCzEDOIf0Jecr4mlAtnMBrw4SOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450003; c=relaxed/simple;
	bh=X0W932BtfTn9GcIjsfgttErKDs0AFDS28GSh1kvBjjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7GLPdAwiems/6PXsVW7aoOSXQ7lpFuXCOmyQ1Ab4/NjrpraSvmx3XnpDMWGzBwxFK0ohNJJB1QKtxEIDYOJ3ZEmMubd/W3Fe7gqHeBCkzLGpVNyejDoGVIkfvoVyIZfdu0avAlpKldYZ9gS7ELEiRwcMKrkqAMT5XwLTlEIJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2kwS1vQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2191F000E9;
	Tue,  7 Jul 2026 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783450001;
	bh=TnzAVuFS/1c1f8/sGeVM6EqLbn2q6aov1CaEXTJphiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q2kwS1vQT1lvk6DbrNeBX1zSrwqJTy6MVV4NtnB6qmooEdVkr3SP0kigaSXxVtPcI
	 FNiL3NkneqXGz8PdsXfOW7ShhH5GsUyJvZ11fBbBXWTsxY4H1Ytlc4eElaSVWGdSYs
	 SLrz9X0TaUi3woiE1RsdehIj3nErOa3YJgihIIyFOIzEzcI/35o5dqW8mWQ8fNvo0F
	 RnWkMNyFRVMTn2TsXmWBfT4CmqebAU4jGHRb21/8ZRR3nIAmOhV7QxQniojhjZiUrZ
	 ih+s0tTd12+RibBhP6G0AcmO44ieiON9rgyx1HQpHrJNpW5E7vG2Gwh6B2CTWln7gj
	 UdLa664uk80DA==
Date: Tue, 7 Jul 2026 19:46:28 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Sourav Panda <souravpanda@google.com>, muchun.song@linux.dev, osalvador@suse.de, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
Message-ID: <ak0xWgpJPSaNWPsl@lucifer>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
 <20260707062428-mutt-send-email-mst@kernel.org>
 <b9a48d89-74f1-43d4-b7bb-be988b6855c9@kernel.org>
 <akzZr2jfJ0J8zox4@lucifer>
 <20260707095843-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707095843-mutt-send-email-mst@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mst@redhat.com,m:david@kernel.org,m:souravpanda@google.com,m:muchun.song@linux.dev,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mhklinux@outlook.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95437-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linux.dev,suse.de,linux-foundation.org,infradead.org,suse.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80C1671EC04

On Tue, Jul 07, 2026 at 10:01:55AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jul 07, 2026 at 12:06:34PM +0100, Lorenzo Stoakes wrote:
> > On Tue, Jul 07, 2026 at 12:28:44PM +0200, David Hildenbrand (Arm) wrote:
> > > On 7/7/26 12:25, Michael S. Tsirkin wrote:
> > > > On Tue, Jul 07, 2026 at 09:29:07AM +0200, David Hildenbrand (Arm) wrote:
> > > >> On 7/7/26 08:42, Sourav Panda wrote:
> > > >>> Overview
> > > >>> This patch series introduces a dynamic, NUMA-aware HugePage Cache,
> > > >>> backed by a kernel shrinker to safely return memory under pressure, and
> > > >>> integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
> > > >>> specifically targeting gigantic (1GB) hugepages. The goal is to solve
> > > >>> the tradeoff between allocation latency and memory
> > > >>> fungibility in virtualized and heterogeneous cloud environments.
> > > >>
> > > >> Hi,
> > > >>
> > > >> in general, we consider hugetlb nowadays to be mostly in feature freeze, as we
> > > >> realized a while ago that adding more special casing on top of something too
> > > >> special for all of MM is only going to hurt us more in the long run.
> > > >>
> > > >> We want to have less special casing and less special sauce, not more.
> > > >>
> > > >> Now, there is nothing wrong in making hugetlb be less special, by making it use
> > > >> more of core infrastructure etc.
> > > >>
> > > >> But optimizing for surplus hugetlb pages by teaching hugetlb about new caches
> > > >> and its custom free-page-reporting support rather looks like the wrong direction
> > > >> for me?
> > > >>
> > > >> --
> > > >> Cheers,
> > > >>
> > > >> David
> > > >
> > > >
> > > > It is currently bypassing free-page-reporting completely.
> > > > Making existing free lists not ignore free-page-reporting would
> > > > maybe considered "making it be less special"?
> > > >
> >
> > You have this completely backwards.
> >
> > You're advocating making hugetlb _more special_ by duplicating functionality that
> > core mm already supports.
> >
> > I mean:
> >
> > mm/hugetlb.c                                 | 590 ++++++++++++++++++-
> >
> > Tells the whole story right?
> >
> > The whole issue with hugetlb is the very fact that it's a parallel
> > implementation of a bunch of mm stuff in its own little world.
> >
> > We make it less special by mm/hugetlb.c smaller and smaller and implementing
> > what it does sanely elsewhere in _core mm_.
> >
> > >
> > > Depends. We don't really want an orthogonal implementation of something we have
> > > in core-mm.
> >
> > Yes, exactly.
> >
> > Feature freeze means feature freeze, not 'feature that core mm doesn't support
> > feature freeze'.
> >
> > Hugetlb is a poster child for poor decision making in mm that has left us
> > saddled with maintenance nightmares because we allowed 'just one more feature
> > in' (TM) with little to no thought to the future.
> >
> > And we've all learned from that and don't want to repeat these kinds of
> > mistakes, nor make existing mistakes worse.
> >
> > And work to improve hugetlbfs and make changes like the above are VERY welcome
> > :)
>
> Fair enough.
>
> > Laying a foundation for hugetlbfs to be more of a sane mm citizen through rework
> > series is really the asking price for stuff like this in my opinion.
>
> Lorenzo, do you know *how* you want it reworked? Could you write it up
> at a high level?
> Because if not, it's not really practical to make it the asking price.

Michael, you're an experienced maintainer, I'm surprised I have to tell you that
the burden for that lands on the submitter.

Nor does a no from a maintainer require an alternative be provided.

In any case, I felt I was clear above but to reiterate - do the opposite of what
the issues are:

- Implement things in core mm without it being treated as a separate entity.

- Reduce the propagation of if (hugetlb) { ... something specific ... } strewn
  through the code base.

- De-duplicate the appalling parallel implementations — and not by pulling
  things out 'just for hugetlb', but by making it ordinary.

There are a WHOLE HOST of issues and problems and difficulties with doing all of
that. But that's just the reality of it - again, the burden of figuring that out
is on the submitter.

So the price for entry is high, very high, but that doesn't make the no any less
emphatic - we're not going to accept the problem being made any worse.

Note that I'm currently working on reworking the anon rmap which is similarly
problematic. I didn't get nor expect detailed guidelines on how to do so. The
burden's on me, and it's equally a high price to pay.

But setting the bar such that the codebase is as good and robust as it can be
both now and in the future is what maintainership is about.

Thanks, Lorenzo

