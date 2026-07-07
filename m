Return-Path: <linux-doc+bounces-95400-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WMq0MBwaTWqFvAEAu9opvQ
	(envelope-from <linux-doc+bounces-95400-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 17:24:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3671D39C
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 17:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RTlaB7un;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95400-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95400-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0804830B1941
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B38379C2F;
	Tue,  7 Jul 2026 15:10:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE63783C7;
	Tue,  7 Jul 2026 15:10:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437021; cv=none; b=XoMA9xmhBi9t+DnTLPi/xKSJbsKJ6Ze8gVMl2Y14+NF0PurK8YG2QqqE2yVHVat7BzucVR/f2me4vF0aj6GZ4bAVBp7J4tVwo5HBSrTxzqo4nXfufalJThUFf8SFdj5ulocr6cEceQCz/oPHHJVO2wHY9L6toKhwLKjFdgNA4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437021; c=relaxed/simple;
	bh=a5T9qpkUzRc3UNfYbx2QShdibt3Pd9YHNy+BR99Um4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1TgsF3CZ5OxXGEoVSguPE+DzpF/318X7oEsu7cgfEfiZeQtWjWKMu5d01Q9HFitkos2lDb7GRgQtvE+8JR313kN72gawqhO0oygYMikv4qYY4hg6ym4ToEJnPVBHUx5p4J5AKjLLEtTZHEUXarI6JCe4fGE3krL4LUKhNF3IGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTlaB7un; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29281F000E9;
	Tue,  7 Jul 2026 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783437020;
	bh=a5T9qpkUzRc3UNfYbx2QShdibt3Pd9YHNy+BR99Um4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTlaB7unlIc7lCSZGDt/1AsbEvD4EMJGllcAmt1hsAHcByPdEJUFwz1EelX9gbVWt
	 V+MvvoXRucD6hs0djixaMg0ankEl9rmn/7vPADTchv2IClhXnwiQWZqqAyEsNQCBwt
	 z2m5Q91gKFHInzD01KyUIeYtqh+osNQOH21HC+XA97h3i3whr/D+NYHOhmuRj31Ka1
	 QA2u5a0+aH1HgpXy6ua4e5ACtJevYNyXccJeCwU+hIhbvNRUnVw/S/Nk7+bA4Ggza3
	 8w/DZ5ow+Es8+W7RYghNJm82T+1u1nYRDhg9JaH0Q/LtC4ZJp/cQjVDBzV1HG/ghCs
	 QTV0K+oBMg1KA==
Date: Tue, 7 Jul 2026 16:10:07 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Boris Burkov <boris@bur.io>, Jeff Layton <jlayton@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <ak0UjMSqm_6vCDIu@lucifer>
References: <akaWnQ5Pkg_676B-@lucifer>
 <20260702211740.GA639365@zen.localdomain>
 <3f447113-4407-471f-878f-e6d6edafee71@kernel.org>
 <akez23ZhLRSGMFQ1@lucifer>
 <20260703163251.GB3734786@killaraus.ideasonboard.com>
 <e93d28e4-750c-4a4f-8bfd-7a0b404cd05c@kernel.org>
 <akzETpsps4TMfqpC@lucifer>
 <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
 <akzMh-ySQ2fN0d8R@lucifer>
 <5ccbb28a-171e-40c1-9a6b-9ac7b6b7777d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ccbb28a-171e-40c1-9a6b-9ac7b6b7777d@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:laurent.pinchart@ideasonboard.com,m:boris@bur.io,m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95400-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,bur.io,kernel.org,linuxfoundation.org,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BB3671D39C

On Tue, Jul 07, 2026 at 03:29:44PM +0200, David Hildenbrand (Arm) wrote:
> On 7/7/26 11:55, Lorenzo Stoakes wrote:
> > LGTM! Do you want to send that then? People can comment on the actual path then
> > (probably worth cc'ing everybody here on that also).
>
> Let's first gather some more thoughts on the rough direction before spinning of
> yet another discussion. :)

I'm suggesting sending a simple, uncontroversial, change to get movement rather
than continue this never-ending talking shop :)

Anyway I'll leave it up to you!

Thanks, Lorenzo

