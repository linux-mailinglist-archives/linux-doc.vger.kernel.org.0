Return-Path: <linux-doc+bounces-9103-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74816852565
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 02:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A769D1C2414E
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 01:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D6E10A0A;
	Tue, 13 Feb 2024 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IjXhgRtM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4879E1
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707784277; cv=none; b=ugv88LNDo6O/xuX6rcRdwW9FNGq0iJw1evTdPYQOuZdcLGBDtTntXW9fv4vlxqWBprhDWDWn+JoQeoZmCrKNvB9Plk7yfnhyrK5Mh8cS4WL8LIXjQRqb6cbytNNpCi+SekmwcOAsDFDxDcWoVG1QvcnauuVzIu4wmKPDg1e1b0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707784277; c=relaxed/simple;
	bh=mNvkRhiyjJq1dsRwNB7SCDE/0DcmbqdFX7FIWlgw6qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPyiexPuYx1+C65Bp/ZkYmNEzcYbki3fqKhWobw6pEJmjN5Rppb0aKIDbtcR2XVqIVMbyUfJLAdSCUVVljIQvdCsn0duyuk6J8camZzo0xJBZrzBawnGPxSNRzBAgOBTxVHh1s0Za2NV2X7sG5SqVIxeHUbzpYthuR3DZKi05Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IjXhgRtM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e0507eb60cso2418695b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 16:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707784275; x=1708389075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flZnqd6/OOEmgqviJI0+73E/bOCz1vKp47Qn2/+ubUU=;
        b=IjXhgRtMIyUa1NFnp+Vp8P0i7g6V44gTGf6f9691xvdCR0dPBM2YGTq0ybNhVsEzpc
         vhBDTK8bjhYwZmff/R8zsp7hVx5Wv02lzlOT0WauPFcM6UBzr/m3F5uE4uZbQdFHmG6c
         BjMhYLlBgaqfSGw9AqTYS4SU1KGIDXVz4HARc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707784275; x=1708389075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flZnqd6/OOEmgqviJI0+73E/bOCz1vKp47Qn2/+ubUU=;
        b=GJ/gejjpp4zWlPeABKsbkwbUYU9NnmqvqbqcoeQupr9Av8pwHQBrMV8qfFwYjoYIjF
         LIsk57pYY3ULtKAYLjS0949HHh8e5wkIx3WitCuVH374aE76No2/DUwG97MDGHz81P6A
         rZE+OwyAjVN6nW3I+Iu0KH5RDFpTplrhD1Kv/hOSwc571vroi0Y6VOTE5wSnCGi3jTTN
         VSJ1lV+QRQrUTZXb2Cy5UfUZaV4tKrJf9WVfb6WIHqGYL9iAmt8SuCzJfWcNP6Hj68x/
         O6dbIvBG9sE8HGbPklqyzeB2lxhmiN6QrjlXpGTOD+8+NjDB17FbIOvGE/0GXHPr4F1X
         Akbg==
X-Forwarded-Encrypted: i=1; AJvYcCWdInCKtATA+wmrB2FUBsHY/XKa98iCUqiAyLsFSUSHODSRM+qLGv93l6FE30oWkw7XuAuBzHi8lrXLV0uoLzb9MU7YBPf2ZhfD
X-Gm-Message-State: AOJu0YzOWjCvJO/c0EQXfoFeIjhzDidP4ITXdHJME80gXH+ZgJJgJ2s9
	qS+tRAF8T8I05LamjZjvNak/8YCcE3KN/n/CrgxskaaOMrbhWBGCBGZwphx9Tg==
X-Google-Smtp-Source: AGHT+IHsEPTpCmxVYDDW4VNRs2b8vcpDA5pedBCL8vEwt1Ggt87wDXOPZix8VtuDgH+3BmZUWUlZIg==
X-Received: by 2002:aa7:82cf:0:b0:6e0:532a:d5f4 with SMTP id f15-20020aa782cf000000b006e0532ad5f4mr8655990pfn.27.1707784275520;
        Mon, 12 Feb 2024 16:31:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVin3ur0Lo35hIyXtrtSV/cxI4vE5dmFtYD7ma+HtymCNeVZ2kkanG/e5r7jRI36pyWBjot8aUQYx6+p6LxLQnTNSm6weM6lZK91Z+2GZNgFWSN1ZeGPUdII18cHDDsVeHwP11mF9V5Cx7kzsoj1L4MeBLF1x4j/5G3iuwVW/cTP1lf4+jBzT6BusTtY+yb9OGjtgQsofJ3OkNeTsayYI6YnYoZKrbYP+SHJhtSllHfModJO/AP/ecndTCmiLycnsruuY+Z40gfK+ULp/KuzCJadwMupixtnYmRy1qpaieFOXGBmUxKVebYBQ0gaBO4gCxV5LZFueIZuKXFN1hKsPJNUcqwQAcizpIU/tBevp8sdiOcfLOYzHw+qiVJ5y0NJXKlMkVOcYTz8gNCo2Trtk3ICusgR7eUFM9ClFTEXbX5b6LW+RJ/ig/7J0FeSsOgfn3w7cYxkYi1mdkcSJqxdN9sljTmLw1cIEQpfmCmqGt7ZJwcUfz23XgPMMkH71ZPnZetjfaB08ugB7risf0yWGIFil3W8xnDYSDsWINLekmP/5pikpXr/SqTlI/kZtFx+R/Y7TJBg8XH8Khjudt2EkinnfvJOM9iaWgaRsupKFap50ol2vCniI0xkB+mMpzAvI1TnOxHZV03YgDwM1rGiJW/RCt7Rwyl0PU01O+eYaViHIiyZq9bR2CK5gDad7BWj2SfRdv7IqqyEtq4V00x9ZYyIPD3WstNoZqvyyTnQ8AXIH01cMXd3g==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r16-20020aa78b90000000b006e0dd50b0d0sm2678139pfd.8.2024.02.12.16.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 16:31:15 -0800 (PST)
Date: Mon, 12 Feb 2024 16:31:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com,
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com,
	ndesaulniers@google.com, vvvvvv@google.com,
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v3 23/35] mm/slub: Mark slab_free_freelist_hook()
 __always_inline
Message-ID: <202402121631.5954CFB@keescook>
References: <20240212213922.783301-1-surenb@google.com>
 <20240212213922.783301-24-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-24-surenb@google.com>

On Mon, Feb 12, 2024 at 01:39:09PM -0800, Suren Baghdasaryan wrote:
> From: Kent Overstreet <kent.overstreet@linux.dev>
> 
> It seems we need to be more forceful with the compiler on this one.

Sure, but why?

> 
> Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

