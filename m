Return-Path: <linux-doc+bounces-8712-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E284E563
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 17:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03BA41C219BC
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 16:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321E87EEFA;
	Thu,  8 Feb 2024 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQyfUJy4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DC7CF13
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707410941; cv=none; b=jfLzvRGm0BfJNW1lRePQ47F+QAx1NT4DxczgDWio1ZB087c1NJGmRLj2CcPDUJsnNfUR+xbtFo74oXF0IV0VjCJO89iHC5PlFFrngzZkr5hSnLqqjaVSRSTB0Xc/1l/7ngHYuIdbvJOZawdzhKX+rEQIRvI0l0Q94su05KHIENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707410941; c=relaxed/simple;
	bh=pIkQcZS9dPhEHcosG9RvWsKh81a3Ju3tnA2/A83HRUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vFAeZ9qciuOD0o2QVohVx1muRmSOjxZcrSbr8k+BTmqnphzwyBETIf9EhqH+actg03VCJOK0Bkz+z9TnqVgCDXaDokGi/KZXPy4noJnnhPk6nyYPJz1ve7YQpjRG24L6DF+KNiDdzPjXy84qcOsgq6tvCaEbvV8bKEuYnJpG5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQyfUJy4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-604ad18981eso1304947b3.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 08:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707410938; x=1708015738; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOwnn26TKMYPd0wmIeXSxvlCDp0GqmDj4OeL7dzZHIA=;
        b=QQyfUJy4VaY6qF1ffR89eKTTiCe+wRKJS1CVSaicweFzZ8gujNbUWsiIpk2pr8ZCM8
         mDpYZSGygkyOxefclvVCXi2ZUv1oQbD9Zww5abP1ZDYWDrAjFbovXNsrh33kSMekCdBa
         KgoqqgekplgDRfFWHc30TZckLAL2dXATCQclEL7s5PrsHSYc0Y/2UAXYrmGS3Kxcbh6J
         m0/CrqrXIAF6voQ3+hcjGsboPt0I84aAQ8HNdlfJsb4+pS6salKppRGpRPLW4Nabu5br
         YS32TAGLPbH88J+JmqlKYofCPv9ynOB6HrwmuQGfLTumBrYxTn+Qb/PRoourTrBtRZoo
         p8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707410938; x=1708015738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOwnn26TKMYPd0wmIeXSxvlCDp0GqmDj4OeL7dzZHIA=;
        b=EmhRCqdwjE5WYmVtM7tyhZPOtEh8HFs11go2Qb8K9hyh6BlYjAUm6/RDkOVM3bUDFd
         NwAP1mDE0eyEFzyh1U+/UgWB5ZP//PuXKrleXDYYC/gAc3qGE3CtXxcbk/nYVhBRI51I
         Gyme9Ens3qkAWhcL8268uPqBOoe+XvAE732Iy41XdrueciSVv3auQIe8SH1cw4YHo5TK
         rjyN3EeI3hGXhijKfEaXSrWr/Y6kcW0+e3nnAX527L+nQ3wrvOnksUAV1Iy4jID1/N8b
         UEAc4/sg9nZ8sVjySZxCPK+6RwQgHtNHyxM2MM0JWCQQY/37VKO8L7QopjcPmRZk3dac
         G9tg==
X-Forwarded-Encrypted: i=1; AJvYcCVM/jvtU4fuuxDgX3RSfvVNozG4qsHmGapXy8iHWEBZIPOu8M9alfvLddNCWJRq/Aty8vsK233ZDamRr2vOj9bKyYgc+6HopDjM
X-Gm-Message-State: AOJu0YzsUi7XXuOyOmk71H8UL7vk8gZyu2m7xB8pYUErPERLVwhsxe1d
	xgjrB78/S8aMe/juNi8+O+O5Nuz2ZMNGKA6uKdDJTC/Efr/gY4aSY3KaSP9QcGHFKBshj/F4ulU
	qvQ==
X-Google-Smtp-Source: AGHT+IFOo4ddahF0N7mDmX9X1X2sNM2ZcU+vQGm7JwWM0YenhPypIVF1WHscjjJm6Z5C2Oh/m3uaJv7ZgLM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1a48:b0:dc2:3441:897f with SMTP id
 cy8-20020a0569021a4800b00dc23441897fmr2126896ybb.6.1707410938415; Thu, 08 Feb
 2024 08:48:58 -0800 (PST)
Date: Thu, 8 Feb 2024 08:48:57 -0800
In-Reply-To: <92918ee8-3cc9-41c3-a284-5cd6648abc05@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-12-paul@xen.org>
 <ZcMCogbbVKuTIXWJ@google.com> <92918ee8-3cc9-41c3-a284-5cd6648abc05@xen.org>
Message-ID: <ZcUF-TNbykWvh3r7@google.com>
Subject: Re: [PATCH v12 11/20] KVM: xen: allow shared_info to be mapped by
 fixed HVA
From: Sean Christopherson <seanjc@google.com>
To: paul@xen.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 08, 2024, Paul Durrant wrote:
> On 07/02/2024 04:10, Sean Christopherson wrote:
> > On Mon, Jan 15, 2024, Paul Durrant wrote:
> > > @@ -638,20 +637,32 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
> > >   		}
> > >   		break;
> > > -	case KVM_XEN_ATTR_TYPE_SHARED_INFO: {
> > > +	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
> > > +	case KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA: {
> > >   		int idx;
> > >   		mutex_lock(&kvm->arch.xen.xen_lock);
> > >   		idx = srcu_read_lock(&kvm->srcu);
> > > -		if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
> > > -			kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
> > > -			r = 0;
> > > +		if (data->type == KVM_XEN_ATTR_TYPE_SHARED_INFO) {
> > > +			if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
> > > +				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
> > > +				r = 0;
> > > +			} else {
> > > +				r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
> > > +						     gfn_to_gpa(data->u.shared_info.gfn),
> > > +						     PAGE_SIZE);
> > > +			}
> > >   		} else {
> > > -			r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
> > > -					     gfn_to_gpa(data->u.shared_info.gfn),
> > > -					     PAGE_SIZE);
> > > +			if (data->u.shared_info.hva == 0) {
> > 
> > I know I said I don't care about the KVM Xen ABI, but I still think using '0' as
> > "invalid" is ridiculous.
> > 
> 
> With the benefit of some sleep, I'm wondering why 0 is a 'ridiculous'
> invalid value for a *virtual* address? Surely it's essentially a numerical
> cast of the canonically invalid NULL pointer?

It's legal to mmap() virtual address '0', albeit not by default:

  config DEFAULT_MMAP_MIN_ADDR
	int "Low address space to protect from user allocation"
	depends on MMU
	default 4096
	help
	  This is the portion of low virtual memory which should be protected
	  from userspace allocation.  Keeping a user from writing to low pages
	  can help reduce the impact of kernel NULL pointer bugs.

	  For most ppc64 and x86 users with lots of address space
	  a value of 65536 is reasonable and should cause no problems.
	  On arm and other archs it should not be higher than 32768.
	  Programs which use vm86 functionality or have some need to map
	  this low address space will need CAP_SYS_RAWIO or disable this
	  protection by setting the value to 0.

	  This value can be changed after boot using the
	  /proc/sys/vm/mmap_min_addr tunable.


Obviously it's equally ridiculous that userspace would ever mmap() '0' and pass
that as the shared_info, but given that this is x86-only, there are architecturally
illegal addresses that can be used, at least until Intel adds LA64 ;-)

