Return-Path: <linux-doc+bounces-94088-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hVZOMHj6QmqiLAoAu9opvQ
	(envelope-from <linux-doc+bounces-94088-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 01:06:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6656DF240
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 01:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dsSBnHBz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94088-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94088-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB8C23012C43
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 23:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770E53B4439;
	Mon, 29 Jun 2026 23:06:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDA314D37;
	Mon, 29 Jun 2026 23:06:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782774389; cv=none; b=NiPL+ljMhStFSp+we1+Bd9MylEaff3gxRlNEtlIDpPZUN3Lf8Z/vo6jkmrSKxLIDHL5oH/SpffnlWo/2K5FnTxJH/pm1gwLmyi22itW30IshBbQyPP0AkP9Za0Jbo/D5dkRpx6QomdP0j6ohHCS4VtC9uWQ61exyCpki0hi31q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782774389; c=relaxed/simple;
	bh=I4iUEOybQEsmzXuAAIf1/3WyDgQopgAoddtkkV2U5Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLACrje/1JyLNL9qaC7I1dBrPEohJ+am3e0f0t4t136qGDTR+3mbgG3wDZHFcy3Tz1BOX1WDY6jmbucg3QjVmofHS5zvOeR3iE8gmRN0KBrYitPGqpBjZX8f8UGvBcahmCqjOL2A5zspVyx1XhvX82+W8dy09JN2itiIS0hjWgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsSBnHBz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116001F000E9;
	Mon, 29 Jun 2026 23:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782774387;
	bh=TmAM2oLhV2akH1urBQaUp/FvEz6ljKoVqlmJvVn6sOU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dsSBnHBzXNloL6KjMUL6eLyQLcTK0rAPFE8UTksSeq6UDa+eXAqYu9IuM+gfQo6AC
	 ygbjD/0cj/RjI4VndzpirYnmoP1uwaqCfp9tAF//I1iwrpXMK8SMKctZ31ukhgzvmq
	 0f7wJ90/27O7LYHJO+w7Ty3j715vlMp3Je7mG6B60VQXUixfRIPq4n0IJKcOniDPUY
	 qjuCApnUnKIfQBaYVHfjN0sKUAQY0hCYfhPTUCoCHG2zqNCcd60MycqP5Dq+NZZdsw
	 AkiYuBufrPKClLHkJ0vRIqQcGQoixudrMheUhqvv9gNv9PcfK77PrQEupSJnIfFJDN
	 j0WxByEIwDpQg==
Date: Tue, 30 Jun 2026 00:06:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jinseob Kim <kimjinseob88@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 4/5] iio: osf: add authenticated stream parser
Message-ID: <20260630000623.0c030d5f@jic23-huawei>
In-Reply-To: <akJ818gkVzLN7HqU@ashevche-desk.local>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
	<20260628191337.937-5-kimjinseob88@gmail.com>
	<akJ818gkVzLN7HqU@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94088-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:kimjinseob88@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,analog.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,jic23-huawei:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F6656DF240

On Mon, 29 Jun 2026 17:10:31 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Jun 29, 2026 at 04:13:36AM +0900, Jinseob Kim wrote:
> > Add a UART byte-stream parser for Open Sensor Fusion frames.
> > 
> > The parser searches for the OSF0 wire magic, keeps partial frames
> > buffered, checks header length and payload bounds, and passes complete
> > candidate frames to the core decoder.
> > 
> > Rejected candidate frames drop only the current head byte before
> > resynchronizing, so a corrupted unauthenticated payload length cannot
> > make the parser skip later valid frames.  
> 
> ...
> 
> > +#define OSF_STREAM_MAGIC_LEN	4
> > +#define OSF_STREAM_MAX_PAYLOAD_LEN				\
> > +	(OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_LEN)
> > +
> > +static const u8 osf_stream_magic[OSF_STREAM_MAGIC_LEN] = {
> > +	'O', 'S', 'F', '0',
> > +};  
> 
> You have already this in the header (as FourCC), use that.
> 
> ...
> 
> > +static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
> > +{
> > +	size_t old_len = stream->len;
> > +	size_t match_len;  
> 
> > +	size_t i;
> > +
> > +	for (i = 0; i < stream->len; i++) {  
> 
> 	for (size_t i = 0; i < stream->len; i++) {
> 
> > +		match_len = stream->len - i;
> > +		if (match_len > OSF_STREAM_MAGIC_LEN)
> > +			match_len = OSF_STREAM_MAGIC_LEN;
> > +
> > +		if (osf_stream_magic_match(stream->buf + i, match_len)) {
> > +			if (i)
> > +				osf_stream_discard(stream, i);
> > +			return i;
> > +		}
> > +	}
> > +
> > +	stream->len = 0;
> > +	return old_len;
> > +}  
> 
> ...
> 
> I stop here, because it's obvious that you neglected and ignored my previous
> reviews. No explanation given, nothing. This is not how you should interact
> with the community.
> 
> Come again when each of the given comment will be either addressed or argued.
> 
Likewise.  Please make sure to address every comment either through
changes or through reply to the earlier thread.  Perhaps some emails
have gone astray (it happens!). It can be a good idea to take a quick
look at lore.kernel.org to make sure you aren't missing any feedback
on a previous version.

Thanks,

Jonathan



