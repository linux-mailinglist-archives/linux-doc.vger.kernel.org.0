Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73CE30FD50
	for <lists+linux-doc@lfdr.de>; Thu,  4 Feb 2021 20:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhBDTvC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Feb 2021 14:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237980AbhBDTul (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:50:41 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF35C0613D6
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:50:01 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d26so1534687pfn.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGpFXYKJAyY687eckGJmRvP0PWeimiXLgNP+xU7/nqo=;
        b=jNNn3+1W3q2GnDkbDg5t75Hoqqb6seGdjr7W6ch2OjxIYQ+lEj9RXyDW8vL2LnL17O
         7p4KUfwWEJhn1xLRJXFWJ4/XLv358OAS0rDOQxTuyiD+CqW3xrLuas3TWxdLSS2H7Xb5
         ku1U3RHyZzcqD1+7uVRUTDF5v4lSLOACpHUeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGpFXYKJAyY687eckGJmRvP0PWeimiXLgNP+xU7/nqo=;
        b=D1w/ae7uH0uIPah3v3Q2+RXo/sUTIqdZ9puNBYBi+3kem8/8QB2sXzrKBoqBUuucIA
         eUvg+/+dNELQoOTUhtokCW+QPsnlDGqEkBLkUehGN4pFoFLEnukuTotg/VpO7a77MSx7
         8xelwAIK+neZ8F09ieLEFUwwIc2Im0Y1NlmhrfCET8kv1Ba2wMSCk9JCE2IIZ6apyRVa
         s1PqRlzAcE3BVvFZfOVTHFtdpyB+QdN575yhzMZLFtiSTbZFJ4UbFTDJFClkZ7SZC+Tq
         bcGSuBM2QgFlb99GmghHBS/ckoUiyi+XPIxIp0eqcWq+XaZIsKeEQQZN4mUFBoeVEfmD
         XmMQ==
X-Gm-Message-State: AOAM532oJBpRCH+0JXzgED1syTGa/CJqlQKe93e5BLw3l0GDZalF7JPZ
        CSffC/dBRaGxqFZYLRaiZn5K9w==
X-Google-Smtp-Source: ABdhPJy5N6yshiiKOkoPYx0cJNX+OaE9hEUPv9SEHAC+Nz8m2HAkwuR8P/TY+xrcUega9fpe8DszDQ==
X-Received: by 2002:a65:6886:: with SMTP id e6mr588022pgt.73.1612468201098;
        Thu, 04 Feb 2021 11:50:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j5sm6035843pjf.47.2021.02.04.11.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:49:59 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:49:58 -0800
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
Subject: Re: [PATCH v19 1/7] x86/cet/ibt: Update Kconfig for user-mode
 Indirect Branch Tracking
Message-ID: <202102041149.8B30B1E@keescook>
References: <20210203225902.479-1-yu-cheng.yu@intel.com>
 <20210203225902.479-2-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225902.479-2-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:58:56PM -0800, Yu-cheng Yu wrote:
> Indirect branch tracking is a hardware security feature that verifies near
> indirect call/jump instructions arrive at intended targets, which are
> labeled by the compiler with ENDBR opcodes.  If such instructions reach
> unlabeled locations, the processor raises control-protection faults.
> 
> Check the compiler is up-to-date at config time.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
