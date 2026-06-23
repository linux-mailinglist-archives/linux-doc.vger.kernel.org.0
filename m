Return-Path: <linux-doc+bounces-93209-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olyRF2JKOmqt5QcAu9opvQ
	(envelope-from <linux-doc+bounces-93209-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:57:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E46B57A8
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93209-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93209-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF0531215AD
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23F3C73EA;
	Tue, 23 Jun 2026 08:51:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B593C585A
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 08:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204698; cv=none; b=BePczLhZNIVlZUXOumw2y/+iX82jtFL7aD/hB0Klzr8o3xEiLAlWvGbH8zGbulIZkolkDgnYGV3qoYgAol+4PU95Lfv/JFovWvU1DsZ68nCb8Mhu2U/L8hZOpv002Ud9Fua6kQlQ8fEue8IKwLSD8mL2F1kRGB9ZNRsKMFLOTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204698; c=relaxed/simple;
	bh=j70UqBoWvLRtq2kxFPUbHLnAtw9HjRG4XLfa+/DtLuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGPljV330lEpa+TATN5qVTArBb94wyVyncXQohP83ag02XLCao4bD/3qIqxPXuBGikRottrbUFdxxK4nTqPpizi216Uukg9bOkamiSLP+yFwOx56oSSxATCGyMsRCdVyWV/8IIsw6qvfbWZCTApkBG0xr9qlAQGDg2rwpH4VyHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrADXmjYKSTpqpSU5AA--.40841S2;
	Tue, 23 Jun 2026 16:51:22 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD30BEISTpqY45PAA--.61608S2;
	Tue, 23 Jun 2026 16:51:20 +0800 (CST)
Message-ID: <b03f244b-46b8-47e8-b7f5-d98d714ae15c@hust.edu.cn>
Date: Tue, 23 Jun 2026 16:51:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue cloning kernel-doc-zh from HUST mirror
To: Siwei Chen <businiaoanka@anka1.top>, linux-doc@vger.kernel.org
Cc: si.yanteng@linux.dev, wy@wyuan.org
References: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrADXmjYKSTpqpSU5AA--.40841S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47urW3WFW3uF4kGFyUWrg_yoW8XrWxpF
	WSkwn3Kr1rGF17A34vk3y0krWjvrWkGr45Jr98Jw1rCrnIga4kZr4akanxuF9xurZakw4j
	qF1xWr1kKan8uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw2
	0F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I2
	7wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r4UJVWxJr1lYx0E74
	AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GF
	W3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0mi
	iDUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[13.76.78.106:received];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93209-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hust.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:businiaoanka@anka1.top,m:linux-doc@vger.kernel.org,m:si.yanteng@linux.dev,m:wy@wyuan.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A73E46B57A8


On 6/23/26 3:39 PM, Siwei Chen wrote:
> Hello,
>
> I am following the documentation at:
>
> https://docs.kernel.org/translations/zh_CN/how-to.html#id3
>
> When trying to clone the repository from the recommended mirror:
>
> git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
>
> I consistently get the following error:
>
> error: RPC failed; curl 52 Empty reply from server
> fatal: expected 'packfile'
Hello Siwei,

The long answer is as follows:

The curl 52 Empty reply from server error is not a Git or Ubuntu 
compatibility issue. It happens because the kernel-doc-zh repository is 
extremely large, and the HUST mirror server closes the HTTPS connection 
early due to timeout or proxy limits.

You can try the following commands:


      1. Shallow clone first (most reliable)



      git clone --depth 1
      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux



      Then fetch full history:



      git fetch --unshallow

If still failing, increase Git buffer like:

git config --global http.postBuffer 1073741824



      Finally, I will contact maintainers of HUST mirror site and try
      some attempts to resolve this issue.

Dongliang Mu

>
> My environment is:
>
> Ubuntu 26.04
> git version 2.53
>
> I have verified that the URL is reachable from my network, but the clone
> operation still fails.
>
> Could anyone help me understand whether this is a mirror-side issue, a Git
> compatibility issue, or something wrong with my setup?
>
> Thank you for your time.
>
> Best regards,
> Siwei Chen
>


