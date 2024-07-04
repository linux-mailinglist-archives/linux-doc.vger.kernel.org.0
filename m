Return-Path: <linux-doc+bounces-20042-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94A926D84
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 04:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9AC1C20A17
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2024 02:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C1C19BA6;
	Thu,  4 Jul 2024 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rOfEcrIg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7EA1946B
	for <linux-doc@vger.kernel.org>; Thu,  4 Jul 2024 02:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720060585; cv=none; b=ZGxEWUnQLRIN5uM10xXMksm232udJyeEYHwuw3m3qKXNsEXVHC4m3mxYhj1jrIi3SMK43mLvSVFus8NhJr/pBxgLDsD/4uv53xERH8ILV9hJo8oCzqCHV3SP4MNtK/bWpK6q5CKrOs78lFUHYSo5MZwA2LqQJBRzcsWwfiZP94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720060585; c=relaxed/simple;
	bh=DsoTPuY+Mlw38Zh6KcROkMmGuczQeyFRUBJkQ9vgri8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eta+uTVZ28wIy1+VSeVb3wTw8pgzt6MIK5sKglUcJHSoaiShbJyrCRXhRtmzKL93M3PnKb8ZISE2gb4EtVFmwyEBpOP95bPZzHzjnmSmRMxqcwNlBwMDvD1hNyGJXj7KZJkJXhk31T5R5AQxFdRCf/bbJDMaiktYsjuMfYWe09s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rOfEcrIg; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6510c0c8e29so1464987b3.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2024 19:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720060582; x=1720665382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEh0gK6W3eXmJNVDPEVBYcQUqxq7EVnGFyHcoyRQKks=;
        b=rOfEcrIgd0kI6bVapWaRFOs2AApwdz93d5xdEbepvYaRZj242c91WKxEf0yeedfBZW
         aOzzk76DxlO+FW7Oj/4pFgUoKnWjPQs1yj3siCELVeQ/f6MlGXBlWCwZ4QZ+IbP08THv
         lAtch4MvKAJ6FDVquWirzVcHBxWK6G50LF516DX6SoktH06/aIbGcWzVdAxgs6PIASWh
         pjtN5qdm6abyvVm9SQYgExYpFQtwTYeW0JlTuqWwtCtNisnhbEm5/JztexywTLLpmJWA
         OsKS1Dnk6+x8/1jLcigtKQrBZFxjDWY+sQELllTEYel1iJjT+4edD2wqHAfjdswTPfrK
         QQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720060582; x=1720665382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEh0gK6W3eXmJNVDPEVBYcQUqxq7EVnGFyHcoyRQKks=;
        b=EesIVfoLEPfn+tw/y14gPfn5wRSGEx8Xu9RduRfVvsN4QpnjoJUvW2VyugSQ8sUNdZ
         e/zJ5TtaO93obeFx3SrQHjgpsR9dwq/sF3c6z5N919vYQGy5eouQOQOdlhJedFR4JZ40
         QSiCIy5w+iWprD+h1fn+MuvxNOFVRn6pTPqoYRzr2zgc1vdOKvvGqdnVPM3XtCbc5k07
         AdgehPRWMA6ac5atotkKlgiOnYTDpEPNX/ZGBhCtFVfRofoDQhg6Yq37BtflDLwnLDim
         YvrdXZ28XWuyEPvBVs2XUmrnC9UKJoe6zj1LSgjZJRE/Q5ixd+4+APt1fnekcB3G+VjL
         Iz3A==
X-Forwarded-Encrypted: i=1; AJvYcCUUfQQL55yHGIYIRvM6Mm/cdihZAwttvf5IORftMh6A5PHeZggeAXJIyEPgGL1v+YewQVVpHthcGFqXRmmwykQ27fbvsj5gJPCt
X-Gm-Message-State: AOJu0Yx6AfNUM/Jb1wDESklg/Y5d8C6LU4P3xQdUa5Hs1MWDIxY19uUi
	v4oCAI6xnombbKchWXSmXDelpk6/RMln1Lq0Zy0psfHakhSjtfo/Hgz20X9n9foTsM6nZsHJiw8
	IFWfB77wOGZNSMTyyUEgJMjjtcHdGwkAnJsPk
X-Google-Smtp-Source: AGHT+IFc87uvZjuArZcbPdjOl2P4ymw36uHXy0/6csN+CE8LQDhKMoaWlHNbmX7k0msSoryHyYVy32kodkhEfs9Q+hQ=
X-Received: by 2002:a81:fe04:0:b0:64b:42f1:4518 with SMTP id
 00721157ae682-652d8535362mr3460797b3.45.1720060582303; Wed, 03 Jul 2024
 19:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87msmyt8zh.fsf@trenco.lwn.net> <20240703230040.90283-1-sj@kernel.org>
 <CAJuCfpFO_C_LgxrRWrxG9o==RRtYAbkbP3ZJULwdmTjDcAJNrg@mail.gmail.com> <1d805df8-748a-4bbc-a3d9-d6aa01a0b16e@infradead.org>
In-Reply-To: <1d805df8-748a-4bbc-a3d9-d6aa01a0b16e@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jul 2024 19:36:09 -0700
Message-ID: <CAJuCfpF0+JzuFMUVrit7QOReCL3H69Ek4KGaPkMCQ3O284paNQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] Docs/mm/index: move allocation profiling document to
 unsorted documents chapter
To: Randy Dunlap <rdunlap@infradead.org>
Cc: SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 7:18=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>
>
> On 7/3/24 7:10 PM, Suren Baghdasaryan wrote:
> > On Wed, Jul 3, 2024 at 4:00=E2=80=AFPM SeongJae Park <sj@kernel.org> wr=
ote:
> >>
> >> On Wed, 03 Jul 2024 16:18:42 -0600 Jonathan Corbet <corbet@lwn.net> wr=
ote:
> >>
> >>> SeongJae Park <sj@kernel.org> writes:
> >>>
> >>>> The memory allocation profiling document was added to the bottom of =
the
> >>>> new outline.  Apparently it was not decided by well-defined guidelin=
es
> >>>> or a thorough discussions.  Rather than that, it was added there jus=
t
> >>>> because there was no place for such unsorted documents.  Now there i=
s
> >>>> the chapter.  Move the document to the new place.
> >>>
> >>> I'll take this for now, but it's truly sad to see new documentation
> >>> being added to the slushpile at the end.  It seems better to create a
> >>> "development tools" section in the new outline and put the allocation
> >>> profiling document there?
> >>
> >> I have no strong opinions about that.  Cc-ing Suren and Kent, as they =
are the
> >> author of the allocation profiling document and hence might have some =
opinion.
> >
> > IMHO if this would be the only document belonging to "development
> > tools" then keeping it under unsorted is fine.
> > If more documents will fall into that category then Jonathan's
> > suggestion makes sense to me. Looking at the current list, page_owner
> > and maybe damon might be considered for this category as well.
> > SeongJae, WDYT?
> > Thanks,
> > Suren.
> >
>
> Documentation/dev-tools/ already contains 20 files.
> Unless you want to keep it under Documentation/mm/, that is.

I think it belongs more to mm than dev-tools TBH.

>
> --
> ~Randy

