Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905115F347A
	for <lists+linux-doc@lfdr.de>; Mon,  3 Oct 2022 19:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiJCR07 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Oct 2022 13:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJCR04 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 13:26:56 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A93E19C34
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 10:26:52 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u24so3293152plq.12
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ABM+NW6fVFThNfu9rqzeSH+UmSPvsbfFChaihmMOzbw=;
        b=gWyi5FlTflhv4r8w9GnrNfmHyxVxQrP7zj24MK1x/79q55HKbmaJ624vadwY9ZV8Au
         REnDn+9tMWfFBQQBccazjx5vZNBGXA9jfxCFhdR2RW7Ni1H2jSfv3BaACt3a0Jb9xc+G
         SqZMLFdOyjCtpNMjWZzY5MBW9r7I1IvM7EpSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ABM+NW6fVFThNfu9rqzeSH+UmSPvsbfFChaihmMOzbw=;
        b=yuwy2/7FdO7zyMz02g9PozxP2PSYimO0v5k0PHHNNJDmB9wEkN4WQuj4yYphWYoi6u
         TUgXv0O90CJsTIes7ZqvCOPvARTi62wW0uTvCwmgPqZpBn0Wgy4PMAiCdtSo4uDsP3HX
         egMOjgIz5fLnPBDp/npCTnONH0AA8EgFlgj3ZhKIgXElyxg4q9tcerAQpK6qY26lhBAR
         aOAQxAOJg8ygEX9irURn/+MkKJZ1smMbPzlKaT5A5XpgavltoObNkCUMi5zJysOvPhGc
         4szyPv1uLLuX/ZeRTmWZbTMvZsDLU3rONDJG7QjDuaMF9n28GTFF89vbtUsWKam9CSAQ
         gQaQ==
X-Gm-Message-State: ACrzQf1hUBcsy1s/seWvsd4QRRiYXU+AUf9ByuvxjCwEUvfpVXfUCFNf
        8HENqfdXx7MYL9SPEBtItQEXsA==
X-Google-Smtp-Source: AMsMyM5wNcp5rTMmeLf+u/bHVgBxlTjtCbpJ/kd4PG5p9soWUXZV+BBgGjn7+y+I34j7N+HHikbN6g==
X-Received: by 2002:a17:903:32d1:b0:178:1cf0:5081 with SMTP id i17-20020a17090332d100b001781cf05081mr23742922plr.54.1664818011913;
        Mon, 03 Oct 2022 10:26:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902ce0c00b00176e6f553efsm7464071plg.84.2022.10.03.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:26:51 -0700 (PDT)
Date:   Mon, 3 Oct 2022 10:26:50 -0700
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
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [PATCH v2 03/39] x86/cpufeatures: Add CPU feature flags for
 shadow stacks
Message-ID: <202210031026.22DBF47CCD@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-4-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-4-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:00PM -0700, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> The Control-Flow Enforcement Technology contains two related features,
> one of which is Shadow Stacks. Future patches will utilize this feature
> for shadow stack support in KVM, so add a CPU feature flags for Shadow
> Stacks (CPUID.(EAX=7,ECX=0):ECX[bit 7]).
> 
> To protect shadow stack state from malicious modification, the registers
> are only accessible in supervisor mode. This implementation
> context-switches the registers with XSAVES. Make X86_FEATURE_SHSTK depend
> on XSAVES.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
