Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7385674877
	for <lists+linux-doc@lfdr.de>; Fri, 20 Jan 2023 02:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjATBCD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Jan 2023 20:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjATBCB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 20:02:01 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CED1A25BD
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 17:01:59 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id v23so4013373plo.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDmCDpYuZSseu8+WFHnlbstVUV3Mb004JdTrhYPLYJM=;
        b=VJ3r+Jr4o115SgO6t80R25GB4nsHkVQA55qMU07/LxC1l9AXYlv6Qn3C9rDj0/RyED
         u0sKK4rtXSnjueoR8TL967ceuTgB/Voh0QiIWLMUuLMhAgcF3cj2x1mQ0e7ji4FuNKrN
         BayCvUOiGNS62rjt2vUwAXNmkaeLSEd7GjRSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDmCDpYuZSseu8+WFHnlbstVUV3Mb004JdTrhYPLYJM=;
        b=VccK3OPWQGNo3OYwUSlcp2+O5V5MWLTpV5IoCrJznWpk3iEfzsUOFxg1KykUmJsUeS
         aUih2Kn/hMIok0hqRTY2gnuSv0DcySZOlunvKnRMvqebiN0nyvaGbUj/AMHdc9YLYlmr
         p5n2hHCmiTndfAY2cUKjJTBV7HLF6PK83CDwy4AZUuD45OGyhfS+J2AxUs2Rj119G44D
         PLLz/necovsylvHQwxhYn1XmMXDD4BCFBWLsCDGF0TwmzqDQ60tPr6EApCcDNtYujI+v
         5hOw8TrLeTXhgNHZiyvsS2HZLv6JLSOUsbszIfE5K5yPF1Bq9ZhZLEKweEpTwoXIHylS
         pljQ==
X-Gm-Message-State: AFqh2kopqxZ04j6OGza6k+hMMvcLcRodhQr46/CHCidYJNr1cOjtCrV+
        bawYTk5UESFxqRsRpWF+WntBPA==
X-Google-Smtp-Source: AMrXdXtCH4GbPJWuEz6RriwxlvVbVprpe+fJJbcwXL8ZMtpjRzdUq1dXvMx8cE+kk44XcEBgZP6bsQ==
X-Received: by 2002:a05:6a20:394a:b0:b0:5600:f2b7 with SMTP id r10-20020a056a20394a00b000b05600f2b7mr16108078pzg.54.1674176518991;
        Thu, 19 Jan 2023 17:01:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b5-20020a62cf05000000b005821db4fd84sm12268781pfg.131.2023.01.19.17.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 17:01:58 -0800 (PST)
Date:   Thu, 19 Jan 2023 17:01:57 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com
Subject: Re: [PATCH v5 25/39] mm: Warn on shadow stack memory in wrong vma
Message-ID: <202301191701.A8201D9C@keescook>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-26-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119212317.8324-26-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 01:23:03PM -0800, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One sharp edge is that PTEs that are both Write=0 and Dirty=1 are
> treated as shadow by the CPU, but this combination used to be created by
> the kernel on x86. Previous patches have changed the kernel to now avoid
> creating these PTEs unless they are for shadow stack memory. In case any
> missed corners of the kernel are still creating PTEs like this for
> non-shadow stack memory, and to catch any re-introductions of the logic,
> warn if any shadow stack PTEs (Write=0, Dirty=1) are found in non-shadow
> stack VMAs when they are being zapped. This won't catch transient cases
> but should have decent coverage. It will be compiled out when shadow
> stack is not configured.
> 
> In order to check if a pte is shadow stack in core mm code, add default
> implementations for pte_shstk() and pmd_shstk().
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
