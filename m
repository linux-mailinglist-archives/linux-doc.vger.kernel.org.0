Return-Path: <linux-doc+bounces-7529-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76083C76B
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 17:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385FF28B5CB
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEBD74E09;
	Thu, 25 Jan 2024 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gw15sIs4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F0633EC
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706198639; cv=none; b=eMQBLOyqQC+ZLwrX7Bhb0ZMfXEai9YnmKQUwLGS2IC3gvIcPLC5t3KDORjVo63WUrn6BFadLNjNF1dxECfrjlVVukgejNDP8zFCXzEcdjLD2JFNc5AlRAs5PloBKMW5Q3pLHlWsS6aINZl/HF4bR6zna0eRlKozKtY+EbTwfaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706198639; c=relaxed/simple;
	bh=sW6rzFbbih98ZLcPpgT7sLre+clXbHFB1iP8PpLpz+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PISun7Wq6VziY52Z1ikoO+l8jSBTgtfoNKUR696sAIcC6ILTx3U1jKfX0nHoFMAf7tJRrwy/rJ9WCREs7+QH4kPxz5q3ZEsI051/mZxQT8/QFgE6VIdZAMfd15Bq77KGazUodWjJzHM95H+COcg/mHuwSomVPKLwp22Ay3xnQrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gw15sIs4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ddd19552e6so441536b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706198636; x=1706803436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrGdhy25Rn2oHABS6aENA0hptRat8XLHKlIr3dlLph0=;
        b=Gw15sIs4wcFbif09jnX7wyeOfvbvVoVXriSTjQoojMEIg6dYp8zReFSUFu4a3UWGyg
         Vt60f0EpzmxGsLVBdJPzEPCdzOgCG8rcNSOAG4PSxViwaxVeQTnsvMtSAKsbBngLvvrc
         3YRNgcWkO3flkwKwDk3owu1vvL4cgbYW6Mlpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706198636; x=1706803436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrGdhy25Rn2oHABS6aENA0hptRat8XLHKlIr3dlLph0=;
        b=gtT27W8ooXDLn0lZTqwkudBcD59yGtGaFBgqgjiVCptHSFN55LJ79VgyraP7uCe0QY
         Qz1GTCzVKxFq6WXvNh//f5GL+YmO0u+jq03gMtCcvAx4UdS4rZ07waZYnvcvPY8tiNbk
         EFKNVuvrnfs2HlxlJd4/KuDU672GyuI21EmN55lPPSH1Bv3vCLES3xSJ/OdIQpqS7FyY
         wLdvJh9oiPWvmTRCKErsl8MO3yGid8xbGn3W26MbYuY/WFwc+aeJkrvvG/YoJ3VxDZTA
         c3kuOwBuk9Tvh4TE6XwmgpEDiutvJB7QQkKl0rv/2HXhHtCAmpdUv6pPKt5x0QLjB+7R
         f9TA==
X-Gm-Message-State: AOJu0YzeDrCWsBHpaN/5F2MP4YN9b0x1FaJR8htkZ7nyDYAh858ax0Cr
	ogzmXmigV5aR6vRW2V9OK5dzsY/Z4mqQtgE0bG2b/qDSgexppJ/ZymiDWwVlaRalSpKC5olEfpi
	LBlaU63J37wsbpsUNA4kkJqXkXjRuoKzr6aKP
X-Google-Smtp-Source: AGHT+IEenS2rfwvLmHoKzdoeA9hwC6DsN4jJq3co/Ozs1wndeC2wqkYhWrAhjXodKyScQl5NYPZQs+lNSO/XkzbhhAg=
X-Received: by 2002:a62:6306:0:b0:6dd:c0a6:4421 with SMTP id
 x6-20020a626306000000b006ddc0a64421mr684803pfb.58.1706198636248; Thu, 25 Jan
 2024 08:03:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231213121353.GA31326@willie-the-truck> <CAFLszTjfmSx1YMqzb2TsQf7sP4KrcQB=X7DY_HxRQp0J5HAppQ@mail.gmail.com>
 <CAK7LNAQRCDC03e=TVO=k4FuD2a2RdTy7yLr3UptQjVCX7pM1CA@mail.gmail.com>
 <20240109143349.GR1610741@bill-the-cat> <CAFLszTjwhy24UiT6kUJABMC1Xn0h9Q1q9fYpZZJg9DX8Vss9cA@mail.gmail.com>
In-Reply-To: <CAFLszTjwhy24UiT6kUJABMC1Xn0h9Q1q9fYpZZJg9DX8Vss9cA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 25 Jan 2024 09:03:44 -0700
Message-ID: <CAFLszTjPAHd6RdO1mvatXC=yRS+h=sgJ_pMdyEnkROTx7yRpog@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 17 Jan 2024 at 06:14, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Masahiro, Tom,
>
> On Tue, 9 Jan 2024 at 07:33, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Jan 09, 2024 at 11:01:42PM +0900, Masahiro Yamada wrote:
> > > Hi Simon,
> > >
> > >
> > > On Wed, Jan 3, 2024 at 8:47=E2=80=AFAM Simon Glass <sjg@chromium.org>=
 wrote:
> > > >
> > > > Hi Masahiro,
> > > >
> > > > On Wed, Dec 13, 2023 at 5:14=E2=80=AFAM Will Deacon <will@kernel.or=
g> wrote:
> > > > >
> > > > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote:
> > > > > > Add a script which produces a Flat Image Tree (FIT), a single f=
ile
> > > > > > containing the built kernel and associated devicetree files.
> > > > > > Compression defaults to gzip which gives a good balance of size=
 and
> > > > > > performance.
> > > > > >
> > > > > > The files compress from about 86MB to 24MB using this approach.
> > > > > >
> > > > > > The FIT can be used by bootloaders which support it, such as U-=
Boot
> > > > > > and Linuxboot. It permits automatic selection of the correct
> > > > > > devicetree, matching the compatible string of the running board=
 with
> > > > > > the closest compatible string in the FIT. There is no need for
> > > > > > filenames or other workarounds.
> > > > > >
> > > > > > Add a 'make image.fit' build target for arm64, as well. Use
> > > > > > FIT_COMPRESSION to select a different algorithm.
> > > > > >
> > > > > > The FIT can be examined using 'dumpimage -l'.
> > > > > >
> > > > > > This features requires pylibfdt (use 'pip install libfdt'). It =
also
> > > > > > requires compression utilities for the algorithm being used. Su=
pported
> > > > > > compression options are the same as the Image.xxx files. For no=
w there
> > > > > > is no way to change the compression other than by editing the r=
ule for
> > > > > > $(obj)/image.fit
> > > > > >
> > > > > > While FIT supports a ramdisk / initrd, no attempt is made to su=
pport
> > > > > > this here, since it must be built separately from the Linux bui=
ld.
> > > > > >
> > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > ---
> > > > > >
> > > > > > Changes in v9:
> > > > > > - Move the compression control into Makefile.lib
> > > > > >
> > > > > > Changes in v8:
> > > > > > - Drop compatible string in FDT node
> > > > > > - Correct sorting of MAINTAINERS to before ARM64 PORT
> > > > > > - Turn compress part of the make_fit.py comment in to a sentenc=
e
> > > > > > - Add two blank lines before parse_args() and setup_fit()
> > > > > > - Use 'image.fit: dtbs' instead of BUILD_DTBS var
> > > > > > - Use '$(<D)/dts' instead of '$(dir $<)dts'
> > > > > > - Add 'mkimage' details Documentation/process/changes.rst
> > > > > > - Allow changing the compression used
> > > > > > - Tweak cover letter since there is only one clean-up patch
> > > > > >
> > > > > > Changes in v7:
> > > > > > - Add Image as a dependency of image.fit
> > > > > > - Drop kbuild tag
> > > > > > - Add dependency on dtbs
> > > > > > - Drop unnecessary path separator for dtbs
> > > > > > - Rebase to -next
> > > > > >
> > > > > > Changes in v5:
> > > > > > - Drop patch previously applied
> > > > > > - Correct compression rule which was broken in v4
> > > > > >
> > > > > > Changes in v4:
> > > > > > - Use single quotes for UIMAGE_NAME
> > > > > >
> > > > > > Changes in v3:
> > > > > > - Drop temporary file image.itk
> > > > > > - Drop patch 'Use double quotes for image name'
> > > > > > - Drop double quotes in use of UIMAGE_NAME
> > > > > > - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> > > > > > - Avoid hard-coding "arm64" for the DT architecture
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Drop patch previously applied
> > > > > > - Add .gitignore file
> > > > > > - Move fit rule to Makefile.lib using an intermediate file
> > > > > > - Drop dependency on CONFIG_EFI_ZBOOT
> > > > > > - Pick up .dtb files separately from the kernel
> > > > > > - Correct pylint too-many-args warning for write_kernel()
> > > > > > - Include the kernel image in the file count
> > > > > > - Add a pointer to the FIT spec and mention of its wide industr=
y usage
> > > > > > - Mention the kernel version in the FIT description
> > > > > >
> > > > > >  Documentation/process/changes.rst |   9 +
> > > > > >  MAINTAINERS                       |   7 +
> > > > > >  arch/arm64/Makefile               |   7 +-
> > > > > >  arch/arm64/boot/.gitignore        |   1 +
> > > > > >  arch/arm64/boot/Makefile          |   6 +-
> > > > > >  scripts/Makefile.lib              |  16 ++
> > > > > >  scripts/make_fit.py               | 291 ++++++++++++++++++++++=
++++++++
> > > > > >  7 files changed, 334 insertions(+), 3 deletions(-)
> > > > > >  create mode 100755 scripts/make_fit.py
> > > > >
> > > > > I'll need Masahiro's Ack on the scripts/ changes before I can tak=
e this
> > > > > one.
> > > >
> > > > Any thoughts on this request, please?
> > > >
> > > > Regards,
> > > > Simon
> > > >
> > >
> > >
> > >
> > > As I mentioned before, I am concerned with having
> > > the same "compatible" entries, with different contents,
> > > as you use the "compatible" string as an ID to selecting
> > > the target config node, right?
> > >
> > >
> > >
> > >
> > >
> > > $ fdtdump  arch/arm64/boot/image.fit
> > >
> > >         ...
> > >
> > >         conf-10 {
> > >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > > "tq,am642-tqma6442l", "ti,am642";
> > >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL car=
rier board";
> > >             fdt =3D "fdt-10";
> > >             kernel =3D "kernel";
> > >         };
> > >
> > >         ...
> > >
> > >         conf-25 {
> > >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > > "tq,am642-tqma6442l", "ti,am642";
> > >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL car=
rier board";
> > >             fdt =3D "fdt-25";
> > >             kernel =3D "kernel";
> > >         };
> >
> > I had asked Rob a while ago about if having the same compatible for two
> > functionally different machines is a feature, or a bug, and I don't
> > think either of us fully agreed either way. I'd be leaning towards
> > saying the above example is a bug in the dts files, it's just not been =
a
> > bug people have worried about before due to (sadly) how little the
> > top-level compatible has been used.
>
> Yes I believe this is a bug in the files.
>
> What should the script do in this case? Print a warning, perhaps?

Is there anything I should do here? Would a warning be helpful, or
just confusing?

Regards,
Simon

