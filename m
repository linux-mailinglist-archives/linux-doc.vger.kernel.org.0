Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAC62659F8
	for <lists+linux-doc@lfdr.de>; Fri, 11 Sep 2020 09:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgIKHF0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Sep 2020 03:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgIKHFI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Sep 2020 03:05:08 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD64DC061573
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 00:05:06 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id f11so4721872qvw.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qYTA7a/mDb0x7v76SumPW6fQ7bLMrnrWY5ltUv9JNU=;
        b=l6I1g9C1SvoJBjGEU0JNeOK0OUWWHuh+ALTBHG8Q61JGEqU4KeeE5IlLbk4bq+biRP
         GLthBBCFLV74aP/hQaHI2M0uCtoZz+JpOo4lFoxKTjE1iW7bCuJswGKKAlv+zaA9qnkp
         TlS1NPVdFNmHAqjPSNR659dB1WOgl7sIIp5R9vb7NnibPcG7TDweMFV/AUK/qXe6Nlww
         O3k9zPK1DfyWXuhengm0F807rZ57VgNbELKS6QRJ5VAQEYFRAIBEj+paw0bj8u/keVzB
         +KusOeic/b8Aqz8saD0zP8EvoIS5TolTvFwZtAgF/VFApLsHX/JUnGw3O8psBt3RKhyr
         ibtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qYTA7a/mDb0x7v76SumPW6fQ7bLMrnrWY5ltUv9JNU=;
        b=GWNhQEbYhA3+wD9sT9Ip57Akq8qes0cTGTss/OLQaC0rpkKHvZDuSesBuOvHrDoEnM
         t/q+pFW3sd7z/L7N2Ty9P1S9k1+k3Tz/3hkzCnzk6B7QYpeAUW30hhiesm3QuJu/zzk6
         z5BiqCCA5MDhy/l8ahtfWljQiAfki9uQf/qwmujh7a8C++5RvI8ORymrsCIGc1YliN3J
         iQ0iMdfa5+5dgTkvwz1FXnbh8gU1Pzt9f78FKcKf3cRXfN0nkmqon3Uq1kLyRNobkaGq
         M2or2EPGk58uXgfotAzrmXel62mij3fQ3jhNFH7VINAM8/kSotdMoQxiLOf7GUGCnNcR
         ozgA==
X-Gm-Message-State: AOAM5325LNWF69Y/0LUndTtmSFxWhU6/23wL3EL/J/0I9fQLO/bKR/rn
        Pg3UFgo8P+Yh4rT4sx71BvUtDNycYjGIP/lJs/P7+Q==
X-Google-Smtp-Source: ABdhPJwPLAUEsAzaSMCLt+v28C4/YXeXs4UpRMTYz0l4idhp0Mt0npwu+vanlcme90OTrVPya2wrVj/k/dc78p5FmYU=
X-Received: by 2002:a0c:c24a:: with SMTP id w10mr609462qvh.99.1599807905731;
 Fri, 11 Sep 2020 00:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-7-elver@google.com>
In-Reply-To: <20200907134055.2878499-7-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Sep 2020 09:04:54 +0200
Message-ID: <CACT4Y+b=Ph-fD_K5F_TNMp_dTNjD7GXGT=OXogrKc_HwH+HHwQ@mail.gmail.com>
Subject: Re: [PATCH RFC 06/10] kfence, kasan: make KFENCE compatible with KASAN
To:     Marco Elver <elver@google.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 7, 2020 at 3:41 PM Marco Elver <elver@google.com> wrote:
>
> From: Alexander Potapenko <glider@google.com>
>
> We make KFENCE compatible with KASAN for testing KFENCE itself. In
> particular, KASAN helps to catch any potential corruptions to KFENCE
> state, or other corruptions that may be a result of freepointer
> corruptions in the main allocators.
>
> To indicate that the combination of the two is generally discouraged,
> CONFIG_EXPERT=y should be set. It also gives us the nice property that
> KFENCE will be build-tested by allyesconfig builds.
>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  lib/Kconfig.kfence | 2 +-
>  mm/kasan/common.c  | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 7ac91162edb0..b080e49e15d4 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -10,7 +10,7 @@ config HAVE_ARCH_KFENCE_STATIC_POOL
>
>  menuconfig KFENCE
>         bool "KFENCE: low-overhead sampling-based memory safety error detector"
> -       depends on HAVE_ARCH_KFENCE && !KASAN && (SLAB || SLUB)
> +       depends on HAVE_ARCH_KFENCE && (!KASAN || EXPERT) && (SLAB || SLUB)
>         depends on JUMP_LABEL # To ensure performance, require jump labels
>         select STACKTRACE
>         help
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 950fd372a07e..f5c49f0fdeff 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  #include <linux/kasan.h>
>  #include <linux/kernel.h>
> +#include <linux/kfence.h>
>  #include <linux/kmemleak.h>
>  #include <linux/linkage.h>
>  #include <linux/memblock.h>
> @@ -396,6 +397,9 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
>         tagged_object = object;
>         object = reset_tag(object);
>
> +       if (is_kfence_address(object))
> +               return false;

Is this needed?
At least in the slab patch I see that we do :

if (kfence_free(objp)) {
  kmemleak_free_recursive(objp, cachep->flags);
  return;
}

before:

/* Put the object into the quarantine, don't touch it for now. */ /*
Put the object into the quarantine, don't touch it for now. */
if (kasan_slab_free(cachep, objp, _RET_IP_)) if
(kasan_slab_free(cachep, objp, _RET_IP_))
  return; return;


If it's not supposed to be triggered, it can make sense to replace
with BUG/WARN.


>         if (unlikely(nearest_obj(cache, virt_to_head_page(object), object) !=
>             object)) {
>                 kasan_report_invalid_free(tagged_object, ip);
> @@ -444,6 +448,9 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
>         if (unlikely(object == NULL))
>                 return NULL;
>
> +       if (is_kfence_address(object))
> +               return (void *)object;
> +
>         redzone_start = round_up((unsigned long)(object + size),
>                                 KASAN_SHADOW_SCALE_SIZE);
>         redzone_end = round_up((unsigned long)object + cache->object_size,
> --
> 2.28.0.526.ge36021eeef-goog
>
