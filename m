Return-Path: <linux-doc+bounces-93621-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cm1fOe9/PWr13ggAu9opvQ
	(envelope-from <linux-doc+bounces-93621-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 21:22:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84F6C8596
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 21:22:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SvRe8m86;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93621-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93621-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1248A3004607
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 19:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC431F98E;
	Thu, 25 Jun 2026 19:21:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32D28C5CB;
	Thu, 25 Jun 2026 19:21:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782415315; cv=none; b=aShHOa4UHyocyqWm3JIWnP8mf2HRM/M+JsRRaqS0iH75Zxao0M2+723clwOSJvMwqDzS3kruGF/fWgpFfvqDBHxnglm9gSPezKVSEIg8ao3rRme0x6gcMV08tUxwjXqePgCCV8GEAckI0ww7GDlO+TxgmDXDmqZpVMfAzDhEX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782415315; c=relaxed/simple;
	bh=46jKitwX7kbIwKrfsLYmm0kjbQWe0x+xSMh16IzTMBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2kZT4Cw7JjvT57TR+h3j0q+jsf5e8gfiUSA4sH3hQiCD/NvIGq1l8Av6JOuxJLZf7+GrDevne8UW7lxcsDghTZxMons47U5hus2mpRPWWFUaRmXrB8wF3inQm7gVFAGbDSmVClGXYLmCn0yZTmfj+XhKt62tM8ip5h1PJfbU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvRe8m86; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CDF1F00A3A;
	Thu, 25 Jun 2026 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782415314;
	bh=lV3CoJyooD6jU7hICvd3lIpUOrVSMEvR/t4ecu6q5rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SvRe8m86TNm1UW3zNJsZrT0BzJSY0+8f0DSj0iVoSoA0jhdiavqtMJHQ8Dki+KsTI
	 WrHv6iCEUmvtYbffOBUriWLgSmI7Kpf+UWdOSrwAjWiA2g+DdwyvPIdUDUu4/X9ryk
	 JoJvt7mSZj4cY7d4//iqVOH8IyK/z6hJzgQVWgkpc0xL4541j148qswU82AC8LFUev
	 qGF8Z3U5vStorIgm1wwd0KxK+qAfpdnwxX+DFe6HwucahLHGkunI2CC1YKnZS31LfP
	 eLxhOCJ4CBDw3UmY4g8no6iBsXmvsK9pwnKKMEERHBIKhtzOyWgzWybW7i7byo8JmD
	 Li3NtXZpWJeGg==
Date: Thu, 25 Jun 2026 12:21:52 -0700
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
Message-ID: <aj1_0AnIBk8_xoDd@gen8>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
 <20260625-cupbearer-failing-9ce0abf97b93@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b+lAH89uI5sNQSH1"
Content-Disposition: inline
In-Reply-To: <20260625-cupbearer-failing-9ce0abf97b93@spud>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-93621-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gen8:mid,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C84F6C8596


--b+lAH89uI5sNQSH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 05:19:28PM +0100, Conor Dooley wrote:
> On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> > Document the generic compatibles for capacity and bandwidth controllers
> > that implement the RISC-V CBQRI specification. The binding also
> > describes the common riscv,cbqri-rcid and riscv,cbqri-mcid properties,
> > and the optional riscv,cbqri-cache phandle that links a capacity
> > controller to the cache whose capacity it allocates.
> >=20
> > Assisted-by: Claude:claude-opus-4-8
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 98 insertions(+)

Thanks for the review.

[..]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - description: Tenstorrent Ascalon Shared Cache
> > +            const: tenstorrent,ascalon-sc-cbqri
> > +          - const: riscv,cbqri-capacity-controller
> > +      - enum:
> > +          - riscv,cbqri-capacity-controller
> > +          - riscv,cbqri-bandwidth-controller
>=20
> Please modify this, as has been done for other riscv spec related
> bindings, to let people get away without using device-specific
> compatibles.
>=20
> In this case, you can just delete the first entry from this enum, since
> it already has a user and only have to implement this feedback for the
> second entry.

Would this work?

properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - tenstorrent,ascalon-sc-cbqri # Tenstorrent Ascalon Shared C=
ache
          - const: riscv,cbqri-capacity-controller
      - items:
          - {}
          - const: riscv,cbqri-bandwidth-controller

> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The CBQRI controller register block.
> > +
> > +  riscv,cbqri-rcid:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The maximum number of RCIDs the controller supports. RCIDs are t=
he
> > +      resource-control IDs that allocation operations target.
> > +
> > +  riscv,cbqri-mcid:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The maximum number of MCIDs the controller supports. MCIDs are t=
he
> > +      monitoring-counter IDs that usage-monitoring operations target. =
Present
> > +      on controllers that implement monitoring.
> > +
> > +  riscv,cbqri-cache:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the cache node whose capacity this controller allocat=
es.
> > +      Applies to capacity controllers that back a CPU cache. The cache=
 level
> > +      and the harts sharing it are taken from that node's cache topolo=
gy.
>=20
> Architecturally, is it impossible for a capacity controller to control
> more than one cache?

Yes, there is only ever a single logical capacity resource per capacity
controller. When that resource is a cache, the controller handles that
one logical cache. The hardware may implement the cache as a collection
of slices, but that stays opaque to CBQRI. So riscv,cbqri-cache stays a
single phandle.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: tenstorrent,ascalon-sc-cbqri
> > +    then:
> > +      required:
> > +        - riscv,cbqri-rcid
> > +        - riscv,cbqri-cache
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    l2_cache: l2-cache {
> > +        compatible =3D "cache";
> > +        cache-level =3D <2>;
> > +        cache-unified;
> > +        cache-size =3D <0xc00000>;
> > +        cache-sets =3D <512>;
> > +        cache-block-size =3D <64>;
> > +    };
> > +
> > +    cache-controller@a21a00c0 {
> > +        compatible =3D "tenstorrent,ascalon-sc-cbqri",
> > +                     "riscv,cbqri-capacity-controller";
>=20
> Is this or is this not a cache controller?
> The compatible and fact that the property points to an actual cache
> controller suggests that this is not.

Good point. This nodes represents just the QoS interface (CBQRI) and
should not use that node name. 'qos-controller' seems like it would be
more appropriate but that has no precedent. What do you think?

Thanks,
Drew

--b+lAH89uI5sNQSH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaj1/ywAKCRDb7CzD2Six
DGfiAP4poOUqbF5mOaPx0hiXS8d1zsio2uUZW1liV4pjTYG1swDxAeAvM8g3fhtc
FhNvDW6cSShT0vrZvj6Q4u+HrDXNBw==
=Dw9v
-----END PGP SIGNATURE-----

--b+lAH89uI5sNQSH1--

