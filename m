Return-Path: <linux-doc+bounces-26592-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C392099171E
	for <lists+linux-doc@lfdr.de>; Sat,  5 Oct 2024 16:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65EEA1F22131
	for <lists+linux-doc@lfdr.de>; Sat,  5 Oct 2024 14:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E885E156237;
	Sat,  5 Oct 2024 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuIsvClV"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AA155C96;
	Sat,  5 Oct 2024 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136932; cv=none; b=T32bsNW5V0zeZS4FJV/grAzBDhx9tVzbfqcqWbcQQIvlMr5JPSvZ2Ud9WMi0C8hhAIqFp1f1dYu93BAvHsILvapSgD5WcuMAXWwRsL2EXTfySyF+ATHRPI/PAk+XTp6Dbj1CW/VrgD0ZNvRdQhUbPZ7GyfO4aVR28tMLFT39eCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136932; c=relaxed/simple;
	bh=5VikhLow5tX+OhRXx9cV5qsiUujBLh2clzakxZt/A0o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaoJORk3V4fdK1FbUjVpb8GWmTwY5v0ufwZqRbIcp5r2iT/YL1ILAirRDTzLiOD1dMs9dXlJ+RNmF5z/s+fOpVy72GM18A/nLrCVLlDgvT/vtoyb7hDIYsElUH0XVnrlQwYchiRr3ROYvlj2g5/Csw+sEK+T5OU4j7/H7/HVP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuIsvClV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC43C4CEC2;
	Sat,  5 Oct 2024 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728136932;
	bh=5VikhLow5tX+OhRXx9cV5qsiUujBLh2clzakxZt/A0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iuIsvClVQzM4cST6dTjTiJRfb8Hl1g4+F5BFB/67Uy2g1BlP3Xmu6PagQzIk29AGx
	 d7/gK8UFENqBPF3/QeP5XgxKpLpZsOBrU8qpJtl98J4E+KiLPmw+Ufg9gWmezjgMVH
	 sladHwwu/9Gey4yfEq9c1ZgSBX7BVz8A1P5kDwjVKe/QEAxb/kUNRXnwQ65ocbEm7J
	 BS8eeZ0G2zAaXfY1MAEF8Lmglm+4GGbaXZbzCqBlqPVr/vtH9tBockTa1yts2YOn45
	 0v/IKFLXug7Xuv8B4k5d0Rjfvj3rnfkqzyf4GzoZd+Iu5JRwkp/vwhiOWIf5V8YLj/
	 TG6oL2wZASxMA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sx5MI-000c40-2c;
	Sat, 05 Oct 2024 15:02:10 +0100
Date: Sat, 05 Oct 2024 15:02:09 +0100
Message-ID: <87ed4uveam.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 3/5] KVM: arm64: Manage GCS access and registers for guests
In-Reply-To: <ZwFDmaeIgPKfmJnj@finisterre.sirena.org.uk>
References: <20241005-arm64-gcs-v14-0-59060cd6092b@kernel.org>
	<20241005-arm64-gcs-v14-3-59060cd6092b@kernel.org>
	<87iku6vl4z.wl-maz@kernel.org>
	<ZwE6V9cqf7jD1rTc@finisterre.sirena.org.uk>
	<87frpavgam.wl-maz@kernel.org>
	<ZwFDmaeIgPKfmJnj@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: broonie@kernel.org, catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Sat, 05 Oct 2024 14:48:09 +0100,
Mark Brown <broonie@kernel.org> wrote:
>=20
> [1  <text/plain; us-ascii (7bit)>]
> On Sat, Oct 05, 2024 at 02:18:57PM +0100, Marc Zyngier wrote:
> > Mark Brown <broonie@kernel.org> wrote:
> > > On Sat, Oct 05, 2024 at 12:34:20PM +0100, Marc Zyngier wrote:
>=20
> > > > Where is the handling of traps resulting of HFGITR_EL2.nGCSSTR_EL1?
>=20
> > > These will trap with an EC of 0x2d which isn't known so I was expecti=
ng
> > > this to get handled in the same way as for example a return of false
> > > from kvm_hyp_handle_fpsimd() for SVE when unsupported, or for the
> > > simiarly unknown SME EC, currently.  I gather from your comment that
> > > you're instead expecting to see an explicit exit handler for this EC
> > > that just injects the UNDEF directly?
>=20
> > Not just inject an UNDEF directly, but also track whether this needs
> > to be forwarded when the guest's HFGITR_EL2.nGCSSTR_EL1 is 0 while not
> > being not RES0. Basically following what the pseudocode describes.
>=20
> Ah, I see.  I'd been under the impression that the generic machinery was
> supposed to handle this already using the descriptions in
> emulate-nested.c and we only needed handlers for more specific actions.

=46rom that very file:

/*
 * Map encoding to trap bits for exception reported with EC=3D0x18.
 [...]
 */

Everything else needs special handling.

	M.

--=20
Without deviation from the norm, progress is not possible.

