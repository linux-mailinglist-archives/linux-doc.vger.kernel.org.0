Return-Path: <linux-doc+bounces-4200-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B1806362
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 01:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9FC282182
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 00:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD9019F;
	Wed,  6 Dec 2023 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnyz45az"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1941AA;
	Tue,  5 Dec 2023 16:22:43 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7c58518503aso877888241.1;
        Tue, 05 Dec 2023 16:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701822162; x=1702426962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUFVrntTy1cLOik0xNDwq8kH21En+z5/DrAlh/czNd4=;
        b=Jnyz45az5guo8PWzLpoGLQN1XQJ3IBRXhwiHc+YRzHhTvlJKhPpSglO4ABxG92PvaZ
         OU7vwaF2558qN70y6+OQVnWJEOsd1y5w3jpFVQsvEOb7igreA8hT1+3MJP3OTf+YuJha
         aPMb8TondWgNfxvESsqLihPKmI4UTMIleqRAv8WgTi2WL8m1LEaAkvW7mQ9HPcOWhX0c
         O8hmMklQr9TGBXsR/MevW9cASGes5u8g4Rce1UCyKBGtOkzAMq5eZAeQkwAMGoS5ieHE
         bJwobOZbW5B6K8fGKvvcmXZRS9Sx7tWtjee+9wUegvE3TkotFbqygi8ABmOYlm6nheFX
         cAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701822162; x=1702426962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUFVrntTy1cLOik0xNDwq8kH21En+z5/DrAlh/czNd4=;
        b=HokF2CI1GbUi4iLWBAOgf0YWuggEJ7euUUw8E1aZchvOw9ttSjNzFVOnGFffXljZL+
         xyKYh2TaMfU9Rct/PImml6vCXaTP+5GDDuafmlEHxmr2wjIASdoWZiTseE9PSvkGZPEW
         lmFTRRK2WYP0kDVnMNpCVM3ysDSER0rdxkIHNS4RdriWYBavU/YGpN+yKfCIeg4sGUNE
         G6vA210OJgH/ab7chGbC/uEDTLqNwAzGPgz+6qyILfFMRF09R76LMnVusIXwCWO0k8P6
         8Sw2gL3YR9F9/K+9gnY7Q/gaWoNhRVDvFtoz+viwwvz8TG/K6u4NwRSn++bNs3EiCRqB
         fXFw==
X-Gm-Message-State: AOJu0Ywb/ntQZr+xj3pDOgaz/wG8bAArQwfO2NLa0nDvuekwFXPbOtHo
	awgb+35PY3L19Qf0e+mKGPcccdjq30TIHYzuIEk=
X-Google-Smtp-Source: AGHT+IHBU1XdqMtf2ZU4xJh9IQy5wJjx4dbdlFDVHgf7/Bio26uron0S46imRkJiNHrZlQ7I4XSNL+wC0b6HVc/Cgao=
X-Received: by 2002:a67:ee1a:0:b0:464:9e34:e452 with SMTP id
 f26-20020a67ee1a000000b004649e34e452mr107173vsp.2.1701822162132; Tue, 05 Dec
 2023 16:22:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203001501.126339-1-sxwjean@me.com> <20231203001501.126339-4-sxwjean@me.com>
 <CAB=+i9TVfzWk=anexu6ARPA21AC-uhjQjf4brZF0XDfVaWraWw@mail.gmail.com> <PH0PR11MB5192C8CFE3FC4CF1BCA74796EC85A@PH0PR11MB5192.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5192C8CFE3FC4CF1BCA74796EC85A@PH0PR11MB5192.namprd11.prod.outlook.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Wed, 6 Dec 2023 09:22:32 +0900
Message-ID: <CAB=+i9TM04LaTMNatZH+LBVVy0N30ZzHYE+XqJm72P5wu6bHsA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/slub: correct the default value of
 slub_min_objects in doc
To: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
Cc: "sxwjean@me.com" <sxwjean@me.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "cl@linux.com" <cl@linux.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "penberg@kernel.org" <penberg@kernel.org>, 
	"rientjes@google.com" <rientjes@google.com>, "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>, 
	"roman.gushchin@linux.dev" <roman.gushchin@linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"keescook@chromium.org" <keescook@chromium.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 11:11=E2=80=AFPM Song, Xiongwei
<Xiongwei.Song@windriver.com> wrote:
>
> Hi Hyeonggon,
>
> > -----Original Message-----
> > From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > Sent: Tuesday, December 5, 2023 8:54 AM
> > To: sxwjean@me.com
> > Cc: vbabka@suse.cz; cl@linux.com; linux-mm@kvack.org; penberg@kernel.or=
g;
> > rientjes@google.com; iamjoonsoo.kim@lge.com; roman.gushchin@linux.dev;
> > corbet@lwn.net; keescook@chromium.org; arnd@arndb.de; akpm@linux-founda=
tion.org;
> > gregkh@linuxfoundation.org; linux-doc@vger.kernel.org; linux-kernel@vge=
r.kernel.org; Song,
> > Xiongwei <Xiongwei.Song@windriver.com>
> > Subject: Re: [PATCH v2 3/3] mm/slub: correct the default value of slub_=
min_objects in doc
> >
> > On Sun, Dec 3, 2023 at 9:16=E2=80=AFAM <sxwjean@me.com> wrote:
> > >
> > > From: Xiongwei Song <xiongwei.song@windriver.com>
> > >
> > > There is no a value assigned to slub_min_objects by default, it alway=
s
> > > is 0 that is initialized by compiler if no assigned value by command =
line.
> > > min_objects is calculated based on processor numbers in calculate_ord=
er().
> > > For more details, see commit 9b2cd506e5f2 ("slub: Calculate min_objec=
ts
> > > based on number of processors.")
> > >
> > > Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
> >
> > While slub_min_objects equals zero by default, 'min_objects' overrides =
it to
> > 4 * (fls(nr_cpus) + 1) when not set. so when slub_min_objects is not
> > set, it would be
> > equal to or higher than 4. I'm not sure this level of implementation
> > detail is worth documenting.
>
> commit 9b2cd506e5f2 ("slub: Calculate min_objects based on number of proc=
essors.")
> has already given "processors min_objects" pair, do we really need to doc=
ument
> the specific detail?

No, I don't think it needs to be documented, but neither do I think
"slub_min_objects is
0 by default" is correctly documented...

> > Also, I think patch 2 should update Documentation/mm/slub.rst too.
> > (slub_$param -> slab_param)
> I think people can know slub_$params are still supported by
> Documentation/mm/slub.rst, so we don't need to say the info again in
> this file.  Is it better to do so just before removing slub_$params
> completely?

If we're deprecating and planning to drop slub_$params in the future,
IMHO it'd be less confusing if we change it now, rather than
when removing slub_$params completely (probably 10 years later)?

Thanks,
Hyeonggon

> > > ---
> > >  Documentation/mm/slub.rst | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
> > > index be75971532f5..1f4399581449 100644
> > > --- a/Documentation/mm/slub.rst
> > > +++ b/Documentation/mm/slub.rst
> > > @@ -150,7 +150,7 @@ list_lock once in a while to deal with partial sl=
abs. That overhead is
> > >  governed by the order of the allocation for each slab. The allocatio=
ns
> > >  can be influenced by kernel parameters:
> > >
> > > -.. slub_min_objects=3Dx          (default 4)
> > > +.. slub_min_objects=3Dx          (default 0)
> > >  .. slub_min_order=3Dx            (default 0)
> > >  .. slub_max_order=3Dx            (default 3 (PAGE_ALLOC_COSTLY_ORDER=
))
> > >
> > > --
> > > 2.34.1
> > >

