Return-Path: <linux-doc+bounces-91278-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6yc3C2IlJmr9SgIAu9opvQ
	(envelope-from <linux-doc+bounces-91278-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:13:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E86522FD
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91278-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91278-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A27930062DE
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 02:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3872BD022;
	Mon,  8 Jun 2026 02:13:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10C022576E;
	Mon,  8 Jun 2026 02:13:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780884828; cv=none; b=GQdDvQvi3s32YKbJMUBN0XzHqOuZm40Snpm+voZvVa0Q7Adr7G7xPejC4a+3GbSiMHtVsF2Qzb2vZXnrxxoLgQsx3A0JDVkX8QbE7X+sb4675WUEd85qJblsTjL7cQtatV+8hLInYFGWbXICpfIN+8kEGIP/5yabBXr0QSuS8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780884828; c=relaxed/simple;
	bh=ye/7h8vRT/vmH/8DPzh8vp+7gQ/40g53kFNbXSkrZko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aS1xQ+JeSu54wdezBHeN0aON5xC5+RcsulQHHkvn9Qau0GJVM2emFDi9UXRuJDYV7tfiIhrfrIGginmgQ0o3E6ZYKIXd9t5S+4h2xTnOtGaU+jO3i7FC7tBv01sEYGQwpDqBzTMjLkuupdx6Xpwj9TiZTqVj3X1fCWoVEtcE2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.229.168.213
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrADXmjYgJSZqtVcXAA--.18428S2;
	Mon, 08 Jun 2026 10:12:48 +0800 (CST)
Received: from [10.12.169.28] (unknown [10.12.169.28])
	by gateway (Coremail) with SMTP id _____wCHgAcXJSZqS16oAQ--.47447S2;
	Mon, 08 Jun 2026 10:12:39 +0800 (CST)
Message-ID: <20bde227-fe15-42f2-bc83-51801e1f795d@hust.edu.cn>
Date: Mon, 8 Jun 2026 10:12:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] docs/zh: update DAMON usage sysfs documentation
To: Doehyun Baek <doehyunbaek@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 SeongJae Park <sj@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, damon@lists.linux.dev
References: <20260523094420.741003-1-doehyunbaek@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260523094420.741003-1-doehyunbaek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrADXmjYgJSZqtVcXAA--.18428S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy8CFy5Xw15Kr17Gw4fGrg_yoW5Xryfp3
	Z8CFyIqa13t343Xr13J34UZa1fJFWfJ3yYgF9Fqwn5JF1vqa4kK3WUKryagFyqvrySqFy5
	AFZ8t34xG3W7urJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jDkucUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91278-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:2023002089@link.tyut.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:sj@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:damon@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev,link.tyut.edu.cn];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hust.edu.cn:from_mime,hust.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 250E86522FD


On 5/23/26 5:44 PM, Doehyun Baek wrote:
> Hi,
>
> The Simplified and Traditional Chinese DAMON usage translations are
> missing selected updates that are already documented in the English file.
> As a result, parts of the translated sysfs hierarchy and descriptions are
> stale, and the translations also lack the newer introduction of DAMON's
> special-purpose modules.

Hi Doehyun,

Thanks for your patch. To track the translation status of the 
documentation in different locales, we define a uniform format in 
how-to.rst [1]. Please revise the commit message of two patches.

	docs/zh_CN: Add/Update self-protection index Chinese translation

	Translate .../security/self-protection.rst into Chinese.

	Update the translation through commit b080e52110ea
	("docs: update self-protection __ro_after_init status")
	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容

	Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
	# 如果您前面的步骤正确执行，该行会自动显示，否则请检查 gitconfig 文件

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/translations/zh_CN/how-to.rst#n252

>
> The gaps correspond to the following English documentation commits:
>
>    commit a7bb1e754559 ("Docs/admin-guide/mm/damon/usage: document 'nid' file")
>    commit e85e965bdbec ("Docs/admin-guide/mm/damon/usage: document refresh_ms file")
>    commit e0c725455fd5 ("Docs/admin-guide/mm/damon/usage: document addr_unit file")
>    commit e06469cdf1fd ("Docs/admin-guide/mm/damon/usage: document obsolete_target file")
>    commit 2584dd7496c5 ("Docs/admin-guide/mm/damon/usage: update for max_nr_snapshots")
>    commit 652fd06d20da ("Docs/admin-guide/mm/damon/usage: update stats update process for refresh_ms")
>    commit e7df7a0bfc90 ("Docs/admin-guide/mm/damon/usage: introduce DAMON modules at the beginning")
>    commit d9cfe515d36e ("Docs/admin-guide/mm/damon/usage: document goal_tuner sysfs file")
>

> Update both translations only for those stale DAMON usage entries,
> including refresh_ms, addr_unit, obsolete_target, goal_tuner, nid, and
> max_nr_snapshots.
>
> Doehyun Baek (2):
>    docs/zh_CN: update DAMON usage sysfs documentation
>    docs/zh_TW: update DAMON usage sysfs documentation
>
>   .../zh_CN/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
>   .../zh_TW/admin-guide/mm/damon/usage.rst      | 56 +++++++++++++------
>   2 files changed, 80 insertions(+), 32 deletions(-)
>
>
> base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5


