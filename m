Return-Path: <linux-doc+bounces-94600-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yFyQLndpRmpjTgsAu9opvQ
	(envelope-from <linux-doc+bounces-94600-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:36:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2C6F86B4
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZcGXSKu4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94600-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94600-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA6E13037F3F
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 13:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B4248B362;
	Thu,  2 Jul 2026 13:27:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB0431E55;
	Thu,  2 Jul 2026 13:27:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998825; cv=none; b=qIA7BjhUfd71pPjNRJWwRjzMhFyGPT/HnuhbfrAgrOwv22DArkPVb+5mVE+DZ1+nGaUrYG/oJQkB14L3loFPp0ljxy7xid8nwoN+DeqgF7mMFwpTv9pfT+8TBA89u/ansY5Lf6g+8m3jR3yFhMklWr9O2K5nYk3WeyHOXTCgvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998825; c=relaxed/simple;
	bh=lSqo6O6WZ+rDfnb7vMn5V/d/pI1JVJxXS2FNIESa+Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8CwQAkZKRggiPTqgIEU6x3zkh94RyFYdB+Ew9t7FmDattccLq44Y1pqZfxMO4vKopqeW8wdbEXIuvQgxXjIS901ebmnyuBp9lzXz8CbfZZnIAUU7+bKhknoNKgdS7xMV59AfjuhXh5K6qJjEbFjGNbWP4UI2n+IFmuLjC4ZaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcGXSKu4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF0F1F000E9;
	Thu,  2 Jul 2026 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998824;
	bh=zC+CbGWapRoHKyQI3zNE/DEViQmuDGCBN+60Eb79jsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZcGXSKu4UBl6s6DCC939ScwNnKE91/22cbrs2i119LT85uIaE5c4h4iEnAoux2+vJ
	 lLk42HWsiStY5YEn9rTc9BhhLCHxPfggO+TVw73gQf3UKa5RJophgJGJPEp4RfPqeB
	 ZX3nq5YOI+krrZMNGRUDp6A4S94qvAKjfzbeA+2bP0z39PTJxz3sFUNb32t36F4h1b
	 9XSjpomX7Z9jU4vrr5YcpxpAMDZV3uCOq45LR1POC53QZYd7Kmhn1g1N7GQapZrWOy
	 ju4OmkcZVsJAW2J1hSpRCLlgEzO00l0FOn7rnt7jqaYJ9Vjn3y98kp6mkHhnanVXqZ
	 YRUwdrkREwXmQ==
Date: Thu, 2 Jul 2026 15:26:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	Jeff Layton <jlayton@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <20260702-weitreichend-aufgearbeitet-flausen-fd92f38bbba0@brauner>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <5e7b9d23-4291-48fb-bdc6-47db82d33c80@kernel.org>
 <20260702-seekrank-stilrichtung-mitentscheiden-69a64ee097ec@brauner>
 <1f29f48d-b9ff-4de2-a392-dc05781728be@kernel.org>
 <akYz2aMIco1fbD-t@lucifer>
 <54d3a698-a275-488e-ad36-ef423db30f70@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54d3a698-a275-488e-ad36-ef423db30f70@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:ljs@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94600-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFE2C6F86B4

On Thu, Jul 02, 2026 at 01:51:10PM +0200, David Hildenbrand (Arm) wrote:
> On 7/2/26 12:04, Lorenzo Stoakes wrote:
> > (thanks for the cc-!)
> > 
> > On Thu, Jul 02, 2026 at 09:46:37AM +0200, David Hildenbrand (Arm) wrote:
> >> On 7/2/26 09:27, Christian Brauner wrote:
> >>>
> >>> I think we should just drop any attribution as a general kernel-wide
> >>> rule and let subsystems require them as needed. Then you can have all
> >>> the complexity in mm for this that you think is needed for your
> >>> workflow to function. This is precisely what the subsystem profiles are
> >>> for. So maybe just add:
> > 
> > A single comment is complexity?
> 
> I think Christian meant more elaborate rules. More than just "If you used LLMs,
> disclose how you used them."

Yes.

I'm going to follow netdev and start dropping those tags from the
changelog completely too. After speaking to some bpf maintainers they
also don't use the tag. So I can safely assume that 3 large subsystems
don't bother with it.

So seems to me that such requirements should just move into the
subsystem profiles.

I think as a global policy this has ran its course.

> > And is it really that egregious to include a tag? You can ignore it if you don't
> > care.
> 
> I hate the current tags as they are. The question I am asking myself: assume we
> stop using the Assisted-by for LLM stuff. What to do with the other tools? Why
> are LLMs suddenly no longer a tool to mention there.

Tbh, I think that's equally pointless. There are also very few instances
of non-AI attribution with Assisted-by.

If the tool mattered to what was done significantly then it should just
be disclosed in an appropriate paragraph in the commit message. The tag
itself is imho equally useless for this. I really don't need to know
that you used grep or git-sed or tcpdump and it certainly doesn't need
to spam the trailers.

