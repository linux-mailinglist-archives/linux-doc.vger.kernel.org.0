Return-Path: <linux-doc+bounces-9100-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DA852307
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 01:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF831F23468
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 00:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58064F;
	Tue, 13 Feb 2024 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Fi+X0EZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1F7494
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707783326; cv=none; b=hmzdCD0uTInMHwSpBGggOKXbOb+qfXkVGbfXMHiHUFR36ssgjOb9Xvn6AursAGlJzm8ILkyoAKJxdR+t9DdHTE6CUfTwLp+Lk73KTZTroy5IWuRxXfc5b2morvMfPxfMquOCoeMwFKKA2oss6eT5cymmgwPx5PLaTAr3OptIyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707783326; c=relaxed/simple;
	bh=7Wwz+pVnHJ9jIYCJ6OslYOBAl9//CS1GWKGLZ0scfs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5iScxBpVnMiKRVeatLnCFzQD8TFPlqfSHl+VAeT+uumCX6LO8dFWsi6EbEUBFmFQEUx4yhtRe4pZ3qU1i9E6I9bSPoGUPVRdOI4hA44eqnkaPkufp0BF4od/jrBguu913T+7MzAcYLHopAFl/+5tFLuAdHxDBZOASodNSiWjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Fi+X0EZ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so3321789276.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 16:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707783324; x=1708388124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Wwz+pVnHJ9jIYCJ6OslYOBAl9//CS1GWKGLZ0scfs8=;
        b=0Fi+X0EZMVaI/UinNhEXfp0t8Cm5470SB2bK6OadTq7R3yvD+/e0lXmBXENPBhxCDy
         IysoKO9VDa2guh3MlMCWAvFHHPbEq2TEKG0/1zVc/P5GwMHHucu8VszDo60LhpjLIU1s
         pZaiz3JxDGP5DhSNubs4wBl9pI4YT4BWZzyzrE1D2ImFXtmwl5DqWAo5gfj5UFKdrrs+
         HF3nTcIj9y3xQBaJcTV4EC3MmXTKb5gxTH4s/wMmVLWDAXTXW+JoIcnEYfwEOMv0nYeh
         X+eTco00/QlypK57fsP5qA3YaPj7IwiS7Vt3cc7xqW9huiwTvWw0jPmpjkZ2dxI3dn+Z
         euFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707783324; x=1708388124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Wwz+pVnHJ9jIYCJ6OslYOBAl9//CS1GWKGLZ0scfs8=;
        b=FWApZHfh2PCzzOEBnyCsqOYFZk0EtDXCBOwgwTWK6GIPi1JiUUBFalPs6HgcUswemV
         9r5gEN5UE4mzhn4dJlair0+3xiJ29hzIe3VttPK5duII/NYCivJvegTovHYDD+68bUnT
         XR+Y5LH8yQRo/IrE9p/Y1RH9pgiNZM2ZzPMyHkYqU6xsuuTPcmmZJH4weSzU99NlVsui
         bo1uVTb7Sa8dYifDUnAFN0nEAOli4X3XC34XTIEiazT+D63TTKyZS3lurSUYLntPYSVs
         VIMoj8Qi77WsBM/xOEID0QBPio7XHNgZfxR1rpsFnBkju7/P2wX2TSzmiHkXnA/GoRZx
         lv4A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4gC8cVOablEV/lMQ1NrE0+56sE8f3mSJOOhcBpMnd6wzML4M3n2N1z02K9ATRtmGygYLwSHpCNJYbyXyNvozBKNY5VcNst8E
X-Gm-Message-State: AOJu0Yyt0mz9AnsE39w5MNUqpQbd2a2TtflpTbVJOLacjDSYd6naBJU8
	SWUsNHHtZ269OFRh1le+zZ1LLDM0O2q0ROtRVPhM0YRftzaQkwDTJxnzKSQ+6u5yWyyHw3fkgc3
	RA43f17n/GJ+81xPfND9nY47C2QJQ8cBPP+0e
X-Google-Smtp-Source: AGHT+IFIduuZE1STvNicF9DxUXXadRzIx8lN/0f7DXD7a7IgTSoghi+1HrvGMrI5m8lZfvX3Zk7o2MADsuuEWWIky8I=
X-Received: by 2002:a25:ac68:0:b0:dc6:d158:98f0 with SMTP id
 r40-20020a25ac68000000b00dc6d15898f0mr6974706ybd.52.1707783323411; Mon, 12
 Feb 2024 16:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-34-surenb@google.com>
 <202402121445.B6EDB95@keescook>
In-Reply-To: <202402121445.B6EDB95@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 Feb 2024 16:15:12 -0800
Message-ID: <CAJuCfpEoS=ea90EHHc-Kwg3G3_ZWsVgKvhRiZ4SVuGARBe=vnA@mail.gmail.com>
Subject: Re: [PATCH v3 33/35] codetag: debug: mark codetags for reserved pages
 as empty
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:45=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Feb 12, 2024 at 01:39:19PM -0800, Suren Baghdasaryan wrote:
> > To avoid debug warnings while freeing reserved pages which were not
> > allocated with usual allocators, mark their codetags as empty before
> > freeing.
>
> How do these get their codetags to begin with?

The space for the codetag reference is inside the page_ext and that
reference is set to NULL. So, unless we set the reference as empty
(set it to CODETAG_EMPTY), the free routine will detect that we are
freeing an allocation that has never been accounted for and will issue
a warning. To prevent this warning we use this CODETAG_EMPTY to denote
that this codetag reference is expected to be empty because it was not
allocated in a usual way.

> Regardless:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

