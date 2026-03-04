Return-Path: <linux-doc+bounces-77787-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJxACDyRp2l7iQAAu9opvQ
	(envelope-from <linux-doc+bounces-77787-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 02:56:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 630861F9BD0
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 02:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AD2C3040DA7
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 01:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9C832572E;
	Wed,  4 Mar 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qDCbr5gH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B5fT9Swg"
X-Original-To: linux-doc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37753242B0;
	Wed,  4 Mar 2026 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772589368; cv=none; b=WwYCASB96lxAz2Fc2mhJfSqWp3TmH548HjV/wkgPHB372rUmR3l0G1bha5bADr9KISe1pnh6ZLE/EYDv/OeVqS8Uow6pOwqdRHXMyH7y5w0ND9/kR7oietoRrEvrtympsvyCFzmGPYOyml+Nb6DyJdRUNyxdgqDQ/cng8p2fnCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772589368; c=relaxed/simple;
	bh=acfONvgppEtS3dHf4FteiB/2rLATgYuQ9AY8QDyeEho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oByREN7nvWbKgRxY4AFsXMngFDFqDY76KeZGDsMFv/qUoMEUuZhr4SVKzTqxs2AoVsk8ghFYsXUyoS8CAeh4xbAVNiJCZc0OmB3SBO9kY1RGA9rKJh5UyXZm+/PN10xXUjeyC9+V90TODenwULdxLONgoXVLCMWQP3W7nkWgBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qDCbr5gH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B5fT9Swg; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B9B2F1400209;
	Tue,  3 Mar 2026 20:56:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 03 Mar 2026 20:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1772589365; x=
	1772675765; bh=0cS7wSDQh4Pa0LdDEzf3bgq1DYBrjb/6sLV5fBrHh/M=; b=q
	DCbr5gHZi0SXchGYERHJd/sZWxwZBuupW/83O68Mamy7uvO+SyKQyMYZVQn+zfce
	zLNjirmCqbY9Ox08UVU9KRbZqjtuoxeX557eqg2M69WmOXnVJBThRMebY/NeRjRF
	V31XkrDhbmGw/w1Y7iPphExQvQ9UNNzp4sUaJ84kzmg0qXKUfC9/U77wTSYgfGkr
	TDvNX8McMznGerb/Da/yIVlWxI7nDOSxdjI4jecvaAIDrlG4DZfNNcdfTEAQWkm3
	jqJ7p+NSMK9X43vKL1v5m7njJS/3z+agqZZ1WNz2Rj9RpS6uz52NwyLhuJ/rFPAu
	QzdRCpaYpgcVeBHKLE8gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772589365; x=1772675765; bh=0cS7wSDQh4Pa0LdDEzf3bgq1DYBrjb/6sLV
	5fBrHh/M=; b=B5fT9Swg1mE4hipxm8YPVS2WKU43C6D53c/IY9xqyBxZd5cNV+z
	yCZCTAdrHpB0c0qEdsXMqh2qGyHQlA2bK3ZcsnHMhTaS7+sTS5nXUbKeNhO2uq/Q
	5Sx4I0Z7Ayv4rFo2DwHn5cfSRyqa1gAQih4IWv+L+8f5GR03sOky8mbtMIY62P+b
	6NBD7b5rKGQpwZz1OLzjxNP7gaUVkCKg0bxweCEniKFL2edTgWAAcKwqoH6N7vcJ
	ymEynWNW+Nuoa117ZUlyMWvlD04M2sdIUIy8JYQqmmoXMSK2dJaAk4H1U+UNxHk4
	NXJldTrZYrZ5xcwczoDN+4+jwityXGXDF5A==
X-ME-Sender: <xms:NZGnaTAHHFbJFgLEwIZRRRh6CTDJSRaLV9VSXrUsmY9BBxpeq4nCUQ>
    <xme:NZGnaRSzbgHDvUey5_Jg_O0U9-6_Nnbw1KEuVtx9MofFWU0EpqfeDUgE4Jg6mdsT3
    dCQQnnGr6AvYBHRG_OiO5nYnb6Sbih1UbbjuADiM964ezzGlw7CceE>
X-ME-Received: <xmr:NZGnaRqz1-ljbn13t5v7tdLCAvc0GGFwsnt2yWyZLb0pRaRmIp8_3H7JKHyxfLn7B4AGv-A6geHjDFSvHpkzXt45TnHmf_bhwy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddviedvvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeegieel
    jeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegrfhhkrghrihiivghrghgrfiduvdesghhmrghilhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NZGnaTwfSg7JrPAQk5PMCLsxjmxAieEzlotCqHOCn_ypoOmy7m9EpQ>
    <xmx:NZGnaWI-wu5lAUpPaA-q5QoirLCNTsmB2Ox_1WRjLnkvXRr-iEJWcA>
    <xmx:NZGnaVJcRw5_yqiNQUPmoUIUskDFDgVKs6h5ZgH4zRKQRs_NxA06Rg>
    <xmx:NZGnabsI1tZ3lbI7rRXcPUOOX0lGUlY2RvI-6CtbAbm_p6lsAG2DvQ>
    <xmx:NZGnaZTlqQDG74sKh4QdISdFruzx19om_tlrN1wHkBLLU3MUqQhO9-jt>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 20:56:04 -0500 (EST)
Date: Wed, 4 Mar 2026 10:56:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Afkari Zergaw <afkarizergaw12@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
Message-ID: <20260304015602.GA1159820@workstation.local>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Afkari Zergaw <afkarizergaw12@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260301083612.11661-1-afkarizergaw12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301083612.11661-1-afkarizergaw12@gmail.com>
X-Rspamd-Queue-Id: 630861F9BD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sakamocchi.jp,none];
	R_DKIM_ALLOW(-0.20)[sakamocchi.jp:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[sakamocchi.jp:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-77787-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o-takashi@sakamocchi.jp,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi,

On Sun, Mar 01, 2026 at 08:36:12AM +0000, Afkari Zergaw wrote:
> firewire: net: fix FIXME comment punctuation
> 
> Add a missing colon after the FIXME tag in the comment to follow
> the standard kernel comment style.
> 
> Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
> ---
>  drivers/firewire/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
> index f1a2bee39bf1..70ceab772208 100644
> --- a/drivers/firewire/net.c
> +++ b/drivers/firewire/net.c
> @@ -121,7 +121,7 @@ struct fwnet_partial_datagram {
>  	struct list_head pd_link;
>  	struct list_head fi_list;
>  	struct sk_buff *skb;
> -	/* FIXME Why not use skb->data? */
> +	/* FIXME: Why not use skb->data? */
>  	char *pbuf;
>  	u16 datagram_label;
>  	u16 ether_type;
> -- 
> 2.43.0

I'm sorry but in my polocy to maintain this subsystem this kind of
cosmetic change would not be applied.

And next time please send your change to my address, being CCed to both
lkml and linux1394-devel would be preferable.

For recent status of this subsystem, this document would provide good
information to you:
https://ieee1394.docs.kernel.org/


Thanks

Takashi Sakamoto

