Return-Path: <linux-doc+bounces-88173-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Uaa5ATESC2o5/wQAu9opvQ
	(envelope-from <linux-doc+bounces-88173-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 15:20:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48256D84B
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 037453048165
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 13:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7B53F7878;
	Mon, 18 May 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AUG+V845"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2553EF0B0;
	Mon, 18 May 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109932; cv=none; b=kHWGyjmIJZev3E5Nh/kOCewyYZ3E77Bz6ZJrVDVEgqWjoIyt3v2pkgpBsx+RREZYBi+tTUSSl+3NfgSWmYcItjvafrXrX1ZZGGGefYLrHRGqwat5o0DvRd1qtqEwHWzLj8tg32DTVIqguAI7Ah95JQoplYk7L//6J1aDWjz3ZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109932; c=relaxed/simple;
	bh=OtHSscIw7KS9ksh+qZ2COGphaLYOAU88DvoySK5c2dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k1R26FHV56iwtGpiHghMcCJuksc2Tfxvh1KRAJUuDV+yoF1ipqbfVLIu0rTPgSgC0yWuNWpIg+VIzpkRCyljXs8wxm/spfH0j+zs+KqbucINKC/v6d7+MFdnMiaWR+mMFp2peTXozEMwwmo8dawy7LkOJE+eqO+j5ZmetvkrG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AUG+V845; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qmyhWThThoi7e00Px1dAr0Twxpdyoct4Dvwkiaf6xws=;
	b=AUG+V845ezEN+qhWbQbD8GKFG8VEQaQ237w+4b1I5YrlESP1cWZGs01OfiutO41CbQnspqePr
	+sWYa6rP5FThO8T/WmbJShdaoXBt23jUfqjq9NpBgYVMxxyuaBjqr0omKize7tLHXRRGRtbHLLB
	jKNIljWeHsP4SpYTlungQGg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gJygZ3gttz1K96p;
	Mon, 18 May 2026 21:04:26 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 6933B40565;
	Mon, 18 May 2026 21:12:05 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 18 May
 2026 21:12:04 +0800
Message-ID: <29b4149c-e5b9-4c0c-8292-c0f4189b8f63@huawei.com>
Date: Mon, 18 May 2026 21:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Documentation: fix sampling_down_factor
 documentation range
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <corbet@lwn.net>
CC: <skhan@linuxfoundation.org>, <linux-pm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>, <yubowen8@huawei.com>,
	<linhongye@h-partners.com>, <linuxarm@huawei.com>, <wangzhi12@huawei.com>
References: <20260515094930.273599-1-zhangpengjie2@huawei.com>
 <05980ed2-e591-468c-a528-5b2b74c192d8@oss.qualcomm.com>
From: "zhangpengjie (A)" <zhangpengjie2@huawei.com>
In-Reply-To: <05980ed2-e591-468c-a528-5b2b74c192d8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-Rspamd-Queue-Id: 7A48256D84B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-88173-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangpengjie2@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,huawei.com:email,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Action: no action


On 5/17/2026 1:04 PM, Zhongqiu Han wrote:
> On 5/15/2026 5:49 PM, Pengjie Zhang wrote:
>> The ondemand governor implementation accepts sampling_down_factor values
>> from 1 to 100000 via MAX_SAMPLING_DOWN_FACTOR, but the documentation in
>> admin-guide/pm/cpufreq.rst still says the valid range is 1 to 100.
>>
>> Update the documentation to match the actual code.
>>
>> Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and 
>> consolidation")
>
>
> Thanks Pengjie,
>
> Yes, commit 3f78a9f7fcee introduced MAX_SAMPLING_DOWN_FACTOR (100000),
> and commit 2a0e49279850 updated the documentation later, so the Fixes
> tag is correct.
>
> Small nit: "documentation range" feels a bit redundant; just "range"
> might be enough.
>
> Looks good to me.
>
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
>
Thanks for your review. I'll send out v2 shortly.
Best regards,
     pengjie
>
>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   Documentation/admin-guide/pm/cpufreq.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/pm/cpufreq.rst 
>> b/Documentation/admin-guide/pm/cpufreq.rst
>> index dbe6d23a5d67..fdca59c955dc 100644
>> --- a/Documentation/admin-guide/pm/cpufreq.rst
>> +++ b/Documentation/admin-guide/pm/cpufreq.rst
>> @@ -516,7 +516,7 @@ This governor exposes the following tunables:
>>       of those tasks above 0 and set this attribute to 1.
>>     ``sampling_down_factor``
>> -    Temporary multiplier, between 1 (default) and 100 inclusive, to 
>> apply to
>> +    Temporary multiplier, between 1 (default) and 100000 inclusive, 
>> to apply to
>>       the ``sampling_rate`` value if the CPU load goes above 
>> ``up_threshold``.
>>         This causes the next execution of the governor's worker 
>> routine (after
>
>

