Return-Path: <linux-doc+bounces-14653-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDD8AB04C
	for <lists+linux-doc@lfdr.de>; Fri, 19 Apr 2024 16:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943E31F240B0
	for <lists+linux-doc@lfdr.de>; Fri, 19 Apr 2024 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E326512F5A1;
	Fri, 19 Apr 2024 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zmV0+CyB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46A12DDB0
	for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535563; cv=none; b=GFoKixy4tQMJvBpxSqmV7tBLMchf+caS6Z/i56Eh9tt1xYzhUjRQjB0EbL/uYWZMtxSVK16qL3QXMS39Kko6R8tPH164LS94qp1oUWvIJp3vQfdjlZAFRvsbVP1fLXBhLbpREXScmG6mYt7M7NtPFLKoYH05OeHPV3JV9noDOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535563; c=relaxed/simple;
	bh=nFGu38xiqRmTsAmgiVPoArTv2FW3yfqKeN+PsXjaSvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QzbxG072HNpqMd4/rPVZBq89KdC9DyfdAaS78+7na6gGeN4/ZvSY4d64FUmkYs+rqNRpxFLQekhPKzzuW7796HxoiYNt3JgzNZNXherG7lIiYUOLk+74yKBFHp51ttMztF/vq//6M6cL5PO19vd29ct/nPb9Q8FAD9goLzsnlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zmV0+CyB; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1e2c4e7103dso16926265ad.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713535562; x=1714140362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m+OFN3f7RK1NWDGOjcIbMxbJWaEeT5t2cMPNC651Yw=;
        b=zmV0+CyBsrXn1cD5SV3geIH/GBP+MnqXtEjx6Jw+Qles5D5l6AuoZeFDOj2luTuJxj
         Jpf2nlN1t7Lm9TcEzCBWQ6bQgJvXyH63Xj/kmwYtbbtZA+wFFEmHuZE2UziSspRmiyoa
         4Yv+X5RcPpKQUQK1AtfhudkkYnT2Jdx2eDQwGZwuIpHSaPNQ6OREwEJFocL0pIu9ZrNB
         82YgEYAnvdrJq3t89Ij4rNO0RfIhaCMjUDd47LPPF8W9/3sGFMJxLpKfkbsUHREK3Ibu
         hgks8V3XOju3ErunjqC0AjCyi9sAY+9p8pmw249UA9iKWjQesuLjUos9fhKJE8FGJWxA
         ciHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535562; x=1714140362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m+OFN3f7RK1NWDGOjcIbMxbJWaEeT5t2cMPNC651Yw=;
        b=e8ByTuW4r+inJ/72yMQvPvILn7UaxXb/9ej4c0yWHiqQHoTrLVFa9I9WBrMWOMKLwF
         aOeVfF7o3tc1tOjnn6vuhPcb9wbr+NkGW+85RLEl//H7qGtNdP0PV8zK+YRd7g18urnj
         dZXXR+0XMyLZ/BW9yUzP8k+emuUX5yTCwjkW1AJk8BJJVsqte2zG5YcBAg4/c6KHU9Sz
         iEjIAB3zk7ZRIdtM3d2bZIy9j7EybcWPwDeuF8v3li99JT3quhIq7vOo5phi67YdQKh2
         hSzS8l8NTxsZyRObVyrGWS/nmQZjp3S11gPQpq+5x6koyhfHsCT58WUE93qDtjLXOkL3
         oSzg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZIVB3ZBygEDtrKeIkdV712hTWYqbrWBm4w5aLcFIvXZz4uXktQmCViwie+H314bE2ypynfuy0ravcJDRFsmkOTmqVI/C0sG0
X-Gm-Message-State: AOJu0Ywo8FVy8EwJgCtQjnvZdPnuWLxIcsRbqHuvvRIxaYjeNxIbVkna
	Yiu70YDf8uzbIbguhnjSsP041lNZL6fcQmO3PseG5STQJEh5+A1RLigzwuPGuUrWpVdNoT0kdnC
	IvA==
X-Google-Smtp-Source: AGHT+IFVr0e57cGhUmbwZXAzUZi28t0zaJY3a/EePbJv+HQcnlGd85ionAxsgZB2Zmftzq48Qq8oRL7k/7k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2352:b0:1e5:e61c:35af with SMTP id
 c18-20020a170903235200b001e5e61c35afmr243172plh.1.1713535561835; Fri, 19 Apr
 2024 07:06:01 -0700 (PDT)
Date: Fri, 19 Apr 2024 07:06:00 -0700
In-Reply-To: <20240419140321.GF3148@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse> <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
 <Zh06O35yKIF2vNdE@google.com> <20240419140321.GF3148@willie-the-truck>
Message-ID: <ZiJ6SDcbTBQjrG3r@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 19, 2024, Will Deacon wrote:
> On Mon, Apr 15, 2024 at 07:31:23AM -0700, Sean Christopherson wrote:
> > On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> > Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't think
> > of better solution than an on-by-default generic Kconfig, though can't that it
> > more simply be:
> > 
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 2b8fd6bb7da0..5930cb56ee29 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
> >  config GENERIC_CPU_VULNERABILITIES
> >         bool
> >  
> > +config SPECULATION_MITIGATIONS
> > +       def_bool !X86
> > +
> >  config SOC_BUS
> >         bool
> >         select GLOB
> 
> I can't see this in -next yet. Do you plan to post it as a proper patch
> to collect acks etc?

Sorry, I neglected to Cc everyone.

https://lore.kernel.org/all/20240417001507.2264512-2-seanjc@google.com

