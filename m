Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B138174EE8
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2020 19:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCASU6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 Mar 2020 13:20:58 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57374 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgCASU6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Mar 2020 13:20:58 -0500
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1j8TCK-000733-37; Sun, 01 Mar 2020 18:20:16 +0000
Date:   Sun, 1 Mar 2020 19:20:14 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc:     Aleksa Sarai <cyphar@cyphar.com>, Oleg Nesterov <oleg@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Andrei Vagin <avagin@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Yuyang Du <duyuyang@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        David Howells <dhowells@redhat.com>,
        Jann Horn <jannh@google.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shakeel Butt <shakeelb@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christian Kellner <christian@kellner.me>,
        Andrea Arcangeli <aarcange@redhat.com>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH] exec: Fix a deadlock in ptrace
Message-ID: <20200301182014.emo34zwv5vjaydft@wittgenstein>
References: <AM6PR03MB5170B06F3A2B75EFB98D071AE4E60@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <20200301151333.bsjfdjcjddsza2vn@yavin>
 <20200301155829.iiupfihl6z4jkylh@wittgenstein>
 <AM6PR03MB51701494F43B838E49F624C0E4E60@AM6PR03MB5170.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM6PR03MB51701494F43B838E49F624C0E4E60@AM6PR03MB5170.eurprd03.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 01, 2020 at 05:46:08PM +0000, Bernd Edlinger wrote:
> On 3/1/20 4:58 PM, Christian Brauner wrote:
> > On Mon, Mar 02, 2020 at 02:13:33AM +1100, Aleksa Sarai wrote:
> >> On 2020-03-01, Bernd Edlinger <bernd.edlinger@hotmail.de> wrote:
> >>> This fixes a deadlock in the tracer when tracing a multi-threaded
> >>> application that calls execve while more than one thread are running.
> >>>
> >>> I observed that when running strace on the gcc test suite, it always
> >>> blocks after a while, when expect calls execve, because other threads
> >>> have to be terminated.  They send ptrace events, but the strace is no
> >>> longer able to respond, since it is blocked in vm_access.
> >>>
> >>> The deadlock is always happening when strace needs to access the
> >>> tracees process mmap, while another thread in the tracee starts to
> >>> execve a child process, but that cannot continue until the
> >>> PTRACE_EVENT_EXIT is handled and the WIFEXITED event is received:
> >>>
> >>> strace          D    0 30614  30584 0x00000000
> >>> Call Trace:
> >>> __schedule+0x3ce/0x6e0
> >>> schedule+0x5c/0xd0
> >>> schedule_preempt_disabled+0x15/0x20
> >>> __mutex_lock.isra.13+0x1ec/0x520
> >>> __mutex_lock_killable_slowpath+0x13/0x20
> >>> mutex_lock_killable+0x28/0x30
> >>> mm_access+0x27/0xa0
> >>> process_vm_rw_core.isra.3+0xff/0x550
> >>> process_vm_rw+0xdd/0xf0
> >>> __x64_sys_process_vm_readv+0x31/0x40
> >>> do_syscall_64+0x64/0x220
> >>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>>
> >>> expect          D    0 31933  30876 0x80004003
> >>> Call Trace:
> >>> __schedule+0x3ce/0x6e0
> >>> schedule+0x5c/0xd0
> >>> flush_old_exec+0xc4/0x770
> >>> load_elf_binary+0x35a/0x16c0
> >>> search_binary_handler+0x97/0x1d0
> >>> __do_execve_file.isra.40+0x5d4/0x8a0
> >>> __x64_sys_execve+0x49/0x60
> >>> do_syscall_64+0x64/0x220
> >>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>>
> >>> The proposed solution is to have a second mutex that is
> >>> used in mm_access, so it is allowed to continue while the
> >>> dying threads are not yet terminated.
> >>>
> >>> I also took the opportunity to improve the documentation
> >>> of prepare_creds, which is obviously out of sync.
> >>>
> >>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> >>
> >> I can't comment on the validity of the patch, but I also found and
> >> reported this issue in 2016[1] and the discussion quickly veered into
> >> the problem being more complicated (and uglier) than it seems at first
> >> glance.
> >>
> >> You should probably also Cc stable, given this has been a long-standing
> >> issue and your patch doesn't look (too) invasive.
> >>
> >> [1]: https://lore.kernel.org/lkml/20160921152946.GA24210@dhcp22.suse.cz/
> > 
> > Yeah, I remember you mentioning this a while back.
> > 
> > Bernd, we really want a reproducer for this sent alongside with this
> > patch added to:
> > tools/testing/selftests/ptrace/
> > Having a test for this bug irrespective of whether or not we go with
> > this as fix seems really worth it.
> > 
> 
> I ran into this issue, because I wanted to fix an issue in the gcc testsuite,
> namely why it forgets to remove some temp files,
> so I did the following:
> 
> strace -ftt -o trace.txt make check-gcc-c -k -j4
> 
> I reproduced with v4.20 and v5.5 kernel, and I don't know why but it is
> not happening on all systems I tested, maybe it is something that the expect program
> does, because, always when I try to reproduce this, the deadlock was always in "expect".
> 
> I use expect version 5.45 on the computer where the above test freezes after
> a couple of minutes.
> 
> I think the issue with strace is that it is using vm_access to get the parameters
> of a syscall that is going on in one thread, and that races with another thread
> that calls execve, and blocks the cred_guard_mutex.
> 
> While Olg's test case here, will certainly not be fixed:
> 
> https://lore.kernel.org/lkml/20160923095031.GA14923@redhat.com/
> 
> he mentions the access to "anything else which needs ->cred_guard_mutex,
> say open(/proc/$pid/mem)", I don't know for sure how that can be done, but if
> that is possible, it would probably work as a test case.
> 
> What do you think?

Yeah, anything that calls ptrace_may_access() is fine and
open(/proc/$pid/mem) will work so long as $pid is not in the same
thread-group as the caller. A polished version of the reproducer you
linked in would probably be good.
