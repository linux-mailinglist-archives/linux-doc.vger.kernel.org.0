Return-Path: <linux-doc+bounces-39495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85BA45CBB
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 12:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157027A22DE
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 11:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D77214207;
	Wed, 26 Feb 2025 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g8JJHqY1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC636213E63
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568229; cv=none; b=pZn44ZRMals2j5gRjaTUo7bwk8XZoV+BoPL775v8CUmtIdzLtwloUC/93z6Z2A4XZsIzWCneJasBtEgXLOv5PK9fdDzulddZK3WpCGqj1aYjx3GpkMDzdovyFVvQVrL9eW4nH1P5aKg9yovL9ZVYCU2tHWNwqJyjqJ0tesE1ykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568229; c=relaxed/simple;
	bh=J0FW/ZpAPbGl+eGdpRYfVmEBIhxvySS/tVwrm7wt8mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VX0uRYfRSoZ6ePOqpJuS1FYurQOs78KBMgwYwf2lYSuUFyfowp6H09aoQAR+pJdQaB4Ne8MhIl9TRIYDQdk5AX1ekzLi+anLTv1mF3mSV1Fh0xxIJkxEkaHc1xtBvyCbeogco7zfhute5bisAVCPNVIk/CRAqYYhOo4ZtfO4jXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g8JJHqY1; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7272f9b4132so4458675a34.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740568227; x=1741173027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBMoR/ArodhoSoFeh7LaWi6Owi/0ZX4Wd5Am5SNNHF4=;
        b=g8JJHqY144jbtrjSVO1qoQkXDAtpTNgXMpqjzpnsyX1ngM+aG7uIxxwIyPea69B8AS
         lbr/xGej6N6TdSdmgYNh6RM2x77hVcLFqZE5afe9r5ksmUXLENBQQjrOm7XqU0VVYW/4
         sqzeFjrQbMsHwZh5C/tohLhIMpF2ZDMf9YEzDuNHNRlGJ+uoS3ZqXWYasdI2xbk9CCZq
         VmtenI+h16mCG45xqywsqYQe+RmW1MEkrz07N4858RUz5BwB6TVsZs00M5dTddNhrh2I
         Fd8OCE0dLZfb9LnfLMYUenwPM2ykaHP7xMS1ONGDoSjBaOUUvmIW/7r9YeruTRWNJNZn
         P8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740568227; x=1741173027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBMoR/ArodhoSoFeh7LaWi6Owi/0ZX4Wd5Am5SNNHF4=;
        b=fVfdPmI6f47i7DMaZduPLwRYO1pyNvuBxfMXxpxZFrJlbde9In+y1bQS7ETzaW2ZBa
         bbFfUG+RznM2sdyKIcYVdZ/2O39clYTokYkpHSWS+uyeYtt9Drv7LdnEvf/Ms+RxUpJ8
         2jdtxTFAnJQ5TVJ9h7Osw/HsUg27UtqY8efKWeP0O2rzuWyCbNnKI5xvLvS8/9oHE4jj
         R/Sod2yz5W7i/Ou+j3Mv95+8KY4gVlpkuCTHi9Pt7HWszK56YK6HFNSZuImZEwdeKK2k
         8TrRrCuFwpBfQ/GERFwIM9MCiGJVf8853VPGHJNoxYXI2eYjehLDvFAzFbxKHzJ8nwWM
         m7rw==
X-Forwarded-Encrypted: i=1; AJvYcCWtcrTVFxcWyxWfd5QzCFAWm/ZMBmXDeA+aFhnYd3hFGQQ7CsfXdR21AkQzlxQ6iXIerMNHgeLo7qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUF2N1Y51mH7nTNYLPR4hb5Vh58WwrDk81nwfbgMOJKOFJ61gF
	l5CcfAa6UkxkDAqdR0KY02QHbqCwrEtBBFM6Zx6FswNwJbRUS7g8uVQJuDiPTG8HtMADzalE59V
	IxRQ7rnMTVuqLiNN6O/n3t5YCXvVe9Yjw0nOEDQ==
X-Gm-Gg: ASbGnct3g3Vgk3cI8iI/No5ooIFstVc3rs+DCOO/EicXm3JDYPROeTPhb/Cw3qUmzI0
	7O4GmkY7CZHyyj49a/rnT17Nlx9xkUNQBOgPr9/T1rB6zFj+yWMmbBFHj/cHmxgjygiSqrZTCw9
	cTM3kq+beKzQ==
X-Google-Smtp-Source: AGHT+IFY+L/f4Zs9pF53F2VadmOaBwoDscmttE66sKkMkDrENSfkvd4Uv+2+QT/1Y3Me6cp5dQ64I9SS9F3F4i971AM=
X-Received: by 2002:a05:6808:124b:b0:3f4:1fd2:1bac with SMTP id
 5614622812f47-3f547e08930mr1518804b6e.20.1740568226922; Wed, 26 Feb 2025
 03:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
 <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com> <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
In-Reply-To: <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 26 Feb 2025 19:10:16 +0800
X-Gm-Features: AQ5f1JqM3klrVlTfvA2HKaStjUgmmSxXZxwlOv1ogVvdE4509n751aKn9XVYGRs
Message-ID: <CAEEQ3wnu11zS+C8xfF0-gk0S5Ck-W4Ep8DuqEU-kvgsX_DTSug@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, Feb 25, 2025 at 10:07=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosin=
c.com> wrote:
>
> On Tue, Feb 25, 2025 at 2:27=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Hi Alex,
> >
> > On Tue, Feb 25, 2025 at 9:21=E2=80=AFPM Alexandre Ghiti <alexghiti@rivo=
sinc.com> wrote:
> > >
> > > Hi Yunhui,
> > >
> > > On Wed, Jan 15, 2025 at 3:40=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedan=
ce.com> wrote:
> > > >
> > > > v1/v2:
> > > > There is only the first patch: RISC-V: Enable cbo.clean/flush in us=
ermode,
> > > > which mainly removes the enabling of cbo.inval in user mode.
> > > >
> > > > v3:
> > > > Add the functionality of Expose Zicbom and selftests for Zicbom.
> > > >
> > > > v4:
> > > > Modify the order of macros, The test_no_cbo_inval function is added
> > > > separately.
> > > >
> > > > v5:
> > > > 1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwpro=
be.rst
> > > > 2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"
> > > >
> > > > Yunhui Cui (3):
> > > >   RISC-V: Enable cbo.clean/flush in usermode
> > > >   RISC-V: hwprobe: Expose Zicbom extension and its block size
> > > >   RISC-V: selftests: Add TEST_ZICBOM into CBO tests
> > > >
> > > >  Documentation/arch/riscv/hwprobe.rst        |  6 ++
> > > >  arch/riscv/include/asm/hwprobe.h            |  2 +-
> > > >  arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
> > > >  arch/riscv/kernel/cpufeature.c              |  8 +++
> > > >  arch/riscv/kernel/sys_hwprobe.c             |  6 ++
> > > >  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++=
----
> > > >  6 files changed, 78 insertions(+), 12 deletions(-)
> > > >
> > > > --
> > > > 2.39.2
> > > >
> > >
> > > So a v6 needs to be sent with:
> > >
> > > - the fix for hwprobe_ext0_has() reported by kernel test robot
> > > - a rebase on top of 6.14 since patch 2 will conflict with
> > > RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0
> >
> > Thank you for the reminder. In fact, version 6 was sent out almost a
> > month ago. Reference:
> > https://lore.kernel.org/lkml/20250124035959.45499-1-cuiyunhui@bytedance=
.com/
>
> Oh sorry, I missed it somehow!
>
> I think we can fix RISCV_HWPROBE_MAX_KEY when merging the patch.
>
> Sorry again and thanks!

It's all good. I've rebased a version:
https://lore.kernel.org/all/20250226063206.71216-1-cuiyunhui@bytedance.com/=
.
Could you help to merge it? Thanks.


>
> Alex
>
> >
> > >
> > > Do you think you can do that soon so that it gets merged in 6.15? The
> > > patchset received a lot of RB so it would be too bad to miss this
> > > release.
> > >
> > > Thanks,
> > >
> > > Alex
> >
> > Thanks,
> > Yunhui

Thanks,
Yunhui

