Return-Path: <linux-doc+bounces-15071-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94618B26CD
	for <lists+linux-doc@lfdr.de>; Thu, 25 Apr 2024 18:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1794D1C20C73
	for <lists+linux-doc@lfdr.de>; Thu, 25 Apr 2024 16:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC9149E0E;
	Thu, 25 Apr 2024 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kbmLg2A4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473E14D44F
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063676; cv=none; b=AKa5XpPxYI17ZyIF+LgroXEscY7wa7fq/sEfKZRrLFLAzd+H1wSUI4tstlOJzGSl7iFfF2pByQlecfOgJ0M7hNi2fN0pWIabwLtVnCvJ2N+hMYqqTX+E86GK+ApcKQNJSbMFxoMwxnQasc0+Z2DI+Aiz8lIKlDjzjpHwaQIg8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063676; c=relaxed/simple;
	bh=mpfNiz5ay5zCRSFe3zz3PlriOfJFIhumbATm0QJYobU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eWlkRidx82tnwKwZx3KJHV7WCFk+pVun9bmlA2zyeGCM7bblmbT8RauCQlzXyoVfdPRX2s75vhOIAFO/N35liigc7uoUXEG/D0v8uLRrjsY411EwZfpwpH1hu8XuPFJwtX9EvRAa4OT/5H3Rwqb98YJ75/ob24Iy8QBYg5bL8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kbmLg2A4; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6ceade361so3055926276.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714063673; x=1714668473; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUi3/+xNdVFJEzzlh8zAE5pQn6TguDhgQbf8j/v/Q+k=;
        b=kbmLg2A4qxM9q4P2jYqlaMTX+nsJtgfcVbTUJB0INZmllPPwkzgk0s/c1VQG3PdcYu
         vd3n0NvHpyhysShoRe6opm79Q23ee7MvPXdp6xhNE33oylvJq0D8S+kX1GJMSJrF00On
         ah3xqlEkdFGda3ykeeMMzHltyCLa3p9BNqXA+Uv4X2NJEW98BEI134ASODJua4slkX8K
         7bYim1AySp0CCbYJHZ9n+kosfKgBreDgWdhvbuTO8ier01QQr0/W6UDzMJhRCpC4GMhz
         wtShJ9hAzIVnHOkm34VkU6fV6O0zdbK6rbuNN/Uk1Y+SJooEPFK1czYKtCM2l2r0A2dU
         /ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714063673; x=1714668473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUi3/+xNdVFJEzzlh8zAE5pQn6TguDhgQbf8j/v/Q+k=;
        b=vdAKNZlYc7/vvKcAUG8J45+T40+e6rYpJkZfInV1HyOwUd2oJbvt3SCSZwh9sWOQXC
         mqu/q//BRKA5dw7e3jntjH3tuqMLo9WblGE9LG7J7vUMqpAUHqDKdQLylu6VM5FvSLQA
         3KA6eFKFam2se8kRNhEUOSJeZWgvHm3gk6c7Uf2ukJPIQK2iPdrGyHXlarWkVGbQTWOz
         jIYOR7sVjwBILuGQHqvcxhq4zRPnxZGBJaaD+ItbTMqsXUT0AbCd9F3B1KiMszaFGcCt
         4BWLFe6rGkY9p0oKEAl38E8Efug+mh5PWpVQYGyJwolN9FfBbdI7FR3Qw7cqb2rAMQLz
         RPqg==
X-Forwarded-Encrypted: i=1; AJvYcCUEuVKw/8WfvViu5JUg7i2lvGOFwAKYfcev1Oly2Kwtd6WOB7zt2Qbihy13km6ct3PjJJkXQSAJgwpUFEbo3kZQwmWleEi8pB1x
X-Gm-Message-State: AOJu0YwOxomgzyC3vOhUuAK8MHSzv9QUmfqxp9IqOEaoba/7EL+/fNH/
	CNavPvZJPyXJVE+NLbHFO1VRiNJW59Vhyn5RaDwWwI5hrkpj2N1KgyBWXVc/KcYxlVFWj2xX6Tr
	ANw==
X-Google-Smtp-Source: AGHT+IGqUrrdAgI0WrsQpuR+fIMUueODnjGrgxMc4+iKeIebTPxrIP38qyOq+Np3NVClojiwn9L9kNe94FY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:f81:b0:de4:7bae:3333 with SMTP id
 ft1-20020a0569020f8100b00de47bae3333mr41295ybb.3.1714063673677; Thu, 25 Apr
 2024 09:47:53 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:47:52 -0700
In-Reply-To: <ZioJN6ClnlFIQIBg@chenyu5-mobl2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240312193911.1796717-1-seanjc@google.com> <20240312193911.1796717-3-seanjc@google.com>
 <ZioJN6ClnlFIQIBg@chenyu5-mobl2>
Message-ID: <ZiqJOJEBshsQLl0M@google.com>
Subject: Re: [PATCH v2 2/2] sched/core: Drop spinlocks on contention iff
 kernel is preemptible
From: Sean Christopherson <seanjc@google.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, 
	Marco Elver <elver@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	David Matlack <dmatlack@google.com>, Friedrich Weber <f.weber@proxmox.com>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 25, 2024, Chen Yu wrote:
> Hi Sean,
> 
> On 2024-03-12 at 12:39:11 -0700, Sean Christopherson wrote:
> > Use preempt_model_preemptible() to detect a preemptible kernel when
> > deciding whether or not to reschedule in order to drop a contended
> > spinlock or rwlock.  Because PREEMPT_DYNAMIC selects PREEMPTION, kernels
> 
> It took me a while to wonder why PREEMPT_DYNAMIC selects PREEMPTION
> in Kconfig, then I assume that you mean the static config is CONFIG_PREEMPTION,
> but the live preemption model is "none" or "voluntary", which makes the
> static check of CONFIG_PREEMPTION in spin_needbreak() and rwlock_needbreak()
> invalid?

Yep, exactly.

> > diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> > index 3fcd20de6ca8..63dd8cf3c3c2 100644
> > --- a/include/linux/spinlock.h
> > +++ b/include/linux/spinlock.h
> > @@ -462,11 +462,10 @@ static __always_inline int spin_is_contended(spinlock_t *lock)
> >   */
> >  static inline int spin_needbreak(spinlock_t *lock)
> >  {
> > -#ifdef CONFIG_PREEMPTION
> > +	if (!preempt_model_preemptible())
> 
> The old version checks against static CONFIG_PREEMPTION, now we check
> the live CONFIG_PREEMPTION and static CONFIG_PREEMPT_RT, just wonder
> if the rt check is needed here?

It's required, as CONFIG_PREEMPT_RT=y doesn't imply CONFIG_PREEMPT, and
CONFIG_PREEMPT_RT=y is mutually exclusive with CONFIG_PREEMPT_DYNAMIC.  I.e. a
CONFIG_PREEMPT_RT=y kernel will look yield:

  CONFIG_PREEMPT_RT=y
  CONFIG_PREEMPT_DYNAMIC=n
  CONFIG_PREEMPT=n

which in turn generates:

  static inline bool preempt_model_full(void)
  {
	return IS_ENABLED(CONFIG_PREEMPT);
  }

and so just checking preempt_model_full() would incorrectly return false for
CONFIG_PREEMPT_RT=y.

