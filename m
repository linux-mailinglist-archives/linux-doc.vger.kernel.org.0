Return-Path: <linux-doc+bounces-4296-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B180775D
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 19:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34AC1F2105E
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 18:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02043C493;
	Wed,  6 Dec 2023 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBPJbL2S"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03469139;
	Wed,  6 Dec 2023 10:16:08 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7b389399dfdso2252039f.2;
        Wed, 06 Dec 2023 10:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701886567; x=1702491367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWAuKbmc4GqDy2A6rXUBPXUJNeUa8820dSUeOYSYNt8=;
        b=lBPJbL2S1TEBPSIZbkawYgKsUuydV4LjcC2j78T85S803TF93P2AhlfIOfksbkMi0P
         y+LFIkLdNK8OaZQ6deOU6TsHxyL57QTUUO8RKncz+oJw8RxHbc3y6OV9jKoTT8UfvspE
         i7jjiqIuprT33JoWvs8YHASLUfWKKBrSu7SAOaVW1PonOf7wLNlEYpjmiufXkkzmlmKG
         aF2ktP4Tv1dfZdjmavrRWR+UzWwzYKSR0I1IlsdVR/SBKNotbQSAEd09fQdYPvpiVAgZ
         5Ctn9RlC09pO8NrCE3CHIo3a7v/uZtDG5en6wcrakatNAhvNj9H6KNVQTPmYTGS/4Eqy
         X+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701886567; x=1702491367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWAuKbmc4GqDy2A6rXUBPXUJNeUa8820dSUeOYSYNt8=;
        b=RpS+Ebm8ZzG6Nsl3c7mCXsFv5IjJ56/xkSHn62W8LAjEKiuMNVthAtdijxGzItGIeX
         LMmXaIfugjDCvKWUPaqt9ttwRGGyXCQQq1tGkcTTMoQlAapiXHIR2s6C+AyT24tiOVkc
         brtD/2f6t1T7RT6BLciV8tDQAc1UpvUl4CZpYR+jGc3o5ERHyw3uSQvyrFmF7AYQVMxd
         AxuY86nE566BP5LhUYxlfrmcX+ALnfH1kygnHvxUQsL2G8oXMFQri13HthdQg/NPoJHz
         jz4EwN/PvgfD1KbyAuah9dcVlPSljaEG4JAULQ5PWAFeMODU2WnerHwR3FtW8kEDs13F
         tG0g==
X-Gm-Message-State: AOJu0YywWWSUibvKHwV6EyZSpNQ8SQFBLsEAQbmpYcHsLwkVmr6NiOxC
	TT+YFh7Pk8Ry1KhZyN+uSW9URqoZxou1cC9T8SpP/8SxBSA=
X-Google-Smtp-Source: AGHT+IFKnF3lw3Ax+avLPvnMd5vBZM4imRq0qasjFDFvW3fh5H8dgaFBeFrpeGdZS7/1eSisn26RBDrtRJrc1qJUFxw=
X-Received: by 2002:a6b:ed19:0:b0:7af:fff7:c3f8 with SMTP id
 n25-20020a6bed19000000b007affff7c3f8mr1385949iog.15.1701886567239; Wed, 06
 Dec 2023 10:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115172344.4155593-1-nphamcs@gmail.com> <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com>
 <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
 <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
 <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
 <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
 <ZVrHXJLxvs4_CUxc@google.com> <CAKEwX=MR6a-u87p=Oqm+zvwB_1zhrsM_n2=xW1kJz0_AoVwkPA@mail.gmail.com>
 <CAF8kJuNFQn_e29YEPy-G29FR2RnrPzZNWR07VuadOTNask_Rig@mail.gmail.com>
 <CAKEwX=NpKqjApRKk2Qp9Hp63xSjRwD-DEu9yX4BvbMd86x2b1g@mail.gmail.com> <CAF8kJuMp_BNauZzOuqXNiViuY2JH=JKWid2-_BwQjDTWptoryg@mail.gmail.com>
In-Reply-To: <CAF8kJuMp_BNauZzOuqXNiViuY2JH=JKWid2-_BwQjDTWptoryg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 6 Dec 2023 10:15:56 -0800
Message-ID: <CAKEwX=NwGGRAtXoNPfq63YnNLBCF0ZDOdLVRsvzUmYhK4jxzHA@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Chris Li <chrisl@kernel.org>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz, 
	Minchan Kim <minchan@google.com>, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 7:01=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
> On Tue, Nov 21, 2023 at 5:19=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
>
> > > "all": zswap + swapfile
> > > "zswap": zswap only
> > > "no_zswap": swapfile only.
> > > "none": no swap.
> > >
> > > All keyword names are open to suggestions.
> >
> > SGTM! There might be some functionality duplication between
> > memory.swap.tiers =3D no_zswap and memory.zswap.max =3D 0, but
> > otherwise this seems reasonable to me.
> >
> > no_zswap sounds a bit awkward, but I can't come up with a better
> > name.
>
> I sleep on it a bit. I  should apply my own suggestion of using the
> positive words rather than negative one to myself.
> I actually define it as a non RAM base swap device. How about "disk"?
> It will include SSD and HDD disk.
>
> The current 4 combination will be:
>
> "all": zswap + disk swap file
> "zswap": zswap only
> "disk": disk only (including SSD and HDD)
> "none": no swap for you.
>
> Chris

Hi Chris,

I chatted with Johannes a bit more about this design. While we still
think it's potentially useful for the future, it lacks a concrete use
case at the moment. We don't even have the infrastructure for multiple
swap tiers at the moment, so adding this interface now is just making
it more confusing for the users. I think zswap.writeback is a much
more specific interface, with concrete and immediate usability (it
stems from internal chatters and requests - so the demand is already
there).

I think we should just land the change we currently have (rebased on
top of mm-unstable to resolve merge conflicts etc.). I don't think
zswap.writeback will get in the way of any swap.tiers functionality,
correct? There might be some functionality duplication, but that's not
too bad IHMO. Then we can work on swap.tiers design and implementation
as we add the support for multiple swap tiers.

