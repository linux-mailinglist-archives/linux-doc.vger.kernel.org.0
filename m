Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632E335A1B8
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 17:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhDIPK0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 11:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhDIPKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 11:10:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7059C061761
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 08:10:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so10194478lfv.12
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oNSz1PKdAWaiunWiDpAsiCtuqeEjXHTaoBPs5ItyWAE=;
        b=XKiwHwPtFSLFPBXyqYnXuaUD1dPvj4to4yZrsJrQtYtCORZSRWomRGRsyp6QrTWq3N
         Op15EMlzzkqIRyS7dLh9saOhJI/YyASpndMeeyM690qTfzyBLt3+5DW8GS82kh1JsIV9
         qoxyEKTIjPAI7sKvTAdzbldOf9eTkdtOpDC49Fr3nohO8lyrTDzN52HI+UyK/isIoHQD
         krmBwxpWV/paN7/vNjyiuRxLI5rLnt7d14vh/af0S5lGuwafS7l31B/DPptdtmGMvPGF
         FP+T9W/h+g6AMg6EQuTv5xgVeNg0TcY5xyXbaGhbxeNS+k9ynwdA9aQ/nBvVwpB+57mv
         aI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oNSz1PKdAWaiunWiDpAsiCtuqeEjXHTaoBPs5ItyWAE=;
        b=pZW6XY7w8JPxnaClWDGzAMxX9Q79vbQKDE76S5rIFTmDF2+Qhb67LiIn6MjhEEAJIo
         biUK70Nh6WvSOWbe/vVzEzQNJZBl0DLviutd7sbghVnuWgD2U9GVvRwfrpKA16GUE4Tt
         0gIKFW7Dk5AtWTuGFmBuNl7l+8+vJ+DZvSsSS6ECKvO5njBGrozwadNn81aLj3GGakP0
         NxXxb0M/IRp4cePg4IhZSLtb0YSYbxOW3M+okhPLN1mbtabkAT8ZyrrBxhHQ4PzNxRWX
         DwvaQLH28JwzmGsvR0UQIYcOcrJkdNt7phq+Gw2YiAhTh+91kg6BRN8WP6GaG9aqqQ4Z
         ZY8Q==
X-Gm-Message-State: AOAM533rsGKlIBpkxI8XmV7eAeaY0wSTI+BwfyzyJ0SsbX/bhFm2/hIE
        JJPcAFejvtenhJQBuhCmn2Y/aQ==
X-Google-Smtp-Source: ABdhPJxFPLoNZIJRxuni1QeLgtMxBbo+PHtbsv7xZ2SgQPNP9Hir3TR/PO/Q6Cm041srTrTXGzRpDA==
X-Received: by 2002:ac2:5a4e:: with SMTP id r14mr1901328lfn.78.1617981011255;
        Fri, 09 Apr 2021 08:10:11 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id g9sm295692lja.134.2021.04.09.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:10:10 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 18B58102498; Fri,  9 Apr 2021 18:10:10 +0300 (+03)
Date:   Fri, 9 Apr 2021 18:10:10 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
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
        Kees Cook <keescook@chromium.org>,
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
        Haitao Huang <haitao.huang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v24 13/30] mm: Introduce VM_SHADOW_STACK for shadow stack
 memory
Message-ID: <20210409151010.d6r3qazmuw53qnqu@box.shutemov.name>
References: <20210401221104.31584-1-yu-cheng.yu@intel.com>
 <20210401221104.31584-14-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401221104.31584-14-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021 at 03:10:47PM -0700, Yu-cheng Yu wrote:
> A shadow stack PTE must be read-only and have _PAGE_DIRTY set.  However,
> read-only and Dirty PTEs also exist for copy-on-write (COW) pages.  These
> two cases are handled differently for page faults.  Introduce
> VM_SHADOW_STACK to track shadow stack VMAs.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
