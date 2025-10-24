Return-Path: <linux-doc+bounces-64484-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49997C08384
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 23:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 350BF1C81FBF
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 21:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4948130C35E;
	Fri, 24 Oct 2025 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKmn90F3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AE261B92
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761343147; cv=none; b=kI9WfGsM67jKfWirXyA5MlPkN6Lvvv4aWuM1jZ0tPdaR5eFQd/q0LzoXWbIrbcRIMwVsyHYwx/93Nr1xdLKDt6I4wayhTJrikbd+cR1mVopWLanzE3P9j71lChLaheASldZuRkpThL9qRwupjjSs+5lbnw6xoT7R/irGZzgsgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761343147; c=relaxed/simple;
	bh=mxdDRl5f6ypVZFwxoiySjpzvSm/XaHmi9pbQ4jbflIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izm45ILwfLTQI357YE57OQ4urui3ENnscijYUP8WJ20bOQLkxUbPpd9IAJUsbNTrkmG6MRz70B1ptevpKCIrwSPM/25wyBCes6E9J1qYZnOLLJgh+WwbqgFxFuG1n1KrnVwsjV/VrVh3aKqmRY69xn36pTpmg9dsLFcCjt4bk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKmn90F3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4eb7f0b9041so18959041cf.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761343142; x=1761947942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JSu4wYR7dGj9hekjT0Scgo7oK7p56khXcsyVLerwhg=;
        b=QKmn90F3xbYBk9WfK+osCC7TbkFMGWeGuYB9idqjQJemxKN9IqaeBRdDGM5DhnA8/T
         5fRu4lc7X68u7KXNBHgHx6zWled4MJ5GWQOYMoSihuV2ol8Bo/HN/d+AGkvBGBbSaeZx
         lqapDG/FeFxIOM34ggwhwYRQLOLTqJjmhVCBMp79sIBqjl12hR/EfPDMDjWZutFiJGdR
         BTkuB9X/aX+A8BO4M9YRWfKPqqo2bzcOiZ/2G+dixUD4wZT4+q/PhJSvVvLIveHN3LkL
         9VV0pY4neIJqsNBJB2UZjLj51CUg7LF0bxbJrK3LPqbPc3brCnsirhZAsyJ6u+U1Vs97
         C0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761343142; x=1761947942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JSu4wYR7dGj9hekjT0Scgo7oK7p56khXcsyVLerwhg=;
        b=HtJDBEuxtDR9bNAqHwnGIjsxtS5W0UkY81MXzCIlU0VsxMaxw8xW0L0rD/AIf+bQHw
         Rd0ZY/dJflHqDB4yPgT7mRRdQY40rkveLSCeHL3rK794yMSL+hKqluUPmEpkw9MvLciM
         8O+ZDUyocfLq7N6F9ZPETUEF3y8iVK9B7WCOLmseSdn+268YLvhKZjUi4YgvNAni4lJd
         xUA+nUWUsaa60QrDTqgKY7LMzMatxO7sVtMY9/WlMQINE00H/wGjjC9Ns8YyPv+S140L
         IW+PeSgxHvAj6Cxx1Dm28FbHeZpTahmVtKrbAgA9DjfxWoj/8KJFny56G/1+9Yl+GzmF
         2vYA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJkbZRl5C7r9wMteOuSfslHtAghz4AFJxmEZTnZLwZyT5lVpXICNPMhYl16RX2aC63yAn+bCg59g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHh39rOzMfdzWpIcuPxE15yIOJLDaHuECoyvdLG7pY0Iu6K1rN
	Uagknjx/WbV5OdK6oew2DBW4kgIDvJLrqIuGxfjlQsbtCewTvpfLlj1OK9z6B2FeIp+Y5cnDlMv
	mm9p7xSiBHbyrAfTb9Iu9izJKpOG8ZB0=
X-Gm-Gg: ASbGnctkc/uZMwH5AdjisT7gEnuL6Im56TTUOK5LZOhaIONcW+BJOn0ckT/IOsNlxEo
	7f6yCFPoJ4Yh33NCcFjojJl6OWldxRCa3oKjz/B3iNK8OipkV+Y939y0jMKuS6CQlHC/f28MFp1
	O5zMEgPOrc9mvYLqCVcYPu0aC4kKuYCkfGYZRenTvUhb8Z+212qkpotBkSrKqeiVjY5OoloekrC
	TAeLgF+intB2jlhVsfcarwvw0U3ctJSk4g4TasKnHk3mzySng69Cx44bFJmrxG1KPKGfpmRUdVE
	CBTHA78u6XsNtQE=
X-Google-Smtp-Source: AGHT+IEbBcSwdHcN87CM+xJKbvHNa6uFwmLTJi2BasWFhru45dH++MGND3s6/74r0tI8E8W9g7oqhkLME3Y3cb4B/Bg=
X-Received: by 2002:a05:622a:180a:b0:4e8:bbd4:99d8 with SMTP id
 d75a77b69052e-4e8bbd49fd5mr247392271cf.37.1761343142321; Fri, 24 Oct 2025
 14:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
 <20250926002609.1302233-8-joannelkoong@gmail.com> <aPqDPjnIaR3EF5Lt@bfoster>
 <CAJnrk1aNrARYRS+_b0v8yckR5bO4vyJkGKZHB2788vLKOY7xPw@mail.gmail.com>
 <CAJnrk1b3bHYhbW9q0r4A0NjnMNEbtCFExosAL_rUoBupr1mO3Q@mail.gmail.com>
 <aPu1ilw6Tq6tKPrf@casper.infradead.org> <CAJnrk1az+8iFnN4+bViR0USRHzQ8OejhQNNgUT+yr+g+X4nFEA@mail.gmail.com>
 <aPvolbqCAr1Tx0Pw@casper.infradead.org>
In-Reply-To: <aPvolbqCAr1Tx0Pw@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Oct 2025 14:58:51 -0700
X-Gm-Features: AS18NWApxbcNiaK6JJ1--DN9zMQLqfqvI7dAP8Den9ypsz9jSVcP9ZxOIt1Gw7w
Message-ID: <CAJnrk1YZoFSMGHRK0M_=ND1RyXPgc6Ts4hh+UMOkrGqO5G884w@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] iomap: track pending read bytes more optimally
To: Matthew Wilcox <willy@infradead.org>
Cc: Brian Foster <bfoster@redhat.com>, brauner@kernel.org, miklos@szeredi.hu, 
	djwong@kernel.org, hch@infradead.org, hsiangkao@linux.alibaba.com, 
	linux-block@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 1:59=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Oct 24, 2025 at 12:22:32PM -0700, Joanne Koong wrote:
> > > Feels like more filesystem people should be enabling CONFIG_DEBUG_VM
> > > when testing (excluding performance testing of course; it'll do ugly
> > > things to your performance numbers).
> >
> > Point taken. It looks like there's a bunch of other memory debugging
> > configs as well. Do you recommend enabling all of these when testing?
> > Do you have a particular .config you use for when you run tests?
>
> Our Kconfig is far too ornate.  We could do with a "recommended for
> kernel developers" profile.  Here's what I'm currently using, though I
> know it's changed over time:
>
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_BLK_DEBUG_FS=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> CONFIG_SCSI_DEBUG=3Dm
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JFS_DEBUG=3Dy
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_BTRFS_DEBUG=3Dy
> CONFIG_UFS_DEBUG=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> CONFIG_DEBUG_INFO_COMPRESSED_NONE=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> CONFIG_ARCH_HAS_EARLY_DEBUG=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> CONFIG_SHRINKER_DEBUG=3Dy
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> CONFIG_DEBUG_VM_IRQSOFF=3Dy
> CONFIG_DEBUG_VM=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_X86_DEBUG_FPU=3Dy
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
>
> (output from grep DEBUG .build/.config |grep -v ^#)

Thank you, I'll copy this.
>

