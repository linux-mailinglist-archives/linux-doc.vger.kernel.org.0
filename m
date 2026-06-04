Return-Path: <linux-doc+bounces-90928-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3N2sOfFQIWq/DAEAu9opvQ
	(envelope-from <linux-doc+bounces-90928-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:18:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0E63EF20
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CGZwQshl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90928-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90928-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C18303CA6B
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 10:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE943D522C;
	Thu,  4 Jun 2026 10:10:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925C3CAA27;
	Thu,  4 Jun 2026 10:10:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567851; cv=none; b=IAsKoArTFdQe7PnqrlYh/5w1wVh4CH74fo2kSTop9CHnRbmf9N6co0vUDjBduuOMsb3QnJJoXKWBPGCeJDvJZcLm1yNEtcPll11/ppnRsH2HI9IenD+ggQZNfU9OnYYNvdnsKBbg88T0FvcwkpN4TrP9B90E8uuTao50SEBBMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567851; c=relaxed/simple;
	bh=cltcT7YURRzZTuy0YlL8lZfC1GAWVnKijUYy89tqg7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7+4gc+dT4yLih8koFLi0dbiB8CuCnbFC+gi6uAePem9t2ZkvQpaEC3PM/NeXatTKBkeBeVqUNl3piVr44D2n1iiBNMUnzTr3Zlt+B6zylPxixMatZ8PULVeScBTQtBRlBxEy6OGXIqX05FCCpT2AHwsedNZRxnxKryeqe47UCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGZwQshl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFE81F00893;
	Thu,  4 Jun 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780567848;
	bh=gkkN3rSsy1x2rUTT5oj5wUdRNrzE7spA48FJt094/So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGZwQshlxmc2XZ65+AI3hGi3KK0c2VD681fArvK6f2BFHTSRHLswxUOmVCb4sCt1W
	 Z9ma7nQfGtuA7lQiYx2fKdTlqUTmG+BIcgeCQfL2Ft0oGgI/3HNPGgog9ahiuDtETX
	 Xl1geh7I6bXjCsa2AirqS/z5tS58F7lwXKyYMrt7K0Zn7yig38OJG+sWAonnRQKFgI
	 0Laur7+CZ0U1AMh/yCTt6ur8/8bQ2CJgb1YdPFW+rBo7sBOuBgGRUEuBu/3wqv/Vug
	 UnntTmIGdNO1wzr7z87TEUllZ3vkysu/4bTLtGwNaq+Hf2B6fuzhyIqe6KE7/Mjw0X
	 +84CVI1y8zr/w==
Date: Thu, 4 Jun 2026 11:10:32 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, 
	kas@kernel.org, lance.yang@linux.dev, liam@infradead.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
Subject: Re: [PATCH mm-hotfixes-unstable v18 00/14] khugepaged: add mTHP
 collapse support
Message-ID: <aiFO1RlpZ7Ki44y1@lucifer>
References: <20260522150009.121603-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522150009.121603-1-npache@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90928-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:lance.yang@linux.dev,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,
 m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE0E63EF20

Not sure if already addressed for v19 but I just tried building a kernel in
mm-unstable and saw this (clang 22.1.6):

mm/khugepaged.c:1357:6: warning: variable 'pte' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1357 |         if (result != SCAN_SUCCEED)
      |             ^~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1458:6: note: uninitialized use occurs here
 1458 |         if (pte)
      |             ^~~
mm/khugepaged.c:1357:2: note: remove the 'if' if its condition is always false
 1357 |         if (result != SCAN_SUCCEED)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
 1358 |                 goto out_up_write;
      |                 ~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1352:6: warning: variable 'pte' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1352 |         if (result != SCAN_SUCCEED)
      |             ^~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1458:6: note: uninitialized use occurs here
 1458 |         if (pte)
      |             ^~~
mm/khugepaged.c:1352:2: note: remove the 'if' if its condition is always false
 1352 |         if (result != SCAN_SUCCEED)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
 1353 |                 goto out_up_write;
      |                 ~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1296:12: note: initialize the variable 'pte' to silence this warning
 1296 |         pte_t *pte;
      |                   ^
      |                    = NULL
2 warnings generated.


Is this already addressed in v19/review here? If not could you please address it.

Thanks, Lorenzo

