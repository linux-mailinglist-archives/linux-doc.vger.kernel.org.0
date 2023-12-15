Return-Path: <linux-doc+bounces-5297-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E18151E4
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 22:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47364286E47
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 21:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242F647F64;
	Fri, 15 Dec 2023 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xwRc5dSj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA3C46556
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-54cde11d0f4so1545030a12.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 13:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702675356; x=1703280156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXf+McqFtrDiVJug5PNpwx3kDJ7o/xVXss/36ywlgjE=;
        b=xwRc5dSj+Y+2K50ejV77G85+gpJjAXOw3dbjz2e0EtH0zPHE7JSnHb0Zl6ZhGB1Q3I
         sEksrDJFhw93gJQQWGamKV+155aV3DsEjIFlJaHqmTehHBNtG1Et1bDtC+ojWjWzt/D7
         CAsOVNeij+qXsIYfR5g8zbkVeoG4EByqiBtwkN5lxnICqmN+SALPNZpJJBL5io0SYno3
         4HW3Bc7TKWW3N61X0ry3d7sAxT3saqZS9qyo3Zwvs+RtvSPXQ/pwPjAWSKFFuUy70vwd
         OHqtqfHY4zR+J4WxGlISCkVJORmxh7TLucntifDZZSIewyzfO1ymoCmaeMaM8jn0ZI9+
         qHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675356; x=1703280156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXf+McqFtrDiVJug5PNpwx3kDJ7o/xVXss/36ywlgjE=;
        b=MIGncCafc73GynGnV7p6t4DRNyP2Fode6Ct2IYfUqsJaJeOH5gyHPEP+UQeSFI9Sdd
         qqVpQnkvkriaE/F6w5hqOT1+/7I4TKuSXTLc2vkT2oEReWlGq3BM0bUTxC/saKQGiTjV
         9k8VnVft77GOwYuouxMhRp7FG+7s/qjUFU0CZuNezhusORh1jLvOggPD39KL0Fh+PRL2
         a1y3mLbdgSqAJ5R1ZDIBLIfIDxvJKAyIle0GTChwoxkGmYt4j5TUtQWKhPINC6yVCsFG
         CwePMBtrGpW15Ifbm5MBsHQRVO5e1+BPYbyU7GJQTMWqyX3HLYbwG9Af8btBzaTb3iC/
         usww==
X-Gm-Message-State: AOJu0YxroTi7lD/abXQ0KG0unOXyrGcbKE2x9HPwL8F9gwtDNGvsxL6g
	gzoT7JuoFPFIMkXRLX2lwhJHCrbOMDyy0v50CvgI9g==
X-Google-Smtp-Source: AGHT+IHlKzE+tjnDj59p47h256/B9DFQX7PwwwbdzBZeZgmu28yrZn9vMa4l2i82Y/r5ncHDvDrcNjOZ5KCY7NicpR4=
X-Received: by 2002:a17:906:100d:b0:9fe:3bb6:99fe with SMTP id
 13-20020a170906100d00b009fe3bb699femr7354917ejm.2.1702675355578; Fri, 15 Dec
 2023 13:22:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com>
In-Reply-To: <20231207192406.3809579-1-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 15 Dec 2023 13:21:57 -0800
Message-ID: <CAJD7tkZXS-UJVAFfvxJ0nNgTzWBiqepPYA4hEozi01_qktkitg@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com, 
	hannes@cmpxchg.org, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 11:24=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> During our experiment with zswap, we sometimes observe swap IOs due to
> occasional zswap store failures and writebacks-to-swap. These swapping
> IOs prevent many users who cannot tolerate swapping from adopting zswap
> to save memory and improve performance where possible.
>
> This patch adds the option to disable this behavior entirely: do not
> writeback to backing swapping device when a zswap store attempt fail,
> and do not write pages in the zswap pool back to the backing swap
> device (both when the pool is full, and when the new zswap shrinker is
> called).
>
> This new behavior can be opted-in/out on a per-cgroup basis via a new
> cgroup file. By default, writebacks to swap device is enabled, which is
> the previous behavior. Initially, writeback is enabled for the root
> cgroup, and a newly created cgroup will inherit the current setting of
> its parent.
>
> Note that this is subtly different from setting memory.swap.max to 0, as
> it still allows for pages to be stored in the zswap pool (which itself
> consumes swap space in its current form).
>
> This patch should be applied on top of the zswap shrinker series:
>
> https://lore.kernel.org/linux-mm/20231130194023.4102148-1-nphamcs@gmail.c=
om/
>
> as it also disables the zswap shrinker, a major source of zswap
> writebacks.
>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Yosry Ahmed <yosryahmed@google.com>

Taking a step back from all the memory.swap.tiers vs.
memory.zswap.writeback discussions, I think there may be a more
fundamental problem here. If the zswap store failure is recurrent,
pages can keep going back to the LRUs and then sent back to zswap
eventually, only to be rejected again. For example, this can if zswap
is above the acceptance threshold, but could be even worse if it's the
allocator rejecting the page due to not compressing well enough. In
the latter case, the page can keep going back and forth between zswap
and LRUs indefinitely.

You probably did not run into this as you're using zsmalloc, but it
can happen with zbud AFAICT. Even with zsmalloc, a less problematic
version can happen if zswap is above its acceptance threshold.

This can cause thrashing and ineffective reclaim. We have an internal
implementation where we mark incompressible pages and put them on the
unevictable LRU when we don't have a backing swapfile (i.e. ghost
swapfiles), and something similar may work if writeback is disabled.
We need to scan such incompressible pages periodically though to
remove them from the unevictable LRU if they have been dirited.

