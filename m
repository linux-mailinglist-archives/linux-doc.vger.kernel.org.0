Return-Path: <linux-doc+bounces-81809-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGMyLcoxy2kbEwYAu9opvQ
	(envelope-from <linux-doc+bounces-81809-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 04:30:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB836377B
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 04:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D243F3038ACB
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 02:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C310D1A6829;
	Tue, 31 Mar 2026 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hW57cjof"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F626AE5;
	Tue, 31 Mar 2026 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924066; cv=none; b=lrz4TMNq7QCLRnvvwEVFpmp3PgqWtvxH6nkUsigAfVL6OeDNr4YlccEhkaq44eFGD79p6ZmR9jwhcwmS9f2dMeLRJCr8GzwBUa57XCtlkVyF8LrSa+Fn9MoD42dOhDqgHMlt3qWPU5xwYuKSBcLnM70nCQaJh1qdJyKzTI3LSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924066; c=relaxed/simple;
	bh=pyGyXPTOpVD9pAnfXN8vhfr31ToJKH4GEt9/K/Z0fuo=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AFYV7mvU8/n3msBJH0cofzoCfQsbtLqt6VHb+ll//IZ6aF4UIB/DKYiPG6P3kkXdI1w74eJv6hR17aYASW0zEn31I3Zk6KLixr/p2LHhiNcvRa1G0Kyae32HOeVg6cHDJ34AFLJT++o7en98+20/bPDfjMp8QaHorWoY2IYv9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hW57cjof; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YnMiibA4W4Ig7F76dyLFhn4fKhWlo5n8E1B42uPMv6U=;
	b=hW57cjofNyt2Z8cfky5nD0k3qupiKnrd769HNDVr4A3bIgeIsfIKeLWlqkHuWqzRPTn2AfcQV
	USdejPQSAK0bUdVRoJzGYDvEUGDw50qMtIzt08JubSyyUz0hypD6PR45EJEIZzhErx4Nfqvtc6O
	MnXUDQSJtgCIyERZJXpiVGc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4flBhN0PSJz1T4Hm;
	Tue, 31 Mar 2026 10:21:56 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A33C4056D;
	Tue, 31 Mar 2026 10:27:35 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 31 Mar 2026 10:27:34 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 31 Mar 2026 10:27:34 +0800
Subject: Re: [PATCH 1/2] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
 <a88d62ee-530c-1a6e-c05f-de324f940b8f@huawei.com>
 <acp8wYLHDGAfhzI5@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <d8d2a5ad-9b8a-f0e2-3eb0-ee820eb7a148@huawei.com>
Date: Tue, 31 Mar 2026 10:27:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <acp8wYLHDGAfhzI5@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81809-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FFB836377B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/30 21:45, Breno Leitao wrote:
> On Mon, Mar 30, 2026 at 03:55:00PM +0800, Miaohe Lin wrote:
>> On 2026/3/23 23:29, Breno Leitao wrote:
>>
>>> @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
>>>  	pr_err("%#lx: recovery action for %s: %s\n",
>>>  		pfn, action_page_types[type], action_name[result]);
>>>  
>>> +	if (sysctl_panic_on_unrecoverable_mf &&
>>> +	    type == MF_MSG_GET_HWPOISON && result == MF_IGNORED)
>>> +		panic("Memory failure: %#lx: unrecoverable page", pfn);
>>
>> MF_MSG_GET_HWPOISON contains some other scenarios. For example, an isolated folio will
>> make get_hwpoison_page return -EIO so we will see MF_MSG_GET_HWPOISON and MF_IGNORED in
>> action_result. But that's recoverable if folio is used by userspace thus panic will be
>> unacceptable.
>> Will it better to check type against MF_MSG_KERNEL_HIGH_ORDER?
> 
> Yes, I was discussing this with akpm, and maybe the better
> approach would be to panic for types MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_KERNEL.
> 
> In both cases, it seems that, the page would not be able to migrate. What do
> you think about a change like this:
> 
> 
> @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
>         pr_err("%#lx: recovery action for %s: %s\n",
>                 pfn, action_page_types[type], action_name[result]);
> 
> +       if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
> +           (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER))
> +               panic("Memory failure: %#lx: unrecoverable page", pfn);
> +
>         return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
>  }
> 

Maybe MF_MSG_UNKNOWN can also be considered? Kernel can't do anything further
for those folios.
BTW I think current code can't reach to MF_MSG_KERNEL and MF_MSG_UNKNOWN cases
bacause there is always a (PageHuge() || HWPoisonHandlable()) check before calling
identify_page_state.

Thanks.
.

