Return-Path: <linux-doc+bounces-29619-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CF9B9930
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 21:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49811F23805
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 20:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB901D47CB;
	Fri,  1 Nov 2024 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zXNwz71D"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52E1CB526
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730491735; cv=none; b=c52v3HeQBGRnyztEWBdf1v3w9Y7pAHiXi6HTNU9MR0rbZWCmfrrvfzAzL0b55WIHnPoVpIBepfqHFFHUnoSpQd8+7uQ8gQiiEHDrPuAtoQ8nXFDTibQI7SW82qGcJoeY+FTEIMyMLWmIN9DZ+ZJlga8KSq7P1x4pBAvcL5Jcqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730491735; c=relaxed/simple;
	bh=C3bK9lq2Iat+ytyW1C1WkA7TwIFFMRn5QKSxbvhI+cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nde5qJSHYe7GGW5rcyk0EIjgqGgdtOeneeDsla++M9f2TZKEpitUN3wCD+VTYdq471kTzbtrUd7ygga5G4BXt82L8zUjOkiEKbGk/SkwroKU1ntLTmQjMSATrQCdGhQPwxwWORYm2qY5HZK/k0589hphrmDBldcazxNY82IY+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zXNwz71D; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4608dddaa35so74701cf.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 13:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730491732; x=1731096532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBhvgsyP68AaFdlci9462ArR+t5qoTnQQ8nehGqn+cY=;
        b=zXNwz71DBFYPz1sP5tfi2wFU+rcqCxWNhXVt2i2142V47hg70xrU6vguW7SsouXX7r
         Zyqc37ECf0g/6Ws31Gy/T9wCErubS/LXrbzp2jJUgp3CR0i6mZfArpC6O1rjG8q3FJxW
         d1TFY/HsqQF5DHQL1bLEMwC3ex1Al6xI2tqEKITA14oGphNGm90PA9JyNHHzv4VFc7Tz
         SCgcrLj0pGdRigYvgQJ5q0Pbo8vfGPkKmTxrXf68CypkgzJ40jRgbkudCemnIRzbGlSZ
         a6hVjNGCACYFOVkQXGWoD7rxzdpDHAwBtLf6l5KrVSXaoWx5WrEClQqgorYlL/SmrsUG
         d2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730491732; x=1731096532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBhvgsyP68AaFdlci9462ArR+t5qoTnQQ8nehGqn+cY=;
        b=AvYmvrC/CZlkl3EDHwSK58iYGOWjXd9pD3Ls5HjFjk835Q0U3CkYwXF3gIeG1IcsyF
         8cZ1ixzA3dokQQO8JASiyZzdnBBjSBCd+cNbTGwXYEChfJN4hrp+BPctYiGTnK1JVNlm
         d0tT0YyLjdzf1sXDNE88oqTJaTFR8s53Di5oBZcbhrAGIKwqDV6d8mMclgof2jOab/P+
         kJoe3CFH46qcmdQMlrbjJh3F57K6rWtqd2z3zZmtRGnkK5jAsBuBJlAXMJj7TIbQTWZR
         B0O31M9QnEfEte6iXaWq6QkrdG5ztgGH0CJWmJXRR5aT16YjfWEXvkoEjIKPqLayodFL
         swbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbgyALZib84B+2Ias9Gy66CHVQPuU5EybXjCfxU7sj3WP6fVxl7HVWr7pARylHLlz4PC+GFf99ZWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp99hio8Rzu6rq9lTj3WzWTpSJhWrX2C89n2ALSrkcV/28e7o
	IFGQsANzA1UIdX5ilzfQlkD8EGTXtEqNndY+e1N3xbJ4BvBMPs8Ze4iGD3kTsOsB90EpiuMBlQh
	xbjt2/u684CZwLjWVnvN7suxBhYPMThB/OUvt
X-Gm-Gg: ASbGncu1BpGoF/ZUAq4q7p9jh9ZVoMm1n+IuB92hSYN2wt2YPl/h2HVE1eWnzeiPV2g
	M1l+8XfTe/MEVBQUFVg2B347KPZ2g/orKwKiKdXai1V86HpOyx9tu0w4r7W95
X-Google-Smtp-Source: AGHT+IHLzbr5jZfQL/RFF11+CfvITxPQwh4PBiAl7YBrfB0o/NYh07B9/QUFW2fV1iv3quuB+T2eISwzjxXYEChmiRQ=
X-Received: by 2002:a05:622a:5289:b0:460:77ac:8773 with SMTP id
 d75a77b69052e-462c60000d5mr609401cf.26.1730491732027; Fri, 01 Nov 2024
 13:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023224409.201771-1-xur@google.com> <20241023224409.201771-2-xur@google.com>
 <CAK7LNARiEhNBPikEv--YpdKTPt5B5tFF_J0T8+xbi1CS6WJBFQ@mail.gmail.com>
In-Reply-To: <CAK7LNARiEhNBPikEv--YpdKTPt5B5tFF_J0T8+xbi1CS6WJBFQ@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 1 Nov 2024 13:08:38 -0700
Message-ID: <CAF1bQ=QvQ=NRCOky3-k_9eoo4BVgW+_C7g6TBmSw=qNurPW9uA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] Add AutoFDO support for Clang build
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 11:02=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 24, 2024 at 7:44=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Add the build support for using Clang's AutoFDO. Building the kernel
> > with AutoFDO does not reduce the optimization level from the
> > compiler. AutoFDO uses hardware sampling to gather information about
> > the frequency of execution of different code paths within a binary.
> > This information is then used to guide the compiler's optimization
> > decisions, resulting in a more efficient binary. Experiments
> > showed that the kernel can improve up to 10% in latency.
> >
> > The support requires a Clang compiler after LLVM 17. This submission
> > is limited to x86 platforms that support PMU features like LBR on
> > Intel machines and AMD Zen3 BRS. Support for SPE on ARM 1,
> >  and BRBE on ARM 1 is part of planned future work.
> >
> > Here is an example workflow for AutoFDO kernel:
> >
> > 1) Build the kernel on the host machine with LLVM enabled, for example,
> >        $ make menuconfig LLVM=3D1
> >     Turn on AutoFDO build config:
> >       CONFIG_AUTOFDO_CLANG=3Dy
> >     With a configuration that has LLVM enabled, use the following
> >     command:
> >        scripts/config -e AUTOFDO_CLANG
> >     After getting the config, build with
> >       $ make LLVM=3D1
> >
> > 2) Install the kernel on the test machine.
> >
> > 3) Run the load tests. The '-c' option in perf specifies the sample
> >    event period. We suggest     using a suitable prime number,
> >    like 500009, for this purpose.
> >    For Intel platforms:
> >       $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c <count>=
 \
> >         -o <perf_file> -- <loadtest>
> >    For AMD platforms:
> >       The supported system are: Zen3 with BRS, or Zen4 with amd_lbr_v2
> >      For Zen3:
> >       $ cat proc/cpuinfo | grep " brs"
> >       For Zen4:
> >       $ cat proc/cpuinfo | grep amd_lbr_v2
> >       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a=
 \
> >         -N -b -c <count> -o <perf_file> -- <loadtest>
> >
> > 4) (Optional) Download the raw perf file to the host machine.
> >
> > 5) To generate an AutoFDO profile, two offline tools are available:
> >    create_llvm_prof and llvm_profgen. The create_llvm_prof tool is part
> >    of the AutoFDO project and can be found on GitHub
> >    (https://github.com/google/autofdo), version v0.30.1 or later. The
> >    llvm_profgen tool is included in the LLVM compiler itself. It's
> >    important to note that the version of llvm_profgen doesn't need to
> >    match the version of Clang. It needs to be the LLVM 19 release or
> >    later, or from the LLVM trunk.
> >       $ llvm-profgen --kernel --binary=3D<vmlinux> --perfdata=3D<perf_f=
ile> \
> >         -o <profile_file>
> >    or
> >       $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file> \
> >         --format=3Dextbinary --out=3D<profile_file>
> >
> >    Note that multiple AutoFDO profile files can be merged into one via:
> >       $ llvm-profdata merge -o <profile_file>  <profile_1> ... <profile=
_n>
> >
> > 6) Rebuild the kernel using the AutoFDO profile file with the same conf=
ig
> >    as step 1, (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> >       $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file>
> >
> > Co-developed-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Suggested-by: Stephane Eranian <eranian@google.com>
> > Tested-by: Yonghong Song <yonghong.song@linux.dev>
>
>
>
>
> > +Workflow
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Here is an example workflow for AutoFDO kernel:
> > +
> > +1)  Build the kernel on the host machine with LLVM enabled,
> > +    for example, ::
> > +
> > +      $ make menuconfig LLVM=3D1
> > +
> > +    Turn on AutoFDO build config::
> > +
> > +      CONFIG_AUTOFDO_CLANG=3Dy
> > +
> > +    With a configuration that with LLVM enabled, use the following com=
mand::
> > +
> > +      $ scripts/config -e AUTOFDO_CLANG
> > +
> > +    After getting the config, build with ::
> > +
> > +      $ make LLVM=3D1
> > +
> > +2) Install the kernel on the test machine.
> > +
> > +3) Run the load tests. The '-c' option in perf specifies the sample
> > +   event period. We suggest using a suitable prime number, like 500009=
,
> > +   for this purpose.
> > +
> > +   - For Intel platforms::
> > +
> > +      $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c <count=
> -o <perf_file> -- <loadtest>
> > +
> > +   - For AMD platforms::
>
> I am not sure if this double-colon is needed
> when the next line is not code.

Thanks for catching this. We don't mean to use "::" here. It should be
":" and there is supposed to be a blank line after this.
Also a blank line before "For Zen3::". I will fix this in the patch.

>
>
>
> > +     The supported systems are: Zen3 with BRS, or Zen4 with amd_lbr_v2=
. To check,
> > +     For Zen3::
> > +
> > +      $ cat proc/cpuinfo | grep " brs"
> > +
> > +     For Zen4::
> > +
> > +      $ cat proc/cpuinfo | grep amd_lbr_v2
> > +
> > +     The following command generated the perf data file::
> > +
> > +      $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -=
a -N -b -c <count> -o <perf_file> -- <loadtest>
> > +
> > +4) (Optional) Download the raw perf file to the host machine.
> > +
> > +5) To generate an AutoFDO profile, two offline tools are available:
> > +   create_llvm_prof and llvm_profgen. The create_llvm_prof tool is par=
t
> > +   of the AutoFDO project and can be found on GitHub
> > +   (https://github.com/google/autofdo), version v0.30.1 or later.
> > +   The llvm_profgen tool is included in the LLVM compiler itself. It's
> > +   important to note that the version of llvm_profgen doesn't need to =
match
> > +   the version of Clang. It needs to be the LLVM 19 release of Clang
> > +   or later, or just from the LLVM trunk. ::
> > +
> > +      $ llvm-profgen --kernel --binary=3D<vmlinux> --perfdata=3D<perf_=
file> -o <profile_file>
> > +
> > +   or ::
> > +
> > +      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file> =
--format=3Dextbinary --out=3D<profile_file>
> > +
> > +   Note that multiple AutoFDO profile files can be merged into one via=
::
> > +
> > +      $ llvm-profdata merge -o <profile_file> <profile_1> <profile_2> =
... <profile_n>
> > +
> > +6) Rebuild the kernel using the AutoFDO profile file with the same con=
fig as step 1,
> > +   (Note CONFIG_AUTOFDO_CLANG needs to be enabled)::
> > +
> > +      $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file>
> > +
>
> Trailing blank line.
>
> .git/rebase-apply/patch:187: new blank line at EOF.

Will remote the blank line.

>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

