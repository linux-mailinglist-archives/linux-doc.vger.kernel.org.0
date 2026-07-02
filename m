Return-Path: <linux-doc+bounces-94707-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t5CgNRjtRmpofgsAu9opvQ
	(envelope-from <linux-doc+bounces-94707-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 00:58:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 059066FD51A
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 00:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=J53RqRci;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94707-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94707-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA2DF300BC88
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 22:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2DF3C6A2B;
	Thu,  2 Jul 2026 22:58:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D1381E93;
	Thu,  2 Jul 2026 22:58:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033110; cv=none; b=r7t63fvz2sWYRg64hS6Ep0Qtd9/wfbDsUlLD/x6OMNkqBG+ySIMa7uePrduhQqE14SamtcoczvMyDuj3W+Y2pagOvt57UHmIphiEzKyAqPuL+tnReTqtRUamYswQywvS4/l+NziopPSPF9It7gDN3ysOhyqEiTGH6qBYBVb+97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033110; c=relaxed/simple;
	bh=o1Bh4qMKOjgswOmW+xG+2i7GYqy72oG4Ttmitj6M3ec=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OLsaFrkYVtIB9K3NOoyjZf6/1MDrjcaWo0K1ZokNYq6Rq7n6dPOiJ4IyqRt4A5Mw0BYfCAIk/WS6iPJkEeHe8JvuaRVZLHQK5C1eIrq6nQZR+m7EAhikSTcUVHHGQPTKX9+LsdciRRIsjiN9OQwF7jbBGEvvHS21bR0zddukat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J53RqRci; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AF21F000E9;
	Thu,  2 Jul 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783033108;
	bh=zYEkqdozOe/7stEmwJgP8h9MuDwD1w2BGKquiT2/0wI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=J53RqRciTuprIX6dqV9IfBUt5Q6S6eiwZ8UP7E1faSRM5HaOU4inPlYnnE2LltQhf
	 0LMKOBmTk0OO2MJI7qH2tRtwsexVAg7y4k2SnXJcE1aYVBUmdfGGUgia46z+GFwa+/
	 sLxY88crWq8zDwX4f3mQH3Wehhl2uldJPBxGShlA=
Date: Thu, 2 Jul 2026 15:58:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 1/3] delaytop: add delay max for delaytop
Message-Id: <20260702155828.3b641339840e94917c165bd6@linux-foundation.org>
In-Reply-To: <202607022058152607Y25X-YgssuvncpVNHljz@zte.com.cn>
References: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
	<202607022058152607Y25X-YgssuvncpVNHljz@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94707-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:wang.yaxin@zte.com.cn,m:fan.yu9@zte.com.cn,m:yang.yang29@zte.com.cn,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:xu.xin16@zte.com.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zte.com.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 059066FD51A

On Thu, 2 Jul 2026 20:58:15 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Previously delaytop only showed average delays. Add delay_max fields to
> track the maximum delay value for each delay type (cpu, blkio, irq, swapin,
> freepages, thrashing, compact, wpcopy) per task.
> 
> This provides a global view of all tasks' delay spikes, which is essential
> for identifying processes that experienced brief but significant latency
> events that would be hidden by average-only metrics.
> 
> The -t/--type option displays only the specified delay type with avg/max
> values side by side, allowing focused analysis:
>   delaytop -t cpu    # Show only CPU delay with avg/max
>   delaytop -t wpcopy    # Show Copy-on-Write delay with avg/max
> 
> ...
> 
>  	total1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->total_offset);

The code does this pointer operation in many places.  Is there a better
way?  Should all those `unsigned long long' fields in `struct
task_info' be in an array, something like that?



