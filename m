Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C653B8BC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2019 17:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404039AbfFJPzy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Jun 2019 11:55:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:5731 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403791AbfFJPzx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Jun 2019 11:55:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 08:55:52 -0700
X-ExtLoop1: 1
Received: from yyu32-desk1.sc.intel.com ([143.183.136.147])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2019 08:55:51 -0700
Message-ID: <e1543e7beb0eb55d6febcd847ccab9b219e60338.camel@intel.com>
Subject: Re: [PATCH v7 03/14] x86/cet/ibt: Add IBT legacy code bitmap setup
 function
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Pavel Machek <pavel@ucw.cz>, Dave Hansen <dave.hansen@intel.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
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
        Oleg Nesterov <oleg@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
Date:   Mon, 10 Jun 2019 08:47:45 -0700
In-Reply-To: <20190608205218.GA2359@xo-6d-61-c0.localdomain>
References: <20190606200926.4029-1-yu-cheng.yu@intel.com>
         <20190606200926.4029-4-yu-cheng.yu@intel.com>
         <20190607080832.GT3419@hirez.programming.kicks-ass.net>
         <aa8a92ef231d512b5c9855ef416db050b5ab59a6.camel@intel.com>
         <20190607174336.GM3436@hirez.programming.kicks-ass.net>
         <b3de4110-5366-fdc7-a960-71dea543a42f@intel.com>
         <20190608205218.GA2359@xo-6d-61-c0.localdomain>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 2019-06-08 at 22:52 +0200, Pavel Machek wrote:
> Hi!
> 
> > > I've no idea what the kernel should do; since you failed to answer the
> > > question what happens when you point this to garbage.
> > > 
> > > Does it then fault or what?
> > 
> > Yeah, I think you'll fault with a rather mysterious CR2 value since
> > you'll go look at the instruction that faulted and not see any
> > references to the CR2 value.
> > 
> > I think this new MSR probably needs to get included in oops output when
> > CET is enabled.
> > 
> > Why don't we require that a VMA be in place for the entire bitmap?
> > Don't we need a "get" prctl function too in case something like a JIT is
> > running and needs to find the location of this bitmap to set bits itself?
> > 
> > Or, do we just go whole-hog and have the kernel manage the bitmap
> > itself. Our interface here could be:
> > 
> > 	prctl(PR_MARK_CODE_AS_LEGACY, start, size);
> > 
> > and then have the kernel allocate and set the bitmap for those code
> > locations.
> 
> For the record, that sounds like a better interface than userspace knowing
> about the bitmap formats...
> 									Pavel

Initially we implemented the bitmap that way.  To manage the bitmap, every time
the application issues a syscall for a .so it loads, and the kernel does
copy_from_user() & copy_to_user() (or similar things).  If a system has a few
legacy .so files and every application does the same, it can take a long time to
boot up.

Yu-cheng

