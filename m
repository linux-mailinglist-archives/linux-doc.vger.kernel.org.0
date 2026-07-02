Return-Path: <linux-doc+bounces-94642-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w9MvD22RRmrbYgsAu9opvQ
	(envelope-from <linux-doc+bounces-94642-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:27:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFC6FA29A
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:27:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QtLopmpo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94642-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94642-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F245B3060753
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC1D3164C5;
	Thu,  2 Jul 2026 16:15:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98A97081A;
	Thu,  2 Jul 2026 16:15:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008903; cv=none; b=Cf5zXf6EZ0S+pOiz01eySSHgeym+gzKIyrLiuLgEjOGYj/LbFTjG6FzrLVtXla7jcsR8pNGbxHWdMktLhyQS4sTuHQH7OgarGgHEK3xbCcuQKjhgHiMKetVjx0eYUtuZ71N8UoDcqR+38b/7CPK9xG82b+azIvPi/VvB1fqp3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008903; c=relaxed/simple;
	bh=/BDPM0tAszUnqEP6pnUm7lcXYYLlaXAWZZba63wasvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9g7Uv4T0YoZBtKkoJr9P2UM8f4Hnfl/hLx0OBM8UCYuZDjOkXqSApbmiF+HwOLUhVnyHZeRgnjghyZzRovHNQOv3OvkwHBIhInOZpi755PLFPjCSV31p7QkUZAwb6Qlf6lmslUZcQhuWi73SMcqYC5MZ04Yx6Djt/RH1y1p3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtLopmpo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E031F000E9;
	Thu,  2 Jul 2026 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008902;
	bh=/BDPM0tAszUnqEP6pnUm7lcXYYLlaXAWZZba63wasvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QtLopmpoTz1M5j2roqDdyyTxCOWzul0Z6Ubpf29X6w1KPaDU4hY7CQ0ddMRKsV0zc
	 5T6Khl8O27tBbSPEGKe8SRu0lRW2bOJMU5JDjfrRgmmlREDyA02Q8jbdiKMyu3b3xE
	 BkdRWe1CpXvIDxJwkVCup4jxZOrZJB3azyDTjbio851VRxK5g0pfGs9zjlvcG+SarW
	 IL835UEEOG3YmuPkRGbpE+92CvnlMCQ2JYPHOX+aqOS89qTRPCwZFQhD2RGZvyIxd0
	 bUhxfMxhxP5Qss1BnIAUerqXfMEzg5zY0QMcHI5WWbOV0s74hV+EsA12HqGA3XIIT3
	 QXGI+yFv8eTJg==
Date: Thu, 2 Jul 2026 17:14:50 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <akaODv19EonZ2Wal@lucifer>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <98e8d828-bcbd-4075-9b4c-dc1949647784@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98e8d828-bcbd-4075-9b4c-dc1949647784@app.fastmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94642-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lwn.net,google.com,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CEFC6FA29A

On Thu, Jul 02, 2026 at 12:11:20PM -0400, Chuck Lever wrote:
>
>
> On Thu, Jul 2, 2026, at 10:32 AM, Jeff Layton wrote:
> > We've had this requirement in place in the Documentation for several
> > months, but it's becoming clear that the signal to noise ratio from this
> > is quite low.
> >
> > 1/ It's not universally followed. While many people do try to attribute
> > the LLMs in good faith, not everyone does for various reasons.
> >
> > 2/ It basically serves as free advertising for proprietary LLM companies.
> >
> > 3/ It's not clear why we want to collect this info in the first place.
> >
> > Given that the data this provides is flawed at best and is being
> > collected for a purpose that isn't clear, let's just kill the
> > requirement for these tags from the kernel at large.
> >
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> > Christian had proposed watering down the LLM attribution, but I think
> > it's not productive to try and track this until we have a clearer sense
> > of what we want to do with this information and how to make it more
> > reliable.
>
> I agree that the current tagging system is flawed and almost useless
> for real analysis -- self-reporting and a nebulous definition of what
> "LLM was used" actually means are red flags for any data scientist.
>
> I don't have a stand on whether the tagging should be removed or fixed.
> But today I ignore it (my 2-cents US) for these reasons.

Oh no doubt they have highly dubious value as _data_.

But they are useful for practical purposes :) i.e. 'ok I can talk about the
LLM-ness here without it being quite so aggressive to do so because it's
admitted'.

And also political value in that 'here is how you are supposed to do it'
vs. <how you did it>.

I think there's definite practical human stuff that they provide sufficient for
there to be value here, and I've found that in practice also :)

(Though of course it's far far from resolving how we deal with the unattributed
stuff, which remains an ongoing issue!)

>
> --
> Chuck Lever

Cheers, Lorenzo

