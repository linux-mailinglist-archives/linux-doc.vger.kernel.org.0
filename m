Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2273036E045
	for <lists+linux-doc@lfdr.de>; Wed, 28 Apr 2021 22:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241960AbhD1Ua7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Apr 2021 16:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240236AbhD1Ua7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:30:59 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22F8C06138C
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:30:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so9741113pja.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P+vKZ+ijBuTYKlW4ksMgx+Vfg6fzuznEGR/mj5GiueA=;
        b=cjFidoHrwQOs6nvggZcyJHPrqy+fC3lyB+khjXw8XuHUFFpmXhDbTFYt4Z0pcBKzIu
         +pYRKW5ncOZPFtP4kJPVLZD6RWZVY/45yIeJMmu7wv3lRl6oGjQUu/+MiO4G0VaeNB52
         7LZlajzspTx8tLP+6aHqhBrlwyTRwrLFleo7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P+vKZ+ijBuTYKlW4ksMgx+Vfg6fzuznEGR/mj5GiueA=;
        b=gnmGxVe8fMDMvYdl56rrEGlajly0D8Bq4EcnLOqHuw0JpgUulVM6I79sj+4EiqHv1h
         UHkjlyETOT9nRqtycz65B67dbSqwH0EnxmJMjMH+FTGmZ2mkIFekxZWNDvS4DjqYK3ck
         x9a3r6ufJ8A7CFSk57NK0osW5fQOLK7Dkj2e8jQ1wMsE917fI7DjNNfeSEat17kiGLjT
         FAyS0YK6bd/l5gF9jcaMZ2wP7qwgAHSq7DGhDD8rGPdl9j+A3yBZw4Hb8tArwglxwX29
         pq403oFcszb2yBFGAFFcb26FiBINsJ9Uivlyr8VX2XRU46kSWhUwZ/XXp0hGw0MC6G3R
         qhnw==
X-Gm-Message-State: AOAM533bJb1VSuwWG1Jvp/clkUcaf3YRmM81K0EHDhLprNGniOqFSQvJ
        9eFASHNY/7/ILwzwrbTFxOMpng==
X-Google-Smtp-Source: ABdhPJyBQNS6Zhg9r+1Ydyw6DrEvZh5KvBBtP08tgx1YOKud2zKIe07WgXGa7qTG+VtPhaq9gdPUog==
X-Received: by 2002:a17:902:8601:b029:e6:7b87:8add with SMTP id f1-20020a1709028601b02900e67b878addmr32266307plo.3.1619641812285;
        Wed, 28 Apr 2021 13:30:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i20sm318571pjz.48.2021.04.28.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:30:11 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:30:10 -0700
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
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v26 2/9] x86/cet/ibt: Add user-mode Indirect Branch
 Tracking support
Message-ID: <202104281330.4269E2B@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-3-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-3-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:13PM -0700, Yu-cheng Yu wrote:
> Introduce user-mode Indirect Branch Tracking (IBT) support.  Add routines
> for the setup/disable of IBT.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
