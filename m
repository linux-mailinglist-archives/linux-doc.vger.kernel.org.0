Return-Path: <linux-doc+bounces-81189-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JogGBTbw2lwuQQAu9opvQ
	(envelope-from <linux-doc+bounces-81189-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:54:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F335F325419
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E925B3006811
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 12:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58001A239A;
	Wed, 25 Mar 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG3bMsLh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313018D636;
	Wed, 25 Mar 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442760; cv=none; b=OY9W2Xq0rP9kcAz0B871g5gVzl0vMy295Hl3mEYrRvmQ3uZsrZEhzWZH5u40QGyTvWCljmIqrANvHZRScsaIm87Vj5xlUdByprwzBUaHVxSbTfOrfp191yhybNvxGN4FbJR4vh8vGoC6rBpygn+O9yLYy8l9XGcqDw1swTOCEyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442760; c=relaxed/simple;
	bh=7ttRJXbfw+Yv4qAT4gpjMx4T7NHp7xtdESE4jaBbZxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxTj6qcxn1LbSzldUTvjShs6m5zeUOJZPgBB6Z3oVmekiZG27cRSDL/FsLyCFqqP4nFbhHhuW34i+zuTc0ydfJarWe2+oYiSiCbFvPf+XITdFh2KbCAz3zENW6MAytxe1oxsq5MOm6DeDRLnBp5xeexR7tJjaj9RKQ/kU8j57VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG3bMsLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA9C4CEF7;
	Wed, 25 Mar 2026 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774442760;
	bh=7ttRJXbfw+Yv4qAT4gpjMx4T7NHp7xtdESE4jaBbZxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG3bMsLh6HCQxQcKJrfEnzOoZhP82Xjrda7S/eNCVSEBNZvxdm2YZqh2m9sA3CULn
	 XWgljFRwXq8kUexSTlQTO7mKgnQ7jtUBvM57pSozyG6fy2vtqkYwD9oWC2h6SyMJBR
	 PZ5lsIw7hJsDyZpu8mSfoilJOwnvIwoMI0THH8LfvoWFeW47xrJ4rlx/EriraMBJSm
	 I5jT61QOiR70EAG1wmLbuQ3byPymfOHZiFk6Z2EgOBeDCaeHsN2RVHV+piagZQGyH9
	 y4XG2CdpJ0Uz8OFnEIDW8rQBquMakxznVFPTbX8nX8W2R0T6e5sY7RfHLZKUfClXOQ
	 Wnu7TLF5BDnmQ==
Date: Wed, 25 Mar 2026 13:45:57 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <acPZBRThz7g_6EXe@localhost.localdomain>
References: <20250809094247.8384-1-frederic@kernel.org>
 <20260320151036.v_Sn93P-@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320151036.v_Sn93P-@linutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81189-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,localhost.localdomain:mid]
X-Rspamd-Queue-Id: F335F325419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le Fri, Mar 20, 2026 at 04:10:36PM +0100, Sebastian Andrzej Siewior a écrit :
> On 2025-08-09 11:42:47 [+0200], Frederic Weisbecker wrote:
> > --- /dev/null
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -0,0 +1,338 @@
> You could start with
> 
> .. SPDX-License-Identifier: GPL-2.0
> 
> at the top.

Ok.

> 
> > +=============
> > +CPU Isolation
> > +=============
> …
> > +Interface
> > +~~~~~~~~~
> > +
> > +- :ref:`Documentation/admin-guide/cgroup-v2.rst <Cpuset v2 "isolated"
> > +  partitions>`
> 
> I've been told by Jonathan once to just use the .rst file without
> anything around it and the HTML render will make the link on its own.
> 
> …

Hmm, how would that look like? Just this?

+- Documentation/admin-guide/cgroup-v2.rst

> 
> > +Tradeoffs
> > +~~~~~~~~~
> > +
> > +In terms of cost, this is the most invasive isolation feature. It is
> > +assumed to be used when the workload spends most of its time in
> > +userspace and doesn't rely on the kernel except for preparatory
> > +work because:
> > +
> > +- RCU is slower due to the locked, offloaded and threaded callbacks
> > +  processing (the same that would be obtained with "rcu_nocb=" boot
> > +  parameter).
> 
> You mean the callback invocation is delayed? It shouldn't affect grace
> period handling and so on.
> 
> …

Right.

> 
> > +Checklist
> > +=========
> > +
> > +You have set up each of the above isolation features but you still
> > +observe jitters that trash your workload? Make sure to check a few
> > +elements before proceeding.
> > +
> > +Some of these checklist items are similar to those of real time
> > +workloads:
> > +
> > +- Use mlock() to prevent your pages from being swapped away. Page
> > +  faults are usually not compatible with jitter sensitive workloads.
> > +
> > +- Avoid SMT to prevent your hardware thread from being "preempted"
> > +  by another one.
> > +
> > +- CPU frequency changes may induce subtle sorts of jitter in a
> > +  workload. Cpufreq should be used and tuned with caution.
> > +
> > +- Deep C-states may result in latency issues upon wake-up. If this
> > +  happens to be a problem, C-states can be limited via kernel boot
> > +  parameters such as processor.max_cstate or intel_idle.max_cstate.
> > +
> 
> I intended to make a similar list similar to this for the real time part
> but it somehow faded away. There is now the idea to identify kernel
> options which are not so optimal which include CPU frequency for
> instance. The requirements here are should be the same.

We should probably have this to a seperate file that both isolation and rt could
link to?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

