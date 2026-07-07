Return-Path: <linux-doc+bounces-95442-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FPBEDO5NTWrWxwEAu9opvQ
	(envelope-from <linux-doc+bounces-95442-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 21:05:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E571ED91
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 21:05:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=IzZw73A0;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95442-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95442-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E09FD300E337
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 19:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6383A453F;
	Tue,  7 Jul 2026 19:03:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A1D3A1693;
	Tue,  7 Jul 2026 19:03:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451034; cv=none; b=t6nq0QiOPtWxMmMfRfCxLXThqacunBkKt91ZobHtWyy+Qs/OdijOKfVYLfV3Er+ZDoGbEJWl3rFazJHe+4tgKYQYp/nGI8+/5Dgp0Y4Pf8XYesqbzhuI6IEj+PhuzCwpphT2V1fAhOva4+8Breas94ZSwxeLOGqwEBRh5TjJaEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451034; c=relaxed/simple;
	bh=62qobkfwgb/I1gOvXBP5Qfc7oMKhVS8eaJ/kQvZ6WWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gjKM8XziS1oL8Oel1R6Pmapsq9J3J+xAK84yGY8vNY5sn2rjabjVfJpLGlaGXPvgy85kJK52V8RP/HjhxgkNnv7aAk6aUBYmKw7a4BIrkM/1t1vTDLrKyTz1SBz48NMVqfeb0ax4d+L8EWahWz/6VcbQWXKtZNIIDCJSYSONllI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IzZw73A0; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 94CDE40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783451032; bh=EJszX5eNF4dlP8trcZdSt3w2lkANfhcDNIvg9VWnzVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IzZw73A043nmFG6dyet8VMLSKaUzm/fCZpd6Q4FGDU75IWRK7it1frNuobeAVu9Uu
	 yIAyvn+LZOqbrsumXt6N7ePmds/WwVQ1sZWzPUKIhFYv8bU5dirLfDOEX/fKU/Zvv5
	 2lT4saAdgOLpV4MQ1b6ertmzY3fBjzD3x2YnX6/OQaWBpSkYcfmb9EE9ewxz4L9HTS
	 BHSvPjD13ipOZ9ClwjRmZw2UTZtk6h2B/j1ibsARu+QpxseP97C3rrnrkfIAMtsRZI
	 DXgX6pS4LWFCTvCFDUY9crWGNksKnlQWokQxb0SQ8bvH007cQuDBLrpKjfbp7SGeD4
	 HOwBs7FPeVh1g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 94CDE40430;
	Tue,  7 Jul 2026 19:03:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Christian Brauner <brauner@kernel.org>, Christian Brauner
 <brauner@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "David Hildenbrand
 (Arm)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Boris Burkov
 <boris@bur.io>, Jeff Layton <jlayton@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori
 Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>,
 Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, Jani
 Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, Vlastimil
 Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
In-Reply-To: <20260707-impfschutz-lerngruppen-klubhaus-7aabcc82f3b4@brauner>
References: <akaWnQ5Pkg_676B-@lucifer>
 <20260702211740.GA639365@zen.localdomain>
 <3f447113-4407-471f-878f-e6d6edafee71@kernel.org>
 <akez23ZhLRSGMFQ1@lucifer>
 <20260703163251.GB3734786@killaraus.ideasonboard.com>
 <e93d28e4-750c-4a4f-8bfd-7a0b404cd05c@kernel.org>
 <akzETpsps4TMfqpC@lucifer>
 <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
 <20260707124031.GC211515@killaraus.ideasonboard.com>
 <ebc1f034-7297-459e-975d-5c143567392f@kernel.org>
 <20260707141803.GA254690@killaraus.ideasonboard.com>
 <20260707-siebzehn-geleast-gastmahl-4889a8f6b474@brauner>
 <20260707-impfschutz-lerngruppen-klubhaus-7aabcc82f3b4@brauner>
Date: Tue, 07 Jul 2026 13:03:51 -0600
Message-ID: <878q7mr59k.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95442-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:laurent.pinchart@ideasonboard.com,m:david@kernel.org,m:ljs@kernel.org,m:boris@bur.io,m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,bur.io,linuxfoundation.org,linux-foundation.org,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:from_mime,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 296E571ED91

Christian Brauner <brauner@kernel.org> writes:

>> Then someone can basically just merge the original patch I sent since
>> everyone seems to agree on that front. And then the extension to include
>> how the LLM was used can be discussed in a separate patch.
>
> https://patch.msgid.link/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org

I still have it around :)  I can apply it if that's truly the
consensus... I'll confess to having not entirely kept up with the
conversation over the holiday weekend, though, and needing to review
things.

If you object, do let me know.

Thanks,

jon

