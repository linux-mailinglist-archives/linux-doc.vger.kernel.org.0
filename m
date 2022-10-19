Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFD3604AB6
	for <lists+linux-doc@lfdr.de>; Wed, 19 Oct 2022 17:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbiJSPKO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 11:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiJSPJc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 11:09:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CB4371A2
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 08:03:00 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r14so28604178lfm.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8uws4B5WgtxEQQPonRBN7dDm57mj+TMYZwg9NWMF6uE=;
        b=GNoRQIq9JKVsi3NBMOHtxRxaA+HyiSRxEbQwKROCIdQN7YeQVvkeCL/tBfTJ0rFShS
         wLv+OMed6GKtlzQERAvDIH0fS9RwWNLH1iDzg8iIFUBsQUCTCUR56HEIdBHp5w6KeZ+i
         ed0p1SeRI6LjurmDyBxbuv8clbnocReb3YyBgtI/ebogw01dMtsK7A/KD1lbcyPsqtH5
         TaWyyc8eNama/1dRhNwUMQO8P85tBb+QCcPLfYt81cuF60S21NuSTt9ENjFqtPiqHbYW
         QbAZcIWW265YqQ7fQmjB0etPPuYGAVxyYuBBwAInvDjayuW/S/xhDX/aqG8lWy7/HjYu
         bNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uws4B5WgtxEQQPonRBN7dDm57mj+TMYZwg9NWMF6uE=;
        b=31iRujsN41+YoGRnPc+HCdHGcjTiTaf/r8nAtonh2w53io//vAFEEqOWjGjyecnBxF
         +gt/I66eDzVT/1ZGPkLsUuR3aXd+GuCRRPao1ndcR3u7QDrhVSubofXJ5PnusbrRKS/z
         kAhd+a+NDKSKDb6fzM+U7iFSx13uvbWHNvGd6vGrAgSoO2Piv7MkgZK16IGDiCOw0TpW
         A2nh9CsV2voXUIWyOHY8l/w3LRcnSpRivtnFPDsIpLcr7wG/6PUhvjg6maPVifUh79I+
         gTkDJd5Ty2nBYQXAt27FO4/rCiVARITeYVxjXRaxSp1eSq2xtWx/NHqrBnz8B33CViJ6
         v/SA==
X-Gm-Message-State: ACrzQf2tYbZ6rek+6pRoFqFwScakjCCx2XdaI6qS7LCkcei/2NuzrlO9
        jezXktkkLHFi4MzZN35nd8rVudA5OOgHXyFq+DRkbw==
X-Google-Smtp-Source: AMsMyM73/Iz2UA6hD6VnKREmVWKox8T+CDDwCUSlKn0rjft7dc92r9M4EXDXMPFumhxI7Ld+a4+gjwQViVOGvFn4W+A=
X-Received: by 2002:a05:6512:4cb:b0:4a2:25b6:9e73 with SMTP id
 w11-20020a05651204cb00b004a225b69e73mr3205357lfq.30.1666191778897; Wed, 19
 Oct 2022 08:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-6-chao.p.peng@linux.intel.com> <CA+EHjTxukqBfaN6D+rPOiX83zkGknHEQ16J0k6GQSdL_-e9C6g@mail.gmail.com>
 <20221012023516.GA3218049@chaop.bj.intel.com> <CA+EHjTyGyGL+ox81=jdtoHERtHPV=P7wJub=3j7chdijyq-AgA@mail.gmail.com>
 <Y03UiYYioV+FQIpx@google.com> <20221019132308.GA3496045@chaop.bj.intel.com>
In-Reply-To: <20221019132308.GA3496045@chaop.bj.intel.com>
From:   Fuad Tabba <tabba@google.com>
Date:   Wed, 19 Oct 2022 16:02:22 +0100
Message-ID: <CA+EHjTytCEup0m-nhnVHsuQ1xjaCxXNHO_Oxe+QbpwqaewpfKQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] KVM: Register/unregister the guest private memory regions
To:     Chao Peng <chao.p.peng@linux.intel.com>
Cc:     Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > > This sounds good. Thank you.
> >
> > I like the idea of a separate Kconfig, e.g. CONFIG_KVM_GENERIC_PRIVATE_MEM or
> > something.  I highly doubt there will be any non-x86 users for multiple years,
> > if ever, but it would allow testing the private memory stuff on ARM (and any other
> > non-x86 arch) without needing full pKVM support and with only minor KVM
> > modifications, e.g. the x86 support[*] to test UPM without TDX is shaping up to be
> > trivial.
>
> CONFIG_KVM_GENERIC_PRIVATE_MEM looks good to me.

That sounds good to me, and just keeping the xarray isn't really an
issue for pKVM. We could end up using it instead of some of the other
structures we use for tracking.

Cheers,
/fuad

> Thanks,
> Chao
> >
> > [*] https://lore.kernel.org/all/Y0mu1FKugNQG5T8K@google.com
