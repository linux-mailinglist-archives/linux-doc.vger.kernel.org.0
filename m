Return-Path: <linux-doc+bounces-91290-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PCK8FylLJmrhUQIAu9opvQ
	(envelope-from <linux-doc+bounces-91290-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 06:55:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3581652A93
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 06:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=BBmW8jOL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91290-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91290-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5E92300EC9C
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 04:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E6034888F;
	Mon,  8 Jun 2026 04:54:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB2348C46
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 04:54:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894484; cv=none; b=RPqMGnRUjgAvwfCpGOercyF4LYqVi11wrsHuFkqdKUYU8CR7/lAVQ3kN6ENoBEamsLSSA0EuUmzbGs8Mv003BjruOF9YS24hIhWjOmcsuyTZks+nhJnHjxXG6reDEhcX5bmWn/KU8btsAsCoumwMgIo/vegpbS4CCkTEnge348s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894484; c=relaxed/simple;
	bh=nJZD1v0uKmRwmTPQY9fhrdbUR6X2mcRzW3srSSIJVBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgioYX4BVqUOMlQjmW7l9KDKyznrwZHIcy2aLgdsN7A7pLMiscmZFFscndxjpaAhbh60IzPsdnnUxSzkRgBExS8QO1MjEEPb4aP3TIrwJottPFF+F6y1LEmdtG83a1vaZHqbi/mXJY4gjDrGPN/S9NXf3rcijcX/S90t7bQbxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BBmW8jOL; arc=none smtp.client-ip=91.218.175.185
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780894470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJZD1v0uKmRwmTPQY9fhrdbUR6X2mcRzW3srSSIJVBc=;
	b=BBmW8jOL6IGP4OdE9Tk2dDZ6XAZ07VWn9whCfkMIctmLJAFFQ8LHl3pqu76fyNCyFSDjaq
	tqprhwUKy/lu381KF5DjqtOYK7/1NHPLjz2i56t5p5q7L9rYSQF2gDaL7zqSaVdhlFOy1m
	42nqER2YRyBfnjvZfD8in49rQbw+DNw=
From: Lance Yang <lance.yang@linux.dev>
To: npache@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	ljs@kernel.org,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com
Subject: Re: [PATCH mm-unstable v19 06/14] mm/khugepaged: generalize collapse_huge_page for mTHP collapse
Date: Mon,  8 Jun 2026 12:54:13 +0800
Message-Id: <20260608045413.70658-1-lance.yang@linux.dev>
In-Reply-To: <20260605161422.213817-7-npache@redhat.com>
References: <20260605161422.213817-7-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91290-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:lance.yang@linux.dev,m:liam@infradead.org,m:ljs@kernel.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan
 .roberts@arm.com,m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_GT_50(0.00)[59];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3581652A93


On Fri, Jun 05, 2026 at 10:14:13AM -0600, Nico Pache wrote:
>Pass an order to collapse_huge_page to support collapsing anon memory to
>arbitrary orders within a PMD. order indicates what mTHP size we are
>attempting to collapse to.
>
>For non-PMD collapse we must leave the anon VMA write locked until after
>we collapse the mTHP-- in the PMD case all the pages are isolated, but in
>the mTHP case this is not true, and we must keep the lock to prevent
>access/changes to the page tables. This can happen if the rmap walkers hit
>a pmd_none while the PMD entry is currently unavailable due to being
>temporarily removed during the collapse phase.
>
>To properly establish the page table hierarchy without violating any
>expectations from certain architectures (e.g. MIPS), we must make sure to
>have the PMD reinstalled before the PTEs, and hold both PTE/PMD locks
>before calling update_mmu_cache_range() (if they are distinct locks).
>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---

Nothing else jumped out at me. Anything left can be sorted out later, as
David and Lorenzo said :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>

