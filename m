Return-Path: <linux-doc+bounces-42646-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F4A8171E
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 22:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C84531BA306E
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 20:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1CC25487E;
	Tue,  8 Apr 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I9cDpkoL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C8254856
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145180; cv=none; b=gIrleEd01ohQO0ZM5w94YpBXd2buL6fSduzTWtYNor6ay5CK9FN1lb80NQD4EGZP1587WRqlhWkhUrCZvirnIimkRrwJ8Of1NXbRiwkxy7vhpd77CKidO/Vj8r96fbNc3NuNJHD5iXcNSkljK490uTCNA8M3BoU78R93uHhM+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145180; c=relaxed/simple;
	bh=93eT2rpamlxVc6aFa/l0LJNv4i5WbwKqNk2fS+xc8CA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lv0eFENEyAfb5luUDW3TSue3sLgrvQu7DIkMRFkae+rty9Mg+IMk1yASBHLBl2brRi/srC0j5C0jB8XZyPqfGrw9XBtgaw41kjSZ+av7YPzLgs0tHBFaZe5P5QgBFrzhnOWtKdKuB3El+HWU40TIgjrYuRC1PehNPrPKLFTUrRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I9cDpkoL; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744145170; x=1744404370;
	bh=YYLiZ0LCn/fJYeBcV4Bc2RbLDA4OTOnCGSvl/4wo+9M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=I9cDpkoLAszJNlLR0vodgu/FnX+lm+1HD0KgITHUevObv1p1/UIDHDe2L7YsEAAtR
	 XKSmcGkUI5btNWBZn1LdAWzdzsay3ERVFSIXsxWxomonds/9+QdXKuEBXoZ+dNiXcN
	 EqyNxNz9gGR/lKx1I+EXeSh3sjCTb1mEIDP5G5E7bi77wkhdhxMR83RCeqJJw8jet4
	 WzBtAkzjcDWjwC88UlWWierMgKyEsal/jMKcVGJzLqkR/ktaxrM8p9rzkWLTLf/mlf
	 IG5rQL+MxGvRU+6ZuXC4nrQnVpNO+kULIbi1itf/fz9xUKi53m5/VPVQCBATDDWtpw
	 5rcSfz3X9qrSg==
Date: Tue, 08 Apr 2025 20:46:05 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: dmkhn@proton.me
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Use 'mmio32' for consistency
Message-ID: <Z/WLCdZlg4sebQ6i@kraken>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 43a1fb498a3fc80da4fbec0bfdaa7fba09367345
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 08:22:14PM +0300, Andy Shevchenko wrote:
> First of all, using 'mmio' prevents proper implementation of 8-bit access=
ors.
> Second, it's simply inconsistent with uart8250 set of options. Rename it =
to
> 'mmio32'. While at it, remove rather misleading comment in the documentat=
ion.
> >From now on mmio32 is self-explanatory and pciserial supports not only 3=
2-bit
> MMIO accessors.
>=20
> Fixes: 3181424aeac2 ("x86/early_printk: Add support for MMIO-based UARTs"=
)
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +----
>  arch/x86/kernel/early_printk.c                  | 6 +++---
>  2 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 76e538c77e31..d9fd26b95b34 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1407,18 +1407,15 @@
>  =09=09=09earlyprintk=3Dserial[,0x...[,baudrate]]
>  =09=09=09earlyprintk=3DttySn[,baudrate]
>  =09=09=09earlyprintk=3Ddbgp[debugController#]
> +=09=09=09earlyprintk=3Dmmio32,membase[,{nocfg|baudrate}]
>  =09=09=09earlyprintk=3Dpciserial[,force],bus:device.function[,{nocfg|bau=
drate}]
>  =09=09=09earlyprintk=3Dxdbc[xhciController#]
>  =09=09=09earlyprintk=3Dbios
> -=09=09=09earlyprintk=3Dmmio,membase[,{nocfg|baudrate}]
> =20
>  =09=09=09earlyprintk is useful when the kernel crashes before
>  =09=09=09the normal console is initialized. It is not enabled by
>  =09=09=09default because it has some cosmetic problems.
> =20
> -=09=09=09Only 32-bit memory addresses are supported for "mmio"
> -=09=09=09and "pciserial" devices.
> -
>  =09=09=09Use "nocfg" to skip UART configuration, assume
>  =09=09=09BIOS/firmware has configured UART correctly.
> =20
> diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_print=
k.c
> index b70e6e99fb17..dc053641698c 100644
> --- a/arch/x86/kernel/early_printk.c
> +++ b/arch/x86/kernel/early_printk.c
> @@ -424,10 +424,10 @@ static int __init setup_early_printk(char *buf)
>  =09keep =3D (strstr(buf, "keep") !=3D NULL);
> =20
>  =09while (*buf !=3D '\0') {
> -=09=09if (!strncmp(buf, "mmio", 4)) {
> -=09=09=09early_mmio_serial_init(buf + 4);
> +=09=09if (!strncmp(buf, "mmio32", 6)) {
> +=09=09=09buf +=3D 6;
> +=09=09=09early_mmio_serial_init(buf);
>  =09=09=09early_console_register(&early_serial_console, keep);
> -=09=09=09buf +=3D 4;
>  =09=09}
>  =09=09if (!strncmp(buf, "serial", 6)) {
>  =09=09=09buf +=3D 6;
> --=20
> 2.47.2
>=20


