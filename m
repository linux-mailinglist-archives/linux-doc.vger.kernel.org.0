Return-Path: <linux-doc+bounces-94862-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KV2SFqfgR2rhgwAAu9opvQ
	(envelope-from <linux-doc+bounces-94862-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:17:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73370430A
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fyvcN/oa";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94862-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94862-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 545D13016EF9
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 16:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8278E2E739C;
	Fri,  3 Jul 2026 16:11:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE8220F2A;
	Fri,  3 Jul 2026 16:11:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095109; cv=none; b=c+ZeNHRFQYMjgsvqOd8pzb0WC/KKihmF8fZgFkjIzrK9e6j5B2SsL3EOhCKk1exIlt5rBduvP+Cue009XqUJ3uelLIunFiou1EoPyEq3P1d+U9+2IGOD6r2OvUbqCjN1qu4EtoqaaqvbliB9whLqabTBLUZy7NVsP6YyFhgn0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095109; c=relaxed/simple;
	bh=Ag+w3aN8G7LasZXZ6DxH4zkyAq2rOWH2hixhLEe/p9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmzpZUsd3J9Y1GB1xntsQp3sYEh+JnlI5ZdCCFxE6JKsZSa9mLlFr5aCPUKMFQAE+0LkM5mNHUoYfn9g8aUr721+3QXMVrWOzWaDyXpRyJpougoPZcDQ62KxOOe7BuWMzTTxOCIQQnk/QWpKap7Av3gvCGZ969MPg/viIsuoBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyvcN/oa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 380C71F000E9;
	Fri,  3 Jul 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783095108;
	bh=4bBukqQendq6yVHOIFEDj36NSdbNq54AzlmUD7aYwng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fyvcN/oaS053PpD7Wg9/L+vCw1zzIej6ID6Q8RyosmIfIavkJSROsS1aF+HzmUVpj
	 UmgAcYBjepl4gJwjbpnQtxlr6Dhb/G/oZhHJqGJMx0P81pmpsp8LBdHrd/JCUsG4Dn
	 SOEOzlfA0WEYu3Sz1oGP267oywpj5a6+EyAIzdU6vsTxMv6wQedIKaHhFCaZwgZZ5z
	 XqPz9ebNdEH75V/jaKWWDEdEigSTbpuGrEQPsehX+GFFUXY9Z2hd0debl4IDwuvrUU
	 E2ftZExwg6EQDParzSlgRg2fhilVc5sKJyzyruLsBpn6dmdF10xr16FPQ4I9rsWqiT
	 PdIDP8d8j6wHQ==
Date: Fri, 3 Jul 2026 09:11:47 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Joanne Koong <joannelkoong@gmail.com>, brauner@kernel.org,
	willy@infradead.org, hsiangkao@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 18/18] Documentation: iomap: update docs to reflect
 iomap_next model
Message-ID: <20260703161147.GB9407@frogsfrogsfrogs>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-19-joannelkoong@gmail.com>
 <20260702192658.GN9392@frogsfrogsfrogs>
 <CAJnrk1YZQOQ0D6p6qYx1BPvKQaDgZsrKzLbGZzaH8tUkj_OoOQ@mail.gmail.com>
 <20260703020020.GS9392@frogsfrogsfrogs>
 <20260703124331.GA26440@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703124331.GA26440@lst.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94862-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[djwong@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:joannelkoong@gmail.com,m:brauner@kernel.org,m:willy@infradead.org,m:hsiangkao@linux.alibaba.com,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,infradead.org,linux.alibaba.com,vger.kernel.org,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djwong@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,frogsfrogsfrogs:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF73370430A

On Fri, Jul 03, 2026 at 02:43:31PM +0200, Christoph Hellwig wrote:
> On Thu, Jul 02, 2026 at 07:00:20PM -0700, Darrick J. Wong wrote:
> > The ->begin method can still set iomap::private and the ->end method can
> > dispose of it, right?  Oh, wait, no, that doesn't work because you're
> > talking about ->begin/->end passing something to the next ->begin.
> 
> Should we move ->private from struct iomap to struct iomap_iter?
> That'll deal with the constness and the fact that private data
> really is a per-operation thing.

I dunno -- towards the end of the fuse-iomap development work I actually
had started using iomap.private to store per-mapping private data.  But
that work is dead now, so that's not a strong argument.

> That also reminds me that now that we actually still keep the low-level
> begin/end ops we need to switch them to a calling convention that
> passes the iter instead of the ugly container_of.  This is something
> I wanted deferred until we get the iter conversion, but it turns out
> that now leaves them untouched..

Oh, you mean changing the signature to:

typedef int (iomap_begin_fn)(struct iomap_iter *iter...);

instead of passing parts of the iter as separate arguments?
Yeah, that would be nice.

> > Hm.  I was thinking that the signature for iomap_process could be
> > cleaner if you didn't have to pass iomap/srcmap explicitly.
> > iomap_process could do the (dangerous) casting from the (const struct
> > iomap_iter *) to the (struct iomap *) pointers before calling ->begin
> > and ->end.
> 
> I don't quite understand those part.

Let me try again.  Instead of passing three arguments:

int fubar_iomap_next(const struct iomap_iter *iter,
	struct iomap *i, struct iomap *s)
{
	...
}

pass one instead:

int fubar_iomap_next(const struct iomap_iter *iter)
{
	struct iomap *i = (struct iomap *)&iter->iomap;
	struct iomap *s = (struct iomap *)&iter->srcmap;
	...
}

to simplify the call sites.  The gross part of this is (1) having a
const iomap_iter pointer to prevent filesystems from screwing around
with the iter, and therefore (2) the need for explicit casting to remove
the constness from the two iomappings.

--D

