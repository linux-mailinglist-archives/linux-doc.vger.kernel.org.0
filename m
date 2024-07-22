Return-Path: <linux-doc+bounces-21149-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B319393D3
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jul 2024 20:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BB8E281B15
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jul 2024 18:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EFB16FF27;
	Mon, 22 Jul 2024 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ogialzVN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660217BCD
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721674054; cv=none; b=rKjzzXUsqpkU7beZyCJRm+4EMkUzbGMmxjwWmDGp0b+RzYPSlaWUGkpIXw4o6bLHTGjGKVzi0R98Fm0fwZXSBoHd8o9Vgq8v0XK8DOWefW79y8BIKDCpvFjD3jFeRN2pIPdVlg2DjgIQ4+IbdCG9jO4ee19j8pUvkwjSv3GdL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721674054; c=relaxed/simple;
	bh=asA28J//MR/tZw5E77Yd89aREdVKDUWw1npsUkxp9pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0gFVqJ0m/M3eGdqQN3PZg9af52FRTs5AkCJ1UbdoSBiqY4LEdE3UWsaMprNdIPSN0Qajo20oxLrlvCseVKkIiZYwDoN/6yqOgWqjPBxL8tMUEm7JOsRHcib+nt6iWUxqbO8DneA8oDxQpYDlY0BQSxLv0V0MIiiKnfwsh+aeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ogialzVN; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8152f0c63c1so180747439f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721674051; x=1722278851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OzTRfDaexdJXU/NKu+dqGzHLJmOKAxsba4iUWApjtBs=;
        b=ogialzVNR6iKRPGZpusW/yYSZ8rOLkIEhAeG4vlJySRgYIT62Q7rMfuI/9/XGXJQ1Z
         2TBlR2odsrfqMJhxOi4B0+lH0NYjjQuO/ykAZLJXvRH1wooDCsjjQISBJEvzXgDgbUcx
         VWLFJ+BPI4voMyrliBzfPiGs7fgQciODdBFl4Ai+awG8xfzjejnQgVjWnzradQAr6Nbo
         ev2mMm1PeA1lc71KcurutiosCp4ze1Yw7qFqPdHrPUdAl+RMwEsINkyie6HHHcb+UuRz
         OCUy6gbrll0F4Mlbj1SKkTFl5vykvtkXAIDTv8OnFvd2xVdPZdJSHt39BTT41EWyZYgM
         tw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721674051; x=1722278851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzTRfDaexdJXU/NKu+dqGzHLJmOKAxsba4iUWApjtBs=;
        b=klG7SZW/i9ij4rHGYfDiC+rge9nLgaSCYDjQ+eygO6E9xrdq9383yTNfJGY2HKpRPg
         PDTlUP1mkBTkUbHaOqEsmGuYnYwj4T6AuPpPuo49qj23LMdETfhvLr8XmcRZs/qLT1IH
         KbrT4ImFwu6YMQO7ynewZVnhNiY768FAdUaotLKP3jcNDGUshXPtAetJnQ4M71REFm50
         c2GBz8h6fjB+cLUpJUltlCoTr9GrYbfw+sjViqqhJjGToDz6BXx+K5PIiurngUuxkkeW
         RZhEc5tbA0RCL8yvA6JTKkqmBVEVKLdDXg6kM4BnjvzkHvjIwgIut7bvb+y4VQVVg7+D
         z8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWSysQ/WNqCXz7NdZkIxr7tezZ9GU8T4Ws90/IMcMTwf1SvFd2USM27UlDqRyVRAXyIFE/4V0K78mqSud+v7rS7EhSFMzcjg9LM
X-Gm-Message-State: AOJu0YwZPns2EPuMXuWBwsPVMVDM+7H+JqBHcRq4LVNu0+PVEWWVaM4p
	GAOg6XdGGLc2or7ymc+gEefaC9oNaOl88+aL1CicXjGsPgKlIf/kDbBouuJdBSQ=
X-Google-Smtp-Source: AGHT+IFOuPIoea3HTs+tbRyLXH40CUhD1wo+gozLPHK8gHW5C0xpq+X2GQXcdlWAxPs41NzeH0m9PA==
X-Received: by 2002:a05:6602:48d:b0:804:2b28:75db with SMTP id ca18e2360f4ac-81ea3b3a2cfmr103988639f.10.1721674051211;
        Mon, 22 Jul 2024 11:47:31 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-819abb08682sm258753339f.1.2024.07.22.11.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:47:30 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:47:29 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/13] selftests: riscv: Fix vector tests
Message-ID: <20240722-0940cd64c0d8bb03f2427022@orel>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>

On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> Overhaul the riscv vector tests to use kselftest_harness to help the
> test cases correctly report the results and decouple the individual test
> cases from each other. With this refactoring, only run the test cases is
> vector is reported and properly report the test case as skipped
> otherwise. The v_initval_nolibc test was previously not checking if
> vector was supported and used a function (malloc) which invalidates
> the state of the vector registers.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
>  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
>  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
>  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
>  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
>  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
>  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
>  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
>  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
>  9 files changed, 324 insertions(+), 191 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> new file mode 100755
> index 000000000000..2b03e77b4dcf
> Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> index 9ae7964491d5..7d9c87cd0649 100644
> --- a/tools/testing/selftests/riscv/vector/.gitignore
> +++ b/tools/testing/selftests/riscv/vector/.gitignore
> @@ -1,3 +1,4 @@
>  vstate_exec_nolibc
>  vstate_prctl
> -v_initval_nolibc
> +v_initval
> +v_exec_initval_nolibc
> diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> index bfff0ff4f3be..995746359477 100644
> --- a/tools/testing/selftests/riscv/vector/Makefile
> +++ b/tools/testing/selftests/riscv/vector/Makefile
> @@ -2,18 +2,27 @@
>  # Copyright (C) 2021 ARM Limited
>  # Originally tools/testing/arm64/abi/Makefile
>  
> -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> +TEST_GEN_PROGS := v_initval vstate_prctl
> +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
>  
>  include ../../lib.mk
>  
> -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> +	$(CC) -static -c -o$@ $(CFLAGS) $^
> +
> +$(OUTPUT)/v_helpers.o: v_helpers.c
> +	$(CC) -static -c -o$@ $(CFLAGS) $^
> +
> +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
>  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
>  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
>  
> -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
>  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
>  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> new file mode 100644
> index 000000000000..74b13806baf0
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Get values of vector registers as soon as the program starts to test if
> + * is properly cleaning the values before starting a new program. Vector
> + * registers are caller saved, so no function calls may happen before reading
> + * the values. To further ensure consistency, this file is compiled without
> + * libc and without auto-vectorization.
> + *
> + * To be "clean" all values must be either all ones or all zeroes.
> + */
> +
> +#define __stringify_1(x...)	#x
> +#define __stringify(x...)	__stringify_1(x)
> +
> +int main(int argc, char **argv)
> +{
> +	char prev_value = 0, value;
> +	unsigned long vl;
> +	int first = 1;
> +
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> +		".option pop\n\t"
> +		: [vl] "=r" (vl)
> +	);
> +
> +#define CHECK_VECTOR_REGISTER(register) ({					\
> +	for (int i = 0; i < vl; i++) {						\
> +		asm volatile (							\
> +			".option push\n\t"					\
> +			".option arch, +v\n\t"					\
> +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> +			".option pop\n\t"					\
> +			: "=r" (value));					\
> +		if (first) {							\
> +			first = 0;						\
> +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> +			exit(-1);						\

I think we should ensure all tests in tools/testing/selftests/riscv/ use
TAP output, exiting with ksft_finished(), or at least exit with 0 for
success. For example, vstate_exec_nolibc exits with 2 for success since
it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
vstate_prctl.c exits with several different negative values, which means
it'll exit with several different values around 255. To figure what went
wrong, one will have to convert those exit codes to the original negative
values in order to look them up. Having these types of inconsistent exit
values complicates QA.

Thanks,
drew

