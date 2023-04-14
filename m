Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9645B6E2951
	for <lists+linux-doc@lfdr.de>; Fri, 14 Apr 2023 19:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjDNR0s (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Apr 2023 13:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjDNRYk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Apr 2023 13:24:40 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C47C144
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 10:24:23 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 186-20020a2510c3000000b00b880000325bso36059730ybq.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681493062; x=1684085062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1suTIWWaXvrjwoXvee3hiPz1nCSIoJ8zBj0cMHmSI7Y=;
        b=ikLyr+8Xr+H5vM/bYsln0btIfSDwhlyv3SopCKg3euLB29KjQafs0AtMmmr4T9EIfJ
         vIPC9xf1NxKqXFWckbIj0WVo4SgvKsPOQl1cOwpgB/XV40BLqns/ryvTGzxH0hPTIol7
         xarcJ0GqxJFOJTIObBYAoUoAUl0iAOmFpm7/8rkUekiKozgid1NlTMyN45x5pS33IxKE
         d8HkpLc19gk/5O6gbpIr0ZptEhH2xIi2xu1OHofuLnINm9CQonnrWxwWMzsJ6C8Y+skF
         MUVvqijzMdtqQ30NGAKrF5+eZpQbbmVeMtcc7lOWf3BPP1QJqZGJHkM9DCvCxyboG1b4
         logA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681493062; x=1684085062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1suTIWWaXvrjwoXvee3hiPz1nCSIoJ8zBj0cMHmSI7Y=;
        b=EfJxVQDUIsWJoYC1kR+SOTsE9Yer08n4Nvrivg0pOKc48sEkbrhk8xMKd/gVkicfU7
         ATU35LsfXLGUgF2ZGVtOaJ8r8Gwl7t6VSULNXbdRFPkNZpdkvUKuM7uer2qx0DETYv5q
         isWHiRSdoIgSCMIoklMlXyrS8LM+uFum6tNm3K+5rFCgRT7CByyASMWdF0TV/qzjA50t
         /aD0MWAS9LxNh1fVEMUe9XN0f5NMxG0RKJCVoP40Xp+4MDd3l2b/5zdGE/TyW5qhMi50
         7znpdCyIQlsUrheMyrQbHTihUZslPW2F8KdyY2ucFG/9frczSlRwDdvdE4yCtFx5LxcG
         titA==
X-Gm-Message-State: AAQBX9dWPXfSAjyiLMsokSDEBRZRIND6cDWV1OlQ0w6Uh82g+zssvfKW
        6+1h1l38ZeOiuyuBcU+10OYQ3ooiqlg=
X-Google-Smtp-Source: AKy350bMntOiUpabNyzZrQez/ekmQ/pO8bA95EPMaEz7NgDSS6qOH/7lua5qHB9B+z+FW4OM+ZLtRc32bN4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b621:0:b0:54c:bf7:1853 with SMTP id
 u33-20020a81b621000000b0054c0bf71853mr4241791ywh.6.1681493062225; Fri, 14 Apr
 2023 10:24:22 -0700 (PDT)
Date:   Fri, 14 Apr 2023 17:24:20 +0000
In-Reply-To: <ZDjzpKL9Omcox991@dhcp22.suse.cz>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com> <ZDjzpKL9Omcox991@dhcp22.suse.cz>
Message-ID: <ZDmMRAZYgLJ+x4l9@google.com>
Subject: Re: [RFC PATCH 0/6] Setting memory policy for restrictedmem file
From:   Sean Christopherson <seanjc@google.com>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
        linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        qemu-devel@nongnu.org, aarcange@redhat.com, ak@linux.intel.com,
        akpm@linux-foundation.org, arnd@arndb.de, bfields@fieldses.org,
        bp@alien8.de, chao.p.peng@linux.intel.com, corbet@lwn.net,
        dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, hpa@zytor.com, hughd@google.com,
        jlayton@kernel.org, jmattson@google.com, joro@8bytes.org,
        jun.nakajima@intel.com, kirill.shutemov@linux.intel.com,
        linmiaohe@huawei.com, luto@kernel.org, mail@maciej.szmigiero.name,
        michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com,
        pbonzini@redhat.com, qperret@google.com, rppt@kernel.org,
        shuah@kernel.org, steven.price@arm.com, tabba@google.com,
        tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
        vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com,
        x86@kernel.org, yu.c.zhang@linux.intel.com, muchun.song@linux.dev,
        feng.tang@intel.com, brgerst@gmail.com, rdunlap@infradead.org,
        masahiroy@kernel.org, mailhol.vincent@wanadoo.fr
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 14, 2023, Michal Hocko wrote:
> On Fri 14-04-23 00:11:49, Ackerley Tng wrote:
> > 3. A more generic fbind(): it seems like this new functionality is
> >    really only needed for restrictedmem files, hence a separate,
> >    specific syscall was proposed to avoid complexities with handling
> >    conflicting policies that may be specified via other syscalls like
> >    mbind()
> 
> I do not think it is a good idea to make the syscall restrict mem
> specific.

+1.  IMO, any uAPI that isn't directly related to the fundamental properties of
restricted memory, i.e. isn't truly unique to restrictedmem, should be added as
generic fd-based uAPI.

> History shows that users are much more creative when it comes
> to usecases than us. I do understand that the nature of restricted
> memory is that it is not mapable but memory policies without a mapping
> are a reasonable concept in genereal. After all this just tells where
> the memory should be allocated from. Do we need to implement that for
> any other fs? No, you can safely return EINVAL for anything but
> memfd_restricted fd for now but you shouldn't limit usecases upfront.

I would even go a step further and say that we should seriously reconsider the
design/implemenation of memfd_restricted() if a generic fbind() needs explicit
handling from the restricted memory code.  One of the goals with memfd_restricted()
is to rely on the underlying backing store to handle all of the "normal" behaviors.
