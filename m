Return-Path: <linux-doc+bounces-29884-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B73579BC186
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 00:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480431F22B0D
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 23:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550BC1FDFBE;
	Mon,  4 Nov 2024 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XohlK632"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4A1FA270
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730763339; cv=none; b=AgKWidouIrU4rboRiUh6NVhDmsn6Rd5Uj4oKWbkNIctrSEcXtkBrfT7SLIieD/j2o6O+hLrNPzfCAYB69/4+EwPwwcix7vwbCw1eWe9dCMfxHvx9l67MfPZzzi+7IBfC9GDFIf6rF3tNBIfEiV2fzgOO8FAPsQqcW4JALeS+pn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730763339; c=relaxed/simple;
	bh=KrmY+S+q6BIC6iikQDGqq/OAqNilCEI8g7m4VhXfxKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2XeptCfNkZp0loZeK4G8kFakZ5RtdexKWrDTAwM5UpeKDnJy9i3BtLsq0M9ZZOYHpdhwE1xX1qT9WV8eWkry2AzMlqmu8W6xwKLMd41jp0YL9eslZh6vAAHbmwIrHZIlkKwcTwInXZc0KdDus0wgQmF4HO0dm9w/IpndOHwq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XohlK632; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7eab7622b61so3709200a12.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 15:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730763337; x=1731368137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=XohlK632eUpc2BcnmIxUPkgr1LiSBJG+Bv1tV/Fk48ez7StLDZGT8lwiW7mEp7BpMU
         jmEhpBrdnDsMSRxA8vxVmQnhNfcXUlwBcFixuVcTDOGg7agf17CPfPOCy1sIvfO3Ihzt
         bs81q67b+9aWmOZk+uOnz+WtopmwwbVsWG18lRrQgNKgKAFco6rId4lUeaREg5/yFgYw
         INuImmwHILRgS56naJ6udVcckXR+lV/unVdVYwvI6weSP1kwL2kPCntH2JPGPLZTl8ew
         xyaxBg0B1vAXkwHMDkYcxGGh0RSgODBn8gIooM5CBmJBPFEansQ0JaDrn91Dzo5KCCKU
         DDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730763337; x=1731368137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=nOKEG8buCtjQEpK556Ps6aQn2Rv+nWtsdCzjvr1036RO4O2JSfaUGZND0B5As3Pgdy
         specmXy4zK7e8CrXgAu62cf6fxZ7WFv++631L/crmKc9/UHsXQ/khZ2DFx1LaeEOGV1X
         MCxm1yspj2EpUwGcr2YC9mHRCn65ZGy+LMheoy/oiUW9fv5loYJ9JMcXx2H+XeYxg/Fu
         RBi+wrHt3ZTWalFiPjGXcO+YnQOaBUG5p6xSV08fwpba4+MUzGznH+Xi+im8/GFx6EyW
         PA/NHal0AC1l8aR8N7TYj196QBIMNUXAzEp0MvH5dCNL9firjz/5YkqF/+7dRs3gyvYB
         fbyA==
X-Forwarded-Encrypted: i=1; AJvYcCUoKNAWeQ5UAMq5S2nQTzYxEPtLM71mfDgxoFmLO0qw/mpvf3/angLPNt+GjGfxcUYMd2mljNO9wR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xT29O+VhiSJ16zZvmOfohUGC2zggD9NB24B1sz0/LJF60E7x
	VIppp7VU47yeRuj2v8T1CoFjvcxVqstIpqCi7h3atIVeZgwm7U4rXNkxkVI92c4=
X-Google-Smtp-Source: AGHT+IHUkdei85jsd4jEJe1dv8cR5cqR+1/XIGSXNDsrFT+G8g62SWEwp7GVusVEZsJaOrWKuYtEtQ==
X-Received: by 2002:a17:903:40ca:b0:20c:a19d:e73e with SMTP id d9443c01a7336-210c6cf2237mr433175125ad.57.1730763336945;
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c7560sm66579565ad.237.2024.11.04.15.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Date: Mon, 4 Nov 2024 15:35:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for
 all archs
Message-ID: <ZylaRaMqEsEjYjs6@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>

On Mon, Nov 04, 2024 at 02:03:28PM -0800, Ian Rogers wrote:
> On Mon, Nov 4, 2024 at 1:32 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > > Standardize the generation of syscall headers around syscall tables.
> > > > Previously each architecture independently selected how syscall headers
> > > > would be generated, or would not define a way and fallback onto
> > > > libaudit. Convert all architectures to use a standard syscall header
> > > > generation script and allow each architecture to override the syscall
> > > > table to use if they do not use the generic table.
> > > >
> > > > As a result of these changes, no architecture will require libaudit, and
> > > > so the fallback case of using libaudit is removed by this series.
> > > >
> > > > Testing:
> > > >
> > > > I have tested that the syscall mappings of id to name generation works
> > > > as expected for every architecture, but I have only validated that perf
> > > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >
> > > Thanks for doing this, I had plans to do this myself, but hadn't
> > > completed that bit so far. I'm travelling at the moment, so I'm
> > > not sure I have time to look at it in enough detail this week.
> > >
> > > One problem I ran into doing this previously was the incompatible
> > > format of the tables for x86 and s390, which have conflicting
> > > interpretations of what the '-' character means. It's possible
> > > that this is only really relevant for the in-kernel table,
> > > not the version in tools.
> > >
> >
> > I don't think that is an issue for this usecase because the only
> > information that is taken from the syscall table is the number and the
> > name of the syscall. '-' doesn't appear in either of these columns!
> 
> This is cool stuff. An area that may not be immediately apparent for
> improvement is that the x86-64 build only has access to the 64-bit
> syscall table. Perhaps all the syscall tables should always be built
> and then at runtime the architecture of the perf.data file, etc. used
> to choose the appropriate one. The cleanup to add an ELF host #define
> could help with this:
> https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@google.com/

Oh that's a great idea! I think these changes will make it more seamless
to make that a reality.

> 
> Ultimately I'd like to see less arch code as it inherently makes cross
> platform worker harder. That doesn't impact this work which I'm happy
> to review.

Yeah I agree. Reducing arch code was the motivation for this change.
There was the issue a couple weeks ago that caused all architectures
that used libaudit to break from commit 7a2fb5619cc1fb53 ("perf trace:
Fix iteration of syscall ids in syscalltbl->entries"), so this change
will eliminate that source of difference between architectures.

- Charlie

> 
> Thanks,
> Ian

