Return-Path: <linux-doc+bounces-5884-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55681DBAD
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 18:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6451C209F6
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 17:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E64C8FD;
	Sun, 24 Dec 2023 17:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkKo198e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A62C8C4
	for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d4006b251aso27626425ad.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703438285; x=1704043085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hFLSnZfOPa4HbeCcp8WZcEpXNOy9FTVGa6+3rCmbwU=;
        b=nkKo198ePwmNf8Dz2PjGEjjB/7Pj6LLOxNozL9O88AFRtOOMlPyNBqycQD9Lce29Kx
         YnsnwguV81kVHHi0LbuKQUFxxr4ixTBlDkk+n9r446r6Izooo3k/Ay10OCPvRJY7vR5v
         AfRkDdfi95XLoePMuuFcJxfcJlOwIrFSpffbs3Z9KVYZpkEfFJ+Vaep6gVv6JP95AWHS
         IwlbirQZCwp4UDP5s0xe1Qfx/N04JMozwLjI7FoCtyrhkMvCMDoIRl2LN76isB12GeP5
         DFSInkOfN1qWZUXfTVZf1Q4lic566PBvFcmA61wJ5xLyEGtQivTZgAWsNnvRK9wy+SSO
         CGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703438285; x=1704043085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hFLSnZfOPa4HbeCcp8WZcEpXNOy9FTVGa6+3rCmbwU=;
        b=wZWTTIg4L/cNXINnlHrD/YUn/7c9Uff9djSl6IPW+17KdqBWH5cVE+I1xjaXwsTJ8z
         UIBJHq1PoM1b0d4bzn3YuH4ZuqEwwf0crkjSc2ro4+eYw+aqUNP9eiEidVz8KMuIwYIv
         pupQ4PTGE4wF0v2FA957Wt918r0+FnOusFIpolOvC1cam0emVW5Yx4l3B9QTdTFBC6kt
         ACl5oKBpkFfF9eBwGj0T4i9N/T8hzirN3nWIbQBcVvKk2KAAKKjQsGRhgU1J/SCv97IW
         8Dhn1za+426OaVJElbpmyLajbBQfRSuOQ+5wusVjt384iLHMJSpt2T/JCoxmr/oNzDPC
         0bcA==
X-Gm-Message-State: AOJu0YxjYpXXG8s4IhfwfIw3QK8Ufkj20iexarpyMKY774dGchCJHrFC
	z8iV3ifzxZr006f4hRlTje5qaKLL+mdqe8n1FqDw5tgfjUE2
X-Google-Smtp-Source: AGHT+IHqdGi+qJAhaciG+1KGIMfLpbW26gbSL9yRw9d1ad7j+3u5CPf+ZOWnMczughCoPqVc0v+t9WY5gzRQbV6uAJg=
X-Received: by 2002:a17:902:eb83:b0:1d3:efef:d84b with SMTP id
 q3-20020a170902eb8300b001d3efefd84bmr5625964plg.70.1703438285308; Sun, 24 Dec
 2023 09:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <20231221005725.3446672-1-nphamcs@gmail.com>
In-Reply-To: <20231221005725.3446672-1-nphamcs@gmail.com>
From: Chris Li <chriscli@google.com>
Date: Sun, 24 Dec 2023 09:17:54 -0800
Message-ID: <CAF8kJuMQhbkR2p0UZ61r+tAGg-idiSMoW8Gsf=GcB3Jpa=W9qw@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling (fix)
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com, 
	hannes@cmpxchg.org, cerasuolodomenico@gmail.com, yosryahmed@google.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nhat,

Acked-by: Chris Li <chrisl@kernel.org>

I think a follow up step would be having some patches to address it
rather than document it that oh yes, we have a problem in that
situation.

Chris

On Wed, Dec 20, 2023 at 4:57=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> Add a caveat about recurring zswap store failures leading to reclaim
> inefficiency.
>
> Suggested-by: Yosry Ahmed <yosryahmed@google.com>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 5 ++++-
>  Documentation/admin-guide/mm/zswap.rst  | 4 ++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 2b4ac43efdc8..5ec7dd753cd1 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1686,7 +1686,10 @@ PAGE_SIZE multiple when read back.
>
>         When this is set to 0, all swapping attempts to swapping devices
>         are disabled. This included both zswap writebacks, and swapping d=
ue
> -       to zswap store failure.
> +       to zswap store failures. If the zswap store failures are recurrin=
g
> +       (for e.g if the pages are incompressible), users can observe
> +       reclaim inefficiency after disabling writeback (because the same
> +       pages might be rejected again and again).
>
>         Note that this is subtly different from setting memory.swap.max t=
o
>         0, as it still allows for pages to be written to the zswap pool.
> diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin=
-guide/mm/zswap.rst
> index cfa653130346..b42132969e31 100644
> --- a/Documentation/admin-guide/mm/zswap.rst
> +++ b/Documentation/admin-guide/mm/zswap.rst
> @@ -159,6 +159,10 @@ zswap itself) on a cgroup-basis as follows:
>
>         echo 0 > /sys/fs/cgroup/<cgroup-name>/memory.zswap.writeback
>
> +Note that if the store failures are recurring (for e.g if the pages are
> +incompressible), users can observe reclaim inefficiency after disabling
> +writeback (because the same pages might be rejected again and again).
> +
>  When there is a sizable amount of cold memory residing in the zswap pool=
, it
>  can be advantageous to proactively write these cold pages to swap and re=
claim
>  the memory for other use cases. By default, the zswap shrinker is disabl=
ed.
> --
> 2.34.1
>

