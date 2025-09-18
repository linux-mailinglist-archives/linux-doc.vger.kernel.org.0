Return-Path: <linux-doc+bounces-56175-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81031B26905
	for <lists+linux-doc@lfdr.de>; Thu, 14 Aug 2025 16:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A07617DB24
	for <lists+linux-doc@lfdr.de>; Thu, 14 Aug 2025 14:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1A131EFEA;
	Thu, 14 Aug 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="N9PzrbPR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2B311C0F
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179953; cv=none; b=tCBwoEYuu8pyECPunqBV8n4PxJW+5DgqfTgR0QVRTmH86q1zbl6aSnQpqo7Cb/VZ9MEZEaDHmqh0lqP35KCei8TW+FY+i6uJkyrZDj/LOSuFQpo130yOHB+rEP6YXDVah0I9RlbuiiNU243561Oz8CmseC9XODwG6vvBR2mMFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179953; c=relaxed/simple;
	bh=4ExxKGDx0fgiOXw8CTywAcBsJ8ogwJcpwNnL1i5YNn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEqAgw+4xUjiZeaBr6KontaHut9DCriuGZUwiZL+IvrcXlunBfpLaz9q2EIsuyI1P/62at6bpCap2V0hBQgZ+HgBJq1ctFv0ijHoOoB3G+U6gwaAdiZyWFMaih2q/5Yb4IYwtSBbp0HGcZHxuPD3T8+PvbWdiOAWEqnOY5kGuvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=N9PzrbPR; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e87050b077so111075485a.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755179950; x=1755784750; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZZu0s3S5A8+/SIi2GUbQjh84N2xIaZ27oBHRZEOGZ0=;
        b=N9PzrbPROtxWyZbVaEBxCJ+BwqqrykRK9dMm5PlCwrgj52BJTh0yaIKl6U+TBukioz
         BPxbfO2yXzEC2/eypvErSF9CJUW2sfKkMpg9uPwPErqosswfRFh3t0BTbhDI54npUagA
         lilmlNGdIvGBEGMnLDjZnPV+IPwZ9Rp6Swc0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179950; x=1755784750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZZu0s3S5A8+/SIi2GUbQjh84N2xIaZ27oBHRZEOGZ0=;
        b=NA2Fl9MMwPL0qMgPtu+j/T3twhloH8gqKbmzXynV9BrHZBuLtlYkBV6el0cWR05mUT
         64ISUrMjNDYhO2rKnLl/lHZpWB5SOB78DGw27VhNQNZbbt3Lf6fDaRHi1I3dHYew8mf3
         s3+IRF843C1l2ABWQs86HZ4JMD9jFjsdHpYUeiMGzoMTY6mfGpWyKegqmmEJCTFJtJ3G
         y9NIRiECRv3BFfZ2DzXWEOJKOru7bI0hWCRdS1EfLlfzIKlibnbyDSzxFDuBc9ZCbiTZ
         0VNxyXBZ3wucw74zIAWgeV3qidJ9gjpFdwOzBI05gsMpBDD2JtkznQguf5+Kz+TA+kgV
         Gk8A==
X-Forwarded-Encrypted: i=1; AJvYcCVq65A1E78j3t3OGliZJQY50eX8J8AbRq5dDp1dxCZiFMk86d0FDYqWBpMGeIsG4M1RxXsF6jokI6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMk9cIo6LPsyu1xZ4pMix7DKuoq44NGDEcm0lWEixCPjM3zXyx
	nQxQGyPDqANNwsi/7IM+kRgAH4crCgX5BXNJCrbgBhZ1kejY2zicyJ27Is9Kc7gvuxHSDAA3cRf
	7fYyuF3U7g0rnJSyQj5rNunJCgK6vfQt05uGqTiUwUQ==
X-Gm-Gg: ASbGncv47kqEzv4rqPpW/H3rHgycqZfmYPmNUYOjTKo/klHVMCXLUDpNQf/JvUx+RSt
	XXfCEzJmlPKvbZp62cWN3K6x6Zd9/DmzXMmHlZoS9g1fz8Oa4lGGjEziNUQwvBB5DmHZFaRGAWP
	uDaA4FJLyXEwugoclB0ZnSHB4SXaELub//Fj6VwbDPOmTtX1VGseKh4YgbTi0z1E2qFIn0JZiHv
	qtY
X-Google-Smtp-Source: AGHT+IHDCZisldsHFROueT1mDv+N2w5BriAS/91vOctNmeG6Etw7NNZmRk8u6yHZ87xrdPA7iktx621LgwaHh85teV4=
X-Received: by 2002:a05:620a:e0a:b0:7e6:8545:5505 with SMTP id
 af79cd13be357-7e8705a2a88mr419769985a.55.1755179950579; Thu, 14 Aug 2025
 06:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-15-john@groves.net>
In-Reply-To: <20250703185032.46568-15-john@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 15:58:58 +0200
X-Gm-Features: Ac12FXxPrNeYbLt2gO4V6U2nB86--yn65EeQtUloUgMUUdsnzFSb_AaNjXQhYqI
Message-ID: <CAJfpegv19wFrT0QFkwFrKbc6KXmktt0Ba2Lq9fZoihA=eb8muA@mail.gmail.com>
Subject: Re: [RFC V2 14/18] famfs_fuse: GET_DAXDEV message and daxdev_table
To: John Groves <John@groves.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 20:54, John Groves <John@groves.net> wrote:
>
> * The new GET_DAXDEV message/response is enabled
> * The command it triggered by the update_daxdev_table() call, if there
>   are any daxdevs in the subject fmap that are not represented in the
>   daxdev_dable yet.

This is rather convoluted, the server *should know* which dax devices
it has registered, hence it shouldn't need to be explicitly asked.

And there's already an API for registering file descriptors:
FUSE_DEV_IOC_BACKING_OPEN.  Is there a reason that interface couldn't
be used by famfs?

Thanks,
Miklos

