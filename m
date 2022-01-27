Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABB349DD49
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jan 2022 10:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbiA0JFm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jan 2022 04:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbiA0JFm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 04:05:42 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E945C061714;
        Thu, 27 Jan 2022 01:05:41 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e17so3305242ljk.5;
        Thu, 27 Jan 2022 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=9G7z2L/wIkbdBAgvndKll7pSyf3VWgD5TJfFYJX8Dqc=;
        b=oDwBPEb03yzvTtKtO6lk9QsrKgFHCgCm6TWY9QX5WG+SCQxV3UNkAQh4rUFntTku5G
         jL2IvCNjMy8vqCkpnHC6QvHLbIeyn5SqSt/pVmy4Wc4ge/UxoAkTBxIW6SEjs7Tc3NLE
         YDsP4lG8fjNh0uDUa8a2eMNrMvvG4SDIVmuJ+1ca6FID+vTobiObYsAxVdg3S7LZkPsX
         q6MpAZFzsr8vfhKSOMO72T6sOlaUAOGHhd6RbkfmjYedJfq3IyASoHb/DMjP2AKn8Kr4
         inKUQXFOXsSzuURSseWBNFtXU3AtzyNoLmXHrPthW8b4jhxjhZkA2GFP5qRCBsGufJan
         J8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=9G7z2L/wIkbdBAgvndKll7pSyf3VWgD5TJfFYJX8Dqc=;
        b=yO6M1nqzWCMHT9Y5aXcKMo5mHcvbZcui+gGe/zNFhYeTHLgLpMdj5BpB5Xua7bEKDk
         nT+GJ7Ag66rnPjdudtYFo2sa6Cs4xmUQcSVa/h5WXXEGiTDQsBQEPXOLsBle4AHOazzR
         ny+mskyzX5gtiE3uqdnnF1qiTV/FVqdzwbDKidv47r2Qo0/V9eDv1svE+ITB02aeg05H
         gs0wXADYYVdYCm95QhOFH/ik19C4jJC0ab96+lFc4qUPiBBn47FvPYQp0UzzRHOSIzza
         8M5UmQheCnkV2GB887jaHF4Y8Q5zocrb56dM3zSVarzyVO2E/UY1ZcIXv4HAEkQcYb8Q
         Jntw==
X-Gm-Message-State: AOAM533/JHIXquu4Ov40npuFbQVpsGDy2V/I3Qfaicc9xho7W3XZJzFh
        rsm9Ydz29QmcL7HbliMGfLw=
X-Google-Smtp-Source: ABdhPJwcN1TN+Dp1Fx06IKRNn0C7H63yo7TJeIAYC6MmlgXoSBZSskbsjjftINgCULZ1QWVU01TEhg==
X-Received: by 2002:a2e:9b5a:: with SMTP id o26mr2289750ljj.186.1643274339743;
        Thu, 27 Jan 2022 01:05:39 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id p28sm1658252lfo.79.2022.01.27.01.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 01:05:39 -0800 (PST)
Date:   Thu, 27 Jan 2022 11:05:28 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
Message-ID: <20220127110528.20604049@eldfell>
In-Reply-To: <20220127082058.434421-1-javierm@redhat.com>
References: <20220127082058.434421-1-javierm@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//82LTiAi=MvHuwuf6=cTHCM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_//82LTiAi=MvHuwuf6=cTHCM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Jan 2022 09:20:58 +0100
Javier Martinez Canillas <javierm@redhat.com> wrote:

> The Linux DRM subsystem supports complex graphics devices and it could be
> quite overwhelming for newcomers to learn about the subsystem's internals.
>=20
> There are lots of useful talks, slides and articles available that can be
> used to get familiar with the needed concepts and ease the learning curve.
>=20
> Add a section to the intro that contains these DRM introductory materials.
>=20
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/intro=
duction.rst
> index 25a56e9c0cfd..35986784f916 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civilise=
d manner when
>  interacting with community members on mailing lists, IRC, or bug
>  trackers. The community represents the project as a whole, and abusive
>  or bullying behaviour is not tolerated by the project.
> +
> +Learning material
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Since the Linux DRM layer supports complex graphics devices, it can be q=
uite
> +overwhelming for newcomers to get familiar with all the needed concepts =
and
> +learn the subsystem's internals.

Hi,

this seems to say that DRM is going to be complicated no matter what
hardware one wants to drive, but is that true?

Is there no way to say that if your display hardware is simple (no
GPU), then the driver can be simple to write too?

> +
> +To shallow the learning curve, this section contains a list of presentat=
ions
> +and documents that can be used to learn about DRM/KMS and graphics in ge=
neral.
> +
> +The list is sorted in reverse chronological order, to keep the most up-t=
o-date
> +material at the top. But all of them contain useful information, and it =
can be
> +valuable to go through older material to understand the rationale and co=
ntext
> +in which the recent changes to the DRM subsystem were made.
> +
> +Talks
> +-----
> +
> +* `An Overview of the Linux and Userspace Graphics Stack <https://www.yo=
utube.com/watch?v=3DwjAJmqwg47k>`_ - Paul Kocialkowski (2020)
> +* `Getting pixels on screen on Linux: introduction to Kernel Mode Settin=
g <https://www.youtube.com/watch?v=3Dhaes4_Xnc5Q>`_ - Simon Ser (2020)
> +* `An introduction to the Linux DRM subsystem <https://www.youtube.com/w=
atch?v=3DLbDOCJcDRoo>`_ - Maxime Ripard (2017)
> +* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=3DL=
jiB_JeDn2M>`_ - Daniel Vetter (2016)
> +* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=3Dli=
hqR9sENpc>`_ - Laurent Pinchart (2015)
> +* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=3Dkl9=
suFgbTc8>`_ - Daniel Vetter (2015)
> +* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=3D=
Ja8fM7rTae4>`_ - Laurent Pinchart (2013
> +
> +Slides and articles
> +-------------------
> +
> +* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/train=
ing/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
> +* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>=
`_ - STMicroelectronics (2021)
> +* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-=
stack-an-overview>`_ - Nathan Gau=C3=ABr (2017)
> +* `The DRM/KMS subsystem from a newbie=E2=80=99s point of view <https://=
bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.p=
df>`_ - Boris Brezillon (2014)
> +* `A brief introduction to the Linux graphics stack <https://blogs.igali=
a.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`=
_ - Iago Toral (2014)
> +* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-=
graphics-stack/>`_ - Jasper St. Pierre (2012)

That's an impressive list of links!

However, given the discussions that prompted this doc, I think the gist
is missing. The reader is just flooded with stuff to read and learn
which can be discouraging.

Your audience are developers who know nothing about DRM. They may have
been writing fb drivers instead. The display hardware they want to
drive has no GPU. Where should they get started? Which presentations to
read/watch first? Which driver to look at for a simple example?

Maybe add one more section targeting that specific audience?


Thanks,
pq

--Sig_//82LTiAi=MvHuwuf6=cTHCM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmHyYFgACgkQI1/ltBGq
qqfxDxAAsqipfI+nMvx49JsJxUL2kCMd6pWOEFGM18PL4ZQCotCVrUhF5c9IZ4aj
f1qN13r3UhzJAyeBjWa4vrS/4YA1K/ILBpEXNZ59dw+C3CsHAfSDVFwqS/Z9PUrA
InNYC9tmvA1ck2Xv4GT9JXuOf1czRIL3RwMb84LeNUYT3AUHEudPDH9yJpvJCrgB
WwiOAbm0SERGi3W5wbPPqtmZVvcS+OI8YHqmjJWa7o2eI7KhsoERylPlU1AoPYEW
PRwueEDGt++NQCjPk1rizM9QEZH/8IQ1GQ2mE3+QXGyEjkmexOAYSS/u+AS3NaMq
zxuuCd9YFs/xVTZwOsRh+OdZLNiZeqmIR8NOTeWEylipILDhojDhBAa3kn9CGsIE
Wcqe+Kbax2kVefEbBUx2wRMIINmOPkZFc+B0pSY0UmmxfVjWHWicIC5a8G16kGvn
nVgUfG0ATmh+xFyRZWjbqlszdlxSiI2KmowiiGsnyilIBraQyB1hf53QxTxjEH2o
1/1lCHITKO1Ke29LKUHypCgZyu73TOC+NdZPvItjRKHdjJxVcs6/iC8JoWrdhzlk
huB6CYJiB29fwIRa6DyED1u29vxcG2invauqZEF5QtfYQRi2XcTYv3kUiR3HpAuk
CyKCZfLnIyfbNu40CZJJV6LAX9AZ0Rd2Xq1hb4LM7iqFDwIDZ2M=
=r+Et
-----END PGP SIGNATURE-----

--Sig_//82LTiAi=MvHuwuf6=cTHCM--
