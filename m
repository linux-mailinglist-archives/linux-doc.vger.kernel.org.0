Return-Path: <linux-doc+bounces-94259-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I9UXEddcRGpEtgoAu9opvQ
	(envelope-from <linux-doc+bounces-94259-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 02:18:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F76E8DF8
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 02:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LyJu1wcK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94259-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94259-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5C8A3059D28
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 00:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886A382866;
	Wed,  1 Jul 2026 00:13:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AFC17736;
	Wed,  1 Jul 2026 00:13:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864803; cv=none; b=rvyxd5d2pijsjHJoo7DO5nid2Z+gODI3EvQATp38EYBN5exD1Z7xH8WEFri6/eJGkU4aLPcVkuQHCnbEJ9mwxU9KC0BY2/eMRcYXpf542KbSIwpKRSbP7lpdcUOATQtx9qhwk8MC2qkbvqGaqZWlQN2+Eiw/iV8DwnCIvnYtGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864803; c=relaxed/simple;
	bh=xlRsoySwmtKcnxv6OFIt2H56qw8lNTnI6qyJT3sKTVA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjntiPHf+hJ0Y2LLbRsh27n6UD/mI96U9iCw5DU3Ej4vRazo7bk1wLVjcmyTgpy4pMxWs7xEpbNSIz678WfwwFRmBLp6A/RfO2xNI3UQoE0zBHxRjfvCRvwzrvtHttuv6iYe0Vhmg9HAVXFYh55EMT+j6F5GvjcsioVWyFTzUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyJu1wcK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358B11F000E9;
	Wed,  1 Jul 2026 00:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782864802;
	bh=5e/PLzqrcTAEl4YEODzsKqyRAhDwaFeBGekCR184Fek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LyJu1wcKr1DSRH/Sh/BRIWCx/bDwbT8/YdZNEYkE07lrUUWUQExL3wxNNlY//2Y79
	 pqsTx5JYT/W2GVsKEA7Icdx44Uu2FHkABlZ9HN27d/0E9B6a0IzmAkeNBFNZHGeJGJ
	 B1LRYGcuQzRS1ArosWXwbKo4al+UQQLY/YvJXop7WoWthZZHl4B+F603a8mmbIHefS
	 AHgF0vH8euCASvfNPY9sIojQSrD5eqzQUf8Pt3fJCL7jNt2Nel9xhdYsgEskU42qx2
	 EMZkwBI7Xr1TCHcy6drquGA7pmg7+WnxNDY4Y0Pe4dYvB52zBXge1fSkceShjUCbBi
	 Q1jM0CR/CoA/g==
Date: Wed, 1 Jul 2026 01:13:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kim Jinseob <kimjinseob88@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 2/5] Documentation: iio: add Open Sensor Fusion
 driver overview
Message-ID: <20260701011315.2a7c56af@jic23-huawei>
In-Reply-To: <CALMSew+=8P851Wdc=zDLsU5T9YC_ZeTHRotCzYiFP=LNznZhDQ@mail.gmail.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
	<20260628191337.937-3-kimjinseob88@gmail.com>
	<20260630000254.1d1cf422@jic23-huawei>
	<CALMSew+=8P851Wdc=zDLsU5T9YC_ZeTHRotCzYiFP=LNznZhDQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94259-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,jic23-huawei:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A77F76E8DF8

On Tue, 30 Jun 2026 14:04:43 +0900
Kim Jinseob <kimjinseob88@gmail.com> wrote:

> I will remove "initial" there in the next revision.
>=20
Hi Jinseob

A small process thing that a lot of people get 'wrong' is to reply when only
saying you are making the suggested change. That adds a lot of noise to the
mailing list. The correct place for this information is in the change log
for the next version.

Thanks,

Jonathan

> Thanks
>=20
> Jinseob
>=20
> 2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 8:03,=
 Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > On Mon, 29 Jun 2026 04:13:34 +0900
> > Jinseob Kim <kimjinseob88@gmail.com> wrote:
> > =20
> > > Document the Linux IIO mapping for Open Sensor Fusion devices.
> > >
> > > The overview explains that sensor channels are discovered at runtime
> > > from mandatory capability reports. It also documents that OSF0 is a
> > > wire-format detail and that protocol_major and protocol_minor carry
> > > protocol compatibility information.
> > >
> > > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com> =20
> >
> > One small thing inline.  Otherwise looks good to me!
> >
> > Jonathan
> > =20
> > > diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation=
/iio/open-sensor-fusion.rst
> > > new file mode 100644
> > > index 000000000..832901f5e
> > > --- /dev/null
> > > +++ b/Documentation/iio/open-sensor-fusion.rst =20
> > =20
> > > +Timestamps
> > > +----------
> > > +
> > > +OSF frames include a device-side ``timestamp_us`` field. Buffered II=
O samples use
> > > +an IIO timestamp captured on the host when samples are pushed to IIO=
 buffers.
> > > +The initial driver does not correlate the device timestamp with the =
host IIO
> > > +clock. =20
> >
> > Really small thing but I would avoid talking about 'initial' driver.
> > It can cause confusion about when something is true and when it is not
> > as we may have multiple non 'initial' drivers before you get to changing
> > this handling. So just remove that word.
> > =20


