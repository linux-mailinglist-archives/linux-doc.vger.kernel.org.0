Return-Path: <linux-doc+bounces-93747-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 56JlFRukPmrUJQkAu9opvQ
	(envelope-from <linux-doc+bounces-93747-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:08:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C35786CEC75
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m2yAD5pl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93747-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93747-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B56BF304A84A
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4F53DFC8D;
	Fri, 26 Jun 2026 16:05:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E537BE7D;
	Fri, 26 Jun 2026 16:05:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489906; cv=none; b=dGmJ2DX5JPDpCV5sMi5BJVuaNtS769pcfAJhWeFn2/Acv3MFwPlMzaTQA6uVGvwLyP/Wrl/rL1xYCMT2b30UowJyWoKRabgWdNPXw8H/ZC5tAFSkbtpkmnxoCVUb/vqGXUVeQj7HNRENKTZp1v/Od5l+FCreUrA6CwzwojXRNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489906; c=relaxed/simple;
	bh=9dfevLQUJ67ZAWdkA+BetLlZXEPedxDTPylzxmLpP40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUf97hTXiFO5A3L1JbZDzzQrM+cFxxaZpXzt2hgkVmpBw+NAz9c05+YOeco50cdwZlITHqeh3fEt/fhk9zAleVy4f04pAf84sri8TmfcxVu2U5I6wzCaDtYCLc8xpk4u/2AyITzC2bR8jduwADW2Ah+GU+N6DIVjdQo+yatYYS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2yAD5pl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273471F000E9;
	Fri, 26 Jun 2026 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489904;
	bh=agO4Z1h9DZD6dkyDAR6EVjfAZLNbhj4L7fvPd9Abd4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m2yAD5pl8rbGleJHS+ABi6ZH4UQHFWpScWGcAX75oANTRayJAz5+2U/6oxd/KLhiq
	 K0od4RJ1rHNcVkQPMdDvZ27wvj/IOap5j7W4F6yBhlyYd81AMvGzrxHoj4bohW7L0M
	 FmIgs8iq3G6XRiSFH/WE24hZGGBpEl8/ZhVvipFVbOz8KrZB6pbpTGoPzYJkpHrJao
	 qMEiial0USyABZw8ZXoOTRrdIXkrXG0c66oh0EskfDhlXdD5BJEwtdY5sgRYndtJac
	 GWohA+isgpMlemKokXw2EnoF2CYzCsKCd3TjPAp11wnpCwiJODCC2gUscYjnkVGuaE
	 YyXSlAdT99Rbg==
Date: Fri, 26 Jun 2026 09:05:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: riscv: Add generic CBQRI controller
 binding
Message-ID: <aj6jLrECZM18I4MP@thelio>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
 <20260625-cupbearer-failing-9ce0abf97b93@spud>
 <aj1_0AnIBk8_xoDd@gen8>
 <20260626-immobile-staining-c825a86bd613@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+0HGToKbj2BaC/Io"
Content-Disposition: inline
In-Reply-To: <20260626-immobile-staining-c825a86bd613@spud>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghua.yu@intel.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.k
 ernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93747-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,intel.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,sifive.com,linutronix.de,bytedance.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C35786CEC75


--+0HGToKbj2BaC/Io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 04:44:56PM +0100, Conor Dooley wrote:
> On Thu, Jun 25, 2026 at 12:21:52PM -0700, Drew Fustini wrote:
> > On Thu, Jun 25, 2026 at 05:19:28PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> > > > Document the generic compatibles for capacity and bandwidth control=
lers
> > > > that implement the RISC-V CBQRI specification. The binding also
> > > > describes the common riscv,cbqri-rcid and riscv,cbqri-mcid properti=
es,
> > > > and the optional riscv,cbqri-cache phandle that links a capacity
> > > > controller to the cache whose capacity it allocates.
> > > >=20
> > > > Assisted-by: Claude:claude-opus-4-8
> > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++=
++++++++++++
> > > >  MAINTAINERS                                        |  1 +
> > > >  2 files changed, 98 insertions(+)
> >=20
> > Thanks for the review.
> >=20
> > [..]
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - description: Tenstorrent Ascalon Shared Cache
> > > > +            const: tenstorrent,ascalon-sc-cbqri
> > > > +          - const: riscv,cbqri-capacity-controller
> > > > +      - enum:
> > > > +          - riscv,cbqri-capacity-controller
> > > > +          - riscv,cbqri-bandwidth-controller
> > >=20
> > > Please modify this, as has been done for other riscv spec related
> > > bindings, to let people get away without using device-specific
> > > compatibles.
> > >=20
> > > In this case, you can just delete the first entry from this enum, sin=
ce
> > > it already has a user and only have to implement this feedback for the
> > > second entry.
> >=20
> > Would this work?
> >=20
> > properties:
> >   compatible:
> >     oneOf:
> >       - items:
> >           - enum:
> >               - tenstorrent,ascalon-sc-cbqri # Tenstorrent Ascalon Shar=
ed Cache
> >           - const: riscv,cbqri-capacity-controller
> >       - items:
> >           - {}
> >           - const: riscv,cbqri-bandwidth-controller
>=20
>=20
> Should do, yes. I question the need for a comment though, seems pretty
> evident from the compatible what it is.

I was thinking people may not know that 'sc' is the Shared Cache. I
probably should have shortend the comment to 'Ascalon Shared Cache'.
Anyways, I can drop it.

Thanks,
Drew

--+0HGToKbj2BaC/Io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaj6jIAAKCRDb7CzD2Six
DDeVAP4vM3GolJCGac4uVQXKOv97J+exeAUD6SDerZ7kBTnOHwEA/LLJW1DYXrzT
s/QHLT4rwkG8YmW8CkD6ac5wfPrwywc=
=TTDz
-----END PGP SIGNATURE-----

--+0HGToKbj2BaC/Io--

