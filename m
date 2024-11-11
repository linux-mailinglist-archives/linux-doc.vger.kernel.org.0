Return-Path: <linux-doc+bounces-30517-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3D9C493C
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 23:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9F2EB254E8
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 22:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1241BC9FB;
	Mon, 11 Nov 2024 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElFowb/N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8621BC08B
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364760; cv=none; b=VsWnEBdzLbs7PrTkUPI1aeQT3yiDmeUfiNNXjubDvH8t4o4J3kPdAR0IMDuvjJQdRVzGc+glbMB9TLbefHe03WmIDr+1/DYj+k9MeUcbAinLjTTGp3Wyp3QrYJMKHVkceqVNwknzJvysQ5e0yd+zrOWp8P8axv/qNQCTE2akhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364760; c=relaxed/simple;
	bh=eB8Ofe1WFjYWH1BdIe5Spco+AoLzN0kxnSrTkBUA88Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onomI+JHiE+H8omtZYRu1BWjGw6ngCDN6jvXUx6ysFr2l3SqCOu2oilUKirW/Ik896BHskAhiKtvB3YpbAcn1k3Tka51gMwrHiYnQIoU/7TpMTVrMYk8pZO+twtg8L/LNnQCffYT1tRnn1vC9PniRAZFanwsD9PSBihF35cW/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElFowb/N; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4608dddaa35so101511cf.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 14:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731364757; x=1731969557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2kkJJPrMSags8YoRSR8VcHdm0Q+fmhGso6Vl4PBlQI=;
        b=ElFowb/NgPe/jS82S+DSq04OF/+AhB0hsJ/zYlYGqqxuiTV0mtgCTfcFjXsisOwPTb
         z5UqXl0EhddAMJJU09DTyNsIZCyeO0kfCMfMEBbzw2b+n62Icfb60Y/gV/NMrhgeEIv4
         Vzv170Dx0lZ3hiIV9K+krTcJuiqVwQljZLGH4fl/mwjr69IFueFBP/UwYv0bAndhnFwm
         K2XOo4U9BUlm2ASBmnNOpbX0cC/LJsWBKHSdTwF6hOI/QO7jUEcnjA5vXhZp1I01hy9D
         gigDm9ZJUNwI80TY0Qp8HHa44x3i6v+4koyBcMPdDL6BL6aIFaaYoKaQstnikXYcF9y/
         C7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731364757; x=1731969557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2kkJJPrMSags8YoRSR8VcHdm0Q+fmhGso6Vl4PBlQI=;
        b=c0QxUjQdS3tCf51KTXXlK1wKI1DNWOSQBji2xXH3ZczWV8aQjwT35icym66rWwpA6I
         nNz2I1+pV/SPQ1MMhIR0LGvnQYjpr4jFqXovhidKT0JBcXtVT4pZaQiB2gOzumipnRO2
         OCpEF4UutgCRHeDTFYqEi7AkBZKYlDgZ/1vK2mSl4eI2x6jyYvx3IMnCgG4/qev9Zr8D
         15Cu0UKrh0cOEJFdnQikmqGIH6pj15HKJh27FKmpSK50YaEt5z2ySpdzLMXnfAvj9KHJ
         G2WIGaAkruCkFkH3wRWR5BA1UsiUvMiIkwW71/NHvkAzy7Eg+qIDUwXhyYXPkqPzhBAJ
         hm4A==
X-Forwarded-Encrypted: i=1; AJvYcCWMcmHmKa95oh0EUsFuQWKzBVU2jetR/cGWv64RL3ZFUaVNijB3nrCmTLhPPno1l4rWj5K74j1TJjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQyclvIcq6swzqKdeAq1U0qLwxq6BJotFgSwMpHYwXOqFv/Yo
	gklTIXzSfKF11rhznKWpqv9OglTbyD8so7UCc7YR/H1f5X3TQpjzQc6WZFCEn2s91mNQ0Bfnk25
	sxYHaTZTAiN6bGJbGGtuS5ggetCCmCpWAciQP
X-Gm-Gg: ASbGncuOKKM1eAHUVhaD+Tn1oVUmJGvCVIDmay5ULn+hfIm7/bmQ0PfQ9XnSTXK4bed
	5OhenOnrZ20fw86AiA7KMkaazaWvUenl1Ik5tXqd9G1n6c95+mK5n5Gsrimkj4A==
X-Google-Smtp-Source: AGHT+IGWz5fxnaCrLCNd/OH6jFNg44ylUdGuht8uH/3QX9IXKi/RoL7fie/C49RsOcadfvZfnBz8SZRoCkm3npHj8KM=
X-Received: by 2002:a05:622a:190a:b0:462:c96a:bb30 with SMTP id
 d75a77b69052e-4633ef60502mr1176031cf.2.1731364757391; Mon, 11 Nov 2024
 14:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com> <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com>
In-Reply-To: <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 11 Nov 2024 14:39:05 -0800
Message-ID: <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Klara Modin <klarasmodin@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Yabin Cui <yabinc@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, Stephane Eranian <eranian@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the new System.map, we have:
ffffffff81112400 T _stext

This looks wrong. It should point to the beginning of the text, like
ffffffff81100400 T _stext

I'll do some debugging on this.

-Rong

On Mon, Nov 11, 2024 at 1:32=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> On 2024-11-11 21:43, Rong Xu wrote:
> > Thanks for reporting this issue!
> >
> > I'm assuming your kernel build enables dead code elimination and
> > uses the --ffunction-sections compiler flag. Without this patch, all
> > the functions
> > -- I think there are only .text.unlikely.* and .text.* are grouped
> > together in the
> > final vmlinux. This patch modifies the linker script to place
> > .text.unlikely.* functions
> >   before .text.* functions. I've examined arch/mips/kernel/vmlinux.lds.=
S, and
> > haven't found any obvious issue.
> >
> > Can you send me the following?
> > (1) the kernel build command
> > (2) System.map without the patch
> > (3) System.map with the patch
> >
> > Best regards,
> >
> > -Rong
> >
> I don't set -ffunction-sections explicitly but it seems to be used when
> I look at the .cmd files. The build command is nothing fancy, I just set
> ARCH=3Dmips CROSS_COMPILE=3Dmips64-unknown-linux-gnuabin32- and build wit=
h
> make -j24.
>
> I've attached the System.map, built on next-20241111 as well as it with
> this series reverted.
>
> Regards,
> Klara Modin

