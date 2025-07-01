Return-Path: <linux-doc+bounces-51379-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC72AEF6B8
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 13:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C453B3FC0
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 11:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466782727E5;
	Tue,  1 Jul 2025 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8CM+gFj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888B271476
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369922; cv=none; b=lXraxTGOPMUOBAKv1x4lLACzVy05inQUtsEw9n5xlEeSyETbuftxsjYyE3ILsuBpqQkSzAcRXthlrddRz9XuEA3ukFBwoTD6ILZrvIyHUKqEToNcHqPuFOYR5XjOOc2jvERA9ScnGstLmFnvs2MXp9v7Ww5eWfDyCpWoX6gNcng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369922; c=relaxed/simple;
	bh=MRGed7xw7bDMGfGfErP80rD1qdpqu6iPV4GvAe87kSk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=susYIl2mhoStGptfHDkh5dQvVkCFf1Q9x5DBDoy7aRCqL8J30tgpQULvUEEEnh8oauUqbSjgxhPnIoXHhkd9XMV3Uv/c81qjavPY86r+Jsbj/15xMWYSAxAf6cazjr9i2Oky0u2YW6NJOPcORpYQ+B+KEnnwfjCshyw6LA5pmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8CM+gFj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso693352f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751369917; x=1751974717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymO1MfwHnBBBPyU7fd6QnoMDVNEmvub8Pdh59UQCgKc=;
        b=Z8CM+gFj1ToZmBJpk+EE2nR5Nbl1Tlx+KXy1ipifHkxsZLgYVE0/PKIt6T0PYV5bs2
         9yHpUuRxKhtw3h6WEH7jt2Y+FixPYK8oxRZMDw9kd6Cww2WnSsdxnUnJEx+asusyRMA5
         taz8cyuughRS/dXBXoviOHSKPSE6TilRCCZloHdFWyvbuKYdYaEYTUR5JB8NN3rJ9muI
         z0FnRZTpyVEaEF2OEsWlsi95Lpd3UqtsgVNFO/QmRX1Mz8jQJs+dFc/SiftHKa7Usv1g
         7+NUBnWaAKfCvvXE6LMxzTytl6ILMadhRKhCb1pFtQiN7svH9me1SoXdy9/j17z24YER
         7Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369917; x=1751974717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymO1MfwHnBBBPyU7fd6QnoMDVNEmvub8Pdh59UQCgKc=;
        b=LKvzWYrb3XUBL86S3H0L1jSUHxGfcxo44Z35hJIndS8+pzDdx4FnfIv4cU6quxcGNm
         JKi2q6680CUe3m1toYxx0vx6kR/Rxu6V3cacWGjFtdyfKJQYPm0+prE3BqTvJ1ZoPXSX
         Wrl/G8J1ULMwvIqXNC5fhic/EwDEx5tk9VgqN5jLEFoVh2yd+eSUoH8JXityaAfmkMv9
         3zeYeq422zuzjCGD8jmTpgEIUIH13rH/UlPh/i+3jCbmWBZAKo1jDlSiddoG65MwDMwd
         EJXs96+HinNYwWYobEwKXFEQJ4kytk+DRQBu+i+B3HgcDEOpeHUImMzV4DkwGg7VI+ij
         RrsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNdJknZqumj7PHbtTzjeYFGSCPB8YJrs1f30vLS/K2Ukr7ZUzp5sxrNXHBVYLyPP5npKNDLAKitGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJB1+nyrQouLxgnNrG7T2zEGSy9a008GAdVmqV9zF9q6a9bfIS
	bVaTjn0PGSidSA8ktg7tjtY8JxxCg9DAhxCJ8CLBPGczbkQbVrQOVN7gFxwUu2w1ckY=
X-Gm-Gg: ASbGncvCzLJ3zI7I0t5pOe6gkhZEiXRhN6WELhL/L3Qwawrl1hd9HNlkGZfWiCDMII6
	xzjmnEdIU9LpR4LP3YdFJH+fY4U13v0z+V00PjpsQoaFRLq63wJhc+GprqtOBRQBQlkhS0kPLOU
	s7C1oyftrX1NpP8Kh4cAh8fX/L5G3zwJ7rGVgFgBhHIO6IgM6Pxx42P6xrI9mRlWeGWRAi9iF81
	SEgGiBKZgSWiif8UCgIKwoz8UAd2oUo8VK9tvN5ZYkL0JLRUnhohn5Rb9kAlQSSr/VabMvdoKK2
	AcLcnJhJPhr2OPTDKlodhxdDvfU6wKyW2aOy+Z857oQ0dE/4B0YWCjjKJnrgbRS6RJRUBg==
X-Google-Smtp-Source: AGHT+IG9vsd/nXjpNbwtU/s2aJdhnIjVad8L+eqckZnv61f/xwU4i88827dTG+UKpEi8bSgHnVlcLw==
X-Received: by 2002:a05:6000:230f:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3af240989edmr889233f8f.5.1751369917429;
        Tue, 01 Jul 2025 04:38:37 -0700 (PDT)
Received: from mordecai.tesarici.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e78e8sm13346823f8f.19.2025.07.01.04.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:38:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 13:38:33 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton
 <akpm@linux-foundation.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe
 <axboe@kernel.dk>, Bagas Sanjaya <bagasdotme@gmail.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for
 dma_pool_zalloc()
Message-ID: <20250701133833.4060f406@mordecai.tesarici.cz>
In-Reply-To: <5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
References: <20250627101015.1600042-1-ptesarik@suse.com>
	<20250627101015.1600042-5-ptesarik@suse.com>
	<5a997777-fd14-40e1-919b-2e61a6e8d570@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Jun 2025 12:04:04 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 6/27/25 3:10 AM, Petr Tesarik wrote:
> > Document the dma_pool_zalloc() wrapper.
> > 
> > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > ---
> >  Documentation/core-api/mm-api.rst | 2 ++
> >  include/linux/dmapool.h           | 8 ++++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> > index af8151db88b28..a61766328ac06 100644
> > --- a/Documentation/core-api/mm-api.rst
> > +++ b/Documentation/core-api/mm-api.rst
> > @@ -97,6 +97,8 @@ DMA pools
> >  .. kernel-doc:: mm/dmapool.c
> >     :export:
> >  
> > +.. kernel-doc:: include/linux/dmapool.h
> > +
> >  More Memory Management Functions
> >  ================================
> >  
> > diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
> > index 06c4de602b2f3..c0c7717d3ae7b 100644
> > --- a/include/linux/dmapool.h
> > +++ b/include/linux/dmapool.h
> > @@ -60,6 +60,14 @@ static inline struct dma_pool *dma_pool_create(const char *name,
> >  				    NUMA_NO_NODE);
> >  }
> >  
> > +/**
> > + * dma_pool_zalloc - Get a zero-initialized block of DMA coherent memory.
> > + * @pool: dma pool that will produce the block
> > + * @mem_flags: GFP_* bitmask
> > + * @handle: pointer to dma address of block
> > + *
> > + * Same as @dma_pool_alloc, but the returned memory is zeroed.  
> 
>     * Same as dma_pool_alloc(), but ...
> 
> '@' is for function arguments.

Oops. Somehow sneaked in...

> With that change:
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Do I have to submit a v3 then?

Petr T

