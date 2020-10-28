Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7D629E0DB
	for <lists+linux-doc@lfdr.de>; Thu, 29 Oct 2020 02:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgJ1WDB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Oct 2020 18:03:01 -0400
Received: from foss.arm.com ([217.140.110.172]:38790 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729329AbgJ1WCQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2E021A25;
        Wed, 28 Oct 2020 07:55:19 -0700 (PDT)
Received: from e107158-lin (unknown [10.1.194.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 929253F66E;
        Wed, 28 Oct 2020 07:55:18 -0700 (PDT)
Date:   Wed, 28 Oct 2020 14:55:16 +0000
From:   Qais Yousef <qais.yousef@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Trilok Soni <tsoni@codeaurora.org>,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] smp: Add bootcpus parameter to boot subset of CPUs
Message-ID: <20201028145516.23lm66mora5b3wqr@e107158-lin>
References: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
 <87v9f04n8r.fsf@nanos.tec.linutronix.de>
 <a6d7f84679240fcf580520230a88c058@codeaurora.org>
 <20201026171224.GV2611@hirez.programming.kicks-ass.net>
 <a9fa1f8d-52c7-adca-9087-160b1ecda6b8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9fa1f8d-52c7-adca-9087-160b1ecda6b8@codeaurora.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Elliot

+ Sudeep

On 10/27/20 10:06, Elliot Berman wrote:
> 
> On 10/26/2020 10:12 AM, Peter Zijlstra wrote:
> > On Mon, Oct 26, 2020 at 10:08:47AM -0700, psodagud@codeaurora.org wrote:
> > > On 2020-10-23 14:59, Thomas Gleixner wrote:
> > > > On Thu, Oct 22 2020 at 15:04, Elliot Berman wrote:
> > > > > In a heterogeneous multiprocessor system, specifying the 'maxcpus'
> > > > > parameter on kernel command line does not provide sufficient control
> > > > > over which CPUs are brought online at kernel boot time, since CPUs may
> > > > > have nonuniform performance characteristics. Thus, add bootcpus kernel
> > > > > parameter to control which CPUs should be brought online during kernel
> > > > > boot. When both maxcpus and bootcpus is set, the more restrictive of
> > > > > the
> > > > > two are booted.
> > > > 
> > > > What for? 'maxcpus' is a debug hack at best and outright dangerous on
> > > > certain architectures. Why do we need more of that? Just let the machine
> > > > boot and offline the CPUs from user space.
> > > 
> > > Hi Thomas and Peter,
> > > 
> > > Based on my understanding with maxcpus option provides, maximum no of CPUs
> > > are brough up during the device boot up. There is a different case, in which
> > > we want to restrict which CPUs to be brough up.
> > > On a system with 8 cpus, if we set maxcpus as 3, cpu0, cpu1, and cpu2 are
> > > brough up during the bootup.  For example, if we want to bring core0, core3
> > > and core4 current maxcpu(as 3) setting would not help us.
> > > On some platform we want the flexibility on which CPUs to bring up during
> > > the device bootup. bootcpus command line is helping to bring specific CPUs
> > > and these patches are working downstream.
> > 
> > That's a lot of words, but exactly 0 on _WHY_ you would want to do that.
> > 
> 
> We find the ability to limit the number of cpus brought online at bootup
> useful, and to possibly later enable those cores. One use case is when
> device is undergoing initial testing is to use bootcpus to limit bootup to
> only a couple cores and later bring up the other cores for a controlled
> stress test. A core brought up during boot is also running device
> initialization. Besides being useful for SoC vendor bringup which typically
> occurs downstream, this particular use case could be exercised by developer
> of upstream support for a SoC when initial CPU settings are being
> determined.
> 
> Another use case is if user wishes to limit bootup only to the smaller or
> bigger cores. maxcpus= is not sufficient here to ensure that only those
> cores are booted since it limits only to the first N cores, which may not be
> the desired small or big cores. User may want to bring up only the smaller
> cores during bootup for thermal reasons. For instance, device may be later
> sufficiently charged such that boot up of the bigger cores is now
> permissible. Relying on thermal drivers to later take care of putting core
> into lower power idle may not occur until much later in boot (for instance,
> if the governor is a module).

I would have thought that FW/SCP would have the power to block booting up the
CPUs if it deemed that to be unsafe.

Any thoughts Sudeep?

Thanks

--
Qais Yousef
