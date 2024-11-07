Return-Path: <linux-doc+bounces-30267-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EC9C1159
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 22:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDC91F2638A
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 21:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA27C218941;
	Thu,  7 Nov 2024 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BQ0ookEI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4832218932
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016461; cv=none; b=UGEo8w35M4RCILEHx1dpcNDvdCzNmziVWKBIw9dDHmQ1poVQashajNOhI0GVANZRExgb3oI8pLhnYgdhO6twzxJRzaKM4w4UebG6bofAFt3IQCjZ0wyTjgGOuclsdQl7pwCKYfBLqW9nnC9e82uBniVcq68k7ca/TLmBr/ZaYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016461; c=relaxed/simple;
	bh=L2z5Im7eApEYnSF6VAAS12BUcltczp7EaP9nsBPNtgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZf/zU/mscLrCsXz2zbk2Vjs8oSQNxmH2I3Jn6go2TH0X3b/kTPhvsDMsjk9WoSxwp9ZLhaU6kENSH5n2PltwNdNfmYUzD8kBC4jyZW6VW0BO7L70i+nGuKzdCVX4rfosL8qzVtADG2hxeSlo6QjRByVVkEHTm17L1v2FD71pcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BQ0ookEI; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-460b295b9eeso15321cf.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731016459; x=1731621259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=BQ0ookEIX3hz8qB0+WTx3crlIJ/BaR1qbqucW2T4SDddVR0ckxwtuNhYEXj563QkxY
         AGaHJRubLcHlSvCoZjPI6zHAOkUP3jhieIyKyjUFXgCqckT4ClEVBUSbQnMOxe+CGNCQ
         QO4esPxA09ImVMnrdQYrwiGQvtYXpWmy/sizV49Y5jo6lXIMIpApZiEPZJSrwOp74uLl
         mYjrV3H/NDDWfOijAUFu2ZjtJJVp0eNQ31Umrysqcupo30+AN4pd4rQXLTUCup+0WtVG
         AyTCph81uuGplCW2JqZftYaBnNksG2cQ03t9CGbDe5TYXxOYkNdQv+jtQYlne2TV0dUa
         3KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016459; x=1731621259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=ZXR88nIMI7G/O1n5z39DJXVkyCGIQJPP7ekslqQatSj8eO7bcVRIQbjgMYfU838CyW
         zQFPD2Vz/7tYuUtiafXxJWr88EgW/9OyyEdXD6JB/gL/GVeZbkJZEdsu/RKV/+mTkfXJ
         ETn51TNdN93otCEHruQBt/ikW/bEjGNGKzUEfK00Rxuh9GAn3OEmtlENikrUl3xiV8cp
         vBgorhQ6lHewUcNn0QTCWJQB81J3aAC216xBCmssp/QLA6itA/aLzbTmuWEVjopproW5
         kplehNf5ktxkeAN8Lve2nLSjvJeM3KMJomoSDLdnN/rR41haUT5V7pKTbB2bbRfL8k+2
         THYw==
X-Forwarded-Encrypted: i=1; AJvYcCVfTJpjQj2sg9N15AXzpQVPGfhRL0z7JZK/YG22FwYIQNe0MOdd+Moy05VThS074FOCtuZwaQgauKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIV3peiQbAdyRQpJ4whXaRip7XC8Cb5141XhFxWe0ksYtdXrbG
	6kzsgOY1zzDnBE6bngl000ud0qYlhXb/q0KfZQSiiEy/ncq+CWbRX4FmmAvUPUik05ZN3tyzMxe
	JjXfCosr5PTsbSQhF8675R9RxlU5cPQ03+ZIT
X-Gm-Gg: ASbGncutcR/Kdz2LcpK4ZWltxJlIrUkzwWz25Lg25Z2g2ERv+yIem+6pA2NzgdUtYy5
	lEL/+/QiYzXIdpOr6dXhDl0gydPMdAkWntgzaxxL5Z1wxLEXNIxKAxMBHjC3z
X-Google-Smtp-Source: AGHT+IFdkSoHyavqa/rWYWexCV5GeErWCgxte9R1lHiqNRFVJXCyk2W6mdtD7fnvhuSYzrquH11z1oepbqTe6XTTqdc=
X-Received: by 2002:ac8:5f06:0:b0:462:ad94:3555 with SMTP id
 d75a77b69052e-462fa646403mr5858781cf.25.1731016458594; Thu, 07 Nov 2024
 13:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com> <20241102175115.1769468-8-xur@google.com>
 <20241107204504.GA3432398@thelio-3990X>
In-Reply-To: <20241107204504.GA3432398@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Thu, 7 Nov 2024 13:54:06 -0800
Message-ID: <CAF1bQ=TNOs7shXMbgY3UYzDZyF3ge=6hUdfEJvHV4LOo--tqVA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] Add Propeller configuration for kernel build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan for finding this out!

We changed the propeller option with this patch:
https://github.com/llvm/llvm-project/pull/110039

Currently, this patch is only in the ToT clang (v20) and not yet
released in v19.
I'll add a compiler version check to the patch: if the clang version >=3D 2=
0,
use the new option.

If this patch is later released in v19.x clang, I'll have to update the che=
ck
accordingly.

If I don't hear objections, I'll send a fixup on top of Masahiro's branch.

Thanks,

-Rong

On Thu, Nov 7, 2024 at 12:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Sat, Nov 02, 2024 at 10:51:14AM -0700, Rong Xu wrote:
> > diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> > new file mode 100644
> > index 0000000000000..344190717e471
> > --- /dev/null
> > +++ b/scripts/Makefile.propeller
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Enable available and selected Clang Propeller features.
> > +ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlist=3D$(CLANG_=
PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
> > +  KBUILD_LDFLAGS +=3D --symbol-ordering-file=3D$(CLANG_PROPELLER_PROFI=
LE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
> > +else
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +endif
>
> It appears that '-fbasic-block-sections=3Dlabels' has been deprecated in
> the main branch of LLVM, as I see a warning repeated over and over when
> building allmodconfig:
>
>   clang: warning: argument '-fbasic-block-sections=3Dlabels' is deprecate=
d, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> https://github.com/llvm/llvm-project/commit/7b7747dc1d3da1a829503ea9505b4=
cecce4f5bda
>
> Sorry that I missed this during testing, as I was only using clang-19 at
> the time.
>
> I think you can send a fixup on top of Masahiro's branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t/log/?h=3Dkbuild
>
> > +# Propeller requires debug information to embed module names in the pr=
ofiles.
> > +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option. Skip this for=
 AutoFDO,
> > +# as the option should already be set.
> > +ifndef CONFIG_DEBUG_INFO
> > +  ifndef CONFIG_AUTOFDO_CLANG
> > +    CFLAGS_PROPELLER_CLANG +=3D -gmlt
> > +  endif
> > +endif
> > +
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +  ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3D$(CLANG_PROPELLER=
_PROFILE_PREFIX)_cc_profile.txt
> > +  else
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
>
> I think this might have a similar problem but I have not tested.
>
> > +  endif
> > +endif
> > +
> > +export CFLAGS_PROPELLER_CLANG
>
> Cheers,
> Nathan

