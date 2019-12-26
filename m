Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3087612AB3C
	for <lists+linux-doc@lfdr.de>; Thu, 26 Dec 2019 10:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfLZJ0O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Dec 2019 04:26:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:55464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfLZJ0O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Dec 2019 04:26:14 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA2AA20828;
        Thu, 26 Dec 2019 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577352372;
        bh=6asAChZGLqkA6kNuizNIWoIAN2lunfQ0xFCnSMNqwvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GDEijHdH+fS2OpJ8NizE3hyQLJMY7yVxc6vR8dsGzeVCgPbbShA69taRiT00O2/Q/
         eYVHv071VAMVsV58S2RK4tfqDrqIX/ifiHfUexpBx69iQ9bIXU/r4CPiWQPpJNBLcZ
         6myeBCBMdGencmtdph9n1UWcRWDVcpHjmXCS8EvY=
Date:   Thu, 26 Dec 2019 18:26:07 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 3/3] arm64: implement KPROBES_ON_FTRACE
Message-Id: <20191226182607.06770598a00507090a046951@kernel.org>
In-Reply-To: <20191226121108.0cd1b078@xhacker.debian>
References: <20191225172625.69811b3e@xhacker.debian>
        <20191225173001.6c0e3fb2@xhacker.debian>
        <20191226115707.902545688aa90b34e2e550b3@kernel.org>
        <20191226110348.146bb80b@xhacker.debian>
        <20191226121108.0cd1b078@xhacker.debian>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 26 Dec 2019 04:25:24 +0000
Jisheng Zhang <Jisheng.Zhang@synaptics.com> wrote:

> > > > +/*
> > > > + * In arm64 FTRACE_WITH_REGS implementation, we patch two nop instructions:
> > > > + * the lr saver and bl ftrace-entry. Both these instructions are claimed
> > > > + * by ftrace and we should allow probing on either instruction.  
> > >
> > > No, the 2nd bl ftrace-entry must not be probed.
> > > The pair of lr-saver and bl ftrace-entry is tightly coupled. You can not
> > > decouple it.  
> > 
> > This is the key. different viewing of this results in different implementation.
> > I'm just wondering why are the two instructions considered as coupled. I think
> > here we met similar situation as powerpc: https://lkml.org/lkml/2019/6/18/646
> > the "mflr r0" equals to lr-saver here, branch to _mcount equals to bl ftrace-entry
> > could you please kindly comment more?
> > 
> > Thanks in advance
> > 
> 
> hmm, I think I may get some part of your opinion. In v7 implementation:
> 
> if probe on func+4, that's bl ftrace-entry, similar as mcount call on
> other architectures, we allow this probe as normal.
> 
> if probe on func+0, the first param ip in kprobe_ftrace_handler() points
> to func+4(this is adjusted by ftrace), regs->ip points to func+8, so in
> kprobe_ftrace_handler() we modify regs->ip to func+0 to call kprobe
> pre handler, then modify regs->ip to func+8 to call kprobe post handler.
> As can be seen, the first two instructions are considered as a virtual
> mcount call. From this point of view, lr saver and the bl <ftrace-entry>
> is coupled.

Yes, this is good. But probing on func+4 is meaningless. Both func+0 and
func+4 call a handler with same pt_regs. And it should have the stack
pointer which is NOT modified by lr-saver and regs->lr must point original
call address. (ftrace regs caller must do this fixup for supporting live
patching correctly)

And in this case, func+4 has fake pt_regs because it skips lr-saver's
effects.

And even if you fixed up the pt_regs, there is another problem of what
user expects on the target instructions.

As you know, dynamic ftrace will fill the instruction with NOP (2 NOPs
in arm64), in this case, maybe pt_regs are same except pc on func+0 and
func+4. But if ftrace already enabled on the function, user will see
there are lr-saver and bl, oops. In this case we have to change pt_regs
between func+0 and func+4. So it depends on the current mode.

However, IMHO, it is not worth to pay such simulation cost. No one want
to probe such simulated intermediate address. It is easy to expect the
result from the code. Moreover, the func+4 will not appear on debuginfo
because those 2 special insturctions are just appended by the compiler,
not generated by the code.

So I don't think we need to support func+4. We only need func+0, or func+8
(this must be same as func+0 except regs->pc anyway)

Thank you,

> 
> If we split patch3 into two:
> one to support kprobes func+4
> the second to support kprobe on func+0
> it would be much clearer.
> 
> Then the key here is whether we could allow both kprobes on func+0 and func+4
> 
> Thanks


-- 
Masami Hiramatsu <mhiramat@kernel.org>
