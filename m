Return-Path: <linux-doc+bounces-93669-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4OsNutGPmr9CQkAu9opvQ
	(envelope-from <linux-doc+bounces-93669-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 11:31:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 420926CBB51
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 11:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=nm3p8Clh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93669-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93669-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B09E63014121
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618473E5A1D;
	Fri, 26 Jun 2026 09:28:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C33E8C70;
	Fri, 26 Jun 2026 09:28:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466108; cv=none; b=oaIAjr8ln+/v3TXfzyA5OYPbttVZ/dwKGCIo4cyi2YVxaGOGgzaKIWviGgL/KqcOzWuLLg76NKviHfqpn2V9mo+bG7d56QX0QMw4qhFGJXog5oFu8FN4PrOOGZ0ukyb2KCZJMACh8nHs/Kh1LVh1smds7BoFgWLSLowN5Ec6xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466108; c=relaxed/simple;
	bh=co/O9zH/3HCuaBvQPzQhKVDhsZlKxGnkh+dGrVIWTjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mt7leR2wk2y/b/oxim/V8dff6WzOBvsiCyDkOL+dxPxoHtUbIgI6Fl96zNfBr99ZKd+wY0Q4NasYngTF5ADx7+AXrSx8eBbfNHlHEfGlFYnZdvYOM8cpYGYV9wikBTFeBOteJTGMFQwpQSNbAhSWGiI2im5/oj9pPuGrx+0E0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nm3p8Clh; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JtpPtzl/3db5DvMog9C4lhXRmHQaSLV/aY4gzRkyqyQ=; b=nm3p8ClhstKodsxbB9ptZ//cL5
	rLc8c3knV4V4CFJfb8dINjMkR9a3gcLfHfZa5oid8V7nASc+Hii1fdkSZLaG7itlaCjhJt5pdL1Mz
	Zihv0fH1egCCogGMXDoOx+He5lB3YtvYiyp13zAHDtMTH9e1dhGvvBMah6JrnK377bFxWd+ZtTFTX
	VTuSwlpep7otLVgzo/ceA+e7agWnqJwHQH+ZrARZr8+ivIDMc31e8V1xtR8r/fPCjw9K586Fhk3PU
	AVU778wu0/6hV8t9Qqjk2at8wKOC+3kct/cWo9irjcBp8utk3VbjDr4lRbw4aVWPLG3WWks+MCsHS
	SFwliYCw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2r1-0000000BZg1-0Zbf;
	Fri, 26 Jun 2026 09:28:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5FCD9300BDE; Fri, 26 Jun 2026 11:28:06 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:28:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, yury.norov@gmail.com,
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
	tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
	vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
	pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 13/24] virt/steal_monitor: Add documentation
Message-ID: <20260626092806.GL1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-14-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-14-sshegde@linux.ibm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93669-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:yury.norov@gmail.com,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,linaro.org,gmail.com,amd.com,linux.ibm.com,lwn.net,linuxfoundation.org,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,noisy.programming.kicks-ass.net:mid,infradead.org:dkim,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 420926CBB51

On Thu, Jun 25, 2026 at 06:16:37PM +0530, Shrikanth Hegde wrote:

> +Core idea:
> +==========
> +steal time is an indication available today in Guest which shows contention
> +for underlying physical CPU. Use it as a hint in the guest to fold the
> +workload to a reduced set of vCPUs. When there is contention, steal time
> +will show up in all the guests. When each guest honors the hint and folds
> +the workload to a smaller set of vCPUs(Preferred CPUs), it reduces the
> +contention and thereby reduces vCPU preemption.
> +This is achieved without any cross-guest communication.
> +
> +Steal monitor driver effectively does:
> +
> +1. Periodically computes steal time across the system.
> +
> +2. If steal time is greater than high threshold, reduce the number of
> +   preferred CPUs by 1 core. Ensure at least one core is left always.
> +   This avoids running into extreme cases.
> +
> +3. If steal time is lower or equal to low threshold, increase the
> +   number of preferred CPUs by 1 core. If preferred is same as active,
> +   nothing to be done.
> +
> +4. Ensure preferred CPUs is always subset of active CPUs.
> +   On feature disable it is same as active CPUs.


So this is very much a co-operative scheme. Perhaps add a few words to
describe the effect of a non cooperative guest. IIRC the result is not
worse than the status quo. That is, if one (or more) guests refuse to
co-operate it will not make things worse, it will just not result in
improvements, right?

