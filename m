Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF752AD2C
	for <lists+linux-doc@lfdr.de>; Tue, 17 May 2022 22:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353100AbiEQU7I (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 May 2022 16:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353161AbiEQU7F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 16:59:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3B153725
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 13:58:55 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id i9so461203edr.8
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJNZLXvniwh5rhRoMfxsg0LACZj75fWMWBcFFN9Ud7U=;
        b=jvPhqs610qrOEyE8f42MTnA4RzTw/Pt/Df2bbw/BFU+9CW6MqLgzQVLENRGW/J99+6
         LcaN49zv/QOUlpnrGUXB13f8h5VWwh1PC1caDhmmhEcaRLsLBRKIZ2KovBYmW72MxRqa
         HHZuQVwBgCQ8MUPGXFMcYrFb0IFC5Y9mYG0S9XBmegVQQ6uzQN+OMQPGiRPT121DrzrD
         VyzaPSwBecsyLVfmpWnSzLzysqW9sR3h2IL0Iai41NKLS5J9TUETOv3C46yYGtQJkjOh
         bgB/Oo68I2rP7tax9WZDwlpO4bEw+jgY/io04iBC5CpY9Rw2bYtbMdSzIIjkFwQRfB+y
         T+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJNZLXvniwh5rhRoMfxsg0LACZj75fWMWBcFFN9Ud7U=;
        b=bnLNrkunCzmnK6X0edVBhm85frkxIyilAnBhTAEouBEqKaaBDs1MxpKfbezcbutN/K
         hBm9bOuZKumsgk2JZTQjqjyq+I027TeYjGFKe4/gwCGjJiTXK3A+ACNrmhIrPHEs+sXD
         UoVvp4W3S4q5RiulLMR+EmCEt5FsCU7qluolDkjj/BjyeAD34Q98vtLhvRyfXfNIzfSr
         W2XFMTCtjyvxWkAfgpJijPpWHwYi1/9mNaAqg3YdS013mtOIy7Ha0+gHcVdPWs0L4dNu
         8DXPmI5Yie3RrKsdoNyosZL5T7Dvv2Ht7dyE2fdZTIv/6oTik1WH5tdG+B12wWWBYnuA
         N3xA==
X-Gm-Message-State: AOAM533wjWU0vKfCv8tqHnpyYDsT4dR3f7G04LRS70zDDFLG30LCbUzR
        BzS8Zm8JNfDgPX+Mg99E2u7nkSNIN//y1nGFZGqI2g==
X-Google-Smtp-Source: ABdhPJyO965/kAFcmCyrfqOUnmxcE0pY92GCVjcVNdVFa0hROg67M/SxMUfL1A5S/FmX1edEAxbul1vHvxHhk3aTfHM=
X-Received: by 2002:a05:6402:28b2:b0:42a:e63d:880f with SMTP id
 eg50-20020a05640228b200b0042ae63d880fmr354880edb.279.1652821134203; Tue, 17
 May 2022 13:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220429043913.626647-1-davidgow@google.com> <20220513083212.3537869-2-davidgow@google.com>
In-Reply-To: <20220513083212.3537869-2-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 17 May 2022 16:58:43 -0400
Message-ID: <CAFd5g44aUoZgXgyZQVdzQrfrH5fm2TCPxM3Wm+FmkfN5ky1g7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kunit: Taint the kernel when KUnit tests are run
To:     David Gow <davidgow@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org
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

On Fri, May 13, 2022 at 4:32 AM David Gow <davidgow@google.com> wrote:
>
> Make KUnit trigger the new TAINT_TEST taint when any KUnit test is run.
> Due to KUnit tests not being intended to run on production systems, and
> potentially causing problems (or security issues like leaking kernel
> addresses), the kernel's state should not be considered safe for
> production use after KUnit tests are run.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
