Return-Path: <linux-doc+bounces-94631-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4U8bMR6IRmrlXwsAu9opvQ
	(envelope-from <linux-doc+bounces-94631-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:47:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37236F99FB
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:47:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xs4all.nl header.s=xs4all01 header.b=hcDea4j4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94631-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94631-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=xs4all.nl;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E8D13019B21
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E1237A84C;
	Thu,  2 Jul 2026 15:33:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5F82F8EBF
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 15:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006403; cv=none; b=KGqpGAor/eP9GH3CSey9jMXYU3y7BF3MecTFXFw9N8iO96mj8qPWZxvV4wDzVHBCqXXz9nBSf/+h+zvS+epMQBD19Qz1GFUNzFLj6QkzqucKev9yR3s16WaO4zz3J6PTBHZIzGWIzDteRU9+q7efXevvi1yORvGF2ZuScQ5n1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006403; c=relaxed/simple;
	bh=6+FOGgp4zzePfz4mEYW62UyRjtfv/25YQIJRauA6qj8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=rHbRH+PVN5hkE5Gjqa6X348ka6TMv6WxReqvRSjPIhpO+Lz9lDxdNrxxqcmm6IM1BKBOUi61PtBRB5cLhKPWogSM8ASQWvAvjcuFLqjtZgQ2GcSkoVFF16jUejA0BJgKwIWF6qHk1oK07mKrguos1VwD3jCzk9ZfZlanpf1cunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=hcDea4j4; arc=none smtp.client-ip=195.121.94.186
X-KPN-MessageId: 566d04c1-762b-11f1-bfba-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.190])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 566d04c1-762b-11f1-bfba-00505699b430;
	Thu, 02 Jul 2026 17:33:13 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 566bc83b-762b-11f1-b2fb-0050569977a2;
	Thu, 02 Jul 2026 17:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=WvRby7nWdKkPfgg1YGrRbzS6rYiEI/bAfqEiULM34s8=;
	b=hcDea4j44mVeLZJ2O3CpWJvQSib/wwcogega2L8/HU4BooVE7o5xEE7AD5eGxR6uhh/O2LFLpCpv8
	 m0LAN1SGAjrmkfriUsXlO/03VjB7ZwizuxaXcN2Z5SnpCSNukpGEdlPkVv+qy3QI+++7KqtF12xq9o
	 st5QRv7uzv39tlEPQf+PNi+nsal/jWOE/yA7urH7yebUUvVzm332+C/L8pUIQFh4ESVdeT+nonWbJt
	 xoS9zIXZtFcwPYlveTn+xIuc+SKQfGiAL0YAIsq73USb6rsv1yueYb+G4+/DSfTWjjX00+V29GMxqi
	 JUoFAI3oZKvbvuExbOLSTs6I+pSNkOw==
X-KPN-MID: 33|kMZtHkKLbcYpIFkbOIByUxO8S5Ppan/BpkZOKGlvAuukHK68krF7xLgskdCNagy
 EMgARzD2qpmDWXDg3M6WWB78IfUjZNsDhdcG0xqvrTQc=
X-CMASSUN: 33|rXWkDtkJkurxpzJh3rFxsTHtFC5VZWkhbCp8YRpP39GWxSS+v71q70JqaKwUeqf
 LaxoQmMxOZKbEQIDtGQR0cg==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh03 (cpxoxapps-mh03.personalcloud.so.kpn.org [10.128.135.209])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 565f692a-762b-11f1-916a-005056995d6c;
	Thu, 02 Jul 2026 17:33:13 +0200 (CEST)
Date: Thu, 2 Jul 2026 17:33:12 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Greg KH <gregkh@linuxfoundation.org>, Jeff Layton <jlayton@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Message-ID: <128935557.3798727.1783006392991@kpc.webmail.kpnmail.nl>
In-Reply-To: <2026070224-unholy-commode-cf45@gregkh>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
Subject: Re: [PATCH] Documentation: remove the requirement for LLM
 attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94631-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,xs4all.nl:dkim,xs4all.nl:from_mime,kpc.webmail.kpnmail.nl:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37236F99FB


> Op 02-07-2026 17:07 CEST schreef Greg KH <gregkh@linuxfoundation.org>:
> 
>  
> On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > We've had this requirement in place in the Documentation for several
> > months, but it's becoming clear that the signal to noise ratio from this
> > is quite low.
> > 
> > 1/ It's not universally followed. While many people do try to attribute
> > the LLMs in good faith, not everyone does for various reasons.
> 
> Then let's move to get people to follow it.
> 
> > 2/ It basically serves as free advertising for proprietary LLM companies.
> 
> Who cares, make up a name, all I want is the "signal" that someone is
> using a LLM so that I can review it as-such.  And if I think someone is
> not reporting that, I can ask for them to properly attribute it and if
> they lie, well, that's on them.
> 
> > 3/ It's not clear why we want to collect this info in the first place.
> 
> We want to know if a LLM is being used.
> 
> > Given that the data this provides is flawed at best and is being
> > collected for a purpose that isn't clear, let's just kill the
> > requirement for these tags from the kernel at large.
> 
> No, please do not do this.  It's useful already for many patches in my
> subsystems, and is only going to be used more in the future.
> 
> thanks,
> 
> greg k-h

Why not:

Keep the tag like David suggested as:

Assisted-by: LLM # automated removal of useless blabla

I am indifferent to whether this should be a tag or just below the --- .

And add something like the systemd guidelines that Christian linked to to the
AI Coding Assistants doc page. This provides much more useful guidelines than
what is currently there. I triggered this whole discussion by reading the page
and adding the model to some clean-up commits, so some people do read it...

Best,
Jori.

