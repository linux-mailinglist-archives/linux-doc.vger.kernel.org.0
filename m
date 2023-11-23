Return-Path: <linux-doc+bounces-2961-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A67F555C
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 01:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 958B5B20D0E
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 00:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2348BA34;
	Thu, 23 Nov 2023 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfJtLU3M"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DBB100;
	Wed, 22 Nov 2023 16:33:25 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45dadc5bf51so108814137.2;
        Wed, 22 Nov 2023 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700699604; x=1701304404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQkTqySKm3AYLOoiK0RjjGYCG28Vh+/Qg1tc7GPocew=;
        b=XfJtLU3McNnfwZOJKKxnXOqcRGKW/XtGP6niux2nAD+HT7Q/wVIfOteyB/UXIhEPsy
         p0nnv6vmkx7vyb2rPmLON8VfOFZRF90FTAVeaGS1rCOl+E4QFSvARNgkeqAFF0LbrZTf
         dOPtjlUK4K/N1sVLNBH4dD9aDLyL7gG44Gu0x5JgK3f1l1umh9njQlGfOpXS+6F9xvPQ
         Z91oLPPLyDxh45KC/CnMco6T2ghbvDhT7xYuohmtBYV96v+gF+XHeWDHZn/ZmXrbIldU
         ayN4qv2b26vS4CY4OEO3QDtDJ5CI0jwjSPWHDaTtkwXqTBVApBXv25E4q+8Adtck5PNu
         t8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700699604; x=1701304404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQkTqySKm3AYLOoiK0RjjGYCG28Vh+/Qg1tc7GPocew=;
        b=fJdCBvWPxdJepfboeHoJoy/CqtF1tfYhK7oxgmXtWWK8+gy5Ggg8lb4A5wKxPhCX5N
         1is2p3nUMCu3fb5UnsNXeThGzhAUhDADm/NEHZYWZorZ4zxtI58tfIdu6Fh9TM82o82z
         2HN974I8QzOtYyxSLL4khjtVFV5Tw0JDiwYXHYN7Yp9v+iViFm87PHT1w0XL325zeNf1
         qNsniNeINdKVszk//oCEO2r5KKUSioptYG43KwrjgFBZsPOPodmgJQS3VKZKtgpK9hvX
         nfZ1UJn3mhqqvovLFPOtA7UEKwVkJkraijwmmQs5JbONigzuPHfQqOtSYWvpoYBGme0B
         rokw==
X-Gm-Message-State: AOJu0YwF4dx3dwZmFM9XUSDww/v2mSM6QpZvkUjix2REhppVGMmVg+9V
	XES5eKRMe5bioeWNUEyy21yDmG624ih82y5NqzA=
X-Google-Smtp-Source: AGHT+IGRsfh+KoICfTW4Y8/al6sTqCNFplBIRKlv5HamItqROgWZ9DLrG0yYMSdK6qq7/wjQ8ZoCEmi4odMMtGUSSok=
X-Received: by 2002:a67:fc48:0:b0:45d:b5a2:1516 with SMTP id
 p8-20020a67fc48000000b0045db5a21516mr4450188vsq.34.1700699604130; Wed, 22 Nov
 2023 16:33:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122143603.85297-1-sxwjean@me.com>
In-Reply-To: <20231122143603.85297-1-sxwjean@me.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Thu, 23 Nov 2023 09:33:12 +0900
Message-ID: <CAB=+i9S3zduJUbzoFxGQqMPKbA3N2bbUw4xkM3JA+rRK0Vr7UA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kernel-parameters: remove
 slab_max_order and noaliencache
To: sxwjean@me.com
Cc: vbabka@suse.cz, linux-mm@kvack.org, cl@linux.com, penberg@kernel.org, 
	rientjes@google.com, iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, 
	roman.gushchin@linux.dev, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiongwei Song <xiongwei.song@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:36=E2=80=AFPM <sxwjean@me.com> wrote:
>
> From: Xiongwei Song <xiongwei.song@windriver.com>
>
> Since slab allocator has already been removed. There is no users about
> slab_max_order and noaliencache, so let's remove them.
>
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
> ---
> v2: Hyeonggon Yoo <42.hyeyoo@gmail.com> suggested that noaliencache shoul=
d be
> removed too. Here adding this change. The patch is based on [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/=
?h=3Dslab-remove-slab-v2r1
>
> v1: https://lore.kernel.org/linux-mm/20231120091214.150502-1-sxwjean@me.c=
om/T/#m55ebb45851bc86d650baf65dfe8296d33c5b1126
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 65731b060e3f..d56a5beefe24 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3740,10 +3740,6 @@
>         no5lvl          [X86-64,RISCV] Disable 5-level paging mode. Force=
s
>                         kernel to use 4-level paging instead.
>
> -       noaliencache    [MM, NUMA, SLAB] Disables the allocation of alien
> -                       caches in the slab allocator.  Saves per-node mem=
ory,
> -                       but will impact performance.
> -
>         noalign         [KNL,ARM]
>
>         noaltinstr      [S390] Disables alternative instructions patching
> @@ -5887,12 +5883,6 @@
>                         own.
>                         For more information see Documentation/mm/slub.rs=
t.
>
> -       slab_max_order=3D [MM, SLAB]
> -                       Determines the maximum allowed order for slabs.
> -                       A high setting may cause OOMs due to memory
> -                       fragmentation.  Defaults to 1 for systems with
> -                       more than 32MB of RAM, 0 otherwise.
> -
>         slub_debug[=3Doptions[,slabs][;[options[,slabs]]...]      [MM, SL=
UB]
>                         Enabling slub_debug allows one to determine the
>                         culprit if slab objects become corrupted. Enablin=
g

Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

Thanks!

--
Hyeonggon

