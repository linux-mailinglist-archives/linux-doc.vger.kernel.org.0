Return-Path: <linux-doc+bounces-94683-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DgMSN8etRmrfbQsAu9opvQ
	(envelope-from <linux-doc+bounces-94683-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 20:28:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 217AE6FC089
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 20:28:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=iJmiFWRZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94683-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94683-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7512E3002E06
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 18:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB63A6B71;
	Thu,  2 Jul 2026 18:26:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1134835F8C9;
	Thu,  2 Jul 2026 18:26:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016797; cv=none; b=upxOw5iPw48+RIR9QolIvP4mRH0jxHssc3ukzhTUG3vNZUK9OhKexfofHcuLQskFRImQSiUrdtSClyj86ovfAtRoUvgzRkgXIk5XFIv01xKKbrJbD9iIswMldyQDspIL6j8kLgY+7T28mNPGGe4TnRlNBVRMBO8ll4jeOLq+p2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016797; c=relaxed/simple;
	bh=702n5uwlpSV1g6DnemtXU12j9s/IrN3vzdMAjbwngY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjvjOWvqsHw1aC4As2j2Vi7Bacm63JNGvl0SL3N00YZo9vA6BcxM2CY/QbUnXUW1b/9TbW6EpvbVg6afFtM7TJGQVNKVEeydbMExTIgczmcZvyg/Uzhd8B3Hgash9d8XPBZhYJ6Pby0bSgocLdURbp3sSJALNG/RdKIk20eIa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iJmiFWRZ; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E75B622B;
	Thu,  2 Jul 2026 20:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783016748;
	bh=702n5uwlpSV1g6DnemtXU12j9s/IrN3vzdMAjbwngY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJmiFWRZs2etEg/T1pnKYxd5hp/zibXGasTOyP00NWKcO2U4NEWKGvmRnw2ajt6yG
	 WuefcF6dNx3eM0jXuTJ2b+uog4KfJM/Kwc1sMZxZfVYPZgwD6ySbrYtu/WL4cQfXEa
	 3ZRpfA3MTbhs70GUhrSVUBt1gz70EG4tOupJnQ2c=
Date: Thu, 2 Jul 2026 21:26:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] docs: link AI coding assistants and tool-generated
 content pages
Message-ID: <20260702182632.GK3534761@killaraus.ideasonboard.com>
References: <20260702164901.121128-1-ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702164901.121128-1-ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94683-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:corbet@lwn.net,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,linux-foundation.org,google.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 217AE6FC089

On Thu, Jul 02, 2026 at 05:49:01PM +0100, Lorenzo Stoakes wrote:
> Both of these guidelines are complimentary to one another - one specifying
> guidelines on AI coding assistants, and the other specifying those for
> tool-generated content.
> 
> Since they are complimentary to one another, provide a link to each in the
> other.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  Documentation/process/coding-assistants.rst | 4 ++++
>  Documentation/process/generated-content.rst | 7 +++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index 899f4459c52d..6125ee4914c5 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -15,6 +15,10 @@ kernel development process:
>  * Documentation/process/coding-style.rst
>  * Documentation/process/submitting-patches.rst
> 
> +For guidelines on content generated by AI coding assistants see:
> +
> +* Documentation/process/generated-content.rst
> +

It could be worth it checking if this increases the likelyhood that an
agent would include a disclosure statement in patches. I would have
assumed that the "Attribution" section in this file to be enough. Has
anyone ever tried to understand why it doesn't work and if it can be
improved ?

Maybe a stronger statement would help here:

"Furthermore, AI tools must follow the guidelines for generated content
documented in Documentation/process/generated-content.rst."

>  Licensing and Legal Requirements
>  ================================
> 
> diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> index 08621e50a462..aad2caad9f8b 100644
> --- a/Documentation/process/generated-content.rst
> +++ b/Documentation/process/generated-content.rst
> @@ -107,3 +107,10 @@ the resulting changes.
> 
>  If you do so anyway, maintainers are entitled to reject your series
>  without detailed review.
> +
> +References
> +==========
> +
> +For specific guidelines on AI coding assistants, see:
> +
> +* Documentation/process/coding-assistants.rst

-- 
Regards,

Laurent Pinchart

