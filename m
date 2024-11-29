Return-Path: <linux-doc+bounces-31296-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EA9D4698
	for <lists+linux-doc@lfdr.de>; Thu, 21 Nov 2024 05:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39792B23920
	for <lists+linux-doc@lfdr.de>; Thu, 21 Nov 2024 04:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D6B14A0AA;
	Thu, 21 Nov 2024 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lJ5xHgVr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B013C3D6
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732162949; cv=none; b=JrJisgNPfuZf8dhPDlzZMXcMyMMhanaEwvJEIggfUu56yrS11yvnZQ8SEHX1TqvryTbChDo8OhuNcouuHta1WdSrnuXNdQ6goRVqZhM7uh4hbYlXU97+xWKcYnRFdACDMwRcGxj8VXa+Ac40haCe26v0/cSxA4t/ceXdFM0R0cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732162949; c=relaxed/simple;
	bh=SpAAQo3l0wT/aBxSUBDG8LR2a69OhY7lZutFyWBoaSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX7FpLHgw2R/mYEGWnGCwKvS4JEy7gm81cxGutOmwHLy05WUpEiCwItDUq0aeS99ArvgXEbae2glNzVjU627q4kAWhij4mtmOfq1vEgXr/27ceDqxr+0JKhi7kNt3moNo0arAQUPUI/gZ7mIchbXIMiV79moX0v2YOTJAz170Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lJ5xHgVr; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e9ed5e57a7so3381867b3.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 20:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732162947; x=1732767747; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=lJ5xHgVrpeJelHGu3h+m+kpP+CpJio03F91Rbvepr+CWIi+9zzppZNlKGNpp8Ygsm3
         Sjn3pfi0iup6FCY6VRUX/gvK0tToQVNp0Q1qdmUuwb3oyNDO0x+aTkFXUbPDPq2+uMYV
         6Kkw1xQI1Og8AGiNWJdTkgrqygfd4mt9dNclhjlQwoslCkM4OjYkdA0dHkCZnDnLbXxN
         1nxctHciljQ+3LXCJ/9o80XgWTNvdelIrPEluX+jd/rnZxIX0fjubBWinpxABfVVzOI3
         0bzGibPw4zzKvqUUMZGV+0LajHL2/tYGbJNQKduNU2tQl84HB9kxxSB40UKEfbU5hHC1
         Fthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162947; x=1732767747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=hRtMbUgkmHyI4b+33oKmg/1JCMG61S7kXNGmDOsh6XEFil4roK0m3+JvGRLl54G/uo
         bCnlmvKz+BFFBe3PxrYmzodTKcZTUpKW3ke3jh81UCBFxX+di+AcuankoRQuei2GM3FR
         CWEoFHWlkWlzdn796UZtyIMDV7bPY67smuMV+e2ibeVbSz5FvWC5TOQOWU5vFBEb46Hn
         F5HWQn9N/94Z0wvEO9umwEv9NzhOQ/4DpXXppoPqS/oT3rFdZzgv1pT+XiQgDA/PT/A/
         1NujLGv8uouvRAwF2YKetBF0j4zEOIY5ro0eyjYgyP0tK8jbzRO7EMthdmTa8VltTUgM
         gVUg==
X-Forwarded-Encrypted: i=1; AJvYcCU6DCji1Cv2NGcSrjZfiBa2Nh1XKgKihHZ2u29wK7fYB0SaUP9lJGypQFom6b3HeyZRgLeOzJqihXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwwr3Dbxhhsz3xDF0qUVBRUWGurKzVeUQ0CE+KlzQaUOOa+rit
	mlQ5YSVl8FIz3km00NHOhXTv1HGKn6iX824E3Nrvq8GuhDMSl4vRecA/zhUstUg=
X-Google-Smtp-Source: AGHT+IFG/0lmdLf+PuJVUiUVDthedJQkU+yi8kvRYeLAcyp/RSQ9OGzeQL0b0Fr9yTqYmM0khQUKNg==
X-Received: by 2002:a05:690c:5a15:b0:6ee:5068:7510 with SMTP id 00721157ae682-6eecc57b073mr20304047b3.26.1732162946630;
        Wed, 20 Nov 2024 20:22:26 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71341e4dsm25749277b3.90.2024.11.20.20.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:22:25 -0800 (PST)
Date: Wed, 20 Nov 2024 20:22:23 -0800
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
Message-ID: <Zz61f02p8s52G6ba@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
 <ZylaRaMqEsEjYjs6@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZylaRaMqEsEjYjs6@ghost>

On Mon, Nov 04, 2024 at 03:35:33PM -0800, Charlie Jenkins wrote:
> On Mon, Nov 04, 2024 at 02:03:28PM -0800, Ian Rogers wrote:
> > On Mon, Nov 4, 2024 at 1:32 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > >
> > > On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > > > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > > > Standardize the generation of syscall headers around syscall tables.
> > > > > Previously each architecture independently selected how syscall headers
> > > > > would be generated, or would not define a way and fallback onto
> > > > > libaudit. Convert all architectures to use a standard syscall header
> > > > > generation script and allow each architecture to override the syscall
> > > > > table to use if they do not use the generic table.
> > > > >
> > > > > As a result of these changes, no architecture will require libaudit, and
> > > > > so the fallback case of using libaudit is removed by this series.
> > > > >
> > > > > Testing:
> > > > >
> > > > > I have tested that the syscall mappings of id to name generation works
> > > > > as expected for every architecture, but I have only validated that perf
> > > > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > > > >
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > >
> > > > Thanks for doing this, I had plans to do this myself, but hadn't
> > > > completed that bit so far. I'm travelling at the moment, so I'm
> > > > not sure I have time to look at it in enough detail this week.
> > > >
> > > > One problem I ran into doing this previously was the incompatible
> > > > format of the tables for x86 and s390, which have conflicting
> > > > interpretations of what the '-' character means. It's possible
> > > > that this is only really relevant for the in-kernel table,
> > > > not the version in tools.
> > > >
> > >
> > > I don't think that is an issue for this usecase because the only
> > > information that is taken from the syscall table is the number and the
> > > name of the syscall. '-' doesn't appear in either of these columns!
> > 
> > This is cool stuff. An area that may not be immediately apparent for
> > improvement is that the x86-64 build only has access to the 64-bit
> > syscall table. Perhaps all the syscall tables should always be built
> > and then at runtime the architecture of the perf.data file, etc. used
> > to choose the appropriate one. The cleanup to add an ELF host #define
> > could help with this:
> > https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@google.com/
> 
> Oh that's a great idea! I think these changes will make it more seamless
> to make that a reality.
> 
> > 
> > Ultimately I'd like to see less arch code as it inherently makes cross
> > platform worker harder. That doesn't impact this work which I'm happy
> > to review.
> 
> Yeah I agree. Reducing arch code was the motivation for this change.
> There was the issue a couple weeks ago that caused all architectures
> that used libaudit to break from commit 7a2fb5619cc1fb53 ("perf trace:
> Fix iteration of syscall ids in syscalltbl->entries"), so this change
> will eliminate that source of difference between architectures.
> 
> - Charlie
> 
> > 
> > Thanks,
> > Ian

Let me know if you have any feedback on this series!

- Charlie


