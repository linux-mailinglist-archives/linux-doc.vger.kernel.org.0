Return-Path: <linux-doc+bounces-94488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxe4NC58RWrIAwsAu9opvQ
	(envelope-from <linux-doc+bounces-94488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 22:44:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC06F18E4
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 22:44:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RJRDi4cw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94488-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94488-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B166F3060C81
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 20:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70432394EB7;
	Wed,  1 Jul 2026 20:39:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B13955C6;
	Wed,  1 Jul 2026 20:39:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938368; cv=none; b=tV7tA25ICIMdrnllipmZwgBnSV/7582EdqoJqaHO96Cxv0sWHRsiQwWIjChNL1QQPhdRhQF5YIxKiE8lcw3/GMmQpcRoGPfJZbtJHkudrdOd+2VYW/ZzqcUEo0b83fHrvKJKYzmFjZRpac8ojG9+GP+QFYj917NIVioH5hrJgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938368; c=relaxed/simple;
	bh=K2JyJxCXLtM1eTdlopzD3fjkU2xPZMINicFo0HL5CgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/uI6peXbqzGKkuQSoY47bCoVaoUXvQ2QpGjsI8+6/YjevlMklLHzRFp9gjRRQHwag6cD/j7dCW7WoLHRKnz4tikoMwbCB3A6lz809c3V7nBlzWMqfzONIHhKPXaZ/qKkFNkE8Cz4nQ+uVXl5d0sTLojADZMYjj1CtrCf4hIiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJRDi4cw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC711F000E9;
	Wed,  1 Jul 2026 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782938367;
	bh=f6QVBJJnOqTAmv9bGgn42fUJj2cY0FZxJ1ME1xdC+T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJRDi4cwA05SdSW+713uFlPiyHLZCwR49gpm/dBeCn1+LQodBzos5L0rNrOeB3byQ
	 WYhZPYks9Se42SWieNvBWgUMjEsqBcwWOs4xOFFLRMbHi6ddQDqKg30NUNu0SRnybo
	 Dxb53nC6CoI0/DRmyz5F3NPVghBQyDdplb73P47xUpH/v/YS8//CW0poBUhA6iC8QZ
	 umZIFhJEUn1UA3tMpqYUH5xGl95l2jJ2JSaktuQKz/5/5/JCb3OwudfJXCtAean9jS
	 MjQR6siiOHHeuqOsor+6mVOYZFjNM2kgMm41a5faaSghy28LcMtS8/BW+wK19MQomK
	 Bdzqn1x2pljIA==
Date: Wed, 1 Jul 2026 21:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jesse Taube <jtaubepe@redhat.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Message-ID: <20260701-squiggle-aging-459cd99cb2dc@spud>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dKXZ0SKTAmT4FGH2"
Content-Disposition: inline
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94488-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:docular.xu@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:chen.wang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:jtaubepe@redhat.com,m:thecharlesjenkins@gmail.com,m:andrew.jones@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:conor.dooley@microchip.com,m:docularxu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com,vger.kernel.org,lists.infradead.org,redhat.com,oss.qualcomm.com,lists.linux.dev,microchip.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CAC06F18E4

--dKXZ0SKTAmT4FGH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 08:52:21AM -0400, Guodong Xu wrote:
> Zicbom, Zicbop, and Zicboz have no default cache block size, so a
> devicetree that declares one must also provide the matching
> riscv,cbom/cbop/cboz-block-size property. Make it required so a
> missing block-size property can be caught by dtbs_check.
>=20
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v5: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..f4dd34d446c02 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -1142,6 +1142,32 @@ allOf:
>            not:
>              contains:
>                const: zilsd
> +  # All three Zicbo* extensions require their block size property as the=
re's no
> +  # default.
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicbom

I think the way to fix this is to add
  required:
    - riscv,isa-extensions
to each of these if conditions
(not got time to test it right now, sorry)

> +    then:
> +      required:
> +        - riscv,cbom-block-size
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicbop
> +    then:
> +      required:
> +        - riscv,cbop-block-size
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicboz
> +    then:
> +      required:
> +        - riscv,cboz-block-size
> =20
>  additionalProperties: true
>  ...
>=20
> --=20
> 2.43.0
>=20

--dKXZ0SKTAmT4FGH2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakV69wAKCRB4tDGHoIJi
0qZuAPsE7PpkS7Q9Q/QdOXMXVi0vMgDYbeEgMRtzf0lMlv6w6gEA1JDV5vGVvkwY
e3dZ2Ec1Eq1CjjFHEnDtDfSSbocyhQw=
=AQmB
-----END PGP SIGNATURE-----

--dKXZ0SKTAmT4FGH2--

