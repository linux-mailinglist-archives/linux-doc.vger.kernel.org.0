Return-Path: <linux-doc+bounces-94705-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NAO5EpffRmq9ewsAu9opvQ
	(envelope-from <linux-doc+bounces-94705-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 00:00:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C056FD1CA
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 00:00:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fm0ziciI;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94705-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94705-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D7A5301FF05
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 22:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F345385D74;
	Thu,  2 Jul 2026 22:00:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF839A05E;
	Thu,  2 Jul 2026 22:00:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029645; cv=none; b=ehHV0/N0LCoqdfqcKjia9VomVrKCeBDsMLiHnbIPfrURgWZatIFRx4nFjHz/01Q6eayrPHrPSO43tCBYvxm2wcZpJ9158Q0L1uA/Z7w7pE2w8HQadismQKHRjEXSjs5kuMn5bI5cKBJ0FPaIadOacXyLUgS6ErVRvwI/+U/Fo2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029645; c=relaxed/simple;
	bh=yb1zGZvJJpOXW/XZg2P4kXqNBlC7uLdr9sk678pac1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2ajSiO6MB9AlfqRhBXpgxN1pe/jok2ZdY6EeASaToNxibmbMtFYF6r8Pdlr22ulNJnKsXB/5HKSEU9XVJkwI01oNTbico6U8YWqXJ+4GcTgIKc/8Lg0GQ1warhA5fALHdywKF4a6p4M84MK+Bwn5LfCPx1XeHFkdt409aD+uVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm0ziciI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682441F00A3A;
	Thu,  2 Jul 2026 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029643;
	bh=mzTSOxzn5WhMjC1txEmxRE0ErHMtsKX7cVbSOX0nygY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fm0ziciINayGbylnbbHjsBhKUAeDwah0kZPuhlh+Q9jKe7jngIrM5DTtXHSiqASbh
	 Ag7Ko3kWkgeKTss8HJ6dhlJQs7OywAvbPNpfphmLlrMLsny0BFW8cbBwgo5ykmCQB8
	 DT/qIKIFZl4B80Wy0GEWaTiEv8Nd7tXdU83y1ZTuK7ekWYZQWK1RdaP0FrkQqt4fO+
	 efUbXNDFabu79DxQ066sBZ1cpy6QRl5+k47/13Igd52zEnbVdEP6WEKo+0ZsFquncr
	 +npVa0eIS45sf7h1S09/zCTI55F/2IIkHHFOMET3ohHCBSk7t6iCMMuLfRGVOHNIWn
	 1B1nU5QbRE2fg==
From: SJ Park <sj@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] docs: link AI coding assistants and tool-generated content pages
Date: Thu,  2 Jul 2026 15:00:37 -0700
Message-ID: <20260702220037.97787-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702164901.121128-1-ljs@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94705-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:sj@kernel.org,m:corbet@lwn.net,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linux-foundation.org,google.com,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89C056FD1CA

On Thu,  2 Jul 2026 17:49:01 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> Both of these guidelines are complimentary to one another - one specifying
> guidelines on AI coding assistants, and the other specifying those for
> tool-generated content.
> 
> Since they are complimentary to one another, provide a link to each in the
> other.

Makes perfect sense to me.

> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Acked-by: SJ Park <sj@kernel.org>

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

A comma after 'assistants' is missed?

> +
> +* Documentation/process/generated-content.rst
> +
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

Or, a comma is unnecessarily added after 'assistants'.

Whatever, I think keeping those identical is better.


Thanks,
SJ

[...]

