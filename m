Return-Path: <linux-doc+bounces-12575-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F28870F9
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 17:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D30AA1F23192
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 16:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B290759163;
	Fri, 22 Mar 2024 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/dIqAA4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B5495F0;
	Fri, 22 Mar 2024 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711125442; cv=none; b=IvQCh3OmPi7O/oH9DmYy+jSHJ/hXYUgyYzSwGogzLb/jqFIcxn30tZlC1ucc/ENs9l7OmhzXWBZojuS6k8Odg24ZqGBa/F1zKMrrom9a/QnhNFdAfluyXgG8Wi3zE3WzB9Bno/I+AbamEvxLKM3pWjvw35AHpEtV08plFeyNsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711125442; c=relaxed/simple;
	bh=MPyggTqbjRfhmGAJnk7DnBuPyukjpa3BsNwr0MJ+U0U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWwbBUdR+gEAT5edJZDr4xlfq2Pf9mzn7WqZVaXNen7UhwnVABg4mCRwKxW5C8Sd1OyDssb87aSlUoO3rG7fNgbJP61chlfUc4eGD+TXcAj/BaMq/jeywH96lQVcUW9U9wAfsBYR2S1ztg0u+OD122A00rC9hlLWk+t27xwpdQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/dIqAA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464ECC433F1;
	Fri, 22 Mar 2024 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711125442;
	bh=MPyggTqbjRfhmGAJnk7DnBuPyukjpa3BsNwr0MJ+U0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r/dIqAA4rcmzwmRhbZOpOa6goIFXJ46VPUVHTLUWedUEJ/FIBpGm57i0KmWcYYlqA
	 O2MnCVt/JtoeTS+24GBQAPgaR1kuWX7CPYBNRWkCHU/FgFwXki13YdQgYpK22yU5dM
	 zc4f2u5788JPm7UHXKjONZqMu5g0GTkj58uxv7W8838FMtDiRO28Okh2y9srrBxcJE
	 w5DOBXwtwmVYK3m+GHk3UMYP4ZMFp8ToU1txdn5LnqPuSjTZlWbfsma+8eZWvpTGpI
	 iOTzN1Wkiy0KrEMsPkPqdOUoxscIlOuo+A6XqVA2NRv8ff+H+43NGRUwFnb17Y9lan
	 dvAHUyG7hkjYA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rnhtQ-00EYr0-13;
	Fri, 22 Mar 2024 16:37:20 +0000
Date: Fri, 22 Mar 2024 16:37:19 +0000
Message-ID: <86edc2z0hs.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Paolo Bonzini
 <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton
 <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K
 Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown
 <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Mostafa Saleh
 <smostafa@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v3 5/5] arm64: Use SYSTEM_OFF2 PSCI call to power off for hibernate
In-Reply-To: <9efb39597fa7b36b6c4202ab73fae6610194e45e.camel@infradead.org>
References: <20240319130957.1050637-1-dwmw2@infradead.org>
	<20240319130957.1050637-6-dwmw2@infradead.org>
	<86jzluz24b.wl-maz@kernel.org>
	<9efb39597fa7b36b6c4202ab73fae6610194e45e.camel@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz, smostafa@google.com, jean-philippe@linaro.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-pm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 22 Mar 2024 16:12:44 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
>=20
> On Fri, 2024-03-22 at 16:02 +0000, Marc Zyngier wrote:
> > On Tue, 19 Mar 2024 12:59:06 +0000,
> > David Woodhouse <dwmw2@infradead.org> wrote:
> >=20
> > [...]
> >=20
> > > +static void __init psci_init_system_off2(void)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D psci_features(PSCI=
_FN_NATIVE(1_3, SYSTEM_OFF2));
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D PSCI_RET_NOT_=
SUPPORTED)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0psci_system_off2_supported =3D true;
> >=20
> > It'd be worth considering the (slightly broken) case where SYSTEM_OFF2
> > is supported, but HIBERNATE_OFF is not set in the response, as the
> > spec doesn't say that this bit is mandatory (it seems legal to
> > implement SYSTEM_OFF2 without any hibernate type, making it similar to
> > SYSTEM_OFF).
>=20
> Such is not my understanding. If SYSTEM_OFF2 is supported, then
> HIBERNATE_OFF *is* mandatory.
>=20
> The next update to the spec is turning the PSCI_FEATURES response into
> a *bitmap* of the available features, and I believe it will mandate
> that bit zero is set.

The bitmap is already present in the current Alpha spec:

<quote>
5.16.2 Implementation responsibilities

[...]

Bits[31] Reserved, must be zero.

Bits[30:0] Hibernate types supported.
	- 0x0 - HIBERNATE_OFF

All other values are reserved for future use.
</quote>

and doesn't say (yet) that HIBERNATE_OFF is mandatory. Furthermore,

<quote>
5.11.2 Caller responsibilities

The calling OS uses the PSCI_FEATURES API, with the SYSTEM_OFF2
function ID, to discover whether the function is present:

- If the function is implemented, PSCI_FEATURES returns the hibernate
  types supported.

- If the function is not implemented, PSCI_FEATURES returns
  NOT_SUPPORTED.
</quote>

which doesn't say anything about which hibernate type must be
implemented. Which makes sense, as I expect it to, in the fine ARM
tradition, grow things such as "HIBERNATE_WITH_ROT13_ENCRYPTION" and
even "HIBERNATE_WITH_ERRATA_XYZ", because firmware is where people
dump their crap. And we will need some special handling for these
tasty variants.

> And if for whatever reason that SYSTEM_OFF2/HIBERNATE_OFF call
> *doesn't* work, Linux will end up doing a 'real' poweroff, first
> through EFI and then finally as a last resort with a PSCI SYSTEM_OFF.
> So it would be OK to have false positives in the detection.

I agree that nothing really breaks, but I also hold the view that
broken firmware implementations should be given the finger, specially
given that you have done this work *ahead* of the spec. I would really
like this to fail immediately on these and not even try to suspend.

With that in mind, if doesn't really matter whether HIBERNATE_OFF is
mandatory or not. We really should check for it and pretend it doesn't
exist if the correct flag isn't set.

	M.

--=20
Without deviation from the norm, progress is not possible.

