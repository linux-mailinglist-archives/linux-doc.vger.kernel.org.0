Return-Path: <linux-doc+bounces-41176-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C675AA67432
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 13:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1B53B2028
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 12:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A829175BF;
	Tue, 18 Mar 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TQKgQ0O3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37F28EC
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742301933; cv=none; b=Pbz084DIHwSmHNJYfkctTDq7piPNfTqVgdORlG9bsfO8exhpq2g+Hy95J4iHdpg8Xz7drVP1s0fROWHVw1NB40jmTmKVyIOfa1pcQTynzulTphk1v34mSgid2r8Eq3l642PdOvyBAlgB1NalYxBM16ITfpIpHINshyESW3nE4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742301933; c=relaxed/simple;
	bh=lwCYx+8aDhZ5qWXAs4XUHb64Z/2duqLisn5a9YUkA9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlMidZ/aoLiqmuw68/FcPD69ynbB5dQTrujlEUUxcTivsDRz6Q0vV2UKqVcW+Rg2jpTXLDhiLZ5rEQiTXjz8sz64hmS2fuYkvZLUlS6bj4/1ZhIDiZD8UAnaQlm4pkze3n52BwubU9pVGBBW6Ewx0ArrsPLQocPfBYbRohWIWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TQKgQ0O3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so10043902a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742301929; x=1742906729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qXTe4Yk90Sg3VlPoYATULTaZLwTfgsY3sNRfc2hTRIU=;
        b=TQKgQ0O33eBr5zuaezoVLSEYgx1/0JWoC904/n45QsSvMHkIhs25qOxxFysZEkHVOC
         VAmghIiSejkXw/pzAXDd3m8zf+XXBb0Xr+hSNqzCoPSjRptBkmTlVLATIGnlx2dFui0+
         58F6q7aWUU1xj1NLa06JBxXWpqjUao2PDtquLjf+qK1Lf8b7k34b2H427DBif7jDb5wt
         BrA1avhQdcnJbxTYM2P3h5UyqGW38SXWQNi1E1QGGqSEnrCcQ/kyMMEfPZpWnT7nYUIg
         2ZDHESG3ZNnx4QuuQdXGM7vx6lFwKGj8+G21XOAgM9F1PNt3TX8f2kvnTJdOnsbpFrKN
         JXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742301929; x=1742906729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXTe4Yk90Sg3VlPoYATULTaZLwTfgsY3sNRfc2hTRIU=;
        b=m+cwoA/PcWxd4oMa4V24sDDdDCIRLKvzjyr3zlMknW8f1zSsX2P8dEa3aI0Vwp+YPR
         C1dz8nJK45tbT8tWkoppCA3/pEEKxLOvrJBPHnokJn4RvLnNuFcPRhX3zUVWFD4370XJ
         DNpfRuU+kT/nO7wdr8kmTFA9XhfYWVmtnNFjOjx9ZvtCXpN7JzSD1OOqBUuRd5Aq7rJz
         4fb/7Xsh3Fj/0M27/gUGN7gTt4t2VwuKAReXimbkbmZSi5rL3L2JjE66idfUHhUOUpBN
         fUDAo86KFlRKRUgeoODNZ0EquS1c4cltrBQA0qGYcK62Kj8GRhdRbwvO+4ZYJs7XnEFh
         0dvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzLgAU/5sBNJYWPs3egBA/VApoXeo0BiTulwYV/LG4DOWYkAl0pHp0TgnA6Di/x4Gmseo2/An9cxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkITcFvBzNpAM5TjwFSaAeJE+JVyo41h6jIo77AXD/30ARVdg
	ezetug5mvj0jsen6EL5rz1YgIlC6vGjf+fRgeVVUxwGjZ9moVm9ZZZZE68VtWiU=
X-Gm-Gg: ASbGnctKaSqQUjtbXBINdebxvvnUb/F4i9OsiVyUIzeiTBpPRBek4iFh5es2UeX4AWn
	JtZ8anlue8M54zgl8SwaD5Uv/Up91hC5NxtYJSrxJgbF/JJEVFFoWx7OF07mnVxu0ZByq48NkZA
	ZmgKOdjAljEsVZCxtoigz/8NEtkkuhrVG9r2GjSZf3Yqo3lr9LPgqB+38jskNm2ZfaxWEIFm2pN
	7n94EwSXDerfdaMJ4l4ArMYWXm9hGxkf/RREbwQ5La8UiKnyYxJ53Tf1FW2jnpc0Dm+aonV00P4
	F2uS0NXHLimc2g9uD2MW3itFgoii7SFH
X-Google-Smtp-Source: AGHT+IGvtDbPjVoxVTWOd1NdIY09lXluivgwU090ch5Y5u/dyIz8R3TJbsTLRkeF7B6H3y+DKjJ5nA==
X-Received: by 2002:a05:6402:278a:b0:5e8:bf2a:7e8c with SMTP id 4fb4d7f45d1cf-5eb1dee2f2bmr3489732a12.11.1742301929333;
        Tue, 18 Mar 2025 05:45:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04e5sm7873781a12.35.2025.03.18.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:45:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:45:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-18b96818299ef211ef8ca620@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>

On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> 
> On 18/03/2025 09:48, Andrew Jones wrote:
> > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > > Hi Drew,
> > > 
> > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > Allow skipping scalar and vector unaligned access speed tests. This
> > > > is useful for testing alternative code paths and to skip the tests in
> > > > environments where they run too slowly. All CPUs must have the same
> > > > unaligned access speed.
> > > I'm not a big fan of the command line parameter, this is not where we should
> > > push uarch decisions because there could be many other in the future, the
> > > best solution to me should be in DT/ACPI and since the DT folks, according
> > > to Palmer, shut down this solution, it remains using an extension.
> > > 
> > > I have been reading a bit about unaligned accesses. Zicclsm was described as
> > > "Even though mandated, misaligned loads and stores might execute extremely
> > > slowly. Standard software distributions should assume their existence only
> > > for correctness, not for performance." in rva20/22 but *not* in rva23. So
> > > what about using this "hole" and consider that a platform that *advertises*
> > > Zicclsm means its unaligned accesses are fast? After internal discussion, It
> > > actually does not make sense to advertise Zicclsm if the platform accesses
> > > are slow right?
> > This topic pops up every so often, including in yesterday's server
> > platform TG call. In that call, and, afaict, every other time it has
> > popped up, the result is to reiterate that ISA extensions never say
> > anything about performance. So, Zicclsm will never mean fast and we
> > won't likely be able to add any extension that does.
> 
> 
> Ok, I should not say "fast". Usually, when an extension is advertised by a
> platform, we don't question its speed (zicboz, zicbom...etc), we simply use
> it and it's up to the vendor to benchmark its implementation and act
> accordingly (i.e. do not set it in the isa string).
> 
> 
> > > arm64 for example considers that armv8 has fast unaligned accesses and can
> > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though some
> > > uarchs are slow. Distros will very likely use rva23 as baseline so they will
> > > enable Zicclsm which would allow us to take advantage of this too, without
> > > this, we lose a lot of perf improvement in the kernel, see
> > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> > > 
> > > Or we could have a new named feature for this, even though it's weird to
> > > have a named feature which would basically  mean "Zicclsm is fast". We don't
> > > have, for example, a named feature to say "Zicboz is fast" but given the
> > > vague wording in the profile spec, maybe we can ask for one in that case?
> > > 
> > > Sorry for the late review and for triggering this debate...
> > No problem, let's try to pick the best option. I'll try listing all the
> > options and there pros/cons.
> > 
> > 1. Leave as is, which is to always probe
> >     pro: Nothing to do
> >     con: Not ideal in all environments
> > 
> > 2. New DT/ACPI description
> >     pro: Describing whether or not misaligned accesses are implemented in
> >          HW (which presumably means fast) is something that should be done
> > 	in HW descriptions
> >     con: We'll need to live with probing until we can get the descriptions
> >          defined, which may be never if there's too much opposition
> > 
> > 3. Command line
> >     pro: Easy and serves its purpose, which is to skip probing in the
> >          environments where probing is not desired
> >     con: Yet another command line option (which we may want to deprecate
> >          someday)
> > 
> > 4. New ISA extension
> >     pro: Easy to add to HW descriptions
> >     con: Not likely to get it through ratification
> > 
> > 5. New SBI FWFT feature
> >     pro: Probably easier to get through ratification than an ISA extension
> >     con: Instead of probing, kernel would have to ask SBI -- would that
> >          even be faster? Will all the environments that want to skip
> > 	probing even have a complete SBI?
> > 
> > 6. ??
> 
> 
> So what about:
> 
> 7. New enum value describing the performance as "FORCED" or "HW" (or
> anything better)
>     pro: We only use the existing Zicclsm
>     con: It's not clear that the accesses are fast but it basically says to
> SW "don't think too much, I'm telling you that you can use it", up to us to
> describe this correctly for users to understand.

But Zicclsm doesn't mean misaligned accesses are in HW, it just means
they're not going to explode. We'd still need the probing to find out
if the accesses are emulated (slow) or hw (fast). We at least want to
know the answer to that question because we advertise it to userspace
through hwprobe.

(BTW, another pro of the command line is that it can be used to test
both slow and fast paths without recompiling.)

Thanks,
drew

