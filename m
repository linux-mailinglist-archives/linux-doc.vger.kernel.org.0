Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605D86A762C
	for <lists+linux-doc@lfdr.de>; Wed,  1 Mar 2023 22:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjCAVbT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 16:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCAVbS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 16:31:18 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C8451F84
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 13:31:16 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a32so632557ljr.9
        for <linux-doc@vger.kernel.org>; Wed, 01 Mar 2023 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1677706274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO9u8Y9aCl3r3Q/aM+pDkXOYi2YlGs7AHUhcyE2n2LY=;
        b=a9nHs6kSXWVgIl5oXYw2ESLt4jjTbPTVaUPLY4bwiIKzlL3BRCcc6btqbMcVuIeW0m
         OaXbVQnUkn4Kn5iviM5qK9E5zlPYPH4pUT3dO0PXPPZfCFnbR6AgyIMNhDUDsTmP9h68
         4OrComDjpKwoDUeG63K5E5OB9K16LZzLZPtXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677706274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO9u8Y9aCl3r3Q/aM+pDkXOYi2YlGs7AHUhcyE2n2LY=;
        b=YlqhrC1AjMUXqZW4O7fs271TH7SOYR73t/UUHi/Bo/+KFqtDaFzYaKrfi8XtDclNRd
         /gDhaLye8/eteW438FdyVRCanYdHO3WyBfFkvvSrPQhpXGtyupWFI6TddwIl4L68Ddw+
         hc92y03Z0/ZdA2QooSdcb8wxYgTjvLAxWgZ4Y/o+FwCZb6yP68Sr5gLnGz1/bXMqETdt
         j4OGYAwpxPinXaX0W/vUeDQjt47/YB0QTyNqdqUithfye2rFp4nImKmeLZ8bt8KLCP6Z
         DbQLLCH3K+bDanLRyN6RtAxyifDLUx0pogoemNanhl1FalshocvYsIEFKkinmIL1BqVM
         ntmw==
X-Gm-Message-State: AO0yUKXXvJ9eFcUrzmKXsL/fMpBfupwE6TMJnLVaNDee7e5BZ9do0K8N
        HciKJ+OH3q6bA0o61RQ+zRqnypyDcPuKPVBtUtwJLw==
X-Google-Smtp-Source: AK7set9Tm1EDlxHZBroReRahXqjqtSYLr7qj1vqPncn5dhoSh7r0awu49+RC5nrhdI7rVsydMc8y1qKFWfcNEkcTR6M=
X-Received: by 2002:a05:651c:231b:b0:293:2d18:36a0 with SMTP id
 bi27-20020a05651c231b00b002932d1836a0mr2531588ljb.3.1677706274370; Wed, 01
 Mar 2023 13:31:14 -0800 (PST)
MIME-Version: 1.0
References: <Y/z0fHHYdxEXcWMT@pc636> <7EBE4F51-F2BD-4B42-AFC1-CA234E78CC7B@joelfernandes.org>
 <Y/z9Its1RKetIr8V@pc636> <CAEXW_YSjT_orp8TbomBFU+ETS7YJ7TrbHTdrsBRTzCKG5_SBdw@mail.gmail.com>
 <20230227230502.GJ2948950@paulmck-ThinkPad-P17-Gen-1> <Y/0/dnmIk508sidK@lothringen>
 <Y/1ZMXsNZtwYPJNW@google.com> <Y/3fxLXbfvnLFEZq@lothringen>
 <Y/5fXskgrQxzbt0U@google.com> <Y/+HPrU/ofFXapHM@lothringen>
In-Reply-To: <Y/+HPrU/ofFXapHM@lothringen>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 1 Mar 2023 16:31:01 -0500
Message-ID: <CAEXW_YTt=VZ8ZMptccFMStsQvfjy5yMbd5Ah3KL=PUB4YVSTCg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] rcu: Add a minimum time for marking boot as completed
To:     Frederic Weisbecker <frederic@kernel.org>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, linux-kernel@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 1, 2023 at 12:11=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
[...]
> > Hmmm I see what you mean, so a conservative and configurable "fail-safe=
"
> > timeout followed by sysctl to end the boot earlier than the timeout, sh=
ould
> > do it (something like 30 seconds IMHO sounds reasonable)? In any case,
> > whatever way we go, we would not end the kernel boot before
> > rcu_end_inkernel_boot() is called at least once (which is the current
> > behavior).
> >
> > So it would be:
> >
> >   low level boot + initcalls
> >        20 sec                         30 second timeout
> > |------------------------------|--------------------------
> >                                |                         |
> >               old rcu_end_inkernel_boot()      new rcu_end_inkernel_boo=
t()
> >
> > But it could be, if user decides:
> >   low level boot + initcalls
> >        20 sec                         10 second timeout
> > |------------------------------|--------------------------
> >                                |                         |
> >               old rcu_end_inkernel_boot()      new rcu_end_inkernel_boo=
t()
> >                                                via /sys/ entry.
>
> The problem I have with a random default timeout is that it may break sen=
sitive
> workloads. If the default is 30 and say the boot only takes 5 seconds and
> immediately launches a latency sensitive task, this may break things in a
> subtle way during these 25 seconds when it usually didn't. Because expedi=
ted
> RCU is a hammer interrupting all non-idle CPUs.
>
> Until now forcing expedited RCU was only performed before any user code. =
Now it
> crosses the boundary so better be careful. I'd personally advocate for ke=
eping
> the current call before init is launched. Then provide an end_boot_sysctl=
 kernel
> boot parameter that will ignore the current call before init and let the =
user
> signal that through sysctl.

Considering that the PREEMPT-RT system benefits from it within the 8
seconds, I will go ahead make the default 15 seconds or so and make it
tunable. Hopefully that will be an acceptable compromise, with
sufficient documentation, changelog, and so forth... If you agree I'd
appreciate your Ack on the next posting.

> > > > > So shouldn't we disable lazy callbacks by default when CONFIG_RCU=
_LAZY=3Dy and then
> > > > > turn it on with "sysctl kernel.rcu.lazy=3D1" only whenever usersp=
ace feels ready
> > > > > about it? We can still keep the current call to rcu_end_inkernel_=
boot().
> > > >
> > > > Hmm IMHO that would add more knobs for not much reason honestly. We=
 already
> > > > have CONFIG_RCU_LAZY default disabled, I really don't want to add m=
ore
> > > > dependency (like user enables the config and does not see laziness)=
.
> > >
> > > I don't know. Like I said, different problems, different solutions. L=
et's
> > > identify what the issue is precisely. For example can we expect that =
the issues
> > > on boot can be a problem also on some temporary workloads?
> > >
> > > Besides I'm currently testing a very hacky flavour of rcu_lazy and so=
 far it
> > > shows many idle calls that would have been delayed if callbacks weren=
't queued
> > > as lazy.
> >
> > Can you provide more details? What kind of hack flavor, and what is it =
doing?
>
> Sorry, I meant a hacky implementation of lazy to work with !NOCB.

Interesting, I'm curious which calls those are and if they should also
be call_rcu_hurry().

 - Joel
