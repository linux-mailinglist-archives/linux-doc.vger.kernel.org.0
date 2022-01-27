Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE87649E049
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jan 2022 12:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbiA0LKM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jan 2022 06:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiA0LKL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 06:10:11 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D32C061714;
        Thu, 27 Jan 2022 03:10:11 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e17so3772229ljk.5;
        Thu, 27 Jan 2022 03:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=6vypQxLAzOIaDqAGzluIEpvoTPeY1C7pZgTogXPUSOs=;
        b=A1nnsYJ14r0sMBIxgcguMjx8Atv5DYA50WiC2glv1KAD7hIPFfnncF+x02sNw3S3Gk
         t62HFoDEqJHaoMtFw2NGGnefseS4HMKwS2yNZQcKffW1u5v3Vg6f7Dc3d95o6eYezdSd
         u9SprC8DHHPhTvUTxYVKtqD2rH5MAKQvcZJfuGjHvxuCVLpptYkGr/y9QzG5kKfqvQYh
         u7pjWkr5SC5rq5aUxJ2nUMB1PdC7PG/GW7HwGHvXZXzI+grtde/JiyeaiNE+nPbfeFxA
         o3pAI5cae9akSaOeNNKhJy+NblYt82NOwCq3qcpeVmXOmTcL9N6UOGHCh228UfpP5BDw
         nYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=6vypQxLAzOIaDqAGzluIEpvoTPeY1C7pZgTogXPUSOs=;
        b=0bOSq2RvDnOIBIKrTxSjzecEsv70LHYryIHH1Kgnrb2kc2Ub1KbyevR0XZ9BpTXCUh
         y6/SD1H7Ez/AjGQ5I/I2xx9xvoRpBLtR2iykxo08cm5bDNEWiK1mvLCrleNvmmjaRqJ8
         X6grafeYpdNyrZ53aIR9XGSLrHWcbXBLbsQKs0TvK0i1UC7xFPN8SE4YCO81cc/aoNBX
         4LWWfYykxzDm4ZpASPjH1Wjl7HShc4s++BDSfQggfHkx5FHfawzjlMKZeXV5S4f7YlLP
         jwG2ukX4E5gB3Oi7nJQuXTKgFHpUd1EXADKjbaPmG3nmg8kPtoY59pVI8OKZLyCAUl/q
         BBfA==
X-Gm-Message-State: AOAM533W5BVPQBVXmM5aL1HEDqj10aax3iKdV1m2S6zjTyNKg2+GBQZ3
        N03BkAVAm4WLDuVVBYfwyDw=
X-Google-Smtp-Source: ABdhPJxku6dF0K+nd8hGqJt35pkSjCz8fDzDmdeyqNdEQKxaYgBbmd9nT2734ojmVWN++OnX3YAoww==
X-Received: by 2002:a2e:8689:: with SMTP id l9mr2474273lji.417.1643281809211;
        Thu, 27 Jan 2022 03:10:09 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id o7sm1401321lfu.37.2022.01.27.03.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 03:10:08 -0800 (PST)
Date:   Thu, 27 Jan 2022 13:09:59 +0200
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
Message-ID: <20220127130959.568c6274@eldfell>
In-Reply-To: <d03e4a81-de8b-ca4e-f2c4-51faeb3786fd@redhat.com>
References: <20220127082058.434421-1-javierm@redhat.com>
        <20220127110528.20604049@eldfell>
        <d03e4a81-de8b-ca4e-f2c4-51faeb3786fd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aEfNa3QiiQB=Kl4BoRB=JI=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/aEfNa3QiiQB=Kl4BoRB=JI=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Jan 2022 11:46:44 +0100
Javier Martinez Canillas <javierm@redhat.com> wrote:

> Hello Pekka,
>=20
> Thanks a lot for your feedback.
>=20
> On 1/27/22 10:05, Pekka Paalanen wrote:
> > On Thu, 27 Jan 2022 09:20:58 +0100
> > Javier Martinez Canillas <javierm@redhat.com> wrote:
> >  =20
> >> The Linux DRM subsystem supports complex graphics devices and it could=
 be
> >> quite overwhelming for newcomers to learn about the subsystem's intern=
als.
> >>
> >> There are lots of useful talks, slides and articles available that can=
 be
> >> used to get familiar with the needed concepts and ease the learning cu=
rve.
> >>
> >> Add a section to the intro that contains these DRM introductory materi=
als.
> >>
> >> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> ---
> >>
> >>  Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/in=
troduction.rst
> >> index 25a56e9c0cfd..35986784f916 100644
> >> --- a/Documentation/gpu/introduction.rst
> >> +++ b/Documentation/gpu/introduction.rst
> >> @@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civil=
ised manner when
> >>  interacting with community members on mailing lists, IRC, or bug
> >>  trackers. The community represents the project as a whole, and abusive
> >>  or bullying behaviour is not tolerated by the project.
> >> +
> >> +Learning material
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Since the Linux DRM layer supports complex graphics devices, it can b=
e quite
> >> +overwhelming for newcomers to get familiar with all the needed concep=
ts and
> >> +learn the subsystem's internals. =20
> >=20
> > Hi,
> >=20
> > this seems to say that DRM is going to be complicated no matter what
> > hardware one wants to drive, but is that true?
> >=20
> > Is there no way to say that if your display hardware is simple (no
> > GPU), then the driver can be simple to write too?
> > =20
>=20
> I do wonder how much one could abstract of the uAPI when writing a simple=
r driver.
>=20
> In other words, writing the driver should be simple but I believe that gr=
asping
> all the needed details about DRM may not be.
> =20
> >> +
> >> +To shallow the learning curve, this section contains a list of presen=
tations
> >> +and documents that can be used to learn about DRM/KMS and graphics in=
 general.
> >> +
> >> +The list is sorted in reverse chronological order, to keep the most u=
p-to-date
> >> +material at the top. But all of them contain useful information, and =
it can be
> >> +valuable to go through older material to understand the rationale and=
 context
> >> +in which the recent changes to the DRM subsystem were made.
> >> +
> >> +Talks
> >> +-----
> >> +
> >> +* `An Overview of the Linux and Userspace Graphics Stack <https://www=
.youtube.com/watch?v=3DwjAJmqwg47k>`_ - Paul Kocialkowski (2020)
> >> +* `Getting pixels on screen on Linux: introduction to Kernel Mode Set=
ting <https://www.youtube.com/watch?v=3Dhaes4_Xnc5Q>`_ - Simon Ser (2020)
> >> +* `An introduction to the Linux DRM subsystem <https://www.youtube.co=
m/watch?v=3DLbDOCJcDRoo>`_ - Maxime Ripard (2017)
> >> +* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=
=3DLjiB_JeDn2M>`_ - Daniel Vetter (2016)
> >> +* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=
=3DlihqR9sENpc>`_ - Laurent Pinchart (2015)
> >> +* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=3D=
kl9suFgbTc8>`_ - Daniel Vetter (2015)
> >> +* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=
=3DJa8fM7rTae4>`_ - Laurent Pinchart (2013
> >> +
> >> +Slides and articles
> >> +-------------------
> >> +
> >> +* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/tr=
aining/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
> >> +* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overvi=
ew>`_ - STMicroelectronics (2021)
> >> +* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graph=
ic-stack-an-overview>`_ - Nathan Gau=C3=ABr (2017)
> >> +* `The DRM/KMS subsystem from a newbie=E2=80=99s point of view <https=
://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-km=
s.pdf>`_ - Boris Brezillon (2014)
> >> +* `A brief introduction to the Linux graphics stack <https://blogs.ig=
alia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack=
/>`_ - Iago Toral (2014)
> >> +* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-lin=
ux-graphics-stack/>`_ - Jasper St. Pierre (2012) =20
> >=20
> > That's an impressive list of links!
> >=20
> > However, given the discussions that prompted this doc, I think the gist
> > is missing. The reader is just flooded with stuff to read and learn
> > which can be discouraging.
> >=20
> > Your audience are developers who know nothing about DRM. They may have
> > been writing fb drivers instead. The display hardware they want to
> > drive has no GPU. Where should they get started? Which presentations to
> > read/watch first? Which driver to look at for a simple example?
> >=20
> > Maybe add one more section targeting that specific audience?
> > =20
>=20
> Yes, I did not ignore your suggestions made over IRC but it's just that I
> didn't know to write such section. Maybe we can land this section and then
> as a follow-up think how a "Getting started" one should look like ?

I can't write such a section myself either, and reviewing one I
wouldn't be able to say if it covers everything needed but no more.

Fine by me! FW I'm W here

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/aEfNa3QiiQB=Kl4BoRB=JI=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmHyfYcACgkQI1/ltBGq
qqeLQBAAhsB5Rz0x/gq4Utp0S71M2ZTdBQLNdE29RK7Jl/Nb0tc5KxnTV0XXIqNr
5ZPetiSsNMg+rYIz/JS2B8/zxPRAEnNG8jXiT7dDYzIeX/CkiDJWLIj+PJ9/2D7z
JXtSwbOkySLaXcFH+Dyecv9zikwamQUjhcFbj7NjeNRpHopG1whZDtkjZC7bESAg
OU8Q+JSSE8E4x6qflQq/exrDVXQnzWccpapVTtT1uo0NOUT1FbjF83Z9KS1M1+I4
4lbfuxNgB4Bpq5udvuAg5ypON567ewffGpfMHbeVcLplMc2XVB9aPJl70x6wORaN
mIUmcd2Js8UNApSkG+Jd+2oqtQG71G9fQ3qav61Ac6/k474OgzjpmbNArIhlWVbl
MndqP4C1n2YMBfhfHtN/hnj0wdQIdK4rr4ugeXztPAtdNhdDTF+rsMrJJc2+9KXk
04qEY2LMKw8c1PpEfLSpOb7pqOSzwlfWP2i5Pu9NVmvR2gpnNrpFo/WlJkm7eOix
k6POJIoTh0VE37lBebuGsiDAx4ZU6VGD2PGJL2HMCOmjgZe6BEe4DBO58fXF8Aam
p2C2nYziyVHTkQbirOOmK/HBdshBh+khVjAJkNy63IQ9mbLGMH1aFjk6oDEt9XXO
kV3XxehxiNSAbucTo/hdP3Pw+rcme8sn4a3YJYQfmpKybfKpj0E=
=Lacg
-----END PGP SIGNATURE-----

--Sig_/aEfNa3QiiQB=Kl4BoRB=JI=--
