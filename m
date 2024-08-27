Return-Path: <linux-doc+bounces-23972-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D26961811
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 21:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007AD284A27
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 19:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18521D31A5;
	Tue, 27 Aug 2024 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="y2vkfZVh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B541C57AD
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724787348; cv=none; b=gCFs72fvLWwal/uYqQ4bPW6pqWwcK/zlAuu30A/NTcF3CNS8GOO/ErAcMFbHoRA7pdlzApWn038MsgnxLFe7zx4nhNpCNZ7b7rV+BHyabZmQT8OPMkUFY3Qg+HPJNJRjWsQyzbRZROY2Rfptc3qNppdL2XC9QT5VmvK9OMbhyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724787348; c=relaxed/simple;
	bh=C126ECeOuuPRfMcmLSKPSR0Cb9OCBXW6FN9t9Wdlg/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5Pg+NrhiRb5cTVHkgjKrwxF7Khpm41rjj/Ot59PlmdpmTFRNPTj0MPW/RB/WpInQDqjFFAyg7jRRq/CGI+fx6++qbNkgn+VYQmTfR/n3wCwvrLgFzRhozwHCiYcfnZq/v2w1azRgk566hkFY/kPqqk5wd8Y57XIFoeY2p67kJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=y2vkfZVh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-204eebfaebdso5185005ad.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724787345; x=1725392145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFPAN19RA1hvKHrQkmp/NKYMnPJaVA3/YimxO7ZXHeE=;
        b=y2vkfZVh8tT8eJQomtPKoMUAtv4d0kAm4LVpbMXI7D/TeeHM9PrY0lo3S/xdW6JZOr
         4ilri21jd4o9tl5Ssbx/x+tDhHhi5E2sptp32cYSfc2/nk6XOqJdVyNCCSfx+9Xkx2jk
         OM4wrDpjyY2dmyC5OnkXSQIVTsrhBMSANF4lARTDaOSL1SWCLH3Z5KB1wG68ATciCgRO
         bP0hjNSaUPnSFLVEqXGI1sVwLT/+dzmmM4H27+wM2UVaxZJEPUOW4SAAwrA/LJdVg9gJ
         tuYvjvs3n43XlDQKPl64CcXoIRLaW3qh1YU+pbaTS2Kuar5E59jcHQocLNL6UIM6t0Ts
         ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724787345; x=1725392145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFPAN19RA1hvKHrQkmp/NKYMnPJaVA3/YimxO7ZXHeE=;
        b=npSuFjW1RtFXn+yQtw55+lsLd1vbyqvYIFrx95yX1NWznf3Tdms9tUVmYneEXfobzd
         NO7hU0DimC4Fqd8IAuoRHtespZ95Wpc96uQLs3Hi24cs45VQJ8TV144OBYcJ3xkwP4ae
         MOnNOEVYagBjX1+NuIdHiK7McmJfJwuf8D5F/8ljUoH4D5DWj1TvwyxsNHegELC4fM+h
         5LEofVFJY9ECTWogsWh6e9aMX6kLDpY/fWJwNARNntH7+9oGaKzfOi41GggFP9+Og/lO
         +MUgKIeOVfsNfSPkY1liEEGFpJ2AzFRbSWG6PFpk+0zgtEXJ8vRJKbKJWA02/46iEmPS
         Jbuw==
X-Forwarded-Encrypted: i=1; AJvYcCVh/S6YFP2Kym5d7w9n/yRZ1PwUemupYgsdxP72xA9GYWeAoNhLNEx9BwVCNaU+L0ZS5JC3XvouFfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNhMQ/59saodhXRhJ4dj+K/WJeWe7CVXphasW1snDvMUEXvOOe
	q5nUfO3+tiVpQENCsA54SfRsOjVcnkZ+G9QV2t3xQuS/h9doqGjVY+9Pp7rUZ1A=
X-Google-Smtp-Source: AGHT+IGCXPfghiRA1yNRvhmr+OG3R75Wa/zdLSP/YBTbifITsP8BB2EzUmqixr8vg7m1QBie0YNejQ==
X-Received: by 2002:a17:903:22cb:b0:203:a034:c2e with SMTP id d9443c01a7336-203a0340c9cmr162046725ad.21.1724787344884;
        Tue, 27 Aug 2024 12:35:44 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385581165sm87277375ad.88.2024.08.27.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:35:44 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:35:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Levi Zim <rsworktech@outlook.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the
 upper bound to search
Message-ID: <Zs4qjejI2PzLrI5M@ghost>
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
 <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
 <Zs4BhmB4xOF4LOH9@ghost>
 <tencent_595F628A43601A53F8E00461B5FB1CEB7009@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_595F628A43601A53F8E00461B5FB1CEB7009@qq.com>

On Wed, Aug 28, 2024 at 02:04:29AM +0800, Yangyu Chen wrote:
> 
> 
> > On Aug 28, 2024, at 00:40, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > On Tue, Aug 27, 2024 at 09:33:11AM -0700, Palmer Dabbelt wrote:
> >> On Tue, 27 Aug 2024 01:05:15 PDT (-0700), cyy@cyyself.name wrote:
> >>> Previous patch series[1][2] changes a mmap behavior that treats the hint
> >>> address as the upper bound of the mmap address range. The motivation of the
> >>> previous patch series is that some user space software may assume 48-bit
> >>> address space and use higher bits to encode some information, which may
> >>> collide with large virtual address space mmap may return. However, to make
> >>> sv48 by default, we don't need to change the meaning of the hint address on
> >>> mmap as the upper bound of the mmap address range. This behavior breaks
> >>> some user space software like Chromium that gets ENOMEM error when the hint
> >>> address + size is not big enough, as specified in [3].
> >>> 
> >>> Other ISAs with larger than 48-bit virtual address space like x86, arm64,
> >>> and powerpc do not have this special mmap behavior on hint address. They
> >>> all just make 48-bit / 47-bit virtual address space by default, and if a
> >>> user space software wants to large virtual address space, it only need to
> >>> specify a hint address larger than 48-bit / 47-bit.
> >>> 
> >>> Thus, this patch series change mmap to use sv48 by default but does not
> >>> treat the hint address as the upper bound of the mmap address range. After
> >>> this patch, the behavior of mmap will align with existing behavior on other
> >>> ISAs with larger than 48-bit virtual address space like x86, arm64, and
> >>> powerpc. The user space software will no longer need to rewrite their code
> >>> to fit with this special mmap behavior only on RISC-V.
> >> 
> >> So it actually looks like we just screwed up the original version of this:
> >> the reason we went with the more complicated address splits were than we
> >> actually started with a defacto 39-bit page table uABI (ie 38-bit user VAs),
> >> and moving to even 48-bit page tables (ie, 47-bit user VAs) broke users
> >> (here's an ASAN bug, for example:
> >> https://github.com/google/android-riscv64/issues/64).
> >> 
> >> Unless I'm missing something, though, the code doesn't actually do that.  I
> >> remember having that discussion at some point, but I must have forgotten to
> >> make sure it worked.  As far as I can tell we've just moved to the 48-bit
> >> VAs by default, which breaks the whole point of doing the compatibilty
> >> stuff.  Probably a good sign I need to pay more attention to this stuff.
> >> 
> >> So I'm not really sure what to do here: we can just copy the arm64 behavior
> >> at tell the other users that's just how things work, but then we're just
> >> pushing around breakages.  At a certain point all we can really do with this
> >> hint stuff is push around problems, though, and at least if we copy arm64
> >> then most of those problems get reported as bugs for us.
> > 
> > Relying on the hint address in any capacity will push around breakages
> > is my perspective as well. I messed this up from the start. I believe
> > the only way to have consistent behavior is to mark mmap relying on the
> > hint address as a bug, and only rely on the hint address if a flag
> > defines the behavior.
> > 
> 
> I agree with this. However, since we already have this behavior on
> x86 and aarch64 for quite a long time, to prevent breaking userspace,
> I think we can use this patch and then add a flag like MAP_VA_FULL
> to enable full va address in the future.

Since riscv is not x86 or aarch64, we should be able to make decisions
that are best for riscv regardless of if it is identical to how it is
implemented in x86 or aarch64.

- Charlie

> 
> Thanks,
> Yangyu Chen
> 
> > There is an awkward window of releases that will have this "buggy"
> > behavior. However, since the mmap changes introduced a variety of
> > userspace bugs it seems acceptable to revert to the previous behavior
> > and to create a consistent path forward.
> > 
> > - Charlie
> > 
> >> 
> >>> Note: Charlie also created another series [4] to completely remove the
> >>> arch_get_mmap_end and arch_get_mmap_base behavior based on the hint address
> >>> and size. However, this will cause programs like Go and Java, which need to
> >>> store information in the higher bits of the pointer, to fail on Sv57
> >>> machines.
> >>> 
> >>> Changes in v3:
> >>> - Rebase to newest master
> >>> - Changes some information in cover letter after patchset [2]
> >>> - Use patch [5] to patch selftests
> >>> - Link to v2: https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
> >>> 
> >>> Changes in v2:
> >>> - correct arch_get_mmap_end and arch_get_mmap_base
> >>> - Add description in documentation about mmap behavior on kernel v6.6-6.7.
> >>> - Improve commit message and cover letter
> >>> - Rebase to newest riscv/for-next branch
> >>> - Link to v1: https://lore.kernel.org/linux-riscv/tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com/
> >>> 
> >>> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> >>> [2] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/
> >>> [3] https://lore.kernel.org/linux-riscv/MEYP282MB2312A08FF95D44014AB78411C68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
> >>> [4] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com/
> >>> [5] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/
> >>> 
> >>> Charlie Jenkins (1):
> >>>  riscv: selftests: Remove mmap hint address checks
> >>> 
> >>> Yangyu Chen (2):
> >>>  RISC-V: mm: not use hint addr as upper bound
> >>>  Documentation: riscv: correct sv57 kernel behavior
> >>> 
> >>> Documentation/arch/riscv/vm-layout.rst        | 43 ++++++++----
> >>> arch/riscv/include/asm/processor.h            | 20 ++----
> >>> .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
> >>> .../testing/selftests/riscv/mm/mmap_default.c |  2 -
> >>> tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
> >>> 5 files changed, 36 insertions(+), 98 deletions(-)
> 
> 

