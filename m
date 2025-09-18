Return-Path: <linux-doc+bounces-59833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C7B52684
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 04:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500C6581D5C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 02:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6326D200BA1;
	Thu, 11 Sep 2025 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjqBdfYr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D961A9FBA
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757558145; cv=none; b=uj9QRCdp6WmVxISFwiiQH3VXG0vO6sugBNVU6AqvHNQkRu21jes9b9xx5yzm4u402Fkmcj7+IdDnA60c3vFaQ8ruzEQb0fzGbS/i6RV99cPCiZAWByQ4QWh3tgBHposmvNhpNXSpY48HPw9l8hhu8TZTPTHla60nuTGVNUcOkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757558145; c=relaxed/simple;
	bh=WSPjJ7rv/Wurgp+6YWtIISAYDxL8zA2TbLbbZ+nc5T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nkab/AvHBmq0/YORRDixSuh1eWnDfnz0f0rf2gXlTnwfd1NYjwNa3xo/K9IjJP0gdqVcOz1hDcbh/1+d5et/hIAK9Zz4x9yQM4DNL5das959zx9ChAQQEAd2aHFXMCpc7unxaPOxL7FyhIBWXLFUyQ5pBNf0bRLOaXk4YHv4bTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjqBdfYr; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70fa947a7acso538286d6.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 19:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757558142; x=1758162942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vb0qYaqmVSkWJUt9xOeYowmF68E2HlHjMlrygJw5Ps=;
        b=BjqBdfYr1pK+LRSO4n7MLjEkyN9fsDb0Q3J9zCJm9/GoTZCp+PkcQHpck/8/SpIEk7
         DtSx4z8gkoEwby2anzZdDQ6Pc1PENzOI4S7qULlz9B2POjPgF5itHhLyJvXmsu4AfN/D
         zoIodCLSigHOuI2XFsXVYxeC4UFkkgDJ7dOO4SW+JhKOFF8/9k9hmP7wh9sxEx/pjyD6
         4yOmUfUL6cK5V2ECBNGUdcI4Ro8hwa/COkAigMCYrUB50FAKuPIf63oLiWSSMAkLd+3A
         b6npRS8xl8bk//1UrqEMau93g8CMck0TAHa02X+X85gOlbwLjHt/sWEVGNh7jWWeP7d7
         AgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757558142; x=1758162942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vb0qYaqmVSkWJUt9xOeYowmF68E2HlHjMlrygJw5Ps=;
        b=qmHW+XxbFw04aWA2V+kDQaUdbap5mtYr+ecxDCKDfjzd2Aohl5EGH9irb2YRielIkd
         1+fSU/9JbaajYlmjgJFQGX5iT0b6S5FEP9XsSoDDWffTezbtkr4TAaE1Mq0zhDplUHrS
         b9HDbHf9qWUEXFMmLfl7ZpJ/UgHbJYlips2RvD3WI2Y2Vp8HmDoqR/GT1MYTjggah6fZ
         AGDzrA0mFyQ/te6AYZFi2W5F1fXMlxFxYQS7244UcB1BsWYaBYpNIqFZ30Px0Lm4OQU2
         qlvS/wkh6XgNE3FiY4+PPxAlWPM3wzBn1XeefMuruak8DvFkn0HLlB0e2S5diGtrSFB3
         fX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4HFvHDs0E3KqczyQb8bH1FXKlSCKaJYFWmOAY6KrnPihvd87FK7npu9tABDmHZt74B1O79aSPEaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgaz06UAv+icIOQFs+km9ex7lOvsE8d8HFRSiGkz0YU0Aq3Jb
	mq2kZhQ4OzPmmLq5zNjwV1rT96c0Neg0QYB5vapVR8GHgrExd1JMDy2zzIOeNYVBgFNnDSnbsno
	ZpNtdYw51PDztEt5CZxR03xRR6QAMN1gHHkYXPKHASQ==
X-Gm-Gg: ASbGncsd4OmpskcA9q0Ak6XQIav9wE1IjEeOK3Ln4FxiRYIBRoBYQu3Om39L0uNSaC8
	WKU7M8AhyQo4DcQDG1bDuirKeGSOmyWP+GpdrzIMws0/y7kRkyciVbZcZt7SL2MaVOWRQjyq3Rj
	qoMQm9h6olkec4nFMRunCFp6eFHu22EO6RuJc5j66iexQzNNlfQcziDMTX0ieEagY3E7Eml6Kxm
	ZsWsrxCw2hCv+W1OeSv0+LvokmsDepJo6mtLy8j/20b8Fzm/kE=
X-Google-Smtp-Source: AGHT+IEQuOALHNasxHg4cvt9OwSYb+br0tjCphBPeNs06MifOpRvuGmCrw3mRabXyOespOL+oB9+DxVIm2bQo1YAM1M=
X-Received: by 2002:ad4:5aad:0:b0:721:ae2c:599f with SMTP id
 6a1803df08f44-739431f1ccdmr178704756d6.46.1757558142442; Wed, 10 Sep 2025
 19:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-2-laoar.shao@gmail.com> <202509110109.PSgSHb31-lkp@intel.com>
 <49b70945-7483-4af1-95ba-e128eb9f6d7e@linux.dev> <DF4CA2C0-25AF-462B-A6D2-888DB20E0DFA@nvidia.com>
In-Reply-To: <DF4CA2C0-25AF-462B-A6D2-888DB20E0DFA@nvidia.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 11 Sep 2025 10:35:06 +0800
X-Gm-Features: AS18NWCT1WMJgiNa7kbBl9p5Ko8LuUJHHLo5A82nBykaRI1tVPLVfUPD6miHkHg
Message-ID: <CALOAHbAWwX2Y50J=H8=ahXk0t9fWh=61gd82E7LJd_k5jWg3EA@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task from khugepaged_mm_slot
To: Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	gutierrez.asier@huawei-partners.com, rientjes@google.com, andrii@kernel.org, 
	david@redhat.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ameryhung@gmail.com, ryan.roberts@arm.com, lorenzo.stoakes@oracle.com, 
	usamaarif642@gmail.com, willy@infradead.org, corbet@lwn.net, 
	npache@redhat.com, dev.jain@arm.com, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	hannes@cmpxchg.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:28=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 10 Sep 2025, at 22:12, Lance Yang wrote:
>
> > Hi Yafang,
> >
> > On 2025/9/11 01:27, kernel test robot wrote:
> >> Hi Yafang,
> >>
> >> kernel test robot noticed the following build errors:
> >>
> >> [auto build test ERROR on akpm-mm/mm-everything]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-=
thp-remove-disabled-task-from-khugepaged_mm_slot/20250910-144850
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm=
-everything
> >> patch link:    https://lore.kernel.org/r/20250910024447.64788-2-laoar.=
shao%40gmail.com
> >> patch subject: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task f=
rom khugepaged_mm_slot
> >> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20=
250911/202509110109.PSgSHb31-lkp@intel.com/config)
> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250911/202509110109.PSgSHb31-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110109.PSgSHb31-=
lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>>> kernel/sys.c:2500:6: error: call to undeclared function 'hugepage_pm=
d_enabled'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
> >>      2500 |             hugepage_pmd_enabled())
> >>           |             ^
> >>>> kernel/sys.c:2501:3: error: call to undeclared function '__khugepage=
d_enter'; ISO C99 and later do not support implicit function declarations [=
-Wimplicit-function-declaration]
> >>      2501 |                 __khugepaged_enter(mm);
> >>           |                 ^
> >>     2 errors generated.
> >
> > Oops, seems like hugepage_pmd_enabled() and __khugepaged_enter() are on=
ly
> > available when CONFIG_TRANSPARENT_HUGEPAGE is enabled ;)
> >
> >>
> >>
> >> vim +/hugepage_pmd_enabled +2500 kernel/sys.c
> >>
> >>    2471
> >>    2472      static int prctl_set_thp_disable(bool thp_disable, unsign=
ed long flags,
> >>    2473                                       unsigned long arg4, unsi=
gned long arg5)
> >>    2474      {
> >>    2475              struct mm_struct *mm =3D current->mm;
> >>    2476
> >>    2477              if (arg4 || arg5)
> >>    2478                      return -EINVAL;
> >>    2479
> >>    2480              /* Flags are only allowed when disabling. */
> >>    2481              if ((!thp_disable && flags) || (flags & ~PR_THP_D=
ISABLE_EXCEPT_ADVISED))
> >>    2482                      return -EINVAL;
> >>    2483              if (mmap_write_lock_killable(current->mm))
> >>    2484                      return -EINTR;
> >>    2485              if (thp_disable) {
> >>    2486                      if (flags & PR_THP_DISABLE_EXCEPT_ADVISED=
) {
> >>    2487                              mm_flags_clear(MMF_DISABLE_THP_CO=
MPLETELY, mm);
> >>    2488                              mm_flags_set(MMF_DISABLE_THP_EXCE=
PT_ADVISED, mm);
> >>    2489                      } else {
> >>    2490                              mm_flags_set(MMF_DISABLE_THP_COMP=
LETELY, mm);
> >>    2491                              mm_flags_clear(MMF_DISABLE_THP_EX=
CEPT_ADVISED, mm);
> >>    2492                      }
> >>    2493              } else {
> >>    2494                      mm_flags_clear(MMF_DISABLE_THP_COMPLETELY=
, mm);
> >>    2495                      mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADV=
ISED, mm);
> >>    2496              }
> >>    2497
> >>    2498              if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm=
) &&
> >>    2499                  !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> >>> 2500                    hugepage_pmd_enabled())
> >>> 2501                        __khugepaged_enter(mm);
> >>    2502              mmap_write_unlock(current->mm);
> >>    2503              return 0;
> >>    2504      }
> >>    2505
> >
> > So, let's wrap the new logic in an #ifdef CONFIG_TRANSPARENT_HUGEPAGE b=
lock.
> >
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index a1c1e8007f2d..c8600e017933 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -2495,10 +2495,13 @@ static int prctl_set_thp_disable(bool thp_disab=
le, unsigned long flags,
> >                 mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
> >         }
> >
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >         if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm) &&
> >             !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> >             hugepage_pmd_enabled())
> >                 __khugepaged_enter(mm);
> > +#endif
> > +
> >         mmap_write_unlock(current->mm);
> >         return 0;
> >  }
>
> Or in the header file,
>
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> ...
> #else
> bool hugepage_pmd_enabled()
> {
>         return false;
> }
>
> int __khugepaged_enter(struct mm_struct *mm)
> {
>         return 0;
> }
> #endif

Thank you, both. I will address this in the next version.

--=20
Regards
Yafang

