Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23CBC57C0A3
	for <lists+linux-doc@lfdr.de>; Thu, 21 Jul 2022 01:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiGTXJH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jul 2022 19:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbiGTXIv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 19:08:51 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6BE7391D
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 16:08:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id c3so88501pfb.13
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 16:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nszl3bsf2mnME2IbrRKNWdpEyNRDpL7edLFc4oh5rQk=;
        b=FwlOpTY1Xy5ZtTxSMQshR8kwWNBaEnIm9ywPyxdMxe3T/XxFEM/rXOZ8shtzx6jRRS
         91M8w+897Sjn6+U9yhdoQBbOHvUIZbnudqyVKqIbiFL3KIAItk6n7+SblQBLvdTN309V
         3g30TPedV8pjIQUF/c55Q9haSHOBERI23VMmBXMMfrJh6ECBxww0/hu+TOsLKCzYQ+gw
         GdGAnrtzEzMI3WfqML65BzsZafuMe/PQ0gjEW6sraCLwWPSVKqu83KinR/xUkg5DZP6e
         1lFSj7wj5ru0N/Lu8b5OfGt3wIdl4NxJaMaNB7fu16Hj/vtrqiGttQ3ijzZC5VLTZ10Y
         P4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nszl3bsf2mnME2IbrRKNWdpEyNRDpL7edLFc4oh5rQk=;
        b=tejkG1UIwj9ttDzqxP4fRaYx6wGrlbbJn2Mg80WW8+GCUiS3BbEUjjcIXGGsbaCkht
         /coUEx7Hns4/xCW5hGL/pMwYZFFmjOoUiR7/fGVAGdL5uQKz1Zx5UoqMCsA5A/Z4yiAL
         w8JI+0d6fFdLHa5lYU0Bkz3c7VslxheFXAQgwj0QO5ZIfuav/J3xiHsnjxb1mmUm20bh
         ssjbBnZEfJ5VFKSa0bDAsNRhr+sxJD1oKdMm9fo0zpnmoV/Rh8PGiW2heb/hM1RKQ2Ni
         Sd9wJN7Hhc+LgngKO9bV+NOraCIU+F7qACCk+EEh6P9/Gc3/QMcJotmgcsfuLAHuLgCB
         i5Jg==
X-Gm-Message-State: AJIora88NWe21J0jwv6zbsmZwLDJ3yDv11aw+ktMV2m0hqUQbB9lGPFM
        9/TsxsQNgekBA1IFahvSR01FNgqMSXwKAAaxmEoGIQ==
X-Google-Smtp-Source: AGRyM1sVSu2sWaA6KhwjXATdLIcan8zoTwRzYetVEkO/NR0+movB4Kj6gdLqTbANspAPpdn1ss3XaAW1x7VvJRw8slU=
X-Received: by 2002:a62:1a8b:0:b0:528:d505:1a06 with SMTP id
 a133-20020a621a8b000000b00528d5051a06mr41267868pfa.78.1658358501699; Wed, 20
 Jul 2022 16:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com> <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
 <20220624090246.GA2181919@chaop.bj.intel.com> <CAGtprH82H_fjtRbL0KUxOkgOk4pgbaEbAydDYfZ0qxz41JCnAQ@mail.gmail.com>
 <20220630222140.of4md7bufd5jv5bh@amd.com> <4fe3b47d-e94a-890a-5b87-6dfb7763bc7e@intel.com>
 <Ysc9JDcVAnlVrGC8@google.com> <5d0b9341-78b5-0959-2517-0fb1fe83a205@intel.com>
In-Reply-To: <5d0b9341-78b5-0959-2517-0fb1fe83a205@intel.com>
From:   Vishal Annapurve <vannapurve@google.com>
Date:   Wed, 20 Jul 2022 16:08:10 -0700
Message-ID: <CAGtprH9knCr++C7jgXYCi1zfYcreip1uun-d+eucjEQy9xymNg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
To:     Xiaoyao Li <xiaoyao.li@intel.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        "Nikunj A. Dadhania" <nikunj@amd.com>,
        kvm list <kvm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
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
        x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>, mhocko@suse.com
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

> > Hmm, so a new slot->arch.page_attr array shouldn't be necessary, KVM can instead
> > update slot->arch.lpage_info on shared<->private conversions.  Detecting whether
> > a given range is partially mapped could get nasty if KVM defers tracking to the
> > backing store, but if KVM itself does the tracking as was previously suggested[*],
> > then updating lpage_info should be relatively straightfoward, e.g. use
> > xa_for_each_range() to see if a given 2mb/1gb range is completely covered (fully
> > shared) or not covered at all (fully private).
> >
> > [*] https://lore.kernel.org/all/YofeZps9YXgtP3f1@google.com
>
> Yes, slot->arch.page_attr was introduced to help identify whether a page
> is completely shared/private at given level. It seems XARRAY can serve
> the same purpose, though I know nothing about it. Looking forward to
> seeing the patch of using XARRAY.
>
> yes, update slot->arch.lpage_info is good to utilize the existing logic
> and Isaku has applied it to slot->arch.lpage_info for 2MB support patches.

Chao, are you planning to implement these changes to ensure proper
handling of hugepages partially mapped as private/shared in subsequent
versions of this series?
Or is this something left to be handled by the architecture specific code?

Regards,
Vishal
