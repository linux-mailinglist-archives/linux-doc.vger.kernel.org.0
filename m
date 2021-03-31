Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3845348888
	for <lists+linux-doc@lfdr.de>; Thu, 25 Mar 2021 06:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhCYF0h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Mar 2021 01:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhCYF0X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 01:26:23 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCC2C0613DF
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 22:26:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r20so1569278ljk.4
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 22:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gFsXQtNcZc/jzBbc3KmHaNr8LuwlVaIo4tkNpXAhMCs=;
        b=szUldggyNmVjxsrrTtlWnMRQPOMVT8cZCe5n98DB5e4AYjxCy/yawxRJYDhyjY6/HE
         1zdQ2jBG3uJUxf4XjRDqgsZIjI/Zywasn9xRPTjryeG8OKkMdPujkQO4GFwQN4oyDFi6
         o57TGNrEaoTRteOJ6W5ldogRM9nWPaTOxIpCyMiGsYB8nmVZ958quD6y0y3tWN2xtN0c
         Ge2a1/y1yT3tD/qpV4vaIPTb089AVGdNEmBZ+xYZbA6zlapEXrvicmkhwUq7rM2dV1Vk
         WnJ0YkTAlZVUzS3v5UkNOVRB6pTUtTAfpkqRIU76j8laN1/2CsRpNb8bW/Wr7tYlHzBj
         l/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gFsXQtNcZc/jzBbc3KmHaNr8LuwlVaIo4tkNpXAhMCs=;
        b=lj/mfy8KFOAp/xUt6tKAHwa9wDjD8R8FDHdfMvn+Md6qmbscS8Jo7MwzWa6N7ZV/eh
         u7ZecEKTf0POU1KJWwbHLPRMwLAJfriURSvqflm38SBnKDmYAYb6AaV1smmRzmta3svs
         I2CmXl8D4FtbLYX4Ei7xnOZ5i7nEp475qU6jwst4r1eQS+Z91FlOEOeRGLQP7hCHQ0W+
         7vAtWGHCQkSD0Pjf3IJSj9bhAuLmudrXE2A8s/BRGc/cEGX+bdi8G7ezqKfAe3RInz2r
         iYRt1rrGBhKwyUavGK+7sXNb5sd1e+ec5S3TIv/o6ITdp3Is0rrZcek7UGob6Wte8HQB
         5lvA==
X-Gm-Message-State: AOAM531SEFbaPIErHsekqIQvjQqofqg+WBTiBe3J+SjMMieXK9qPU2F2
        prkn43ZnpuZHAgz495qllXZXOY1J6Bw8SKrQ+xXkpw==
X-Google-Smtp-Source: ABdhPJw0lZa1dN3iWsOiL7ok+NZMNVuTQq5qAq6ImnOTO2jdiouw6uWhb1mTAuET6Lx9AmotH317Ob91LGw7g0Kt1wE=
X-Received: by 2002:a05:651c:481:: with SMTP id s1mr4183162ljc.152.1616649979216;
 Wed, 24 Mar 2021 22:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.56fff82362af6228372ea82e6bd7e586e23f0966.1615914058.git-series.a.fatoum@pengutronix.de>
 <319e558e1bd19b80ad6447c167a2c3942bdafea2.1615914058.git-series.a.fatoum@pengutronix.de>
 <01e6e13d-2968-0aa5-c4c8-7458b7bde462@nxp.com> <45a9e159-2dcb-85bf-02bd-2993d50b5748@pengutronix.de>
 <f9c0087d299be1b9b91b242f41ac6ef7b9ee3ef7.camel@linux.ibm.com>
 <63dd7d4b-4729-9e03-cd8f-956b94eab0d9@pengutronix.de> <CAFA6WYOw_mQwOUN=onhzb7zCTyYDBrcx0E7C3LRk6nPLAVCWEQ@mail.gmail.com>
 <557b92d2-f3b8-d136-7431-419429f0e059@pengutronix.de>
In-Reply-To: <557b92d2-f3b8-d136-7431-419429f0e059@pengutronix.de>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 25 Mar 2021 10:56:07 +0530
Message-ID: <CAFA6WYNE44=Y7Erfc-xNtOrf7TkJjh+odmYH5vzhEHR6KqBfeQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] KEYS: trusted: Introduce support for NXP
 CAAM-based trusted keys
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Bottomley <jejb@linux.ibm.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Agarwal <udit.agarwal@nxp.com>,
        Jan Luebbe <j.luebbe@pengutronix.de>,
        David Gstir <david@sigma-star.at>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 24 Mar 2021 at 19:37, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Sumit,
>
> On 24.03.21 11:47, Sumit Garg wrote:
> > On Wed, 24 Mar 2021 at 14:56, Ahmad Fatoum <a.fatoum@pengutronix.de> wr=
ote:
> >>
> >> Hello Mimi,
> >>
> >> On 23.03.21 19:07, Mimi Zohar wrote:
> >>> On Tue, 2021-03-23 at 17:35 +0100, Ahmad Fatoum wrote:
> >>>> On 21.03.21 21:48, Horia Geant=C4=83 wrote:
> >>>>> caam has random number generation capabilities, so it's worth using=
 that
> >>>>> by implementing .get_random.
> >>>>
> >>>> If the CAAM HWRNG is already seeding the kernel RNG, why not use the=
 kernel's?
> >>>>
> >>>> Makes for less code duplication IMO.
> >>>
> >>> Using kernel RNG, in general, for trusted keys has been discussed
> >>> before.   Please refer to Dave Safford's detailed explanation for not
> >>> using it [1].
> >>
> >> The argument seems to boil down to:
> >>
> >>  - TPM RNG are known to be of good quality
> >>  - Trusted keys always used it so far
> >>
> >> Both are fine by me for TPMs, but the CAAM backend is new code and nei=
ther point
> >> really applies.
> >>
> >> get_random_bytes_wait is already used for generating key material else=
where.
> >> Why shouldn't new trusted key backends be able to do the same thing?
> >>
> >
> > Please refer to documented trusted keys behaviour here [1]. New
> > trusted key backends should align to this behaviour and in your case
> > CAAM offers HWRNG so we should be better using that.
>
> Why is it better?
>
> Can you explain what benefit a CAAM user would have if the trusted key
> randomness comes directly out of the CAAM instead of indirectly from
> the kernel entropy pool that is seeded by it?

IMO, user trust in case of trusted keys comes from trusted keys
backend which is CAAM here. If a user doesn't trust that CAAM would
act as a reliable source for RNG then CAAM shouldn't be used as a
trust source in the first place.

And I think building user's trust for kernel RNG implementation with
multiple entropy contributions is pretty difficult when compared with
CAAM HWRNG implementation.

-Sumit

>
> > Also, do update documentation corresponding to CAAM as a trusted keys b=
ackend.
>
> Yes. The documentation should be updated for CAAM and it should describe
> how the key material is derived. Will do so for v2.
>
> Cheers,
> Ahmad
>
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.=
git/tree/Documentation/security/keys/trusted-encrypted.rst#n87
> >
> > -Sumit
> >
> >> Cheers,
> >> Ahmad
> >>
> >>>
> >>> thanks,
> >>>
> >>> Mimi
> >>>
> >>> [1]
> >>> https://lore.kernel.org/linux-integrity/BCA04D5D9A3B764C9B7405BBA4D4A=
3C035F2A38B@ALPMBAPA12.e2k.ad.ge.com/
> >>>
> >>>
> >>>
> >>
> >> --
> >> Pengutronix e.K.                           |                          =
   |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de=
/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0 =
   |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-55=
55 |
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
