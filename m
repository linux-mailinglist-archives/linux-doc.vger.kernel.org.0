Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC3C7189F5
	for <lists+linux-doc@lfdr.de>; Wed, 31 May 2023 21:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjEaTR2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 May 2023 15:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjEaTR0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 15:17:26 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE0D136
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 12:17:08 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6af7d6f6f41so101985a34.1
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685560628; x=1688152628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHtweHA3SWHMpKKRoTnSYY+2sgOnMlETASaKZp5cnWg=;
        b=XsEc9zVFJou7Y3nnebryiByVBn6LMK4Wf9l4nO5gpford+hJUA/H2QpOG0COLFuX5a
         URGPWFQpc3LDA6bntwf8mYCOUR7LRedzET0Ewd0rzO9PgVPKYEFRaNqy9Tly9asRKiaJ
         uFEF3kE4Sc6oLXyO2nGQxY+xPOxeWYxp2VOpLq6pkzybqeLXldDHEX36YE+JV0/2WgYR
         MEZP0OGJ34Wk74uKTPmjaR3f2Bt+Qidy74lDTyE54KXWUVya+wI2fELz6WmymjadQ0vz
         6R6qPRykBkgotiP004pJgvChmAdW+rE0X9JyPAJunztg1ytyzcjhuhEpYuoYimbwCbpO
         ox3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560628; x=1688152628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHtweHA3SWHMpKKRoTnSYY+2sgOnMlETASaKZp5cnWg=;
        b=Wi80oS7rJuN0CtCVGxpi9K46HDUvHeZheXPgn5SfqMfnLKDUEL5sPMOFKrOt+lgxmH
         feQ5lQMQ43NQyaO9dFsTiGqCaGfLX3x/2D+0ckf82xpEtQjXIypZQj/OyYhzkrhGYOcT
         5cXZM6n23z5sV68h/8Uh8MwzFoig6XIEjnlLKxkjNglOsCqtloFJsz7CzoudWcBjeYmH
         PzpgPHj9dS/E5vjLnGhunqK7LaHNmCUC8ki/x9uufVsZVSNTxBktpvW/qJ55KUqqgVOB
         yh9mHxRitHHe11OpooRjp2qRe5XhSfBliyhq9NW+FPygD120997bUit0gzfGAxJ4Kr6r
         fMHQ==
X-Gm-Message-State: AC+VfDyWsNlaHI50cJ0FbHLtYr5w39xsNcfUc3bLXYKTs9YVi1JFE1ap
        Tiu3XPshAgotn+vok5NvYGs4qw==
X-Google-Smtp-Source: ACHHUZ5EAb6uxqk7kkbizac+JrcIuoYNmIlHHRhpUDjRmBZ8boj1JThitoXP6J0DZ/TEoplrWHjlbg==
X-Received: by 2002:a05:6358:7e9b:b0:123:3203:928a with SMTP id o27-20020a0563587e9b00b001233203928amr1487114rwn.27.1685560627568;
        Wed, 31 May 2023 12:17:07 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a300300b00250d670306esm1594668pjb.35.2023.05.31.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:17:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1q4RJh-0017d4-7W;
        Wed, 31 May 2023 16:17:05 -0300
Date:   Wed, 31 May 2023 16:17:05 -0300
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
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
Message-ID: <ZHedMX470b7EMwbe@ziepe.ca>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-2-yuzhao@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 26, 2023 at 05:44:26PM -0600, Yu Zhao wrote:
> @@ -122,6 +124,10 @@ struct mmu_notifier_ops {
>  			  struct mm_struct *mm,
>  			  unsigned long address);
>  
> +	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
> +				unsigned long start, unsigned long end,
> +				bool clear, unsigned long *bitmap);
> +

Why leave clear_young behind? Just make a NULL bitmap mean
clear_young?

Jason
