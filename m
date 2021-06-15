Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261BF3A89FA
	for <lists+linux-doc@lfdr.de>; Tue, 15 Jun 2021 22:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhFOUM1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Jun 2021 16:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOUM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 16:12:27 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06A8C061574
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 13:10:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id w31so7900pga.6
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYwjla9m+6Ar2RV6BgbgGMLWxpLDazGjqfkcGgZsTeQ=;
        b=bauH0URTsuFMw1G6hoLeMpKObq9DN+UXLvyYLkT/csnoYo6h2xCKOoxzvxk6L1nRiO
         CP8U7putdHjsUTJ9UNU5pEYVg7YxO68ILw0ti9iajBrnZcSjHWWgGiFRMpNhYlFhV7IL
         YgGIPzdd+N1ekWxkb76/kzzXgM8LXa+uEWXPDZzTtmolBQYH66eIq2P7tYyMsW1FktgI
         nZZ6QGPa+/olAV3QkNBYVHVBczaZmDQKMTFnnTuGjyThpgbsgBBCrh2z3hmqErQmyPM3
         HuymI0VOsbDWJcXKFpgizoyqee+F3g6tH2LMNLa9UcNmWNWVjEyiV3zMUcnlHw7/PEdf
         zKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYwjla9m+6Ar2RV6BgbgGMLWxpLDazGjqfkcGgZsTeQ=;
        b=BSTAezLfmvoF/xKGqa6eFsDLU4v2vTtM0FL6smR1VWjss1XQGpwfUi5NYhLTA7ZgF0
         ZGJ1+q76d/cE7Yd8dILZ+E4aq21oMUFfo3LR1IGDNWVvYs7k4ud7PVcat5O0GQ1MBDnp
         jEHsB9lDKsrJnTyLBsH5Cq5yYimDf/aO7NMV8QycNbtrkZeCX3oTNZm99W8mUQ18rTvv
         8w0gYRpeBNE9agi+Bsuq0ZzCeZKAwNzej4ue4mx/YIqSE+QiqlIhZj9/D4zMPTexzJY+
         JFVM0nLtP5bmYhw/braEwEJQDw6dHoFRKR8Z9CI4lVWaCkSRm4AG0mcxBlgO8jdaQfiY
         91QQ==
X-Gm-Message-State: AOAM532SJLuqh777BafpHKZsp5TFX159jsjbSHyhwU2JxalrSC6jFucV
        Ia2rmrHTZG+TKznHPykfBnY8ISfgCpbdOYjB5kSjKg==
X-Google-Smtp-Source: ABdhPJzm2wmW4hzJMY+HlbRfgKireJ6Hc7hXhe9CDv5rw+U+Gfo7j54X3WlieNqeuzZjwDNf3PcHkcRW0y/1K4Hxa+w=
X-Received: by 2002:a63:d0d:: with SMTP id c13mr1253894pgl.384.1623787822057;
 Tue, 15 Jun 2021 13:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com> <20210513193204.816681-3-davidgow@google.com>
In-Reply-To: <20210513193204.816681-3-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 15 Jun 2021 13:10:11 -0700
Message-ID: <CAFd5g45NobSVOFAN8PJrWKDgqjJDJh15x5WByf+0FV+yFa2zEA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] Documentation: kunit: Clean up some string casts
 in examples
To:     David Gow <davidgow@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 12:36 PM David Gow <davidgow@google.com> wrote:
>
> As the type checking is no longer excessively strict, get rid of the
> unsightly (char*) casts -- and comment discussing them -- from the KUnit
> usage page.
>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
