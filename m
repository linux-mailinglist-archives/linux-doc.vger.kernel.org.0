Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3ADE523A88
	for <lists+linux-doc@lfdr.de>; Wed, 11 May 2022 18:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238423AbiEKQnr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 May 2022 12:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236666AbiEKQnq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 12:43:46 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1EB62BEC
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 09:43:42 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-d39f741ba0so3432514fac.13
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qv5UPaNLDRk7OZesf9/OmG2IAf7szhws6U9XAPIZMsU=;
        b=KHSscfX2VH88d4KZ8IH4882XNUx7gbxDp0H53sNZEcKHbBd0GlfHPCRJsWZAFSKulo
         Y+i6p6Jr8+ZVY45RCmnhekz9C/ttFtLh2dTnv4xa1Q+PpWB7Gsyuf6DhDmxbKtjc9JdO
         e2NW++2QKWi9+U6ubodpwq6eLTZOgqK/xZcJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qv5UPaNLDRk7OZesf9/OmG2IAf7szhws6U9XAPIZMsU=;
        b=Y20aXNTANVDAH0K8D12HnRyFT0sxln7I+HbhRBtT/WUSQWletnxSPNAsEImqL0LanO
         72Pe2JgULrPkSEvTcpslKkhgSLPEO9sssEMyD8nzvinzZ0CFSpnf4O647LAJTOgyuAQq
         TF9bnGsT2AysuZ12jh4rg/riQWzLwvi4uBXDfLj8zbzUYg9KhNZLVoPHc8y80vtBoSbi
         1Rx5d2sfYkf1KKllam4Bp4TDuAGJwou1USnS6qVj6HZnQ09hkKykFkLzlEiuTnhMw3DE
         ptDqiCKiykGBHm7Qt2EhhLIFH2qs2k3Y3why1ctYoNJYPNqlC6Mffi8LRDUolhSFZhCt
         151g==
X-Gm-Message-State: AOAM533szreHWK3vGsU7BmSjveODx+I/EcnBw4dzYpmKixyKZ/46L+Jc
        8TuLG8ho2FNYK5kHx8unFAYpepT924mFsRa8N5uJuw==
X-Google-Smtp-Source: ABdhPJy4VUawIZKr2RKSdWewGiu4eDM2uIznpYK2t+g0yjD/k1O8zxOEKSecLPlBSOajA0MocZ2fHlfSRQxeSPeybkM=
X-Received: by 2002:a05:6870:b4a2:b0:ee:326e:58fb with SMTP id
 y34-20020a056870b4a200b000ee326e58fbmr3261404oap.7.1652287420253; Wed, 11 May
 2022 09:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com> <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
 <YnujG0nkF0U6d5kd@kroah.com> <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
In-Reply-To: <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 11 May 2022 18:43:29 +0200
Message-ID: <CAKMK7uH8k6j5jE562yvbtBaE8EnM8JGF7zOXT4C62HdOgOs9SQ@mail.gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC v2]
 drm/msm: Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Paul <sean@poorly.run>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 May 2022 at 15:33, Rob Clark <robdclark@gmail.com> wrote:
> On Wed, May 11, 2022 at 4:50 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, May 11, 2022 at 12:26:05PM +0200, Michel D=C3=A4nzer wrote:
> > > On 2022-05-11 08:22, Greg Kroah-Hartman wrote:
> > > > On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
> > > >>> And use it to store expectations about what the drm/msm driver is
> > > >>> supposed to pass in the IGT test suite.
> > > >>
> > > >> I wanted to loop in Linus/Greg to see if there are any issues rais=
ed
> > > >> by adding CI results file to the tree in their minds, or if any ot=
her
> > > >> subsystem has done this already, and it's all fine.
> > > >
> > > > Why does the results need to be added to the tree?  Shouldn't they =
be
> > > > either "all is good" or "constantly changing and a constant churn"?
> > > >
> > > >> I think this is a good thing after our Mesa experience, but Mesa h=
as a
> > > >> lot tighter integration here, so I want to get some more opinions
> > > >> outside the group.
> > > >
> > > > For systems that have "tight integration" this might make sense as =
proof
> > > > that all is working for a specific commit, but I can't see how this=
 will
> > > > help the kernel out much.
> > > >
> > > > What are you going to do with these results being checked in all th=
e
> > > > time?
> > >
> > > Having the expected results in the tree keeps them consistent with th=
e driver code itself, and allows putting in place gating CI to prevent merg=
ing driver changes which make any of the tests deviate from the expected re=
sult.
> >
> > Shouldn't "expected result" always be "pass"?
> >
> > If not, then the test should be changed to be "skipped" like we have
> > today in the kselftest tests.
>
> No, we want to run tests even if they are expected to fail.  This
> prevents the scenario of a test getting fixed without being noticed
> (for ex, developer was working on fixing test A and didn't notice that
> the fix also fixed test B).  If a fix goes unnoticed, a later
> regression would also go unnoticed ;-)
>
> I was skeptical about this approach at first with mesa CI, but having
> used mesa CI for a while, I am now a firm believer in the approach.
>
> And ofc we want the expectations to be in the kernel tree because
> there could be, for example, differences between -fixes and -next
> branches.  (Or even stable kernel branches if/when we get to the point
> of running CI on those.)

Yeah result files in tree is kinda needed, even more so for the
kernel. A lot of the linux-next integration testing is only done after
patches have landed, and sometimes such breakage makes it to upstream
and then into the subsystem/driver tree. Annotating in the backmerge
what exactly broke and why helps a lot with tracking issues.

And expecting every subsystem to run every other subsystem's tests,
especially tests that run on hw, is just not going to scale. So there
will be all kinds of difference in test results.

> > And how about tieing this into the kselftest process as well, why would
> > this be somehow separate from the rest of the kernel tests?
> >
> > > Keeping them separate inevitably results in divergence between the dr=
iver code and the expected test results, which would result in spurious fai=
lures of such CI.
> >
> > Again, "pass" should be the expected results :)
> >
> > > I expect the main complication for the kernel will be due to driver c=
hanges merged via different trees, e.g. for cross-subsystem reworks. Since =
those will not go through the same CI, they may accidentally introduce inco=
nsistencies. The ideal solution for this IMO would be centralizing CI such =
that the same gating tests have to pass regardless of how the code is merge=
d. But there's likely quite a long way to go until we get there. :)
> >
> > We have in-kernel tests for the rest of the kernel, why can't you put
> > your testing stuff into there as well?
>
> We could ofc put a lot more of the gitlab yml and scripts into the
> kernel tree.  Probably all of i-g-t is a bit much to put in the kernel
> tree.  Not to mention I'd like to see this expand to also run some
> deqp and/or piglit tests, which is definitely too much to vendor into
> the kernel tree.
>
> The approach of this RFC was to put only what was absolutely required
> in the kernel tree (such as expectations), and then link out to an
> external drm-ci tree[1] which has all the necessary scripts and yml
> for building and running tests, to avoid having to put a whole lot
> more in the kernel tree. (We should be specifying exact commit-sha for
> that tree, IMO, as it controls the version of i-g-t which gets used,
> and we need to be able to update expectations in sync with an i-g-t
> uprev, for example when new tests are added or if a test fix caused a
> fail->pass transition.)

Yeah I think longer-term we should carry a lot more in upstream, at
least anything that's shared across drivers wrt the ci integration (or
build testing and running tests which are hw agnostic). Maybe even
igt, not sure (otoh xfs-tests isn't moving into the kernel either, and
there's lots more like that).

Personally I think long-term the only thing outside should be other
repos with tests or stuff you need to run them, and not really the
glue to make it all work in ci. But that's maybe a bit too much
wishful thinking if CI systems stay largely subsystem specific (which
they currently are in many ways, with some overlap).

But maybe there is enough random pieces to share here for a lot more
in-tree to make sense, and imo the fewer extra steps and indirection
CI testing and test updating has, the better.

But like Rob says, eventually there's a limit and when you put the
entire GL/vulkan stack + it's conformance testsuite (which is
maintained by khronos somewhere completely different than both
kernel.org and freedesktop.org) then it's definitely too much and wont
work. And eventually we do want to run these things too (e.g.
intel-gfx-ci does run mesa + piglit on every run).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
