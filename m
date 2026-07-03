Return-Path: <linux-doc+bounces-94749-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x6zvKEtlR2qkXgAAu9opvQ
	(envelope-from <linux-doc+bounces-94749-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 09:31:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CA6FF8F7
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 09:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=T2Eesty9;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94749-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94749-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AF9F301C14B
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 07:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF98342515;
	Fri,  3 Jul 2026 07:30:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D4033E346;
	Fri,  3 Jul 2026 07:30:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063819; cv=none; b=ftviftyWIIvcXRk1eU9vym9ZBEMYGpXnHFl7b5+ge2EO/lp7QStlN38pBxJxSlGHK97R1FWGA465NDOaKwxAIyTh+KgPEgTFGPNHYXf+BZXU7I5RoTpKpsW0PtP+j0WqTEZ/bb0O0EQP6jOFFcot1Ta9M7NCjFAeJ1fPPTn8yYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063819; c=relaxed/simple;
	bh=sV8K8pz5m41+kXej+oXIAb4uthJkxpay7Uxl+GOr7cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCxQ/jD3/r4ql0bftGX446hTvc70MQ4LnMce5w6DEo/fJvwjn+7XCxo9eQKju9j+pxarvoX8yHJoxCZxizw0xuuLG7JMtihiZMgnGmaym5nv0j+zb/0FLv91L8q2rOd9NSivaMZdNcan6yGKFCRwxnALonU/qakbFopANIKuFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T2Eesty9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399BA1F000E9;
	Fri,  3 Jul 2026 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783063817;
	bh=0UkMf5KpFWLG8dCjlwX6LdkEpqXS0Grj+yFQmCspZos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T2Eesty9cDIysvgwI8C9l4up6gr4GCOCjGwtmoRLzTJpxMQTWFQv3nD8cuGSWv1iy
	 /RLtDXnNq+CAQHAyZ/J0ZTJHA0BHJ/0F0P40OmICWwcrR6HlZhXu3N+zzsto72AHNZ
	 lrDoE+ieROWSCFdSomu19tVBDYOCfkDkMSpVjlrU=
Date: Fri, 3 Jul 2026 09:30:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <2026070343-copied-quarters-1e2a@gregkh>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com>
 <2026070227-payroll-eradicate-8f66@gregkh>
 <20260702163215.GC3559965@killaraus.ideasonboard.com>
 <2026070350-drown-untreated-5835@gregkh>
 <a095d9b4-f774-47d9-affd-d519d8acfb34@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a095d9b4-f774-47d9-affd-d519d8acfb34@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94749-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:laurent.pinchart@ideasonboard.com,m:torvalds@linux-foundation.org,m:jlayton@kernel.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux-foundation.org,kernel.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 031CA6FF8F7

On Fri, Jul 03, 2026 at 09:23:11AM +0200, David Hildenbrand (Arm) wrote:
> On 7/3/26 08:37, Greg KH wrote:
> > On Thu, Jul 02, 2026 at 07:32:15PM +0300, Laurent Pinchart wrote:
> >> On Thu, Jul 02, 2026 at 06:19:15PM +0200, Greg KH wrote:
> >>>
> >>> Same here.  I don't care about stats, I care about "how do I review this
> >>> patch" and this gives me that signal that I need if faced with a
> >>> llm-helped patch.
> >>>
> >>> So it needs to stay please.
> >>
> >> There's the free advertising issue we still need to address. Would the
> >> proposed "Assisted-by: LLM" tag to replace product names be an
> >> acceptable option for you ?
> > 
> > I really don't care what the tag says,
> 
> Well, while you don't care, the current policy implies that:
> 
> "
> Assisted-by: AGENT_NAME:MODEL_VERSION
> ...
> ``MODEL_VERSION`` is the specific model version used
> "
> 
> So clarifying there that a "Assisted-by: LLM" is also good enough would make
> sense if we agree on that.

If we all agree on that, I'm saying that _I_ don't care, but others
might.

For me, the info after "Assisted-by:" doesn't matter, it's the first
part.

> I'll also note, that the "*should* include an Assisted-by tag" is pretty weak,
> as someone who worked on specs before.
> 
> My kids should clean up their room; doesn't work.

But, if you notice that your kids didn't clean up their room, and you
had told them to, you can then talk to them about doing it properly
based on what they are supposed to be doing.

That's the point here.

thanks,

greg k-h

