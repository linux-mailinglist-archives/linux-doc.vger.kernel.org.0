Return-Path: <linux-doc+bounces-81006-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAaRI7OywmmRkwQAu9opvQ
	(envelope-from <linux-doc+bounces-81006-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:50:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B20318606
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20CA2304FE4B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 15:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B378D390CAA;
	Tue, 24 Mar 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="16J67yDL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HB1X4GTq"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D2390983;
	Tue, 24 Mar 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366709; cv=none; b=Hg5rUFbDo2cQjIyxiQkCaK2NoPOLdgVC+GQmq2KfuYkcJnooTNomJd68l2/N+feLWfq+tdbOuCHxbznoid4h39NU5XHhSuRXztK/CSADnOXyE16sH4O1rQ8VP7bCh8Cg1pGvwsYVJ4a2/tOwWddqMrlJBeWDZzhnjHtjW3T6x2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366709; c=relaxed/simple;
	bh=hATF4iUrtY21p5H9Ygk6vqvHdTkoGhY2Q/kVGcPxCI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV243MYad2mMGyv7wr1v18BmqvLp6mmMxw7vlUVJegms2psnB8HYibs3jYpZiazykKyz8+0UteOnPQHNbPNyrq81Xl9s5efZ0QWuIWWYPE9i6Ipgh3UW+6xLaTvNCQARCezAHMa3r/Fa/QT6sqentiyjDXpoSdF+MU8qHz2hfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=16J67yDL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HB1X4GTq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 24 Mar 2026 16:38:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774366705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g97BQutIAgWFM119CNXFachoucn5aV/edZs0Aa1N96s=;
	b=16J67yDLXdd54wjjvy+QwV5ZE0k3mQU3h9Ao4GnlNBJJxUghbGgNlx17TezMBzcQ17Vzcg
	9PU/rvd/yZd4pEfyzD1C9CwG3q6nPr9YQGjnFMAPDy0gHQNtBEeNu/JhFgMH+JmMBahz7d
	U6sPtVvUAv7FJ9uxdzX1kIp2SlWfv17ItILTp9SGM2HaRlxjd26PYzv/GaRB5oimUU4SPD
	JjMO8n81m7EbIHbvBelrtokaGUXV91vxZcRTgxprkstA3D+PMysCFKp6Cow0MegfSyRu2m
	xM32LxFx+nivGjT4L8683KD1vbn5P0wF95fARLk8yGEOq2+dUY6BLRO4QO7zQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774366705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g97BQutIAgWFM119CNXFachoucn5aV/edZs0Aa1N96s=;
	b=HB1X4GTqVjz9c9vBuEcSK8/USbyaxuKeOAxjcjiL272Qe+qw7OfI2bUJlGyTyXGQyAoMbn
	wYK/ACaREOeZibDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
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
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260324153823.VKwebBuG@linutronix.de>
References: <20250809094247.8384-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250809094247.8384-1-frederic@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81006-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: 99B20318606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2025-08-09 11:42:47 [+0200], Frederic Weisbecker wrote:
=E2=80=A6
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,338 @@
=E2=80=A6
> +CPUSET configuration (cgroup v2)
> +--------------------------------
> +
> +Assuming cgroup v2 is mounted to /sys/fs/cgroup, the following script
> +isolates CPU 7 from scheduler domains.
> +
> +  cd /sys/fs/cgroup
> +  # Activate the cpuset subsystem
> +  echo +cpuset > cgroup.subtree_control
> +  # Create partition to be isolated
> +  mkdir test
> +  cd test
> +  echo +cpuset > cgroup.subtree_control
> +  # Isolate CPU 7
> +  echo 7 > cpuset.cpus
> +  echo "isolated" > cpuset.cpus.partition

while looking at this again, shouldn't you also do
	echo 7 > cpuset.cpus.exclusive

to ensure the CPU isn't used somewhere else?

Sebastian

