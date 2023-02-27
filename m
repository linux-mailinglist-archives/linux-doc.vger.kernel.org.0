Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51F06A45BB
	for <lists+linux-doc@lfdr.de>; Mon, 27 Feb 2023 16:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjB0PRM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Feb 2023 10:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjB0PRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 10:17:11 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01862227BD
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 07:17:04 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id g18so4688111ljl.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKXLlaaemAVoYCtT3ySmIHO9PjdJ01/BFhW7YVvSoM8=;
        b=tWQczuPkY/15I3k6zvkILjtXUbKLHrv3j2r43OOp8wZIaG0eMPeM2wPZWOqsrkT7bT
         55RvlShsM5dezLGOdIdCZ0NnwBh3doY38KvBG4I6xV4ui3VeOsk94cpFihkWJginUIAh
         ACqYOVmgYOCbLj4dcmaAaOhVOcGYU4xNR8x84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKXLlaaemAVoYCtT3ySmIHO9PjdJ01/BFhW7YVvSoM8=;
        b=KfS5DLQVch+mieGrV4+XasliLGWTiuGQatWt/RYdqggCgr1YMq0nSgjGnTH6AKXbpz
         0TrwAhcdXpuOFES3cyfCL8ewsCUU4olWF+cprSAlJR37l0uYTl0HKnOjSpspoMiaQV2q
         UCslc0o7NVVBHnYlyZl288uVVm/wne0nz0qUCXGMgnJZkdqPYOxH4YJUVg/bkZROoZEz
         ce7C9whlIaXQ6G2uSqVBl7X0kZS3gTgumktUKw9wOsXwiJUyHMi5N5tXRSlKkONruA25
         PGXgMxDf1Oso6rdtXDIPuVC/kr7XzCspkY3CuNAkKQe5QZ8ULwQJ0MTFng3ZW7WGUgAC
         ZKlg==
X-Gm-Message-State: AO0yUKU3rltMPQzzc1VtV9wYC7z6Mm0dvBu6ycy443tCHxvaXnFd/8aK
        1YIjLNZrDQ1hlyYiz5osm/yUx4728103UI1ZCWmFGQ==
X-Google-Smtp-Source: AK7set+RwGX8fRfBMoaZ6SngOAjLmc5OMCM1wZt5sL+MdRDu0LU5qryx/iLx5I6QBV7IlDEjZ1duazsyinIxvm4btz8=
X-Received: by 2002:a2e:a275:0:b0:294:6de5:e642 with SMTP id
 k21-20020a2ea275000000b002946de5e642mr7481676ljm.3.1677511023217; Mon, 27 Feb
 2023 07:17:03 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR11MB617175CA398D425B7489CE4889AF9@IA1PR11MB6171.namprd11.prod.outlook.com>
 <764CA486-6FB2-4667-B8CB-56E3AC31FD58@joelfernandes.org> <20230227145544.GC2948950@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20230227145544.GC2948950@paulmck-ThinkPad-P17-Gen-1>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Mon, 27 Feb 2023 10:16:51 -0500
Message-ID: <CAEXW_YSVm7fjJaX=AT-Yg70wXL-_1RxoVPfzN8M8zJAkc0um3g@mail.gmail.com>
Subject: Re: [PATCH RFC v2] rcu: Add a minimum time for marking boot as completed
To:     paulmck@kernel.org
Cc:     "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, linux-kernel@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 27, 2023 at 9:55 AM Paul E. McKenney <paulmck@kernel.org> wrote=
:
>
> On Mon, Feb 27, 2023 at 08:22:06AM -0500, Joel Fernandes wrote:
> >
> >
> > > On Feb 27, 2023, at 2:53 AM, Zhuo, Qiuxu <qiuxu.zhuo@intel.com> wrote=
:
> > >
> > > =EF=BB=BF
> > >>
> > >> From: Joel Fernandes (Google) <joel@joelfernandes.org>
> > >> Sent: Saturday, February 25, 2023 11:34 AM
> > >> To: linux-kernel@vger.kernel.org
> > >> Cc: Joel Fernandes (Google) <joel@joelfernandes.org>; Frederic Weisb=
ecker
> > >> <frederic@kernel.org>; Lai Jiangshan <jiangshanlai@gmail.com>; linux=
-
> > >> doc@vger.kernel.org; Paul E. McKenney <paulmck@kernel.org>;
> > >> rcu@vger.kernel.org
> > >> Subject: [PATCH RFC v2] rcu: Add a minimum time for marking boot as
> > >> completed
> > >>
> > >> On many systems, a great deal of boot happens after the kernel think=
s the
> > >> boot has completed. It is difficult to determine if the system has r=
eally
> > >> booted from the kernel side. Some features like lazy-RCU can risk sl=
owing
> > >> down boot time if, say, a callback has been added that the boot
> > >> synchronously depends on.
> > >>
> > >> Further, it is better to boot systems which pass 'rcu_normal_after_b=
oot' to
> > >> stay expedited for as long as the system is still booting.
> > >>
> > >> For these reasons, this commit adds a config option
> > >> 'CONFIG_RCU_BOOT_END_DELAY' and a boot parameter
> > >> rcupdate.boot_end_delay.
> > >>
> > >> By default, this value is 20s. A system designer can choose to speci=
fy a value
> > >> here to keep RCU from marking boot completion.  The boot sequence wi=
ll not
> > >> be marked ended until at least boot_end_delay milliseconds have pass=
ed.
> > >
> > > Hi Joel,
> > >
> > > Just some thoughts on the default value of 20s, correct me if I'm wro=
ng :-).
> > >
> > > Does the OS with CONFIG_PREEMPT_RT=3Dy kernel concern more about the
> > > real-time latency than the overall OS boot time?
> >
> > But every system has to boot, even an RT system.
> >
> > >
> > > If so, we might make rcupdate.boot_end_delay =3D 0 as the default val=
ue
> > > (NOT the default 20s) for CONFIG_PREEMPT_RT=3Dy kernels?
> >
> > Could you measure how much time your RT system takes to boot before the=
 application runs?
> >
> > I can change it to default 0 essentially NOOPing it, but I would rather=
 have a saner default (10 seconds even), than having someone forget to tune=
 this for their system.
>
> Provide a /sys location that the userspace code writes to when it
> is ready?  Different systems with different hardware and software
> configurations are going to take different amounts of time to boot,
> correct?

I could add a sysfs node, but I still wanted this patch as well
because I am wary of systems where yet more userspace changes are
required. I feel the kernel should itself be able to do this. Yes, it
is possible the system completes "booting" at a different time than
what the kernel thinks. But it does that anyway (even without this
patch), so I am not seeing a good reason to not do this in the kernel.
It is also only a minimum cap, so if the in-kernel boot takes too
long, then the patch will have no effect.

Thoughts?

thanks,

 - Joel
