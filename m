Return-Path: <linux-doc+bounces-2839-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE27F3DCB
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 06:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B791C20D92
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 05:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FB154AD;
	Wed, 22 Nov 2023 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFbUvzwi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A781210C;
	Tue, 21 Nov 2023 21:59:48 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7bae0c07007so1486121241.1;
        Tue, 21 Nov 2023 21:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700632788; x=1701237588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRblTu4ml6hVfmv/M7Om0SzMbiMU6JrjrAw45Kacwyg=;
        b=PFbUvzwiTcfFfnc6rO+YRVQNds176ifC3u3ZEjfET3Y9whzgMHCgsJrJddpOEkpZ7h
         5nJK0RcwDHdq2hyD1zYz+NlBRiltXfmCjiiHuguSCb+faWIQDOd9jSMSHxDOa+HDN6FH
         xbXsu0RUA0IJjbuSBC3rLXqdmRojqsX6Rvf9/KNuSaOlqjKb/+JHy63TlkO/bOWn8yuI
         AAG+VnP3YvOUKPy5BLPJblN82hNYtrxkwhmJwljJlDel7iZDD4axKBh+W9qvwlKiRxiW
         13EDo04d00LioxO7Jw/mxM+3U9nkJfrAJORi6o/JbRewugB7pCfYzs/+M9t8/0kNBwR+
         i8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700632788; x=1701237588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRblTu4ml6hVfmv/M7Om0SzMbiMU6JrjrAw45Kacwyg=;
        b=HmoYM8TnOGj/cB4c91OUXbgCz3CT1/Qg5uobaySXbHW8Qt4rbpJpGThMcFgIL/oSYb
         sn7PcFTntVsJsVach0f2iVIWG76PBtbA8c6NQgMl/lSs8wYn3ch3QXkZtsDgI0mgcH7j
         Bw7oGqkmSpwZJNBgSeR1SPGYykcSFiAE9m80OWyigzOIGm/26V92vk/UYv2gqdzHRAK8
         YR+RAfc077B6oGPlS1OZ5DotMNIowGozltXlSvwCgmwBl7eDd8rbs5HJfR44k19bvnUQ
         nLX356NIMK+DPPOBsaQGK1inLY7+AO/PRJX99KJSrIExnbh4A8PKKc+v1mnqNkW0SCkH
         YBKA==
X-Gm-Message-State: AOJu0Yz9RFu7xWhkT60EOEkvcwfenkTn2hDmw5i9mScHFp4FrBO6chDN
	BkjV48wfi6trBMZnqv6Tv1FdH5OeZHdF2ZXAGWU=
X-Google-Smtp-Source: AGHT+IHFKQeeC2S+TQAawEjhySClwPyCEXpsw360upok0riC3QEOTrEExQQd9eciMhcRR6UorZiBsMcAlJE6UPvvS7U=
X-Received: by 2002:a67:ebd8:0:b0:462:71c3:99aa with SMTP id
 y24-20020a67ebd8000000b0046271c399aamr1271437vso.19.1700632787592; Tue, 21
 Nov 2023 21:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120091214.150502-1-sxwjean@me.com> <20231120091214.150502-3-sxwjean@me.com>
 <CAB=+i9TxzvHpDjZHhRfX-Cox_GuYg6-uGaG3eBhZh5vCJwpgmw@mail.gmail.com> <CO1PR11MB5185A5481010CF8B541EA7A7ECBAA@CO1PR11MB5185.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5185A5481010CF8B541EA7A7ECBAA@CO1PR11MB5185.namprd11.prod.outlook.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Wed, 22 Nov 2023 14:59:36 +0900
Message-ID: <CAB=+i9QW-ORVTQpC15-GNTwj8Qk7mRawS33dW0gWmhxV64DA1w@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm/slab: remove slab_nomrege and slab_merge
To: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
Cc: "sxwjean@me.com" <sxwjean@me.com>, "cl@linux.com" <cl@linux.com>, 
	"penberg@kernel.org" <penberg@kernel.org>, "rientjes@google.com" <rientjes@google.com>, 
	"iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"roman.gushchin@linux.dev" <roman.gushchin@linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 2:27=E2=80=AFPM Song, Xiongwei
<Xiongwei.Song@windriver.com> wrote:
>
> Hi Hyeonggon,
>
> > -----Original Message-----
> > From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On Behalf Of =
Hyeonggon
> > Yoo
> > Sent: Tuesday, November 21, 2023 4:44 PM
> > To: sxwjean@me.com
> > Cc: cl@linux.com; penberg@kernel.org; rientjes@google.com; iamjoonsoo.k=
im@lge.com;
> > vbabka@suse.cz; roman.gushchin@linux.dev; corbet@lwn.net; linux-mm@kvac=
k.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/4] mm/slab: remove slab_nomrege and slab_merge
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the
> > content is safe.
> >
> > On Mon, Nov 20, 2023 at 6:12=E2=80=AFPM <sxwjean@me.com> wrote:
> > >
> > > From: Xiongwei Song <xiongwei.song@windriver.com>
> > >
> > > Since slab allocatoer has already been removed, so we should also rem=
ove
> > > the related parameters. And change the global flag from slab_nomerge
> > > to slub_nomerge.
> >
> > No, kernel parameters should be changed only in a backward-compatible
> > way (if possible)
> >
> > Before slab merging was supported in SLAB, only SLUB supported it.
> > After commit 423c929cbbec ("mm/slab_common: commonize slab merge logic"=
), using
> > slab_[no]merge parameters for CONFIG_SLUB builds became legal.
> >
> > I think what the documentation says is "slab_[no]merge enables or
> > disables slab merging
> > and slub_[no]merge remain supported only for backward compatibility"
>
> Yes. But slab allocator will not exist anymore. Is slab_[no]merge still p=
roper?
> Will the term "slab/SLAB" still be used in the future?

Well, why break existing users for no strong reason?

The reason why commit 423c929c did not drop slub_[no]merge after commonizat=
ion
is to support existing users and avoid breaking what worked before.

Removing slab_max_order made sense because SLAB has gone and
it didn't have any effect on SLUB, but slab_[no]merge are not the case.

Also, technically SLUB is an implementation of the slab allocator concept,
so IMHO it is not an improper name.

and (let's say) even if it is improper, I'm not sure if changing
everything would be worth it:
$ git grep 'slab' mm | wc -l
2365

--
Thanks!
Hyeonggon

