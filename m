Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C384A39C990
	for <lists+linux-doc@lfdr.de>; Sat,  5 Jun 2021 17:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhFEPqH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 5 Jun 2021 11:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFEPqH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jun 2021 11:46:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07875C061767
        for <linux-doc@vger.kernel.org>; Sat,  5 Jun 2021 08:44:08 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id y7so7653246wrh.7
        for <linux-doc@vger.kernel.org>; Sat, 05 Jun 2021 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJfhHkzB6JU+XSlwyc8dKxQocbIwcKlTcjVegE04Z64=;
        b=Xp/1GC/FizBJ465G6thyi4L+RqrwjNC8GOq/rM9CqamSQrPTQLkyAMkSFIGnoi0OjN
         0j6RsSfS8Bj/WOVdKBAONX6p99rs4VJQ6ihUrudGARIfEjR/KmCff4kGCbsaIiOZN+hx
         AqjZKcRbIdaoILq0t1gmrruOPTMNaKKjXhOikzWG9amOWQohK7oMKdoDEeN3F2lBXEGV
         RpfjUJA3SFvVcEhLg2V/OplRu7OQQihUWImlochEKbOdZ45dTloa4D8WE5xZYKqI6PML
         9O/FgIPfPpVngvfS7J7KavosG/TqXxVLnqWCnvu5d5Jo5H1vE5Q723FYHNvrJPS4mfRU
         bxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJfhHkzB6JU+XSlwyc8dKxQocbIwcKlTcjVegE04Z64=;
        b=JdwW02igns05W+yT6wbjfScUNl1y6WpEDOBL6z/L9CKh37H/GvDAKr3AvD6kCFmq5w
         GVc8A3ZBY6Q4xPYX9DzNayoHSX8ZbN5SiGhT3kXoUlzGE6GpMcfK3GsyAdoKA7VNI0NB
         F1sXMIzMvppJ0iOM+Ei/8WpnkqAbB0rHi1n1X8r4hsjqhB+2WEnsw7M0kjINB0J00zVO
         iN3cSwZsW1IBKbwBYlicvy6eABjgmlpoe+p2XWSTo/AOLhhinW4EN9lGndSsgm8Vj43T
         wvHgnCiYGIHagZXFKsd35TfloCn+apDTtLjJ/pCzFXxFWxNJXTdBaKIW/al3CK1Fh52V
         jDgg==
X-Gm-Message-State: AOAM531yaEedEJbPn24mxmiR9lBY29w5VY23oMyjNQlHQFw+MZV2ry3p
        RUbLbLJYVIqQ8C01W6oI5BRep6NVaoH8y8kLWfVerQ==
X-Google-Smtp-Source: ABdhPJwkZ1dqyT+ax8qJeKImVdGAV/+mHCCZ4avCc/FU0YlPfuEUQMrUgamyR3aqnG/mvk/wbaP2vkZAOVfK/3Zz958=
X-Received: by 2002:adf:e58d:: with SMTP id l13mr8823026wrm.369.1622907846460;
 Sat, 05 Jun 2021 08:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <63fe86c8de5cced00a1bb5d18d6c7f087268565a.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <63fe86c8de5cced00a1bb5d18d6c7f087268565a.1622898327.git.mchehab+huawei@kernel.org>
From:   David Gow <davidgow@google.com>
Date:   Sat, 5 Jun 2021 23:43:55 +0800
Message-ID: <CABVgOS=vcZX5w4tyQg9nsDyJ0sKdS-McgVNzVd9mqeLy1NTCFA@mail.gmail.com>
Subject: Re: [PATCH 13/34] docs: dev-tools: testing-overview.rst: avoid using
 ReSt :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        Marco Elver <elver@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 5, 2021 at 9:18 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Hmm... I'd originally wanted this to read more like the name of the
tool than the path to the doc file, but given the :doc: prefix and
backticks are equally ugly, and no less confusing to the plain-text
reader than the filename, I'm happy to have this changed. Particularly
if we're standardising on this across the kernel documentation.

Reviewed-by: David Gow <davidgow@google.com>


-- David

>  Documentation/dev-tools/testing-overview.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentation/dev-tools/testing-overview.rst
> index b5b46709969c..65feb81edb14 100644
> --- a/Documentation/dev-tools/testing-overview.rst
> +++ b/Documentation/dev-tools/testing-overview.rst
> @@ -71,15 +71,15 @@ can be used to verify that a test is executing particular functions or lines
>  of code. This is useful for determining how much of the kernel is being tested,
>  and for finding corner-cases which are not covered by the appropriate test.
>
> -:doc:`gcov` is GCC's coverage testing tool, which can be used with the kernel
> -to get global or per-module coverage. Unlike KCOV, it does not record per-task
> -coverage. Coverage data can be read from debugfs, and interpreted using the
> -usual gcov tooling.
> +Documentation/dev-tools/gcov.rst is GCC's coverage testing tool, which can be
> +used with the kernel to get global or per-module coverage. Unlike KCOV, it
> +does not record per-task coverage. Coverage data can be read from debugfs,
> +and interpreted using the usual gcov tooling.
>
> -:doc:`kcov` is a feature which can be built in to the kernel to allow
> -capturing coverage on a per-task level. It's therefore useful for fuzzing and
> -other situations where information about code executed during, for example, a
> -single syscall is useful.
> +Documentation/dev-tools/kcov.rst is a feature which can be built in to the
> +kernel to allow capturing coverage on a per-task level. It's therefore useful
> +for fuzzing and other situations where information about code executed during,
> +for example, a single syscall is useful.
>
>
>  Dynamic Analysis Tools
> --
> 2.31.1
>
