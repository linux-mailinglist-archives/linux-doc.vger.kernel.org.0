Return-Path: <linux-doc+bounces-87122-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAB7IPI1A2of1wEAu9opvQ
	(envelope-from <linux-doc+bounces-87122-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:15:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5E5221ED
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11ECB306B324
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81933397B09;
	Tue, 12 May 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw1RxebF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1F397B08;
	Tue, 12 May 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593545; cv=none; b=hI6DGAX0R7Z+4EjgFG+v3iRTz+1uAtX4PVDqGamuBP0Yc2R02DZD34Rgyoih+VuKXOjESxtpxFz/oU1VRW1R+V8YY7hwoLixtse2EKdCyZbyr/JDLKBlGckgbe5X++fkI4gzTypEnD8ectD9nONXgQjOciaWCzNfGIhnpq9hBmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593545; c=relaxed/simple;
	bh=HfpR7Lg+TxySR9F/nG8/aNLHRsyiPEjAeogvOILEcVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibU8iIe4eJ6b7izBqsMMlq1si8zD8yVrD5YXoUMvZrkFsUg2oyFUMRT+f7YEHBsNLwW8DhoCaH58YT9GwuVKcatGZvI8yNJdRjNqC6WtM5u9qH5L0wfKit7aTi5oUnV3hJriIY9o/hwQo4tSuDUREFZVK0MEMNG1kA54B9aUqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw1RxebF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948CBC2BCF5;
	Tue, 12 May 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778593544;
	bh=HfpR7Lg+TxySR9F/nG8/aNLHRsyiPEjAeogvOILEcVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vw1RxebFKUBHRY3SX7b0fato7ilJgCagkpY07ahGDxfNAgH7vBOKWxyKV8Y1yi5xH
	 FYmuye8YvIKJ2cD7oTH28LBkictnO28FIkRMWM81TruLj/y1xLYJze4vJ4DcnXGP7e
	 7IgLRWXgpiOt3o4Hjdd8CYbrN9FbGhtr8tH84AozusvCdYahLJuTbkbwGb3DOrFKgN
	 g0jyMUaIjGlAdpWdELjjTHhY00s9Hk+0ORKHcYd6xOXZOKHNAZT1dmZYlqnKr8FRDN
	 Pjm5VX0hDlxzxorRJG+PNA8NxExqOfE0SqximNaNhN4QcHGy1sFd2oqjaDvGfR4JG5
	 tv9l/J/CDAsDA==
Date: Tue, 12 May 2026 15:45:42 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
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
	linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] Documentation/kernel-parameters: Remove "Deprecated"
 from isolcpus=
Message-ID: <agMvBj4V-XLVaa0_@localhost.localdomain>
References: <20260427150739.bwVmmkj2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427150739.bwVmmkj2@linutronix.de>
X-Rspamd-Queue-Id: 93B5E5221ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87122-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,lwn.net,suse.com,infradead.org,goodmis.org,linutronix.de,suse.cz,gmail.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,localhost.localdomain:mid]
X-Rspamd-Action: no action

Le Mon, Apr 27, 2026 at 05:07:39PM +0200, Sebastian Andrzej Siewior a écrit :
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

Acked-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs

