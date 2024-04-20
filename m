Return-Path: <linux-doc+bounces-14694-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6C8AB7FF
	for <lists+linux-doc@lfdr.de>; Sat, 20 Apr 2024 01:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540E61C20615
	for <lists+linux-doc@lfdr.de>; Fri, 19 Apr 2024 23:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9495E13D889;
	Fri, 19 Apr 2024 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RXkBkKRH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B713D625
	for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 23:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713571028; cv=none; b=dHcMsHbaZqflKES7zuB09ZILkPgWpuYUg5D4Fs1/xVvdUBqv42GsljNGMNwLEHcIRN2Hq85bL07RPtwWEDaXNOkLaxoYVh3uXUkrfXQJdDi1J9zbPbLB+kN9jhYYh5dlHXWnOk+P/oFRQjvzequaiaThIBE4ZgCJzgkK9rlziwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713571028; c=relaxed/simple;
	bh=0i9fPL4EQ86xqogaOVaFxgyloZ9K0XhVTlDWP/nruPY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=coNsb2SD2hl9S2F/UvkQXSZe7jUV96kuGRbLwmA3jU7qTpM13+7IaQ18LFxbDYiq4k/+FHtq0qMizMOCKskS/B6WwgcfR9Hv0UK0iiHn2lVP7+Szg/mut/vZFAgvtp0U2Up4mkqmeNJtirUtI2oA4hmxcEa3Nq4IJe/y0SSVrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RXkBkKRH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2a2dbaacff8so2972125a91.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 16:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713571026; x=1714175826; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLNaa1mk4sNg08myPy5RMxBhkcXeZh/6vIOkJI8rDE0=;
        b=RXkBkKRHPqyOAHLW2C+R8m1l+ZGa5AL9WfcNc5QnhbIo97RSLeOIXYxrLhXxMiaKDP
         ZDvIz1QrhZhYj+rNo5evdvuR7f4iXARYw+8Z4ANFs+VoO0SP1PizEYEjOHgaiDfiFPBK
         qc/avM8h2t8cHulwf/UWWL8JlWQtjXW2z+sivZ0JkoEPZD8YXTRziD3m74GFW08Ifcd8
         V1Igsqrv/BptDARRYzfsSgNvxchVOs0ji/8nCISd9RFB+eVWenLnshy72TckExJMHhYZ
         GLrciMWUdeK0hUOTWBabA9yyafo4oKG+QdljM2mXVO5HamI+yjNTUgM3DCJbBhHWyHHW
         c+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713571026; x=1714175826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLNaa1mk4sNg08myPy5RMxBhkcXeZh/6vIOkJI8rDE0=;
        b=BXk72n6W953tNOwYHhKxfoibWQTqGxbRV0hYDnDij+Ri4oP3jp1tNSye1aji3H/L6K
         T/LuSNf7yBcpFpuWENa1eMtZbgiSzHGOuid1m0AFSYxJKqCxLM67UYdAsovsxHK7W1GI
         sC41nCX7CuAYHGFdb/j6qVE3QtJ84M8m6mQImti+lJhbMlVu+89RjN0Qb65FDeCoaeZa
         rm4hmDi+Cx70pkM9QkDyFwuu+k9j4ElguPnzhoc6aeckFpjaIH2ga+D89Vir4TTwQGZC
         X139+h5rTIDxQlnQywogVkJOmvilYfThKDvh0pIpj/e+r4APxdNSoonSBK65379Fo9Zr
         YutQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtb7zgFxthQ3Wjnk3Tf/Yyhkfotpx579rDlgBzMluVte2cssdsLijr+7p/QyW7zVVzdvdKne3FSErLYgVUrjidFDxCOs8AqBob
X-Gm-Message-State: AOJu0YzO8PLN1JhbD+lSYt2JbmwJZ64le+nwxf7PpOqLN0tD7JrIlOBF
	pm54E3qDN7VMIDenLeAS+tl/LW/9Dq+4nAXuAiBkmxh0KymiBaQL2HOHTDlZMIFW5aP2CnvQtyy
	NkQ==
X-Google-Smtp-Source: AGHT+IGojlfhEsdxzaTztBL3XZjbkG9HPajwqeVsxW/YWoIYkuhKNZv91sHNWj8ENPEn4Tl33sIDqZKF3ic=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1b46:b0:2a2:8f19:f484 with SMTP id
 nv6-20020a17090b1b4600b002a28f19f484mr11473pjb.3.1713571024724; Fri, 19 Apr
 2024 16:57:04 -0700 (PDT)
Date: Fri, 19 Apr 2024 16:57:03 -0700
In-Reply-To: <20240419173429.dj6nzgg3t23f52ol@treble>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240417001507.2264512-1-seanjc@google.com> <20240417001507.2264512-2-seanjc@google.com>
 <20240419160537.namt5yaxhhvwwa3r@treble> <ZiKgAh1aNBGHpOof@google.com> <20240419173429.dj6nzgg3t23f52ol@treble>
Message-ID: <ZiMEz0ekQ6Tl7qh-@google.com>
Subject: Re: [PATCH 1/2] cpu: Re-enable CPU mitigations by default for !X86 architectures
From: Sean Christopherson <seanjc@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 19, 2024, Josh Poimboeuf wrote:
> On Fri, Apr 19, 2024 at 09:46:58AM -0700, Sean Christopherson wrote:
> > > It seems confusing to have two config options which have very similar
> > > names and similar purposes (with subtle differences depending on the
> > > arch).
> > > 
> > > How about we instead just get rid of the x86-specific
> > > SPECULATION_MITIGATIONS and replace it with a menu which depends on
> > > CPU_MITIGATIONS:
> > 
> > Huh, didn't realize that was possible.
> > 
> > I agree that having two things for the same thing is confusing, though Boris'
> > idea to do s/SPECULATION_MITIGATIONS/X86_CPU_MITIGATIONS would help a fair bit
> > on that front.
> > 
> > My only hesitation is that x86's menu and the common config knob end up in
> > completely different locations.
> 
> I'm thinking this is a minor issue because CPU_MITIGATIONS is enabled by
> default, so it should almost always be enabled unless the user disables
> it, in which case they wouldn't be looking for the x86-specific
> mitigations anyway.

Yeah, this isn't a sticking point by any means.

Oh, and another hiccup I almost forgot about (I just recalled Geert's report).
Letting CPU_MITIGATIONS be disabled for every arch at compile time will obsolete
a small amount of kernel code, e.g. arm64 explicitly says "disabled by command
line option" in a few places.

Those are easy enough to fixup though, but it's not clear that other architectures
*want* to allow mitigations to be completely compiled out.  x86 appears to be
relatively unique in that it has a bajillion different things being mitigated.

Rather than making CPU_MITIGATIONS configured for all architectures, what if
use another Kconfig to tell common code that arch code has already defined
CPU_MITIGATIONS?  The big downside is that if another arch does end up letting
the user disable CPU_MITIGATIONS, then we'll probably end up duplicating the
help text.  But again, it's not clear that any other arch wants to allow that,
i.e. we can cross that bridge if we come to it.

config ARCH_CONFIGURES_CPU_MITIGATIONS
	bool

if !ARCH_CONFIGURES_CPU_MITIGATIONS
config CPU_MITIGATIONS
	def_bool y
endif


> Regardless it seems very common for a menu "depends on" to be in a
> different file.  We could put CPU_MITIGATIONS in arch/Kconfig which is a
> fairly logical place for the dependency.

Yeah, arch/Kconfig is probably better than init/Kconfig.

Given that it's late on Friday, I'll somewhat speculatively (ba-dump ching!) post
a v2, and Cc Linus to explain the mess so that he can apply it directly if he
thinks it's urgent enough to squeeze into -rc5, and if if my idea isn't completely
off the rails.

