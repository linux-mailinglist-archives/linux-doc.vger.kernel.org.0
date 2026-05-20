Return-Path: <linux-doc+bounces-88582-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBInGVhxDWroxQUAu9opvQ
	(envelope-from <linux-doc+bounces-88582-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 10:31:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FE589CE7
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 10:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6394314A837
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 08:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99433AD508;
	Wed, 20 May 2026 08:15:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB8369D56;
	Wed, 20 May 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264933; cv=none; b=CL9St5yxyNMa1HdAYMpo/dbi9Jbz7IbGI9b7vNnrtXD3BMdh0JeDUkWqP4U/I3aC97UK4Oc2JCzTBZN35HcMQMFJP6ygkI74HazVSDcBUNc1wbnOvKOKhV6HxDTSxaMwHBIwjxKwNOx+mvrq/ReMDzKCibaKsVs+rE1lnREmpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264933; c=relaxed/simple;
	bh=oURHH/nSZlVAhWWjUg646DHoi3gG3YLL3DBukbQPeGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I9B85xbma/1FoF3clShglp8fGLwnXqvF5qQNjfNY9AxM8M5hOxsRoX7plS2G6l3e/e9OMz8WABcdWbGfHhYuDok/pAHrqkx86fT6h0ZqnutXVzePX9M6b8DGetNnGnJaI6LJVJfhnk07AVCBVuxxCqeTqzZBMAGiFew0tUESARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gL41508BPznTV8;
	Wed, 20 May 2026 16:08:25 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id BD8CD40561;
	Wed, 20 May 2026 16:15:23 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 20 May
 2026 16:15:22 +0800
Message-ID: <dd5297cc-cf4a-4d36-b2ae-b12abb30a951@hisilicon.com>
Date: Wed, 20 May 2026 16:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] cpufreq: Remove driver default policy->min/max
 init
To: Pierre Gondois <pierre.gondois@arm.com>, <linux-kernel@vger.kernel.org>
CC: Lifeng Zheng <zhenglifeng1@huawei.com>, Ionela Voinescu
	<ionela.voinescu@arm.com>, Sumit Gupta <sumitg@nvidia.com>, Zhongqiu Han
	<zhongqiu.han@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Huang Rui <ray.huang@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20260511135538.522653-1-pierre.gondois@arm.com>
 <20260511135538.522653-4-pierre.gondois@arm.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260511135538.522653-4-pierre.gondois@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[hisilicon.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhanjie9@hisilicon.com,linux-doc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88582-lists,linux-doc=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DB5FE589CE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/11/2026 9:55 PM, Pierre Gondois wrote:
> Prior to [1], drivers were setting policy->min/max and
> the value was used as a QoS constraint. After that change,
> the values were only temporarily used: cpufreq_set_policy()
> ultimately overriding them through:
> cpufreq_policy_online()
> \-cpufreq_init_policy()
>   \-cpufreq_set_policy()
>     \-/* Set policy->min/max */
> 
> This patch reinstate the initial behaviour. This will allow
> drivers to request min/max QoS frequencies if desired.
> For instance, the cppc driver advertises a lowest non-linear
> frequency, which should be used as a min QoS value.
> 
> To avoid having drivers setting policy->min/max to default
> values which are considered as QoS values (i.e. the reason
> why [1] was introduced), remove the initialization of
> policy->min/max in .init() callbacks wherever the
> policy->min/max values are identical to the
> policy->cpuinfo.min/max_freq.
> 
> Indeed, the previous patch ("cpufreq: Set default
> policy->min/max values for all drivers") makes this initialization
> redundant.
> 
> The only drivers where these values are different are:
> - gx-suspmod.c (min)
> - cppc-cpufreq.c (min)
> - longrun.c
> 
> [1]
> commit 521223d8b3ec ("cpufreq: Fix initialization of min and
> max frequency QoS requests")
> 
Acked-by: Jie Zhan <zhanjie9@hisilicon.com>
for the CPPC part, though the rest looks fine but in case I miss something.
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/cpufreq/amd-pstate.c      | 14 ++++++--------
>  drivers/cpufreq/cppc_cpufreq.c    |  5 ++---
>  drivers/cpufreq/cpufreq-nforce2.c |  4 ++--
>  drivers/cpufreq/freq_table.c      |  7 +++----
>  drivers/cpufreq/gx-suspmod.c      |  2 +-
>  drivers/cpufreq/intel_pstate.c    |  3 ---
>  drivers/cpufreq/pcc-cpufreq.c     | 10 ++++------
>  drivers/cpufreq/pxa3xx-cpufreq.c  |  5 ++---
>  drivers/cpufreq/sh-cpufreq.c      |  6 ++----
>  drivers/cpufreq/virtual-cpufreq.c |  5 +----
>  10 files changed, 23 insertions(+), 38 deletions(-)
> 
[ ... ]

