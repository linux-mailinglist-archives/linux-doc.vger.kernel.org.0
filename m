Return-Path: <linux-doc+bounces-18405-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BAE905AE1
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 20:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 752C6B23AA7
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 18:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA3F58AA5;
	Wed, 12 Jun 2024 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OGQRxvK6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F457CB6
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216933; cv=none; b=P+jZl1UJwOf2xkXtEpEYS5lc02w5bvKBaTUj49bsBs5l1DWGtFmboS5VrHChwb49mP40czdQsEwz0tQL/3yfMnHP1szyAkb2RQKZvtJQkHdOpLSWLYeWVkmCJ4/GNJzpWQ1C5xoj1lU7Xhym123Xx1eTJNTtl+Y5lOO6ZKJxXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216933; c=relaxed/simple;
	bh=r+8ioj02E2qZnACiVmd3yOLbJ4aITomf+AjUmBBu8qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osNlFcwsaQyFZtaQXQKuIxhxiX1fD3rrU+c0o7vCB4KqfXAwHVnsPTkB+7R2vajOklq7cY6kQ9J11KU5XpRzNqLZ9qyFlRIE3Zbyr5r9IVG+WYl7OY7n7zNQHTcq7gDPhI9e00qRu3vwKdIzZ6MIPAMgdAuhhWJLl7rGNi68q2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OGQRxvK6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f09eaf420so23316466b.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718216930; x=1718821730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrMBsq3emDIg7LGvS27o55tx+BIF7vKtFAWrOg5D1lg=;
        b=OGQRxvK6Y9o4UqVgaAZSNlMFFWW7o2uikBq2D02M1v9wag9ScFMG1Ce+C64Sj3sJAa
         v8mwbNfsUbinJpm3Bmu3IZSBIrgz4cqslF09uawZMrDIM+m+tBWoiShL1wxXpMjUVZfm
         PHik+aNV4jpFfoepOtMAYUnXkeqAVqvRmGY8D9gs6ff56xKI2RPq6Q1EcXwVzwBlvnZL
         WAC9CyweCnwIB2SwqtcTerAkqEfvnQXVessIXLl9TeHm+PYiEtfLi4IzXayH3t+QTM43
         9PzBk6jT/nBCiMKULMHTvfPy3PddKbDUTHHkyHBFflRDaS3o8VvmeWg8F1d0BjlpcRpf
         lavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216930; x=1718821730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrMBsq3emDIg7LGvS27o55tx+BIF7vKtFAWrOg5D1lg=;
        b=HNJDGtHARlV5lgTrZL3wWkTMTR5CxWFHufYNHwdazF8yX2NmFbhLNIsM+uuxOibfrp
         x/dbik9nhby1CCyWVEeoDpJO99PKEUM1qzAWo2q68nwL9af/jLCHJQqvKgeuDfRLrpjt
         tbAvTLJJR8nXxjigx7RHROglVeNc3QOfesEVGwwiZp3Zkeyg8avpqA+Ur453xaEX/rPj
         J+sLl0FqYO8ae7qHeaCkcv3VxL8Yc8thlDc4tK5Lg43Q9k/68QkwX3kbAy/LpJybi7wz
         TmY6v2KIZLkhBATrkHjmRCZziPaqvK4wvei79PgEzw+D9w+ZWehep6PAdxtIMbRploLp
         EdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6sWBeWn94iyJZxBAhpiz95xBpH/srHihqZSZW+SlBmGmCL5Bm7QK74tSbwIoZlelcS3C/sXzLg3LYeJJ02fLL8TZ+1ECLLLM3
X-Gm-Message-State: AOJu0YzMNNcAhB4aG1PCB1cPwMNSnoW/1dNKff5LcKH9eS4O8Rk/cL15
	YutvSBP91NjDVsNkwstD6GnpaU/rTcywgeTVtZ13coRFvhbUtes6A6RXY6YHb8jFBG4X6HD36Y+
	oi5WClNF5WTk6AKasJFzFmFIOwrnvS0Y6AG1V
X-Google-Smtp-Source: AGHT+IGdOGwuBhu3Vw6QvLllxVPqiv9YHMv1wu6O6D77zTPHDq3tNpdY9coVqD6RhMhdj998J7/GmnqgAnwKpJh9OoY=
X-Received: by 2002:a17:906:27d3:b0:a6d:f339:f8 with SMTP id
 a640c23a62f3a-a6f47f936f4mr168588666b.31.1718216930144; Wed, 12 Jun 2024
 11:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608155316.451600-1-flintglass@gmail.com> <20240608155316.451600-2-flintglass@gmail.com>
 <CAKEwX=P1Ojb71AEJ2gzQTrfWidFPcJZmoNxEwji7TceBN-szCg@mail.gmail.com> <CAPpoddeigM44jhTA8Ua=+J4MC1MikouBZVoPrCW2LZF+9r5YeA@mail.gmail.com>
In-Reply-To: <CAPpoddeigM44jhTA8Ua=+J4MC1MikouBZVoPrCW2LZF+9r5YeA@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 12 Jun 2024 11:28:12 -0700
Message-ID: <CAJD7tkYp3GbuXV9G5bAZ1DetMmepV5ynciA+ukae7CKuxpXDJQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] mm: zswap: fix global shrinker memcg iteration
To: Takero Funaki <flintglass@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 11:16=E2=80=AFAM Takero Funaki <flintglass@gmail.co=
m> wrote:
>
> 2024=E5=B9=B46=E6=9C=8812=E6=97=A5(=E6=B0=B4) 3:26 Nhat Pham <nphamcs@gma=
il.com>:
>
> >
> > As I have noted in v0, I think this is unnecessary and makes it more co=
nfusing.
> >
>
> Does spin_lock() ensure that compiler optimizations do not remove
> memory access to an external variable? I think we need to use
> READ_ONCE/WRITE_ONCE for shared variable access even under a spinlock.
> For example,
> https://elixir.bootlin.com/linux/latest/source/mm/mmu_notifier.c#L234

In this example, it seems like mmu_interval_set_seq() updates
interval_sub->invalidate_seq locklessly using WRITE_ONCE(). I think
this is why READ_ONCE() is required in that particular case.

>
> isn't this a common use case of READ_ONCE?
> ```c
> bool shared_flag =3D false;
> spinlock_t flag_lock;
>
> void somefunc(void) {
>     for (;;) {
>         spin_lock(&flag_lock);
>         /* check external updates */
>         if (READ_ONCE(shared_flag))
>             break;
>         /* do something */
>         spin_unlock(&flag_lock);
>     }
>     spin_unlock(&flag_lock);
> }
> ```
> Without READ_ONCE, the check can be extracted from the loop by optimizati=
on.

According to Documentation/memory-barriers.txt, lock acquiring
functions are implicit memory barriers. Otherwise, the compiler would
be able to pull any memory access outside of the lock critical section
and locking wouldn't be reliable.

