Return-Path: <linux-doc+bounces-1629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B187DF74A
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 17:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E00AB21353
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 16:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3531D6AF;
	Thu,  2 Nov 2023 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="G1G9RzlE"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1271D6A9
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 16:03:20 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA90512E
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 09:03:12 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41cbd1d7e04so5922171cf.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Nov 2023 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1698940992; x=1699545792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALiAo4buXiADi7F2Q23wsqEzCK2Th70JCnzOvrzRQhs=;
        b=G1G9RzlEVFtuWAUXMau2IDMfe+NnVJ/jE3pIjlRkzfsY6B6SnjamUd2O10qx84R58V
         +SL9lrlxTWuXejQ6IwZckAt2g0JHrxdn4BCH3cR0j6E/MwbXwekiappHxlWOvQM2KEDL
         myhsbRbKEaRmjLqfZkujbuJQ4T24AESRvJrx12EyBNJxuJ9G2CCuuRGRbSQn4wKaX9fp
         SH/58QjSIBpa4RvdSdbg84kd8TZDQ7m7/+/1WDNDF8zSNBvo0OiphVUhzB4fbJBULvXg
         he2eVtWnMvJWJr1t2hB9BWkSV60cJRCda+hEYNl/rbm4YaoKoTSk4Z6M5b/PfWaA13I7
         3MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940992; x=1699545792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALiAo4buXiADi7F2Q23wsqEzCK2Th70JCnzOvrzRQhs=;
        b=MI640QDZYKsnXT1CjS8EC5/qWp+gGJnHwIRKCsN0+H9L7AMORcm6OLU5XHu0j3i10w
         MsaWffUx5h5q+WEpKtyY/pQ6wcoDDuVBihdWx5VZRqKLn+Z+uyTrTwjRK9iPKD0NuU4T
         0pWvzrp5LXPDeGHg5jHOd4rtetrbBpT43+rNoe6t5/ASyuykvMWveiRctiKSxIBKIyVo
         ToJT/HntFlF11Wd1IKFBxMM/c/gVeqiBIu8gPzK383o2IlC76pUez0hf1eWmPGyJR+Td
         FcyuOKbe8aZRMdvS4t0xQUCAurt+G2KZvPIQm+mmR3QyEGROnqiNrHZFsNIx7aLwy27m
         ktyg==
X-Gm-Message-State: AOJu0YyioDET5TriWXEoAuo2Pn+dLZThgiBUNnNcbe6YvZlfEqmHW4mb
	HuILMt+uZlb8bSD77+9VNK+Az9Bb48ir/A3RohtFQg==
X-Google-Smtp-Source: AGHT+IGtgUg/B0VGGppDeKhvpeBVvLkJIak1rPzXdw9Ov5a92DYkvep/G1D8BjVyG2BXYDhpoFjsmcCqXXp5HGqdRts=
X-Received: by 2002:a05:622a:1a16:b0:41e:280d:4e28 with SMTP id
 f22-20020a05622a1a1600b0041e280d4e28mr23844567qtb.40.1698940991420; Thu, 02
 Nov 2023 09:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231101230816.1459373-1-souravpanda@google.com>
 <20231101230816.1459373-2-souravpanda@google.com> <CAAPL-u_enAt7f9XUpwYNKkCOxz2uPbMrnE2RsoDFRcKwZdnRFQ@mail.gmail.com>
 <CA+CK2bC3rSGOoT9p_VmWMT8PBWYbp7Jo7Tp2FffGrJp-hX9xCg@mail.gmail.com>
 <CAAPL-u-4D5YKuVOsyfpDUR+PbaA3MOJmNtznS77bposQSNPjnA@mail.gmail.com>
 <1e99ff39-b1cf-48b8-8b6d-ba5391e00db5@redhat.com> <CA+CK2bDo6an35R8Nu-d99pbNQMEAw_t0yUm0Q+mJNwOJ1EdqQg@mail.gmail.com>
 <025ef794-91a9-4f0c-9eb6-b0a4856fa10a@redhat.com>
In-Reply-To: <025ef794-91a9-4f0c-9eb6-b0a4856fa10a@redhat.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 2 Nov 2023 12:02:34 -0400
Message-ID: <CA+CK2bDJDGaAK8ZmHtpr79JjJyNV5bM6TSyg84NLu2z+bCaEWg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] mm: report per-page metadata information
To: David Hildenbrand <david@redhat.com>
Cc: Wei Xu <weixugc@google.com>, Sourav Panda <souravpanda@google.com>, corbet@lwn.net, 
	gregkh@linuxfoundation.org, rafael@kernel.org, akpm@linux-foundation.org, 
	mike.kravetz@oracle.com, muchun.song@linux.dev, rppt@kernel.org, 
	rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com, 
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com, 
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 11:53=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 02.11.23 16:50, Pasha Tatashin wrote:
> >>> Adding reserved memory to MemTotal is a cleaner approach IMO as well.
> >>> But it changes the semantics of MemTotal, which may have compatibilit=
y
> >>> issues.
> >>
> >> I object.
> >
> > Could you please elaborate what you object (and why): you object that
> > it will have compatibility issues, or  you object to include memblock
> > reserves into MemTotal?
>
> Sorry, I object to changing the semantics of MemTotal. MemTotal is
> traditionally the memory managed by the buddy, not all memory in the
> system. I know people/scripts that are relying on that [although it's
> been source of confusion a couple of times].

What if one day we change so that struct pages are allocated from
buddy allocator (i.e. allocate deferred struct pages from buddy) will
it break those MemTotal scripts? What if the size of struct pages
changes significantly, but the overhead will come from other metadata
(i.e. memdesc) will that break those scripts? I feel like struct page
memory should really be included into MemTotal, otherwise we will have
this struggle in the future when we try to optimize struct page
memory.

