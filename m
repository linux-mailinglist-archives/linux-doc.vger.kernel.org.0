Return-Path: <linux-doc+bounces-84111-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPuLGFk56GnTHAIAu9opvQ
	(envelope-from <linux-doc+bounces-84111-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 04:58:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9397441A8D
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 04:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96653006171
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 02:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BBA392C34;
	Wed, 22 Apr 2026 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="cPd7jLi/"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D939B49E;
	Wed, 22 Apr 2026 02:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826267; cv=none; b=cos+IH1LiKau5/4Tu2BKL9WozNrG7U+0cSE8yXTw8j2nvteCny46WWvHvixCv9cEjnfntJkTuBy4RG75URgrOtqZWo6KLo0tPWm1tEWxnjsKt8HHU95KgY0OmteuELVMTGVd3PX1VboBJnRmH5cQ4tzXTrh9xdoGenmq7vwilqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826267; c=relaxed/simple;
	bh=5FV3u8ah1n08/nxbXio9Qe6rYH3r3Pu5v8ZvDr8jTOQ=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NUq6oIktKb0LCqHgErvhscRZt/U/EGIVxPBDgnvzCl0ovLxJ2wMSUgr6dG9cuE5nVgUsHzd+G042R7JE9HueeZ/XSJo2ZLkXT0q5SxGNbkuDkNI3pxGvTiuIbzq5DQxaw6PEvEadjpqLhCLeTTx8T+1f4jZCjYb4b8SnHxMbROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=cPd7jLi/; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zYYrLeSCtlIwWe1v/taaHs6p4N+WULPdk6AZYoEa9eY=;
	b=cPd7jLi/JI+BNpF2FcOInnMUj1bgR/zf+GCcJWH44tkf6D+2aN1oVmPTMGYR405U4jIbech9J
	vH4GSa+JpRx6QadZ0YXtyQpGzeolZ8NYvyrvI8MrkJpI2rTJpeH5R2Qd8yMUpxf6E1tvXlhASWd
	U4JChYSShKYEgYYZWPmqogg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4g0k8F1cwHzRhQx;
	Wed, 22 Apr 2026 10:44:29 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id A358C40573;
	Wed, 22 Apr 2026 10:50:51 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 10:50:40 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 10:50:39 +0800
Subject: Re: [PATCH v4 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-1-2d0277f8f601@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <b4be1fc4-d793-cac8-7de1-dfe279c8ff8f@huawei.com>
Date: Wed, 22 Apr 2026 10:50:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260415-ecc_panic-v4-1-2d0277f8f601@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com];
	TAGGED_FROM(0.00)[bounces-84111-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9397441A8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/4/15 20:55, Breno Leitao wrote:
> When get_hwpoison_page() returns a negative value, distinguish
> reserved pages from other failure cases by reporting MF_MSG_KERNEL
> instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
> and should be classified accordingly for proper handling.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.

