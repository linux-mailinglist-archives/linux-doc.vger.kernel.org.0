Return-Path: <linux-doc+bounces-18517-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 928159078E9
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 18:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B20C71C243EE
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 16:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CB61494B5;
	Thu, 13 Jun 2024 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0/fb2Y2b"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61926146A7B
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297865; cv=none; b=FPtakI6c+KPPWMXoNzPcQFp8lAHjusRxDE8kIgsEl/POqx3V5KCQXxHNeeMV6V4nkKbkaTUZ4UUzPP94I8vK3pL6ANm/V86r+bEvZMP7ueWBN4TwX/HJF5ktdBOxHSiyl1MotGx4ZTGOT/Wc9kUJrH2aIpXFoOLmiDvWZHg6Cds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297865; c=relaxed/simple;
	bh=vL3n1P+q2IBBOi6oygriT7cY6UeZAqtzHG3QyT41Bkk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C1NXM6Ts3tXlyNPAtPcgHr4LlDLwM0XM7M7O6FnAFnBaxYjvhIOoW4p1i+wvGr43HJkRly6Bj1R11dfDjEG9tz8lxPJnXawvAXaubWZgjjeWziaD20gvrv7N5oDz9K9Kito9FsyD4kR5Luvl5FlnDlw5JLsElTomj1fznAyvHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0/fb2Y2b; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62fb36d7f5fso23532347b3.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718297863; x=1718902663; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4d54lSkwQxb+qpzxsG/q3gJ1Ug5mGtZ+nd2FA07+/50=;
        b=0/fb2Y2bOgaCrpafZwTD9ZWi+uqEz6qzoiuoaRcMDmxKVwE7jOQIDH1lWZVxE7ZJPm
         Gm9K2IyGlOtkq5tbQoiZFviBLeKDX7tfLK+iWHF66m489WHVLObKNoSsFugQgVn+WpVf
         KG55Z9TKkQ7qfoDzjLZWAAIn8UnOpo32J234a3jV9fCh3DWBes5VwPnie0DDhdAyhouU
         0fNAp2ECFb6Ws4g6MfGoGT9oSqL78qLuD/0EeprzD2l9XizwZZCUHe4xUglLSW6PYSoe
         d89ns3zEQZssnwOXTViWaZc1HJ2fE8XrbE2zZEjf15HjLRw2lurXChV/a21feJaHE7Lr
         f3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297863; x=1718902663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d54lSkwQxb+qpzxsG/q3gJ1Ug5mGtZ+nd2FA07+/50=;
        b=HXNec8Orxxlz+xXJ/VVcHVF/v9tbv07dUmsweCdl/0NTPjd6RkZzKWXLhR6oZd9682
         iYp8KPQqdm9unWaXcGLCkcwv7nvEFomXehOcIXdYphOKpyBQLst+avNkNWPtT9OKw7Z5
         J1x++dqRTlZ1NG80lxNyXMdhxO/kgeL/Ap8bHnZffGoc2HMQfS7G+FFf704KcLnC69up
         Hy9eGCdan2LfVPpkpfNCtG58d2qv0nXBhNByqlCHzIF8QjLvwH/TL4l0IxYUHv+GQJ0h
         1LUPGIKiKIaF/9/ZDw/QbkFG1j0BeU2bwYIW9/kb0IZwFHIenXtvQgrAqseF8n0JCwbA
         eK3w==
X-Forwarded-Encrypted: i=1; AJvYcCVwWrBTIiAVL7QIVsx1qY428NHiCN3KV4v4jpFAqnbdVQrEjcjDftH0lzdk1tpNPvuLJnYBbLKHVTyAmJRtInfFMv9qt7keepvQ
X-Gm-Message-State: AOJu0YzQNMUO+avB0uQ03vM/HVrnwhpQJkLtsD54YzJwqQ9fP3Nqr4/5
	egHaJ5C32C29D7xJdy/0N+f/stNw0ilk42TPzXXWyKAuoATnuD5q0MM9GKxUlR7RJMUgdxRkN4B
	TtQ==
X-Google-Smtp-Source: AGHT+IEYQjre4Uvteh6kfBtG71/rE+jFaH2gbIc1og+uNbgyV0WUL2F6w9jh8gI3FyDLev3v/l4STVjq0oQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6706:b0:622:cd98:3b89 with SMTP id
 00721157ae682-63224b005fcmr8987b3.9.1718297863344; Thu, 13 Jun 2024 09:57:43
 -0700 (PDT)
Date: Thu, 13 Jun 2024 09:57:41 -0700
In-Reply-To: <20240207172646.3981-13-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-13-xin3.li@intel.com>
Message-ID: <ZmslBVWkRHAjIXrE@google.com>
Subject: Re: [PATCH v2 12/25] KVM: VMX: Handle FRED event data
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, vkuznets@redhat.com, peterz@infradead.org, 
	ravi.v.shankar@intel.com, xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 07, 2024, Xin Li wrote:
> @@ -7382,6 +7419,24 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
>  
>  	vmx_disable_fb_clear(vmx);
>  
> +	/*
> +	 * %cr2 needs to be saved after a VM exit and restored before a VM
> +	 * entry in case a VM exit happens immediately after delivery of a
> +	 * guest #PF but before guest reads %cr2.
> +	 *
> +	 * A FRED guest should read its #PF faulting linear address from
> +	 * the event data field in its FRED stack frame instead of %cr2.
> +	 * But the FRED 5.0 spec still requires a FRED CPU to update %cr2
> +	 * in the normal way, thus %cr2 is still updated even for a FRED
> +	 * guest.
> +	 *
> +	 * Note, an NMI could interrupt KVM:
> +	 *   1) after VM exit but before CR2 is saved.
> +	 *   2) after CR2 is restored but before VM entry.
> +	 * And a #PF could happen durng NMI handlng, which overwrites %cr2.
> +	 * Thus exc_nmi() should save and restore %cr2 upon entering and
> +	 * before leaving to make sure %cr2 not corrupted.
> +	 */

This is 99.9% noise.  What software does or does not do with respect to CR2 is
completely irrelevant.  The *only* thing that matters is the architectural
behavior, and architecturally guest CR2 _must_ be up-to-date at all times because
CR2 accesses cannot be intercepted.  So, just say:

	/*
	 * Note, even though FRED delivers the faulting linear address via the
	 * event data field on the stack, CR2 is still updated.
	 */

>  	if (vcpu->arch.cr2 != native_read_cr2())
>  		native_write_cr2(vcpu->arch.cr2);
>  

