Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9C86D27E7
	for <lists+linux-doc@lfdr.de>; Fri, 31 Mar 2023 20:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCaSfy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 31 Mar 2023 14:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbjCaSfv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 14:35:51 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F972369F
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 11:35:48 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id y85so10072672iof.13
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680287748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmSr2mixE9OAle9JozsvZ/XkRcEfDWZt67peW8UYerg=;
        b=VVBGsPPlZdR8BQ7P87vsWIHRuU9a7wxAqa6EHBs1WvwDa9zmi2cIoez2NQ6szIcW9Y
         05KWqQG9312BRSOazppgm1UoIGpcwlHnjX3PBlpRSWIJNcge/qKWxvX62Tix0kG+k1hP
         KG0rfkit7zQrnAqwjTcaXZwh5aGBIecc9jWqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680287748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmSr2mixE9OAle9JozsvZ/XkRcEfDWZt67peW8UYerg=;
        b=aEQZIObv2Qq3yjrQBndaqg/ohcz36dIlhrzmbeVrLQE5LY+o/fU/djXqO8w0keDupb
         LkmbCv/3qzplSEn4BWV3NOlvzZ8FCMIZ9feKGi3V8+w9Lm05ykzf86iB045+cH3VzSjZ
         z33pxcNA6kwpT0xEHsyUK7h/31/KH+ZnKPlRkdEfm+i6DZDrNs/BYyuVRv/y7SpnzSXM
         S8sglZyQn933nMF442A4OVfV77oOlH7hliaWK8/xQWbpTYLfhAT4MluHxMILfdvk8Yzx
         UKCwLihmuofWPlWWR2qdcz+kPDBx0afCtwragVQ1V1HReQZ3kgiP5eqP/hLfHuNI0Myw
         9F+w==
X-Gm-Message-State: AO0yUKUuqayL438MO0BroKEKZLcQ+ucAEDqV/u7zMKzDBb0WJCmOyNOJ
        Oe23pKQ67szXgT2B41AeWknnMCpviGAnba3lPobHUw==
X-Google-Smtp-Source: AK7set9khoSxfk6M3llLg8sU+d91Dc+STpvO6RqkPAgHDCB5skFphu0j1rWv9ded651LcGl8PkY9Lw==
X-Received: by 2002:a5e:a913:0:b0:759:7d4:c64c with SMTP id c19-20020a5ea913000000b0075907d4c64cmr19806180iod.21.1680287747966;
        Fri, 31 Mar 2023 11:35:47 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id s21-20020a5eaa15000000b00752f62cd3bdsm727533ioe.12.2023.03.31.11.35.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 11:35:47 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-322fc56a20eso564885ab.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 11:35:47 -0700 (PDT)
X-Received: by 2002:a92:cd8f:0:b0:315:6243:9a7b with SMTP id
 r15-20020a92cd8f000000b0031562439a7bmr20740ilb.10.1680287746579; Fri, 31 Mar
 2023 11:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230327093538.v12.1.I8e7f9b01d9ac940507d78e15368e200a6a69bedb@changeid>
 <ZCQAUukSQlwXLRfP@debian.me>
In-Reply-To: <ZCQAUukSQlwXLRfP@debian.me>
From:   Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Fri, 31 Mar 2023 11:35:35 -0700
X-Gmail-Original-Message-ID: <CA+ddPcN3=H3xZnSJXKRXjDHY9CpT6aWWkFfTH9Ofxtv8WZwX6Q@mail.gmail.com>
Message-ID: <CA+ddPcN3=H3xZnSJXKRXjDHY9CpT6aWWkFfTH9Ofxtv8WZwX6Q@mail.gmail.com>
Subject: Re: [PATCH v12] tee: optee: Add SMC for loading OP-TEE image
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     op-tee@lists.trustedfirmware.org,
        Sumit Garg <sumit.garg@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks, new patch uploaded with these formatting changes done.


On Wed, Mar 29, 2023 at 2:09=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Mon, Mar 27, 2023 at 09:35:53AM -0700, Jeffrey Kardatzke wrote:
> > Adds an SMC call that will pass an OP-TEE binary image to EL3 and
> > instruct it to load it as the BL32 payload. This works in conjunction
> > with a feature added to Trusted Firmware for ARMv8 and above
> > architectures that supports this.
> >
> > The main purpose of this change is to facilitate updating the OP-TEE
> > component on devices via a rootfs change rather than having to do a
> > firmware update. Further details are linked to in the Kconfig file.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@chromium.org>
> > Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > ---
> >
> > Changes in v12:
> > - Fixed checkpatch strict issues
> >
> > Changes in v11:
> > - Fixed typo in tee.rst documentation
> >
> > Changes in v10:
> > - Fixed tee.rst documentation formatting
> >
> > Changes in v9:
> > - Add CPU hotplug callback to init on all cores at startup
> >
> > Changes in v8:
> > - Renamed params and fixed alignment issue
> >
> > Changes in v7:
> > - Added documentation to Documentation/staging/tee.rst
> >
> > Changes in v6:
> > - Expanded Kconfig documentation
> >
> > Changes in v5:
> > - Renamed config option
> > - Added runtime warning when config is used
> >
> > Changes in v4:
> > - Update commit message
> > - Added more documentation
> > - Renamed config option, added ARM64 dependency
> >
> > Changes in v3:
> > - Removed state tracking for driver reload
> > - Check UID of service to verify it needs image load
> >
> > Changes in v2:
> > - Fixed compile issue when feature is disabled
> > - Addressed minor comments
> > - Added state tracking for driver reload
> >
> >  Documentation/staging/tee.rst |  41 ++++++++++
> >  drivers/tee/optee/Kconfig     |  17 +++++
> >  drivers/tee/optee/optee_msg.h |  12 +++
> >  drivers/tee/optee/optee_smc.h |  24 ++++++
> >  drivers/tee/optee/smc_abi.c   | 137 ++++++++++++++++++++++++++++++++++
> >  5 files changed, 231 insertions(+)
> >
> > diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.=
rst
> > index 498343c7ab08..b11e9053bc99 100644
> > --- a/Documentation/staging/tee.rst
> > +++ b/Documentation/staging/tee.rst
> > @@ -214,6 +214,47 @@ call is done from the thread assisting the interru=
pt handler. This is a
> >  building block for OP-TEE OS in secure world to implement the top half=
 and
> >  bottom half style of device drivers.
> >
> > +OPTEE_INSECURE_LOAD_IMAGE Kconfig option
> > +----------------------------------------
> > +
> > +The OPTEE_INSECURE_LOAD_IMAGE Kconfig option enables the ability to lo=
ad the
> > +BL32 OP-TEE image from the kernel after the kernel boots, rather than =
loading
> > +it from the firmware before the kernel boots. This also requires enabl=
ing the
> > +corresponding option in Trusted Firmware for Arm. The documentation th=
ere
> > +explains the security threat associated with enabling this as well as
> > +mitigations at the firmware and platform level.
> > +https://trustedfirmware-a.readthedocs.io/en/latest/threat_model/threat=
_model.html
>
> For consistency to the rest of doc, the reference link should be put
> separately in "References" section:
>
> ---- >8 ----
> diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rs=
t
> index b11e9053bc9934..97758855156aa6 100644
> --- a/Documentation/staging/tee.rst
> +++ b/Documentation/staging/tee.rst
> @@ -220,10 +220,9 @@ OPTEE_INSECURE_LOAD_IMAGE Kconfig option
>  The OPTEE_INSECURE_LOAD_IMAGE Kconfig option enables the ability to load=
 the
>  BL32 OP-TEE image from the kernel after the kernel boots, rather than lo=
ading
>  it from the firmware before the kernel boots. This also requires enablin=
g the
> -corresponding option in Trusted Firmware for Arm. The documentation ther=
e
> -explains the security threat associated with enabling this as well as
> -mitigations at the firmware and platform level.
> -https://trustedfirmware-a.readthedocs.io/en/latest/threat_model/threat_m=
odel.html
> +corresponding option in Trusted Firmware for Arm. The Trusted Firmare
> +documentation [8] explains the security threat associated with enabling =
this as
> +well as mitigations at the firmware and platform level.
>
>  There are additional attack vectors/mitigations for the kernel that shou=
ld be
>  addressed when using this option.
> @@ -350,3 +349,5 @@ References
>  [6] include/linux/psp-tee.h
>
>  [7] drivers/tee/amdtee/amdtee_if.h
> +
> +[8] https://trustedfirmware-a.readthedocs.io/en/latest/threat_model/thre=
at_model.html
>
> > +
> > +There are additional attack vectors/mitigations for the kernel that sh=
ould be
> > +addressed when using this option.
> > +
> > +1. Boot chain security.
> > +   Attack vector: Replace the OP-TEE OS image in the rootfs to gain co=
ntrol of
> > +   the system.
> > +   Mitigation: There must be boot chain security that verifies the ker=
nel and
> > +   rootfs, otherwise an attacker can modify the loaded OP-TEE binary b=
y
> > +   modifying it in the rootfs.
> > +2. Alternate boot modes.
> > +   Attack vector: Using an alternate boot mode (i.e. recovery mode), t=
he OP-TEE
> > +   driver isn't loaded, leaving the SMC hole open.
> > +   Mitigation: If there are alternate methods of booting the device, s=
uch as a
> > +   recovery mode, it should be ensured that the same mitigations are a=
pplied in
> > +   that mode.
> > +3. Attacks prior to SMC invocation.
> > +   Attack vector: Code that is executed prior to issuing the SMC call =
to load
> > +   OP-TEE can be exploited to then load an alternate OS image.
> > +   Mitigation: The OP-TEE driver must be loaded before any potential a=
ttack
> > +   vectors are opened up. This should include mounting of any modifiab=
le
> > +   filesystems, opening of network ports or communicating with externa=
l devices
> > +   (e.g. USB).
> > +4. Blocking SMC call to load OP-TEE.
> > +   Attack vector: Prevent the driver from being probed, so the SMC cal=
l to load
> > +   OP-TEE isn't executed when desired, leaving it open to being execut=
ed later
> > +   and loading a modified OS.
> > +   Mitigation: It is recommended to build the OP-TEE driver as an incl=
uded
> > +   driver rather than a module to prevent exploits that may cause the =
module to
> > +   not be loaded.
> > +
>
> I think attack vectors and mitigations can be sub bullets:
>
> ---- >8 ----
> diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rs=
t
> index 97758855156aa6..b17eb9772230db 100644
> --- a/Documentation/staging/tee.rst
> +++ b/Documentation/staging/tee.rst
> @@ -228,31 +228,41 @@ There are additional attack vectors/mitigations for=
 the kernel that should be
>  addressed when using this option.
>
>  1. Boot chain security.
> -   Attack vector: Replace the OP-TEE OS image in the rootfs to gain cont=
rol of
> -   the system.
> -   Mitigation: There must be boot chain security that verifies the kerne=
l and
> -   rootfs, otherwise an attacker can modify the loaded OP-TEE binary by
> -   modifying it in the rootfs.
> +
> +   * Attack vector: Replace the OP-TEE OS image in the rootfs to gain co=
ntrol of
> +     the system.
> +
> +   * Mitigation: There must be boot chain security that verifies the ker=
nel and
> +     rootfs, otherwise an attacker can modify the loaded OP-TEE binary b=
y
> +     modifying it in the rootfs.
>  2. Alternate boot modes.
> -   Attack vector: Using an alternate boot mode (i.e. recovery mode), the=
 OP-TEE
> -   driver isn't loaded, leaving the SMC hole open.
> -   Mitigation: If there are alternate methods of booting the device, suc=
h as a
> -   recovery mode, it should be ensured that the same mitigations are app=
lied in
> -   that mode.
> +
> +   * Attack vector: Using an alternate boot mode (i.e. recovery mode), t=
he
> +     OP-TEE driver isn't loaded, leaving the SMC hole open.
> +
> +   * Mitigation: If there are alternate methods of booting the device, s=
uch as
> +     a recovery mode, it should be ensured that the same mitigations are
> +     applied in that mode.
> +
>  3. Attacks prior to SMC invocation.
> -   Attack vector: Code that is executed prior to issuing the SMC call to=
 load
> -   OP-TEE can be exploited to then load an alternate OS image.
> -   Mitigation: The OP-TEE driver must be loaded before any potential att=
ack
> -   vectors are opened up. This should include mounting of any modifiable
> -   filesystems, opening of network ports or communicating with external =
devices
> -   (e.g. USB).
> +
> +   * Attack vector: Code that is executed prior to issuing the SMC call =
to load
> +     OP-TEE can be exploited to then load an alternate OS image.
> +
> +   * Mitigation: The OP-TEE driver must be loaded before any potential a=
ttack
> +     vectors are opened up. This should include mounting of any modifiab=
le
> +     filesystems, opening of network ports or communicating with externa=
l
> +     devices (e.g. USB).
> +
>  4. Blocking SMC call to load OP-TEE.
> -   Attack vector: Prevent the driver from being probed, so the SMC call =
to load
> -   OP-TEE isn't executed when desired, leaving it open to being executed=
 later
> -   and loading a modified OS.
> -   Mitigation: It is recommended to build the OP-TEE driver as an includ=
ed
> -   driver rather than a module to prevent exploits that may cause the mo=
dule to
> -   not be loaded.
> +
> +   * Attack vector: Prevent the driver from being probed, so the SMC cal=
l to
> +     load OP-TEE isn't executed when desired, leaving it open to being e=
xecuted
> +     later and loading a modified OS.
> +
> +   * Mitigation: It is recommended to build the OP-TEE driver as builtin
> +     driver rather than as a module to prevent exploits that may cause t=
he
> +     module to not be loaded.
>
>  AMD-TEE driver
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Or due to tabular nature of additional attacks list above, reST tables
> should fit.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
