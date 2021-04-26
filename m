Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F5636AC4D
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 08:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhDZGlh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 02:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZGlh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 02:41:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA29C061756
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 23:40:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j4so47130661lfp.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ktn38akqcez+eAURfAHbs9UvpZXsngbkLRWEvsvsevA=;
        b=KayMu5PeYdfLUFqo5vYlIHf7ODXPP1ERnWjU7xBunZ72pM+jqoLZws9kWtWmrhtbA/
         kq2IwojOFOIP/jftEtQovgK8VmSYrdCwnT6PiC0rkd9gdPpSOoKFQL4odQFrGIDRE/Kv
         N1Ufvcv03yXJceeiEMlnEp9g1SZz0wwbSZRcCqBOr0XMjEyFt8hdaq3DgW864/gEXU89
         K3fwNujXtuvBafD4UcVTEmT4/v3e0u302kXjjGcPynulZuxdP+fZNfQ8P4XOF+Up1hzg
         PU5z+ouD8n0YLRjhLlsVdTm6rtdLCzgaCb2A5/76K0IdAVsNeCsbPIQd08QRltHdBrt6
         wo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ktn38akqcez+eAURfAHbs9UvpZXsngbkLRWEvsvsevA=;
        b=ZDGKNNgy/fB1C2bl6WuMSxDlxKrJaxzMID6uP02TdlAKc8a+A5h0kjwKlTfE65wqFv
         MdU9Nt3ONtf68SVK0CoH9B7cZ22Dh9o0m0K42gh+ra1sfkbpOMEW82kGymOpSSBUHETl
         iGWXBpgGjBKuEVITPuvEEm2FeC0Qt1KB7w9NHIKxTpgojFjWBzTALaodp9Zf19z0/fQN
         y1ng3+k4NosD+fbjQDJJj3YI6D5b5fpGnh+76CVYHFohqd7BcpX2Kett3DtydI+6QzP9
         ymCx+Sfs1hy9BjoFSNRLDOwB6X0MhiSP+qoH9zVRkJ+0bDTtoqT6okUJskIbs3FjmTE1
         jcxQ==
X-Gm-Message-State: AOAM5320Zrj0xTUHNCGoPtMH2ht/gT001pXNRb+Di4oVhSJEsVtlELXo
        awtdGm5snzDUMu9j2Rd8LLySRA==
X-Google-Smtp-Source: ABdhPJxvWqen6pUox4dzq1wWTN3fSLNXj6T7VwTOk1mrgshFVnekjsx59dRA+YVMHbBNVUlsgx7Prw==
X-Received: by 2002:ac2:5f53:: with SMTP id 19mr11971517lfz.17.1619419253303;
        Sun, 25 Apr 2021 23:40:53 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id f39sm1313321lfv.44.2021.04.25.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 23:40:52 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 4452D1026AB; Mon, 26 Apr 2021 09:40:56 +0300 (+03)
Date:   Mon, 26 Apr 2021 09:40:56 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v25 29/30] mm: Update arch_validate_flags() to include
 vma anonymous
Message-ID: <20210426064056.bqbeekpsogd32yvm@box.shutemov.name>
References: <20210415221419.31835-1-yu-cheng.yu@intel.com>
 <20210415221419.31835-30-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415221419.31835-30-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 03:14:18PM -0700, Yu-cheng Yu wrote:
> When newer VM flags are being created, such as VM_MTE, it becomes necessary
> for mmap/mprotect to verify if certain flags are being applied to an
> anonymous VMA.
> 
> To solve this, one approach is adding a VM flag to track that MAP_ANONYMOUS
> is specified [1], and then using the flag in arch_validate_flags().
> 
> Another approach is passing vma_is_anonymous() to arch_validate_flags().
> To prepare the introduction of PROT_SHSTK, which creates a shadow stack
> mapping and can only be applied to an anonymous VMA, update arch_validate_
> flags() to include anonymous VMA information.

I would rather pass down whole vma. Who knows what else
arch_validate_flags() would need to know about the VMA tomorrow:

	arch_validate_flags(vma, newflags);

should do the trick.

-- 
 Kirill A. Shutemov
