Return-Path: <linux-doc+bounces-25904-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF6988C96
	for <lists+linux-doc@lfdr.de>; Sat, 28 Sep 2024 00:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC2F1C21010
	for <lists+linux-doc@lfdr.de>; Fri, 27 Sep 2024 22:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FE21B5EC6;
	Fri, 27 Sep 2024 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VvWaQ9ck"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC5187844
	for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477155; cv=none; b=FkBqhzoFxYLgCaYehyhVqZitVZ9tbh/gRAw9bEyfYx3UqHZU/PJXRGSdT8+VrMSdCr00XYS5XjFe9dik85tXjpgLQ/OrpyrWr8KdRNdurleK4u1Ihqm50T/MrMu2ORVMCPBOXKJn2IDpHsEuk/YtyNqgYMPtZrHViTNaOpp722A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477155; c=relaxed/simple;
	bh=UEbVixBgVaf8M3e9cHPVpzQgl77JbdhxFB49Rb4Lexg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyAFx0050DeYY7EGhjccfMIsMrk/5gJeZY7aptc1E5CAq7xRW0EgoKXcOAiiMf4TwPG+TM9dI1XNR6st2naopf8VoC02TmQAMNZGZ72IsEnCK9lndKAUXU/oFxynuy51AU8HXURLq7uUhSt7H+eS1lBffEw7/PLU9TKKzQCInCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VvWaQ9ck; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cce5b140bso1674167f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727477152; x=1728081952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDQvVwsDtp+mFdbUxO9Cffd9UazHpnItRnVC+YjwEF8=;
        b=VvWaQ9ck2lnpUwm5weFmN6mU4S/oxwKFdjb7OGMhay5SelOXJffeAj6IhTbp4GcfpF
         JqVle5RL2/LQ1MdFrK7SyR74EUYI1bwUoyylN0euAtgJ4oC1BQbZjiscLw/i+mId4HRP
         QOTdwFftOKbeEbvWE53bmUFMwhTPHumng8VTOpDCLVfJ7J+6KdRU/oeAssWoBDxd6rz6
         QKMAFNWKwFpAlAqUARfJVaIYsoopuonTj6Ejq1u+Hu/HByAoXXVC0CbIsBN2soFIHdZk
         s5bZOZaHPSJzDEGW/kLtmaJdoMvCT34YSiNb7AlN5avfT4jj6BdOkHz51Z9Zr8i4ZUkM
         73nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727477152; x=1728081952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDQvVwsDtp+mFdbUxO9Cffd9UazHpnItRnVC+YjwEF8=;
        b=UN6fA7mUJSg9cWTRByEYNf1pogApSxYd9Lxjf69mye9piGO4uPQUWe3bh8zPqVeCX0
         ClewdSCyJnioUGWL825AjzbizhZoFgPG9h831XTcmmjDCzW4aTKjOTZVjcZUqVpLizGE
         5qN4anY4JV8U/yOSSruJC5EP1XQus9dNVlmL2U8+wettFCUgljfuM6bqa80JA/oUn+g6
         HzA2YX6lCi5K/+WqJQVMF1bi2MAPZWF+aZ634zYkxESsZ8nKApXMWiPRuiTFAULCGekT
         ceyO/BWonVJuN+g9AfgCaoQHGbq2OMwS44st4AlT7+7t9rIdY3cWVWd1KHk9lmnK9HKf
         hRYA==
X-Forwarded-Encrypted: i=1; AJvYcCXySQZNGM0BRqSCviQ3gFqJcYV8BB2Azz80qEd5ZMZXOTktVbEoWvyeqQ3MIiaB2IDY0+MK/sxPmik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ly79LEk8eHrvX1hfPHiycIc+6H492sxOY6bLzriqdICVx0Rg
	+az0IytMVLdZi8rD5Gp2LHGmyIFj9apo9L0rDfQjEd+OilAZCQ7m/58Obyifexp/E0FcR7GcnzU
	YswQ4Gf70YftKmjvDQUta8ZGFxCfU0GA4s/Sd
X-Google-Smtp-Source: AGHT+IG6Xki+LFKJg9jjTGxml51UwiNYvnAhUGo6WA4A/ge/2ShkqDPsrBP4lv5UL9HpPy51RD3yj/pjoU1+Gx+aQq8=
X-Received: by 2002:a05:6000:d82:b0:375:570e:7ee with SMTP id
 ffacd0b85a97d-37cd5a9eb80mr3127268f8f.15.1727477151378; Fri, 27 Sep 2024
 15:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com> <20240728203001.2551083-7-xur@google.com>
 <c65a07ef-6436-4e04-a263-7cad9758e9be@gmail.com>
In-Reply-To: <c65a07ef-6436-4e04-a263-7cad9758e9be@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 Sep 2024 15:45:39 -0700
Message-ID: <CAKwvOdm0iZspjpuueBV1=eFt+Bf4edWBZsDsj10kEvTGZRye2w@mail.gmail.com>
Subject: Re: [PATCH 6/6] Add Propeller configuration for kernel build.
To: Maksim Panchenko <max4bolt@gmail.com>, Rong Xu <xur@google.com>
Cc: Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	David Li <davidxl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, John Moon <john@jmoon.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Mike Rapoport <rppt@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Eric DeVolder <eric.devolder@oracle.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Segall <bsegall@google.com>, Breno Leitao <leitao@debian.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Brian Gerst <brgerst@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>, 
	Maksim Panchenko <maks@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 4:52=E2=80=AFAM Maksim Panchenko <max4bolt@gmail.co=
m> wrote:
>
> On Sun, Jul 28, 2024 at 01:29:56PM -0700, Rong Xu wrote:
> > Add the build support for using Clang's Propeller optimizer. Like
> > AutoFDO, Propeller uses hardware sampling to gather information
> > about the frequency of execution of different code paths within a
> > binary. This information is then used to guide the compiler's
> > optimization decisions, resulting in a more efficient binary.
>
> Thank you for submitting the patches with the latest compiler features.
>
> Regarding Propeller, I want to quickly mention that I plan to send a
> patch to include BOLT as a profile-based post-link optimizer for the
> kernel. I'd like it to be considered an alternative that is selectable
> at build time.
>
> BOLT also uses sampling, and the profile can be collected on virtually
> any kernel (with some caveats).  There are no constraints on the
> compiler (i.e., any version of GCC or Clang is acceptable), while Linux
> perf is the only external dependency used for profile collection and
> conversion. BOLT works on top of AutoFDO and LTO but can be used without
> them if the user desires. The build overhead is a few seconds.
>
> As you've heard from the LLVM discussion
> (https://discourse.llvm.org/t/optimizing-the-linux-kernel-with-autofdo-in=
cluding-thinlto-and-propeller)
> and LPC talk (https://lpc.events/event/18/contributions/1921/), at Meta,
> we've also successfully optimized the kernel and got similar results.
>
> Again, this is a heads-up before the patch, and I would like to hear
> what people think about having a binary optimizer as a user-selectable
> alternative to Propeller.

I'd imagine that folks would be interested in running Propeller, or
BOLT, but perhaps not both.

In that sense, Kconfig has the means to express mutual exclusion.
It's perhaps worth working together to get the kconfig selection
working such that folks can play with enabling these newer toolchain
related technologies.

The next instance of the bi-weekly public Clang Built Linux meeting is
next Wednesday. (Links from https://clangbuiltlinux.github.io/)

Perhaps it's worth Rong (and Sriraman and Han) and Maksim to stop by and ch=
at?
--=20
Thanks,
~Nick Desaulniers

