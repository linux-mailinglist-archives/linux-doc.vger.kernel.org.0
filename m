Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B57480DEF
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 00:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbhL1Xi5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Dec 2021 18:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbhL1Xi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 18:38:57 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BA9C061574
        for <linux-doc@vger.kernel.org>; Tue, 28 Dec 2021 15:38:57 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id l16so2518450plg.10
        for <linux-doc@vger.kernel.org>; Tue, 28 Dec 2021 15:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mLJEKnUeVA+ZJaDeVq7C58HVHq2F7qzWQ7vIWWcH/9I=;
        b=Eiy8qoIw/+H+Jfx8mcv3/R1UdB2Av9PpBgReHTaaSLr7QNRpRxLq2Xr0kD7QHsDQLc
         jMqa1zT3VYLLajjYXGcTlBJkLplBff49xgT6WYc+qinCxPYmRcHZqFl1331GvJWLiTPM
         UMB3HWJWlGt64de9dAl0DBNGEudpy6kP1IT9QM35aydC9vFp3PaU8s3D433UtOgV09Wf
         USNkA1zZQqpuG59EIU44pHjzNmo61hM+1bBpTMMLERNSDAI0UV/88SjncVcabfNKo1SW
         OIYUccn9ZusVP6iipAYQiS29AeygpxEa6zqUL+91px6gBunwGQBepHO7GRI2Y+8/xJUM
         wjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mLJEKnUeVA+ZJaDeVq7C58HVHq2F7qzWQ7vIWWcH/9I=;
        b=ARqVfzcIDC+2QP8x3EuzG7J5tBqk5WARKv5x1IZyyf1exlCH/qWnfohoyYrsqTwyfM
         +aOHp5FLSKy5nfyU+H6pV88IxMQJaLiMeIb37CvlzrbWnMawYQsYC+1XIn+guzEegSRc
         /8c59oWrF+12n/4p77G3nEXGxyWzlH1w47xK73D73ElwHSfnST7CtrrzJhbSh7mYuQVQ
         IXBVTsvmdX1FDUXStUjCT3+EBf5kAbI4ILJcNT05TzjmaSuGgIta5ERYYCTAkahsk26U
         S23vgAB154+GU4DjLRWPJkP+IUcGz7f7bquWcxmeDJ3Ql1icMUNVEQVOQOH2xOzY5BIx
         WPEA==
X-Gm-Message-State: AOAM530ELy151prN41uKREjQYNA3Ksxg5TQuqAS3HdmoZFPed2mKTgYz
        vfeamzyPE4wdR43BQsZhRl86lw==
X-Google-Smtp-Source: ABdhPJyznVD+crKQ6G6u0OsCozPGqZlakrH/5IfbsFoLhMCKNUnUBjBp31t4ativuEsftnsU7jqacA==
X-Received: by 2002:a17:902:c401:b0:149:353c:9705 with SMTP id k1-20020a170902c40100b00149353c9705mr23328628plk.23.1640734736553;
        Tue, 28 Dec 2021 15:38:56 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id f7sm19397673pfc.141.2021.12.28.15.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 15:38:56 -0800 (PST)
Date:   Tue, 28 Dec 2021 23:38:52 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Jing Liu <jing2.liu@intel.com>
Cc:     x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, guang.zeng@intel.com,
        wei.w.wang@intel.com, yang.zhong@intel.com
Subject: Re: [PATCH v3 05/22] kvm: x86: Check permitted dynamic xfeatures at
 KVM_SET_CPUID2
Message-ID: <YcugDN+9d8t4r9bV@google.com>
References: <20211222124052.644626-1-jing2.liu@intel.com>
 <20211222124052.644626-6-jing2.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222124052.644626-6-jing2.liu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 22, 2021, Jing Liu wrote:
> Guest xstate permissions should be set by userspace VMM before vcpu
> creation. Extend KVM_SET_CPUID2 to verify that every feature reported
> in CPUID[0xD] has proper permission set.

Why?  Nothing in the changelog, code, or comments explains why KVM _needs_ to prevent
userspace from advertising bogus features to the guest.  E.g. the virtual address
width check exists because _KVM_ will do the wrong thing given a width other than 48
or 57, and explicity says as much in a comment.
