Return-Path: <linux-doc+bounces-92281-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V+wvNeINLmorpAQAu9opvQ
	(envelope-from <linux-doc+bounces-92281-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 04:11:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A896803D8
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 04:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92281-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92281-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CEBB300DDD5
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 02:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BD1224234;
	Sun, 14 Jun 2026 02:11:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9D21FF2A
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 02:11:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781403094; cv=none; b=k/66ANVeKwN/D1eUIg7YjTAZm0XyPniL1eI6Lijbufw1ZgzSrnH/Ed0z74R9k3eRTH1lJqR7VBYLWV6ueHIef/9XWmzKrcsn1pgANSQ1rkzB40XnhBXcmupp+Cf+skptBoskajj8kac54MAI3YwXaN0GRtndJki0lUO5oYi3Gl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781403094; c=relaxed/simple;
	bh=/TmpsURhEHqg14NcBlP2d3UQmMBclGEWmzmDYTVpvtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAj6fEvuweUH56W9Bc1PuXTDdDPfScCDIpeHqbwyve2rXGlY1P2yc64VKN/jOaq0K7L6cCbOmoeQ2EUgPYxoKBA2VeMc7UUkFWCXbr4oesTtvC1E9gqQklCqsD2Zkp0l9G0+Ti8y7c5PpTE/QQEAW7MA4CcQDtaiXy8GmM+CUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAnCQ6qDS5q0sAkAA--.37873S2;
	Sun, 14 Jun 2026 10:10:50 +0800 (CST)
Received: from [172.31.11.49] (unknown [120.236.78.138])
	by gateway (Coremail) with SMTP id _____wB3oBCpDS5q0SgeAA--.32977S2;
	Sun, 14 Jun 2026 10:10:49 +0800 (CST)
Message-ID: <0b7e4f61-c41c-4c15-9569-f059159816dd@hust.edu.cn>
Date: Sun, 14 Jun 2026 10:10:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613211300.86016-1-enelsonmoore@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260613211300.86016-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnCQ6qDS5q0sAkAA--.37873S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZF1xuFy7Gw1xKr47tw1UJrb_yoW8JF1DpF
	Z7KrWxJ3WftF15C3ykC3y8W3WrJan7Gw45GFsrt3Zrtwn3JFWrJr4Yyry2gasxWryfAFWf
	XrZ0kryq9asFywUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Xr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0zRK-e5UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92281-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,hust.edu.cn:email,hust.edu.cn:mid,hust.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A896803D8


On 6/14/26 5:12 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of accounting/psi.rst
> contains a typo CONFIG_CGROUP for CONFIG_CGROUPS. Fix it.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   Documentation/translations/zh_CN/accounting/psi.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/accounting/psi.rst b/Documentation/translations/zh_CN/accounting/psi.rst
> index a0ddb7bd257c..703bc81ff9be 100644
> --- a/Documentation/translations/zh_CN/accounting/psi.rst
> +++ b/Documentation/translations/zh_CN/accounting/psi.rst
> @@ -148,7 +148,7 @@ psi接口提供的均值即可。
>   Cgroup2接口
>   ===========
>   
> -对于CONFIG_CGROUP=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
> +对于CONFIG_CGROUPS=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
>   此场景下cgroupfs挂载点的子目录包含cpu.pressure、memory.pressure、io.pressure文件，
>   内容格式与/proc/pressure/下的文件相同。
>   


