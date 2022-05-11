Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A121A523E9B
	for <lists+linux-doc@lfdr.de>; Wed, 11 May 2022 22:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244632AbiEKUOl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 May 2022 16:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiEKUOk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 16:14:40 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722AE5EDF6;
        Wed, 11 May 2022 13:14:38 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u3so4483530wrg.3;
        Wed, 11 May 2022 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26U6FjTddM6hMOoXqBgd+U1pVJTYKKyaMhCJDRRHP8Q=;
        b=OfF4r+GBI6gJgaPnkOAKlUi3xv+vUiMvbqV5l3pyxwzt/6gPuIR9yHlcFvb9dj6qUS
         IEvOG49NoEeHlYHQPcgiU7gUZsjqEKRc/OHJuM6U+PCOXSLx9LPylMnkCuZFkqodZq3m
         ChQNbH6jvZRLDQEwLh7ABU/QtBzfdBAU8JH5btSWrFvlOg0ad5p7A5j63bWoAy3URl/+
         7RkPGehI0s4EXU7/JJ27jRvnGAE/A7IE3jpox7sR3OZvJLqzSL+1Q7ndmGt2cjx2ei7d
         6Cert7LU04UElFku2ITtmrZls7N92MHKiHiTSXfLU0Kej4CwI7DBJEGHp6VVa4N47NQ4
         h9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26U6FjTddM6hMOoXqBgd+U1pVJTYKKyaMhCJDRRHP8Q=;
        b=kgQt+YJ6E0/wk9CA+X3HSIF5Q3ddpTvvHY6eJVePbT3IE24PYgZqARF7+chvNtw+3z
         Rf9Y4fMDikDRl321pqr5PuVYL7aVjN3+DkBopeYmevV3FUd6E94y4DkhbQnWhg0Kp6l+
         L8sv9LwMwyi/ZFI1BFlGbM1KIJtwImxHlKxoJ0vAV8QDY68WtlS+hSyxFtT4sv0a0Xld
         RZAFqcvtMBBCMoH8qtZoDWF0pu9zzuS0WlNhghfZtwTNhlTPxolOoGSFqJfQLuUT9ipX
         p96YP/bx6jGygEhLbXgYxKVKFOiUpbYwhAi25qp72GFGFqiW0wOdtFIHospR2DZn/zRE
         ekDQ==
X-Gm-Message-State: AOAM530z5FHq4RUHZqgylAtuazLMCpNzl53soPZfEHFGg5DODUGM0rI3
        A0CEGL5Ipki0fLLc6OeWFvy8Ge5u20nqwjJdcXk=
X-Google-Smtp-Source: ABdhPJzvvh9nJybwAqQZ3Plz6hYwOeqb8EOKQDncj+ijFnW9f3YS+owxQLFlorcvAcurmC3OW/aa1UTE9sLkMURbu0Y=
X-Received: by 2002:a05:6000:1a87:b0:20c:687f:6d10 with SMTP id
 f7-20020a0560001a8700b0020c687f6d10mr23644213wry.574.1652300076914; Wed, 11
 May 2022 13:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
 <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com> <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
In-Reply-To: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 May 2022 13:14:24 -0700
Message-ID: <CAF6AEGtWCkOv4xpWz+ds9fSiB4_W4CV9exYyus1G_-crD2YFGg@mail.gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC v2]
 drm/msm: Add initial ci/ subdirectory
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sean Paul <sean@poorly.run>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Maxime Ripard <mripard@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 11, 2022 at 12:12 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > The kernel tree might have just the expected *failures* listed, if
> > there are any. Presumably the ci tree has to have the expected results
> > anyway, so what's the advantage of listing non-failures?
>
> .. put another way: I think a list of "we are aware that these
> currently fail" is quite reasonable for a development tree, maybe even
> with a comment in the commit that created them about why they
> currently fail.
>
> That also ends up being very nice if you fix a problem, and the fix
> commit might then remove the failure for the list, and that all makes
> perfect sense.
>
> But having just the raw output of "these are the expected CI results"
> that is being done and specified by some other tree entirely - that
> seems pointless and just noise to me. There's no actual reason to have
> that kind of noise - and update that kind of noise - that I really
> see.

Yeah, the only reason we have full results is that the current tool to
check for pass/fail of the entire CI job is 'diff' ;-)

It has the nice benefit of generating a patch for you to squash into
whatever commit to update the expectation files, I suppose.  But we
have something more clever on the mesa-ci side of things where we list
skips/flakes/expected-fails but not expected-passes.  To be fair, the
# of tests on the mesa side is something on the order of 750,000, I
don't expect to ever get close to that # on the kernel side.

BR,
-R

>
>                 Linus
