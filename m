Return-Path: <linux-doc+bounces-20612-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977729300F7
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 21:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8AAF1C21589
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 19:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB112CCD0;
	Fri, 12 Jul 2024 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t485Ih32"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8C20DC5
	for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720812613; cv=none; b=rB6Lq/VzTJSJBcKTL52R5hJqU1N8Joggu4MD4AOZiDOpmoErRX9MuueoEHcvZuEXiSGa/kECLdhUXbwevGjuEBiQIdXtspYebZabrZMt6i1hqe8yijUB+2PG2JcpGMEwta6IsoHyJ6xq/RX/YgGLH4y/lCL6ioN8bRimVRSWzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720812613; c=relaxed/simple;
	bh=J1S9Co/gsUdc+1Ynd0QU/qO2abhM1ZoN3G8Rcdw3+Yc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JTVWrY4DTeFWjjzJSxBaeN8f5zRnpjNfZSONf1grTvOppUqx4u5sTa9C+2LiUg/D0dHFJBjtg6Q9sPK/XsN7ZkDvgdoZg0aA6PjjJp9jLUFyBxOIt6lFCrhVFKlO/FwejSns9M2+5nf9w8eYIq4pt5wshNfRpLo2RqQ0LbIMzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t485Ih32; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-654d96c2bb5so39665737b3.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720812611; x=1721417411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSam3OFYUTe13VOqHa17qoJuTdcVQF9rMQXxc9I3He4=;
        b=t485Ih32RA0LWmsHUxeRNy7ExFkrZDYEeaewkl/7DCdFuG6occGvzO4BVrWYtjsZE/
         prV+To05bCR7pkosC+zYi5EVpB/SY/B4rU+ykZrokfihdgpveNdspklpO9ScWlGUkAbf
         oRs8k3cTBd8wUOBUAL8r9ejxnxwVQd9cdCqfI4LTLdkVRjSAejW2jszlduc2x2ipmSlv
         ItnNI7lgu/D+ihPSEdwzY0U6LDSLUhQIpIujgm2Xwt15WQWUMCXXlgnFo1T1hbpMhvRS
         TpDtnJ7Z7MAxZIYKGzPYyTEAlQXcxD5PT+K9iKluvN6pzoh0uPj93ncfR4seGkDdcmB6
         jwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720812611; x=1721417411;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSam3OFYUTe13VOqHa17qoJuTdcVQF9rMQXxc9I3He4=;
        b=frxVqtN0SF8Pmj12On1immc8TV9c/Png+zJUadTMXp4mcuxS6T+TM/L7RkOWE2Pa91
         /UJ0K9Ke8n0w/ofNi4389WlF62KbzOKaMSzUs9mn0PnBFgnkAGDzwvAbhx6ZfAH8cO/i
         bKOmAgmG98llof4ym7kpEAHwWwlqwGrU+fXW8PtUhe5I4nyw3d9soVomOwK7Dobanloq
         1GEtPwRMoFM0yYjOWM91ZCxiBBukbGvOEBkrWgMP6Jwm8/GALaDNk/JjSd0lhs20qlO4
         qFWTzPplD+Z4wXGvHVWFOn+7qC3hh0hdvjjMMnTPnMYUgSmT1qku1Nt+csP/CBGBu2fS
         JJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXqKpd1KAbZ+3zAgP0McGZp7E10euyjrnCbZFdZsckRMSo0YVGLcJgoJLizQ9N4s04RevrZrxN1XDeESdrFmf0owiL8zIcNXA3k
X-Gm-Message-State: AOJu0YyybQ70CsbAVb/z7/QCF2EBRycxhwK+c9Y9UUVjmBss6sJAEA0V
	Uf0vKKPn38G+CoKcsXhaMAeXnkeUpIfLeKHYtApS7YLmarXabRG/gRQXgYCG4+3M4Q8YpkYzS/8
	NoQ==
X-Google-Smtp-Source: AGHT+IHDX6aq/IiCOt698IqpZ4MrQ2IJcf1EwlXXpiuV+/DiG8Es8j3Np/1XnI0oCcG1Eu1pGoFCApjvBVw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6381:b0:64b:7f7e:910f with SMTP id
 00721157ae682-658f07d5705mr557917b3.7.1720812610774; Fri, 12 Jul 2024
 12:30:10 -0700 (PDT)
Date: Fri, 12 Jul 2024 12:30:09 -0700
In-Reply-To: <SA1PR11MB67349D5D7B0E26A49B8A1112A8A62@SA1PR11MB6734.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-10-xin3.li@intel.com>
 <ZmoYvcbFBPJ5ARma@google.com> <SA1PR11MB67348BD07CCCF8D52FCAC8FEA8A42@SA1PR11MB6734.namprd11.prod.outlook.com>
 <ZpFH86n_YY5ModwK@google.com> <SA1PR11MB67341A4D3E4D11DAE8AF6D2EA8A62@SA1PR11MB6734.namprd11.prod.outlook.com>
 <ZpFZg-9MTveHfn_4@google.com> <SA1PR11MB67349D5D7B0E26A49B8A1112A8A62@SA1PR11MB6734.namprd11.prod.outlook.com>
Message-ID: <ZpGEQRJppKfp1tF8@google.com>
Subject: Re: [PATCH v2 09/25] KVM: VMX: Switch FRED RSP0 between host and guest
From: Sean Christopherson <seanjc@google.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	Ravi V Shankar <ravi.v.shankar@intel.com>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 12, 2024, Xin3 Li wrote:
> > > > E.g. if it's somewhere in task_struct, then kvm_on_user_return()
> > > > would restore the current task's desired RSP0.
> > >
> > > So you're suggesting to extend the framework to allow per task constants?
> > 
> > Yeah, or more likely, special case MSR_IA32_FRED_RSP0.  If KVM didn't already
> > have the user return framework, I wouldn't suggest this as I doubt avoiding
> > WRMSR when switching between vCPU tasks will be very meaningful, but it's
> > easy to handle FRED_RSP0, so why not.
> 
> Great, I will take the patch.
> 
> It looks to me that this also works for KERNEL GS BASE MSR, no?

I don't think so, because the kernel expects MSR_KERNEL_GS_BASE to be accurate
when querying GS.base for the current task:

  unsigned long x86_gsbase_read_task(struct task_struct *task)
  {
	unsigned long gsbase;

	if (task == current)
		gsbase = x86_gsbase_read_cpu_inactive();
	else if (boot_cpu_has(X86_FEATURE_FSGSBASE) ||
		 (task->thread.gsindex == 0))
		gsbase = task->thread.gsbase;
	else
		gsbase = x86_fsgsbase_read_task(task, task->thread.gsindex);

	return gsbase;
  }

