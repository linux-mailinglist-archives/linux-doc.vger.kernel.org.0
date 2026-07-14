Return-Path: <linux-doc+bounces-96698-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPb4LlAIVmoqyQAAu9opvQ
	(envelope-from <linux-doc+bounces-96698-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:58:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92C75326A
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96698-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96698-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70CEF314ED8B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28CF18DB2A;
	Tue, 14 Jul 2026 09:55:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E71832A3D7
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 09:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022906; cv=none; b=YrO7eap/NxxxKZ16e50Gz0917fJhaL8ldyBx35VXZau8DlCciuzcubk3r7PH6AriLFV5ojZXF9kN6aVn+P4n0Ns9Uo5LoDrz9pzXb2IO3OSfK22l40aY3f+home6xqYB+GN3+2MYY6nxAHtoxZD/pDW2xkNrkEhe+qDwpYIPSZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022906; c=relaxed/simple;
	bh=BcVx0BDPd5tIzsMTG/o4OOMqfK+kiK3y/g4pAMQTdHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5A0zaaVxBOSlkyN5608Td4ZIy21EI0e/1nbKeuFKMhoHChgBguuNWpg6QAfdsqkxAyY25Xh5V1rTtnS8HJCYoS62uGVS0peNBDoRqvcDC6gU76MrzxC9BIOQ46DwT+rsnKTir/DZBvKWXUWFF2QiZgDw0ScwZIaPG8nnG6z1Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABHbaJRB1ZqjST9AQ--.48612S2;
	Tue, 14 Jul 2026 17:54:25 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHEsZOB1ZqUIyHAA--.34827S2;
	Tue, 14 Jul 2026 17:54:23 +0800 (CST)
Message-ID: <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
Date: Tue, 14 Jul 2026 17:54:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Weijie Yuan <wy@wyuan.org>, Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Doehyun Baek <doehyunbaek@gmail.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
 <alYGtkVxW_0N-VqE@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alYGtkVxW_0N-VqE@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABHbaJRB1ZqjST9AQ--.48612S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr43Xr1fCF47KFy5urW8Crg_yoW5ZFyDpF
	W5KFZ3Kayvy3WfAw1Iqw48ZF10vFW8C34DXr15Gwn3GFZ8ta40qayxKrWY9FWDWrn5Wa43
	Zw409Fn5GayrAFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUvYsjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,openatom.club,garyguo.net,qq.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-96698-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:wy@wyuan.org,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:doehyunbaek@gmail.com,m:qiujiandong1998@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[wyuan.org,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA92C75326A


On 7/14/26 5:51 PM, Weijie Yuan wrote:
> On Tue, Jul 14, 2026 at 05:32:12PM +0800, Dongliang Mu wrote:
>> On Tue, Jul 14, 2026 at 12:51 AM Weijie Yuan <wy@wyuan.org> wrote:
>>> Hi all,
>>>
>>> Since I made many noise these days on the list, which took up a lot of
>>> maintainers' time. This email summarizes the patches for zh_CN that are
>>> currently pending on the mailing list.
>> This is awesome. Maybe we can establish a dashboard for the activities
>> in zh_CN/TW related patches of linux-doc.
>>
>> I personally kept a knowledge base in the IMA (an app for storing
>> knowledge base in the cloud) in our club to monitor these activities.
> I remember kernel.org itself already provides this:
>
>    https://patchwork.kernel.org/
>
> Is this similar to your idea? But I haven't look deep into patchwork
> before.
>
> Of source, having our own thing is definitely okay.


I am not familar with patchwork too. How about Alex?

Dongliang Mu


>>> * Doehyun Baek (2026-07-08) 7 commits
>>>    [PATCH v6 0/7] docs/zh_CN: update DAMON translations
>>>    [PATCH v6 1/7] docs/zh_CN: update DAMON design translation
>>>    [PATCH v6 2/7] docs/zh_CN: add DAMON_STAT usage translation
>>>    [PATCH v6 3/7] docs/zh_CN: update DAMON index translation
>>>    [PATCH v6 4/7] docs/zh_CN: update DAMON start translation
>>>    [PATCH v6 5/7] docs/zh_CN: update DAMON usage translation
>>>    [PATCH v6 6/7] docs/zh_CN: update DAMON reclaim translation
>>>    [PATCH v6 7/7] docs/zh_CN: update DAMON LRU sort translation
>> Maybe I can take a review tomorrow.
> No rush of course ;-)
>
>>> Okay, I have checked the 200 most recent messages on the mailing list,
>>> going back to 15:09 UTC on February 25, 2026. If I have missed anything,
>>> or I made a mistake somewhere, please let me know.
>>>
>>> As you may have noticed, I borrowed (stole) this idea from Junio C
>>> Hamano. Sending this kind of message, somewhat like a weekly status
>>> report, not only helps maintainers keep track of outstanding work, but
>>> also lets contributors know the current status of their patches.
>> As mentioned before, can we have a dashboard to see the status of
>> patches in zh_CN/TW? This is more useful in my mind.
>>
>>> More importantly, it gives newcomers an overview of the current state of
>>> the project. New contributors can begin not only by submitting patches,
>>> but also by reviewing patches already posted to the mailing list,
>>> thereby learning how our workflow operates. This may also help reduce
>>> the review burden on our friendly maintainers.
>>>
>>> I would like to try this kind of periodic report as an experimental
>>> effort, with its frequency adjusted according to the size of the patch
>>> backlog and the level of activity on the mailing list. What do you
>>> think? Please feel free to make comments.
>> I think this is fine since linux-doc or narrowly zh_CN/TW do not have
>> many volumes of patches per day.
> Exactly. I think Junio C Hamano has a script to do this automaticly, but
> I did this manually because our volumes is not that high as Git.
>
>>> By the way, I borrowed the subject line directly from Git's "What's
>>> cooking in git.git". Does anyone have a better suggestion for the name? ;-)
>> fine with this title
> OK, let's keep it now.


