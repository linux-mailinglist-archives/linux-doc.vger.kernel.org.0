Return-Path: <linux-doc+bounces-33075-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15B9F5B1B
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 01:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406181892AD5
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 00:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED147149C7A;
	Wed, 18 Dec 2024 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUvbpiCj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC1481B6
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 00:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480223; cv=none; b=h8P11+/nqWSHlu57QIP+v1ygjBJwXz8/qRpe8n9bzdNd1su2ibgzHN/8b6z48xFgdQBe5m5NejU4v5ALGdurqy4GhzoVmAad35rAugpSEPIVkucJBuDYHvZbp3EBwHfC0HmyDG4oyszD/9n2oLpN1Jcf+lly90J0u9lV6d533jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480223; c=relaxed/simple;
	bh=ab5P5dfu0/ODb3IOwRUA+yGDFd6NKW4L+YI7Mw4/4cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbR0/IAop72DLR1UOUd/pGTf/Hvi9uONgufLAJAgN+klbawbS7i6C/+0fznCfs1HXTx/NXzL6XdgN62gJeN/AzWWBhbvfOALmx8J9ZlDk4o8Jv50xkaPUahkg/C2W/5rVQuDKG0M0IBj95wghRYVuKZ2u9mrk5MpLHLa+cxQdmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUvbpiCj; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so58295ab.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 16:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734480221; x=1735085021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEDn5fC5f5FID4pLAuv6PhQJ2F5QWxiGvS7quO68Zpo=;
        b=BUvbpiCjyJkfEN1BsIhzpg9K58G9cb17oArOoBtyeaXS+0MqyYorsdSgzYhk16W6wZ
         /sotxsXSvbxaUFWxuw0l0gR5v8aOZJMGeMzBhCNM/S9TThIZ3LaiX1hGwltCQR3IEbS7
         L8Pf0+Gxbw4iXUBhoCTcCQ4K6AqQ7xeJ30tYomTBkKZZC/KahrIX9Y6iU2wFusiF4a8a
         P7tQpWK2Pg42B/NG47Njm9bQHn2V0JyPPk4E/kPndJDvErkPHMSI86cE7PnIeWVBRUO8
         gRPjDQUc1D0Kwxh7kJ0MmZR8OSNlfQ2eZNq3oKYzLOlfe4KVkYqYfoY0SSybjPYEZte0
         sFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480221; x=1735085021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEDn5fC5f5FID4pLAuv6PhQJ2F5QWxiGvS7quO68Zpo=;
        b=JIGxOKKSXvfyvA8/nsXEH/T6vrZ5Upgw2DgFGSH9jv7NsaIXAQwHBZQuv4tcOMXP8u
         rEns/4SnJPrn8fR8PmMZkUEWgF2jT4kBQ6HwvH9ClB3bvDvlq0FO5CS92cF8ZCgZrwYD
         SzhbqHPa5JA/OMcUCKUETyJFDRaPi6cB/gfg/5wLar6LyiaUUs+GP60HyM4KIOaGkv1K
         +QWuu1lW8Jotk4ogCoAVxwffleZFxdbSn5PxFSUHrW//qRaBYRhgrpixB29wB0BnjRF1
         IU+LbqjWV2iuRG9hGbUGK9utK9NftLPE+6RlB8mfmi1hrhdw1TKj0tJaBVEmfZ6S1SBv
         DDSw==
X-Forwarded-Encrypted: i=1; AJvYcCXeREQre6xsLIXFbUcIkPNjW30pm1mPvF2zrMxo5iCqw1qtwG5VeuBilgOQlTmJKinWRJ5RqWY8kb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJMS8BOVejKtLcQjrt2NZQ5skS7/k/C0MiO3PZkWeY/7FoXLz
	Nu1knVu4Qc8FxgK1JHKg+/Dc6IJOIBDprhONCSuvXF9efqg1PhHHzWP/wuRXeBMlxG4rlvtdK/K
	Nw72c3MgDgxtm+x2Iiymads3Mkmoh6cWpqos5
X-Gm-Gg: ASbGncvmGg5ee8iOUEGAAq8rvoslgOhhiE3jHNCJWiVfQqv2Gu0Sq3apd8ruB+d0b6n
	tRvIshxhY6ZALSnJcfvZJPEs8qg97PpqNG0t54x4=
X-Google-Smtp-Source: AGHT+IEM2kfEZmBeZubQwYjUig3tCBFRSkoM/XjhRJzYKmzSCoR/iSXHPJ7Y3tTrfS19f2rLkSTJnLWDPAr0FzYHDQo=
X-Received: by 2002:a05:6e02:1529:b0:3a7:c997:efdb with SMTP id
 e9e14a558f8ab-3be372be692mr214265ab.17.1734480220635; Tue, 17 Dec 2024
 16:03:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Dec 2024 16:03:29 -0800
Message-ID: <CAP-5=fWEUq_nLx7PUx96ixMrX0NqqF8W0EmXV9Zvc449zj0Z7A@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] perf tools: Use generic syscall scripts for all archs
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:39=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>
> Standardize the generation of syscall headers around syscall tables.
> Previously each architecture independently selected how syscall headers
> would be generated, or would not define a way and fallback onto
> libaudit. Convert all architectures to use a standard syscall header
> generation script and allow each architecture to override the syscall
> table to use if they do not use the generic table.
>
> As a result of these changes, no architecture will require libaudit, and
> so the fallback case of using libaudit is removed by this series.
>
> Testing:
>
> I have tested that the syscall mappings of id to name generation works
> as expected for every architecture, but I have only validated that perf
> trace compiles and runs as expected on riscv, arm64, and x86_64.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

This is really great, thanks for taking the time for a substantial
clean up. I had difficulty applying the patches to the perf-tools-next
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/lo=
g/?h=3Dperf-tools-next
using patch and dealing with rejects I was able to test.

Reviewed-by: Ian Rogers <irogers@google.com>
On x86-64:
Tested-by: Ian Rogers <irogers@google.com>

I think there are follow up patches that clean up the ABI, allow >1
table at a time, .. but those things are best saved for a follow up.

Thanks,
Ian

> ---
> Changes in v3:
> - Fix compiliation when OUTPUT is empty
> - Correct unused headers to be .h instead of .c  (Namhyung)
> - Make variable definition of supported archs (Namhyung)
> - Convert +=3D into :=3D for syscalls headers (Namhyung)
> - Link to v2: https://lore.kernel.org/r/20241212-perf_syscalltbl-v2-0-f8c=
a984ffe40@rivosinc.com
>
> Changes in v2:
> - Rebase onto 6.13-rc2
> - Fix output path so it generates to /tools/perf/arch properly
> - Link to v1: https://lore.kernel.org/r/20241104-perf_syscalltbl-v1-0-9ad=
ae5c761ef@rivosinc.com
>
> ---
> Charlie Jenkins (16):
>       perf tools: Create generic syscall table support
>       perf tools: arc: Support generic syscall headers
>       perf tools: csky: Support generic syscall headers
>       perf tools: arm: Support syscall headers
>       perf tools: sh: Support syscall headers
>       perf tools: sparc: Support syscall headers
>       perf tools: xtensa: Support syscall header
>       perf tools: x86: Use generic syscall scripts
>       perf tools: alpha: Support syscall header
>       perf tools: parisc: Support syscall header
>       perf tools: arm64: Use syscall table
>       perf tools: loongarch: Use syscall table
>       perf tools: mips: Use generic syscall scripts
>       perf tools: powerpc: Use generic syscall table scripts
>       perf tools: s390: Use generic syscall table scripts
>       perf tools: Remove dependency on libaudit
>
>  Documentation/admin-guide/workload-tracing.rst     |   2 +-
>  tools/build/feature/Makefile                       |   4 -
>  tools/build/feature/test-libaudit.c                |  11 -
>  tools/perf/Documentation/perf-check.txt            |   1 -
>  tools/perf/Makefile.config                         |  39 +-
>  tools/perf/Makefile.perf                           |  12 +-
>  tools/perf/arch/alpha/entry/syscalls/Kbuild        |   2 +
>  .../arch/alpha/entry/syscalls/Makefile.syscalls    |   5 +
>  tools/perf/arch/alpha/entry/syscalls/syscall.tbl   | 504 +++++++++++++++=
+++++
>  tools/perf/arch/alpha/include/syscall_table.h      |   2 +
>  tools/perf/arch/arc/entry/syscalls/Kbuild          |   2 +
>  .../perf/arch/arc/entry/syscalls/Makefile.syscalls |   3 +
>  tools/perf/arch/arc/include/syscall_table.h        |   2 +
>  tools/perf/arch/arm/entry/syscalls/Kbuild          |   4 +
>  .../perf/arch/arm/entry/syscalls/Makefile.syscalls |   2 +
>  tools/perf/arch/arm/entry/syscalls/syscall.tbl     | 483 +++++++++++++++=
++++
>  tools/perf/arch/arm/include/syscall_table.h        |   2 +
>  tools/perf/arch/arm64/Makefile                     |  22 -
>  tools/perf/arch/arm64/entry/syscalls/Kbuild        |   3 +
>  .../arch/arm64/entry/syscalls/Makefile.syscalls    |   6 +
>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  |  46 --
>  .../perf/arch/arm64/entry/syscalls/syscall_32.tbl  | 476 +++++++++++++++=
++++
>  .../perf/arch/arm64/entry/syscalls/syscall_64.tbl  |   1 +
>  tools/perf/arch/arm64/include/syscall_table.h      |   8 +
>  tools/perf/arch/csky/entry/syscalls/Kbuild         |   2 +
>  .../arch/csky/entry/syscalls/Makefile.syscalls     |   3 +
>  tools/perf/arch/csky/include/syscall_table.h       |   2 +
>  tools/perf/arch/loongarch/Makefile                 |  22 -
>  tools/perf/arch/loongarch/entry/syscalls/Kbuild    |   2 +
>  .../loongarch/entry/syscalls/Makefile.syscalls     |   3 +
>  .../arch/loongarch/entry/syscalls/mksyscalltbl     |  45 --
>  tools/perf/arch/loongarch/include/syscall_table.h  |   2 +
>  tools/perf/arch/mips/entry/syscalls/Kbuild         |   2 +
>  .../arch/mips/entry/syscalls/Makefile.syscalls     |   5 +
>  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 --
>  tools/perf/arch/mips/include/syscall_table.h       |   2 +
>  tools/perf/arch/parisc/entry/syscalls/Kbuild       |   3 +
>  .../arch/parisc/entry/syscalls/Makefile.syscalls   |   6 +
>  tools/perf/arch/parisc/entry/syscalls/syscall.tbl  | 463 +++++++++++++++=
++++
>  tools/perf/arch/parisc/include/syscall_table.h     |   8 +
>  tools/perf/arch/powerpc/Makefile                   |  25 -
>  tools/perf/arch/powerpc/entry/syscalls/Kbuild      |   3 +
>  .../arch/powerpc/entry/syscalls/Makefile.syscalls  |   6 +
>  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  39 --
>  tools/perf/arch/powerpc/include/syscall_table.h    |   8 +
>  tools/perf/arch/riscv/Makefile                     |  22 -
>  tools/perf/arch/riscv/entry/syscalls/Kbuild        |   2 +
>  .../arch/riscv/entry/syscalls/Makefile.syscalls    |   4 +
>  tools/perf/arch/riscv/entry/syscalls/mksyscalltbl  |  47 --
>  tools/perf/arch/riscv/include/syscall_table.h      |   8 +
>  tools/perf/arch/s390/Makefile                      |  21 -
>  tools/perf/arch/s390/entry/syscalls/Kbuild         |   2 +
>  .../arch/s390/entry/syscalls/Makefile.syscalls     |   5 +
>  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  32 --
>  tools/perf/arch/s390/include/syscall_table.h       |   2 +
>  tools/perf/arch/sh/entry/syscalls/Kbuild           |   2 +
>  .../perf/arch/sh/entry/syscalls/Makefile.syscalls  |   4 +
>  tools/perf/arch/sh/entry/syscalls/syscall.tbl      | 472 +++++++++++++++=
++++
>  tools/perf/arch/sh/include/syscall_table.h         |   2 +
>  tools/perf/arch/sparc/entry/syscalls/Kbuild        |   3 +
>  .../arch/sparc/entry/syscalls/Makefile.syscalls    |   5 +
>  tools/perf/arch/sparc/entry/syscalls/syscall.tbl   | 514 +++++++++++++++=
++++++
>  tools/perf/arch/sparc/include/syscall_table.h      |   8 +
>  tools/perf/arch/x86/Build                          |   1 -
>  tools/perf/arch/x86/Makefile                       |  25 -
>  tools/perf/arch/x86/entry/syscalls/Kbuild          |   3 +
>  .../perf/arch/x86/entry/syscalls/Makefile.syscalls |   6 +
>  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  42 --
>  tools/perf/arch/x86/include/syscall_table.h        |   8 +
>  tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
>  .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
>  tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 +++++++++++++++=
+++
>  tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
>  tools/perf/builtin-check.c                         |   1 -
>  tools/perf/builtin-help.c                          |   2 -
>  tools/perf/builtin-trace.c                         |  30 --
>  tools/perf/check-headers.sh                        |   9 +
>  tools/perf/perf.c                                  |   6 +-
>  tools/perf/scripts/Makefile.syscalls               |  61 +++
>  tools/perf/scripts/syscalltbl.sh                   |  86 ++++
>  tools/perf/tests/make                              |   7 +-
>  tools/perf/util/env.c                              |   4 +-
>  tools/perf/util/generate-cmdlist.sh                |   4 +-
>  tools/perf/util/syscalltbl.c                       |  90 +---
>  tools/scripts/syscall.tbl                          | 409 +++++++++++++++=
+
>  85 files changed, 4102 insertions(+), 619 deletions(-)
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20240913-perf_syscalltbl-6f98defcc6f5
> --
> - Charlie
>

