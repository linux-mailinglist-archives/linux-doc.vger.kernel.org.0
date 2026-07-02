Return-Path: <linux-doc+bounces-94617-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7fzfHr15RmpSWwsAu9opvQ
	(envelope-from <linux-doc+bounces-94617-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 16:46:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984A6F8FFE
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 16:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DPhdg7VU;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94617-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94617-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63F1C300B185
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D2430D419;
	Thu,  2 Jul 2026 14:46:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78972DCF6C;
	Thu,  2 Jul 2026 14:46:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003577; cv=none; b=aRoQp8CHybjYvvpKzH7GlzMo3VYuUggkD5zS88ENR+XRs4c218NdLgooTJ0yzrADIUNfehXU4w0X8T3/3r3u8agraoq0t11bVu7hxqLHFrKX4JJ670BjA45B77gZ1KTzUq8hP74ga0Z0d8yJ02d27sWrl4MHIerzEMabywliDos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003577; c=relaxed/simple;
	bh=5c7tc9jWyeW+Ar5vmIaMB6k6xdAeTe8Mi8XrpBZReYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r148r5945brBF0lczSDHbPC3V0gAzLnb0/Ny+o5Dgvx1xA63ZOwOGhYrKDYOjIBduZqqMoVS8rkuas/oAmZRJRk8WfK60aWN9leDOdDnIK+Tfz0XLAU7bkDKoLOForh5MTzkPnVkDpJ/IhN4OWkRbNflc4pK2eLtrg2OM77DBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPhdg7VU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DF11F00A3A;
	Thu,  2 Jul 2026 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783003576;
	bh=5c7tc9jWyeW+Ar5vmIaMB6k6xdAeTe8Mi8XrpBZReYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DPhdg7VUhl7YBGeDQR+WTho9c3YkHv/mXIX7R5ZvC3p4a+UnxjOlYkvo9dtpJXZD+
	 17Uu2iAH5UmJUsHjogtVKG0wuYhIBWi38kHC48FqhA08qMGujG+BLJrbcnGIjbpfBN
	 bEYm+4akaoRQ6ymDy1BAq8qBLxuN0CtFmKJtlLcVQohlQqDrtoieHacrMAXjfUEY3s
	 Q0wUylsJ7eYDddX7FSPHWL4rkxWjHPq6gK23zDfskRDr7j5kUH/N7RN5VJ+OEx68FY
	 B0K+FbMw7hqVtNVjIk/D2JbocpKCCCgq0PxuZ1DSkOT4BuMaVNF0GbT8EOcUETLiTZ
	 M8rDlyuia2jGw==
Date: Thu, 2 Jul 2026 15:46:06 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	Jeff Layton <jlayton@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akZzDfK-yr5ErVJT@lucifer>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <5e7b9d23-4291-48fb-bdc6-47db82d33c80@kernel.org>
 <20260702-seekrank-stilrichtung-mitentscheiden-69a64ee097ec@brauner>
 <1f29f48d-b9ff-4de2-a392-dc05781728be@kernel.org>
 <akYz2aMIco1fbD-t@lucifer>
 <54d3a698-a275-488e-ad36-ef423db30f70@kernel.org>
 <20260702-weitreichend-aufgearbeitet-flausen-fd92f38bbba0@brauner>
 <akZqigap0GTOSkyx@lucifer>
 <20260702-angewachsen-glatze-kassen-61b7761f6564@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-angewachsen-glatze-kassen-61b7761f6564@brauner>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:david@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94617-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1984A6F8FFE

On Thu, Jul 02, 2026 at 04:09:14PM +0200, Christian Brauner wrote:
> > > I think as a global policy this has ran its course.
> >
> > I'm honestly not sure why you sent this patch in the first place if you're
> > simply going to ignore it (+ people's opinions) anyway :)
>
> I sent an RFC patch for the minimal acceptable change in my opinion. It
> turns out that the majority of people on here seem to prefer the removal
> that I mentioned as an alternative in the commit message instead and it
> already happens in practice.

I made arguments as to why I felt tags were useful, linking to actual series,
etc. and I feel it'd be healthier if you would respond to those points rather
than vox populi.

But I guess the ship has sailed.

There's been about 1,000 Assisted-by tags since this doc was introduced at the
end of December 2025, which is small (~2% of all patches) and clearly majorly
underestimates the actual numbers, so 'it already happens in practice' seems a
bit... inaccurate?

I also think there's a lot more frustration in 'it does nothing to prevent the
flood of unacked AI slop' in the responses here, which is totally
understandable.

But I think people are missing the fact it makes it easier to deal with those
instances where people do ack it.

It's imperfect, it shouldn't advertise models, but it's still got actual use. If
you were looking for 'do people have a use for this', then yes, we do.

>
> > I'll still send a patch to link the apparently redundant AI doc to the generated
> > tooling doc because for those who do pay attention it's silly that they're not
> > connected.
>
> This on the other hand seems a bit strange given the direction of this
> discussion.
>

I don't understand that at all. The coding assistants document is not being
deleted, and if you read https://docs.kernel.org/process/generated-content.html
you can see it doesn't enforce tags.

It makes reasonable points that from the sounds of it you don't disagree with?
So why on earth wouldn't we link the two?

Thanks, Lorenzo

