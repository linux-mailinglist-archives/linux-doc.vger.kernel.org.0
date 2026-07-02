Return-Path: <linux-doc+bounces-94623-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PjcoF+KARmrYXQsAu9opvQ
	(envelope-from <linux-doc+bounces-94623-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:16:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0626F94A4
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:16:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=D2mHB+r0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94623-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94623-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E021300C00F
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE12351C14;
	Thu,  2 Jul 2026 15:06:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD4303CB0;
	Thu,  2 Jul 2026 15:06:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004814; cv=none; b=TSY+/hqSdqcfHNuOuGdhu2AVbsfss+8pb5vdj9V4fzCqQAkNnN+DyYlF9pyQWIxRTVEpSxobGdJnJnfzG13yVRnI6uzpNvcLGqjp1EsawPKA5Z5CDW+yNGCeg2QQjFcdoOszt0bXJhuAVeiS7iFX/Phbs7p76clyWx0I9JjfaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004814; c=relaxed/simple;
	bh=tlFaz4fot5vD/BI2+jmaNOOxliFNMQZ2DTZWs/Y6LPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFsTdMCXVTa8+RECYtMK1Mi5SOXSXSI658uK1dbKcOZujY+jMzkvCBgwZU9gcXY0oRr//vESz6GLHbJareThZK5Rp8UhniH6bxt6pZuFrC+5Dyfn+HOofc286gtTmywC0TTArRVI53nRcx/zomeNBX7WVxiIn/zMrZj1PfCyLA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D2mHB+r0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398241F000E9;
	Thu,  2 Jul 2026 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783004812;
	bh=+jtRyIDu4u5+oITJVqGs0wT5i8yN1eLaTcHSu79Rl9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2mHB+r0dxK/mbLTyo/yHTy2pPs4AhDlkQ/ArUgXRIMtbzPp5qatagWkN4sxSX2hK
	 6UdosYyXp318TlIMFepkN01s1dnGuy/0irVXlWcAVhD9ag5I5/RHlhlct5FZ2u9Z+9
	 UQJububszEtEYQp8gUdCRX3/iiBlG9g8RU9OcN48=
Date: Thu, 2 Jul 2026 17:07:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <2026070224-unholy-commode-cf45@gregkh>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94623-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,google.com,kernel.org,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C0626F94A4

On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> We've had this requirement in place in the Documentation for several
> months, but it's becoming clear that the signal to noise ratio from this
> is quite low.
> 
> 1/ It's not universally followed. While many people do try to attribute
> the LLMs in good faith, not everyone does for various reasons.

Then let's move to get people to follow it.

> 2/ It basically serves as free advertising for proprietary LLM companies.

Who cares, make up a name, all I want is the "signal" that someone is
using a LLM so that I can review it as-such.  And if I think someone is
not reporting that, I can ask for them to properly attribute it and if
they lie, well, that's on them.

> 3/ It's not clear why we want to collect this info in the first place.

We want to know if a LLM is being used.

> Given that the data this provides is flawed at best and is being
> collected for a purpose that isn't clear, let's just kill the
> requirement for these tags from the kernel at large.

No, please do not do this.  It's useful already for many patches in my
subsystems, and is only going to be used more in the future.

thanks,

greg k-h

