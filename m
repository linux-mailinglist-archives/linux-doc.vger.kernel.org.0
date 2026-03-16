Return-Path: <linux-doc+bounces-79495-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJPbIKMbuGlYZAEAu9opvQ
	(envelope-from <linux-doc+bounces-79495-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:02:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165229BEEA
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CE8303351B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA79304BBF;
	Mon, 16 Mar 2026 14:57:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817C226CFE;
	Mon, 16 Mar 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673021; cv=none; b=BeixRicFAoXI+O1kU6OTM7sHbrKuUNtvodVB9TpcZLkkMoNBADSCgQlY8oX7rlH3LyyUSG6ju9dOR3ELUmTG67VE5cznYzgPR8I+lbSrcreQkRqYsGK8YudZtDYrDvcz1dr5RK9ImRrZZcV2tBzbuJOzpdNcm85LO4zrhVvTOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673021; c=relaxed/simple;
	bh=0tQ4AO1pYWqmHKVxwkLqbgpODFiZqoRX5Ryr/5AoaCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KtndDcWzGDEf7V1jtOLqdBPqQplIUlaUelnmYD3t6FIOww3XW/OzIpNxbplYXcOlA9r0g9Hy74vNnTqiRH9deF4s4dBkB4vSPRExxzANpzhhsUQo9BaztIHs5Az/rLejqxtSASeeC6dDRGxTeHUo6Iriwcz6HlrZgxIiRP6HmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei-partners.com; spf=pass smtp.mailfrom=huawei-partners.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei-partners.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei-partners.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fZJ7P42sszJ4692;
	Mon, 16 Mar 2026 22:56:01 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 2643040569;
	Mon, 16 Mar 2026 22:56:56 +0800 (CST)
Received: from [10.123.123.154] (10.123.123.154) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 17:56:55 +0300
Message-ID: <224a29a1-13cb-41aa-8736-aebe1023fb7d@huawei-partners.com>
Date: Mon, 16 Mar 2026 17:56:55 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Docs/mm/damon: Document DAMON actions when
 TRANSPARENT_HUGEPAGE is off
To: SeongJae Park <sj@kernel.org>
CC: <artem.kuzin@huawei.com>, <stepanov.anatoly@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yanquanmin1@huawei.com>, <zuoze1@huawei.com>,
	<damon@lists.linux.dev>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
	<Liam.Howlett@oracle.com>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
References: <20260316144848.99972-1-sj@kernel.org>
Content-Language: en-US
From: Gutierrez Asier <gutierrez.asier@huawei-partners.com>
In-Reply-To: <20260316144848.99972-1-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: mscpeml500004.china.huawei.com (7.188.26.250) To
 mscpeml500003.china.huawei.com (7.188.49.51)
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei-partners.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gutierrez.asier@huawei-partners.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79495-lists,linux-doc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.974];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,huawei-partners.com:email,huawei-partners.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8165229BEEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi SJ,

On 3/16/2026 5:48 PM, SeongJae Park wrote:
> Hello Asier,
> 
> 
> Thank you for sending this patch. :)
> 
> On Mon, 16 Mar 2026 14:08:21 +0000 <gutierrez.asier@huawei-partners.com> wrote:
> 
>> From: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
>>
>> MADV_HUGEPAGE and MADV_NOHUGEPAGE are guarded and they
>> are not available when compiling the kernel without TRANSPARENT_HUGEPAGE
>> option. The DAMON behaviour is to silently fail[1] in when DAMOS_HUGEPAGE or
> 
> checkpatch.pl shows a warning for the above line:
> 
>     WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>     #12:
>     option. The DAMON behaviour is to silently fail[1] in when DAMOS_HUGEPAGE or

Yes, this is due to the link. I tried to keep this patch compact, without a
cover letter. I will submit a new version without the link.

>> DAMOS_NOHUGEPAGE are used, but TRANSPARENT_HUGEPAGE is disabled. Update the
>> DAMON documentation to reflect this behaviour.
>>
>> [1]: https://lore.kernel.org/damon/66131775-180b-4b9f-b7ce-61a3e077b6e6@huawei-partners.com/T/#m278d3c9bbedcceaf2efa51e3dc7b40a40654e51c
>>
>> Signed-off-by: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
> 
> Reviewed-by: SeongJae Park <sj@kernel.org>
> 
> Andrew might add this to mm.git while fixing the checkpatch warning on his own.
> Let's give time for Andrew today.
> 
> I also added this to damon/next tree after fixing the warning.  If Andrew
> doesn't pick this with the fix today, I will post mine as v2 of this patch
> tomorrow.  If you prefer to do the v2 posting on your own, just let me know :)
> 
> 
> Thanks,
> SJ
> 
> [...]
> 

-- 
Asier Gutierrez
Huawei


