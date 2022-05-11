Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94504523B9A
	for <lists+linux-doc@lfdr.de>; Wed, 11 May 2022 19:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345614AbiEKRdc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 May 2022 13:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345606AbiEKRdb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 13:33:31 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABBB229FF4
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 10:33:26 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id z2so5511637ejj.3
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
        b=KSDW7EaxEEAox9ArNl/cG0HEgm3SfZ3GtqPNzdmMU8fD7w0C0oDZs3MEyYZ6yoLdeu
         yShjYNBWL3FgGR6nQX6mpwU5Yirj2LjWdpRYv8a8UxBup5whzO4smQ6iqzPoBSfjp87S
         7RlaOLEm4NKQMZeXbACuJSvVt1Ssh4WSaqYVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
        b=LO6utABf3eC2SkKl/3v3o/rt+Y9uXYtbpGyRX4AtH6+eCFDjQPfH7VCaI1AxPSy+px
         WdlKWSgreh4PsOvZxiMJFGpGODLcqQTkLTFwVZMtbu3EigdIejo1qL71NQ5mdea831gZ
         bfI0ZCtpvtMm3/yOawKYZC+Weo8xsq7aB/lggArnb8gKUwntCfVbAI5YqoQ/4eNscB6h
         s/A3zH9fzgg63nn+PkwXz/j8Hi3lFItKguDQCJoleJQWoFMmngVAjKBN9vXL1xJxDU2g
         jxynDB3/XkABeFcEfzQn5+hYiIJRmEEf8dy+S0dXok5ZtP2MI6nwK7Cb3ouIH49rn/ll
         AbxA==
X-Gm-Message-State: AOAM533AwIkrQnb5S7a3Vjcq02ISD4Qa2SIA36IIRnhuwfYJ8PuRxGeb
        Cm5BIwK0KD5MMj3asBUH2/xYCuXElMyvc1r1428=
X-Google-Smtp-Source: ABdhPJx9fsh9GGrw/zMaOximv9D8+PMeDQwjAfI8iPnn29GFBhxZfhFGa/Ur0Q6IB2FE++WRRkQ+Jw==
X-Received: by 2002:a17:907:7f0c:b0:6fa:8f52:98fc with SMTP id qf12-20020a1709077f0c00b006fa8f5298fcmr12412528ejc.454.1652290405083;
        Wed, 11 May 2022 10:33:25 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1238627ejm.7.2022.05.11.10.33.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:33:23 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so3672996wms.3
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 10:33:22 -0700 (PDT)
X-Received: by 2002:a1c:4c06:0:b0:394:65c4:bd03 with SMTP id
 z6-20020a1c4c06000000b0039465c4bd03mr6060279wmf.8.1652290402369; Wed, 11 May
 2022 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
In-Reply-To: <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 10:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To:     Dave Airlie <airlied@gmail.com>
Cc:     Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
>
> I wanted to loop in Linus/Greg to see if there are any issues raised
> by adding CI results file to the tree in their minds, or if any other
> subsystem has done this already, and it's all fine.
>
> I think this is a good thing after our Mesa experience, but Mesa has a
> lot tighter integration here, so I want to get some more opinions
> outside the group.

Honestly, my immediate reaction is that I think it might be ok, but

 (a) are these things going to absolutely balloon over time?

 (b) should these not be separated out?

Those two issues kind of interact.

If it's a small and targeted test-suite, by all means keep it in the
kernel, but why not make it part of "tools/testing/selftests"

But if people expect this to balloon and we end up having megabytes of
test output, then I really think it should be a separate git tree.

A diffstat like this:

>  7 files changed, 791 insertions(+)

is not a problem at all. But I get the feeling that this is just the
tip of the iceberg, and people will want to not just have the result
files, but start adding actual *input* files that may be largely
automated stuff and may be tens of megabytes in size.

Because the result files on their own aren't really self-contained,
and then people will want to keep them in sync with the test-files
themselves, and start adding those, and now it *really* is likely very
unwieldy.

Or if that doesn't happen, and the actual input test files stay in a
separate CI repo, and then you end up having random coherency issues
with that CI repo, and it all gets to be either horribly messy, or the
result files in the kernel end up really stale.

So honestly, I personally don't see a good end result here.  This
particular small patch? *This* one looks fine to me, except I really
think tools/testing/selftests/gpu would be a much more logical place
for it.

But I don't see a way forward that is sane.

Can somebody argue otherwise?

            Linus
