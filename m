Return-Path: <linux-doc+bounces-28131-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CC9A6D9F
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 17:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163851F223AB
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9731EF92B;
	Mon, 21 Oct 2024 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2obhUQE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF87881E
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729523133; cv=none; b=qCjhrbiAovuUSYC3Icjzt0gfjGyfrBQ+2/o2/xJt2+LlAs/XvjrYQz4c0nfCgaBz0km42dHXVAyXwYPeNsyIdcDDR3bUPZeCgOllbKooH4gPuQQT9PBcvREFoc5Ayd7T0VL4vJpnQHjzQJtkvWAruTBVOC5QK4f9aRGN4CoFWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729523133; c=relaxed/simple;
	bh=50bzoL0E5RW9jtb3/55tHhkokdpjPWuz5iPr4mnKF78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxYL6A4Vh+ZxEsOAkePdtKs8jFkcksmkRxF2enIJ8PiGJLYN93aXT4K5AKBuo5+JRXyJeyXdOo7Org01cXMDV3V7L8Ys5jL3WwuhIjeADiSi5SUwZopIi1HOFdSBVeJ59mEPhflpY/fQWsots1P86qrfx7AZLd+ARuBwys/xXK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2obhUQE; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4608dddaa35so442981cf.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729523130; x=1730127930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50bzoL0E5RW9jtb3/55tHhkokdpjPWuz5iPr4mnKF78=;
        b=o2obhUQEUvs2nzyOdKmj3of+1dlQjQTUWPlAwVpHDjAu7Unq3D9QVRoQZEZ4/Zk+sN
         QqumoSpKaFvLgROIuzbxLa82XmziYtcJt6u7rcj9Da0llP6UZDmKFZmHtEUDYTf0Fm6Z
         t549V37XDPzTzWMTbvStFbayTnLSwrpjrQslmMqSyTXgn5RpBYSjuLOujFIzb80FEsYc
         xGw+KFsImIKUeBVLXmlcwOYrqMdvaXG/FlGY3RYzUE4ffxytkKfLfEo90KjvFZplaqJG
         S6s4Ofxgka5fhSql3Naihcsl7OSYxGeD+2P1nPa+LAKXyDEqbwnSaa3iin5S+NG0b5ky
         T4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729523130; x=1730127930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50bzoL0E5RW9jtb3/55tHhkokdpjPWuz5iPr4mnKF78=;
        b=KJsZNM4mJQ2gvHBAy/RWZdgVeLJfLNtuqZtJ6jzlq1ADCtyH2rZtpKquLo2RlL16am
         l9iqYI18jkvU0WBszvxXBEwmf1nutizq5TNp/+pRcYqz4PpYe0GL3lypsmXDsKWLAQIc
         llsdu5VscXGzv+1qG76kZcyMMwxz+q73Hn3SoZb0EEPVjvm5hw6DwltL1hrRiueEmPIk
         JbEUFoT9DF1P7b+AK8jXYH5jseV53byOwvDm1KbSJlyU8I2PEOBn72+mQwLn4W4Z2SB+
         pFgzprvwlUeKUVo7RufUVdKpc1eXp/JbjZCcYHQsb3zBKo1kIJ7u2JvQN/28dlm7SCQC
         stPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmGUC8I90cn+k1Uyqb5wpJ4LHSWu+h/rGJkQ4VXhOQJASMA0NaljmlRiHztrl0rwpVtrlZGTWE6gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkBLF/EIa7rEB7YZCfnQ4m4iKKr36OEHn/mRr885/VPLRe7iu
	tllSqzJYzqF8tZMC0DDER9uqe4a/Gwnf3nzwL+ts5ickWHNuTElLrSmIKkRke6rJ1vw1ViyqzH9
	+wITsSI9RGP23bpN3RUEB6W8zZCQVvQwOaVoI
X-Google-Smtp-Source: AGHT+IEOXV+Q7vMIloFDPvxSVsyITVEcRe5763BxgPsFvYZ2aNgQJzPh1q4g46HKK2Ge4bEfemTrl3UiZHhHOGQk7cA=
X-Received: by 2002:ac8:5a03:0:b0:45c:9d26:8f6e with SMTP id
 d75a77b69052e-460be5cce66mr3744761cf.21.1729523129971; Mon, 21 Oct 2024
 08:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
 <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com> <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com> <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka> <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
 <ZxKWBfQ_Lps93fY1@tiehlicka> <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
 <CAJuCfpHFmmZhSrWo0iWST9+DGbwJZYdZx7zjHSHJLs_QY-7UbA@mail.gmail.com>
 <ZxYCK0jZVmKSksA4@tiehlicka> <62a7eb3f-fb27-43f4-8365-0fa0456c2f01@redhat.com>
In-Reply-To: <62a7eb3f-fb27-43f4-8365-0fa0456c2f01@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 21 Oct 2024 08:05:16 -0700
Message-ID: <CAJuCfpE_aSyjokF=xuwXvq9-jpjDfC+OH0etspK=G6PS7SvMFg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>, 
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, 
	rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de, 
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org, 
	iamjoonsoo.kim@lge.com, rientjes@google.com, minchan@google.com, 
	kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 2:13=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
>
>
> Am 21.10.24 um 09:26 schrieb Michal Hocko:
> > On Fri 18-10-24 14:57:26, Suren Baghdasaryan wrote:
> >> On Fri, Oct 18, 2024 at 10:45=E2=80=AFAM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> >>>
> >>> On Fri, Oct 18, 2024 at 10:08=E2=80=AFAM Michal Hocko <mhocko@suse.co=
m> wrote:
> >>>
> >>> Automatic fallback is possible during boot, when we decide whether to
> >>> enable page extensions or not. So, if during boot we decide to disabl=
e
> >>> page extensions and use page flags, we can't go back and re-enable
> >>> page extensions after boot is complete. Since there is a possibility
> >>> that we run out of page flags at runtime when we load a new module,
> >>> this leaves this case when we can't reference the module tags and we
> >>> can't fall back to page extensions, so we have to disable memory
> >>> profiling.
> >>> I could keep page extensions always on just in case this happens but
> >>> that's a lot of memory waste to handle a rare case...
> >>
> >> After thinking more about this, I suggest a couple of changes that
> >> IMHO would make configuration simpler:
> >> 1. Change the CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to an early boot
> >> parameter.
> >
> > This makes much more sense!
> >
> >> Today we have a "mem_profiling" parameter to enable/disable
> >> memory profiling. I suggest adding "mem_profiling_use_pgflags" to
> >> switch the current behavior of using page extensions to use page
> >> flags.
> >
> > I do not want to bikeshed about this but to me it would make more sense
> > to have an extension paramater to mem_profiling and call it something
> > like compress or similar so that page flags are not really carved into
> > naming. The docuemntation then can explain that the copression cannot b=
e
> > always guaranteed and it might fail so this is more of a optimistic and
> > potentially failing optimization that might need to be dropped in some
> > usege scenarios.
>
> Maybe we can reuse the existing parameter (e.g., tristate). Only makes se=
nse if
> we don't expect too many other modes though :)

Yeah, I thought about adding new values to "mem_profiling" but it's a
bit complicated. Today it's a tristate:

mem_profiling=3D0|1|never

0/1 means we disable/enable memory profiling by default but the user
can enable it at runtime using a sysctl. This means that we enable
page_ext at boot even when it's set to 0.
"never" means we do not enable page_ext, memory profiling is disabled
and sysctl to enable it will not be exposed. Used when a distribution
has CONFIG_MEM_ALLOC_PROFILING=3Dy but the user does not use it and does
not want to waste memory on enabling page_ext.

I can add another option like "pgflags" but then it also needs to
specify whether we should enable or disable profiling by default
(similar to 0|1 for page_ext mode). IOW we will need to encode also
the default state we want. Something like this:

mem_profiling=3D0|1|never|pgflags_on|pgflags_off

Would this be acceptable?


>
> >
> >> We keep the current behavior of using page extensions as
> >> default (mem_profiling_use_pgflags=3D0) because it always works even
> >> though it has higher overhead.
> >
> > Yes this seems to be a safe default.
>
> Agreed.
>
> >
> >> 2. No auto-fallback. If mem_profiling_use_pgflags=3D1 and we don't hav=
e
> >> enough page flags (at boot time or later when we load a module), we
> >> simply disable memory profiling with a warning.
>
> Sounds reasonable to me.
>
> --
> Cheers,
>
> David / dhildenb
>

