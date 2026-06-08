Return-Path: <linux-doc+bounces-91310-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9cGWA9BoJmpJWAIAu9opvQ
	(envelope-from <linux-doc+bounces-91310-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:01:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E292653523
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=EUapOzUX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91310-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91310-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C36B230078BC
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 07:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D5239184E;
	Mon,  8 Jun 2026 06:59:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CBB39E6CD;
	Mon,  8 Jun 2026 06:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901990; cv=none; b=A+ow1roFvazTSBLghf9kUVQ2XrKEOZVo7H2Ls1kKnKgsVGOGQDeoryd9GWreyhYWlxMGaapPb9oUIVA2+xLhEZngcwhqhrX+DNumAwCW1l/iapz5O2f2vZow/fZh7u0Rj9Lmqe/13Ugk90BfRNu/fgfCzmF7xslLFtX+w4bNN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901990; c=relaxed/simple;
	bh=S6gLya0AdKg0zcUdyzdBhBdBUKql8AmIkZI/Kjnkprc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLiKurpdvPlwe8CkilOqGjoub1iKQg4qdXL9HfHVnQMJQONeeoCPHx5Oomb/iEZTt9kawucu3+ME/QWm6kYgl5lNYWh70SvxBFLfks8G0az7YXgWru9dm4hddwA95xClp8X4svM17cZEv12j/afQeZCcLXsOXOGM5G4pxSly07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EUapOzUX; arc=none smtp.client-ip=95.215.58.179
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780901976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3/06Trq5FpnxHyx8TwAa3S5P3cfEJjPOzAapv5j8wo=;
	b=EUapOzUXzSldul+SfubS/o+1vi1bdkmgOGo33ORWMjo36vmrsTNcL+aaGW03/YjqAZSW2R
	k6K4Jlx7h9j38VtG8xzTPjXnNZRTsV7JRAyL8HPHWR9Zi+NmmnQyClmfyWfUeVsdt9mjuP
	MnaxxTrabdkE3hKr88UNKrlypvcKGKk=
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
	zokeefe@google.com,
	usama.arif@linux.dev
Subject: Re: [PATCH mm-unstable v19 07/14] mm/khugepaged: skip collapsing mTHP to smaller orders
Date: Mon,  8 Jun 2026 14:59:06 +0800
Message-Id: <20260608065906.66125-1-lance.yang@linux.dev>
In-Reply-To: <20260605161422.213817-8-npache@redhat.com>
References: <20260605161422.213817-8-npache@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:lance.yang@linux.dev,m:liam@infradead.org,m:ljs@kernel.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan
 .roberts@arm.com,m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:usama.arif@linux.dev,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91310-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_GT_50(0.00)[60];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,alibaba.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E292653523


On Fri, Jun 05, 2026 at 10:14:14AM -0600, Nico Pache wrote:
>khugepaged may try to collapse a mTHP to a folio of equal or smaller size,
>possibly resulting in a partially mapped source folio, which is undesired.
>Skip these cases until we have a way to check if its ok to collapse to a
>smaller mTHP size (like in the case of a partially mapped folio). This
>check is not done during the scan phase as the current collapse order is
>unknown at that time.
>
>This patch is inspired by Dev Jain's work on khugepaged mTHP support [1].
>
>[1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.com/
>
>Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: David Hildenbrand (arm) <david@kernel.org>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Co-developed-by: Dev Jain <dev.jain@arm.com>
>Signed-off-by: Dev Jain <dev.jain@arm.com>
>Signed-off-by: Nico Pache <npache@redhat.com>
>---
> mm/khugepaged.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>index c2769d82a719..191e529c185c 100644
>--- a/mm/khugepaged.c
>+++ b/mm/khugepaged.c
>@@ -697,6 +697,14 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
> 				goto out;
> 			}
> 		}
>+		/*
>+		 * TODO: In some cases of partially-mapped folios, we'd actually
>+		 * want to collapse.
>+		 */

Partially mapped folios can be handled later :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>

>+		if (!is_pmd_order(order) && folio_order(folio) >= order) {
>+			result = SCAN_PTE_MAPPED_HUGEPAGE;
>+			goto out;
>+		}
> 
> 		if (folio_test_large(folio)) {
> 			struct folio *f;
>-- 
>2.54.0
>
>

