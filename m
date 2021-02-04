Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6C530FD5F
	for <lists+linux-doc@lfdr.de>; Thu,  4 Feb 2021 20:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239410AbhBDTyQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Feb 2021 14:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239493AbhBDTw1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:52:27 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25419C061224
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:50:28 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o16so2867231pgg.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OW1TYFUhOfJJmljC0tgdXjB4AwIvTk03EU9GC1Jo7to=;
        b=QoxWWC9a3Ab+eHwwlog/KFHh6xEgiviG8pkcW0WJCAuIG4eYSJu8/B7NXRIWJmgr/t
         hyxGThp1cc1Ii4JEYpapAJjbUkKqULFin3Dslivyt3QMDqzmj0E0jgteLfoXBlscp1vX
         2S3uThPW1Blf2iX9nEAmO0GbaVBUe5fG+j89I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OW1TYFUhOfJJmljC0tgdXjB4AwIvTk03EU9GC1Jo7to=;
        b=HoiAyvjM2PJ9JKOqr/cTGCCLApG/qyzfs3G6p6EOul7gPWrPdjgH6u77vhz/Qr5mfn
         R8bz1Ym8pBVy6OGZUgFZsmCyQdlpWlUMc7B3zE8Eq1ZTv4qFJUTrCLbMT2EiwXOccRKq
         yjAq9qBAwb3mzWTx7f6Q9gsUeBSU1UeNYBZp9+GkL5nkzSJQppHa0ENL2fkxw3VL8TcJ
         42bbGdKlJ1DZTVHwwzjZ+zc/t+QumpQOezh1DolwMZ7SifCfuyT/agcNe81Y8vBgeraW
         N2xjtwqfyN3lFr9i0EkZhkc4WcUy2KpYfgJvg62fWPIxEmmpBtaKQKrPFK6Z+ZctSOu3
         /4+A==
X-Gm-Message-State: AOAM531RbCieBSCi/sG9LqfsSkwOGmEZOvshh0czRL/yT7iOy+mheEbB
        wuwAy47tTG3MMjlQmz2BXitDkg==
X-Google-Smtp-Source: ABdhPJyCzApM7SxOD6qLE24HP6u9ZmMb9IkUQpy5EIL4mvYrNsyM5e0/drq5Jw9qkh7PfEPXvFnWOA==
X-Received: by 2002:a62:b410:0:b029:1a4:7868:7e4e with SMTP id h16-20020a62b4100000b02901a478687e4emr1077767pfn.62.1612468227717;
        Thu, 04 Feb 2021 11:50:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f127sm1167563pgc.48.2021.02.04.11.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:50:26 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:50:26 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
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
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v19 6/7] x86/vdso/32: Add ENDBR32 to __kernel_vsyscall
 entry point
Message-ID: <202102041150.C7BC3B6@keescook>
References: <20210203225902.479-1-yu-cheng.yu@intel.com>
 <20210203225902.479-7-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225902.479-7-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:59:01PM -0800, Yu-cheng Yu wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> Add ENDBR32 to __kernel_vsyscall entry point.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
