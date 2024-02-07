Return-Path: <linux-doc+bounces-8540-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915684C361
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 05:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E933A1F247AD
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 04:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEAE1094E;
	Wed,  7 Feb 2024 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SF8Qnkhd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C871714AB7
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707279014; cv=none; b=iAdZ6iTMdCeXMayE7xxRl3Wh+O3QdFKHgA/hGd99vAdkbWKTAvoOkVrlS2mR/nxst4kZI5sgxtcyTgtqTcARxz3T+1OkULCl5qSDcNRA6K0M1Hsa7WgSIuNnb1QtB3v/YWyb7tAMCHWq/jHQTIl8TzKBqlexXrhIweKLOy+YIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707279014; c=relaxed/simple;
	bh=GoYtXApYyZBo4VKeqb1AsTKENYpsyaUCglDP8GuS7kQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e6vIm/6mDuUpqbrGs4L4aq3uVfHQ8rWv/KzD2LraonBDPp0NdUGJVfs6AQhTbLkFwKIB6Vqi1fobWAMfPO3NbkS4ZOWFMgoPPDmQViObchGuzIxcWtNdEqs+i8uDZ4+oGykoqum76z3asS1sxNZe1VafT9n+foz8HUYPB1e6haw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SF8Qnkhd; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2962056d9e7so188761a91.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 20:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707279012; x=1707883812; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykLN7fs6qQRnuF8WSISkwVcQAWTyJrlW1o+moHfC85k=;
        b=SF8QnkhdmzPTdOrFesWrthVZBtR5tJkCM6a1G1aS4RwUlGEQ4b20Pyai4LwpRFZEDO
         gbEOvuVlz/MRpZJJnFJ8Y14uy8DBy1xXBNcixgUNsPHwR0c8U9QgwuzYRARv3SdKJkEJ
         G4ogiri+ow+sdLNpjI+GZf0jqlAMbKT4Xdd+P3FDWi4ftO6FTEagEdvcP1TVkBHDKoyj
         eTRBV2/y/ysc1M+lxWYKioQ3UiKFv8T8LYhfqG/EECEi77PtBhPBago1/6LkW65MaCEB
         YpHz8/1KXdv5sAI1vG91MYiVxcqC1cvEvNFtGSYRI90M8h+cSwh28uhh3ZCDvKQMfyLL
         Ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707279012; x=1707883812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykLN7fs6qQRnuF8WSISkwVcQAWTyJrlW1o+moHfC85k=;
        b=l4cgeTZkeGiM/SgFgX66ZureXGKj8sm26bzyO2Pkw8AZjWJ+BxbYuI7DFx61ggZbrM
         ElXN28Lgyb6xDBnkDaURSUT3PnWSBytEo2h0pBXSOwVmg/76LMc4FXuSNGKdk7hy0IWn
         GZesdy7TVlb7MLjBlENEYjm3p43aPBAiU32obPWoQhh34ROKbubtP1QLst/GBSipONSA
         CuT6n1I1eXFNx4hq04Uu/l9URHiGBvxsWfVfYo6XFvkVwGvqadM5q2eZ/N8QfTv3advW
         u32kPJ9o2LvCyPHEnGzNK2lvl3h/cSIux/jiJk3+t/LbMgMzSoVMyQFxoau2PMZN3boX
         7Vlw==
X-Gm-Message-State: AOJu0YyoerHuKP5JSDavqpUpO0sUthAr/LMs5e8jlpU5H9k85HyILdov
	JvFSsB4lpC5ywets6/COlh21BMFDtzCIjxr+XjtJbzuQ48pr3kpytC0swTDIXm9Hj6SAGGuNizT
	k4g==
X-Google-Smtp-Source: AGHT+IH+x2hZr5hgrqRm9mwlhGTe1zHc/Sl0rpDh0FcM4XBSnVg/GkvyIkz7aXggcw04KlEwBYkQvLZXGzU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:50c8:b0:296:58cc:601f with SMTP id
 sb8-20020a17090b50c800b0029658cc601fmr51199pjb.9.1707279012122; Tue, 06 Feb
 2024 20:10:12 -0800 (PST)
Date: Tue, 6 Feb 2024 20:10:10 -0800
In-Reply-To: <20240115125707.1183-12-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-12-paul@xen.org>
Message-ID: <ZcMCogbbVKuTIXWJ@google.com>
Subject: Re: [PATCH v12 11/20] KVM: xen: allow shared_info to be mapped by
 fixed HVA
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 15, 2024, Paul Durrant wrote:
> @@ -638,20 +637,32 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
>  		}
>  		break;
>  
> -	case KVM_XEN_ATTR_TYPE_SHARED_INFO: {
> +	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
> +	case KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA: {
>  		int idx;
>  
>  		mutex_lock(&kvm->arch.xen.xen_lock);
>  
>  		idx = srcu_read_lock(&kvm->srcu);
>  
> -		if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
> -			kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
> -			r = 0;
> +		if (data->type == KVM_XEN_ATTR_TYPE_SHARED_INFO) {
> +			if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
> +				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
> +				r = 0;
> +			} else {
> +				r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
> +						     gfn_to_gpa(data->u.shared_info.gfn),
> +						     PAGE_SIZE);
> +			}
>  		} else {
> -			r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
> -					     gfn_to_gpa(data->u.shared_info.gfn),
> -					     PAGE_SIZE);
> +			if (data->u.shared_info.hva == 0) {

I know I said I don't care about the KVM Xen ABI, but I still think using '0' as
"invalid" is ridiculous.

More importantly, this code needs to check that HVA is a userspace pointer.
Because __kvm_set_memory_region() performs the address checks, KVM assumes any
hva that it gets out of a memslot, i.e. from a gfn, is a safe userspace address.

kvm_is_error_hva() will catch most addresses, but I'm pretty sure there's still
a small window where userspace could use this to write kernel memory.

> +				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
> +				r = 0;
> +			} else {
> +				r = kvm_gpc_activate_hva(&kvm->arch.xen.shinfo_cache,
> +							 data->u.shared_info.hva,
> +							 PAGE_SIZE);
> +			}

