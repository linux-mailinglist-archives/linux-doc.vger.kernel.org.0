Return-Path: <linux-doc+bounces-93570-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6CdlMB9VPWrz1QgAu9opvQ
	(envelope-from <linux-doc+bounces-93570-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:19:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBE6C7691
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GtWTdtpB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93570-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93570-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBBDA3004DC2
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 16:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B2B3DB964;
	Thu, 25 Jun 2026 16:19:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1E35BDA4;
	Thu, 25 Jun 2026 16:19:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404379; cv=none; b=CNUMgTsJMp82y2L1ouUhUcWujLJzbYhfg/oNn86hk6TKHknyW952PPp0tjUK3lbiI+AW5wWcxU7pnHdRY8G36ew9zOz8CgmidEpSpAuKr6xTLMxkWEjUtB96bTbPHOWuBT4rWcYJNH1EOdHVlPc3/XaT+7wpfWLMB9ZWtrzqf6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404379; c=relaxed/simple;
	bh=qG1LzwDqL57cV5rkC2sruMzkCxUQSr9mlL1EhPq5ZRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHvDI7njengArvdy0rCqKd3QLwE17Hn6uwOjzBOXVentZ2C1E0kmVKaWJQTRl0EFTyPD9fcKXxwrhW8PZPaLENJ8BU9uPulhemCU1botLkKSesVPYbzLWA5A5/kiOdxSce3UyD41fLauubuFE+spJhH1ODeZH6/wddkJyDHxUjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtWTdtpB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC171F000E9;
	Thu, 25 Jun 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404377;
	bh=7YcMVVY3Ngo1QA2QA4VNeE39obuNmOZ0bZLp0deFa4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtWTdtpBtJaqqhntdx94UBquSGkQICKW/35LtX6FCenrEFQOyrhP84qGQESOlDQMt
	 Z9LIvY5aXOX6SoaXq+xSAzSJD5sFsuPQEa1y6fVPdQJSFUMo7/orxM5U2/YWwXt6M9
	 CpCNjZIw8p27gyJJtmV+DODPhEK+LlamOOUcQIT5Xtp4bjswlX3r7gYwJAnmM9ud/B
	 4zUYWLNSXP2DM4cGiVm89nf7zweBbJS1rksQ1qj9fTKrAKhZ0SUb/3yUqGQKeQPrle
	 tiMGmj9jRNQbb7eqYg+G/2mRp2ndZM6+jqbLXLHxlRvW3NweSnGfDA1sJZDs+YnhYq
	 syY9nXn1Ozf9A==
Date: Thu, 25 Jun 2026 17:19:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
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
Message-ID: <20260625-cupbearer-failing-9ce0abf97b93@spud>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqz6WzvFJ9B9C8aq"
Content-Disposition: inline
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:fustini@kernel.org,m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghua.yu@intel.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger
 .kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93570-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,intel.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,sifive.com,linutronix.de,bytedance.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bytedance.com:email,vger.kernel.org:from_smtp,infradead.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url,spud:mid,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EFBE6C7691


--iqz6WzvFJ9B9C8aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> Document the generic compatibles for capacity and bandwidth controllers
> that implement the RISC-V CBQRI specification. The binding also
> describes the common riscv,cbqri-rcid and riscv,cbqri-mcid properties,
> and the optional riscv,cbqri-cache phandle that links a capacity
> controller to the cache whose capacity it allocates.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 98 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/D=
ocumentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5d6be645381780e187b39e60c=
3bb487fdf2cfb69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) cont=
roller
> +
> +description: |
> +  The RISC-V CBQRI specification defines capacity-controller and
> +  bandwidth-controller register blocks that allocate cache capacity and =
memory
> +  bandwidth to resource-control IDs (RCIDs) and monitor usage per
> +  monitoring-counter ID (MCID):
> +  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
> +
> +  Allocation and monitoring share one register block, and a controller m=
ay
> +  implement either or both. A driver discovers which at runtime from the
> +  capabilities register, so the compatible names only the controller typ=
e. It
> +  does not distinguish allocation-only, monitoring-only or combined
> +  controllers, and no property declares monitoring support.
> +
> +maintainers:
> +  - Drew Fustini <fustini@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - description: Tenstorrent Ascalon Shared Cache
> +            const: tenstorrent,ascalon-sc-cbqri
> +          - const: riscv,cbqri-capacity-controller
> +      - enum:
> +          - riscv,cbqri-capacity-controller
> +          - riscv,cbqri-bandwidth-controller

Please modify this, as has been done for other riscv spec related
bindings, to let people get away without using device-specific
compatibles.

In this case, you can just delete the first entry from this enum, since
it already has a user and only have to implement this feedback for the
second entry.

pw-bot: changes-requested

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The CBQRI controller register block.
> +
> +  riscv,cbqri-rcid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum number of RCIDs the controller supports. RCIDs are the
> +      resource-control IDs that allocation operations target.
> +
> +  riscv,cbqri-mcid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum number of MCIDs the controller supports. MCIDs are the
> +      monitoring-counter IDs that usage-monitoring operations target. Pr=
esent
> +      on controllers that implement monitoring.
> +
> +  riscv,cbqri-cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the cache node whose capacity this controller allocates.
> +      Applies to capacity controllers that back a CPU cache. The cache l=
evel
> +      and the harts sharing it are taken from that node's cache topology.

Architecturally, is it impossible for a capacity controller to control
more than one cache?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: tenstorrent,ascalon-sc-cbqri
> +    then:
> +      required:
> +        - riscv,cbqri-rcid
> +        - riscv,cbqri-cache
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    l2_cache: l2-cache {
> +        compatible =3D "cache";
> +        cache-level =3D <2>;
> +        cache-unified;
> +        cache-size =3D <0xc00000>;
> +        cache-sets =3D <512>;
> +        cache-block-size =3D <64>;
> +    };
> +
> +    cache-controller@a21a00c0 {
> +        compatible =3D "tenstorrent,ascalon-sc-cbqri",
> +                     "riscv,cbqri-capacity-controller";

Is this or is this not a cache controller?
The compatible and fact that the property points to an actual cache
controller suggests that this is not.

Cheers,
Conor.

> +        reg =3D <0xa21a00c0 0xf40>;
> +        riscv,cbqri-rcid =3D <16>;
> +        riscv,cbqri-cache =3D <&l2_cache>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1092165046c773771b055869030bc1bdb64b16..64a95a4d795a57033d3f36200=
d98cfb4a013ab94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23298,6 +23298,7 @@ M:	Drew Fustini <fustini@kernel.org>
>  R:	yunhui cui <cuiyunhui@bytedance.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
>  F:	arch/riscv/include/asm/qos.h
>  F:	arch/riscv/include/asm/resctrl.h
>  F:	arch/riscv/kernel/qos.c
>=20
> --=20
> 2.34.1
>=20

--iqz6WzvFJ9B9C8aq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1VEAAKCRB4tDGHoIJi
0lXeAP4nYfY2HRKImG27gD+aSFjrJ2tV6sAdxhmJWyh1+AnCrAEAk6PNQ5SjX5nW
VK2mq7VQ+4K/2o7w6hvbd2oKNvn30ww=
=ZHZW
-----END PGP SIGNATURE-----

--iqz6WzvFJ9B9C8aq--

