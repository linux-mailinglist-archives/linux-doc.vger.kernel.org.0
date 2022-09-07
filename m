Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE235B0AFB
	for <lists+linux-doc@lfdr.de>; Wed,  7 Sep 2022 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiIGREs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Sep 2022 13:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiIGREp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Sep 2022 13:04:45 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AD118C
        for <linux-doc@vger.kernel.org>; Wed,  7 Sep 2022 10:04:41 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1278624b7c4so19359122fac.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Sep 2022 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ro6O+2s9xjG7/14chisnyJusofpe1P/Z+6Ni1HfLglw=;
        b=SFFia7VrpSfHHqK4+wrGcNeHGpCjolBliKK6r1h6XIGRo5GSXMMhxGqrAZd7h/1Z8I
         fZPHWdG3DVGVcrZh+RMzotY75nbYwZF3yvul2CYa8AlFvlyUYoinzuFbkei+E22aaGaF
         hAcyyxG/Z+aKkT3k0U/r3XrRUCZZbGhXiEzNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ro6O+2s9xjG7/14chisnyJusofpe1P/Z+6Ni1HfLglw=;
        b=KVbHOVcjccZqKAcUFNL5IAqYXl5ghET3QFSjHmqmhKmsX3mnohIMkVMzQkj5kS0mb5
         xxOz23S/viMLrZFWKAMnAro0wnV7fJckByx0X4oi2nBCZvHoYoO8Nb6Ujz97t5cdCJOi
         hAblP69gh4gfb41mR8zKtai3S2yS4cCBdCOA0bdKGpBOwfQ1YLmr9B9BFA3I2+cJDvlC
         hfCaulCB1aSUZwcBHxNFjfolzZ3tBfa15tFztVKlOXWVNI90+pS3uNcONmoNm+o24ocA
         hv6CaPMx57eV4Ol3J4uHJIwZoig8DenY5l2iXLROHcUrBZPMsdkUJxWfpmjJTYUGYS/V
         Bn4w==
X-Gm-Message-State: ACgBeo1Lny9m4mbKVoXr2Z/IVHqsvDevWTD0ZBVo3GgyZSxOewIByq7q
        sX8mVExxhQhShY+iEUrB0qzoooDRzVxFog==
X-Google-Smtp-Source: AA6agR4FkjgGqypwQsAGAKljOEPCRsPrErdX43149/Tc4LeOEOy+X3yXn4pC104wOUQITSh4BTalZw==
X-Received: by 2002:aca:2810:0:b0:344:e898:35aa with SMTP id 16-20020aca2810000000b00344e89835aamr12773184oix.279.1662570280756;
        Wed, 07 Sep 2022 10:04:40 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 188-20020a4a1dc5000000b0044565e7ab41sm5248904oog.32.2022.09.07.10.04.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 10:04:40 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1274ec87ad5so22692343fac.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Sep 2022 10:04:40 -0700 (PDT)
X-Received: by 2002:a05:6870:b28c:b0:127:ad43:573e with SMTP id
 c12-20020a056870b28c00b00127ad43573emr2505114oao.174.1662570269627; Wed, 07
 Sep 2022 10:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220823222526.1524851-1-evgreen@chromium.org> <e74a2c48-fd30-aa4c-9ab6-eafe652f7878@amd.com>
In-Reply-To: <e74a2c48-fd30-aa4c-9ab6-eafe652f7878@amd.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 7 Sep 2022 10:03:53 -0700
X-Gmail-Original-Message-ID: <CAE=gft6gjqhviovxQDY=qrBiKQH1RBkCd_f+pnNw4Tz=M0ewBg@mail.gmail.com>
Message-ID: <CAE=gft6gjqhviovxQDY=qrBiKQH1RBkCd_f+pnNw4Tz=M0ewBg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Encrypted Hibernation
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Jarkko Sakkinen <jarkko@kernel.org>, zohar@linux.ibm.com,
        linux-integrity@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        apronin@chromium.org, Daniil Lunev <dlunev@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Len Brown <len.brown@intel.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 31, 2022 at 11:35 AM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> On 8/23/2022 17:25, Evan Green wrote:
> > We are exploring enabling hibernation in some new scenarios. However,
> > our security team has a few requirements, listed below:
> > 1. The hibernate image must be encrypted with protection derived from
> >     both the platform (eg TPM) and user authentication data (eg
> >     password).
> > 2. Hibernation must not be a vector by which a malicious userspace can
> >     escalate to the kernel.
> >
> > Requirement #1 can be achieved solely with uswsusp, however requirement
> > 2 necessitates mechanisms in the kernel to guarantee integrity of the
> > hibernate image. The kernel needs a way to authenticate that it generated
> > the hibernate image being loaded, and that the image has not been tampered
> > with. Adding support for in-kernel AEAD encryption with a TPM-sealed key
> > allows us to achieve both requirements with a single computation pass.
> >
> > Matthew Garrett published a series [1] that aligns closely with this
> > goal. His series utilized the fact that PCR23 is a resettable PCR that
> > can be blocked from access by usermode. The TPM can create a sealed key
> > tied to PCR23 in two ways. First, the TPM can attest to the value of
> > PCR23 when the key was created, which the kernel can use on resume to
> > verify that the kernel must have created the key (since it is the only
> > one capable of modifying PCR23). It can also create a policy that enforces
> > PCR23 be set to a specific value as a condition of unsealing the key,
> > preventing usermode from unsealing the key by talking directly to the
> > TPM.
> >
> > This series adopts that primitive as a foundation, tweaking and building
> > on it a bit. Where Matthew's series used the TPM-backed key to encrypt a
> > hash of the image, this series uses the key directly as a gcm(aes)
> > encryption key, which the kernel uses to encrypt and decrypt the
> > hibernate image in chunks of 16 pages. This provides both encryption and
> > integrity, which turns out to be a noticeable performance improvement over
> > separate passes for encryption and hashing.
> >
> > The series also introduces the concept of mixing user key material into
> > the encryption key. This allows usermode to introduce key material
> > based on unspecified external authentication data (in our case derived
> > from something like the user password or PIN), without requiring
> > usermode to do a separate encryption pass.
> >
> > Matthew also documented issues his series had [2] related to generating
> > fake images by booting alternate kernels without the PCR23 limiting.
> > With access to PCR23 on the same machine, usermode can create fake
> > hibernate images that are indistinguishable to the new kernel from
> > genuine ones. His post outlines a solution that involves adding more
> > PCRs into the creation data and policy, with some gyrations to make this
> > work well on a standard PC.
> >
> > Our approach would be similar: on our machines PCR 0 indicates whether
> > the system is booted in secure/verified mode or developer mode. By
> > adding PCR0 to the policy, we can reject hibernate images made in
> > developer mode while in verified mode (or vice versa).
> >
> > Additionally, mixing in the user authentication data limits both
> > data exfiltration attacks (eg a stolen laptop) and forged hibernation
> > image attacks to attackers that already know the authentication data (eg
> > user's password). This, combined with our relatively sealed userspace
> > (dm-verity on the rootfs), and some judicious clearing of the hibernate
> > image (such as across an OS update) further reduce the risk of an online
> > attack. The remaining attack space of a forgery from someone with
> > physical access to the device and knowledge of the authentication data
> > is out of scope for us, given that flipping to developer mode or
> > reflashing RO firmware trivially achieves the same thing.
> >
> > A couple of patches still need to be written on top of this series. The
> > generalized functionality to OR in additional PCRs via Kconfig (like PCR
> > 0 or 5) still needs to be added. We'll also need a patch that disallows
> > unencrypted forms of resume from hibernation, to fully close the door
> > to malicious userspace. However, I wanted to get this series out first
> > and get reactions from upstream before continuing to add to it.
>
> Something else to think about in this series is what happens with
> `hibernation_available` in kernel/power/hibernate.c.  Currently if the
> system is locked down hibernate is disabled, but I would think that
> with a setup like that described here that should no longer be necessary.
>

Correct, I think that would be a reasonable followup to this series.

-Evan
