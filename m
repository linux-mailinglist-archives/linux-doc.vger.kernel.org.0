Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13E9455FCB
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhKRPtl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Nov 2021 10:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhKRPtl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 10:49:41 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A4CC061748
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 07:46:41 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 206so651945pgb.4
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IiebZ9E+2Z6ck8HSKjoCru0FAUfEQyGySTx3U9aKbpk=;
        b=FcTcEFs9GFXfjErwxsQU7W81QHzBiNOL/ugpZcHsuBN7XzP4U4jxy/6Tg94D43nhsK
         JTyItoZsVZQ4pUynmDyUem/NCq/0QxjKZfDpX6G9+Zbbxp7akNcWSgWZFB5x0WNpKR1V
         pwCbyGydwdCBq46Up8OOt3TFP4gJ9CrmIgdv0cjnW4rxbbND+ZN3HV0SeGGLreJ3CRPG
         gDbSTqzFDPNomRWO33BjU6Jq///Edwif4i1H8PJYVIAfg8V1XC3C/iU+hOZFNW9Dn4Ga
         N7phfTK3TSw43xF/ajB+++73o2hKmzQ9mzyfXK/q10xrIYinh+qeEYsyhq5K21f44GP/
         sCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IiebZ9E+2Z6ck8HSKjoCru0FAUfEQyGySTx3U9aKbpk=;
        b=tLPtBw3JK33avSjff3NM2R42WtT9DFTYuGV6aYE2QhwVDnxwEuIHts9389d3SsYFUm
         EGgBshWwT6xFGEepMWgIRSPjkxF0+lhnbSZQti6iVtDoYeLFUmFyrP07zmnuLy1Ug6KF
         7fqU0R04Jhb6O33+cp7O9Gkq7UYu++nctkdEbugtYCZyheeqF933qmQmjExOEWFx5D3A
         /v1mNZQVYfw63/mHNid7c6CykP5o1qE491eO7iJDof9nrPrUXopy/CN9Wb/pSfRmwNd2
         91VjS01CxVriloBwMcjNqNsmkeo+TVml6lyHiLaHgL+1tLHi0HLYEYq3VmxmF2tYmn+U
         XR7g==
X-Gm-Message-State: AOAM533K0NUVmOrik/QKFCQA0KQtNcVsL9/IBlzq0ZINwL5twqAlvjLO
        PJ0/1dmd3f4sVcE4bLJ+O0IoLA==
X-Google-Smtp-Source: ABdhPJziifKQY6AXb0Jp94a9CB1axsqagIZrmrDB6EkRkfwIMxX6nRcBInHESIzrt6gJVxvXTWDn9A==
X-Received: by 2002:aa7:9acc:0:b0:4a2:b8b5:8813 with SMTP id x12-20020aa79acc000000b004a2b8b58813mr16103569pfp.4.1637250400585;
        Thu, 18 Nov 2021 07:46:40 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c17sm68631pgw.83.2021.11.18.07.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 07:46:39 -0800 (PST)
Date:   Thu, 18 Nov 2021 15:46:35 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 4/4] x86/kvm: add boot parameter for setting max
 number of vcpus per guest
Message-ID: <YZZ1W+YxagvG1EMM@google.com>
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-5-jgross@suse.com>
 <YZVsnZ8e7cXls2P2@google.com>
 <b252671e-dbd6-03a3-e8b5-552425ad63d3@suse.com>
 <YZZrzSi1rdaP0ETF@google.com>
 <d5c57c27-e237-ef84-96c7-f50619597023@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5c57c27-e237-ef84-96c7-f50619597023@suse.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 18, 2021, Juergen Gross wrote:
> On 18.11.21 16:05, Sean Christopherson wrote:
> > Which is a good segue into pointing out that if a module param is added, it needs
> > to be sanity checked against a KVM-defined max.  The admin may be trusted to some
> > extent, but there is zero reason to let userspace set max_vcspus to 4 billion.
> > At that point, it really is just a param vs. capability question.
> 
> I agree. Capping it at e.g. 65536 would probably be a good idea.

Any reason to choose 65536 in particular?  Why not cap it at the upper limit of
NR_CPUS_RANGE_END / MAXSMP, which is currently 8192?
