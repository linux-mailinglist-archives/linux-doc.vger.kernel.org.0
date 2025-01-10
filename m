Return-Path: <linux-doc+bounces-34835-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF455A09BE7
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 20:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B99188F00D
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 19:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0502214A65;
	Fri, 10 Jan 2025 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tSu2E6MA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BDF24B234
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537468; cv=none; b=Ysz73+VSbzrMLxbardUyb8cul2GL6U8mvlbXdKUJ7G+mE+WjFEJTE1vHqh/0nMTR1jZ/35lqhVcMYzs3qgffzyhOB2U5Vyn6TGoU/jYa4Sx7TEyHgD0JZYvww1/fHbTnv3ke1h3TudxLE7YUwnYqQNpappf3O5tV2o02A4EQRl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537468; c=relaxed/simple;
	bh=cCIVRRQWwHdObE52/2AeeqNAiuegHaviOd3IMjq/QRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLcS8R3+gQiSNDADZIauQgbMARFlA0AMBR9b+NRmKUFMaRMGtsM5Ea7u4hJD8yTkSLXGuJbPc2pZUXfNDdJHSwthZBQN5giL11TjGGCCCnZ/ZZMlS6uIWT8oIHAku4iR1nAbqBraU4qGtC4LFcdsM1/wdNQSGFwj6i69TUIGfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tSu2E6MA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215770613dbso30599495ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736537465; x=1737142265; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=tSu2E6MApWWyRAjxThkZm6dBGIpcVvlkndK1huEUSPlaSuauaq88exVzi50fOJABSo
         JQ0oPPUa3COfjtA+6kmCOR+cibNzw7HT5j12XuAdIO1UFcelO7Uzsou5ntmkrDakWaJV
         tD//deniHkeE6jNJxaKe7DcwEA9pLfsvlAjQWllk8xOhSIFRqQPOg2cwnPeNjGPzADEg
         YMOo7rGGYJRTGu8CkDVyNLA3wtO3r8rTB5wJp4OpoOuppAyBsdMwa0e7NhO6mrgYtQnX
         Weu1u8Yu+YjpQxpzeBAcPZIbm1inGgEaF+eeQEcxnORM8t5M8jW3a1HZrrVzj/SrFoAj
         f7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537465; x=1737142265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T624wPcrhS1JgwTBcPosmdXx4gdcuulJGOQvqM6CtCw=;
        b=gpyeNLXofx2+/sXvvufH7Q0xk8j84FYgN/lxVFag/ADlzwnLA2K4XxDryzrDlO5Lxh
         bLgUgKhSWHIs+Zm4xHlj1R0ApUXtscGKOcZyczb5BMQqmTqlrig1o/z28vvkWex/vXQl
         qNJhQG0pWWWYjau4Zu1R7vos60OAlT1xcZ3q2b6ZdnCj1woieIFIz3VtGiylCEk7CicK
         LCKLPCvnzD/jb0BJCbMCv5G1fE9rtsFaTaCQAOh7BUaf7Uy9CskI/HdSBi7O5UjGeU9+
         ocVVGw37ffGyMcG/psVpURG/Ubr5sLHH1wUllk2G70GEc47o7vMZhRSx6uLJBAVdvuY7
         6xeg==
X-Forwarded-Encrypted: i=1; AJvYcCXzIu1j6HwJjxQ64HYYtmSOrtIykixmc1uwl24PbOcZYz9fHY+yf/my5h778Gg51nBSufOlQQhhlH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaxEgIFOdmVIGUCAiEyWq4bFUjv4PphRELgr7ONAEdXlbQPemy
	1WZAts8qqa9QODa6PbUBcOFqAkGXGDPmVZJvTOYYFdF+3Y4OBQT5oHcuz/tvR2w=
X-Gm-Gg: ASbGnctG0gRAHiqgtRzedWTh9kiqgl7HZQ2YoxhnMBm5925CABY9sEzK9q3nKWcY1iE
	ZOq/ssEnUzeYzdmCDwHLsqwFqJlWtSDjDXmDv6dXwmDL8W3gNyP5xox6GkYQVrMFoGfckvkJlNn
	nlpK2Ihb25gvFEhc5DRXTIVhJjPrqp3zSYdKj0IukD3yJnwaW6ODiIaBkcBcCy13rJNyTd1WkBu
	7BxYqLFrh80QPb3PF4tnI2y60JCy/m7W1MFFO8dzWF+K7Uc3YLq
X-Google-Smtp-Source: AGHT+IEre0AsdJDUsGl4k/O1aF6vQLIHA3Knu3Spyy4azSMvw1UNUQEJLtptbRCNfCZV9aZHSRvhEg==
X-Received: by 2002:a17:903:124f:b0:215:83e1:99ff with SMTP id d9443c01a7336-21a83f63f68mr150756545ad.27.1736537464834;
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4bc7:d274:c14b:fde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219a94sm16883985ad.129.2025.01.10.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:31:04 -0800 (PST)
Date: Fri, 10 Jan 2025 11:31:01 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4F1dXQLPGZ3JFI5@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4BEygdXmofWBr0-@x1>
 <Z4BVK3D7sN-XYg2o@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4BVK3D7sN-XYg2o@ghost>

On Thu, Jan 09, 2025 at 03:00:59PM -0800, Charlie Jenkins wrote:
> On Thu, Jan 09, 2025 at 06:51:06PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, Jan 09, 2025 at 05:49:42PM -0300, Arnaldo Carvalho de Melo wrote:
> > > BTW this series is already pushed out to perf-tools-next:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> > 
> > Hey, now I noticed that with this latest version we see:
> > 
> > ⬢ [acme@toolbox perf-tools-next]$ m
> > make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> >   BUILD:   Doing 'make -j28' parallel build
> > Warning: Kernel ABI header differences:
> >   diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h
> > 
> > Auto-detecting system features:
> > ...                                   libdw: [ on  ]
> > ...                                   glibc: [ on  ]
> > ...                                  libbfd: [ on  ]
> > ...                          libbfd-buildid: [ on  ]
> > ...                                  libelf: [ on  ]
> > ...                                 libnuma: [ on  ]
> > ...                  numa_num_possible_cpus: [ on  ]
> > ...                                 libperl: [ on  ]
> > ...                               libpython: [ on  ]
> > ...                               libcrypto: [ on  ]
> > ...                               libunwind: [ on  ]
> > ...                             libcapstone: [ on  ]
> > ...                               llvm-perf: [ on  ]
> > ...                                    zlib: [ on  ]
> > ...                                    lzma: [ on  ]
> > ...                               get_cpuid: [ on  ]
> > ...                                     bpf: [ on  ]
> > ...                                  libaio: [ on  ]
> > ...                                 libzstd: [ on  ]
> > 
> >    /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,32,i386 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
> >    /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,64 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
> >   GEN     /tmp/build/perf-tools-next/common-cmds.h
> >   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
> >   PERF_VERSION = 6.13.rc2.gd73982c39183
> >   GEN     perf-archive
> >   GEN     perf-iostat
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> >   MKDIR   /tmp/build/perf-tools-next/jvmti/
> > 
> > 
> > While with the previous one we would see something like SYSCALLTBL as
> > the step name, like we have GEN, MKDIR, etc, can you take a look?
> 
> Ooh okay I see, the quiet commands were being ignored as-is. We could
> add the lines to handle this to Makefile.syscalls, but I think the
> better solution is to move the lines from Makefile.build to
> Makefile.perf to be more generically available. Here is a patch for
> that. I also added the comment from the kernel Makefile describing what
> this does.
> 
> From 8dcec7f5d937ede3d33c687573dc2f1654ddc59e Mon Sep 17 00:00:00 2001
> From: Charlie Jenkins <charlie@rivosinc.com>
> Date: Thu, 9 Jan 2025 14:36:40 -0800
> Subject: [PATCH] perf tools: Expose quiet/verbose variables in Makefile.perf
> 
> The variables to make builds silent/verbose live inside
> tools/build/Makefile.build. Move those variables to the top-level
> Makefile.perf to be generally available.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/build/Makefile.build | 20 --------------------
>  tools/perf/Makefile.perf   | 37 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> index 5fb3fb3d97e0..e710ed67a1b4 100644
> --- a/tools/build/Makefile.build
> +++ b/tools/build/Makefile.build
> @@ -12,26 +12,6 @@
>  PHONY := __build
>  __build:
>  
> -ifeq ($(V),1)
> -  quiet =
> -  Q =
> -else
> -  quiet=quiet_
> -  Q=@
> -endif
> -
> -# If the user is running make -s (silent mode), suppress echoing of commands
> -# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> -ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> -short-opts := $(firstword -$(MAKEFLAGS))
> -else
> -short-opts := $(filter-out --%,$(MAKEFLAGS))
> -endif
> -
> -ifneq ($(findstring s,$(short-opts)),)
> -  quiet=silent_
> -endif
> -
>  build-dir := $(srctree)/tools/build
>  
>  # Define $(fixdep) for dep-cmd function
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index a449d0015536..55d6ce9ea52f 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -161,12 +161,47 @@ export VPATH
>  SOURCE := $(shell ln -sf $(srctree)/tools/perf $(OUTPUT)/source)
>  endif
>  
> +# Beautify output
> +# ---------------------------------------------------------------------------
> +#
> +# Most of build commands in Kbuild start with "cmd_". You can optionally define
> +# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
> +# that command is printed by default.
> +#
> +# e.g.)
> +#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
> +#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
> +#
> +# A simple variant is to prefix commands with $(Q) - that's useful
> +# for commands that shall be hidden in non-verbose mode.
> +#
> +#    $(Q)$(MAKE) $(build)=scripts/basic
> +#
> +# To put more focus on warnings, be less verbose as default
> +# Use 'make V=1' to see the full commands
> +
>  ifeq ($(V),1)
> +  quiet =
>    Q =
>  else
> -  Q = @
> +  quiet=quiet_
> +  Q=@
>  endif
>  
> +# If the user is running make -s (silent mode), suppress echoing of commands
> +# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +short-opts := $(firstword -$(MAKEFLAGS))
> +else
> +short-opts := $(filter-out --%,$(MAKEFLAGS))
> +endif
> +
> +ifneq ($(findstring s,$(short-opts)),)
> +  quiet=silent_
> +endif
> +
> +export quiet Q
> +
>  # Do not use make's built-in rules
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS += -r
> -- 
> 2.34.1
> 
> 
> - Charlie

Let me know how you want to handle this, I can send this out as a
separate patch if that's better.

- Charlie

> 
> > 
> > All is out there in perf-tools-next.
> > 
> > - Arnaldo

