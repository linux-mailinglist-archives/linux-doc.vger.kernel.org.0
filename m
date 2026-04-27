Return-Path: <linux-doc+bounces-84806-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLWGouU72ktDAEAu9opvQ
	(envelope-from <linux-doc+bounces-84806-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 18:53:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8B476AF4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 18:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2CAE3043539
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2423D9DAC;
	Mon, 27 Apr 2026 16:49:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF3C34D901;
	Mon, 27 Apr 2026 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308588; cv=none; b=utbzXILHHzN79JPSsUFeluiTRr37YelCIr2tJ373vjV5gl5lbIVev02WD4KiMVyLptDWCINuXrIicRMIBH+vcRX7ssZQZ6D3KbXyq/CJqxkPcnx8njDK9C2Wd552DSZEQmGWVIqr/OzjHBurzWF5zIZtOKDSZ+GtZgf4vuk8fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308588; c=relaxed/simple;
	bh=GD+FWSrLGI2MA69Dj9+jLdx8fRUxq0j4IKM4VhNhstQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uagamFZrGKK1Z6LF1GGlVPK8gzT2/bcF9/dEl9h8WIyxfZ76nBHE7Z5KL4Wwr9YBsZFsd7x/bF8BghqDZNR+Y3PNQGTud3efs1NRl0H6BLffkHrFq+CcJCZ75iASZe9KyOFFsndwEqOJWdmrnIcxb+QnTQIBv5Gfv78w+Qc5rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 7F598C0360;
	Mon, 27 Apr 2026 16:49:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 0C4AF60011;
	Mon, 27 Apr 2026 16:49:37 +0000 (UTC)
Date: Mon, 27 Apr 2026 12:49:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marcelo
 Tosatti <mtosatti@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Phil
 Auld <pauld@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin
 Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org, Bagas Sanjaya
 <bagasdotme@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, John Ogness
 <john.ogness@linutronix.de>
Subject: Re: [PATCH] Documentation/kernel-parameters: Remove "Deprecated"
 from isolcpus=
Message-ID: <20260427124950.012d0d42@gandalf.local.home>
In-Reply-To: <20260427150739.bwVmmkj2@linutronix.de>
References: <20260427150739.bwVmmkj2@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ueewz8dhbfdriwgwh79ot1741w4ea5eh
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+KrldTU+oRxmwita6pgl4nJxxng3F61ag=
X-HE-Tag: 1777308577-201242
X-HE-Meta: U2FsdGVkX1+A+tRtBD/TBOHWy8sBfv3FhwYACpGyoKtmyrGDtX4tQ1IIEPYVeIykdryo0/O8UiJX0SXx6lOSdOsZucHE4gwpuwOcMnaUtAvOQDxWt03s+eo89N7zrTMEPfuDY46j2BCeXBxFNM+a0NU2tPLSMqqygy355NR2r/7Q/+/CgqXfdjoWMvfOYQi+cj11ake/SvV6s4NiG/FzTzjw2giOTdKtkIQxyiUNMir0L/dF3fDXF6fvkvKuShnQO1gsaaeYrMiZrp46OYR2xQMY1KlrVBj4yL1ecRP1txtzsBnIB2YJjw30JYsF1pv+Ns1GpkfNXi7Zhe9+KXR4nq81LQGFdGLeO+qlOeXQUR+XleqS1hUgD/xJHe2xqFK/
X-Rspamd-Queue-Id: C0F8B476AF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,redhat.com,lwn.net,suse.com,infradead.org,linutronix.de,suse.cz,gmail.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-84806-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gandalf.local.home:mid,goodmis.org:email]

On Mon, 27 Apr 2026 17:07:39 +0200
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> The isolcpus= option has been marked as deprecated in 2017. Back then it
> was desired for the domain sub option to be configured dynamically at
> runtime instead using this boot command line which provides a static
> configuration. In the meantime this option was extended by other sub
> options which don't have runtime counterpart or it does not make sense
> to provide one.
> 
> The deprecated part always referred to the default `domain' sub option
> but it was not obvious. Also the reasoning behind the deprecation is
> sort of dubious: There is nothing wrong with a static configuration if
> there is no desired to reconfigure. This is useful on systems which
> have one purpose and the CPU partition configuration is not changed for
> the entire lifetime.
> 
> Remove the "Deprecated" note. Remove the part of the description which
> suggest to use cpuset.sched_load_balance and instead point to the
> documentation file which explains how to use cpusets to configure this
> at runtime.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

