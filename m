Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338024815E2
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 18:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhL2Rh0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 12:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhL2Rh0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 12:37:26 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDEBC061574
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 09:37:25 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id iy13so19057743pjb.5
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Efgx9IHONWruEAQzkI5SLmFWvrJKvgcTDP12usM5mkE=;
        b=BZgeTpCI1Y3WML+gZXm9/II9O0JpFAF4B+9T6H+TLzK8QmSf/zzpKsHJ+FFns74ye1
         cgKlOtHQk3hHVsrvoiMfLV5zh00UVUM4CEfPuuduOHgGXS1bZ2hn1H8MrGIDhXQT7CbU
         6WFRCWcKSRNuNu3H+uacCCCFf2K7uHSKLC+s5+fTlMD8FyntdkyTvDuzxUJi1mNyCjaI
         WrFulMxvICLLC0jwIlsN/gFsCowLU2fMifWII4pHdcpV43tDHGK7U2yjKeKdocuOHmg5
         +6enQ2REonsBYJa3/N8XlAh2FkWDRcvZ5q2ZuvjtmJp1NA9cOaNGDYhSOFcTKUhs7QJI
         JbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Efgx9IHONWruEAQzkI5SLmFWvrJKvgcTDP12usM5mkE=;
        b=kCnp1VaXICU71ix4YGyWdyg1LqYSQ8ID9ClAI2TnEKYS3u62ZBJ84oWjKOhLxomYvo
         fSOmM3c5N7CcifNO902wTQheWSB6Dqew8p6a0h62JP+JpOzTZeeSAZ+h6EnaSi6kCq/w
         GZBe9n4BQMZNG5N0SDWa5hY13jvRu/eWqAau8zLoN1UilKMUZYsgqBCFs7LtnlMxMANq
         RGCXMV9Tcy2gCrue9xLAsHU+0W1baIBEHzKntwhDMB+xCM6CMxwBYf5exSD6VyaHyL8t
         ZcI45cM8vHvkoJGYKtYqnaH4Yl2bAaZcK3EBNBWkhlnlBIwXOEGdLYGqh3OgufY6TWvA
         c7xQ==
X-Gm-Message-State: AOAM530ecAx9Y9a44KkU4m9PE5tOeE2ZIEFzyaKVUrYHPleWDbpvVsha
        V+HJsCrMHRX3o6aVB0BWVdvTJw==
X-Google-Smtp-Source: ABdhPJzUwBcrBhft0hORYg6zqllwTZT3KaWotq1KPowSS1Lk8h3pPk5HtceknNKHwu7Rq/hQW12b8w==
X-Received: by 2002:a17:902:bd91:b0:149:999c:35ad with SMTP id q17-20020a170902bd9100b00149999c35admr5503851pls.25.1640799445235;
        Wed, 29 Dec 2021 09:37:25 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id u8sm25930236pfg.157.2021.12.29.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:37:24 -0800 (PST)
Date:   Wed, 29 Dec 2021 17:37:21 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Tian, Kevin" <kevin.tian@intel.com>
Cc:     "Liu, Jing2" <jing2.liu@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "shuah@kernel.org" <shuah@kernel.org>,
        "Nakajima, Jun" <jun.nakajima@intel.com>,
        "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
        "Zeng, Guang" <guang.zeng@intel.com>,
        "Wang, Wei W" <wei.w.wang@intel.com>,
        "Zhong, Yang" <yang.zhong@intel.com>
Subject: Re: [PATCH v3 13/22] kvm: x86: Intercept #NM for saving IA32_XFD_ERR
Message-ID: <Ycyc0YE8H8aL//iu@google.com>
References: <20211222124052.644626-1-jing2.liu@intel.com>
 <20211222124052.644626-14-jing2.liu@intel.com>
 <YcunSb52LlGKT7dC@google.com>
 <BN9PR11MB52760E4417F27BF9CA4F97B08C449@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52760E4417F27BF9CA4F97B08C449@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 29, 2021, Tian, Kevin wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > Sent: Wednesday, December 29, 2021 8:10 AM
> > 
> > On Wed, Dec 22, 2021, Jing Liu wrote:
> > > Guest IA32_XFD_ERR is generally modified in two places:
> > >
> > >   - Set by CPU when #NM is triggered;
> > >   - Cleared by guest in its #NM handler;
> > >
> > > Intercept #NM for the first case, if guest writes XFD as nonzero for
> > > the first time which indicates guest is possible to use XFD generating
> > > the exception. #NM is rare if the guest doesn't use dynamic features.
> > > Otherwise, there is at most one exception per guest task given a
> > > dynamic feature.
> > >
> > > Save the current XFD_ERR value to the guest_fpu container in the #NM
> > > VM-exit handler. This must be done with interrupt/preemption disabled,
> > 
> > Assuming my below understanding is correct, drop the "preemption" bit, it's
> > misleading.
> 
> code-wise yes. In concept we just want to highlight that this operation 
> must be completed when both interrupt and preemption are disabled.

No no no no no.  Yes, disabling IRQs also disables preemption, but that's not at
all relevant, e.g. KVM could handle preemption via kvm_sched_{in,out}().  Handling
this with IRQs disable is 100% mandatory because MSR_IA32_XFD_ERR can be indirectly
consumed in (soft) IRQ context, end of story.

> But we can also drop preemption if you prefer to, since preemption is
> certainly disabled  when interrupt is disabled.
