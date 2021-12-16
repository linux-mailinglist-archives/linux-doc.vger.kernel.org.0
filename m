Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E8476EAA
	for <lists+linux-doc@lfdr.de>; Thu, 16 Dec 2021 11:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbhLPKPv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Dec 2021 05:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhLPKPv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 05:15:51 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9E7C06173E
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 02:15:51 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id w64so1851200oif.10
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ccU4l2gWdShDsgwAqNEPDETHATnNwCJsPsDA5QgM/Y=;
        b=XmQdVhq0C17djmNUyj3wlktdoOKkm4eWzpJgohNUHt5GLOK704JRnPixIHTzxhjE35
         L/aBvrCdvrH65uxrQMFkyWR0hklFlraRZb5ofI0XGS/Nw7p8PibJklH3GP8ghfTsAD5j
         RVnEORaekW+692xz/TgKoCMGN9PpgryF939/YRPg90wINRGgArl60phHyQbnDHVpq9T5
         kid9x0EXIIU7pvFNJGeN3SEwJzltSu7Z8j9XX2kq2WQV+ohPynzlRlT5l/5N2eDl1xNv
         KaG0E6+FbRHY2VLcf7LREVBIm6WVyRKUkGX0gBDXtfh1co3O0HHML821/Wi5Js3S3IF/
         Llrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ccU4l2gWdShDsgwAqNEPDETHATnNwCJsPsDA5QgM/Y=;
        b=psGOlnnnddUmhM/l5qapIh4PtBdl6Xy2CxPyy3R4G+F+ccTKjLfS6XmAp+Dk+ugAkd
         d4uF6FEC0bUnEB+8sR/YPR53PI7W3TXBzX6gnwApiMGDkVoZdEllbrlemIqB3kVsZRUb
         GIFlAj3/CMrMTq33Ba6zgcMPI1WuzWT5Wxrg3KHdTYkIbIMoGzFZ6FS8fN09Jpixd5mO
         o5AN0hK+aBvHWWGz6VQO53sWjITkbhkLatgFY33XXS+ceWhPkLATDboQM+bB8CoZb4vT
         I+FiuRBHEjXuGIOVi6lzTvuGieMbbFtT74YRiq21ZjDTbbU7RIx+y29WBdF6Dkp0B4QS
         H2QQ==
X-Gm-Message-State: AOAM531xmCub1MmoBIO7HTEe5KHSk32wvJzDvap2rjc4nA4hHmb68uxf
        ZiDwv/ovAaNP8t8apWemBhAL8yqW+ADz9r7J0/MeNg==
X-Google-Smtp-Source: ABdhPJxBKV3JcsaI3lPlUvHwy9E03kvuSxr/FWXDJBdAzNWTsSfW08Cp4vy5XvLNdV3EDG4w9McVNvfhh7s/9A7J/K4=
X-Received: by 2002:a05:6808:1903:: with SMTP id bf3mr3417400oib.7.1639649750354;
 Thu, 16 Dec 2021 02:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20211216055958.634097-1-sharinder@google.com> <20211216055958.634097-4-sharinder@google.com>
In-Reply-To: <20211216055958.634097-4-sharinder@google.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 16 Dec 2021 11:15:38 +0100
Message-ID: <CANpmjNOGaVgP25xNOSGOyjcA9Lmk4uFmU=f6RrRNJBP_CMEVrQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] Documentation: KUnit: Added KUnit Architecture
To:     Harinder Singh <sharinder@google.com>
Cc:     davidgow@google.com, brendanhiggins@google.com, shuah@kernel.org,
        corbet@lwn.net, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tim.Bird@sony.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 16 Dec 2021 at 07:00, Harinder Singh <sharinder@google.com> wrote:
>
> Describe the components of KUnit and how the kernel mode parts
> interact with kunit_tool.
>
> Signed-off-by: Harinder Singh <sharinder@google.com>
> ---
>  .../dev-tools/kunit/architecture.rst          | 204 ++++++++++++++++++
>  Documentation/dev-tools/kunit/index.rst       |   2 +
>  .../kunit/kunit_suitememorydiagram.png        | Bin 0 -> 24174 bytes
>  Documentation/dev-tools/kunit/start.rst       |   1 +
>  4 files changed, 207 insertions(+)
>  create mode 100644 Documentation/dev-tools/kunit/architecture.rst
>  create mode 100644 Documentation/dev-tools/kunit/kunit_suitememorydiagram.png

In response to the other email: Adding binary blobs just creates
problems, for comparing different versions, and general bloating the
whole repo, where better alternatives exist.

I suppose an ASCII diagram is a bit primitive. :-)

However, SVG files on the other hand are not binary blobs, they are
text-markup based (XML), and e.g. diffing them often provides useful
information about what changed. SVG also has the benefit of being
vector graphics, and not being limited to one resolution.

Looking at the diagram you added, I think this can easily be turned
into vector graphics, and most likely will not use up 24KiB as a
result.

Thanks,
-- Marco
