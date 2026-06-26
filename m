Return-Path: <linux-doc+bounces-93746-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Meq0FhKkPmrSJQkAu9opvQ
	(envelope-from <linux-doc+bounces-93746-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:08:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A771F6CEC6B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:08:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=XbkSfxlg;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93746-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93746-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC8F530356C1
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 16:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C9F2DAFA9;
	Fri, 26 Jun 2026 16:04:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4E37BE7D
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 16:04:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489870; cv=none; b=scmlZEYcOuT6Sl65fnoEsR1kmascMce6TajlKhfEI3i5gM3RjhlAndtk7g733/Nyz1iCIyyP+5OySsNrLxjJHhIrf13H8e4VoFFNIWGDzlWDtSRDxRlmuIVEl+7vjbLJnqKOm7Twz4qCvHCVg9/keffm5DiuHI9zw6S2VBeHKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489870; c=relaxed/simple;
	bh=fFn36/p3duEbAQ9DYPKkmS47iFc0AXRNz03ZwMeVLws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPZeapBSNP1huilvjFRr9tiowiJpjppVuObomT4x0saV3sji+G51v7RTPgmkEpZDhdiMUNEw0qQSR62j8Yf7HtI2v6Aa+EX5WhD9cTd5nkYxw8Bni7tPc7OZdyX9MS6TBuCUAXwDXVIUQH4vfWmIjJgh0ukMKv2WJ2qgZdF4kQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XbkSfxlg; arc=none smtp.client-ip=95.215.58.187
Message-ID: <cf3abe7b-686a-462c-9203-02187ced058b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782489856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64G3Xshtq4ElK9GIOS9bT9tey898+7R6heARU/+ATwI=;
	b=XbkSfxlg5ZCVqWCy26EzEW1bn/QwhxYqdhK/mTeyKANKVhoYUhzWoQvgP9pjOE+eAADvda
	Kbzp0N96xllhqThbZM/d5BGzthHxQAM9VqbeJOG9/FNFybOGCnbE3XRjdZ1cQq2giHWasA
	5s5fc4Q3GSJ9MnbvGEMoaJ/VXu4Cjxg=
Date: Sat, 27 Jun 2026 00:03:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: pagemap: fix flags location, member name and sample
 code
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260625174447.24292-1-zenghui.yu@linux.dev>
 <511c2e7c-0305-4917-a639-e8e9e8710903@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <511c2e7c-0305-4917-a639-e8e9e8710903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93746-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A771F6CEC6B

On 6/26/26 10:47 PM, David Hildenbrand (Arm) wrote:
> On 6/25/26 19:44, Zenghui Yu wrote:
> > The userland visible page flags (KPF_*) were initially moved to
> > include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> > stable page flags"), and later moved to
> > include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> > (Scripted) Disintegrate include/linux"). Upadte the doc to reflect the
> 
> s/Upadte/Update/
> 
> > current location of these flags.
> 
> Ack
> 
> >
> > The member @walk_end of struct pm_scan_arg {} was wrongly written as
> > "end_walk".
> 
> Ack
> 
> >
> > The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> > PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> 
> That makes sense.
> 
> > The second one missed PAGE_IS_FILE in the required mask.
> 
> Hm. The description says: "Find pages which have been written, are file backed,
> not swapped and either present or huge".
> 
> But doesn't that mean that
> 
> it should actually be
> 
> 	.category_mask = PAGE_IS_WRITTEN | PAGE_IS_FILE,
> 
> Because
> 
> 	.category_inverted = PAGE_IS_SWAPPED,

Ah! Thanks for pointing it out. I'll fix it soon.

Thanks,
Zenghui

