Return-Path: <linux-doc+bounces-3379-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44E7FBF36
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 17:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02C25B21521
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 16:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878534F8BF;
	Tue, 28 Nov 2023 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BEHt+235"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0681D1A5
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 08:31:21 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-daee86e2d70so7108168276.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 08:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701189080; x=1701793880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkifhWeFq2AKAH7BOOvlkDTRE/IRSV6lCofOJbiTrgk=;
        b=BEHt+2359ElZZ5O0q5swBpofB3e6PlqcIlk9Jhlt46Dl+Yy3jDhtYUk75bjhSEioVQ
         NbplDtP+BZciI/dlgikmxAZ8z91Sj4kap+/Ywalcuh495XRDah5bTqjYwk8a162uyXbP
         spMayaUrIAN6BA/t8MbzvJ9RKaQnMdVnt25GwubQPqrYosf6RC9fLLTOrD8nsumc3cAF
         i/qvqcvuf0R3q7sMOFR+pc6oCE3L5GOLrUhoXvXLDpnhPWMX/fOfmuz7IUd0FcxEw+NF
         BXvSNJDpjauz44b7gsRkDKhDCkoHLFW9KSAEsJAcuNoKXsLDH2Z6OOLJV2fWfd/swzsF
         +KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189080; x=1701793880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkifhWeFq2AKAH7BOOvlkDTRE/IRSV6lCofOJbiTrgk=;
        b=vnkD+hIbj/LgpZn2jy7t2eNpV/MW1t+vD/vSNHPbUeAbNghZ5vfW7kDypW7nkxGSco
         RR63SyUAJGyZZC17Lk7Z1Du2vdcFLViup/2obmfA6+DMXHzNInZL5cVhJJtdF1r4QUuH
         Ja1kVFKdD4fSdmILNe5h7w5BbmWadkLo02lZ23a9TV6rWpKGRQgV9Y6mrU/E04gGTJH9
         eHqJe1nrirdNeXVZeiWJBTt17ory+PjNpSGdK/r9Y+TonpX9ufEAXJ4zb9wVkUDvs4mA
         Vsx/ZdXXymeTNE0hRcShKN8KsrMGE0HVu2BWNyLnF4S3op5jKYH2Qk2W9ZvGYaRvnljb
         0w+Q==
X-Gm-Message-State: AOJu0Ywsu9BADKYbhHCZw2ShFDbLe6doiwm13VDso6YyYcn+XRdEFmWn
	MKXtZ9X0/nr+hrod0x4m17NklwFuOvE=
X-Google-Smtp-Source: AGHT+IE6iXeIU9xVOZUNgTDVtSSOhSFc12TNtoEA7Y1QnCurGnLjmDvGB9zjJ61WPs74wQDuAfvDjFcCHnc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d4c6:0:b0:dae:292e:68de with SMTP id
 m189-20020a25d4c6000000b00dae292e68demr498633ybf.6.1701189080247; Tue, 28 Nov
 2023 08:31:20 -0800 (PST)
Date: Tue, 28 Nov 2023 08:31:18 -0800
In-Reply-To: <69c10848d4a4f36ab71ca518f4b23d4dee377572.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108111806.92604-1-nsaenz@amazon.com> <20231108111806.92604-17-nsaenz@amazon.com>
 <69c10848d4a4f36ab71ca518f4b23d4dee377572.camel@redhat.com>
Message-ID: <ZWYVw93lixTmlCqD@google.com>
Subject: Re: [RFC 16/33] KVM: x86/mmu: Expose R/W/X flags during memory fault exits
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	anelkz@amazon.com, graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com, 
	corbert@lwn.net, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com, x86@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 28, 2023, Maxim Levitsky wrote:
> On Wed, 2023-11-08 at 11:17 +0000, Nicolas Saenz Julienne wrote:
> > Include the fault's read, write and execute status when exiting to
> > user-space.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c   | 4 ++--
> >  include/linux/kvm_host.h | 9 +++++++--
> >  include/uapi/linux/kvm.h | 6 ++++++
> >  3 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 4e02d506cc25..feca077c0210 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4300,8 +4300,8 @@ static inline u8 kvm_max_level_for_order(int order)
> >  static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> >  					      struct kvm_page_fault *fault)
> >  {
> > -	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > -				      PAGE_SIZE, fault->write, fault->exec,
> > +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT, PAGE_SIZE,
> > +				      fault->write, fault->exec, fault->user,
> >  				      fault->is_private);
> >  }
> >  
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 71e1e8cf8936..631fd532c97a 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2367,14 +2367,19 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> >  static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> >  						 gpa_t gpa, gpa_t size,
> >  						 bool is_write, bool is_exec,
> > -						 bool is_private)
> > +						 bool is_read, bool is_private)
> 
> It almost feels like there is a need for a struct to hold all of those parameters.

The most obvious solution would be to make "struct kvm_page_fault" common, e.g.
ARM's user_mem_abort() fills RWX booleans just like x86 fills kvm_page_fault.
But I think it's best to wait to do something like that until after Anish's series
lands[*].  That way the conversion can be more of a pure refactoring.

[*] https://lore.kernel.org/all/20231109210325.3806151-1-amoorthy@google.com


