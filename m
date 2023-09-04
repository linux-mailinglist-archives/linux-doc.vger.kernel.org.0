Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B96079129D
	for <lists+linux-doc@lfdr.de>; Mon,  4 Sep 2023 09:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbjIDHy3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 4 Sep 2023 03:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjIDHy3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Sep 2023 03:54:29 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA42AF
        for <linux-doc@vger.kernel.org>; Mon,  4 Sep 2023 00:54:25 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5710b0547easo6259eaf.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Sep 2023 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1693814064; x=1694418864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KyKnaN7NpH4i3mR4K3pdjOI+p6X18zjem8CJPwQILZE=;
        b=OA6Oh1wNf9lwo3NL+4Zgb174RPaDljmUKSqoaEwTinpt1VZ0bIiO/01bN/XyU85uFm
         XaGGoxMEYsIHscA5b3kF7eM40U4mSjgN7w4VV6DdNl7Xi8bNEC3u1lfA7jrQ9Y9aejM3
         DrujuwXFFxY9EexcsvaJxRGOQ9lE1CDCGWFpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693814064; x=1694418864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyKnaN7NpH4i3mR4K3pdjOI+p6X18zjem8CJPwQILZE=;
        b=Lv2ZmTU29yFLNMXuy1IntBjjC4+7gCV3RIGWkWreGlb7SsIbNRccAANMMCe3JVYqgo
         QxlN/Fn84J5o4wQ4Kh0iaSobM1XgNRn+a8fc+MGwfMlXyBcXjn07t27X9UrF3eTYh9wp
         uOenl/phLTfuJlz5AoBKm5p1cQRIErLvT8gIUP3DqD4ZvUMz5FsP/l7/bq2pEpggt9PB
         qVIwh8Jw6wTTCUB3BjoqudBsHDCS3lHYEK3io33xlOVoCApgxnl1lCvSCUxztwkF6Hsh
         vLPpCzfDI9lKt42SLjlQ6pNAcxt2chEGJJEEg9jVVbSmH0chjh/DVYZE+WvFGtl2ZMwg
         OnYA==
X-Gm-Message-State: AOJu0YxCWuPHtgGAKEOqXHR9au2xOKSn+YxKPjvsAmZidy3DhDe5jAST
        BmWKjbVl052ESfPG798FIoWOnSMMvxidpvemuLqtsQ==
X-Google-Smtp-Source: AGHT+IFOL4XWPpjdGAlQRxOMzzs4xfcl+Q7IrMAB38jiRI5gWOoAip6k0ty+kO45J/LnC6Jvtv1BrkYFac+rKV1dbm8=
X-Received: by 2002:a4a:db8a:0:b0:573:4a72:6ec with SMTP id
 s10-20020a4adb8a000000b005734a7206ecmr7643777oou.1.1693814064509; Mon, 04 Sep
 2023 00:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local> <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com> <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com> <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
In-Reply-To: <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 4 Sep 2023 09:54:12 +0200
Message-ID: <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Maxime Ripard <mripard@kernel.org>, emma@anholt.net,
        linux-doc@vger.kernel.org, vignesh.raman@collabora.com,
        dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
        jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
        khilman@baylibre.com, sergi.blanch.torne@collabora.com,
        david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
        daniels@collabora.com, martin.blumenstingl@googlemail.com,
        robclark@freedesktop.org, anholt@google.com,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
        guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Aug 2023 at 17:14, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 30/08/2023 11:57, Maxime Ripard wrote:
> > On Wed, Aug 30, 2023 at 10:24:49AM -0300, Helen Koike wrote:
> >> Hi all,
> >>
> >> Thanks for you comments.
> >>
> >> On 30/08/2023 08:37, Maxime Ripard wrote:
> >>> On Wed, Aug 30, 2023 at 01:58:31PM +0300, Jani Nikula wrote:
> >>>> On Wed, 30 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> >>>>> On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
> >>>>>> On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
> >>>>>>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>>>>
> >>>>>>> Developers can easily execute several tests on different devices
> >>>>>>> by just pushing their branch to their fork in a repository hosted
> >>>>>>> on gitlab.freedesktop.org which has an infrastructure to run jobs
> >>>>>>> in several runners and farms with different devices.
> >>>>>>>
> >>>>>>> There are also other automated tools that uprev dependencies,
> >>>>>>> monitor the infra, and so on that are already used by the Mesa
> >>>>>>> project, and we can reuse them too.
> >>>>>>>
> >>>>>>> Also, store expectations about what the DRM drivers are supposed
> >>>>>>> to pass in the IGT test suite. By storing the test expectations
> >>>>>>> along with the code, we can make sure both stay in sync with each
> >>>>>>> other so we can know when a code change breaks those expectations.
> >>>>>>>
> >>>>>>> Also, include a configuration file that points to the out-of-tree
> >>>>>>> CI scripts.
> >>>>>>>
> >>>>>>> This will allow all contributors to drm to reuse the infrastructure
> >>>>>>> already in gitlab.freedesktop.org to test the driver on several
> >>>>>>> generations of the hardware.
> >>>>>>>
> >>>>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>>>>>> Acked-by: Daniel Stone <daniels@collabora.com>
> >>>>>>> Acked-by: Rob Clark <robdclark@gmail.com>
> >>>>>>> Tested-by: Rob Clark <robdclark@gmail.com>
> >>>>>>
> >>>>>> Ok I pushed this into a topic/drm-ci branch in drm.git and asked sfr to
> >>>>>> include that branch in linux-next.
> >>>>>>
> >>>>>> But also I'd like to see a lot more acks here, we should be able to at
> >>>>>> least pile up a bunch of (driver) maintainers from drm-misc in support of
> >>>>>> this. Also maybe media, at least I've heard noises that they're maybe
> >>>>>> interested too? Plus anyone else, the more the better.
> >>>>>
> >>>>> I'm not really convinced by that approach at all, and most of the issues
> >>>>> I see are shown by the follow-up series here:
> >>>>
> >>>> I'm not fully convinced either, more like "let's see". In that narrow
> >>>> sense, ack. I don't see harm in trying, if you're also open to backing
> >>>> off in case it does not pan out.
> >>>>
> >>>>> https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.raman@collabora.com/
> >>>>>
> >>>>>     * We hardcode a CI farm setup into the kernel
> >>
> >>
> >> These could be out of tree.
> >>
> >> There is a version outside the kernel tree where you just point the CI
> >> configuration to a url:
> >> https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/merge_requests/1
> >>
> >> We were discussing it here https://www.linuxtv.org/cgi-bin/mailman/private/linuxtv-ci/2023-August/000027.html
> >
> > It looks like it's private
> >
> >> (I guess Sima's reply didn't got into the mailing list) but the argument of
> >> not having out of tree repo is due to historical bad experience of having to
> >> sync the kernel with the code and it can become messy.
> >
> > My point is that even though the test strategy might be considered a
> > "property" of the kernel, how you execute it is definitely not and you
> > will have as many setups as you have CI farms. You can't put that into
> > the kernel, just like we don't put the kernel command line in it for
> > example. >
> >>>>>
> >>>>>     * We cannot trust that the code being run is actually the one being
> >>>>>       pushed into gitlab
> >>
> >>
> >> We can improve this if this is a requirement.
> >> For DTS configuration we can work with overlays (which is the current
> >> modification on that patchset). For other changes that are not suitable to
> >> upstream (and should be rare) we can see if we work with the
> >> `-external-fixes` approach or another approach, we can check it case by case
> >> to understand why it is not suitable for upstream.
> >
> > The existence of that branch in itself is an issue to me. Again, it's a
> > matter of trust. How can I trust a branch I barely know about, of which
> > the development is not clear and isn't reviewed by any of the
> > maintainers of the code that might affect the test outcomes.
> >
> > Or put another way, if I run the tests on my machine, it won't work. Why
> > should it work on the CI farm? The branch itself is broken. It might not
> > be due to any of the work I did, but it's broken still.
> >
> >>>>>
> >>>>>     * IMO, and I know we disagree here, any IGT test we enable for a given
> >>>>>       platform should work, period. Allowing failures and flaky tests just
> >>>>>       sweeps whatever issue is there under the rug. If the test is at
> >>>>>       fault, we should fix the test, if the driver / kernel is at fault,
> >>>>>       then I certainly want to know about it.
> >>
> >> I believe we need a baseline and understand the current status of tests. If
> >> you check the xfails folder in the patch you can see that I had to add a few
> >> tests on *-skips.txt since those tests crashes the system and other on
> >> *-fails.txt that are consistently not passing.
> >
> > I agree that we need a baseline, but that baseline should be defined by
> > the tests own merits, not their outcome on a particular platform.
> >
> > In other words, I want all drivers to follow that baseline, and if they
> > don't it's a bug we should fix, and we should be vocal about it. We
> > shouldn't ignore the test because it's broken.
> >
> > Going back to the example I used previously, kms_hdmi_inject@inject-4k
> > shouldn't fail on mt8173, ever. That's a bug. Ignoring it and reporting
> > that "all tests are good" isn't ok. There's something wrong with that
> > driver and we should fix it.
> >
> > Or at the very least, explain in much details what is the breakage, how
> > we noticed it, why we can't fix it, and how to reproduce it.
> >
> > Because in its current state, there's no chance we'll ever go over that
> > test list and remove some of them. Or even know if, if we ever fix a bug
> > somewhere, we should remove a flaky or failing test.
> >
> >> Since the "any IGT test we enable for a given platform should work" is not a
> >> reality atm,
> >
> > Thanks for the reality check, but it's very much doable: we're in
> > control of the test suite.
> >
> >> we need to have a clear view about which tests are not corresponding
> >> to it, so we can start fixing. First we need to be aware of the issues
> >> so we can start fixing them, otherwise we will stay in the "no tests
> >> no failures" ground :)
> >
> > I think we have somewhat contradicting goals. You want to make
> > regression testing, so whatever test used to work in the past should
> > keep working. That's fine, but it's different from "expectations about
> > what the DRM drivers are supposed to pass in the IGT test suite" which
> > is about validation, ie "all KMS drivers must behave this way".
>
> I see. Indeed, for me it is more about regression testing.
>
> We could have a configuration where developers could choose to run
> regression tests or overall validation (but I understand this is not the
> point, but just saying we could have both somehow).
>
> We could have some policy: if you want to enable a certain device in the
> CI, you need to make sure it passes all tests first to force people to
> go fix the issues, but maybe it would be a big barrier.
>
> I'm afraid that, if a test fail (and it is a clear bug), people would
> just say "work for most of the cases, this is not a priority to fix" and
> just start ignoring the CI, this is why I think regression tests is a
> good way to start with.
>
> Anyway, just brain storming :)
> I really hope we can find a nice useful solution for the community.

I think eventually we need to get to both goals, but currently driver
and test quality just isn't remotely there.

I think a good approach would be if CI work focuses on the pure sw
tests first, so kunit and running igt against vgem/vkms. And then we
could use that to polish a set of must-pass igt testcases, which also
drivers in general are supposed to pass. Plus ideally weed out the bad
igts that aren't reliable enough or have bad assumptions.

For hardware I think it will take a very long time until we get to a
point where CI can work without a test result list, we're nowhere
close to that. But for virtual driver this really should be
achievable, albeit with a huge amount of effort required to get there
I think.

Cheers, Sima

> Regards,
> Helen
>
> >
> > I guess for regression you very much would like that all-green
> > dashboard, and it's understandable. For validation, we don't care and we
> > should be as vocal as possible to report broken drivers.
> >
> > Eventually, we should have regression testing over the validation test
> > suite.
> >
> > It's not about reality. We should be clear what we expect from those
> > test suites, and not claim that it's something it's not.
> >
> >>>> At least for display, where this also depends on peripheral hardware,
> >>>> it's not an easy problem, really.
> >>>
> >>> Aside from the Chamelium tests, which tests actually rely on peripheral
> >>> hardware? On EDID and hotplug, sure, but that can easily be set up from
> >>> the userspace, or something like
> >>>
> >>> https://www.lindy-international.com/HDMI-2-0-EDID-Emulator.htm?websale8=ld0101.ld021102&pi=32115
> >>>
> >>>> How reliable do you need it to be? How many nines? Who is going to
> >>>> debug the issues that need hundreds or thousands of runs to reproduce?
> >>>> If a commit makes some test less reliable, how long is it going to
> >>>> take to even see that or pinpoint that?
> >>>
> >>> I mean, that's also true for failures or success then. How many times do
> >>> you need a test to run properly to qualify it as a meaningful test? How
> >>> do you know that it's not a flaky test?
> >>>
> >>> Ultimately, it's about trust. If, for a given test that just failed, I
> >>> can't be certain that it's because of the branch I just submitted, I
> >>> will just ignore the tests results after a while.
> >>>
> >>> This is already what plagues kernelci, and we should do better.
> >>
> >> This is something that is really nice on Mesa3D, a patch only gets merged if
> >> tests passes, which forces people to not ignore it, which forces the code to
> >> be fixed and the CI to be constantly maintained.
> >>
> >> Of course there are bad days there, but there is real value. Nice thread to
> >> check: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8635 (thanks Alyssa
> >> for the feedback).
> >
> > I'm sure it works great for Mesa, but I'm also sure it doesn't ignore
> > CTS reports that a particular device isn't a valid OpenGL or Vulkan
> > implementation anymore.
> >
> >>> And I'm sorry, but if some part of the kernel or driver just isn't
> >>> reliable, then we shouldn't claim it is (except for all the times it
> >>> isn't). If no-one has the time to look into it, fine, but flagging it
> >>> under a flaky test doesn't help anyone.
> >>
> >> At least we would know what is there that isn't reliable.
> >
> > We would too if the test was reported as failed. But our preferred
> > approach to do so diverge.
> >
> > Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
