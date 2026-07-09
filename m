Return-Path: <linux-doc+bounces-95951-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eq9rF0OKT2q7jAIAu9opvQ
	(envelope-from <linux-doc+bounces-95951-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 13:47:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F873091C
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 13:47:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95951-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95951-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F076830BE14D
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 11:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF1D3F786E;
	Thu,  9 Jul 2026 11:41:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1950718C008;
	Thu,  9 Jul 2026 11:41:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597288; cv=none; b=mzYcyIwq/p9h5M6AhCHl05vnkmmqz4mqScigcffO8YhsUO3HDhcLGPobSxllvOWojiLn2KeNhU/83dvnx1qluWHeqHFdwkLd3IP84EiiWZkUPuTAbmhgwIHfay6mE0QuwguAYugT5unQLrFrmAmrobinxVPzTAO2gZGADhLTO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597288; c=relaxed/simple;
	bh=0xdS83oiT6Ai/yx5hafRImRZGhbGDJgNU8qQQXbzS8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UD73+cPrkq32Esbf9UqRsip0Ze7PmMDYPdeQ3osN0C93U5hMF04i6QFxU9WPqH2Eo0e7F5Gbyov1p2bEsUYV/MRV/zJZUriDvI5n4rpHW9say9AbbovYwdG0VivMBpkvvdg/CQOaUdejIrAqrb1D2vX0EkPyt45dujfEOzK26Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.229.168.213
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAHLaLViE9qSpa_AQ--.6654S2;
	Thu, 09 Jul 2026 19:41:09 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wCHgNfTiE9qo_itAA--.25541S2;
	Thu, 09 Jul 2026 19:41:08 +0800 (CST)
Message-ID: <ec8a1a82-c5b1-4e5b-a103-7e4b91348630@hust.edu.cn>
Date: Thu, 9 Jul 2026 19:41:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/doc: Fix stale em_pd_energy() reference in
 sched-energy
To: luoliang@kylinos.cn, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260707085335.2942128-1-luoliang@kylinos.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260707085335.2942128-1-luoliang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAHLaLViE9qSpa_AQ--.6654S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1rZrW7ur48XF13uryxGrg_yoW5Ww17pF
	yvgr4Iq3WfArn8KryxCw1UXryrX3yxCw4UGF45t3Zaqrs5XrW0kw13tw13Gr97Zry0yFZr
	ZryYg34Iy342vw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUnb4S5UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95951-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luoliang@kylinos.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hust.edu.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kylinos.cn:email,hust.edu.cn:from_mime,hust.edu.cn:email,hust.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B7F873091C


On 7/7/26 4:53 PM, luoliang@kylinos.cn wrote:
> From: Liang Luo <luoliang@kylinos.cn>
>
> The scheduler energy-aware placement documentation refers to the
> em_pd_energy() API, which was renamed to em_cpu_energy() in commit
> f0b5694791ce ("PM / EM: change name of em_pd_energy to em_cpu_energy").
> Update the reference to the current name.
>
> em_cpu_energy() is the EM helper that compute_energy() in
> kernel/sched/fair.c calls to estimate a performance domain's energy
> consumption (defined in include/linux/energy_model.h).
>
> Sync the zh_CN translation, which carries the same stale name.
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Signed-off-by: Liang Luo <luoliang@kylinos.cn>
> ---
>   Documentation/scheduler/sched-energy.rst                    | 2 +-
>   Documentation/translations/zh_CN/scheduler/sched-energy.rst | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/scheduler/sched-energy.rst b/Documentation/scheduler/sched-energy.rst
> index 4e47aaf103eb..83bac0da4869 100644
> --- a/Documentation/scheduler/sched-energy.rst
> +++ b/Documentation/scheduler/sched-energy.rst
> @@ -141,7 +141,7 @@ in its previous activation.
>   find_energy_efficient_cpu() uses compute_energy() to estimate what will be the
>   energy consumed by the system if the waking task was migrated. compute_energy()
>   looks at the current utilization landscape of the CPUs and adjusts it to
> -'simulate' the task migration. The EM framework provides the em_pd_energy() API
> +'simulate' the task migration. The EM framework provides the em_cpu_energy() API
>   which computes the expected energy consumption of each performance domain for
>   the given utilization landscape.
>   
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> index fdbf6cfeea93..03dedc69839a 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> @@ -119,7 +119,7 @@ EAS覆盖了CFS的任务唤醒平衡代码。在唤醒平衡时，它使用平
>   
>   如果唤醒的任务被迁移，find_energy_efficient_cpu()使用compute_energy()来估算
>   系统将消耗多少能量。compute_energy()检查各CPU当前的利用率情况，并尝试调整来
> -“模拟”任务迁移。EM框架提供了API em_pd_energy()计算每个性能域在给定的利用率条件
> +“模拟”任务迁移。EM框架提供了API em_cpu_energy()计算每个性能域在给定的利用率条件
>   下的预期能量消耗。
>   
>   下面详细介绍一个优化能量消耗的任务放置决策的例子。


