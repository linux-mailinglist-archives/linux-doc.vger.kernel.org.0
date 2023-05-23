Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AF370DF0F
	for <lists+linux-doc@lfdr.de>; Tue, 23 May 2023 16:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbjEWOTr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 May 2023 10:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjEWOTq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 10:19:46 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2704C11A
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 07:19:45 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1afa6afcef4so14972805ad.1
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684851584; x=1687443584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJTOtttasiWLDEUcufe2rn3c2B61VJIjpPGMO/P/Yds=;
        b=brwx0PSOMA0wdDk4Q3ZV6Zhimz9MGX1rc3oTrPLZdLDxR99oxRU+kgTiRQZeIUGp/B
         dyf6U+6YZAZ0UTzApeHQKfgEnBhOiOJ/qXVvQ9J1F3RjGUiuExrD9+BmRrRlbu21nlVD
         Wx38qijldoSLQu16rAmMxw27fIDqOXmDcc7YNTYCcS5xe37Q9LSgSZUY1x8lcrA4BzR8
         Gn6XlWuegWj0mDFi1OGEJ901Pjqo4OoenFzAOsc9erWa0V37gRvkLtOzMhqrjLYhuzgg
         EJnTJnwVBYHzHNPBMQ/b1Fhyc00bJU+3iH49CfEJT1yRwLmSMHit03ZKsytirD36EFwd
         gllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684851584; x=1687443584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJTOtttasiWLDEUcufe2rn3c2B61VJIjpPGMO/P/Yds=;
        b=dd4z63KXU+OdtrBDghyUrVTYkBqbApje3tjFEwNAWEgUNBqeXT3XI9gg2UBVNUiZvU
         yz/kYE0insGBPIXNhaZ9nBjLbmHa0MtdM+3hZ4xz8Pn0ENMWKwj2Qq3E5x1cYRSMxVJX
         XEeRg1VPJLmbI66haMgTFj7ZiZe45jthJr57h127OopjyruGfP4iPHf8zIYnrkimnrbo
         TJw/0TcXX8vU7S2Ivq6LmleQcBHJf+but7jT9LTYodVw9sVgTy3ZiF8OXZQT6FfSdjcU
         gg3QpcJAay7vqkS8ewYF9ygNvomtgslWNUEhqO55fD64VcpetNpd2+hs0I8sVeCJddNP
         51Lw==
X-Gm-Message-State: AC+VfDyjLct3nbD68zU0cYqO+Cfj84Z59B+3JfF9O/tG/40NbIlb3bO5
        zwJjeAGM+XCvHnUq9urQMAIyjesTx+U=
X-Google-Smtp-Source: ACHHUZ7XDfHM+pb9CMgdhxQCTf7TNLGglKW4K4aM789UbMGnxCZDh8BKaFM+lAod2VMVzlBmEBluGi8tvqw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:eb11:b0:1a1:b318:2776 with SMTP id
 l17-20020a170902eb1100b001a1b3182776mr3427854plb.0.1684851584603; Tue, 23 May
 2023 07:19:44 -0700 (PDT)
Date:   Tue, 23 May 2023 07:19:43 -0700
In-Reply-To: <ZGxo9ylqYI8JXjGn@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Mime-Version: 1.0
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-9-chao.p.peng@linux.intel.com> <ZGxo9ylqYI8JXjGn@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Message-ID: <ZGzLf4zgxpBjghaF@google.com>
Subject: Re: [PATCH v7 08/14] KVM: Rename mmu_notifier_*
From:   Sean Christopherson <seanjc@google.com>
To:     Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc:     Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        linux-kselftest@vger.kernel.org,
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
        Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 23, 2023, Kautuk Consul wrote:
> On 2022-07-06 16:20:10, Chao Peng wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index e9153b54e2a4..c262ebb168a7 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -765,10 +765,10 @@ struct kvm {
> >  
> >  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> >  	struct mmu_notifier mmu_notifier;
> > -	unsigned long mmu_notifier_seq;
> > -	long mmu_notifier_count;
> > -	gfn_t mmu_notifier_range_start;
> > -	gfn_t mmu_notifier_range_end;
> > +	unsigned long mmu_updating_seq;
> > +	long mmu_updating_count;
> 
> Can we convert mmu_updating_seq and mmu_updating_count to atomic_t ?

Heh, can we?  Yes.  Should we?  No.

> I see that not all accesses to these are under the kvm->mmu_lock
> spinlock.

Ya, working as intended.  Ignoring gfn_to_pfn_cache for the moment, all accesses
to mmu_invalidate_in_progress (was mmu_notifier_count / mmu_updating_count above)
are done under mmu_lock.  And for for mmu_notifier_seq (mmu_updating_seq above),
all writes and some reads are done under mmu_lock.  The only reads that are done
outside of mmu_lock are the initial snapshots of the sequence number.

gfn_to_pfn_cache uses a different locking scheme, the comments in
mmu_notifier_retry_cache() do a good job explaining the ordering.

> This will also remove the need for putting separate smp_wmb() and
> smp_rmb() memory barriers while accessing these structure members.

No, the memory barriers aren't there to provide any kind of atomicity.  The barriers
exist to ensure that stores and loads to/from the sequence and invalidate in-progress
counts are ordered relative to the invalidation (stores to counts) and creation (loads)
of SPTEs.  Making the counts atomic changes nothing because atomic operations don't
guarantee the necessary ordering.

E.g. when handling a page fault, KVM snapshots the sequence outside of mmu_lock
_before_ touching any state that is involved in resolving the host pfn, e.g. primary
MMU state (VMAs, host page tables, etc.).   After the page fault task acquires
mmu_lock, KVM checks that there are no in-progress invalidations and that the sequence
count is the same.  This ensures that if there is a concurrent page fault and
invalidation event, the page fault task will either acquire mmu_lock and create SPTEs
_before_ the invalidation is processed, or the page fault task will observe either an
elevated mmu_invalidate_in_progress or a different sequence count, and thus retry the
page fault, if the page fault task acquires mmu_lock after the invalidation event.
