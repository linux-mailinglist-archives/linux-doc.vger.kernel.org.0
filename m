Return-Path: <linux-doc+bounces-90968-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Acw8NOusIWo3LAEAu9opvQ
	(envelope-from <linux-doc+bounces-90968-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 18:50:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019C6420C3
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 18:50:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ViiY4wno;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90968-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90968-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48BAB3030D31
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 16:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1747F2FC;
	Thu,  4 Jun 2026 16:22:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512823A1685;
	Thu,  4 Jun 2026 16:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590143; cv=none; b=QXTM6M1GWECG4+pyjP0bNomNkTAm1jwawuILG7FwXujRwECtHnOINbB+W7cfjAWNfijVI/oehcuPH3v6CrCEKBEyjZzV3rjw/SUWJc7ZwiqVUVTP1g6wD9cK9Lm45+OSciSus5B02ZYR+vFhZzxchSQeIYGR/IB5JX3NjROc+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590143; c=relaxed/simple;
	bh=EM0GjrZmjZJQaV6YfgCRKUhaeG2vOJDRoynfSuzHitw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANfLplL89o/UfI42utKQIkKSCtbn4y220iuMDsc51QOLQWTBxlxiiZabaxAayxg1E8nRh8Btln+gMJ3OtLm5qxFZ+iKIbSL1g7/bBeclowoAcSRYbFRjk7WSe+Hcj3i16zx+lXYdPvf0I1y1yetUWoA2Jn7Fne8VvMuvq7auCak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViiY4wno; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914261F00893;
	Thu,  4 Jun 2026 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590141;
	bh=F2TSuSy2fzh9HuIAd56pwrl0AaEkrI23dzAjyDp0t9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ViiY4wnouQ9k6t1sxmqMVFMCul6eUzunF8oKW0rsiW/ZTfAivON+rEvptHkvOW4uD
	 TlktGmGVUAJjYF39NnCL2WFkTS4og2KJPMJS46w1Nn/p3Rmk3ob3AGoWKt33Mflioc
	 TAYaFyB47q7z3p2KtWMb2N8/6Hn0dRH7HxtmBeEIS59BUIyqgMs/vfVgiKCNlCxsWt
	 aBks9x6b8hSHQsdh5d+ducLM5LillQ6kxM0VlrNv3y3VQliF3d1z3Vc+W0Qex2r5G1
	 geh5DRYhVLNpRPu21Gs0PcWAEcIAha7agUbWKXVI88AyRMpgdCsoZkTXCdbrUgfEfQ
	 RQNWbN7VfJ+Kw==
Date: Thu, 4 Jun 2026 17:22:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <20260604-decency-salaried-4cb69e1c9fa9@spud>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
 <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
 <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
 <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5cyPpCm7a4usSWqT"
Content-Disposition: inline
In-Reply-To: <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90968-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.jones@oss.qualcomm.com,m:guodong@riscstar.com,m:corbet@lwn.net,m:pjw@kernel.org,m:palmer@dabbelt.com,m:conor.dooley@microchip.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:shuah@kernel.org,m:anup@brainfault.org,m:atish.patra@linux.dev,m:skhan@linuxfoundation.org,m:debug@rivosinc.com,m:zong.li@sifive.com,m:brauner@kernel.org,m:charlie@rivosinc.com,m:samuel.holland@sifive.com,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:docularxu@outlook.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[riscstar.com,lwn.net,kernel.org,dabbelt.com,microchip.com,eecs.berkeley.edu,ghiti.fr,brainfault.org,linux.dev,linuxfoundation.org,rivosinc.com,sifive.com,vger.kernel.org,lists.infradead.org,outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spud:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5019C6420C3


--5cyPpCm7a4usSWqT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 10:29:19AM -0500, Andrew Jones wrote:
> On Sat, May 30, 2026 at 08:42:29AM +0800, Guodong Xu wrote:
> > On Thu, May 28, 2026 at 12:35=E2=80=AFAM Andrew Jones
> > > Sashiko points out a few things about this patch which I think I
> > > agree with
> > >
> > > https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5=
a544f1dc%40riscstar.com?part=3D8
> >=20
> > Quote the following from Sashiko.dev:
> > > Should this mask specify the individual subset extensions required by=
 the
> > > profile instead of the superset extensions like RISCV_ISA_EXT_B,
> > > RISCV_ISA_EXT_C, and RISCV_ISA_EXT_V?
> >=20
> > My preference is to leave the mask on B/C/V (and A) as-is. I'd prefer to
> > keep matching on the single-letter, rather than expanding them. Here is=
 why:
> >=20
> > - The RVA23 profile lists A, B, C and V as single-letter mandatory
> >   extensions; it doesn't enumerate Zaamo/Zalrsc, Zba/Zbb/Zbs, Zc* or the
> >   Zve*/Zvl* subsets in the mandatory set.
> >=20
> > - In current merged code, hwprobe_isa_ext0() is already using
> >   riscv_isa_extension_available() signle letter checking for C and V.
> >=20
> > PS:
> > B maybe a special one, just in case anybody raise it. As the community
> > discussed when I adding it into the bindings, because B comes later than
> > its sub-components zba/zbb/zbs, so, when I added B, I cleaned up all
> > in-tree dts files which declared zba/zbb/zbs but not B and made them de=
clare
> > both.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20260115-adding-b-dtsi-v2-0-2=
54dd61cf947@riscstar.com/
> > [1]
> >=20
> > Also, in the bindings: extensions.yaml, a schema rule is added which re=
quires
> > a node listing zba, zbb and zbs to also list b (and the reverse). Movin=
g on,
> > new dtsi/dts fils, a node with only the subsets fails dtbs_check.
> >=20
> > One may argue that the schema check doesn't cover ACPI path. But again,
> > shouldn't the vendor who publishs RVA23 hardware be conformant to the
> > extensions wording in RVA23 v1.0 spec?
> >=20
> > What do you think?
> >
>=20
> I certainly see a case for the kernel staying out of the extension
> dependency validation game. I think it makes sense for an ISA string
> validation tool to exist for vendors to do sanity checks on their
> ISA strings, but that's not the kernel's role. OTOH, whether or not
> the kernel wants to try and detect inconsistencies with the ISA
> string in order to build confidence in using what it sees there
> and publishing what it sees there to usermode, through hwprobe, might
> still be worth debating.

On the dt front, our policy is that it is not the kernel's job to
check that the dt matches the hardware. It is the firmware's job to
accurately report what the hardware is. There's definitely some
exceptions to that already (*cough thead vector cough*) but that's in
part because we failed to come up with concrete descriptions in the
first place.

Yesterday I commented on a patch that was adding this kind of thing:
| The point of validate callbacks is twofold: checking that the kernel
| configuration supports the extension and that extensions that the kernel
| depends on to support the one in question are present.

The latter is because you could depend on an extension that is affected
by the former.
Looking at the list of validate callbacks, I think there are some that
actually don't follow this policy (I saw riscv_ext_zca_depends() that
has no real purpose, but didn't look much further).
I'm not even sure that the validate callback added in this series for
zic64b should be added, it's borderline for me. I'm only really not
objecting to it because it outputs a warning if someone has the
retroactively added extension without the relevant dt/acpi properties
and expects things to work.

> Without CPUID / ID_* registers for Linux to be able to check an
> authoritative source of truth about what is and isn't supported by
> the CPU, riscv Linux has to decide to either blindly trust the
> hardware description or do sanity checks / probes in order to
> confirm what it sees there. Maybe we can assume that any extension
> used by the kernel will trip over itself quickly, alerting vendors
> to fix their ISA strings, but I'm not sure we can make that assumption
> for usermode extensions that Linux doesn't use, but does expose
> through hwprobe. What apps need to run in testing to exercise them?
> How long will those apps need to run before they trip over something?
>=20
> The more I think I about it, the more I think the lack of CPUID / ID_*
> registers puts Linux in a tight spot. If Linux trustingly publishes
> what firmware tells it to to userspace and userspace blows up, Linux
> will have to share some of the blame for having misled it. So, should
> Linux validate everything it publishes somehow? Or, should it at least
> do relatively cheap sanity checks on everything it publishes in order
> to build some confidence?

Part of me wants to know why we should be going to a bunch of effort to
cover up for inaccurate devicetrees etc. Garbage in -> garbage out and let
them keep the pieces.
That said, if we were to do something with checks, we can't actually
even check everything and my opinion is that either we certify that
everything is VerifiedTM or we don't certify at all.

Cheers,
Conor.

--5cyPpCm7a4usSWqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGmNwAKCRB4tDGHoIJi
0hptAP4n8/eEpWp31Uijt9FDzlcZE1va/I9dJJ5pHP5ldvSQNgD/aPo4Nice+Y6x
WG57+HLwQioheX4qt2I60jJ46gTx7wE=
=5ZRN
-----END PGP SIGNATURE-----

--5cyPpCm7a4usSWqT--

