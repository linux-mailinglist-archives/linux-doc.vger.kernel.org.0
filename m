Return-Path: <linux-doc+bounces-94586-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkZ9F8FZRmqfRQsAu9opvQ
	(envelope-from <linux-doc+bounces-94586-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 14:29:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D26F7986
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 14:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RGHKvjLi;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94586-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94586-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25498310F342
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 12:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CA347DD70;
	Thu,  2 Jul 2026 12:23:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379846AF3B;
	Thu,  2 Jul 2026 12:23:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995011; cv=none; b=U0U6M3Qeepq2oE9Sd40v40xFYbJoD+5BkICNx4f9fnIr3DiU387H3c33tcnLkXzV+GyMqqhry1FN0R+Plpd5+bWspEdye0GlCDu9igD8MjxEHxXYrZST1m4eFMZsz92uZ3vh1IHX+iG+dZz/canSc5bz24yIfZicoM6LHU2yec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995011; c=relaxed/simple;
	bh=pYmO2Mgsm3qNbu9Extssk+fNBa9iFzNsg4SsXlV8Ams=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ/BEg9aONl3fbfiDLY0WIo8Vbl6y19j3q9HopWSSFKKr4RxNDjZyc2Sh7+eOb1jenveUlRXOgk8BhL4FdYxK/P0xlr1gJXsKSIWvht51AqmXV6rCxR2jzi7qhnQVlQxFPPaWoluStDdmjz0C+aF0ymONEF5Xp/rpyJeiT75k+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGHKvjLi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD10E1F000E9;
	Thu,  2 Jul 2026 12:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782995009;
	bh=pYmO2Mgsm3qNbu9Extssk+fNBa9iFzNsg4SsXlV8Ams=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RGHKvjLi/rQ8Uc1aMCl46e4UCyRg5d/WjnWRYYQ+NdUrbxwZZ4lqieHgBqxQDA2yf
	 3pAS6hV0G0OL7FU9kMQTSSxUuEqPHILuItgJFIczqIkL4fvd8TESkUeWzDEn44Gv8d
	 pt/0XPB5DT5IUKwP9OeAD2csN2DEdvnwSpDUgfZe4X08/0dgBsnH1XISS6HJGFxt93
	 sxL3J60TkDiNwPnanjYjCUIO1NSI9EiY3lvBZZCo24stOLp4jX+ZOJiXd6q1d8+IBY
	 pV1WsDeYyN2pOYEsI36EcdGW8yT8vl2fJBknxECAxq/r+AxLuCQEIRdsfIpBkxe63r
	 55/9tpKnfyLIA==
Date: Thu, 2 Jul 2026 13:23:19 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Christian Brauner <brauner@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akZXGJSy0FA3kQ3-@lucifer>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <akYasD1ckWcH1C0g@lt-jori.localdomain>
 <a17b9a17-0ca7-4912-836d-4637cd0110f7@kernel.org>
 <afd0635c-1903-4c7b-8023-cbcd1823e081@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd0635c-1903-4c7b-8023-cbcd1823e081@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94586-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vbabka@kernel.org,m:jkoolstra@xs4all.nl,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,linux-foundation.org,lwn.net,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB9D26F7986

On Thu, Jul 02, 2026 at 12:34:34PM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 10:44, Vlastimil Babka (SUSE) wrote:
> > On 7/2/26 10:12, Jori Koolstra wrote:
> >> Ah, I still reigniting this discussion again :)
> >>
> >> What about a combination of what David and Jeff say? The whole point
> >> seems to me that the salient information is not that an LLM was used (or
> >> are we going to tag Sashiko as well or any other LLM-based code review
> >> tool?), but what is was used to do. This information may be relevant for
> >> how the review is approached. The latter should perhaps only be in the
> >> cover letter and then we can drop the assisted-by tags altogether.
> >>
> >> The question about enforcement remains.
> >
> > It's not possible to enforce it. People can deny it if the tag is missing
> > and you confront them and even though the submission has many signs of being
> > obviously LLM, there is no definite proof. We've seen (likely, as there's no
> > proof!) that happen in mm.
> >
> > Such situation then penalizes those who disclose so obviously they won't. We
> > should drop the tag and instead think how we can empower maintainers to be
> > able to use their own judgment and deprioritize dealing with what they
> > perceive as LLM slop, without fearing consequences of not being properly
> > responsible etc, and not rely on any non-enforceable tags for that.
>
> +1
>
> I see no benefits of enforcing the tag for these exact reasons. Every
> LLM slop will miss the tag. OTOH, seeing reasonable contribution with
> the tag makes my spider-senses tingling and causing unnecessary
> prejudice. If the contribution is reasonable, how does the tag
> information helps me? I trust (or not) the person, regardless what tool
> they use.
>
> And if we think about any future possible copyright issues with LLM
> contributions (like if there is ever a ruling that model trained on BSD
> data creates BSD-derivative work etc), does that tag anyhow solve it?
> Like if that ruling appear we will go through the history and revert the
> commits?

Why would you take information _away_ from maintainers?

You're making every LLM 'accusation' a risk for a maintainer because you might
get the 'how dare you accuse me of using an LLM rah rah rah' response.

Why not eliminate that in at least some cases?

I continue to be baffled at people's opposition adding a single line to emails,
or a single little comment on the end of it.

I do agree with Vlasta that we need to have a clearer way to just say no (TM) if
we strongly suspect an LLM.

I had a very unpleasant experience dealing with blowback for doing that in a
_very_ blatant case and I'd rather not repeat it if it's at all possible.

>
> Best regards,
> Krzysztof

Thanks, Lorenzo

