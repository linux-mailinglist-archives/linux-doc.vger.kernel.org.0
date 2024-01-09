Return-Path: <linux-doc+bounces-6403-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCE82875A
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 14:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D8E28659D
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 13:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9717638FA7;
	Tue,  9 Jan 2024 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFdVuI4h"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A138FA8;
	Tue,  9 Jan 2024 13:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D5CC433B1;
	Tue,  9 Jan 2024 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704808059;
	bh=yAuhIw8iyfmsp2rAHPIKCPS0DxitB9PWBR/LnYnXL0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NFdVuI4h51aLHYOv/ay26Q30SN2F+jddyXZGe05dFyw+dyJCOSxyAkYrKa046pjLz
	 P3i8hzmgkbd/pTf4lRW36DEnVERf8QHaZyDSf8AwrQO+tKcAzcV2feNYUFp4E6nw5r
	 wgfAyi9rhXhp24GZ2GV/w5pZaIW2A05dpssn+6cxyepl8Myny2niNnMNZCS3t2l1+B
	 CLCei9NnLPaEnbCAS+XMoRk5DNeDuCS2EzcRjtKjFd+LJH+duBWf5YROgF/1gcqoOU
	 JYwj5uL+ydpdDGigz0bO4U+fHAaqbAEs4uWIhmayyH3MuvleJ8iRpbzyxaZVC/KJLY
	 MrvkPb1ACbRQg==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bba50cd318so3346160b6e.0;
        Tue, 09 Jan 2024 05:47:38 -0800 (PST)
X-Gm-Message-State: AOJu0Yz0gymc4ToZ7lkR1prxkLt3wkwhuB5UB0Ik0zfZXkmF4kYXSaXj
	Gm3Xg0iLp06ma59aIEr8Ere0g4NVBGhkazBDcAA=
X-Google-Smtp-Source: AGHT+IHPFMQToMBZl65bUdb2AEiLqf2HQZEwC+LLihppXThZR4ikmus7o22LZPQB2X9m58YFiYyXpC71ur9f22QuXUI=
X-Received: by 2002:a05:6870:d0c4:b0:205:dd93:45a5 with SMTP id
 k4-20020a056870d0c400b00205dd9345a5mr7865532oaa.70.1704808058291; Tue, 09 Jan
 2024 05:47:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231203153401.GV8402@pendragon.ideasonboard.com> <20231207142723.GA3187877@google.com>
 <20231207143814.GD15521@pendragon.ideasonboard.com> <CAGXv+5Go_0pEVAOLQmRCc_a9-YUtZEmBfXtMuBupX_nb9iqwbw@mail.gmail.com>
 <20231209152946.GC13421@pendragon.ideasonboard.com> <CAMuHMdVMZs6mnwWBgFwktO=8o=QzROv60cfZe085MhD6HxQjpQ@mail.gmail.com>
 <CAGXv+5Est3FL-XcEL-vB-6zVNas0mqb2cNYa==Yb7W2SQU9xVQ@mail.gmail.com>
 <CAK7LNATyD-PeNbaLTjJmU9=koqqE+V6QvFe09c2VrXopWvjpcw@mail.gmail.com>
 <CAK7LNAR7Fm-1yaZmyH78vG5yNbbW2Avjj5F63u+aST6JQoMd5A@mail.gmail.com> <CAFLszTjfN8dzBNpr6+EVQiwen5BPoYtu8LJM3dCcd-sMP3=Nvw@mail.gmail.com>
In-Reply-To: <CAFLszTjfN8dzBNpr6+EVQiwen5BPoYtu8LJM3dCcd-sMP3=Nvw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 9 Jan 2024 22:47:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8GWNNaMcBN+WZfzRQDmRjGC8Ek5u=E7r1iaTHMY70iw@mail.gmail.com>
Message-ID: <CAK7LNAT8GWNNaMcBN+WZfzRQDmRjGC8Ek5u=E7r1iaTHMY70iw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Simon Glass <sjg@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 3:39=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Masahiro,
>
> On Thu, Dec 14, 2023 at 7:34=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Thu, Dec 14, 2023 at 3:12=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Dec 14, 2023 at 1:03=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > On Sun, Dec 10, 2023 at 1:31=E2=80=AFAM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > >
> > > > > Hi Laurent,
> > > > >
> > > > > On Sat, Dec 9, 2023 at 4:29=E2=80=AFPM Laurent Pinchart
> > > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > On Sat, Dec 09, 2023 at 10:13:59PM +0900, Chen-Yu Tsai wrote:
> > > > > > > On Thu, Dec 7, 2023 at 11:38=E2=80=AFPM Laurent Pinchart
> > > > > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > > > On Thu, Dec 07, 2023 at 10:27:23PM +0800, Chen-Yu Tsai wrot=
e:
> > > > > > > > > On Sun, Dec 03, 2023 at 05:34:01PM +0200, Laurent Pinchar=
t wrote:
> > > > > > > > > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass w=
rote:
> > > > > > > > > > > Add a script which produces a Flat Image Tree (FIT), =
a single file
> > > > > > > > > > > containing the built kernel and associated devicetree=
 files.
> > > > > > > > > > > Compression defaults to gzip which gives a good balan=
ce of size and
> > > > > > > > > > > performance.
> > > > > > > > > > >
> > > > > > > > > > > The files compress from about 86MB to 24MB using this=
 approach.
> > > > > > > > > > >
> > > > > > > > > > > The FIT can be used by bootloaders which support it, =
such as U-Boot
> > > > > > > > > > > and Linuxboot. It permits automatic selection of the =
correct
> > > > > > > > > > > devicetree, matching the compatible string of the run=
ning board with
> > > > > > > > > > > the closest compatible string in the FIT. There is no=
 need for
> > > > > > > > > > > filenames or other workarounds.
> > > > > > > > > > >
> > > > > > > > > > > Add a 'make image.fit' build target for arm64, as wel=
l. Use
> > > > > > > > > > > FIT_COMPRESSION to select a different algorithm.
> > > > > > > > > > >
> > > > > > > > > > > The FIT can be examined using 'dumpimage -l'.
> > > > > > > > > > >
> > > > > > > > > > > This features requires pylibfdt (use 'pip install lib=
fdt'). It also
> > > > > > > > > > > requires compression utilities for the algorithm bein=
g used. Supported
> > > > > > > > > > > compression options are the same as the Image.xxx fil=
es. For now there
> > > > > > > > > > > is no way to change the compression other than by edi=
ting the rule for
> > > > > > > > > > > $(obj)/image.fit
> > > > > > > > > > >
> > > > > > > > > > > While FIT supports a ramdisk / initrd, no attempt is =
made to support
> > > > > > > > > > > this here, since it must be built separately from the=
 Linux build.
> > > > > > > > > >
> > > > > > > > > > FIT images are very useful, so I think this is a very w=
elcome addition
> > > > > > > > > > to the kernel build system. It can get tricky though: g=
iven the
> > > > > > > > > > versatile nature of FIT images, there can't be any
> > > > > > > > > > one-size-fits-them-all solution to build them, and stri=
king the right
> > > > > > > > > > balance between what makes sense for the kernel and the=
 features that
> > > > > > > > > > users may request will probably lead to bikeshedding. A=
s we all love
> > > > > > > > > > bikeshedding, I thought I would start selfishly, with a=
 personal use
> > > > > > > > > > case :-) This isn't a yak-shaving request though, I don=
't see any reason
> > > > > > > > > > to delay merging this series.
> > > > > > > > > >
> > > > > > > > > > Have you envisioned building FIT images with a subset o=
f DTBs, or adding
> > > > > > > > > > DTBOs ? Both would be fairly trivial extensions to this=
 script by
> > > > > > > > > > extending the supported command line arguments. It woul=
d perhaps be more
> > > > > > > > > > difficult to integrate in the kernel build system thoug=
h. This leads me
> > > > > > > > > > to a second question: would you consider merging extens=
ions to this
> > > > > > > > > > script if they are not used by the kernel build system,=
 but meant for
> > > > > > > > > > users who manually invoke the script ? More generally, =
is the script
> > > > > > > > >
> > > > > > > > > We'd also be interested in some customization, though in =
a different way.
> > > > > > > > > We imagine having a rule file that says X compatible stri=
ng should map
> > > > > > > > > to A base DTB, plus B and C DTBO for the configuration se=
ction. The base
> > > > > > > > > DTB would carry all common elements of some device, while=
 the DTBOs
> > > > > > > > > carry all the possible second source components, like dif=
ferent display
> > > > > > > > > panels or MIPI cameras for instance. This could drastical=
ly reduce the
> > > > > > > > > size of FIT images in ChromeOS by deduplicating all the c=
ommon stuff.
> > > > > > > >
> > > > > > > > Do you envision the "mapping" compatible string mapping to =
a config
> > > > > > > > section in the FIT image, that would bundle the base DTB an=
d the DTBOs ?
> > > > > > >
> > > > > > > That's exactly the idea. The mapping compatible string could =
be untied
> > > > > > > from the base board's compatible string if needed (which we p=
robably do).
> > > > > > >
> > > > > > > So something like:
> > > > > > >
> > > > > > > config {
> > > > > > >     config-1 {
> > > > > > >         compatible =3D "google,krane-sku0";
> > > > > > >         fdt =3D "krane-baseboard", "krane-sku0-overlay";
> > > > > > >     };
> > > > > > > };
> > > > > > >
> > > > > > > With "krane-sku0-overlay" being an overlay that holds the dif=
ferences
> > > > > > > between the SKUs, in this case the display panel and MIPI cam=
era (not
> > > > > > > upstreamed) that applies to SKU0 in particular.
> > > > > >
> > > > > > The kernel DT makefiles already contain information on what ove=
rlays to
> > > > > > apply to what base boards, in order to test the overlays and pr=
oduce
> > > > > > "full" DTBs. Maybe that information could be leveraged to creat=
e the
> > > > > > configurations in the FIT image ?
> > > > >
> > > > > Although the "full" DTBs created may only be a subset of all poss=
ible
> > > > > combinations (I believe Rob just started with creating one "full"=
 DTB
> > > > > for each overlay, cfr. the additions I made in commit a09c3e105a2=
08580
> > > > > ("arm64: dts: renesas: Apply overlays to base dtbs")), that could
> > > > > definitely be a start.
> > > > >
> > > > > Now, since the kernel build system already creates "full" DTBs, d=
oes
> > > > > that mean that all of the base DTBs, overlays, and "full" DTBs wi=
ll
> > > > > end up in the FIT image?
> > > >
> > > > I suppose we could add an option to the packing tool to be able to =
_not_
> > > > add the "full" DTBs if they can also be assembled with a base DTB a=
nd
> > > > overlays. Think of it as a firmware compatibility option: if the fi=
rmware
> > > > supports overlays, then you almost always want the deconstructed pa=
rts,
> > > > not the fully assembled ones. Vice versa.
> > > >
> > > > If we don't we could end up with two configurations that have the s=
ame
> > > > compatible string?
> > >
> > >
> > > Right.
> > >
> > > We would end up with such situations because applying
> > > an overlay does not change the compatible string.
> > >
> > >
> > >
> > > With this code in arch/arm64/boot/dts/ti/Makefile:
> > >
> > > k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs :=3D \
> > >       k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-sdca=
rd.dtbo
> > > k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs :=3D \
> > >       k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan=
.dtbo
> > >
> > >
> > >
> > >
> > > $ fdtdump  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.=
dtb
> > > 2>/dev/null| head -n15 | tail -n2
> > >     model =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL carrier board";
> > >     compatible =3D "tq,am642-tqma6442l-mbax4xxl", "tq,am642-tqma6442l=
",
> > > "ti,am642";
> > >
> > >
> > > $ fdtdump  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dt=
b
> > > 2>/dev/null| head -n15 | tail -n2
> > >     model =3D "TQ-Systems TQMa64xxL SoM on MBax4xxL carrier board";
> > >     compatible =3D "tq,am642-tqma6442l-mbax4xxl", "tq,am642-tqma6442l=
",
> > > "ti,am642";
> > >
> > >
> > >
> > >
> > >
> > > These two go into image.fit, but one of them is completely dead
> > > since there is no way to distinguish them.
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
> > >
> > >
> > >
> > >
> > >
> > > I agree with Chen-Yu.
> > >
> > > FIT should not include full DTBs.
> > >
> > > Bootloaders should assemble the final DTB
> > > from base and overlays on-the-fly.
> > >
> > >
> > > The FIT spec allows the "fdt" property to list
> > > multiple image nodes.
> > >
> > >
> > > o config-1
> > >  |- description =3D "configuration description"
> > >  |- kernel =3D "kernel sub-node unit name"
> > >  |- fdt =3D "fdt sub-node unit-name" [, "fdt overlay sub-node unit-na=
me", ...]
> > >  |- loadables =3D "loadables sub-node unit-name"
> > >  |- script =3D "
> > >  |- compatible =3D "vendor
> >
> >
> >
> >
> >
> > This is a question for U-Boot (and barebox).
> >
> >
> >
> >
> >    images {
> >           base {
> >                 ...
> >           };
> >
> >           addon1 {
> >                 ...
> >           };
> >
> >           addon2 {
> >                 ...
> >           };
> >     };
> >
> >     configurations {
> >           ...
> >           fdt =3D "base", "addon1", "addon2";
> >     };
> >
> >
> >
> >
> > Is U-Boot's "bootm" command able to dynamically construct
> > the full DTB from "base" + "addon1" + "addon2"
> > and pass to the kernel?
> >
> >
> >
> > When I used overlay from U-Boot command line last time,
> > I typed complicated commands, following this manual:
> > https://docs.u-boot.org/en/latest/usage/fdt_overlays.html
> >
> >
>
> So far this is not possible with bootm, no. But if we can add
> extensions to the FIT spec, then it should be possible to implement
> this.
>
> Is it (or will it be) possible to get Linux to build the DT + overlay
> combinations?


As Chen-Yu replied, dtb files specified in the -dtbs syntax in Makefiles
are assembled at build time using fdtoverlay.

Once they are built, you will never know how they are built
unless you parse Makefiles.

Your script simply picks up *.dtb files found under arch/*/boot/dts/.
There are three possibilities in *.dtb files:

[1] *.dtb assembled from other base and overlays
[2] *.dtb directly compiled from a single *.dts
[3] *.dtb meant to be used as a base of overlay,
     but not meant for direct use.


It would be challenging to include only appropriate *.dtb
(and *.dtbo) files into the FIT image.



I wrote the following patch set, which might be useful
to address this issue.

https://lore.kernel.org/linux-kbuild/20240109120738.346061-1-masahiroy@kern=
el.org/T/#t



>
> >
> >
> > One more question to confirm if I can use this
> > for my practical use-cases.
> >
> > Is U-Boot able to handle FIT (includes kernel + DTs)
> > and a separate initrd?
> >
> >   # bootm  <fit-address>:<conf-name>  <ramdisk-address>
> >
> >
> > Presumably, it would be difficult to inject initramdisk
> > into image.fit later, so I am hoping bootm would work like that,
> > but I did not delve into U-Boot code.
> >
> >
>
> The ramdisk is handled by the FIT configuration. I suppose it would be
> possible to add a way to bypass the logic in select_ramdisk(), but I
> wonder what is the use case for this?


I believe ramdisk is likely used to boot the arm64 Linux system.

Since the FIT image generated by this lacks ramdisk,
it looks useless to me unless there is a way to pass a ramdisk somehow.


Barebox is good because it already supports FIT + separate ramdisk.

I usually use U-Boot for my work, so I need to inject a ramdisk
if I want to use this patch.




> >
> > If it works, is it possible to verify the integrity of initrd?
> > The kernel and DTs inside FIT will be verified, but not sure
> > if it is possible for ramdisk.
>
> I do have thoughts about a possible new FIT feature to allow external
> files, which could perhaps include an initrd.
>
> Regards,
> Simon
>


--=20
Best Regards
Masahiro Yamada

