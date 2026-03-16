Return-Path: <linux-doc+bounces-79542-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHSsLm5RuGmKcAEAu9opvQ
	(envelope-from <linux-doc+bounces-79542-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 19:52:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8329F501
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 19:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22069303C824
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 18:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03A23E5EEC;
	Mon, 16 Mar 2026 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lO6v6VNy"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADA3E5EF5;
	Mon, 16 Mar 2026 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686732; cv=none; b=pTrQm81oj2xcp+bL4q3XHRoc1Ce0w8SnijarAcfbvjEAM8rQEr4j7xYCgvmGEV74VkqPK+mGCGBhfmtwtfyAYNRw2eS23lKG/f3f2tEflFEhQ066QHErI2mR7Bn/+snp6j9m39aESPhxxnSeYlnK/egcXfQehUABpx2Muu+24a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686732; c=relaxed/simple;
	bh=51ir38hBH/+EX4PSa61CEBGIWQ7Rfv65zGL0gHAdotg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgSWdFGZugVuuGZElY2VF8h1b0uUt6oVqHjHDyZuuE8KovttgMOmK+jdI7lYlGEap0eRUPVUf/7oLBq8PVyvAbSGP/xTefE5jOVAIqh7BPvNPMxdfsN/HjYtGo+pnEUj+FU0saHQdZWEgbSWYwBXRD/vKTIYU0zTQ6i+8tIJ4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lO6v6VNy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=R/0Pmqo6gymewtsBJQ/y7Yj1oSkMScDskutIUZ+bJxU=; b=lO6v6VNygyX0u8SkoFE88YqNS2
	DOcufX8BC2HzoQxDZvtRSRtxxuAeuRuV8oJQqZzRYuVyQsg76jokBcpc5i5UxehPO+qFZRbMCl4R5
	ELo2t1dzKXtXna5XyYXUv1DnTAw1/8HdUMQgHzvhJlGWt88BsGX/pGggF1bAgFjHmYgETXj6UsRmb
	xevH1jNpkgVSdduvn5I0E/x0zJbNKfo3DpJQWqJkC/GRmVMBiXU/RBGiKK0BJ7pADTCvXynaAJAZh
	RINKCwp1Vp07Rquu8gs7whqnScuS52vnQi89O3c5L8sKRH22l19ouJAHFr+9vp+/QwtXYufw9Yyfg
	q7oJzgvA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CwL-00000004hUc-3lEa;
	Mon, 16 Mar 2026 18:45:23 +0000
Message-ID: <81ef23ff-5042-4934-a227-2c6289b4f62b@infradead.org>
Date: Mon, 16 Mar 2026 11:45:18 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: mmap_prepare: don't italicize structs
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20260315224506.1973566-1-rdunlap@infradead.org>
 <2ae64217-ae32-4a4e-9c23-6809582ca7bc@lucifer.local>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2ae64217-ae32-4a4e-9c23-6809582ca7bc@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79542-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,infradead.org:dkim,infradead.org:email,infradead.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kvack.org:email]
X-Rspamd-Queue-Id: 40A8329F501
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/26 12:10 AM, Lorenzo Stoakes (Oracle) wrote:
> On Sun, Mar 15, 2026 at 03:45:06PM -0700, Randy Dunlap wrote:
>> Using a single quote mark `struct xyz` causes the html output to be
>> produced as italic. Omit the quote marks so that kernel-doc's automarkup
>> can make the "struct xyz" bold monospace ("code" style") in the
>> generated html.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> This is fine, though given this series is still in-flight we should just
> fold this in no?

Sure, any/either way works for me.
Thanks.

> Anyway, LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> 
>> ---
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/filesystems/mmap_prepare.rst |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- linux-next.orig/Documentation/filesystems/mmap_prepare.rst
>> +++ linux-next/Documentation/filesystems/mmap_prepare.rst
>> @@ -129,11 +129,11 @@ pointer. These are:
>>  * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
>>    physical address and over a specified length.
>>
>> -* mmap_action_map_kernel_pages() - Maps a specified array of `struct page`
>> +* mmap_action_map_kernel_pages() - Maps a specified array of struct page
>>    pointers in the VMA from a specific offset.
>>
>> -* mmap_action_map_kernel_pages_full() - Maps a specified array of `struct
>> -  page` pointers over the entire VMA. The caller must ensure there are
>> +* mmap_action_map_kernel_pages_full() - Maps a specified array of struct
>> +  page pointers over the entire VMA. The caller must ensure there are
>>    sufficient entries in the page array to cover the entire range of the
>>    described VMA.
>>
> 
> Cheers, Lorenzo

-- 
~Randy


