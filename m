Return-Path: <linux-doc+bounces-85953-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHjkF20k+mnyKAMAu9opvQ
	(envelope-from <linux-doc+bounces-85953-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 19:10:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A604D1D1A
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 19:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B47C9300D90B
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 17:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEBC494A14;
	Tue,  5 May 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvMEyuJx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982C49251B;
	Tue,  5 May 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001000; cv=none; b=i0hbeRmy0v9l+TQOgg5fbOYleIdLP5hOjMg3RqPWP3hZRFBckCC1LtSxiEuJV8An9F+wIkD/ICPUwaAy6OsRYsbENKLx2SN9g9Y9sPKrt+QgoDmrVidMs9wK4Q2IaLU9vyj5x76YaLvskxc0olWokJb8RXzYiXXxcvcHXjLcVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001000; c=relaxed/simple;
	bh=mKF9MtJdN12/ezpzx+6Gx5YWYtCRGx7bFBhDIXAgUeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dzroud2Q+m0PBowkYMDqakNhS3VqGxdi5HykgaCbxmlRSphPe2x6jQNCw4WmkS4be5GYd8trh4Uk6H9W3QDJdRw8bc+e3QAJbpqUw6wNzzrFRX9C80Zkr1xO0nuAMStG8hsvLSst7ySXgCCaFlGvMXbAYDcsw+1KggjcgF7nGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvMEyuJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB76C2BCB4;
	Tue,  5 May 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778001000;
	bh=mKF9MtJdN12/ezpzx+6Gx5YWYtCRGx7bFBhDIXAgUeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZvMEyuJxqN+rnB59LG4kVV4VCnbnBl4VHFjoMk3Dy6XT89qT0WsgMpc/qQ7wTEexd
	 tlX6lFjwXM/CiIE5oOl/O6LyWd0QcFClGvihxofpyhVztY/mpa8mMte71rmFpYbV0o
	 GF5F+QXLWNqNQvEwdv6JlrbKSZ57jpCECc9qsrMRiOwVfkZmVLAFNY+TTAuqDFE3bz
	 hYCXC5Of3jdZxhYdxf4VyOSeqt+RpWsWp5aZ+H3D1ShBMz4SFjG+DpE1fPxFnM2FQA
	 eiTLA4d4rvnyybyck/+LaC6qkqOetG6jk/G9lWIuWHUWRKSydKMpf9VoaYdIJKbZHB
	 9dNozsSodBrvQ==
Date: Tue, 5 May 2026 18:09:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, Rodrigo Alencar via B4
 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v3 9/9] docs: iio: add documentation for ad9910
 driver
Message-ID: <20260505180947.4792eb25@jic23-huawei>
In-Reply-To: <acpq4fyekssspgche7q6g5ns57y25alalooorybqfz2fzdr2yu@wj6seookj4ip>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
	<20260417-ad9910-iio-driver-v3-9-29b93712a228@analog.com>
	<20260426141007.345c76e4@jic23-huawei>
	<lkvrmc6y2z45b4qsmaxg3c2iaiar6hjmim3hdbkxqx3536yx3p@o6h7de4ire2d>
	<20260427104608.7819a134@jic23-huawei>
	<ae84112jP9UcsHYG@nsa>
	<acpq4fyekssspgche7q6g5ns57y25alalooorybqfz2fzdr2yu@wj6seookj4ip>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6A604D1D1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85953-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,analog.com,vger.kernel.org,metafoo.de,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 15:54:14 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 26/04/27 11:31AM, Nuno S=C3=A1 wrote:
> > On Mon, Apr 27, 2026 at 10:46:08AM +0100, Jonathan Cameron wrote: =20
> > > On Sun, 26 Apr 2026 21:42:15 +0100
> > > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > >  =20
> > > > On 26/04/26 02:10PM, Jonathan Cameron wrote: =20
> > > > > On Fri, 17 Apr 2026 09:17:38 +0100
> > > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@=
kernel.org> wrote:
> > > > >    =20
> > > > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > > >=20
> > > > > > Add documentation for the AD9910 DDS IIO driver, which describe=
s channels,
> > > > > > DDS modes, attributes and ABI usage examples.
> > > > > >=20
> > > > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>   =
=20
> > > > >=20
> > > > > Hi Rodrigo,
> > > > >=20
> > > > > I think this is getting close to something workable subject to so=
me tweaks
> > > > > to not make the priority thing visible and use rate of change par=
ameters
> > > > > so /Sec rather than steps.   =20
> > > >=20
> > > > I am not sure about this one. Getting the value into units per seco=
nds will
> > > > increase the range of values by a lot, e.g., for the frequency case=
 the step
> > > > size can range from a few Hz up to the entire supported range (hund=
reds of
> > > > MHz), and if you consider that one would often have the sampling_fr=
equency
> > > > at 250 MHz... an attribute frequency_roc could have an order of 10^=
17 Hz/s,
> > > > and I am not sure how practical is that, although it can have a phy=
sical meaning,
> > > > like a "chirp slope". =20
> > >=20
> > > That scaling is indeed a bit of a pain though it will go in a 64 bit =
int
> > > however, seems likely we'll get higher frequency devices one day that=
 will
> > > limb even faster.
> > >=20
> > > Maybe wait and see if anyone else has input on this.	 =20
> >=20
> > If we think things like RF DACs (which internally - typically - make use
> > of things like DDS), we can already go to the GHz "world".
> >=20
> > Not saying we already have such a device that would map the new ABI with
> > bigger values (we might have but nothing I'm aware of from the top of my
> > head) but just saying the above is, indeed, very likely to pop up at so=
me
> > time.
> >=20
> > Just something to bear in mind :)
> >=20
> > - Nuno S=C3=A1 =20
>=20
> under this Documentation/ABI/testing/sysfs-bus-iio-impedance-analyzer-ad5=
933,
> there is ABI: /sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_=
increment
>=20
> which seems to be a similar concept to the step used here.

Yeah but staging driver so let's not focus on that too much.

>=20


