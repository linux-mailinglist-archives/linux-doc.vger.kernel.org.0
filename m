Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11118549A
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2019 22:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389488AbfHGUpd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Aug 2019 16:45:33 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44498 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388866AbfHGUpd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Aug 2019 16:45:33 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so42488009plr.11
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2019 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nVq2Lrz4oly1cbME+ru7uC/EUuUzNyfifYdkSD+WXws=;
        b=SKjwZ75o/bjl3P6himFnL+2MJNzMb2KlU9PecY9gL2OvoO+kAS5KzKleoxU5N6Eozn
         KPw8Qn8ix5JOtTRWXYGTvhdvMcOzAtYMnblQFIQJIJh/bMOFzKoN5j4jAbdrYEbb6aWF
         i4sTmbSnKu/H2O6vxlszhwMU0BMjebOmFC5TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nVq2Lrz4oly1cbME+ru7uC/EUuUzNyfifYdkSD+WXws=;
        b=DLuA/3x0bU4U5Rwh2h63z1iP/I1fIWnFa9juCDNB7pTzR2tPnje6M7qFqq26fzrrsb
         0DaMuxixp4KqBrkssJ9BXefLhRnjX/1vfNqCM9tZSaLd0sFj8hKurhff95biJwYqccq9
         zA8dKKJCI6zkhljHvhUC9Gpti4y+fF3auEAlYRcBYqh8VKZRuFMxjPOD31uFskJceL3a
         5tiorqeYxt7m1W8ivZe92Tc/Tnof0fUcmQamTSP03k4x34qOAaN96pWNkWUqzFlvIs1N
         gYZDZ4z0BVcaL0WIJLeaUuTix9kjr3FW3t59G40S3sknyk06fghnWyibjBUrzXyqVMy7
         +6+g==
X-Gm-Message-State: APjAAAVQEg1lUxpENS5nW491T1/weyQcospForslgmdDMA46mXYb9vc6
        0me3aZWXVPagKCPNYx75/DNCVg==
X-Google-Smtp-Source: APXvYqyVsQ2rxzfkbsU4s/td7a6F6w6wqVCgyV/YFH3HkbntL96f95eC7uJQ7+msGgxczb30VirUZA==
X-Received: by 2002:a17:902:145:: with SMTP id 63mr10208710plb.55.1565210732270;
        Wed, 07 Aug 2019 13:45:32 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id s22sm99446893pfh.107.2019.08.07.13.45.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 13:45:31 -0700 (PDT)
Date:   Wed, 7 Aug 2019 16:45:30 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Brendan Gregg <bgregg@netflix.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Hansen <chansen3@cisco.com>, dancol@google.com,
        fmayer@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@kernel.org,
        namhyung@google.com, paulmck@linux.ibm.com,
        Robin Murphy <robin.murphy@arm.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, surenb@google.com,
        Thomas Gleixner <tglx@linutronix.de>, tkjos@google.com,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 1/6] mm/page_idle: Add per-pid idle page tracking
 using virtual index
Message-ID: <20190807204530.GB90900@google.com>
References: <20190807171559.182301-1-joel@joelfernandes.org>
 <20190807130402.49c9ea8bf144d2f83bfeb353@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807130402.49c9ea8bf144d2f83bfeb353@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 07, 2019 at 01:04:02PM -0700, Andrew Morton wrote:
> On Wed,  7 Aug 2019 13:15:54 -0400 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:
> 
> > In Android, we are using this for the heap profiler (heapprofd) which
> > profiles and pin points code paths which allocates and leaves memory
> > idle for long periods of time. This method solves the security issue
> > with userspace learning the PFN, and while at it is also shown to yield
> > better results than the pagemap lookup, the theory being that the window
> > where the address space can change is reduced by eliminating the
> > intermediate pagemap look up stage. In virtual address indexing, the
> > process's mmap_sem is held for the duration of the access.
> 
> So is heapprofd a developer-only thing?  Is heapprofd included in
> end-user android loads?  If not then, again, wouldn't it be better to
> make the feature Kconfigurable so that Android developers can enable it
> during development then disable it for production kernels?

Almost all of this code is already configurable with
CONFIG_IDLE_PAGE_TRACKING. If you disable it, then all of this code gets
disabled.

Or are you referring to something else that needs to be made configurable?

thanks,

 - Joel

