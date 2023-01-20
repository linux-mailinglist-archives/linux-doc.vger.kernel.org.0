Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1A2674842
	for <lists+linux-doc@lfdr.de>; Fri, 20 Jan 2023 01:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjATArq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Jan 2023 19:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjATAri (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 19:47:38 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54F7458AE
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:47:35 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id d8so4132462pjc.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRUCO9R4oKwHJTXbVbkFHH4Tq7Krw4YsgYaN3ockSL4=;
        b=M600pJDHA6i9erSJ4glLzFDJjglPTXyYUBArC00aIDcuxch+oi32jAjflplRHZXQnv
         G/VG3VJhVErlB+9kd7Z9chUomfQLvu0e8tezTzQa+LlktAEfdmw0TXxPRfJq+dOLceO6
         tcK3jLAJ94n1xJ+OCRTVYF+ZLEvypHZB3RoP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRUCO9R4oKwHJTXbVbkFHH4Tq7Krw4YsgYaN3ockSL4=;
        b=dOmjHMUPSJ6RiZ7ZpnCqB3LhGpy3zB6KE1iWMF8tWfpCBwp1haDaf23gw9OimTw38f
         obIbimYQKd5jaq9P5fE7NRiD1LJbgKA8Lgb4QEOXdKIFMWeM7LxXLYlg9fBB+CPIUjq1
         4bgO220R+09vFrL6fRtDXmKZcvVcEa4mLSYrkWUDsUGKq1v70A5o9CvoQQxihde/+eLW
         F2/WQl2CJdIhflTImdJwhjPFypNYhfyB5n4EUZV8PAWQszXVZO1QlxUUFvfUermkxM+g
         QLsWdjKstgWm000/yEsDluPiQgtU0LiVTi79FAEJZaDYZhZCLMMGL6G/Hs7+MCG5CkSZ
         PVYg==
X-Gm-Message-State: AFqh2kq6j7YhCslb0/6TopWwnY3ewVf4PWFv5EfLXwaz2sXaihXq5bAU
        gTDl3NTHXBYVDTEGG7xtYfDpdg==
X-Google-Smtp-Source: AMrXdXvh2Sc3eBxxrOt1HFHkaWW8AKF0tVSWdXheVx90+ji5L0EqMsvnnHVQoQS62OiI8MpZC9Oh4A==
X-Received: by 2002:a17:902:b281:b0:189:e360:ce5 with SMTP id u1-20020a170902b28100b00189e3600ce5mr36678832plr.12.1674175655265;
        Thu, 19 Jan 2023 16:47:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090341cc00b001888cadf8f6sm7038231ple.49.2023.01.19.16.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 16:47:34 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:47:34 -0800
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
Subject: Re: [PATCH v5 06/39] x86/fpu: Add helper for modifying xstate
Message-ID: <202301191647.0F4AB4B525@keescook>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-7-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119212317.8324-7-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 01:22:44PM -0800, Rick Edgecombe wrote:
> Just like user xfeatures, supervisor xfeatures can be active in the
> registers or present in the task FPU buffer. If the registers are
> active, the registers can be modified directly. If the registers are
> not active, the modification must be performed on the task FPU buffer.
> 
> When the state is not active, the kernel could perform modifications
> directly to the buffer. But in order for it to do that, it needs
> to know where in the buffer the specific state it wants to modify is
> located. Doing this is not robust against optimizations that compact
> the FPU buffer, as each access would require computing where in the
> buffer it is.
> 
> The easiest way to modify supervisor xfeature data is to force restore
> the registers and write directly to the MSRs. Often times this is just fine
> anyway as the registers need to be restored before returning to userspace.
> Do this for now, leaving buffer writing optimizations for the future.
> 
> Add a new function fpregs_lock_and_load() that can simultaneously call
> fpregs_lock() and do this restore. Also perform some extra sanity
> checks in this function since this will be used in non-fpu focused code.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
