Return-Path: <linux-doc+bounces-91934-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4kq9FoJsKmqMpAMAu9opvQ
	(envelope-from <linux-doc+bounces-91934-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 10:06:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B066FB0B
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 10:06:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91934-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91934-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A653302087E
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 08:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8291363095;
	Thu, 11 Jun 2026 08:06:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591192C0F6D
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 08:06:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165181; cv=none; b=ptF7M5rLpQfacsY3OkkTeMkiIeWlfYt3kSPxZ83Vy2DpcXNvfTl4RR+kXZ6KUWK3BkdAMjZCs9J8lu0gr+6fdDZcQrE0CXedM0wYqNFQqZDWrM3HqpdvVg6wNtkl6r/5aKGwTqqc0AquVZpSbYqqPlzgeMUmYkW3yX3wmaFGlII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165181; c=relaxed/simple;
	bh=jtDIDuopZZGXlUyYdzFI642a9/uAa23vFQbe18W7ni4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeWXux3LP46x5Y6/3MMHUEcyXy6cSeyVQPKUgslzEcJVsEj3q2AX8oNPdHfR4aj/9Gohbv8GxDupOnhPVDdCqDY8gnXF8Ri23XHPlN7eneQ6YDPgV/p2N4Xugaml0Ae/aPjpYaEsMPFy1oARJHU8wyekczd/amTzIGuk7jo3w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAAnCQ5mbCpqIfweAA--.20561S2;
	Thu, 11 Jun 2026 16:05:58 +0800 (CST)
Received: from [192.168.1.27] (unknown [58.19.0.202])
	by gateway (Coremail) with SMTP id _____wBHTwtbbCpqQ_dBAA--.8847S2;
	Thu, 11 Jun 2026 16:05:50 +0800 (CST)
Message-ID: <5534fe73-f81c-4180-96c4-4b306d608796@hust.edu.cn>
Date: Thu, 11 Jun 2026 16:05:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260610231836.186610-1-enelsonmoore@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260610231836.186610-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnCQ5mbCpqIfweAA--.20561S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFykKF1xAFyfKr1rtw45Awb_yoW8AryDpa
	9a93yxKa1vyw1Yk3ykKr17Wan7Kay3Ww15G34Dt3WktrnYvrWktFnrtryFgFWfZryrAayr
	Ja1xtFW3A34ayrUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVZ2-DUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91934-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F1B066FB0B


On 6/11/26 7:18 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of security/self-protection.rst
> contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.

Yes, it is a typo in the Chinese translation.

Please strip the following content from the commit message. If you would 
like to enrich the above paragraph, that's better.

Dongliang Mu

>
> I don't speak Chinese, but I verified that CONFIG_COMPAT was what was
> intended via Google Translate.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>   Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index 93de9cee5c1a..ad96bb4a4995 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>   --------------------
>   
>   对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
> -CONFIG_CONPAT。然而，这种情况通常不可行。
> +CONFIG_COMPAT。然而，这种情况通常不可行。
>   
>   “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>   运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码


