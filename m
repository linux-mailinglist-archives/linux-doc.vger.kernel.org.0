Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1922A162FC6
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2020 20:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgBRTX0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Feb 2020 14:23:26 -0500
Received: from namei.org ([65.99.196.166]:46600 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgBRTXZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 18 Feb 2020 14:23:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id 01IJMet4013185;
        Tue, 18 Feb 2020 19:22:40 GMT
Date:   Wed, 19 Feb 2020 06:22:40 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
cc:     Serge Hallyn <serge@hallyn.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Will Deacon <will@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Jiri Olsa <jolsa@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        oprofile-list@lists.sf.net,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
Subject: Re: [PATCH v7 03/12] perf/core: open access to probes for CAP_PERFMON
 privileged process
In-Reply-To: <3364fa26-b5d1-1808-aaee-c057f26e0eb4@linux.intel.com>
Message-ID: <alpine.LRH.2.21.2002190622300.10165@namei.org>
References: <c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com> <3364fa26-b5d1-1808-aaee-c057f26e0eb4@linux.intel.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 Feb 2020, Alexey Budankov wrote:

> 
> Open access to monitoring via kprobes and uprobes and eBPF tracing for
> CAP_PERFMON privileged process. Providing the access under CAP_PERFMON
> capability singly, without the rest of CAP_SYS_ADMIN credentials,
> excludes chances to misuse the credentials and makes operation more
> secure.
> 
> perf kprobes and uprobes are used by ftrace and eBPF. perf probe uses
> ftrace to define new kprobe events, and those events are treated as
> tracepoint events. eBPF defines new probes via perf_event_open interface
> and then the probes are used in eBPF tracing.
> 
> CAP_PERFMON implements the principal of least privilege for performance
> monitoring and observability operations (POSIX IEEE 1003.1e 2.2.2.39
> principle of least privilege: A security design principle that states
> that a process or program be granted only those privileges (e.g.,
> capabilities) necessary to accomplish its legitimate function, and only
> for the time that such privileges are actually required)
> 
> For backward compatibility reasons access to perf_events subsystem
> remains open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN
> usage for secure perf_events monitoring is discouraged with respect to
> CAP_PERFMON capability.
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

