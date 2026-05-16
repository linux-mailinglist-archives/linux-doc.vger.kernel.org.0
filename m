Return-Path: <linux-doc+bounces-87813-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCiMGmPtB2rmPAMAu9opvQ
	(envelope-from <linux-doc+bounces-87813-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 06:06:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C354155A1E3
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 06:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9913B30107D3
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 04:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBC027B50F;
	Sat, 16 May 2026 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m/T4jWUy"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653626159E
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778904412; cv=none; b=QgDPjug8n4gHc47nVI9VXp1BlwWD2qx3yjGSR5NMM/r/rEOrOV6lMYhuGdg8fKtK2C3w6dBsqSB4qEKtgBXr1COkqMjRx5KtHvTL+4B5Dsdy6lMSq4+KxBZPuijIa5ZmqVWkc5HetYOy+JKG8rgVEArlHLWn2m+nvPfzZIAax5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778904412; c=relaxed/simple;
	bh=GBwaUEyCsHc0bhV3MvwOkn2yoHIHILajZ2KK2Sj624E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRo2IHOPRVEU9eIj4EDURLub1Nxc4osx4fgAbmkFehvFSYTcaUB5iuVCKzDd592N2rkqTP4wy9m+bDlil1DIRpCXbVrfXJqgrNH/rF7mx2bZ4YmMSSX6g47555R7irN/Doos9/5ETmZIg8DY8nCBVc2tCWRIh2VSyQmQkha/oIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m/T4jWUy; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <f76b79d3-080a-4931-873e-99d4b3e1020f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778904398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csEBmhV4pBMWZ2fB04greY5anYTJC5J151pnKD1dZ50=;
	b=m/T4jWUyKVPBrEtgI+LssBYE8Jr1JtMKr0LC+7/kLTiQQ5hs1U9JvcXG/ff5kGZB9kDH8j
	yfg3OKQY/qc5xL9N70vxIHxOISGzjIXPdS29DbHnveiqosMrQEKPuglL6ufFzM10cY/+yN
	CEhCLgcRYDzRn7tVG2TNL9cq+EyTS8I=
Date: Sat, 16 May 2026 12:06:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/6] mm/memory-failure: surface unhandlable kernel
 pages as -ENOTRECOVERABLE
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>
Cc: linmiaohe@huawei.com, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, nao.horiguchi@gmail.com,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, skhan@linuxfoundation.org, liam@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 kernel-team@meta.com
References: <agXcPleVC9LGVCmj@gmail.com>
 <20260515070353.87244-1-lance.yang@linux.dev> <agcbfLHT5ZWnNeN0@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <agcbfLHT5ZWnNeN0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: C354155A1E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87813-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,linux-foundation.org,kernel.org,google.com,suse.com,gmail.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,infradead.org,kvack.org,vger.kernel.org,meta.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 2026/5/15 21:13, Breno Leitao wrote:
[...]
>>
>> Wonder if it would be simpler to just do a positive check near the top
>> of get_any_page() instead. Something like:
>>
>> static bool hwpoison_unrecoverable_kernel_page(struct page *page,
>> 						unsigned long flags)
> 
> Ack. We probably want to call it something like HWPoisonKernelOwned() to
> follow the same naming sematics of these helpers, such as HWPoisonHandlable()
> 
> By the way, I will re-include the self test back to this patch series,
> In case they are not useful, we do not merge it.
> 

Sounds good :)

Can you also test the relevant page types if possible, especially
the ones the new helper is supposed to classify?

Cheers, Lance

