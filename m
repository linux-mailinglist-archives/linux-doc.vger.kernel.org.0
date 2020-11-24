Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE1F2C3499
	for <lists+linux-doc@lfdr.de>; Wed, 25 Nov 2020 00:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387547AbgKXXSU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 18:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731465AbgKXXST (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 18:18:19 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8424C061A4F
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 15:18:19 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w187so536798pfd.5
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 15:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nI2CFR08TVYrjA8L8FQ1rV8lfflai02Hbg1xnZq/aLQ=;
        b=TGRVwUyghmV6Y++qNyCuEHFIj5NexKfSDa8Ug82+bRV8Joh6DX6CqSVUA03kE0YCN+
         gvN84VG47WYkm1TCbdSwWX/5h/yvPdMsu+3yoMZr73gr3ZKSL08rfkcDz7EsrjbNZpyR
         vf57CM0AT0VBe/iic5U5QHi54nMEOKwuV/fACKDHwJvyLn4ojz+y/1M5BbK8swJU5pWh
         6DDaApE5mDNGuOrRjmQu5ifVPVUVKs7nJZrdbnYE6HOqarY+Rmd2joTtKV9Nz1SKk/Tn
         smL/NTLkBKtLAIdPQHFAudhhPAWJMQaklsNfKoCEud1Oz93ynweZXZhJxmYT61o5KkBT
         GskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nI2CFR08TVYrjA8L8FQ1rV8lfflai02Hbg1xnZq/aLQ=;
        b=WfRIrAS6N2S1rUdkwJmAJMFZLufbCN3qUzWpM5fhG8XOmWmsbH6ZqfVzwQnrn8x/L1
         U4ufcJyY9zXI4+XLdYuuvrsx6g7ppk8LeCK+HOLwOXPYR58MFw3TVCPEyCd3UZCV8jpA
         UCbILKLjwZHR/cyCGbQ1gtWeQGxAAG9lzl4VCUjT4e9EWlaZr/YOEWxbU3GWxa3SFCMP
         H0J9A4kvT0Rk4KRwpWrImV9Er4VI3JaZ6QRg9YUsIvmEuKoWUg2mpMbwK0f30CP6nMEi
         qY5Rfq4JDXYm9P7y7MBrxL2w8v1p6BOrUgzx/85L3K6CyoU414pOr6qCO0w2lLNEyWUU
         j87w==
X-Gm-Message-State: AOAM533n0rtDVFVDJ8y2F0+NeDeaMbI878ZQwRTG0PeKMba1pZGHUL8C
        cW8IYdRUkqS5e1xJ+TEAqUiLKg==
X-Google-Smtp-Source: ABdhPJwFPSMRB1bIwy9Xt2xkS1AFtFJNdNLegjqm6HtONrcPdiWAtjfSthKMSsElfRvzKOW5vQIrwQ==
X-Received: by 2002:a63:de53:: with SMTP id y19mr606624pgi.107.1606259898933;
        Tue, 24 Nov 2020 15:18:18 -0800 (PST)
Received: from google.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id mn21sm273126pjb.28.2020.11.24.15.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 15:18:18 -0800 (PST)
Date:   Tue, 24 Nov 2020 23:18:14 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Vipin Sharma <vipinsh@google.com>
Cc:     David Rientjes <rientjes@google.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas <thomas.lendacky@amd.com>, pbonzini@redhat.com,
        tj@kernel.org, lizefan@huawei.com, joro@8bytes.org, corbet@lwn.net,
        Brijesh <brijesh.singh@amd.com>, Jon <jon.grimm@amd.com>,
        Eric <eric.vantassell@amd.com>, gingell@google.com,
        kvm@vger.kernel.org, x86@kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC Patch 0/2] KVM: SVM: Cgroup support for SVM SEV ASIDs
Message-ID: <20201124231814.GA258638@google.com>
References: <alpine.DEB.2.23.453.2011131615510.333518@chino.kir.corp.google.com>
 <20201124191629.GB235281@google.com>
 <20201124194904.GA45519@google.com>
 <alpine.DEB.2.23.453.2011241215400.3594395@chino.kir.corp.google.com>
 <20201124210817.GA65542@google.com>
 <20201124212725.GB246319@google.com>
 <20201124222149.GB65542@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124222149.GB65542@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020, Vipin Sharma wrote:
> On Tue, Nov 24, 2020 at 09:27:25PM +0000, Sean Christopherson wrote:
> > Is a root level stat file needed?  Can't the infrastructure do .max - .current
> > on the root cgroup to calculate the number of available ids in the system?
> 
> For an efficient scheduling of workloads in the cloud infrastructure, a
> scheduler needs to know the total capacity supported and the current
> usage of the host to get the overall picture. There are some issues with
> .max -.current approach:
> 
> 1. Cgroup v2 convention is to not put resource control files in the
>    root. This will mean we need to sum (.max -.current) in all of the
>    immediate children of the root.

Ah, that's annoying.  Now that you mention it, I do vaguely recall this behavior.
 
> 2. .max can have any limit unless we add a check to not allow a user to
>    set any value more than the supported one. 

Duh, didn't think that one through.

Thanks!
