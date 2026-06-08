Return-Path: <linux-doc+bounces-91468-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zIoFJK77JmqupAIAu9opvQ
	(envelope-from <linux-doc+bounces-91468-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 19:28:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F10DE6593B9
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 19:28:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qqtv9pdH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91468-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91468-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF5DD300E24C
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 17:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05A83D7D8E;
	Mon,  8 Jun 2026 17:28:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B13D1A82;
	Mon,  8 Jun 2026 17:28:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939691; cv=none; b=Kz9wV5JcFPU0gPJgOpSdD19ui/7+ewnUzmKx4GL/QRNhMy6qyVKHrX2ylQLHzxgninTcDCn7R/TNNORGX41mG+1xZzBtpHhq28z9zA+tTD2qX6UjMa6Ef21d/Rb2rHYLDwBQTzZfm55J4aNtXqDYHo9GkQXm26dfUs9NPRcRTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939691; c=relaxed/simple;
	bh=LeBo+W2lj1EQo4xZAGFHNezqySwQpYy/3zNiU0PcrCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg2A/t37NcsCtwf5CZOfKZcD8Pkbn6aKdXXpORRsbcAgUq21dVncvr8i0HQbWLT/Kt2BfTQTM9to9bZJ5ZEyvkCceX3vK/T06RqywRDnLdUezG7hqonI+Sfy+UN1fyw9oQmc9JNQ7lIsSEtPCxXgWS2g5gJcnMypbwan3qLc51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qqtv9pdH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398241F00893;
	Mon,  8 Jun 2026 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939689;
	bh=ZvogMBhb35RN+RaMC9PCONZeAw+VZcVdotQJUVUQAZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qqtv9pdHBcywZ630UmovLHceKdpYTI39vazQjPUGVMyB7zl1GZE6/vjTpPsP6cC7s
	 JOgiAOW/3YHa1/OwLj5Wkxy5ISaE7Zkbag+kHjzb24zcLGJ4TPgvnRhamgWv/5B3MR
	 xKsGY0g9sITTRnG9SCF/GGmU6FOBB/2OC0NHY5TLPb4HLf6MJHhhdSqEs/4t9zst1y
	 Ml3Q54jKHgC9NZa8BcnIc60tNCFc3RXAqMh8p2R0j7TyX+HkhPvt78UFgSZS8BzDKe
	 cJpXwv4qVxKyJdgOnM8phxRDW0cDv9Slwbop/sPriZqTJ4dFUVx0RNirUbV2FmKNsp
	 +JHpPmOPV9XNw==
Date: Mon, 8 Jun 2026 18:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 0/6] iio: add Open Sensor Fusion IIO driver
Message-ID: <20260608-catnap-thinness-e25c9b8983c3@spud>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2chOGZFh73gtDr1q"
Content-Disposition: inline
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:jic23@kernel.org,m:linux-iio@vger.kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91468-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F10DE6593B9


--2chOGZFh73gtDr1q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jun 08, 2026 at 08:43:37AM +0900, Jinseob Kim wrote:
> This RFC series adds an Industrial I/O driver for Open Sensor Fusion
> sensor aggregation devices.
>=20
> Open Sensor Fusion is an open hardware project for sensor
> aggregation devices. The Linux IIO driver is an initial host-side
> implementation for OSF devices. The driver receives OSF frames over
> UART, uses device capability reports to discover supported sensor
> streams, and exposes supported raw sensor data through IIO devices.
>=20
> This series is still marked RFC because the DT binding identity, the
> supported OSF protocol subset, and protocol extension and backward
> compatibility rules are still under review. The v4 series
> intentionally models the Linux device as a generic Open Sensor Fusion
> device rather than an OSF GREEN board-specific device. OSF GREEN is
> the prototype board used for current runtime testing, not the Linux DT
> compatible or driver identity.

Other than the fact that new revisions must not be sent as a diff on top
of a prior revision, please stop sending new versions without actually
replying to my v1 comments. In particular:

| What does "v0" mean here? Is the data format not complete yet?
| Are versions of the protocol likely to be backwards compatible?
| Will the device identify what version of the protocol it implements?

This version drops mention of v0 in the binding, but I don't know if that
means the version is fully discoverable or if you've moved to a stable
revision etc. You need to spell this stuff out to us, I'm not going to
read a github repository to figure this out - I have hundreds of patches
to get through every day. It's your responsibility to explain it all.

> The current wire format uses the OSF0 magic for protocol major
> version 0. That is kept as an internal wire-format detail for

For example, what does "OSF0 magic" mean? Is that a detectable version
number in a consistent place across revisions? Or will OSF1 magic be
incompatible. From a devicetree point of view, that's important because
if the magic is in different places in different revisions, the
compatible needs to convey what revision the device implements.

> compatibility with existing firmware, tools, and runtime smoke
> evidence. The public driver identity remains Open Sensor Fusion / OSF,
> with protocol versioning handled by the protocol major/minor fields.

This sounds like versioning is discoverable, but you need to spell this
out in the commit message for the binding.

Thanks,
Conor.

>=20
> Project links:
> https://www.opensensorfusion.org/
> https://github.com/opensensorfusion
> https://github.com/opensensorfusion/opensensorfusion-hardware
> https://github.com/opensensorfusion/opensensorfusion-linux
>=20
> Runtime testing so far has used an OSF GREEN prototype connected to a
> Raspberry Pi over UART. On Raspberry Pi 6.12.75+rpt-rpi-v8, the
> driver registered osf-accel, osf-gyro, osf-magn, and osf-temp from a
> capability report. Raw reads and software kfifo buffer reads were
> tested for all four IIO devices.
>=20
> Changes since v3:
>=20
> * Explain why the series is still RFC.
> * Move the DT binding out of iio/imu because the device is a sensor
>   aggregation device rather than an IMU.
> * Replace the OSF GREEN board-specific compatible with the generic
>   opensensorfusion,osf compatible.
> * Treat OSF GREEN as tested prototype hardware / board model
>   information, not as the Linux compatible string.
> * Rename the kernel documentation to open-sensor-fusion.rst and
>   reduce it to a driver-facing overview.
> * Add the IIO documentation toctree entry.
> * Keep full protocol details and compatibility rules in project
>   documentation rather than duplicating the full wire specification in
>   the kernel tree.
> * Avoid using OSF0 as the public driver identity; keep it only as the
>   current wire magic for protocol major version 0.
> * Add FourCC-style wire magic handling in the decoder.
> * Use GENMASK() for the capability flags mask.
> * Clarify signed 32-bit little-endian sample decoding.
> * Stop counting normal partial UART receive waits as partial frame
>   errors.
> * Avoid decoding complete frames twice in the stream/core path.
> * Remove the local scan[] bounce before
>   iio_push_to_buffers_with_ts_unaligned() and pass the values buffer
>   directly.
> * Remove the meaningless temperature available_scan_masks entry.
> * Update MAINTAINERS paths for the new binding and documentation
>   names.
>=20
> Jinseob Kim (6):
>   dt-bindings: iio: add Open Sensor Fusion device
>   Documentation: iio: add Open Sensor Fusion driver overview
>   iio: osf: add protocol decoding
>   iio: osf: add stream parser
>   iio: osf: add UART transport
>   iio: osf: register IIO devices from capabilities
>=20
>  .../iio/imu/opensensorfusion,osf-green.yaml   |  43 ---
>  .../bindings/iio/opensensorfusion,osf.yaml    |  43 +++
>  Documentation/iio/index.rst                   |   1 +
>  .../iio/open-sensor-fusion-protocol-v0.rst    | 308 ------------------
>  Documentation/iio/open-sensor-fusion.rst      |  62 ++++
>  MAINTAINERS                                   |  26 +-
>  drivers/iio/opensensorfusion/Kconfig          |   4 +-
>  drivers/iio/opensensorfusion/osf_core.c       |   9 +-
>  drivers/iio/opensensorfusion/osf_iio.c        |  15 +-
>  drivers/iio/opensensorfusion/osf_protocol.c   |   4 +-
>  drivers/iio/opensensorfusion/osf_protocol.h   |   4 +-
>  drivers/iio/opensensorfusion/osf_serdev.c     |   2 +-
>  drivers/iio/opensensorfusion/osf_stream.c     |  38 +--
>  13 files changed, 145 insertions(+), 414 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorf=
usion,osf-green.yaml
>  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusio=
n,osf.yaml
>  delete mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst
>  create mode 100644 Documentation/iio/open-sensor-fusion.rst
>=20
> --=20
> 2.43.0
>=20

--2chOGZFh73gtDr1q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib7pQAKCRB4tDGHoIJi
0lPWAP0d6iddVwXrTzNZYCYnWhur8+5OfqO+uDBZosL1hq85dQEAwbP9RkL6RD/S
TdrgQ9z+MCjg2ufnn4ouqdaDGyEuGgc=
=ltaP
-----END PGP SIGNATURE-----

--2chOGZFh73gtDr1q--

