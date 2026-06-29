Return-Path: <linux-doc+bounces-94007-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5PEJtB+Qmpc8gkAu9opvQ
	(envelope-from <linux-doc+bounces-94007-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:18:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E86DBF16
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=TJ+JzPq+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94007-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94007-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F9C2301822B
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 14:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7180735AC27;
	Mon, 29 Jun 2026 14:06:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0803347506;
	Mon, 29 Jun 2026 14:05:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741961; cv=none; b=TNcBNsYJgMIu40og1B91OLKxQjvsXyOVVws/nqgOe2Pg3NKepXvp6yIjfvvvKsSVKbjCI4JofUtAVDTR8ghXnwvtlp8nJ3hR41CoB4mXewug0Bk5kuoMRK0o9osW1rJwNVDVspApDcOmWsVYXKM6b+8vU7PmBJ/lNoKNtCMKAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741961; c=relaxed/simple;
	bh=FnuueWM1I3R3V6FvYpALJCpc8zOP3fwSXA+tyAe9Ues=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2dQxq18/HkVyvO7u2FveY4Ez1e8fIBSCiYVSX3gW/vgXV1eMacEKDeQzlwI27bKpiKIyvXcdvKfgqYhJCCTmT4SwAUrgVLZ89c2gdFkYfHXMNslHwkaqVcN+Rh4q1/2JIURvpAdkotF31IJDZtNVK1a2riw95pKeVN+rvey4dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TJ+JzPq+; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CD5C169C;
	Mon, 29 Jun 2026 07:05:54 -0700 (PDT)
Received: from [10.57.29.109] (unknown [10.57.29.109])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B62E3F905;
	Mon, 29 Jun 2026 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782741959; bh=FnuueWM1I3R3V6FvYpALJCpc8zOP3fwSXA+tyAe9Ues=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TJ+JzPq+couSJ3On7oulw/MC0x6e8UuOEQ1om95XBkNjobj4qbzSMXg9GX1yPZy40
	 sd281DEC20RqIwmAxJTeNVhfCTXH6SKReOpoQ74L2J4uzkIP5ABAOkckBNwV96a5Pg
	 bcMcRbNyaPqCM+FULNEEJQuWwftHwwNaxkjk9Iqg=
Message-ID: <7f960dca-2de2-4831-8690-a40fdec848dd@arm.com>
Date: Mon, 29 Jun 2026 15:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: Allow EAS without schedutil for
 artificial Energy Models
To: =?UTF-8?Q?Lucas_de_Lima_N=C3=B3brega?= <lucaslnobrega38@gmail.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org,
 vincent.guittot@linaro.org, mingo@redhat.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 juri.lelli@redhat.com, rafael@kernel.org, viresh.kumar@linaro.org,
 peterz@infradead.org
References: <20260629083542.10041-1-lucaslnobrega38@gmail.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260629083542.10041-1-lucaslnobrega38@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94007-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lucaslnobrega38@gmail.com,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:vincent.guittot@linaro.org,m:mingo@redhat.com,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:juri.lelli@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:peterz@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lukasz.luba@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B7E86DBF16



On 6/29/26 09:35, Lucas de Lima Nóbrega wrote:
> EAS currently refuses to enable energy-aware scheduling on a root
> domain unless schedutil is the active CPUFreq governor for all of its
> CPUs (cpufreq_ready_for_eas()). This requirement exists to protect the
> accuracy of the energy estimate: EAS predicts the OPP a CPU will run
> at from its utilization, which is only meaningful if the active
> governor actually requests OPPs that way, and schedutil is the only
> one that does.
> 
> That requirement does not apply to artificial Energy Models
> (EM_PERF_DOMAIN_ARTIFICIAL). An artificial EM is built from a
> get_cost() callback instead of real power numbers, and only encodes a
> cost ranking between CPUs (e.g. P-cores cost more than E-cores at a
> given utilization). It never claims to predict real energy use at any
> specific OPP, so there is no per-OPP accuracy for the governor
> requirement to protect, regardless of which governor is in control or
> whether it tracks utilization at all.
> 
> intel_pstate registers exactly this kind of artificial EM for hybrid
> (P/E-core) systems without SMT, regardless of whether it operates in
> active or passive mode. In active mode it never uses schedutil, since
> HWP picks frequency autonomously, so on these systems EAS never

When frequency is picked autonomously then EAS and energy estimations
don't make sense IMHO.

Do you have any data from experiments how it runs?

Regards,
Lukasz

