Return-Path: <linux-doc+bounces-4165-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6031805D33
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 19:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3F6281E99
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 18:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A931168B8E;
	Tue,  5 Dec 2023 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkrgHiuE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B467B1737
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 10:22:30 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1a0bc1e415so562876966b.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 10:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701800549; x=1702405349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmg48ucaNtz1eYQ0lcHiyMSvr8VMzgFNPLFgYJsB9ug=;
        b=EkrgHiuEMA77/SeoJWOAxYB1N+afZ+15akiee+8nSXBz/ucfjMRvjQJr83dxbITaqC
         4i9N0Ex4nqfQ3zgJQzu9/k31MlcdVPP0v9Df3rku4g3iQ6qX+C+HajyddKJvkeBhCC4u
         2RIs6ue7iQi161nt6NSldsuNVDXQh/r+t7JBdmyN5XdpLtV87xkKIeyZSkvI2h3X2nS9
         TvVB5s5xysIaumHqgHnlSLZCDhlLBkLUS7vV70Ycj7QTS/1XYGCdn3Xu2VbGpSF65hKp
         r8yefL4USBrBtmjSAt978SKf5766GLc1beI7b99agTlJ++qzMYKy8sirIDEvDHSHPTkV
         KWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701800549; x=1702405349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmg48ucaNtz1eYQ0lcHiyMSvr8VMzgFNPLFgYJsB9ug=;
        b=LOQlcykKoFb5DxVyvd+NBAEj8PM0KeMBlrsxcaBjPuZX04euaLm7XSEPJvlpLlDIOQ
         OqDx9ELNc71kPmUGItlYXMB2v675+C28bPes5aiRq+q2PPHdNe4wlYsHvnw2jRmVdayJ
         /f/85cUYtccKLxUoSVuXb8D/v3b3Irs16Zebm/ml0ncxSA9N4azluXK1p1XN7KgaGuC8
         NL7BZHDzxLobIV32TxC/NCt5qmsOZPmIvClmAp+64QHEO7LGBA0juuaGpLnhHxoKU5Ty
         o1gFbqrL04DY2SPXiGv3Bo3SkVw4cLOydfH/TAxb7xWbdxCYJP5EI8YNQ00UVqV1DfvU
         8/ng==
X-Gm-Message-State: AOJu0Yx1nOxt1I2aUGXSFLz/Y5fI/foJp8Mm28EOXlOVvSvVa18cFLHS
	8EQpMJFNRo9JmyX4tqIA767dxi0xtVUyfYn5Wp7x/Q==
X-Google-Smtp-Source: AGHT+IFxluMz9sMmuxSFOhQkmwPCAcZ5/u8Ab6p6UNrzKjlnMibiuPAGPqvvqV6rtEaQ2cNgW+y+zDH5NzMnbiRMc44=
X-Received: by 2002:a17:906:7:b0:a1a:c8fc:2e2b with SMTP id
 7-20020a170906000700b00a1ac8fc2e2bmr2763817eja.132.1701800548623; Tue, 05 Dec
 2023 10:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130194023.4102148-1-nphamcs@gmail.com> <20231130194023.4102148-5-nphamcs@gmail.com>
In-Reply-To: <20231130194023.4102148-5-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 5 Dec 2023 10:21:52 -0800
Message-ID: <CAJD7tkZeXY0HbBQu_pZr+kDgoPoDR+kQZq4XxYo6ZXfrO2=BKQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] mm: memcg: add per-memcg zswap writeback stat
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:40=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
>
> Since zswap now writes back pages from memcg-specific LRUs, we now need a
> new stat to show writebacks count for each memcg.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  include/linux/vm_event_item.h | 1 +
>  mm/memcontrol.c               | 1 +
>  mm/vmstat.c                   | 1 +
>  mm/zswap.c                    | 4 ++++
>  4 files changed, 7 insertions(+)
>
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.=
h
> index d1b847502f09..f4569ad98edf 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -142,6 +142,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT=
,
>  #ifdef CONFIG_ZSWAP
>                 ZSWPIN,
>                 ZSWPOUT,
> +               ZSWP_WB,

I think you dismissed Johannes's comment from v7 about ZSWPWB and
"zswpwb" being more consistent with the existing events.

>  #endif
>  #ifdef CONFIG_X86
>                 DIRECT_MAP_LEVEL2_SPLIT,
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 792ca21c5815..21d79249c8b4 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -703,6 +703,7 @@ static const unsigned int memcg_vm_event_stat[] =3D {
>  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
>         ZSWPIN,
>         ZSWPOUT,
> +       ZSWP_WB,
>  #endif
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>         THP_FAULT_ALLOC,
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index afa5a38fcc9c..2249f85e4a87 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1401,6 +1401,7 @@ const char * const vmstat_text[] =3D {
>  #ifdef CONFIG_ZSWAP
>         "zswpin",
>         "zswpout",
> +       "zswp_wb",
>  #endif
>  #ifdef CONFIG_X86
>         "direct_map_level2_splits",
> diff --git a/mm/zswap.c b/mm/zswap.c
> index f323e45cbdc7..49b79393e472 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -760,6 +760,10 @@ static enum lru_status shrink_memcg_cb(struct list_h=
ead *item, struct list_lru_o
>         }
>         zswap_written_back_pages++;
>
> +       if (entry->objcg)
> +               count_objcg_event(entry->objcg, ZSWP_WB);
> +
> +       count_vm_event(ZSWP_WB);
>         /*
>          * Writeback started successfully, the page now belongs to the
>          * swapcache. Drop the entry from zswap - unless invalidate alrea=
dy
> --
> 2.34.1

