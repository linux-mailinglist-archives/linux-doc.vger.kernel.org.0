Return-Path: <linux-doc+bounces-6964-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE58306BB
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 14:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23EB41C2424A
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A035E1EB39;
	Wed, 17 Jan 2024 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hvUgxsp7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A21F5F7
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497253; cv=none; b=L1j9XLc5R3sXQS8L5ix88bOrgM64zQfzvcqpu4JVSowVw8gGHx3uBOYNsuyZ63vClugtnE6/ro1cd0NYiMoCA6atjeJqBbN58JKSLkkLBmqZF4CASkMKh7vq9lXTdHUmib9nvfocsq08m/cd66fQq7/X/6JT4w8oFwtrTPZCa1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497253; c=relaxed/simple;
	bh=0kKkVZAmxxgCK2b83Eet+1tmuc7YCI0svgRbIjAjzRM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=uSOapSuw7iw4qpjozeN0/UFDndch1sg5NN4OOp02JXcOb1rLqVfrX4kg2lZc3qXR19IXW5h33gViSUbsyhPuZQ/k+FTE39sYvjBe+QX9FhzmQC4X6SeoSo75Mm9NTAVIEVfkK4i6kSCVgfF/legfeGrJOkBjGfb80Vx//xJI0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hvUgxsp7; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-680fdf7d52fso70878866d6.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705497251; x=1706102051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqSxYa4Ll/q/inJUy6LY/8bl4uTjezprMbcgXXP+xfI=;
        b=hvUgxsp7Qkndh0gtb2tthCiT/p/xffZ7d2edjGj7Q5BMX6YY6uSbDa5n5z0cUbfrzD
         wY+VjpzMmNxa8dy6n46Kj8NEkNQ6tMZjirIJPzbAQB9lD6a9fIipdDF/ifc58hrzhgrB
         0Eqqm5gdJNigyyjdz+/ASt7TrAk3WIP1ybnJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705497251; x=1706102051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqSxYa4Ll/q/inJUy6LY/8bl4uTjezprMbcgXXP+xfI=;
        b=PHGKBw9akvbrTDDp8Q8KwtB4SFBqOyqjLF0UUoLp7UCKTzWEr5rt6Ry0W01RGqF79s
         8KrBOsEu4aAUH2mnOGoLTtB+v1glp5a13MiCr1QJXfGI54CPLE+u/BzW/za7m32fITF7
         FLuXRka4KnXhx9hOxi8bbq8MFobLjLgR9UfbqWcOtGQ0JSxNXMs8ge4bk1CzfL3+28D+
         vTCp/KkwGgrSStMlMf1GUm61GrOMITg+1jHiw3507/Sf9YwzCejudiYrCjEpajZfDGfe
         G+HOmOC+CYvxxyrOr+fVg5SQwmj7J1gVJze7GKx4EQjHs2fYgRSNPdn68jcdywT5XhSP
         EYlg==
X-Gm-Message-State: AOJu0YxVP4GNUvMhlDgArI0EiAdDIplBNbpeZ4hTzayC8PmIcUEbs+Mv
	0QJLqghJ3hqmtNtsfJuTdLzu7GqKLEcm52IVLrzGpMtoTS7W
X-Google-Smtp-Source: AGHT+IF5UeVjK1iCRz3f126prxB2GJY2vd/O20pQBwj8NFheAR2YZBo4js3SPuZv3m7nAhRSa3fTwnO1FiELw6mo/2Y=
X-Received: by 2002:a05:6214:ace:b0:681:1481:e2c4 with SMTP id
 g14-20020a0562140ace00b006811481e2c4mr9974321qvi.93.1705497250768; Wed, 17
 Jan 2024 05:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231213121353.GA31326@willie-the-truck> <CAFLszTjfmSx1YMqzb2TsQf7sP4KrcQB=X7DY_HxRQp0J5HAppQ@mail.gmail.com>
 <CAK7LNAQRCDC03e=TVO=k4FuD2a2RdTy7yLr3UptQjVCX7pM1CA@mail.gmail.com> <20240109143349.GR1610741@bill-the-cat>
In-Reply-To: <20240109143349.GR1610741@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 17 Jan 2024 06:14:00 -0700
Message-ID: <CAFLszTjwhy24UiT6kUJABMC1Xn0h9Q1q9fYpZZJg9DX8Vss9cA@mail.gmail.com>
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

Hi Masahiro, Tom,

On Tue, 9 Jan 2024 at 07:33, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Jan 09, 2024 at 11:01:42PM +0900, Masahiro Yamada wrote:
> > Hi Simon,
> >
> >
> > On Wed, Jan 3, 2024 at 8:47=E2=80=AFAM Simon Glass <sjg@chromium.org> w=
rote:
> > >
> > > Hi Masahiro,
> > >
> > > On Wed, Dec 13, 2023 at 5:14=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> > > >
> > > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote:
> > > > > Add a script which produces a Flat Image Tree (FIT), a single fil=
e
> > > > > containing the built kernel and associated devicetree files.
> > > > > Compression defaults to gzip which gives a good balance of size a=
nd
> > > > > performance.
> > > > >
> > > > > The files compress from about 86MB to 24MB using this approach.
> > > > >
> > > > > The FIT can be used by bootloaders which support it, such as U-Bo=
ot
> > > > > and Linuxboot. It permits automatic selection of the correct
> > > > > devicetree, matching the compatible string of the running board w=
ith
> > > > > the closest compatible string in the FIT. There is no need for
> > > > > filenames or other workarounds.
> > > > >
> > > > > Add a 'make image.fit' build target for arm64, as well. Use
> > > > > FIT_COMPRESSION to select a different algorithm.
> > > > >
> > > > > The FIT can be examined using 'dumpimage -l'.
> > > > >
> > > > > This features requires pylibfdt (use 'pip install libfdt'). It al=
so
> > > > > requires compression utilities for the algorithm being used. Supp=
orted
> > > > > compression options are the same as the Image.xxx files. For now =
there
> > > > > is no way to change the compression other than by editing the rul=
e for
> > > > > $(obj)/image.fit
> > > > >
> > > > > While FIT supports a ramdisk / initrd, no attempt is made to supp=
ort
> > > > > this here, since it must be built separately from the Linux build=
.
> > > > >
> > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > ---
> > > > >
> > > > > Changes in v9:
> > > > > - Move the compression control into Makefile.lib
> > > > >
> > > > > Changes in v8:
> > > > > - Drop compatible string in FDT node
> > > > > - Correct sorting of MAINTAINERS to before ARM64 PORT
> > > > > - Turn compress part of the make_fit.py comment in to a sentence
> > > > > - Add two blank lines before parse_args() and setup_fit()
> > > > > - Use 'image.fit: dtbs' instead of BUILD_DTBS var
> > > > > - Use '$(<D)/dts' instead of '$(dir $<)dts'
> > > > > - Add 'mkimage' details Documentation/process/changes.rst
> > > > > - Allow changing the compression used
> > > > > - Tweak cover letter since there is only one clean-up patch
> > > > >
> > > > > Changes in v7:
> > > > > - Add Image as a dependency of image.fit
> > > > > - Drop kbuild tag
> > > > > - Add dependency on dtbs
> > > > > - Drop unnecessary path separator for dtbs
> > > > > - Rebase to -next
> > > > >
> > > > > Changes in v5:
> > > > > - Drop patch previously applied
> > > > > - Correct compression rule which was broken in v4
> > > > >
> > > > > Changes in v4:
> > > > > - Use single quotes for UIMAGE_NAME
> > > > >
> > > > > Changes in v3:
> > > > > - Drop temporary file image.itk
> > > > > - Drop patch 'Use double quotes for image name'
> > > > > - Drop double quotes in use of UIMAGE_NAME
> > > > > - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> > > > > - Avoid hard-coding "arm64" for the DT architecture
> > > > >
> > > > > Changes in v2:
> > > > > - Drop patch previously applied
> > > > > - Add .gitignore file
> > > > > - Move fit rule to Makefile.lib using an intermediate file
> > > > > - Drop dependency on CONFIG_EFI_ZBOOT
> > > > > - Pick up .dtb files separately from the kernel
> > > > > - Correct pylint too-many-args warning for write_kernel()
> > > > > - Include the kernel image in the file count
> > > > > - Add a pointer to the FIT spec and mention of its wide industry =
usage
> > > > > - Mention the kernel version in the FIT description
> > > > >
> > > > >  Documentation/process/changes.rst |   9 +
> > > > >  MAINTAINERS                       |   7 +
> > > > >  arch/arm64/Makefile               |   7 +-
> > > > >  arch/arm64/boot/.gitignore        |   1 +
> > > > >  arch/arm64/boot/Makefile          |   6 +-
> > > > >  scripts/Makefile.lib              |  16 ++
> > > > >  scripts/make_fit.py               | 291 ++++++++++++++++++++++++=
++++++
> > > > >  7 files changed, 334 insertions(+), 3 deletions(-)
> > > > >  create mode 100755 scripts/make_fit.py
> > > >
> > > > I'll need Masahiro's Ack on the scripts/ changes before I can take =
this
> > > > one.
> > >
> > > Any thoughts on this request, please?
> > >
> > > Regards,
> > > Simon
> > >
> >
> >
> >
> > As I mentioned before, I am concerned with having
> > the same "compatible" entries, with different contents,
> > as you use the "compatible" string as an ID to selecting
> > the target config node, right?
> >
> >
> >
> >
> >
> > $ fdtdump  arch/arm64/boot/image.fit
> >
> >         ...
> >
> >         conf-10 {
> >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > "tq,am642-tqma6442l", "ti,am642";
> >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL carri=
er board";
> >             fdt =3D "fdt-10";
> >             kernel =3D "kernel";
> >         };
> >
> >         ...
> >
> >         conf-25 {
> >             compatible =3D "tq,am642-tqma6442l-mbax4xxl",
> > "tq,am642-tqma6442l", "ti,am642";
> >             description =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL carri=
er board";
> >             fdt =3D "fdt-25";
> >             kernel =3D "kernel";
> >         };
>
> I had asked Rob a while ago about if having the same compatible for two
> functionally different machines is a feature, or a bug, and I don't
> think either of us fully agreed either way. I'd be leaning towards
> saying the above example is a bug in the dts files, it's just not been a
> bug people have worried about before due to (sadly) how little the
> top-level compatible has been used.

Yes I believe this is a bug in the files.

What should the script do in this case? Print a warning, perhaps?

Regards,
Simon

