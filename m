Return-Path: <linux-doc+bounces-2761-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D31927F27C8
	for <lists+linux-doc@lfdr.de>; Tue, 21 Nov 2023 09:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5DD1C218CB
	for <lists+linux-doc@lfdr.de>; Tue, 21 Nov 2023 08:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22771E53A;
	Tue, 21 Nov 2023 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxNRDpR3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABEDBD;
	Tue, 21 Nov 2023 00:44:26 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7c40227e007so409797241.3;
        Tue, 21 Nov 2023 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700556265; x=1701161065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/YvICvSB8bSzHc8/0NoSBpZ4nib8LsXMIC7ezMPecg=;
        b=FxNRDpR3OJ6xc/shi+9DExiDW22eYxxiEAE5ELA6C3FTYqvazSz2+XLGNfeu1EycEd
         Q/9t3mHQ3+Zz9shtBElOlDDgfow1EKd4D7OmPX/qiDwEHWeQaqVBmmYRPV3inXim2pxt
         zPEHQawsFrUzH18gh5eOcbE2GV7ylOHshEK/NnVJZGQAuZLQ9xPMF7ZiX72eK+EzBjND
         FqKudoWS3rTYvotQhMS7ETLyGT8Mf0Y+fTL0B8v93qt0Ami+bket1ewcRF6k97qEE4Lk
         Zc2wvnh8LPvzj0B1NBq/j3LVKQ/HgGotQ0hRfWpusst9YrDFMGRw8QvglZR7HG7AbOlB
         n7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556265; x=1701161065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/YvICvSB8bSzHc8/0NoSBpZ4nib8LsXMIC7ezMPecg=;
        b=OEyuMZJbUVgXZNFTdL+AALhH2DtAqAtS3d0j8wyPjLAuxzjvqSJpFlx70LvC/kLoxQ
         sKnKFn7Baftb218ctwDuWqoltdr83l2U0/BAZyMN8vlHHV0kAEr9wYjzhBt6lOJGc6db
         fNptfBH8TENDmY/5CF84cUDzaq+lZfD/ReHuRT0aQbvKDDleOVGUCQv+7HNOn1HdfhMz
         s3zYvByhqp+wQHw373sjvxresXLQpw8lWYZYxeACfTdQyp10nye9+im3wY/swI6529gK
         ZGnjk3U+3/2e3bEcOkzx7orpyOeDiR7rXPdbP6CN7t2LAQFxEewpza6nyvFvGpEv1Mgn
         1y8Q==
X-Gm-Message-State: AOJu0Yy01pu002XJeac3ALQR1k9J9fZlYWnFNBEjB5yBQfpEp1ZvFOwn
	hWsgcyPkv4xGjHWP/2jUHwk3dbW3GLk6s9osneQ=
X-Google-Smtp-Source: AGHT+IHNzyezlVnuT9G+hZBGJTolU4V7J2Z3K5bLUDvkAvJGu3hb7chDniuGHNRq2vA2XjbzjTn1lv/9vDI8CdD+oQw=
X-Received: by 2002:a67:edca:0:b0:462:760a:443b with SMTP id
 e10-20020a67edca000000b00462760a443bmr5612238vsp.2.1700556264956; Tue, 21 Nov
 2023 00:44:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120091214.150502-1-sxwjean@me.com> <20231120091214.150502-3-sxwjean@me.com>
In-Reply-To: <20231120091214.150502-3-sxwjean@me.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 21 Nov 2023 17:44:13 +0900
Message-ID: <CAB=+i9TxzvHpDjZHhRfX-Cox_GuYg6-uGaG3eBhZh5vCJwpgmw@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm/slab: remove slab_nomrege and slab_merge
To: sxwjean@me.com
Cc: cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, vbabka@suse.cz, roman.gushchin@linux.dev, 
	corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 6:12=E2=80=AFPM <sxwjean@me.com> wrote:
>
> From: Xiongwei Song <xiongwei.song@windriver.com>
>
> Since slab allocatoer has already been removed, so we should also remove
> the related parameters. And change the global flag from slab_nomerge
> to slub_nomerge.

No, kernel parameters should be changed only in a backward-compatible
way (if possible)

Before slab merging was supported in SLAB, only SLUB supported it.
After commit 423c929cbbec ("mm/slab_common: commonize slab merge logic"), u=
sing
slab_[no]merge parameters for CONFIG_SLUB builds became legal.

I think what the documentation says is "slab_[no]merge enables or
disables slab merging
and slub_[no]merge remain supported only for backward compatibility"

>
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 11 ++---------
>  mm/Kconfig                                      |  2 +-
>  mm/slab_common.c                                | 13 +++++--------
>  3 files changed, 8 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index c7709a11f8ce..afca9ff7c9f0 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5870,11 +5870,11 @@
>
>         slram=3D          [HW,MTD]
>
> -       slab_merge      [MM]
> +       slub_merge      [MM]
>                         Enable merging of slabs with similar size when th=
e
>                         kernel is built without CONFIG_SLAB_MERGE_DEFAULT=
.
>
> -       slab_nomerge    [MM]
> +       slub_nomerge    [MM]
>                         Disable merging of slabs with similar size. May b=
e
>                         necessary if there is some reason to distinguish
>                         allocs to different slabs, especially in hardened
> @@ -5915,13 +5915,6 @@
>                         lower than slub_max_order.
>                         For more information see Documentation/mm/slub.rs=
t.
>
> -       slub_merge      [MM, SLUB]
> -                       Same with slab_merge.
> -
> -       slub_nomerge    [MM, SLUB]
> -                       Same with slab_nomerge. This is supported for leg=
acy.
> -                       See slab_nomerge for more information.
> -
>         smart2=3D         [HW]
>                         Format: <io1>[,<io2>[,...,<io8>]]

