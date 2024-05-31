Return-Path: <linux-doc+bounces-17417-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5388D671B
	for <lists+linux-doc@lfdr.de>; Fri, 31 May 2024 18:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C92282BDD
	for <lists+linux-doc@lfdr.de>; Fri, 31 May 2024 16:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E28A16F904;
	Fri, 31 May 2024 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UCk/4hhx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073D8061D
	for <linux-doc@vger.kernel.org>; Fri, 31 May 2024 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173947; cv=none; b=St+l7YufOpgML3dyrnJDM+7vF+OLe9CLPuwJVt8VO18V/sGoFtd52ltyRUpboqcUamUyTtsZnLxYib/c81PozO0XPXU6zPPBP21vu2AwC8gQt/SFMTkpMB0HBqLpamQT9jN+B/vkEWMaCcZwB8Ipjrbfbnq/0rSuEe9HCNuuBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173947; c=relaxed/simple;
	bh=36m2p7lcItP/+bB0ofDSLrkZ1c8ARR5jCIwAHfSrTs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbp0Um2di+vO68EWt3OZbBFiJDiTGa3wrkOgZnfvPz+E6Q8IOYEE4eQ+Cos8qMq7Vsnn+rtECy+e6IacDLZZ3aLaJYx6b9p2wNkHEJ+zD3TQ0LJWHd+xKEEOM+dMdrpzR6GvjCYdtB3B+728DXGZ2eUPst8WJozf0gUTbxybRDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UCk/4hhx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-420107286ecso2245e9.0
        for <linux-doc@vger.kernel.org>; Fri, 31 May 2024 09:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717173944; x=1717778744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH4bnbtSSVEcXN8q4TBBHbQcYVbG9UpE4sBQSCvIGBs=;
        b=UCk/4hhxC9TTHJFm/SwPJSMMnlMhcDoNO2QA35JXbrLd6qvfLJGdG6clHM4wqdFN+T
         X9kHvucJTzr2PLtYEqwtJjZzGfy3QbJPaN2Tn4j+uFo5PenwKGSmJ4VgKbhykJo08BU/
         jbL/s1PqK5Xg6l+ZMFoJuzLbhaXh1sCZOHt4lHMlJ72lxFKovBtyGYHDND0RLXWCpjnJ
         g7uxM7rcbbUFqkj1PrjED5cXUkMl18o97jggrgC40XtawhccskTMcTsSfWkUsX+kObQc
         smI5WnvINM4M08+Q9/i0MnRBaBSHhUJsdHvq+0455OyIgScHxvcUnShXtXOWGp3QcHLj
         UKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717173944; x=1717778744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH4bnbtSSVEcXN8q4TBBHbQcYVbG9UpE4sBQSCvIGBs=;
        b=bdN8gebCA0VOdw4IwTbouECMbQmF5b6lmFeAwML2DVnAY9nd4pgghEucn6wB5Hvh/k
         Xmhv+d6DWMQnnkDyotYKe26jEtqM6BPQev3zanSYLfvJptmHE7ZW2ZOZNEkBo1Hbyutb
         ejoG22TBHUx3QIeJveLwXD5jdVAY3zETfGo5eVBNSge/1MqL/c+K1ICXxPg4gBZkv8ql
         He2XvlJMC046FG3Ff+9muloieONQsZxCf8eayNzxau94bYV4KqGeurWTRRJuRt/WJTJp
         AGLr9rPr/0F5hEas4OUHZec68cxPQa9BeT/Ss7gIj58pZ5Xec94O92uKpk4JCp+ID3Sm
         tOCg==
X-Forwarded-Encrypted: i=1; AJvYcCWQshxUkL8A37nIvI+NBx/rw92OpIgUv1TvittJF/6/7xMDZvROU8Ac/Ok+w4vQqn7pU+OHB1AdX3NmmPn8AhqP4j2IcenZc2LR
X-Gm-Message-State: AOJu0YyonWEu988/3jGnEDaRIcZTa/zDtZi6pUnhf3gS5MEETnbqhrIk
	2I2bTfmde0FQzOn0ot5pcBddLOODmgWDpeptS0FgY6q8m+gv4Lvxh9vCo43gpp6D5tey7bOgq3S
	LnzoJm0evC6L5pAlpGhhOldXL0l8VM5PQ/7V1
X-Google-Smtp-Source: AGHT+IEq8Fs3z13ePwWrnbWJUDpx50btCGNNHylLrjkBr8g/csKK0P+GO3+xFEqljtHAVxZhGvPrjS68k6wXeE2cHVA=
X-Received: by 2002:a05:600c:6546:b0:41f:9dd0:7168 with SMTP id
 5b1f17b1804b1-4212c091f55mr2200815e9.2.1717173943952; Fri, 31 May 2024
 09:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com> <Zll2ILUNWE-JPi9U@linux.dev>
In-Reply-To: <Zll2ILUNWE-JPi9U@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 31 May 2024 10:45:04 -0600
Message-ID: <CAOUHufb_-w=B+NfHAUAo=O8bDXZBdXeeGRZD6kY=krN07srbGA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 1:03=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Fri, May 31, 2024 at 12:05:48AM -0600, Yu Zhao wrote:

Let me add back what I said earlier:

  I'm not convinced, but it doesn't mean your point of view is
  invalid. If you fully understand the implications of your design
  choice and document them, I will not object.

> > All optimizations in v2 were measured step by step. Even that bitmap,
> > which might be considered overengineered, brought a readily
> > measuarable 4% improvement in memcached throughput on Altra Max
> > swapping to Optane:
>
> That's great, but taking an iterative approach to the problem allows
> the reviewers and maintainers to come to their own conclusions about
> each optimization independently. Squashing all of that together and
> posting the result doesn't allow for this.

That's your methodology, which I respect: as I said I won't stand in your w=
ay.

But mine is backed by data, please do respect that as well, by doing
what I asked: document your justifications.

> Even if we were to take the series as-is, the door is wide open to
> subsequent improvements.
>
> > What I don't think is acceptable is simplifying those optimizations
> > out without documenting your justifications (I would even call it a
> > design change, rather than simplification, from v3 to v4).
>
> No, sorry, there's nothing wrong with James' approach here.

Sorry, are you saying "without documenting your justifications" is
nothing wrong? If so, please elaborate.

> The discussion that led to the design of v4 happened on list; you were
> on CC. The general consensus on the KVM side was that the bitmap was
> complicated and lacked independent justification. There was ample
> opportunity to voice your concerns before he spent the time on v4.

Please re-read my previous emails -- I never object to the removal of
the bitmap or James' approach.

And please stop making assumptions -- I did voice my concerns with
James privately.

> You seriously cannot fault a contributor for respinning their work based
> on the provided feedback.

Are you saying I faulted James for taking others' feedback? If so,
where? And I'll make sure I don't give such an impression in the
future.

Also what do you think about the technical flaws and inaccurate
understandings I pointed out? You seem to have a strong opinion on
your iterate approach, but I hope you didn't choose to overlook the
real meat of this discussion.

