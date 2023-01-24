Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48999679305
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jan 2023 09:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjAXIZf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Jan 2023 03:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232832AbjAXIZe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jan 2023 03:25:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1708A62
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 00:25:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14450B810E2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 08:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F70C433A7
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674548729;
        bh=d3hd/qjnj5/ariY+QFAVEgRiRwaFb6UIIwLnXE/W1rU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QVJmmAmE1sbJeq0OlxM4myQveslGjrsfGHvJSBAagwzcRlOvDa21DWySUHSogJeJF
         OY6KzRSJx1lc0iQ4bDEKv1VhK/tHXCFIIGs9urGCii3OeD/mH/uKxTCWzijKLqQuD7
         ITQ1M8qAPn15YXWD5qpuaa4ilqoFQzY3cuwtrx0y0cK3l/ssyoWpGNNK4SXb65V68+
         GNDR3Q/cJlbGCpXO0THshO3p/X/p9cApbxSsKBwjBdiGMfN6nTAhYE6X+RWwMDBtPG
         Ye4ctCPCkM78PwNj/Nk9R8t3Roy8df7Wb2Yy9Mj3Wjg8e1vmEhCyUOm5P5Hhb8GZmC
         9ecR2BiZPPtsA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4a263c4ddbaso208266597b3.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 00:25:29 -0800 (PST)
X-Gm-Message-State: AFqh2koDXNgLAqS0eZWEEXFJ7P9Ot7wJmFVKX+i3BG/CblUOrc1GSWk2
        L8ttlEfSAKpfnB9CyaTH3Mc1JJSckJHGTKfO2CI=
X-Google-Smtp-Source: AMrXdXsbVrThOokHM+ctecycU8cIB7xqX3oeesE7Nt5k8lcU1Hezck4pxiopmgjZi3viCG1A1VCv8XooMrbE5yovk6Y=
X-Received: by 2002:a81:a146:0:b0:4ed:916b:d3e4 with SMTP id
 y67-20020a81a146000000b004ed916bd3e4mr3361908ywg.487.1674548728739; Tue, 24
 Jan 2023 00:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <105c2c1c-bce7-637d-9d25-a58e68bbbbab@suse.de>
In-Reply-To: <105c2c1c-bce7-637d-9d25-a58e68bbbbab@suse.de>
From:   Oded Gabbay <ogabbay@kernel.org>
Date:   Tue, 24 Jan 2023 10:25:02 +0200
X-Gmail-Original-Message-ID: <CAFCwf121TDo93nM4w-OnLB9TUoPf3XKOFCqcSjgAuW=KzjxLzQ@mail.gmail.com>
Message-ID: <CAFCwf121TDo93nM4w-OnLB9TUoPf3XKOFCqcSjgAuW=KzjxLzQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 24, 2022 at 2:29 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 20.10.22 um 19:53 schrieb Maciej Kwapulinski:
> > Dear kernel maintainers,
> >
> > This submission is a kernel driver to support Intel(R) Gaussian & Neura=
l
> > Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-proce=
ssor
> > available on multiple Intel platforms. AI developers and users can offl=
oad
> > continuous inference workloads to an Intel(R) GNA device in order to fr=
ee
> > processor resources and save power. Noise reduction and speech recognit=
ion
> > are the examples of the workloads Intel(R) GNA deals with while its usa=
ge
> > is not limited to the two.
> >
> > For a list of processors equipped with Intel(R) GNA device, please refe=
r to
> > this link:
> > https://docs.openvinotoolkit.org/latest/openvino_docs_IE_DG_supported_p=
lugins_GNA.html
> >
> > We think contributing this driver to the upstream kernel project is the
> > best way for developers and users to get the latest Intel(R) GNA suppor=
t in
> > a Linux kernel, through the mainline to any Linux distributions install=
ed
> > on their systems. Upstreaming also enables contribution from developers
> > around the world to the driver once it is merged.
> >
> > The driver works with Intel(R) libraries in user space. The Intel(R) dr=
iver
> > exposes a few IOCTL interfaces for use by libraries in user space. The
> > libraries are open sourced and are available at:
> > https://github.com/intel/gna
>
> This driver appears to be a candidate for the accel subsystem that has
> been proposed here. [1] At a minimum, you'd now get standardized file
> names. Longterm, I'd expect dedicated helpers for accel devices.
>
> Best regards
> Thomas
>
>
> [1]
> https://lore.kernel.org/dri-devel/Y1VMX9J44FJZp0dl@kroah.com/T/#m977efaeb=
39fc5be581ae05e1dccbd896546db943
>
> >
> > ---
> >
> > Changelogs:
> >
> >   v1->v2:
> >   - driver's new layout:
> >     - driver name: gna -> intel_gna
> >     - module name: gna -> intel_gna
> >     - device file name: /dev/gnaN -> /dev/intel_gnaN
> >     - driver's source directory: drivers/misc/gna/ -> drivers/misc/inte=
l/gna/
> >     - UAPI: include/uapi/misc/gna.h -> include/uapi/misc/intel/gna.h
> >     - DOC: Documentation/misc-devices/gna.rst ->
> >         Documentation/misc-devices/intel/gna.rst
> >   - 'MISC' device framework used
> >   - fixes throughout GNA device's PCI management
> >   - header files' includes and forward declarations cleanup
> >   - ISR made static
> >   - unused comments cleanup
> >   - "_priv_" segment removed from function names
> >   - tested: v5.11-rc3 -> v5.11
> >   - number of other/minor fixes
> >
> >   v2->v3:
> >   - PCI glue driver part split.
> >   - GNA probe fail path made fully implicit.
> >   - 'recovery_timeout' module parameter present under 'CONFIG_DEBUG_INT=
EL_GNA' flag only.
> >   - build for X86_32 enabled.
> >   - module initialization through 'module_pci_driver()'.
> >   - gna_priv->file_list cleanup.
> >   - 'gna_' prefix removed from source files' names.
> >   - power management handling added.
> >   - number of other/minor fixes
> >   - tests performed on kernel v5.12
> >
> >   v3->v4:
> >   - GNA driver adapted to DRM framework (+userspace GNA library adapted=
 to use the driver)
> >     - drm_managed (drmm) feature is used for objects lifetime managemen=
t
> >     - GNA memory objects use ~drm_gem_shmem_object~ objects as a base
> >   - patches reorganized to meet symbols' usage with their declarations/=
definitions
> >   - 'recovery_timeout' module parameter removed
> >   - number of other/minor fixes from v3 review
> >   - tests performed on kernel v6.0
> >
> >   v4->v5:
> >   - indentation fixed in drivers/gpu/drm/gna/Kconfig
> >
> > Maciej Kwapulinski (4):
> >    gna: add PCI driver module
> >    gna: add GNA DRM device
> >    gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
> >    gna: add power management
> >
> > Tomasz Jankowski (6):
> >    gna: read hardware info
> >    gna: initialize MMU
> >    gna: add GNA_GET_PARAMETER ioctl
> >    gna: add GNA_COMPUTE ioctl
> >    gna: add GNA_WAIT ioctl
> >    gna: add open and close operations on GNA device
> >
> >   Documentation/gpu/drivers.rst     |   1 +
> >   Documentation/gpu/gna.rst         |  64 +++++
> >   MAINTAINERS                       |   7 +
> >   drivers/gpu/drm/Kconfig           |   2 +
> >   drivers/gpu/drm/Makefile          |   1 +
> >   drivers/gpu/drm/gna/Kbuild        |   5 +
> >   drivers/gpu/drm/gna/Kconfig       |  15 +
> >   drivers/gpu/drm/gna/gna_device.c  | 317 +++++++++++++++++++++
> >   drivers/gpu/drm/gna/gna_device.h  | 114 ++++++++
> >   drivers/gpu/drm/gna/gna_gem.h     |  22 ++
> >   drivers/gpu/drm/gna/gna_hw.c      | 110 ++++++++
> >   drivers/gpu/drm/gna/gna_hw.h      | 107 ++++++++
> >   drivers/gpu/drm/gna/gna_ioctl.c   | 208 ++++++++++++++
> >   drivers/gpu/drm/gna/gna_mem.c     | 249 +++++++++++++++++
> >   drivers/gpu/drm/gna/gna_mem.h     |  58 ++++
> >   drivers/gpu/drm/gna/gna_pci.c     | 148 ++++++++++
> >   drivers/gpu/drm/gna/gna_pci.h     |  12 +
> >   drivers/gpu/drm/gna/gna_request.c | 441 +++++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/gna/gna_request.h |  64 +++++
> >   drivers/gpu/drm/gna/gna_score.c   | 222 +++++++++++++++
> >   drivers/gpu/drm/gna/gna_score.h   |  11 +
> >   include/uapi/drm/gna_drm.h        | 169 ++++++++++++
> >   22 files changed, 2347 insertions(+)
> >   create mode 100644 Documentation/gpu/gna.rst
> >   create mode 100644 drivers/gpu/drm/gna/Kbuild
> >   create mode 100644 drivers/gpu/drm/gna/Kconfig
> >   create mode 100644 drivers/gpu/drm/gna/gna_device.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_device.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_gem.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_hw.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_hw.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_ioctl.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_mem.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_mem.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_pci.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_pci.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_request.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_request.h
> >   create mode 100644 drivers/gpu/drm/gna/gna_score.c
> >   create mode 100644 drivers/gpu/drm/gna/gna_score.h
> >   create mode 100644 include/uapi/drm/gna_drm.h
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev

Hi Maciej,
I just wanted to touch base with you about gna, asking whether you are
going (or maybe started) to port the gna to the accel subsystem ?
fyi, ivpu driver was just merged to the accel subsystem, so we already have=
 our
first driver tested & merged.

Thanks,
Oded
