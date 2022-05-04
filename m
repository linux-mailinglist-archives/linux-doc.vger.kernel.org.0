Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98AB51ADA9
	for <lists+linux-doc@lfdr.de>; Wed,  4 May 2022 21:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377535AbiEDTXz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 May 2022 15:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377525AbiEDTXu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 15:23:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA6F49FAA
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 12:20:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id m20so4718744ejj.10
        for <linux-doc@vger.kernel.org>; Wed, 04 May 2022 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNWEoMjkPejTpMpsYA4Kv3+ZTAHfcsmDjgEj8h7IAfQ=;
        b=gAr4qcOHo1jMIbfvbkBjcutByH2vQqv5Ne74K/r5ZVwMIxAeTbC5N2aGp35XH4yY1Y
         FXILSjGE1Q/uakASImJ/pDspnH97vyqdzmuSqElbPcG+90OXyRvOh0GWJralMaFVBpaE
         +Y04vEMgfmyOtMLeRsXSJ/j0xyX4SzbujXtiZrRdqU8FAzJEZBT9UsHfdv0+CEhCPeeP
         PHXf+4h+0bfHkBTMZr82qYmXdE2V01wmmpDd8Iz7lnZyz7kfaVun8sin2u9N6VDSAYU3
         j5Kl6cn/uW+sSGAw14vQNhz0zM1JgvvIKgkIfGhx4a+q0epCX6MYVhKkqI1CxdiQT5rP
         BrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNWEoMjkPejTpMpsYA4Kv3+ZTAHfcsmDjgEj8h7IAfQ=;
        b=5SQz/3Hke7RXErZZC0ei8yTtK+Lcaftzv2Oh7fse6qpLu3hoNDoyVaZJbpn8AKmCbY
         8CZ8/BEhTYIwJMJxj2TwkXQAX7E2y9D9q5c77SOcoeQFvYeriQ5uO+1+/n4jWEyhUId3
         oRyVY54cX3SutFK3JTjEE/SbpLsRwingB50lozJfQoswi/RjjPrxDJEAYtDVO9ZTT3Ih
         o7XyTvOUy+Nc6Q5d9Vwjt839aFCO5UOFTRYGl+mCUM6HnCDXDdXaiDZLs0I1uH23jDGa
         DiL5Qp0w3T9hrRMv1wHd+R9MvbYZtLCQiZsuB3+/QNVVbnh2Hfujc6tz5fwWUq8QdYZ7
         kzuA==
X-Gm-Message-State: AOAM533vuvcmiCvww07M5Y5p7CP6kOFeUb0MOjEuKDicc01wCEiAopN4
        RD4jTNzDdDtGy+Ap5nA5icn2wgpsQvh8hM2qvASghQ==
X-Google-Smtp-Source: ABdhPJwwmYcS4qvTuteHjFbxm1sXBovzp3gV0ep4CXwpECRN3ChAjTFeZ0IVVVTTJeE3XZzmiiGL8zY4dLIv7adzGIY=
X-Received: by 2002:a17:906:a2c2:b0:6e7:efc2:17f2 with SMTP id
 by2-20020a170906a2c200b006e7efc217f2mr20871323ejb.542.1651692011116; Wed, 04
 May 2022 12:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220429043913.626647-1-davidgow@google.com> <20220430030019.803481-1-davidgow@google.com>
 <Ym7P7mCoMiQq99EM@bombadil.infradead.org> <Ym7QXOMK3fLQ+b6t@bombadil.infradead.org>
 <CABVgOSmXyN3SrDkUt4y_TaKPvEGVJgbuE3ycrVDa-Kt1NFGH7g@mail.gmail.com>
 <YnKS3MwNxvEi73OP@bombadil.infradead.org> <CAGS_qxrz1WoUd5oGa7p1-H2mQVbkRxSTEbqnCG=aBj=xnMu1zQ@mail.gmail.com>
 <YnLJ6dJQBTYjBRHZ@bombadil.infradead.org>
In-Reply-To: <YnLJ6dJQBTYjBRHZ@bombadil.infradead.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Wed, 4 May 2022 14:19:59 -0500
Message-ID: <CAGS_qxoFECVJD3Jby1eTWG741hBWuotuEM78PU-qfyvp-nLV7Q@mail.gmail.com>
Subject: Re: [PATCH v2] kunit: Taint kernel if any tests run
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 4, 2022 at 1:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> OK so, we can just skip tainting considerations for selftests which
> don't use modules for now. There may be selftests which do wonky
> things in userspace but indeed I agree the userspace taint would
> be better for those but I don't think it may be worth bother
> worrying about those at this point in time.
>
> But my point in that sharing a taint between kunit / selftests modules
> does make sense and is easily possible. The unfortunate aspect is just

Yes, I 100% agree that we should share a taint for kernelspace testing
from both kunit/kselftest.
Someone running the system won't care what framework was used.

> that selftests don't have a centralized runner, because I can just
> run tools/testing/selftests/sysctl/sysctl.sh for example and that's it.
> So I think we have no other option but to just add the module info
> manually for selftests at this time.

Somewhat tangential: there's a number of other test modules that
aren't explicitly part of kselftest.
Long-term, I think most of them should be converted to kselftest or
kunit as appropriate, so they'll get taken care of eventually.

A number of these modules depend on CONFIG_DEBUG_KERNEL=y, but we
can't pre-emptively set this new taint flag by checking for it as it's
too widely used :\
E.g. the debian-based distro I'm using right now has it set
$ grep 'CONFIG_DEBUG_KERNEL=y' /boot/config-$(uname -r)
CONFIG_DEBUG_KERNEL=y

-Daniel
