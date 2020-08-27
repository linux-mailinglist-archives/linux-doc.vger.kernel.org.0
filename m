Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC992253C22
	for <lists+linux-doc@lfdr.de>; Thu, 27 Aug 2020 05:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgH0D1u (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Aug 2020 23:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0D1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Aug 2020 23:27:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A20CC0612A7
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2020 20:27:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 31so2320809pgy.13
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2020 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lan4WhUYFA9HfJB7qKCdogU/OkakBkQiIWekbxEYY98=;
        b=hOEvmvLCZyrKyDnuP6ZTH5QkgSIvXNxxJ9nzK1v+YayMxhu6AlfZAOwwFKB8juill8
         6d1YaoVMVSx4yWTDm5GQNLXmMDilPB75JBjxaxyxtteW/PRz7yExWz6qzjVAQamqzHOU
         DNoeMgiBJyLZTHhVs2vBMSTjo01EHtC7+jCV0VU03YN4wzxDYKzCxFrN+DfeFXPVpIhr
         enPniRrknxG7zc/rBaobn056SxiMSpkWr+YxUR9ZVJ+i9DN8dAC59Eqf3x9mwalEEIg0
         RIVM7poJwPN7PSnZaVjHochhWrDxT8GKH4n0/YMpEwJQUgFnOcr5puMwfoH0AjSsnHqS
         CaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lan4WhUYFA9HfJB7qKCdogU/OkakBkQiIWekbxEYY98=;
        b=anAHZtlF9IK8H4GBhoSo5sore7dC0vfud23eBOQdGX03Ar8/f+uk8YoFdREj2peNqZ
         UhSiYbGcYCUMiXUnX6N7ML/1xvUx0NmDjMFOEMVT08ZAnPXOWKGSiUVJimUdQvPiuTvW
         hDyAzC4z94hWlRuZ1+d9sH510YksjPh9Y95CN1iYimiNfK64EaTT2+xCrW6SBd+cjESH
         KkwLSBxSsnjMgsq+DvMlrIQ0HNy4xBDCHBupksqhFSzpGoAQIVbVeTgB8V+NkSPGyqWL
         Ch9ZBI84Dxb8SwPmMznCWDv58/+PCskTBnmSNzuQtgdn75yN/HRQrlo4zZ4/xZ0gXfU0
         0m3A==
X-Gm-Message-State: AOAM531D+owAAPYqYXg0kgJ29pOk7AaWP5Ts8V7/MUQp6wmlYKraLPg/
        f7AVRSu9kyNKunDjtjr/FxKU75XU82LEb5wPXuPiog==
X-Google-Smtp-Source: ABdhPJxviVfW2bD8P/pmqX6R2i/L3BeFzL5WChR8QAeMF3tlemrFqITDV2CNyY2G8t9QoxiWIv1lc1pXLt8W8OMcFA0=
X-Received: by 2002:a62:1514:: with SMTP id 20mr1974731pfv.62.1598498865714;
 Wed, 26 Aug 2020 20:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <5e10c1645dd8f735215cf54a74db0f8dd3f6cbd5.camel@perches.com>
In-Reply-To: <5e10c1645dd8f735215cf54a74db0f8dd3f6cbd5.camel@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 26 Aug 2020 20:27:34 -0700
Message-ID: <CAKwvOdnfVeL=KyGdTu9eXRwc31s33WC+0t8SWusk0VLE-nPxgw@mail.gmail.com>
Subject: Re: [PATCH] deprecated.rst: Remove now removed uninitialized_var
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 26, 2020 at 8:12 PM Joe Perches <joe@perches.com> wrote:
>
> It's now gone from the kernel so remove it from the deprecated API text.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Thanks Joe.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Documentation/process/deprecated.rst | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 918e32d76fc4..70720f00b9aa 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -51,24 +51,6 @@ to make sure their systems do not continue running in the face of
>  "unreachable" conditions. (For example, see commits like `this one
>  <https://git.kernel.org/linus/d4689846881d160a4d12a514e991a740bcb5d65a>`_.)
>
> -uninitialized_var()
> --------------------
> -For any compiler warnings about uninitialized variables, just add
> -an initializer. Using the uninitialized_var() macro (or similar
> -warning-silencing tricks) is dangerous as it papers over `real bugs
> -<https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/>`_
> -(or can in the future), and suppresses unrelated compiler warnings
> -(e.g. "unused variable"). If the compiler thinks it is uninitialized,
> -either simply initialize the variable or make compiler changes. Keep in
> -mind that in most cases, if an initialization is obviously redundant,
> -the compiler's dead-store elimination pass will make sure there are no
> -needless variable writes.
> -
> -As Linus has said, this macro
> -`must <https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/>`_
> -`be <https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/>`_
> -`removed <https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/>`_.
> -
>  open-coded arithmetic in allocator arguments
>  --------------------------------------------
>  Dynamic size calculations (especially multiplication) should not be
>
>


-- 
Thanks,
~Nick Desaulniers
