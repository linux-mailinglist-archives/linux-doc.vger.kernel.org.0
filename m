Return-Path: <linux-doc+bounces-94758-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fg95JSF1R2obYgAAu9opvQ
	(envelope-from <linux-doc+bounces-94758-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 10:38:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF527002B7
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 10:38:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fxrGGfNm;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94758-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94758-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF6431BC540
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23BA314B76;
	Fri,  3 Jul 2026 08:18:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8512DFA4A;
	Fri,  3 Jul 2026 08:18:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066739; cv=none; b=gFI1t/X7frXUqTpB5BC8jBGY0ZH53mu4CCtxSrVYT1UHykf3pzn8FJFjJcIhM/C5fB+6gaX3OHwMe3kIf9kBSnJjf2mL8kgrYrHUr08C943MVFD8GqrDy47ycclgnBMe3LnBIXyY9sLRw08yy0Ksi6mmrZdRU9Fz1yakJR++hK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066739; c=relaxed/simple;
	bh=7xiCS+LW/hpUxAtoORyHdSsXhPaej2VMVnF4af3E7zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHCRrusME3EWCAl+P5EclqaHeMXLMz37BqOZgRwOfcmbtqWzbnkDPZOJC4SAjJbfcUY24iXhXrFScMg7eObUoeW5y5+SqerkQ+CwHH2eTq/yfAYaqnvVAr2inEQC2E61RDO3blgyNJqg+pZc+OY4cHp7WLNuTOLA4bJqD8+v7bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxrGGfNm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4881F000E9;
	Fri,  3 Jul 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066738;
	bh=mxu4stcCENodA3+tKKQflfouRvjUw7ufWxrAbD2T02M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fxrGGfNme8F5iyNhEvWIFJ3Iv1sPdlQzCHHKSTMyxLE1V3yCs/6uP+ZdLnycl50Oe
	 NMsmKsTmR8zwEdZCT15UF3wJmwVuKKYj8kLmBNvQ3DQaNI4XU2n8ITHLemoprY77AO
	 PWqENCPgcPsZcx/CBr5fF59WFdOzvU5WAM40YxBlyZZh5l2aVXcAUrBmiiHTHDbuFK
	 ArFL5ZT4AWQDzCQGpK+egl9AJ0aaO6SI7QhGKTfvrE2R4Dj4Zf4hjNV0qJzOirePbb
	 W3L80ediaU0K1AVRpep5gnCXig4Kop5QRdXgG01V4ZWT9eDQCsS3Ydlpr9Gds/l87y
	 KI3uen+03j+Tg==
Date: Fri, 3 Jul 2026 09:18:46 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] docs: link AI coding assistants and tool-generated
 content pages
Message-ID: <akdv9GCjOrs_6DM6@lucifer>
References: <20260702164901.121128-1-ljs@kernel.org>
 <20260702182632.GK3534761@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702182632.GK3534761@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:corbet@lwn.net,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94758-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,linux-foundation.org,google.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAF527002B7

On Thu, Jul 02, 2026 at 09:26:32PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 02, 2026 at 05:49:01PM +0100, Lorenzo Stoakes wrote:
> > Both of these guidelines are complimentary to one another - one specifying
> > guidelines on AI coding assistants, and the other specifying those for
> > tool-generated content.
> >
> > Since they are complimentary to one another, provide a link to each in the
> > other.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  Documentation/process/coding-assistants.rst | 4 ++++
> >  Documentation/process/generated-content.rst | 7 +++++++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> > index 899f4459c52d..6125ee4914c5 100644
> > --- a/Documentation/process/coding-assistants.rst
> > +++ b/Documentation/process/coding-assistants.rst
> > @@ -15,6 +15,10 @@ kernel development process:
> >  * Documentation/process/coding-style.rst
> >  * Documentation/process/submitting-patches.rst
> >
> > +For guidelines on content generated by AI coding assistants see:
> > +
> > +* Documentation/process/generated-content.rst
> > +
>
> It could be worth it checking if this increases the likelyhood that an
> agent would include a disclosure statement in patches. I would have
> assumed that the "Attribution" section in this file to be enough. Has
> anyone ever tried to understand why it doesn't work and if it can be
> improved ?

I don't think so AFAIK.

I think people generally are aware of the Assisted-by as a thing, but perhaps
less so of the generated content guidelines, so hopefully this helps that a
little!

>
> Maybe a stronger statement would help here:
>
> "Furthermore, AI tools must follow the guidelines for generated content
> documented in Documentation/process/generated-content.rst."

I mean I would like that actually, _but_, I wanted to keep this as neutral as
possible for the time being so we can first establish the links without
controversy ;)

Then we can perhaps separately think about making the language a little more
insistent :)

>
> >  Licensing and Legal Requirements
> >  ================================
> >
> > diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> > index 08621e50a462..aad2caad9f8b 100644
> > --- a/Documentation/process/generated-content.rst
> > +++ b/Documentation/process/generated-content.rst
> > @@ -107,3 +107,10 @@ the resulting changes.
> >
> >  If you do so anyway, maintainers are entitled to reject your series
> >  without detailed review.
> > +
> > +References
> > +==========
> > +
> > +For specific guidelines on AI coding assistants, see:
> > +
> > +* Documentation/process/coding-assistants.rst
>
> --
> Regards,
>
> Laurent Pinchart

Cheers, Lorenzo

