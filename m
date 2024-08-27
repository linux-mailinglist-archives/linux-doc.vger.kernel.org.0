Return-Path: <linux-doc+bounces-23913-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E803A9603D3
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 10:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7622A1F22400
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 08:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C078518859A;
	Tue, 27 Aug 2024 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nlS549p4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7C14B06A
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724745764; cv=none; b=KDaaT5UhyGNXMvhXCBQ9N842dEL5E/odtMPsINWl9L1uc/eGwgAzo3s1136o21ay+8OKzbCZA8iQQT08xJm8ZluRRjxtxEatl8DEf9GbsTzRtwPWma876339O7w3rs9sCTq/n2xlvzuttwlPj9lLuokLr1aqZVec3X2lOCvHvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724745764; c=relaxed/simple;
	bh=wlrG+jo4u8AssfQwalnT72u3VqV0xp8FeGbzhPN+7dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw352QBHIyOn9l7akJYjYVQilaESmoX0Lqc10Yu1Dy3x3HCcqNg0ASX7XVBU2IIEUErKrA+zegHaRGjH29vXWmhg7dZgGWnDE+A1L29GiN+2Q6KCCtDUVA9okg/nlBuCX4BUS/n5IcL2M+nfVonqQ7BdY92/B3t0enr6kuq/Mz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nlS549p4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a80eab3945eso526723066b.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724745761; x=1725350561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBms7y/tBFsZy50lNtASZmPiwThWbZhDKwKfTMeuMMA=;
        b=nlS549p4JTo3fPOPqS4F/iD20dzwpajKPITR05dlg8y776p0hL7WBDW4i2TozmQL+x
         pEGfAcE7KDoesQk7VCA4O3IL8Fg68xysf5mqKFKhliU0xyLE0b+iSkHCt11uJcKkfmda
         KV1yBgtaNKy90QzGkOHMd3CY3JmZk7aUxh/LyO2IAAAGODHvMfNnKYBwhUBo15PzDZHN
         DBkc1+w0ySdCgOOEyiJc+k13spNu7IBxxrN/9JKalEAjKy5NpXp7uq73elvWZWO0G7j5
         Lve/Ephfe2jg9T7VBO3JWkyu2O0XFqNZu2M0HWyp6rdKE/mZwTOQ+0gjxuXyRxLBSRgx
         vr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724745761; x=1725350561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBms7y/tBFsZy50lNtASZmPiwThWbZhDKwKfTMeuMMA=;
        b=eUzbTKydoQAhUac2s+2EaA30ZV4LBkzjuhfHADlV8ETOF5aLZbj+DA7Yn3cjm7o9kE
         3bCvLMf8LOKSrytL/oY9gajdFXI+E1bFc/xZ1t1w+bmInruLYNdJTvAADNMYNBDZHesU
         VQ71qwP9AbyLJYIDt7gmYVl+eIUjiu6Je78MrnQmk5qJ1lHwbi7aOCOvrdSjR0XNv+0o
         kfc4D3i/m5lHxC5j94BAuRdeg2LMSs8bPESlhq6Gf9Nzdy7rh2sDG2RaGWomgFSY2alE
         GXD1D7h0fLIOaZpsTnbqOnE3Gkp5eYK25XaqSM395kTZBDi+Erv0fCT+n71mbc8GLngT
         E+bA==
X-Forwarded-Encrypted: i=1; AJvYcCWwHjK1vdLx5VQFQx/a8qSFeTs+FzGJDY3ozVpABE0Q2z20LkgJJEILmmXSBTq3l7K0vu/d/Qrt4G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoITiOd7Ke6XxZ6s9jaL9lIgonCr9pDi89JRtS8UZyZPigZTpQ
	h2xMAquICcqpGWU+aoJgXYUcePzewkCjo+HP87A59gArMEvyL3e9JV3ZyB0BVdO1SDmOOJHnv22
	lNlAjnFCFA1UsPN/J3IXJdJsx4mj3eOLfNreOpg==
X-Google-Smtp-Source: AGHT+IEPKjzBgfiAk9G0dnZjYH9HkHNAZ5iX4+y8YvtQs+BwlAOu22sCjko/Iouwb9iDtzPGYnZU+k2kKs5nhqRDXTc=
X-Received: by 2002:a17:907:9491:b0:a7a:b643:654f with SMTP id
 a640c23a62f3a-a86e39f9082mr158372366b.15.1724745761303; Tue, 27 Aug 2024
 01:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com> <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubgtD_nDBL2H-MYb9V+3jLBoszz8HAZ2NTTsiS2wR6aPDQ@mail.gmail.com>
 <6f1bcc9b-1812-4e8c-9050-a750bfadd008@ghiti.fr> <CAJF2gTS4L6=HE_-9rgn3L8+6R7C4Jx=QgCkvOBhQHdHVGzr5MA@mail.gmail.com>
 <20240821-6befd27b90a9e9ff89f4a277@orel>
In-Reply-To: <20240821-6befd27b90a9e9ff89f4a277@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 27 Aug 2024 10:02:30 +0200
Message-ID: <CAHVXubiy3=bEf29qpzGX0MoBXkjBy38p9Xhz7yRYN5Sr3qRw0g@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi drew,

On Wed, Aug 21, 2024 at 2:18=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Sat, Aug 17, 2024 at 01:08:34PM GMT, Guo Ren wrote:
> ...
> > > So I have just checked the size of the jump table section:
> > >
> > > * defconfig:
> > >
> > > - ticket: 26928 bytes
> > > - combo: 28320 bytes
> > >
> > > So that's a ~5% increase.
> > >
> > > * ubuntu config
> > >
> > > - ticket: 107840 bytes
> > > - combo: 174752 bytes
> > >
> > > And that's a ~62% increase.
> > The size of the jump table section has increased from 5% to 62%. I
> > think some configuration triggers the jump table's debug code. If it's
> > not a debugging configuration, that's a bug of the Ubuntu config.
>
> And I just remembered we wanted to check with CONFIG_CC_OPTIMIZE_FOR_SIZE

Here we go!

The size of the jump table section:

* defconfig:

- ticket: 12176 bytes
- combo: 13168 bytes

So that's a ~8% increase.

* ubuntu config

- ticket:   73920 bytes
- combo: 84656 bytes

And that's a ~14% increase.

This is the ELF size difference between ticket and combo spinlocks:

* ticket:   695906872 bytes
* combo: 697558496 bytes

So that's an increase of ~0.23% on the ELF.

And the .text section size:

* ticket:   10322820 bytes
* combo: 10332136 bytes

And that's a ~0.09% increase!

So that's even better :)

Thanks for asking!

Alex

>
> Thanks,
> drew
>
> >
> > >
> > > This is the ELF size difference between ticket and combo spinlocks:
> > >
> > > * ticket: 776915592 bytes
> > > * combo: 786958968 bytes
> > >
> > > So that's an increase of ~1.3% on the ELF.
> > >
> > > And the .text section size:
> > >
> > > * ticket: 12290960 bytes
> > > * combo: 12366644 bytes
> > >
> > > And that's a ~0.6% increase!
> > >
> > > Finally, I'd say the impact is very limited :)
> > >
> > > Thanks,
> > >
> > > Alex
> > >
> > >

