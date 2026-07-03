Return-Path: <linux-doc+bounces-94736-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lOaaBhlSR2qKWAAAu9opvQ
	(envelope-from <linux-doc+bounces-94736-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 08:09:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CD6FEF81
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 08:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=kroah.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94736-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94736-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EF3C30233C6
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 06:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2C035B63B;
	Fri,  3 Jul 2026 06:05:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AADD3451B0;
	Fri,  3 Jul 2026 06:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058742; cv=none; b=MDuAc59/L20SwmdEVCT9NskKYCoPe7Nnaary/pu+TuC0eUT+KgScQab5NYAnNtbfn6U8v+yQvx4cR2N3zwNiuRUGi7SSHBM3yStjgvKBkfhRNVBb6OaNP/a/P+DXt56sArJh9Xmw4vMVT3TF0lf2eVLJeK5mq/Uu5BMRh2R1T4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058742; c=relaxed/simple;
	bh=EUQA4Fz3a4i+pOb23MbOZ9f7vV1yvw5548DaVDRgyEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPuEgGXsFVxZZ0XOaq95AqUriFGDJ0dzZSstJoljJzryxvMmHBEpthG0p3uOQKFqEsH4oDV54iIt1/+4eUXuoyKOURCyVJhL1MFqTS5EI0fBuy7XD8HppPnpKOCbZ17rGOQH0INm7pjb7qiK6Bo/q8/neKMDxXwUk9dMPdRhA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E8D1F000E9;
	Fri,  3 Jul 2026 06:05:40 +0000 (UTC)
Date: Fri, 3 Jul 2026 08:05:51 +0200
From: Greg KH <greg@kroah.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <2026070343-heat-cleft-0abf@gregkh>
References: <20260702164901.121128-1-ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702164901.121128-1-ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:corbet@lwn.net,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-94736-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linux-foundation.org,google.com,ideasonboard.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxfoundation.org:email,gregkh:mid,kroah.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 995CD6FEF81

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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

