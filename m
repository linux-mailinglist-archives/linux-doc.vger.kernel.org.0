Return-Path: <linux-doc+bounces-9792-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1C8581C2
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 16:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D001F22C5B
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 15:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974C412FF83;
	Fri, 16 Feb 2024 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hvc00JVY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422C12FF6A
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708098756; cv=none; b=D904dbOlQ4XrByiSTmc5NX3ndjlXw7ZTnb+FphVhIsapuRyq3X/jLMSWrQI5lru4PCqSpU3Obw3fcEQ0EpzQtaQVNMlaF7wQoeBp31yq6X2/1Wj4TupZtyjS0tCJayudLg7HNDUOQ6kkq6gyEvDvaC/j6QpJeySg2KnTFDZtyjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708098756; c=relaxed/simple;
	bh=Twfvqn5z2TPQUG3mCx7eOkQhXIYHDRrgU1d+jAxcuDQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=azy7hoovX/HQxf3F0KgXwhab4Ziue2Z4cURLs9VZ+l3Nj6fJIU7fOBzOlrnHA7k0HpvFvv5kwTEIuY5zkY4xLHGIuhrzZxUSg9sAYtf3Yud/N1AxogHYLcsLiREjh1faDRwWkgw583WO3RbKOAu+PUCnUQ9gKsDqW3BAZek91c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hvc00JVY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5dcbb769a71so1552762a12.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 07:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708098754; x=1708703554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdWqN4twnny7sh0kB73t0EmMejLUnVRIUmMC6P4B0Co=;
        b=hvc00JVY9QTiNJqrNSc9ww1n6V66a9ToFhqNn+QVc2hFHv9CJ6kl7fuFuU91Wpo9V5
         AOCQ23wjPxaSVZ9fbzmTAfUlNhiX6nzvr6qmqmlarf1sT2G9/M8ahxG0T4/HOX1pwKyt
         Ax1X4TNQfp8gFyCudeWba74kxXywGXaUm2sZN3k7Hu7zf+wOVlrIYKPj/ewPyq3Mrzoa
         58i6se1eDpBM+th90UaVbSHE68Fci2xO4ngxX5kOopyDQkfNbH1yXd91RfyN3apqurfX
         daI5BHm9rXCiweNWm7SUN4yth5rOCv4esCUEdSJahGAgEn+ejMzNp19HOI/jVYYEH7Ed
         08pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708098754; x=1708703554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdWqN4twnny7sh0kB73t0EmMejLUnVRIUmMC6P4B0Co=;
        b=htaUk1I2DPXIgzvx7NNrsF9JLHBZH4xCtIbm6i8jlM8dEuwJznpMg7KElHEwEft/Ka
         tg192b7hsfuBf899hpEKDXIpXgqina2Yq0BYm2X5u2KcAHkTBNB5xhd0J5YH+gR8x58I
         xRD4HjVGITsr+EKnXR6tbThKScAddG2oKyc8n6G8IXaWtJsIM1OUjJff1KFti+9pgFQu
         J1QwZeqD5ioXONA5qZVihftB6rbiQqdznejdg8tAocZkp3minhb7tjWxIEOq2/HrxFyR
         ymsEsG5X4Zb/pJq//CjTsrQuMEPAmKgp+Jj1kEf3VZGzmTY0nrlzOwXae30A/w0e91S2
         y3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUqEyjA8dE24g4QN4mGaTG0HKe1XELDN/JyV6LxxANKIU3Yi5YTU6xavvt/11+urGzp+HlZ5WpVRP29y0BTa5X/W5mCdiiNL9JG
X-Gm-Message-State: AOJu0Yw9IlejuUK2jJ/XE3/wCkGfUBhSZwGx1Kz/HgnVSUhALxpCV40x
	LpDWJYp5oyRak+/lY1ms0UpeOG5M5QosPpH4UpECVm2IESH3a6lpCm3f9FOwFEqFiGAKnAJ5AtP
	A+Q==
X-Google-Smtp-Source: AGHT+IHdTJArPS4Wa/fITdXprcQUHngTC0JP272as27E3u1351Uiji0GihlmCXFNyvIDmjcngg5SUcACTOg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:a09:b0:5dc:23a4:3a with SMTP id
 cm9-20020a056a020a0900b005dc23a4003amr13383pgb.7.1708098754138; Fri, 16 Feb
 2024 07:52:34 -0800 (PST)
Date: Fri, 16 Feb 2024 07:52:32 -0800
In-Reply-To: <df6ad8b9-4e53-4357-ab17-e9af62342849@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org> <20240215152916.1158-22-paul@xen.org>
 <23e7ec31a67a73fe94b2b04dbca26ea5ca1ea238.camel@infradead.org> <df6ad8b9-4e53-4357-ab17-e9af62342849@xen.org>
Message-ID: <Zc-EwMoijOo7w49N@google.com>
Subject: Re: [PATCH v13 21/21] KVM: pfncache: rework __kvm_gpc_refresh() to
 fix locking issues
From: Sean Christopherson <seanjc@google.com>
To: paul@xen.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 16, 2024, Paul Durrant wrote:
> On 16/02/2024 13:04, David Woodhouse wrote:
> > On Thu, 2024-02-15 at 15:29 +0000, Paul Durrant wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > 
> > > This function can race with kvm_gpc_deactivate(), which does not take
> > > the ->refresh_lock. This means kvm_gpc_deactivate() can wipe the ->pfn
> > > and ->khva fields, and unmap the latter, while hva_to_pfn_retry() has
> > > temporarily dropped its write lock on gpc->lock.
> > 
> > Let's drop this from your series for now, as it's contentious.
> > 
> > Sean didn't like calling it a 'fix', which I had conceded and reworked
> > the commit message. It was on the list somewhere, and also in
> > https://git.infradead.org/users/dwmw2/linux.git/commitdiff/f19755000a7
> > 
> > I *also* think we should do this simpler one:
> > https://git.infradead.org/users/dwmw2/linux.git/commitdiff/cc69506d19a
> > ... which almost makes the first one unnecessary, but I think we should
> > do it *anyway* because the rwlock abuse it fixes is kind of awful.
> > 
> > And while we still can't actually *identify* the race condition that
> > led to a dereference of a NULL gpc->khva while holding the read lock
> > and gpc->valid and gpc->active both being true... I'll eat my hat if
> > cleaning up and simplifying the locking (and making it self-contained)
> > *doesn't* fix it.

Heh, I'm not taking that bet.

> > But either way, it isn't really part of your series. The only reason it
> > was tacked on the end was because it would have merge conflicts with
> > your series, which had been outstanding for months already.
> > 
> > So drop this one, and I'll work this bit out with Sean afterwards.

FWIW, I'm not opposed to overhauling the gpc locking, I agree it's a mess.  I just
want to proceed slower than I would for a fix, it's a lot to digest.

> Ok. Sean, I assume that since this is the last patch in the series it's
> superfluous for me to post a v14 just for this?

Correct, definitely no need for a new version.

