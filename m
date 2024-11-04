Return-Path: <linux-doc+bounces-29878-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3509BC088
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 23:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C39282ADA
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 22:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4E41FDF85;
	Mon,  4 Nov 2024 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXWibLQp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CEF1F755C
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730757823; cv=none; b=rZiH3J3NXbetg0FYVJdyUFyz0hI7X41xKWrLcd0HeElOXjXEytrB0+TRCUSOKzq/LutJ70UiNk6uqX111LIYE38pQ+K9R5+ftfkDAIB/Y5hLdERDtUhHK0/PGu1nL1LUV6vy1SgWCBbvL2ECbCFcdql3FNUwo6nBMN8NjBdFe/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730757823; c=relaxed/simple;
	bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opoTL58D4ymP13AuUiKqhnO7zZekes27rUvKwyXPNOrZLMv2z98YlaC/hJVXV6VnxhnwfWUbDQ8xWzYponPsgiSclEbM13f8keBl7VqFLcuD4oL8YD4Zt2j6a9URXgl1bKHvv0SKL6zz3BIBaHmWmRmyu9Gx8qt8ID7Ct6+mDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXWibLQp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c87b0332cso27175ad.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 14:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730757820; x=1731362620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=dXWibLQpNrIWrk0HRxsj0Sj29SkxNk7/doQpfI212XJNwtsrHMzl61g/geVopl2R1x
         flj1ceS6uTShJF9f/mdhwjzmuyk35lb08eLtTfkHbElqOyIF0KKiKMp/gRFAPoyA0BUX
         hyxrEvsPMHmAZTs5jIZ9Jehwy43mt1xnV83TjkZZq125rdhjFR/07hpJQmrlzIn1CR2C
         aw5ASygB8cHqXPC3udkXaRpqvMwSFA+VYnL52Fq5ZDyYSRqiwi2CcafJW2dL1DPbp5Uw
         fPOGY03xMMuRsQRrL5LsVu8efP8xkJnCYjJeYej05xGFa0HBoBgSFZcETtfz9XxlIuiu
         1mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730757820; x=1731362620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwdJ/tZnq5Q1ZNjaalXxz9pm9mHtJsnsrILgdEWNMTI=;
        b=UjeVLPr8iKkJ3zih05PF0kqIw/8AQhyIZaUKY18PfWOsdgDgTK8bm7UGPS7sktn0+E
         rJisKEm+yCt6sZOBYYsrz/Arh0U97ovltQpx01gjc56blfJyIkFte3MDsXQWIvNracXm
         GkPU7x1sk5bcbAZGxL4aujeGqKuDSCMqHtqTUZJap+AEQZWgaoD7GzqCGXxRZKaZt22u
         6+akjNkTujrtAcbkmRgyuQ4DQ/kNYjN5/vHtmJIdBs9F7ozpTwzs5yqbrjbSRMUe6c2W
         maKL+1cowjnqWRtoZsQddTTziMbKdhsLHoxuidBc77zRSjrCMk1oOudDxfzU3TROz6zC
         MarA==
X-Forwarded-Encrypted: i=1; AJvYcCVxiXO85+n0WSC8QfWdTEa+7Hu+y54+nQeqKB87QO/lw2Hvlkmw5fPLSN5xy7tBlqc5tdA22cI6uAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKp7byrE9QQhUWPPQb4xUNT+we+K0QKVZ6iov6GJKjFVqVLjMr
	EUAnwE+tbbQvoUaQMMd/ykt8ZReKe8DoERUjywJuQVT2oSeWUqZhC3xLWt0GL/Z4NbhMXqO0u0s
	qlarEdhwQ0GYgCGPiWRiLIb0KD+Fdd/Gmczh+
X-Gm-Gg: ASbGnctrok++58Ks+A3unm1Qn4f5XVxpnkS8W0LbHAv3xlDEASlFO7t1mn2aaK2Ssm9
	c+EQV5mWVc0xu36dIIen6OkNQxgT0YjBlY/bwYGxJdVnNuxNa6QUAc0PwbDuZCi8=
X-Google-Smtp-Source: AGHT+IEti60SDL7RHxI+cAhb1vGKCJSZIYIvkK03gIl3UEiSV24cOOJW04C/9MY0z0qdxUSpneeeMi3ERfOoxdjdYyo=
X-Received: by 2002:a17:902:c401:b0:206:b7b2:4876 with SMTP id
 d9443c01a7336-2115e2cb7c5mr1245345ad.20.1730757819913; Mon, 04 Nov 2024
 14:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com> <Zyk9hX8CB_2rbWsi@ghost>
In-Reply-To: <Zyk9hX8CB_2rbWsi@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Nov 2024 14:03:28 -0800
Message-ID: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for all archs
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 1:32=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > Standardize the generation of syscall headers around syscall tables.
> > > Previously each architecture independently selected how syscall heade=
rs
> > > would be generated, or would not define a way and fallback onto
> > > libaudit. Convert all architectures to use a standard syscall header
> > > generation script and allow each architecture to override the syscall
> > > table to use if they do not use the generic table.
> > >
> > > As a result of these changes, no architecture will require libaudit, =
and
> > > so the fallback case of using libaudit is removed by this series.
> > >
> > > Testing:
> > >
> > > I have tested that the syscall mappings of id to name generation work=
s
> > > as expected for every architecture, but I have only validated that pe=
rf
> > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >
> > Thanks for doing this, I had plans to do this myself, but hadn't
> > completed that bit so far. I'm travelling at the moment, so I'm
> > not sure I have time to look at it in enough detail this week.
> >
> > One problem I ran into doing this previously was the incompatible
> > format of the tables for x86 and s390, which have conflicting
> > interpretations of what the '-' character means. It's possible
> > that this is only really relevant for the in-kernel table,
> > not the version in tools.
> >
>
> I don't think that is an issue for this usecase because the only
> information that is taken from the syscall table is the number and the
> name of the syscall. '-' doesn't appear in either of these columns!

This is cool stuff. An area that may not be immediately apparent for
improvement is that the x86-64 build only has access to the 64-bit
syscall table. Perhaps all the syscall tables should always be built
and then at runtime the architecture of the perf.data file, etc. used
to choose the appropriate one. The cleanup to add an ELF host #define
could help with this:
https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@goo=
gle.com/

Ultimately I'd like to see less arch code as it inherently makes cross
platform worker harder. That doesn't impact this work which I'm happy
to review.

Thanks,
Ian

