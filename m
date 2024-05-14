Return-Path: <linux-doc+bounces-16370-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4F8C59C4
	for <lists+linux-doc@lfdr.de>; Tue, 14 May 2024 18:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF7161F2179B
	for <lists+linux-doc@lfdr.de>; Tue, 14 May 2024 16:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65FB1E864;
	Tue, 14 May 2024 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMkDV0cB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570061E516
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715704427; cv=none; b=eyRUc8IQmou+Q97mUIsV1/Xx97YsiyyLPK5mHJBbGQxJm/u04N29OutZQ7gF2ix2Z1aIHUgGWKIrDGdraQD8Fw9vADdMb5HmuXEEQaTR0aFKNf6FLxwEHLWYvCkA9KvIO3fActMYd/rDe1CmNNZlMzUrd9o2hpNKQ2gNaPt1KhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715704427; c=relaxed/simple;
	bh=ZveMAhEpxPkTHD7VDMcwAi8X3FGU/ioBy7n4/jBydvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si4V2H8RuW1f/cDSxxq9l6tw4SrmaSj5Ld1t7txd3k5DN+yVtDF38HmfMsHAeD7KlCGyAiNLCLu7i+ae8vC5SysftJCKYHV+IRSYbVffxU6XR7Ti860YIIMhOx/XPjiBd2vRtAHxbmBMSZsxroex0YGregF1YftgXTXeGKy8pos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMkDV0cB; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de5acdb3838so5893433276.1
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715704425; x=1716309225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv1f0KwnCkLw87/jdn7pXfBoRVPGPnbjvCSHZ433+XE=;
        b=vMkDV0cBF9yKDmN0CrkCDpwEvQboypA/hQX76774IlgU3XwqZqBbwUkX0bncGd8f7E
         n/+bLFE82J4CFRlKqRyuxH0iFpo+Ymb60JHw/dMMC69djcwaVf7wQMBNKXqD3CgAv5sA
         Uns0SQEckyDIthn+mY7PL5g01nRXvh5v0/ZLSe5w3/mRQESvHeMCb4y97W70um2IDLF/
         ut7MRdt22FMi5tRYTWKOjc0fqhbwti/qNQP2LgwPri3A62LGIqJuy3LWQvcFpcqKtR/X
         6vQHL4TWIQe/gc56i+YW5aDU3pcXULKD7BGJUT8IctwSQP58VpK8i1TIusTqaHafO+YC
         K0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715704425; x=1716309225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv1f0KwnCkLw87/jdn7pXfBoRVPGPnbjvCSHZ433+XE=;
        b=ggLN8PtonPNu/zwle9FCwAa2qvjU59LpZ4BmX70J3owLQzYqNDFTc2VAqu7i0FBrjp
         Bg5024qRy6qI4d5OoVwzLY8dLmT4OPNkqG4Dyu1J5CHKWUpu4EX5mb0oZAEFQQD21sou
         rnlvGnomEPdBMkVvKyOwMEmfCgCGwlw3Hda3sK94w91nW30vS1WRxDJuS9UYDnMkR1fW
         XIfjIHOWlI0B6ZTOyMUAmYQwsN60yijV+8cFUk6oE5lHP1bSdSFSCrUl8m01XzcCD/Ju
         RoA0IiMA9ZkPR7hAIOM83QALpVsybAvfzZIW+89jdsw8NQK0dtBWS8XkJMRZXV/E1L58
         pEtg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXKUw021qHaI1yBA9PyU0cv2pedPMIXs2skU2+vRQSiLtP53TDwP8QuNEvylcVDAG8JNLyOms1qBXFH+njrDgdBCsnEzPPRSR
X-Gm-Message-State: AOJu0YzZxXfF1DPz6m/MCz8i89P4frB7i3bZ3n+zabHwe9jdvO56Vgoe
	H0VUWzjbqiruhtBWoQlz78IX/Q4Fc9j9V1ijb+IN72b/U4l+kUA3mTTgEcjkGXUcq7uY0awh5NO
	PgrkOJTBSGiS4C4zQlvi+eZciTMkbLG+vR+wm
X-Google-Smtp-Source: AGHT+IFXAhCGaHN00zLb69EIyY6q0TTwNMCUOErAVF3O54yE63mv0vw48TLat8wi/llUL4sBRr0HPLAvGtQ1nDzkffU=
X-Received: by 2002:a25:b283:0:b0:dcb:b072:82d5 with SMTP id
 3f1490d57ef6-dee4f39c9bamr12638368276.64.1715704425109; Tue, 14 May 2024
 09:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514153532.3622371-1-surenb@google.com> <CA+CK2bCmy1PhDgDvEX2Pg=_HvLLD2msJmTV_rgMxifbd-y1wRA@mail.gmail.com>
In-Reply-To: <CA+CK2bCmy1PhDgDvEX2Pg=_HvLLD2msJmTV_rgMxifbd-y1wRA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 May 2024 09:33:32 -0700
Message-ID: <CAJuCfpGfcY9NLM2ShxBaspwzOK5=B4WFrT0cGDRwTPJMkE+wWQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: add version into /proc/allocinfo output
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	keescook@chromium.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 8:56=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Tue, May 14, 2024 at 9:35=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > Add version string at the beginning of /proc/allocinfo to allow later
> > format changes. Exampe output:
> >
> > > head /proc/allocinfo
> > allocinfo - version: 1.0
> >            0        0 init/main.c:1314 func:do_initcalls
> >            0        0 init/do_mounts.c:353 func:mount_nodev_root
> >            0        0 init/do_mounts.c:187 func:mount_root_generic
> >            0        0 init/do_mounts.c:158 func:do_mount_root
> >            0        0 init/initramfs.c:493 func:unpack_to_rootfs
> >            0        0 init/initramfs.c:492 func:unpack_to_rootfs
> >            0        0 init/initramfs.c:491 func:unpack_to_rootfs
> >          512        1 arch/x86/events/rapl.c:681 func:init_rapl_pmus
> >          128        1 arch/x86/events/rapl.c:571 func:rapl_cpu_online
>
> It would be also useful to add a header line:
>
> $ head /proc/allocinfo
> allocinfo - version: 1.0
> # <size> <calls> <tag>
>             0        0 init/main.c:1314 func:do_initcalls
>             0        0 init/do_mounts.c:353 func:mount_nodev_root
>             0        0 init/do_mounts.c:187 func:mount_root_generic
>             0        0 init/do_mounts.c:158 func:do_mount_root
> ...
>
> This would be the same as in /proc/slabinfo:
> $ sudo head /proc/slabinfo
> slabinfo - version: 2.1
> # name            <active_objs> <num_objs> <objsize> <objperslab>
> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> :
> slabdata <active_slabs> <num_slabs> <sharedavail>
> pid_3               2730   2730    192   42    2 : tunables    0    0
>   0 : slabdata     65     65      0
> ..

Thanks! Addressed in v2:
https://lore.kernel.org/all/20240514163128.3662251-1-surenb@google.com/

>
> Pasha

