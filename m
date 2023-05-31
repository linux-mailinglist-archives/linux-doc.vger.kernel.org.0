Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E22718A07
	for <lists+linux-doc@lfdr.de>; Wed, 31 May 2023 21:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjEaTUO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 May 2023 15:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjEaTUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 15:20:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46906107
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 12:20:11 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so106609b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685560811; x=1688152811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49Ctqz+Z6/EpgEVzBMBiySSOETw/gRZF7F8sKc0/gW4=;
        b=SCXzv5NFJkdSd2DBch3tBur6rt87sHZadMvllcCYrBSlAnujqsn2w6NYfs8kRw7zEH
         UUy5B5M3fdwqVh4cJAPUbO4ymzbGUQhjG0wsWvcB0rzXrJuUXqSQWExeBcxLh5dnJ4hW
         JdIcMLBU2Wr5PTX+4Sgey8hL0W2zyc7yeXyBOoy9FNA13tz08zsvGn7+DUiMDrwaQkpg
         hdZvFD7p3uuyL6jZGaitCwZEBXvEijJ+fMG39fXax6zGLA/zH3JFxhLgU8GjKTvmwn3U
         cfKL4OTNs21hoPihFH4rxpZz8Ex23V4vNxSxIHe04E18MS+FM6lfIrpkz5m+NwO2u7KZ
         /PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560811; x=1688152811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49Ctqz+Z6/EpgEVzBMBiySSOETw/gRZF7F8sKc0/gW4=;
        b=IFu9ClDse52UtseI4SzD8v3iP6vwgwLAzJpCNE1n5H4rVhkjHcnmjH8lSy7kcMC2bH
         cBN8eYkgqeB19ADjU2eMXZVEedCGNyM176ljnRMcQz9Md1OiawRUR8KcnQ9TbD1kUgKR
         UVT4QAhe73YqbFS25rX+HATwK1IZBOwtM3Jy1aaM2o9DPm9bwa99ehbeUeIwoXJDJXDT
         2DbVem1HAxbqW+erhVoXgbISC5Sm4vPs1+k+S/IuqXcHRMorImNEHUl6iNPlc4wYF3o3
         4AfeS7LdjFvw3clu2LKZnm52+cEBWJqDF3Q6/nwYIJ0PvHfSQWrNaTAD79UsuffaMUP6
         PHMw==
X-Gm-Message-State: AC+VfDzym+f5ZGaBbt9sPRcXxLte17H1uc2mDoj1uI3LjF6binkKlzXb
        M275p4nDWSUQgHmYGTIfLNzBow==
X-Google-Smtp-Source: ACHHUZ5vOhH+Z20smvih3PRoBzyu6112d4DjAZ/k2Hk8Q2510QpTt0jTRAeR3hLBF9CzQodd76AWQw==
X-Received: by 2002:a05:6a00:1344:b0:647:e45f:1a4c with SMTP id k4-20020a056a00134400b00647e45f1a4cmr5931413pfu.11.1685560810753;
        Wed, 31 May 2023 12:20:10 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7920f000000b0065017055caasm918208pfo.210.2023.05.31.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:20:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1q4RMe-0017g6-KI;
        Wed, 31 May 2023 16:20:08 -0300
Date:   Wed, 31 May 2023 16:20:08 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alistair Popple <apopple@nvidia.com>,
        Anup Patel <anup@brainfault.org>,
        Ben Gardon <bgardon@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Gavin Shan <gshan@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Larabel <michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Paul Mackerras <paulus@ozlabs.org>,
        Peter Xu <peterx@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, x86@kernel.org,
        linux-mm@google.com
Subject: Re: [PATCH mm-unstable v2 02/10] mm/kvm: use
 mmu_notifier_ops->test_clear_young()
Message-ID: <ZHed6OuO/ALNfvaX@ziepe.ca>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-3-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-3-yuzhao@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 26, 2023 at 05:44:27PM -0600, Yu Zhao wrote:
> Replace test_young() and clear_young() with test_clear_young().
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  include/linux/mmu_notifier.h | 29 ++-----------------
>  include/trace/events/kvm.h   | 15 ----------
>  mm/mmu_notifier.c            | 42 ----------------------------
>  virt/kvm/kvm_main.c          | 54 ------------------------------------
>  4 files changed, 2 insertions(+), 138 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index dfdbb370682d..c8f35fc08703 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -104,26 +104,6 @@ struct mmu_notifier_ops {
>  				 unsigned long start,
>  				 unsigned long end);
>  
> -	/*
> -	 * clear_young is a lightweight version of clear_flush_young. Like the
> -	 * latter, it is supposed to test-and-clear the young/accessed bitflag
> -	 * in the secondary pte, but it may omit flushing the secondary tlb.
> -	 */
> -	int (*clear_young)(struct mmu_notifier *subscription,
> -			   struct mm_struct *mm,
> -			   unsigned long start,
> -			   unsigned long end);
> -
> -	/*
> -	 * test_young is called to check the young/accessed bitflag in
> -	 * the secondary pte. This is used to know if the page is
> -	 * frequently used without actually clearing the flag or tearing
> -	 * down the secondary mapping on the page.
> -	 */
> -	int (*test_young)(struct mmu_notifier *subscription,
> -			  struct mm_struct *mm,
> -			  unsigned long address);
> -
>  	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
>  				unsigned long start, unsigned long end,
>  				bool clear, unsigned long *bitmap);

Oh, you split the patch. This MMU notifier stuff seems OK for both
patches then, and KVM is the only user:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
