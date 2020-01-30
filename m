Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C510514E33C
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2020 20:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgA3T2s (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 14:28:48 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39559 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgA3T2s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 14:28:48 -0500
Received: by mail-pf1-f195.google.com with SMTP id 84so1994844pfy.6
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eWfrZ/xjnp4Ak3zEcjYTfRHaTAYKUcqb9pMEB5EKCt8=;
        b=IM7SwiKq1+WKnW7tzkjGOWGm7quhPQSUwZCtVZ+zyJSGAvSLHvqr/P9aTRY6yJTUam
         IuFDtAXfaJxv8V8DnZnGfhMc0nL9NXW6QJp4lDqOBK0AhZcY61+OCM7OuUf4LZUMmRvz
         uF64Ssb5/OxRKUZLOQ3gRuBRC7D8IA8NZAQ8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eWfrZ/xjnp4Ak3zEcjYTfRHaTAYKUcqb9pMEB5EKCt8=;
        b=hB+dbe3Jozjmfcfe6KhNCbnGu026gmd2zLbmr7XJXHG5IOjyN/LKoe7PPrnzwWUhnP
         DjcH8DYM2i/bULrOZ07xYx6HICcmOYQe2N99EKeXIbnmcIDK8adQDJ6uEZskfEtwz2mq
         U7m6aNN4DMhtsqM2uyVCHx2pVi6BaiYNubte2p//ByI2I8IcZpU4zoT3LNEyf2jfiQZl
         l4ggOd0XY3GZFvZdgwKUYmqLp2pFhSTCrQHi7tb76zTPtspDI0kOvX1K/SuesPHDR3OI
         RYK4n00tZ+ikrdMbzIVBuLeqUPwcJGFnoZ8FOVTJA3fELf3IRBTG1INyMnIQVdbzCL5l
         nHFw==
X-Gm-Message-State: APjAAAXSd+OunPV1ERlpwgWUTKDrzBeKrQJ0bld5LEh7Zb2i5uXLD+6K
        f3CxahGMDIgh4m0wx+x+QUWl0w==
X-Google-Smtp-Source: APXvYqy8iWU4ETKdPcgtnjQ1dePHwCv/Fs0E3cGiUhU9Pn9+s/NNubhU8Y96pkpWrUj3gw0/lS0VpA==
X-Received: by 2002:a63:c511:: with SMTP id f17mr6141537pgd.198.1580412527278;
        Thu, 30 Jan 2020 11:28:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e19sm7197844pgn.86.2020.01.30.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 11:28:46 -0800 (PST)
Date:   Thu, 30 Jan 2020 11:28:45 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Grzegorz Halat <ghalat@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, ssaner@redhat.com, atomlin@redhat.com,
        oleksandr@redhat.com, vbendel@redhat.com, kirill@shutemov.name,
        khlebnikov@yandex-team.ru, borntraeger@de.ibm.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Qian Cai <cai@lca.pw>
Subject: Re: [PATCH 1/1] mm: sysctl: add panic_on_inconsistent_mm sysctl
Message-ID: <202001301128.1CBD1BA52@keescook>
References: <20200129180851.551109-1-ghalat@redhat.com>
 <d47a5f31-5862-b0a9-660c-48105f4f049b@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d47a5f31-5862-b0a9-660c-48105f4f049b@suse.cz>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 30, 2020 at 03:44:50PM +0100, Vlastimil Babka wrote:
> On 1/29/20 7:08 PM, Grzegorz Halat wrote:
> > Memory management subsystem performs various checks at runtime,
> > if an inconsistency is detected then such event is being logged and kernel
> > continues to run. While debugging such problems it is helpful to collect
> > memory dump as early as possible. Currently, there is no easy way to panic
> > kernel when such error is detected.
> > 
> > It was proposed[1] to panic the kernel if panic_on_oops is set but this
> > approach was not accepted. One of alternative proposals was introduction of
> > a new sysctl.
> > 
> > Add a new sysctl - panic_on_inconsistent_mm. If the sysctl is set then the
> > kernel will be crashed when an inconsistency is detected by memory
> > management. This currently means panic when bad page or bad PTE
> > is detected(this may be extended to other places in MM).
> 
> I wonder, should enabling the sysctl also effectively convert VM_WARN...
> to VM_BUG... ?

There is already panic_on_warn sysctl... wouldn't that be sufficient?

-- 
Kees Cook
