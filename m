Return-Path: <linux-doc+bounces-94717-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3viULIwOR2rpSgAAu9opvQ
	(envelope-from <linux-doc+bounces-94717-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 03:21:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBD6FDB4D
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 03:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RGKp2wWE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94717-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94717-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5719F303A276
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 01:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE592236F2;
	Fri,  3 Jul 2026 01:21:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288701B78F3;
	Fri,  3 Jul 2026 01:21:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783041671; cv=none; b=UUNqvgWbyHH4Z+W6ncp4fzohyycXNPxz/VTlCcK6xfUUzoz5zP96CopAh98Ukj8vWBCF8t//B2HL7ncFDMeSoIBLa3/DbySLTlN7IWunIfAEMhdn1aCV8YK4wYJSWUkrsc8Trn5VONqCtThMjfb10TQCrPFPhlOaa4Qlu29IhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783041671; c=relaxed/simple;
	bh=61lpt2EEc8qNF+Y7FP5OwXW+R43dHh5LY0b3cyc0nC0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPcGwiiYO2kDgJGfpyY3UI/JDNAAk7QpCYIhCl6GZfl9fdvZmu0hTHpHFl7/gS2Rrjc93sbdxsBcz3I1KhfIyMmxzEwEhacjVhaZ4cayfjLSLqqiTdsbaJy0DpquQInA1NLvcWeMvA9kRRj+DXA+/0CZDORIyhd1NRYgP24jY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGKp2wWE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6916F1F000E9;
	Fri,  3 Jul 2026 01:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783041669;
	bh=OkqLMtGim2VaPVghPaQAYErEwHkd6TWt5176otOORr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RGKp2wWEAFuPHFB3CKx97VVnGS+SaBABIzrz3lAm3QJBoJQ/O8gkQsiivOU8tSnCM
	 f0oZQi5sxauQe2Ly9K4rcVjPvBR1GCcAWIg//7Pc3zxK6pTmBWGM44DBEGVdtFqEx2
	 oD0yObZqWU4I1oGs8M/WD3dkmM1CClvCTE5mhJooTTH21Qx2H59+YSkp5JiCpH5ZbB
	 P5ZHXDMaNRcaPi59ClVQb5FDWS4H7WCqBsDnWGumX9a3pox+fkNFKtS69S39cd6oKq
	 zB+A/ZistgCHE8jdR0qulcxtcmaM7Bdw1nIdKNNbovIBSLdyItRgYGFai60ve+3X7N
	 mqQutEqI1V0VA==
Date: Fri, 3 Jul 2026 02:21:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 05/16] iio: core: support 64-bit register through
 debugfs
Message-ID: <20260703022104.5f452219@jic23-huawei>
In-Reply-To: <ajQDsZWJQRKKM0dv@nsa>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
	<20260618-ad9910-iio-driver-v6-5-79125ffbe430@analog.com>
	<ajQDsZWJQRKKM0dv@nsa>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:noname.nuno@gmail.com,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:nonamenuno@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
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
	TAGGED_FROM(0.00)[bounces-94717-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50EBD6FDB4D

On Thu, 18 Jun 2026 15:45:23 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, Jun 18, 2026 at 02:27:21PM +0100, Rodrigo Alencar via B4 Relay wr=
ote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> >=20
> > Add debugfs_reg64_access function pointer field into iio_info and modify
> > file operation callbacks to favor 64-bit variant when it is available.
> >=20
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  drivers/iio/industrialio-core.c | 33 ++++++++++++++++++++++++---------
> >  include/linux/iio/iio-opaque.h  |  2 +-
> >  include/linux/iio/iio.h         |  4 ++++
> >  3 files changed, 29 insertions(+), 10 deletions(-)
> >=20
> > @@ -471,7 +485,8 @@ static void iio_device_register_debugfs(struct iio_=
dev *indio_dev)
> >  {
> >  	struct iio_dev_opaque *iio_dev_opaque;
> > =20
> > -	if (indio_dev->info->debugfs_reg_access =3D=3D NULL)
> > +	if (!indio_dev->info->debugfs_reg_access &&
> > +	    !indio_dev->info->debugfs_reg64_access)
> >  		return; =20
>=20
> Not really that important but should dev_warn() in case someone gives
> both callbacks? Can't use both anyways.
>=20
> (We now have agentic help reviewing the code so maybe even if someone
> does it for some reason it won't pass review :))
>=20
Definitely marginal. Not sure I'd bother. However the docs
could say something about the mutual exclusivity.  See below.

> - Nuno S=C3=A1
> > =20
> >  	if (!iio_debugfs_dentry)
> > diff --git a/include/linux/iio/iio-opaque.h b/include/linux/iio/iio-opa=
que.h
> > index b87841a355f8..98330385e08d 100644
> > --- a/include/linux/iio/iio-opaque.h
> > +++ b/include/linux/iio/iio-opaque.h
> > @@ -73,7 +73,7 @@ struct iio_dev_opaque {
> >  #if defined(CONFIG_DEBUG_FS)
> >  	struct dentry			*debugfs_dentry;
> >  	unsigned int			cached_reg_addr;
> > -	char				read_buf[20];
> > +	char				read_buf[24];
> >  	unsigned int			read_buf_len;
> >  #endif
> >  };
> > diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> > index 711c00f67371..1c7d12af22da 100644
> > --- a/include/linux/iio/iio.h
> > +++ b/include/linux/iio/iio.h
> > @@ -484,6 +484,7 @@ struct iio_trigger; /* forward declaration */
> >   * @update_scan_mode:	function to configure device and scan buffer when
> >   *			channels have changed
> >   * @debugfs_reg_access:	function to read or write register value of de=
vice
> > + * @debugfs_reg64_access: function to read or write 64-bit register va=
lue of device

Based on Nuno's observation above, I think this needs to say this and debug=
fs_reg_access
are mutually exclusive.

Otherwise LGTM.

> >   * @fwnode_xlate:	fwnode based function pointer to obtain channel spec=
ifier index.
> >   * @hwfifo_set_watermark: function pointer to set the current hardware
> >   *			fifo watermark level; see hwfifo_* entries in
> > @@ -572,6 +573,9 @@ struct iio_info {
> >  	int (*debugfs_reg_access)(struct iio_dev *indio_dev,
> >  				  unsigned int reg, unsigned int writeval,
> >  				  unsigned int *readval);
> > +	int (*debugfs_reg64_access)(struct iio_dev *indio_dev,
> > +				    unsigned int reg, u64 writeval,
> > +				    u64 *readval);
> >  	int (*fwnode_xlate)(struct iio_dev *indio_dev,
> >  			    const struct fwnode_reference_args *iiospec);
> >  	int (*hwfifo_set_watermark)(struct iio_dev *indio_dev, unsigned int v=
al);
> >=20
> > --=20
> > 2.43.0
> >=20
> >  =20


