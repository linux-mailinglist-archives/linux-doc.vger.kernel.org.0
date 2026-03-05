Return-Path: <linux-doc+bounces-77918-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB9II+T2qGktzwAAu9opvQ
	(envelope-from <linux-doc+bounces-77918-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 04:22:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC24820A7CF
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 04:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DA7A303A933
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 03:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12083368B8;
	Thu,  5 Mar 2026 03:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nQqMSLj1"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF83368A8
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680928; cv=none; b=hJTNR3miDsrzmasQqb1/pXiYBk3+DfMTTlhMjze66NWQa8hlsHuhruD6lBixX5Fx1cKGb6PQtLZ0qkmi7E50mpfpUqPQ1YCqi4horMEqcsZBmVMBEXdbElmrEntGC4wJa1X2HjH9AFWn58JF5lmqkUSQx1M0qlFc4zLK3SkbD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680928; c=relaxed/simple;
	bh=QZ0hNcuNlpQuyiiY34XUhZUoyz0Dwe6vjkiCfycRTck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8XQoq/S4TMO3zaUl63gmQgbvO3McgVDTHXkDXD/ZQ9eh84CSoMa8SG1hQv4EDJxn77HyFuABr5BudRl7Xqi7qL2wDoLMACSh2p/RwX0BlL9sf+crUOixiW3K0/iMnOdZbBlzd3mlZWWqRQk211u4HOlvZ2c3P4/ZFcUQfqWHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nQqMSLj1; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7ef528c1-b09c-48ba-bd59-bcf13880e105@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772680923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gus2TbXg7gV4yotO25GDeDjmZGlpM2f+fKw3//D+yIA=;
	b=nQqMSLj1tjlyJYZMSeOMcrUjLwkiQXIkpZMDbTxUeW4EXdyaALv/totjOTniIeC6JO9Tb+
	nN4dIP7ddh+mLx7p2xWqLpogvBGLmHMhocAyCiCv1LL/5YNEFVmKuNVnJMPakmyrjRGUCl
	GUGWZtENkEFZJXNvmDPtIT8tN+UUHNk=
Date: Thu, 5 Mar 2026 11:21:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] docs: filesystems: clarify KernelPageSize vs.
 MMUPageSize in smaps
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Usama Arif <usamaarif642@gmail.com>, Andi Kleen <ak@linux.intel.com>
References: <20260304155636.77433-1-david@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260304155636.77433-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: DC24820A7CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77918-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,nvidia.com,linux.alibaba.com,redhat.com,arm.com,kernel.org,lwn.net,linuxfoundation.org,gmail.com,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 2026/3/4 23:56, David Hildenbrand (Arm) wrote:
> There was recently some confusion around THPs and the interaction with
> KernelPageSize / MMUPageSize. Historically, these entries always
> correspond to the smallest size we could encounter, not any current
> usage of transparent huge pages or larger sizes used by the MMU.
> 
> Ever since we added THP support many, many years ago, these entries
> would keep reporting the smallest (fallback) granularity in a VMA.
> 
> For this reason, they default to PAGE_SIZE for all VMAs except for
> VMAs where we have the guarantee that the system and the MMU will
> always use larger page sizes. hugetlb, for example, exposes a custom
> vm_ops->pagesize callback to handle that. Similarly, dax/device
> exposes a custom vm_ops->pagesize callback and provides similar
> guarantees.
> 
> Let's clarify the historical meaning of KernelPageSize / MMUPageSize,
> and point at "AnonHugePages", "ShmemPmdMapped" and "FilePmdMapped"
> regarding PMD entries.
> 
> While at it, document "FilePmdMapped", clarify what the "AnonHugePages"
> and "ShmemPmdMapped" entries really mean, and make it clear that there
> are no other entries for other THP/folio sizes or mappings.
> 
> Link: https://lore.kernel.org/all/20260225232708.87833-1-ak@linux.intel.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Usama Arif <usamaarif642@gmail.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Makes sense to me. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

