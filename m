Return-Path: <linux-doc+bounces-95027-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVhxAzwoS2pWMgEAu9opvQ
	(envelope-from <linux-doc+bounces-95027-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 05:59:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112B70C632
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 05:59:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95027-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95027-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AC29300875B
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 03:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD273612EC;
	Mon,  6 Jul 2026 03:59:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65B13B7A3;
	Mon,  6 Jul 2026 03:59:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783310393; cv=none; b=ALSyrhePOzLZqbxetmIqWgHSu0PEk4SEEgdvOO/vOCjRoB7spu9QdJkVahI+HZkQNFYpQd6nQODKe6Mpls9kjDj80bFNIyFbw4dTjxIgO8CUlCbi0BL8YvYTqf06MIL/gibeBZEoebWV/5n5nB3sQpqavebrOgL3LNAT59QqdjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783310393; c=relaxed/simple;
	bh=0yHlcrsyfBalhWb3whVHo4M2Gl29ZEj+sCh6EvDmekI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp8TFSPoPnY63Q1ZXIS/PJlpBYvjXdQyQAHHx//Msh2LEkx3CsEaUJDhY7zF5MKTVA0KR1pRLPy2Q+5M8rfkqU+JJzjEFXJk2NYRVpHiqX0vQPLnzi3Y4qTny6mI3rL5FsiqllVqDQZzkVXbT71tSySg4t7N8pCjZq72umDGi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id A18A868B05; Mon,  6 Jul 2026 05:59:46 +0200 (CEST)
Date: Mon, 6 Jul 2026 05:59:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>,
	brauner@kernel.org, willy@infradead.org,
	hsiangkao@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 18/18] Documentation: iomap: update docs to reflect
 iomap_next model
Message-ID: <20260706035946.GC21998@lst.de>
References: <20260701000949.1666714-1-joannelkoong@gmail.com> <20260701000949.1666714-19-joannelkoong@gmail.com> <20260702192658.GN9392@frogsfrogsfrogs> <CAJnrk1YZQOQ0D6p6qYx1BPvKQaDgZsrKzLbGZzaH8tUkj_OoOQ@mail.gmail.com> <20260703020020.GS9392@frogsfrogsfrogs> <20260703124331.GA26440@lst.de> <20260703161147.GB9407@frogsfrogsfrogs> <CAJnrk1Zv8FEAD+T=1+ZLi6q8ztHVY1zray019QNdeLpYjTNQAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1Zv8FEAD+T=1+ZLi6q8ztHVY1zray019QNdeLpYjTNQAQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:djwong@kernel.org,m:hch@lst.de,m:brauner@kernel.org,m:willy@infradead.org,m:hsiangkao@linux.alibaba.com,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95027-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5112B70C632

On Fri, Jul 03, 2026 at 05:34:59PM -0700, Joanne Koong wrote:
> On Fri, Jul 3, 2026 at 9:11 AM Darrick J. Wong <djwong@kernel.org> wrote:
> >
> > On Fri, Jul 03, 2026 at 02:43:31PM +0200, Christoph Hellwig wrote:
> > > On Thu, Jul 02, 2026 at 07:00:20PM -0700, Darrick J. Wong wrote:
> > > > The ->begin method can still set iomap::private and the ->end method can
> > > > dispose of it, right?  Oh, wait, no, that doesn't work because you're
> > > > talking about ->begin/->end passing something to the next ->begin.
> > >
> > > Should we move ->private from struct iomap to struct iomap_iter?
> > > That'll deal with the constness and the fact that private data
> > > really is a per-operation thing.
> 
> I'm not sure I understand. Doesn't struct iomap_iter already have a
> private field that holds caller-supplied per-operation context?
> afaics, the users of iomap->private (gfs2, ntfs3, fuse-dax) do use it
> for per-mapping data and release it in the same iteration.

True, different uses.

> > I dunno -- towards the end of the fuse-iomap development work I actually
> > had started using iomap.private to store per-mapping private data.  But
> > that work is dead now, so that's not a strong argument.
> >
> > > That also reminds me that now that we actually still keep the low-level
> > > begin/end ops we need to switch them to a calling convention that
> > > passes the iter instead of the ugly container_of.  This is something
> > > I wanted deferred until we get the iter conversion, but it turns out
> > > that now leaves them untouched..
> 
> That's a good point. Do you think it'd be better to include those
> changes as part of this series or do that as a separate follow-up
> series that targets the same merge window timeline as this one?

It might make sense to simply use the new signature for the iomap_process
callbacks and switch over only once.  And never touch the existing
begin/end methods in the iomap_ops.

> 

