Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0C66E1480
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 20:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjDMSpx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 14:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjDMSpp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 14:45:45 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D6383EA
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 11:45:19 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54f6fc7943eso182084847b3.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1681411518; x=1684003518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGVZNEf7lrdlhRrTeBd55Bww7LzB9MuzQSkzPr2CJBo=;
        b=Mz//iVq0iLRUBDqdpSQTRzwsSpaxXCXjqS6RHv1d1VOHtRY8fs4AypBj+EWV7f0QYU
         37jxWb3BGNYK9Qk9NR+k2FL2bIBIdnvzdO3XHfdeFkDh0XDZVVqguEtOXVbFbz83aVMD
         ZWN44QC57IVfG7F5tkht1YHW4f90qGBMYyWldECPJcq0FCcywI8Di4pXvbGWTq2nKTTN
         id0/gUslCuCUKW4JYz3nLAh0/2bltS/FFpyoS0TxOkwoV+NWQsEb9C03CTMZWUp1nYuy
         2znjWxpwX+mJ7abVCJi+Ea3ISlkSjo51iqyzEbQVJqo43csY/pIyfSJJWoRdsVUmywn1
         pkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681411518; x=1684003518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGVZNEf7lrdlhRrTeBd55Bww7LzB9MuzQSkzPr2CJBo=;
        b=flTbSBQ+Zwqou2KpPABvURWLz7/he0AW/jCImBP5xUvBBmk+Yf3ZV95ruHGGV9guLY
         6EPuU57t4iAidfs51AfEVZfIOB3yV+eAMttPWtn3M8BVKJVO/djO1n/GO7D8O2VBGy4M
         9hoEDWt5/DlEK+rreWAEy6tEv5WmYt/R+Gm0l7qTgS0KvvbfW1Y9ZOUI63BvOqGpzpEv
         O82FWVZdPqoR4PeBw4okjA7bVXL7rPlZ1VgS5/fCvkGa5/UUIjn1aOS5BbzIAvuVEhKo
         kb4gE1aTGv11QuVrewhZfcLoxcBR3XhiGxykETVFeHX8Ox+bFq4j/TcPa9ii1hVRSJsJ
         UmJQ==
X-Gm-Message-State: AAQBX9doNvN/HWjm4igaI8pDrqNF3BNjjWjQYJZzpYOdd1viy8/6RPU3
        S6Ctu/fzNfCGp3o7SrtyHCFDUxZzjF9rMxytpOda
X-Google-Smtp-Source: AKy350ZSG4ZQ++QqMTXNV8xFD2qqYaKbcU1NDBLoxRwPk1AbUSa/40FcxEeI1OBDZ0AsmT83U2FNdY17CZtIHnOARvk=
X-Received: by 2002:a81:ad0e:0:b0:545:6106:5334 with SMTP id
 l14-20020a81ad0e000000b0054561065334mr2002041ywh.8.1681411517875; Thu, 13 Apr
 2023 11:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
 <20230410191035.GB18827@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhQDvWDshaZvJrHmjcwyHFxv9oYTN9bn0xiTtFZQRp+GPg@mail.gmail.com> <20230412233606.GA16658@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20230412233606.GA16658@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 13 Apr 2023 14:45:07 -0400
Message-ID: <CAHC9VhTs3Njfg=1baQ6=58rPLBmyB3cW0R-MfAaEcRF-jAaYBw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
To:     Fan Wu <wufan@linux.microsoft.com>
Cc:     corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org,
        serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org,
        axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
        eparis@redhat.com, linux-doc@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
        dm-devel@redhat.com, linux-audit@redhat.com,
        roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
        Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 12, 2023 at 7:36=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On Tue, Apr 11, 2023 at 05:45:41PM -0400, Paul Moore wrote:
> > On Mon, Apr 10, 2023 at 3:10???PM Fan Wu <wufan@linux.microsoft.com> wr=
ote:
> > > On Thu, Mar 02, 2023 at 02:04:42PM -0500, Paul Moore wrote:
> > > > On Mon, Jan 30, 2023 at 5:58???PM Fan Wu <wufan@linux.microsoft.com=
> wrote:

...

> > I guess this does make me wonder about keeping a non-active policy
> > loaded in the kernel, what purpose does that serve?
> >
>
> The non-active policy doesn't serve anything unless it is activated. User=
 can
> even delete a policy if that is no longer needed. Non-active is just the =
default
> state when a new policy is loaded.
>
> If IPE supports namespace, there is another use case where different cont=
ainers
> can select different policies as the active policy from among multiple lo=
aded
> policies. Deven has presented a demo of this during LSS 2021. But this go=
es
> beyond the scope of this version.

Do you plan to add namespace support at some point in the
not-too-distant future?  If so, I'm okay with keeping support for
multiple policies, but if you think you're only going to support one
active policy at a time, it might be better to remove support for
multiple (inactive) policies.

--=20
paul-moore.com
