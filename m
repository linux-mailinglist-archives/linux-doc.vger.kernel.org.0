Return-Path: <linux-doc+bounces-94530-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NdDMFxYcRmqDKAsAu9opvQ
	(envelope-from <linux-doc+bounces-94530-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 10:06:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF16F4908
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 10:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="mo/RAUP1";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94530-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94530-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E12310907D
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3463BD22B;
	Thu,  2 Jul 2026 07:49:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651CB312834;
	Thu,  2 Jul 2026 07:49:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978595; cv=none; b=jdC1y8vxso1Z1sel7ETdOvWOh98L07q04kTRN6W7EE7zcTMMJa4R5Z+csiZTu0pSUD2yi3cvU1LPLWRQotiuAcTSqEtlQcnrMQsTXeo6s0LGITRHTdAs1wkIqZmI3BF95DiSHrritazA8/76U8xnQMjywgx9H1I8/Y5VrWowLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978595; c=relaxed/simple;
	bh=NT7LLn41tlTGVdPwc42ds4tnjl9072JYd8fzOZ90sig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX1O9XovItpkTTq4ykKaBevnkJDJkK1XIVmvyCQVrM5BZM/xaKt1LcXigyA0nZp91buo35x5UaU+S6VUQunbiNWe9LvGke6ZBhMDFjJCYXhzjNFGlnyKHq4ypqjhXOMuqinhr1szTONylNoRUa59STF1bSVOU2/jQyWns9qJu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mo/RAUP1; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E1F288E;
	Thu,  2 Jul 2026 00:49:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10DD3F85F;
	Thu,  2 Jul 2026 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782978591; bh=NT7LLn41tlTGVdPwc42ds4tnjl9072JYd8fzOZ90sig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mo/RAUP1imRpB/y/Ovzr9l/nTCOQW5L5/CkzlGDdoFZ0CNWhqpC7v8CYQYGV4YXvK
	 Vas1zuL920uFiohZTCXoRHVW7NXb67ElPZpnU7YDO6Q87yC91yiOZu0y+gZDomnTmY
	 c6aSpUE9GmUxu7Ldm1gtuZWC6D3B4NzXiFF8bMV8=
Date: Thu, 2 Jul 2026 08:49:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/kmemleak: report leaks only after N consecutive
 unreferenced scans
Message-ID: <akYYFpyU5Fc-ubUw@arm.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-1-ab28f7cc0971@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kmemleak_twice-v1-1-ab28f7cc0971@debian.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94530-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EACF16F4908

On Fri, Jun 26, 2026 at 08:52:02AM -0700, Breno Leitao wrote:
> kmemleak reports an object the first scan it is found unreferenced. Its
> mark phase runs without stopping the rest of the kernel and without a
> write barrier, so a live object whose only reference is briefly invisible
> during a concurrent RCU update -- e.g. a VMA moved between maple tree
> nodes, or a page-cache xa_node -- can be seen as unreferenced for that one
> scan. Because an object is flagged as reported only once, such a transient
> race turns into a permanent false positive.
> 
> Track how many consecutive scans each object has been seen unreferenced
> and only report it once that reaches min_unref_scans, a new module
> parameter. It defaults to 1, leaving the behaviour unchanged; setting it
> higher (e.g. 2) still reports a genuine leak, one scan later, while an
> object referenced again before the threshold restarts its run and is never
> reported.
> 
> min_unref_scans can be set at boot with kmemleak.min_unref_scans=<n> or at
> run-time via /sys/module/kmemleak/parameters/min_unref_scans.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

It looks like a good addition to me. All objects require a second pass
initially to get their checksum updated but that's not sufficient when
they are moved between nodes without having their content changed (list
in a linked list).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 7c7ba17ce7af0..5b14ccb36f95b 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -151,6 +151,8 @@ struct kmemleak_object {
>  	int min_count;
>  	/* the total number of pointers found pointing to this object */
>  	int count;
> +	/* consecutive scans the object has been seen unreferenced */
> +	unsigned int unref_scans;
>  	/* checksum for detecting modified objects */
>  	u32 checksum;
>  	depot_stack_handle_t trace_handle;
> @@ -232,6 +234,9 @@ static unsigned long max_percpu_addr;
>  static struct task_struct *scan_thread;
>  /* used to avoid reporting of recently allocated objects */
>  static unsigned long jiffies_min_age;
> +/* consecutive scans an object must stay unreferenced before reporting */
> +static unsigned int min_unref_scans = 1;
> +module_param(min_unref_scans, uint, 0644);

0644 is fine. Not sure why kmemleak_verbose was 0600.

-- 
Catalin

