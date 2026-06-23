Return-Path: <linux-doc+bounces-93243-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CW0BIraTOmpdAggAu9opvQ
	(envelope-from <linux-doc+bounces-93243-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 16:09:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2626B7BF9
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 16:09:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=h-partners.com header.s=dkim header.b=f2mWTIgR;
	dkim=pass header.d=h-partners.com header.s=dkim header.b=f2mWTIgR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93243-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93243-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=huawei.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9AFC305A8B4
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDA13806A6;
	Tue, 23 Jun 2026 14:08:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BB3803E3;
	Tue, 23 Jun 2026 14:08:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223691; cv=none; b=bWvBMKn7kXjWWfc+LO5mpQjDSu/xCj2FCaqGsAz7/dMBaDVMQk6mmEknOPkzpArrSfmcCFAfKOeSGwd8UeDCC6lC026qfHk+E2htikhNv4Bcm58w39++q58/reRXvj97NojU6K7N/b9AmcW5jtmOuvT2xN0Fcggv5e2gLkt/I88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223691; c=relaxed/simple;
	bh=tM88ehV0vRS7fFmScYoO3fuXe+FKN3oyB1IesDMdkWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UzR4vz2T8lomLGhs+HGqJQ92A8B49fz1ZXLu7Jk+hGx6s7y7Oq3gwYs0UsbUhjZrXoRIACw9dy/Kxi3FHZb/v385o1nbzDAJ80urpMzjPh75qiZYpEsY6qmZ3lHhIqFaRn077cuUPBuSmS6fVjBltIxbaIG8rGOV5EhbMI7o4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=f2mWTIgR; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=f2mWTIgR; arc=none smtp.client-ip=113.46.200.217
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4Kjc0ILl0J/jDwE6Rp8VeaX8HsM6FVKzVv2KZZcpLvE=;
	b=f2mWTIgRI0OMt+a5DXk7llvGYG+YSSaNqEUOMlOA2s03QZHIYyfSkzRV1Z6b4x+STugLrsIPq
	3m6oP+Rzqb0N2IaFfkxaKjYTPJucaumO6NrvPZ1nl2cSchKOLvsCKiwkRUAFEbcYKgg7VAPrMAf
	PHbGQXpQFpA89e2wK8OSTX0=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gl6BT3pzczcb3n;
	Tue, 23 Jun 2026 21:59:29 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4Kjc0ILl0J/jDwE6Rp8VeaX8HsM6FVKzVv2KZZcpLvE=;
	b=f2mWTIgRI0OMt+a5DXk7llvGYG+YSSaNqEUOMlOA2s03QZHIYyfSkzRV1Z6b4x+STugLrsIPq
	3m6oP+Rzqb0N2IaFfkxaKjYTPJucaumO6NrvPZ1nl2cSchKOLvsCKiwkRUAFEbcYKgg7VAPrMAf
	PHbGQXpQFpA89e2wK8OSTX0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gl6BP4B7gz1T4GM;
	Tue, 23 Jun 2026 21:59:25 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 460EE40363;
	Tue, 23 Jun 2026 22:08:05 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 23 Jun 2026 22:08:04 +0800
Message-ID: <7d46a48c-8805-09e1-4818-807953898fb4@huawei.com>
Date: Tue, 23 Jun 2026 22:08:03 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>, <sj@kernel.org>,
	<akinobu.mita@gmail.com>, <damon@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <akpm@linux-foundation.org>, <corbet@lwn.net>, <bijan311@gmail.com>,
	<ajayjoshi@micron.com>, <honggyu.kim@sk.com>, <yunjeong.mun@sk.com>
References: <20260529165640.820-1-ravis.opensrc@gmail.com>
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93243-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.linux.dev,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ravis.opensrc@gmail.com,m:sj@kernel.org,m:akinobu.mita@gmail.com,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:bijan311@gmail.com,m:ajayjoshi@micron.com,m:honggyu.kim@sk.com,m:yunjeong.mun@sk.com,m:ravisopensrc@gmail.com,m:akinobumita@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zengheng4@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:mid,huawei.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zengheng4@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[h-partners.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB2626B7BF9

Hi Ravi,

On 2026/5/30 0:56, Ravi Jonnalagadda wrote:
> This series introduces a vendor and PMU-agnostic substrate inside DAMON
> that consumes hardware-sampled access reports through the standard
> perf-event interface.  Userspace selects the PMU through sysfs (raw
> type/config knobs), driving either Intel PEBS L3-miss sampling or AMD
> IBS Op sampling.
> 

[...]

> 
> Ravi Jonnalagadda (6):
>    mm/damon: add struct damon_perf_event{,_attr} and per-ctx perf_events
>      list
>    mm/damon/sysfs-sample: expose perf_events configuration via sysfs
>    mm/damon/sysfs: install perf_events on apply
>    mm/damon/core: per-CPU SPSC ring drain and damon_perf_event lifecycle
>    mm/damon/vaddr: implement perf-event access check
>    mm/damon: add damos_node_eligible_mem_bp tracepoint
> 
>   include/linux/damon.h        |  80 +++++
>   include/trace/events/damon.h |  49 +++
>   mm/damon/core.c              | 403 ++++++++++++++++++++----
>   mm/damon/ops-common.h        |  39 +++
>   mm/damon/sysfs-common.h      |   6 +
>   mm/damon/sysfs-sample.c      | 579 +++++++++++++++++++++++++++++++++++
>   mm/damon/sysfs.c             |   3 +
>   mm/damon/vaddr.c             | 267 ++++++++++++++++
>   8 files changed, 1370 insertions(+), 56 deletions(-)
> 
> 
> base-commit: 4c8ad15abf15eb480d3ad85f902001e35465ef18

I wasn't able to apply this patch series to the linux (and linux-next)
mainline branch, and also had trouble identifying the source of the base
commit.

Would you mind sharing where this baseline is from?

Thanks in advance!


Best Regards,
Zeng Heng

