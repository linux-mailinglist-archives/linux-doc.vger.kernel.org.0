Return-Path: <linux-doc+bounces-4018-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D121880439C
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 01:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D967B20C02
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 00:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0920081F;
	Tue,  5 Dec 2023 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpZgSB8e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8CA101;
	Mon,  4 Dec 2023 16:53:47 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7c5cb5eeab1so419141241.3;
        Mon, 04 Dec 2023 16:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701737626; x=1702342426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bom4DFdTNhjf5vfq9g+CHJJAJnCgQXB/N4k2I2tO6w=;
        b=EpZgSB8euazK5BNqrnBYQeVWKyAYv9tJwF+kx9De1+IQ+TDGZsHz2/165bnO+WM2L5
         zJdb233Ej5VnF16wQCF1B7nAhexHXrnef4cpUXz3zkoCE/UQMTxvtwTWKvol4S7iHDeE
         clr5y4hsbUWI48/tMecwPm140gHM8GZQ/lil/kQEVRLy0LnvQJCahguYlcGJ9G+CyEat
         qzE8f/gUGIQvBp82SGa/pgydoi1sFJYeDngS5rghty+j3CRbgYBJIPa8OK5fJdxoSCsf
         R5oIEDuIqHppbmtLbXZa4V0QrW+sZyNgMnbnClm24KHV2RdjwNhsQ0yA6o+720AyazZP
         9FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701737626; x=1702342426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bom4DFdTNhjf5vfq9g+CHJJAJnCgQXB/N4k2I2tO6w=;
        b=AAhdxpLhLYu5K/IAgfvDDv1Y3ccYxr46UXDaYTqn18CMwzQFnRJfH9nclZNw2VOOV8
         d0HtX4KgVuFwkFjOcxuRfvNXk0PkR81obF6ApyhiDf1aKLGoScpleJqM9TqRkAccZagZ
         hKKZs21jvp9uO8jMOGjVchicbwW4gznq/jnGOlYkzikeqxt5o4Nn6FgiAOdg5eQfNTsM
         31xIY7ovJT+XLdDD+l1MKxFEhTjU05sMdBp7yXcT0m970uG46raUBEj64lvpqI6Zxi2C
         m1ibIu3lbVy5qR9NHSdY1kNvVjA6aM7FFWfB/b3NV8dFo7l2zDKlIZa5XRLWlp4xW8UE
         OOig==
X-Gm-Message-State: AOJu0Ywsc/bp82BHIqxPve3EoqTpHGdJW2xIUbdfhZ04g3ZErIxTT/R6
	3euR5b+UwaG1uDY3uQ/QmzKwVrzIgudIbgaEp10=
X-Google-Smtp-Source: AGHT+IGGJKmV30jrY90xAW2tf9fsf31dnGtwnvjDNIps+nfOcsoGVT2k/ibW5/+U7zDWBtytJecaVWY0LhA+RKEgowg=
X-Received: by 2002:a05:6102:3649:b0:464:4891:cce9 with SMTP id
 s9-20020a056102364900b004644891cce9mr2921864vsu.16.1701737626341; Mon, 04 Dec
 2023 16:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203001501.126339-1-sxwjean@me.com> <20231203001501.126339-4-sxwjean@me.com>
In-Reply-To: <20231203001501.126339-4-sxwjean@me.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 5 Dec 2023 09:53:34 +0900
Message-ID: <CAB=+i9TVfzWk=anexu6ARPA21AC-uhjQjf4brZF0XDfVaWraWw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/slub: correct the default value of
 slub_min_objects in doc
To: sxwjean@me.com
Cc: vbabka@suse.cz, cl@linux.com, linux-mm@kvack.org, penberg@kernel.org, 
	rientjes@google.com, iamjoonsoo.kim@lge.com, roman.gushchin@linux.dev, 
	corbet@lwn.net, keescook@chromium.org, arnd@arndb.de, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiongwei Song <xiongwei.song@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 9:16=E2=80=AFAM <sxwjean@me.com> wrote:
>
> From: Xiongwei Song <xiongwei.song@windriver.com>
>
> There is no a value assigned to slub_min_objects by default, it always
> is 0 that is initialized by compiler if no assigned value by command line=
.
> min_objects is calculated based on processor numbers in calculate_order()=
.
> For more details, see commit 9b2cd506e5f2 ("slub: Calculate min_objects
> based on number of processors.")
>
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>

While slub_min_objects equals zero by default, 'min_objects' overrides it t=
o
4 * (fls(nr_cpus) + 1) when not set. so when slub_min_objects is not
set, it would be
equal to or higher than 4. I'm not sure this level of implementation
detail is worth documenting.

Also, I think patch 2 should update Documentation/mm/slub.rst too.
(slub_$param -> slab_param)

> ---
>  Documentation/mm/slub.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
> index be75971532f5..1f4399581449 100644
> --- a/Documentation/mm/slub.rst
> +++ b/Documentation/mm/slub.rst
> @@ -150,7 +150,7 @@ list_lock once in a while to deal with partial slabs.=
 That overhead is
>  governed by the order of the allocation for each slab. The allocations
>  can be influenced by kernel parameters:
>
> -.. slub_min_objects=3Dx          (default 4)
> +.. slub_min_objects=3Dx          (default 0)
>  .. slub_min_order=3Dx            (default 0)
>  .. slub_max_order=3Dx            (default 3 (PAGE_ALLOC_COSTLY_ORDER))
>
> --
> 2.34.1
>

