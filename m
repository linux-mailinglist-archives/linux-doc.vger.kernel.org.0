Return-Path: <linux-doc+bounces-19799-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC991DE87
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 13:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A5AB23C83
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 11:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C998149DF0;
	Mon,  1 Jul 2024 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qbDC7GrZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1E14D299
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719835123; cv=none; b=jFB70XmAjX1labHad1UDWpaJLrPivlqDE4zzEuAPYBpXeNa05hv0bMfsDAh0IbW+alxngRc3MSQmBrKDzRrWfSIot1/ZlGn/zj12M0ojlAdZe0M/gWhHvEkqPPfMU6kYmjLEqEDo8vrXrZM3J9O/ZU0sb7+0UVavzF8h4K7MHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719835123; c=relaxed/simple;
	bh=/nA58iNMwvVtAGqSYF3E2ixIjum0Lx9xpHzYk+CSGJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQeyDLcZCXEwl1v7uhNkV1bzGMAG74N5jfK17WmUHSkeliKEqhE3WgXsW3DJPjDYaOb33HlsrPh+N25HZB9HPNSny1EiOwWdALnt+Bw9rKGmIDekZtCEPCRZJBE1O2zujxx8j7yxXUkK2ie6NloAb0oefoeNGd6vGjezF1VwPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qbDC7GrZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a732cb4ea31so335713666b.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 04:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719835119; x=1720439919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IksdoqfXXoNA3l1EF7/U4rm+eTkM++3OsdHeCQcdlog=;
        b=qbDC7GrZmSgub1ubG86KzOG+qaiA+xaVkCrMD/009yD7+Rf8bnbusguxbLNZkvcYIE
         28+JrRubbWTkHPFPpN0IvjGLWFdeBiQBWfhBWT33+VLEYZUBshMsvneOHLEW5tUbBe0r
         aLmrpE8w7r3kJWBQUnSX1CBjWePjK13PNgnyvtVmuRXhxckXc3xC1PjZcQn/eDbjKDwI
         qiqTSnggevUVImjOFCSl2skk6S0RN/iJuYMAtHMI1Su0j5CQDozFuwbsR89b20HV2LoL
         0eAbfjE5RyCfcAdsn2avnNp+SDf1K1mgD5MVAuFJMS0sbzg9hbfQrxdSAVT/g3eqiqXq
         gi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719835119; x=1720439919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IksdoqfXXoNA3l1EF7/U4rm+eTkM++3OsdHeCQcdlog=;
        b=qGPITF6PDRLalwKZS9lWaHUMpvSm3nbmzFnMZ/bFaHB6ZI2vbQbyj+pWpFOwji3lKA
         eJEMCJ7KE+bFoFWaYixX3+3vn4yGmsdBVehGvAlj5VCGOvJswI4iVsOG8yhPDbJLveeF
         bqxBM1S095sot/3BhmxDmGwc5F0Ac19qkeQ8lqKJgjz7uoX8YKxwdrRGvBE2wBBOPbuv
         e6ETGaqCVnR9FvvnjTqOFVsk2b3RhwiM/IfBgLaGZ1BjTGtJbcV0i20HltqTU6NBqumM
         yjNXWH5bcclw3D5alaYYpQirAaWgHqCQzTB4tgOP01DM6tbZrbLT/bvcAgpWm9jhrl11
         TPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA3pC1MpSiFA1Egpi7MS2ded/MuyAmfUom9W6xrecL3JKFeaYs8jIxhd/l+SldlOOySr7cXbWW8DsQv047d0NKyCdBSVaaFj5h
X-Gm-Message-State: AOJu0YzYrIIz5zWUdR77qj/uN/y15PCylNu9Fen+BLwKX+L7n+Y1WMN+
	rZx2bscLI8Ftp9UxFx4yV7mqaHeEyVLvyV/dOMosBiT34OMMWQ4N8mbt5wnvxyM/7/4hCU1SKlv
	aiDVIXVhwEGdXkf7zuUw76Ztm2ogSxXCoEG7D6g==
X-Google-Smtp-Source: AGHT+IF2OBW7kIrXE1UpSv50tCGPZtC+ETK4mqONVGqJACOHcLEzbhk5UFyau/lwX9nOtB0IRaHq1FCgCFisjtf323o=
X-Received: by 2002:a17:907:9712:b0:a75:7a8:d70c with SMTP id
 a640c23a62f3a-a751386eca4mr578971166b.4.1719835119427; Mon, 01 Jul 2024
 04:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630110550.1731929-1-stuart.menefy@codasip.com>
In-Reply-To: <20240630110550.1731929-1-stuart.menefy@codasip.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 1 Jul 2024 13:58:27 +0200
Message-ID: <CAHVXubg+aXS7-smmWS9LwUbAkpfGvet9Zk0UJs_AZhxV2vx6UQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Extend sv39 linear mapping max size to 128G
To: Stuart Menefy <stuart.menefy@codasip.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stuart,

On Sun, Jun 30, 2024 at 1:06=E2=80=AFPM Stuart Menefy <stuart.menefy@codasi=
p.com> wrote:
>
> This harmonizes all virtual addressing modes which can now all map
> (PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.
>
> The RISCV implementation of KASAN requires that the boundary between
> shallow mappings are aligned on an 8G boundary. In this case we need
> VMALLOC_START to be 8G aligned. So although we only need to move the
> start of the linear mapping down by 4GiB to allow 128GiB to be mapped,
> we actually move it down by 8GiB (creating a 4GiB hole between the
> linear mapping and KASAN shadow space) to maintain the alignment
> requirement.
>
> Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
> ---
>
> Changes since V1:
> This is a modified version of the patch posted by Alexandre Ghiti
> <alexghiti@rivosinc.com> [1]. That version moved the start of the
> liner mapping by 4GiB, but was subsequently found to trigger a problem
> in the KASAN code [2]. By moving the start address by 8GiB alignment
> requiremenents are maintained.
>
> [1] https://lore.kernel.org/linux-riscv/20240514133614.87813-1-alexghiti@=
rivosinc.com/
> [2] https://lore.kernel.org/linux-riscv/4011b34a-1b86-42c7-aaf6-3bd297149=
f06@ghiti.fr/
>
> ---
>  Documentation/arch/riscv/vm-layout.rst | 11 ++++++-----
>  arch/riscv/include/asm/page.h          |  2 +-
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/=
riscv/vm-layout.rst
> index e476b4386bd9..077b968dcc81 100644
> --- a/Documentation/arch/riscv/vm-layout.rst
> +++ b/Documentation/arch/riscv/vm-layout.rst
> @@ -47,11 +47,12 @@ RISC-V Linux Kernel SV39
>                                                                | Kernel-s=
pace virtual memory, shared between all processes:
>    ____________________________________________________________|_________=
__________________________________________________
>                      |            |                  |         |
> -   ffffffc6fea00000 | -228    GB | ffffffc6feffffff |    6 MB | fixmap
> -   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
> -   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
> -   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/=
ioremap space
> -   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct m=
apping of all physical memory
> +   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
> +   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
> +   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
> +   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/=
ioremap space
> +   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct m=
apping of all physical memory
> +                    |            |                  |         |
>     fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.=
h
> index 115ac98b8d72..81d47fbbd927 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,7 +37,7 @@
>   * define the PAGE_OFFSET value for SV48 and SV39.
>   */
>  #define PAGE_OFFSET_L4         _AC(0xffffaf8000000000, UL)
> -#define PAGE_OFFSET_L3         _AC(0xffffffd800000000, UL)
> +#define PAGE_OFFSET_L3         _AC(0xffffffd600000000, UL)
>  #else
>  #define PAGE_OFFSET            _AC(CONFIG_PAGE_OFFSET, UL)
>  #endif /* CONFIG_64BIT */
> --
> 2.43.0
>

So the issue was with my patch, sorry! Your fix makes sense so you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

