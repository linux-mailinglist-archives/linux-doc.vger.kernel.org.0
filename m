Return-Path: <linux-doc+bounces-91309-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZ9RFJNoJmozWAIAu9opvQ
	(envelope-from <linux-doc+bounces-91309-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:00:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5C6534E2
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:00:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91309-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91309-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14D67301C8B2
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D56534DB72;
	Mon,  8 Jun 2026 06:58:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4E32609C5;
	Mon,  8 Jun 2026 06:58:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901927; cv=none; b=T/4ikXpv2bIFEYFlZ4fWdo0BG2fPxwu2sLL390j6E4tGIxCCDmqVJX2jq53r5o48oMBnTl8E75oWJP/wWfK50W87vRFPF+wgA2WZuMoDp6vAS4hvAdb9ZAjbsmlKAsLdaxEbo3DQd+h5bf2kUhgU+47LCDaURke3qVZqpU79M98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901927; c=relaxed/simple;
	bh=4j2NsQcX3l+LMH7OnGZvlcFy69ikfwcYFnc4uco+C4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ7jtnjNf2ynZ7HOveHgNG76TyJX0Obx8aXNEhNGMl4rbeRpSyw5I13urwCJxtdpabsCXGK6WGxwhWDglwcsuRRZrLT/7R0W8voLQ4LtoTLiPhU+F2MAa8LKleYM1mC1PeIDBK/8JIyr5oGJ4ghV2Cbdj9ubiRT4fDNdLWN6FDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABnZ6D7ZyZq9_NnAA--.32519S2;
	Mon, 08 Jun 2026 14:58:03 +0800 (CST)
Received: from [10.12.169.28] (unknown [10.12.169.28])
	by gateway (Coremail) with SMTP id _____wB3fwv4ZyZqW+QyAA--.62654S2;
	Mon, 08 Jun 2026 14:58:01 +0800 (CST)
Message-ID: <150c4c64-f3fb-439f-b15f-e04cab3d232f@hust.edu.cn>
Date: Mon, 8 Jun 2026 14:58:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] docs/zh: update DAMON usage sysfs documentation
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 SeongJae Park <sj@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, damon@lists.linux.dev,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Hu Haowen <2023002089@link.tyut.edu.cn>
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
 <20260608060302.1564003-1-doehyunbaek@gmail.com>
 <CAN-j9UrkjjrO-1fs9Q4_HQMTM5Gj1qjyNLF5F1JG+Wzimd5naw@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAN-j9UrkjjrO-1fs9Q4_HQMTM5Gj1qjyNLF5F1JG+Wzimd5naw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABnZ6D7ZyZq9_NnAA--.32519S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrykXry3Gr48CF4fGF4rXwb_yoWDtFg_Zr
	W8ZFy7Z3yYqas8JFWkKrnxCrWDuF40qws8Za4Dt3yUArs0qa1DAr1kW39Y934xXr4kAFZx
	Crn0qa1furnxujkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbm8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j6a0QUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91309-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:sj@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:damon@lists.linux.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:2023002089@link.tyut.edu.cn,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hust.edu.cn:from_mime,hust.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9F5C6534E2


On 6/8/26 2:05 PM, Doehyun Baek wrote:
> Hi, thanks for your kind reply.
>
> Sorry for not following the how-to.rst. I should have taken more care.
>
> I updated the commit messages and sent v2 patches.

Thanks for your quick feedback. But please keep a rule in mind - Do not 
top-posting in the LKML.

I will review patch v2 ASAP.

Dongliang Mu

>
> Best,
>
> On Mon, Jun 8, 2026 at 8:03 AM Doehyun Baek <doehyunbaek@gmail.com> wrote:
>
>     Changes since v1:
>     - Revise both commit messages to follow the translation update format
>       documented in Documentation/translations/zh_CN/how-to.rst.
>
>     Doehyun Baek (2):
>       docs/zh_CN: update DAMON usage Chinese translation
>       docs/zh_TW: update DAMON usage Traditional Chinese translation
>
>      .../zh_CN/admin-guide/mm/damon/usage.rst      | 56
>     +++++++++++++------
>      .../zh_TW/admin-guide/mm/damon/usage.rst      | 56
>     +++++++++++++------
>      2 files changed, 80 insertions(+), 32 deletions(-)
>
>
>     base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>     -- 
>     2.43.0
>
>
>
> -- 
> Doehyun Baek


