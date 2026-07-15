Return-Path: <linux-doc+bounces-96879-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r3E8ErjoVmorCwEAu9opvQ
	(envelope-from <linux-doc+bounces-96879-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:56:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD42F759FBC
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96879-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96879-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CEB5301F4BD
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 01:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE81886341;
	Wed, 15 Jul 2026 01:56:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A076B38F653
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080564; cv=none; b=hZRTn5qVgEibJvnDpWunBbRZoBsEXEwhUTcQGOZszRBHtrVf+Y+rxYuxCeLqnVpaEQjOamorElxBdynbcplmQu5NIT9iHXcMfhHYi0IfgO9Yp8V2JL7CsIilY4TSX74AAb1Vx8evi41qgZnqoLo6gavW9Yws7o74OIxhWKZ1T08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080564; c=relaxed/simple;
	bh=pabU2DrBONdzNZumK8alQTYyFJzt2AVA2IMSbinFY48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZqdQ8LPb7NixNnnbplcxQFn2QLCmazElywzJqOJW69ebktutae54VtaTZZluQnqEA4/ZlaMfoEQ4Gc9wTdnM0ESQXW9Y0LXMFzi2h7ZcUvwLsRCYacrWHG+atyNn6ABGtKieo2eLJJCPk6UT5lpOCH0XeBVjMHlxPE5oiD7XY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAX7qKZ6FZqzP4FAg--.15716S2;
	Wed, 15 Jul 2026 09:55:37 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3IBKX6FZqTvnNAA--.5042S2;
	Wed, 15 Jul 2026 09:55:37 +0800 (CST)
Message-ID: <ecae49cd-4861-44e0-b873-6ca98e205855@hust.edu.cn>
Date: Wed, 15 Jul 2026 09:55:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
To: Doehyun Baek <doehyunbaek@gmail.com>, Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>,
 chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
 Haoyang Liu <tttturtleruss@gmail.com>
References: <alZK0i0HvxOvSKwj@wyuan.org> <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
 <alZ1AzLX8LrB-JFK@wyuan.org>
 <CAN-j9Uo2f4dmWo8bMkdtXg7g6uayK_XZatkGs5iKv6-dNZ_Y-g@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAN-j9Uo2f4dmWo8bMkdtXg7g6uayK_XZatkGs5iKv6-dNZ_Y-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAX7qKZ6FZqzP4FAg--.15716S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xw15Xry3ZF1DJrW3urWUtwb_yoW8Jr4kpr
	WSgas8ua1Fq3sYyFn7Jw1Ivr1Fkw4xWF9xK3Z5Gw4kCas8GFsYvas7twnrCr9Igrn5tF1a
	grWj9r95W3Z8AFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,openatom.club,garyguo.net,qq.com,gmail.com,tsinghua.edu.cn];
	TAGGED_FROM(0.00)[bounces-96879-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:wy@wyuan.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:qiujiandong1998@gmail.com,m:chengyaqiang@tsinghua.edu.cn,m:tttturtleruss@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,wyuan.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD42F759FBC


On 7/15/26 1:56 AM, Doehyun Baek wrote:
>> Btw, for example, my patch (Weijie Yuan · docs/zh_CN: add docs-next
> checkout workaround) is actually directly discarded after we reached
> a consensus during our communication (with Dongliang). But it's
> obvious that we didn't say it explicitly. So your website can't
> recognize it automaticly right now. Perhaps we can think about how
> to deal with this situation later.
>
> Yeah, this is a downside of an automated approach: it can miss details
> that are only implicit in the discussion. I see roughly three ways to
> handle such cases:
>
> 1. Allow authors to mark a patch explicitly by replying with a
> recognized phrase, such as `Patch-status: withdrawn`.

This is better.

Or similar to syzbot, we can provide an option in the webpage to 
directly mark patchset as invalid.

> 2. Use natural-language reasoning, perhaps with an LLM, to infer the
> outcome from the discussion. I leaned against it due to cost and
> complexity.
> 3. Leave the patch pending and let it move to “Cold” automatically
> after 30 days.
Better together with 1. We may forget to reply a mark patch when busy.
>
> I think either the first or the third option makes sense in this situation.
>
> Thanks,
> Doehyun


