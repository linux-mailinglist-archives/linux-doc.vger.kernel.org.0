Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97924848BF
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jan 2022 20:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiADTq0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jan 2022 14:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiADTqZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 14:46:25 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F5EC061785
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 11:46:25 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id h1so24541350pls.11
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 11:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uThA5FJw+dwxP5q++/tTAbh+tNweLJGvh47FjBpqGRo=;
        b=gYssr4nYDq/Y3+lyFNjL8a/kAr0+h1DoizKirqYRNxRwBPdTiOpC2fClt8PLj5PioV
         ITC+PZlcZu6Ru2sQvwsBpdFdWpcl6hPw+yTs8CjlNZXG0tUzLuYS5hSTH00jMJAzU8UY
         uJxWx5mPFh5+FpSj81jveeSvyh7ch4ZpVfE6Z/b9Rf8rCXbCn3UUpOljEANTHqMK7egI
         geD2OOfkwaa+LXrqvK9mOB2dzYBX1eLpUEE/UnZRBzumC2CkSTPYLUFiskAaXd/6x0rW
         daUjg6u1wZxKIlPUfo7/DfQgsPeQgIolcStC6AOFc9ZEhI2BE8XdUIUpT0IDPiFSagcT
         C1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uThA5FJw+dwxP5q++/tTAbh+tNweLJGvh47FjBpqGRo=;
        b=EAWfC1aFg0XKaCpe+ZOvBrlsb5M8AqS02/dcomObv1ESjFYdnZLBX/8Wq3NdInCGNt
         obumFXxOILzwPV91Cz5Ty420HDiorfqAL1D5VD8QOsFCgTsmIyAF3EqPK6duKQEMufiP
         YRXd2cux834Y9tSjr+XIQPFoSwmOiR9rs4Ls1DaZH/b2afp9jFtfvgIIrKxOoDsTTYPk
         wxqgWo+VdEbNLdO+/G1RWn9XUWwODgqZwe5498TbXFWKeleyFj1b6q8OuVK/jdBYeKHT
         TemJIr0qwNijlqENiJPbyoH3aFsWB8XmwrUcsvQYK4xWgbW9YIZ3EYYfd8jAS6QygIKk
         RCQA==
X-Gm-Message-State: AOAM532URV62XYPs5q/rYLS7AdB3zfohexJPJRZ98JUVdANf2UzLYHiC
        vYvg8Owz3NR0RE67G16lz8FCgw==
X-Google-Smtp-Source: ABdhPJxOhvfqjVRSu3Uh0kWA/rFpq2kE/HV9U/iDlkJYMs9kVQd/lZ4z4ZSruVEzSWvKrzoEVCeAfg==
X-Received: by 2002:a17:90b:2247:: with SMTP id hk7mr61350318pjb.126.1641325584736;
        Tue, 04 Jan 2022 11:46:24 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id g11sm35641497pgn.26.2022.01.04.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:46:24 -0800 (PST)
Date:   Tue, 4 Jan 2022 19:46:20 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Yang Zhong <yang.zhong@intel.com>
Cc:     x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com
Subject: Re: [PATCH v4 18/21] kvm: x86: Add support for getting/setting
 expanded xstate buffer
Message-ID: <YdSkDAruycpXhNUT@google.com>
References: <20211229131328.12283-1-yang.zhong@intel.com>
 <20211229131328.12283-19-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229131328.12283-19-yang.zhong@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 29, 2021, Yang Zhong wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index bdf89c28d2ce..76e1941db223 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4296,6 +4296,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		else
>  			r = 0;
>  		break;
> +	case KVM_CAP_XSAVE2:
> +		r = kvm->vcpus[0]->arch.guest_fpu.uabi_size;

a) This does not compile against kvm/queue.

   arch/x86/kvm/x86.c: In function ‘kvm_vm_ioctl_check_extension’:
   arch/x86/kvm/x86.c:4317:24: error: ‘struct kvm’ has no member named ‘vcpus’
    4317 |                 r = kvm->vcpus[0]->arch.guest_fpu.uabi_size;

b) vcpu0 is not guaranteed to be non-NULL at this point.

> +		if (r < sizeof(struct kvm_xsave))
> +			r = sizeof(struct kvm_xsave);
> +		break;
>  	default:
>  		break;
>  	}
