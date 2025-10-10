Return-Path: <linux-doc+bounces-62894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A659BCB5E1
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 03:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DABC7353DE6
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 01:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A70224245;
	Fri, 10 Oct 2025 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rzasn+9e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1112868B
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 01:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760060593; cv=none; b=h56cZeOWrDKXEGxpBMuLv4uUFfmoaoe3ECir+gFHU44O94rNP8OactEiJ5CdMLO0anSMONDqWikIMDd3wHI2/2CeptQ6ck5FOSIW98cOAmik1FIAYZzERhZqQF6WxoVWAK+3BsP5Qe6rcqlUjDJh+yNGF9NblQ++udLYydtqh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760060593; c=relaxed/simple;
	bh=NPtqkvv98yoDXNHLCe00Nr0xHDE7ZeJDXsad4q7/TKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmZvf2TPOe/6jZXGXe1c96zeKRnabrBG5QrsL8mINKqT67jhM/NHSd507AsXBUy0sReCjwevecamXlv+O3HTJRNwGYN38cox5qNjiff7+zT7psXUNtCfbvdQw2aDrHYY0Cw5DmFu02r4eUATluXMoA/vMGPFG/OjzPTyP2Vzsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rzasn+9e; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4dcc9cebfdfso81611cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 18:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760060591; x=1760665391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96az3arQQNj4x6OI7kGaXy8qdPeeaXxUJmGrbGqdnv8=;
        b=Rzasn+9eJppPsdUMJ3MSSJXH2S/OCfdfLO3/o7zwuilOebMaSu+By6jirbcfXXlwNA
         q7iELuvNDD3adEbN6B4GdvOs8V4aak+EWesVu80vRrtejs3GxHTXC1GUbKweuga3nyYZ
         RVWIJvAsYlsldEHXglb65xzD0J0+LGcCu5mVoqI7KYtImlKX5iw731TvVKTXUqbZuw10
         4AjUatn75XlthFJni99tkiIL3NdGmgX2+WUUB0JNBUpCtJ5+ySw64rUsv/rxw9jTMXx2
         z+3Otik7wjpNiTz1uz9WXf8J2LzQ9Clb6gfi65JPhbcGqbSL6AOABFVGSe9ylOgfwpf6
         rwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760060591; x=1760665391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96az3arQQNj4x6OI7kGaXy8qdPeeaXxUJmGrbGqdnv8=;
        b=pLjYgvFYTUaot18GymOf9PjicdIsbIzmOvpLhx55JxgnbHrx4ZlRByRReM6R+vuUpe
         BScjQUnyABe8pcTiH3T8f+eoHTNUspPGYCKLZwU7pIszqsz6Ibxmh7/ymApMooDnHUaD
         YtCaDvy7sGvqC5u7vBZIout4CsxbicST80hYe9xHZ+ETaA0x1M8dC3PMJbYWJXgNKD5o
         BWMlzzthljyTCde+1sQCu+GJj4fJIet6GXM4mvY0o2HVgZFGwhZ23ozdAT3Apz4wLpq1
         3OgstcunCIiQYh3PH/jbMsI7p0xtvyrZcZ6K6/PvuPexUkl/4Rk90bBPxQlYZecKE+Kh
         DjXw==
X-Forwarded-Encrypted: i=1; AJvYcCUGthpgM3fSEGDI+Dkc2Uj3DbipyM/sCXRkiJglvxvAYhD1nTLoCjzkEQWA6oAvVPYdaSMOret/69k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1SnwXDUL8gzJl+X0t9lCJvTVdmaLZSJ350/D/SHlbvkIttwuf
	iQh6959BksSuDipIDsP5lKVmxQ+kWZo3UbUF1sBZhfvhuTUg+mNa/41M4TrlQMs+Qk+xS/5N7ko
	hFRSeicsP3/C+15OmGQen7WOJJUkfVfUYrFfPRhq5
X-Gm-Gg: ASbGncs+r/BEUnrmICYe4lnGGqvy/118D/3yO7Dhr290w4yNPAdawRnPr6+ZuOZJb8E
	otE+vyq7AW0puKD8mWta3rDwgxBuJsNgmjb0ORJkvEQy9MmBhlWmqCbz8Z2577XoK4aI2S0K36N
	lLIbt9qUkdUPqTpbObz7oHs9pcYWf2X2vZSopJlPg2ieV9u3l2zzfhiop3+DQtkto74G5iz2JDS
	/XilvebVuSW9R0iL0Hp5rmk5+rIhMErlvxEGtUFg13ba5twxoZYACi2L4cWQ/I9PLNPKqVoId+0
	3b4=
X-Google-Smtp-Source: AGHT+IGu0DK2CtCxN7hIIonTOKdPg8kH2c5mClv9tYOC7wcuhU0agjHl/Z5qabjh4i0XRN459MUgMBBjudlklfZKzww=
X-Received: by 2002:ac8:590c:0:b0:4b7:a72f:55d9 with SMTP id
 d75a77b69052e-4e6eac2a26bmr18693271cf.13.1760060590253; Thu, 09 Oct 2025
 18:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010011951.2136980-1-surenb@google.com> <20251010011951.2136980-2-surenb@google.com>
 <20251009183145.3ed17cb0819f8b7e7fb4ec43@linux-foundation.org>
In-Reply-To: <20251009183145.3ed17cb0819f8b7e7fb4ec43@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 9 Oct 2025 18:42:59 -0700
X-Gm-Features: AS18NWC-Nnw6mbU0XDp5pk62GdBblSXl-3NkXh8X6HtK-SeNhS47_j3D0edxdNk
Message-ID: <CAJuCfpEPOOFOtd-Vp4VtTJyqxP_5+7h7SaMT=6exY1YZOE9v5Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: implement cleancache
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, alexandru.elisei@arm.com, peterx@redhat.com, sj@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, hch@infradead.org, jack@suse.cz, 
	willy@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	hannes@cmpxchg.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	minchan@kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 6:31=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  9 Oct 2025 18:19:44 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Subject: [PATCH 1/8] mm: implement cleancache
>
> Well that's confusing.  We removed cleancache 3+ years ago in 0a4ee518185=
e.

Yes, this version is a complete rewrite. Previous version was a thin
layer acting as a middleman and having hooks deep in the FS code. This
version implements most of the cleancache page management inside
cleancache itself and allows GCMA and future clients to be thin. It is
also much less invasive, limiting its hooks mostly to the MM code.
From the cover letter:

New implementation:
1. Avoids intrusive hooks into filesystem code, limiting them to two
hooks for filesystem mount/unmount events and a hook for bdev
invalidation.
2. Manages inode to folio association and handles pools of donated
folios inside cleancache itself, freeing backends of this burden.

The idea was presented at this year's LSF/MM and RFC was posted at
https://lore.kernel.org/all/20250320173931.1583800-1-surenb@google.com/
earlier this year.

