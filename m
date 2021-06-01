Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DA5397A41
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 20:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhFASz2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Jun 2021 14:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFASz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 14:55:27 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6475C061574
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 11:53:45 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id e22so92113pgv.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Jun 2021 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=MHR82u4ojdl9g2U3dRKAkiZwMnhIgA4/mtysswjttjY=;
        b=cycELX4SwEwpMQPJjEY1GnMlGHSIr1u4TbrzIxt+MDHDXhKjxUx1CH3MPdN/6GSijh
         IRfWSzXhLIVCkHdkDlsIRoAl5kys7DQBv06hTnWj3NUCueTK4d70YQZWzxAQUvJFl2Ze
         bW/ykTQe47A6oaOfGiyLx3aDLTaJ0EQtVIitc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=MHR82u4ojdl9g2U3dRKAkiZwMnhIgA4/mtysswjttjY=;
        b=SeEF1K+Fi/EPRP3em7VycLamQ4A5dxr8wAQzBi61EhHCS+7VWrhAsYERJc1dAHAavX
         aXmoIBgrOITgs1shVcaOmj8VBs7iBW8nRcbddYUXV93j0XKD85CUkQB6oWY/A3shqJZZ
         3VwgBhj2KBf8aUb3FVVrofZU1FSp0rLMxoBR8YxPmJK/+cFs4vqtHrh9BwCdRmyjJTsM
         g7HvZOKGy65xDsjudVfOhG86356MmVcIz54o7Ri3WtDYDZi37SDK7sPRy4brIFQsKXIX
         Q9J2HIiQW3C2+hwOJMaDM/+Sgj7qqzq0l3DQ0Lyf86Bm3StNCWZw13X86tJ5abVGYpM5
         IdPw==
X-Gm-Message-State: AOAM531zKHQtSZmBpVtrLxeZF+Ub9KAKK1p7Xjj9zgeTKxxPuJOLjgv5
        PX0yQjOLDF3B/tSHriGv2dl0Xw==
X-Google-Smtp-Source: ABdhPJyuvcjD+Ug/ybnwiv6lI+9T0QlXBQsVK/Ep0NLhGg923v6S8iOI9JjZ17MkYoLYePoVSrZQMA==
X-Received: by 2002:a63:dd12:: with SMTP id t18mr29542213pgg.361.1622573625331;
        Tue, 01 Jun 2021 11:53:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d13sm13536941pfn.136.2021.06.01.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 11:53:44 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:53:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Jarmo Tiitto <jarmo.tiitto@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <202106011152.9E91FF6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 31, 2021 at 02:12:46PM -0700, Nathan Chancellor wrote:
> On Wed, May 19, 2021 at 02:37:26PM -0700, Kees Cook wrote:
> > I've added this to patch to my -next tree now:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/clang/pgo&id=e1af496cbe9b4517428601a4e44fee3602dd3c15
> > 
> 
> Would this be appropriate to send? Someone sent some patches based on
> this work so it would be nice to solidify how they will get to Linus
> if/when the time comes :)

Yeah, good idea.

> https://lore.kernel.org/r/20210528200133.459022-1-jarmo.tiitto@gmail.com/
> https://lore.kernel.org/r/20210528200432.459120-1-jarmo.tiitto@gmail.com/
> https://lore.kernel.org/r/20210528200821.459214-1-jarmo.tiitto@gmail.com/
> https://lore.kernel.org/r/20210528201006.459292-1-jarmo.tiitto@gmail.com/
> https://lore.kernel.org/r/20210528201107.459362-1-jarmo.tiitto@gmail.com/
> https://lore.kernel.org/r/20210528201213.459483-1-jarmo.tiitto@gmail.com/

BTW, Jarmo, if you haven't had this suggested yet, I'd recommend using
this kind of a script for your email sending workflow to get a set of
threaded patches:

#!/bin/sh
set -x

MYSELF="Your Name <and.email@goes.here>"
prefix="PATCH"
#	or
#prefix="PATCH v2"
#	etc...
SHA="SHA your series is based on"


format_args="--cover-letter -n -o outgoing/"
maint_args="--norolestats"

mkdir -p outgoing
git format-patch $format_args --subject-prefix "$prefix" "$SHA"

./scripts/checkpatch.pl "$@" --codespell outgoing/0*patch

${EDITOR:-vi} outgoing/*

# Send patches
git send-email --transfer-encoding=8bit --8bit-encoding=UTF-8 \
	--no-chain-reply-to --thread \
	--from="$MYSELF" --cc="$MYSELF" \
	--to-cmd="./scripts/get_maintainer.pl $maint_args -m" \
	--cc-cmd="./scripts/get_maintainer.pl $maint_args --nom" \
	outgoing/*


> 
> Cheers,
> Nathan
> 
> ======================================
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c45613c30803..0d03f6ccdb70 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14378,9 +14378,13 @@ F:	include/uapi/linux/personality.h
>  PGO BASED KERNEL PROFILING
>  M:	Sami Tolvanen <samitolvanen@google.com>
>  M:	Bill Wendling <wcw@google.com>
> +M:	Kees Cook <keescook@chromium.org>
>  R:	Nathan Chancellor <nathan@kernel.org>
>  R:	Nick Desaulniers <ndesaulniers@google.com>
> +L:	clang-built-linux@googlegroups.com
>  S:	Supported
> +B:	https://github.com/ClangBuiltLinux/linux/issues
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/pgo

I think I'm going to keep things combined in a single tree for now since the patch rate
is low:

+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/features

>  F:	Documentation/dev-tools/pgo.rst
>  F:	kernel/pgo/
>  

I should likely do the same entry for CFI.

-- 
Kees Cook
