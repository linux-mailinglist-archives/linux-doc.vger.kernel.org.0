Return-Path: <linux-doc+bounces-39350-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6833A440B2
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 14:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAA787A2953
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C4C2054E4;
	Tue, 25 Feb 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ex3vM2lc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73420E6E0
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490034; cv=none; b=SYMWc7TxiLMF93zf+D33SdLjmX6NCMWV2PYDwtHplxhFw97hoQN5OhWpbVop1bdRlIvhSeLc0rUHKN6LfEe7m6CWjX8ylcO2PxTidZLw/2jVwtriJg4ji0x4xlLAPMo/WA053glRFYBjHSF+L0tIijDLbnCPYBNWhm/bPwwRM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490034; c=relaxed/simple;
	bh=II9MWiGisWH/BazFUrcH1O4fvwrPAe3UCEwVGwyXy4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUvaeTVqhUgkgChBLkq3t+TdHmxTJZpShsuWAFLPIKx24+jRqBVXXtJQ+As61vC9Ea+wxb2ZyJNLfx67sluRhJp/bJRikciGhfSHNBLDs20hDyASFUE2YEfTUw3mmFGlNS1INQiUU36dJVquYP5M5mktjNFyLDET3Ql7eYlknwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ex3vM2lc; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso2335885eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740490032; x=1741094832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ2IplcBO6Wt9ORsHg89Jo3ShjOFNhdLXDKK/XmSsr8=;
        b=Ex3vM2lcSX0vTF/SNpFlxdHauaALbbRsXUKPAeM0JDaul4gXn7iHyPkZaSoXtkDM2s
         O/JXerLC9gvYgxuhOUsLfa9tH11Plkux33R0qscs6uMk9b4fcrDoBJi0vfHqcQQ20GpQ
         khDI1ajuoUgYw7DOj03XZYany8MTQm9GptQ2gES00fRD08RGoKH2CY72xJrNH96sL48b
         gDmmKmSHotl2lpavNgupCi919AGwei4Wy4g+bq/f4W4COJ0WbYwVTe2dCQl088N+HrIb
         8Ct7T1rtLbZ6flIF1QlAYC5byCiAf5exEWRLcWo/+k7xQk8cbTVLt2YYI7DXgqEihCgG
         mk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490032; x=1741094832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ2IplcBO6Wt9ORsHg89Jo3ShjOFNhdLXDKK/XmSsr8=;
        b=XD06oC5dcVbhD3vcOWsf8hdozO3bkpb3x9wnauI0r6u5bIHDmMhWp7ZueMaxJUwZ0A
         t6v46gkiQ1T8zd9DICQTb2UFjcolt1TZupgsyF7+Yl8xwtsgOUDhQeidQ0IGMVss1/Lp
         5y5rgVESVP9EUEjIJ0et6Zfk5ndyR+uau6/5YbVGmopcuHDx/YjrigbCc2jHQsmSkuOE
         /HhqC9HiIJPotx65dDv1p3d5gcz053yMJTXi6TID+bLP4uSDvt5/6GBIAQInjGOw8cpn
         OvAwvZCkJ7buSrrR4RdC1MYm4jLVjIhHsv25jhcvwPvpM6Ob3chGIbTAVu/z2C4KzCkw
         yjmw==
X-Forwarded-Encrypted: i=1; AJvYcCVyiNb2jtQ+V0R92kbqHky4N0EUsNSGnRL3PFVQ9nDuMMd7fzvtWCaqk7KH/iQy1NPhiCJ9T7nDuYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7fqiizZ3/1FGLhgub7mnIp/+WbarmWA4wkdgSXqhydKD8vaTX
	frkfNTdrBwxB0TSlbS1xS8F7nK56pgy/tKQtaU3au3X347xU28omh9r9xYqYOGy1xFV/4TXqx3f
	UdOXnQ2scOtWNLdsuAU4fItTViQ9sQprgV4WeqA==
X-Gm-Gg: ASbGncvSP5zT7RIryF1kgA7rOUuJZgaEQIJz5OYFgqaN/aWlR32lNrJhDx9NEOy8VNW
	VBlXX48jIY/+qlGZ2zeLQ/rKzfZH0f0vWrzULhAOEIjXH4dpFcUUAGYZR/p2fpoTLyZ4Edi3QYO
	zsFaIg3Y1+gA==
X-Google-Smtp-Source: AGHT+IGCYFeFsD7WGV356badMoylqjRk/7L+ck4H3fwlwJNvLiJ10J44Ay/xWN6OXmGF8Zq2ohZYK5fZI2twS/y+Qxs=
X-Received: by 2002:a05:6808:3a06:b0:3f4:1738:f804 with SMTP id
 5614622812f47-3f425a5a053mr14822684b6e.4.1740490031753; Tue, 25 Feb 2025
 05:27:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com> <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
In-Reply-To: <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 25 Feb 2025 21:27:00 +0800
X-Gm-Features: AWEUYZnBrHwWk1-NR_0_zzRZ-hclxJae0XrHpGmrq4kc_cdvQEhDUpQ2xjlpHLE
Message-ID: <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
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

On Tue, Feb 25, 2025 at 9:21=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> Hi Yunhui,
>
> On Wed, Jan 15, 2025 at 3:40=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > v1/v2:
> > There is only the first patch: RISC-V: Enable cbo.clean/flush in usermo=
de,
> > which mainly removes the enabling of cbo.inval in user mode.
> >
> > v3:
> > Add the functionality of Expose Zicbom and selftests for Zicbom.
> >
> > v4:
> > Modify the order of macros, The test_no_cbo_inval function is added
> > separately.
> >
> > v5:
> > 1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.r=
st
> > 2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"
> >
> > Yunhui Cui (3):
> >   RISC-V: Enable cbo.clean/flush in usermode
> >   RISC-V: hwprobe: Expose Zicbom extension and its block size
> >   RISC-V: selftests: Add TEST_ZICBOM into CBO tests
> >
> >  Documentation/arch/riscv/hwprobe.rst        |  6 ++
> >  arch/riscv/include/asm/hwprobe.h            |  2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
> >  arch/riscv/kernel/cpufeature.c              |  8 +++
> >  arch/riscv/kernel/sys_hwprobe.c             |  6 ++
> >  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
> >  6 files changed, 78 insertions(+), 12 deletions(-)
> >
> > --
> > 2.39.2
> >
>
> So a v6 needs to be sent with:
>
> - the fix for hwprobe_ext0_has() reported by kernel test robot
> - a rebase on top of 6.14 since patch 2 will conflict with
> RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0

Thank you for the reminder. In fact, version 6 was sent out almost a
month ago. Reference:
https://lore.kernel.org/lkml/20250124035959.45499-1-cuiyunhui@bytedance.com=
/

>
> Do you think you can do that soon so that it gets merged in 6.15? The
> patchset received a lot of RB so it would be too bad to miss this
> release.
>
> Thanks,
>
> Alex

Thanks,
Yunhui

