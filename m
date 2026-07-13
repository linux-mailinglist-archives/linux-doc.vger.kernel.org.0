Return-Path: <linux-doc+bounces-96491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5X/YKFZQVGomkgMAu9opvQ
	(envelope-from <linux-doc+bounces-96491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 04:41:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FD746B70
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 04:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96491-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96491-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9640F30041D1
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 02:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B796E312826;
	Mon, 13 Jul 2026 02:41:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE3F35B63B;
	Mon, 13 Jul 2026 02:41:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910484; cv=none; b=qGQMXlB8Pd253+f9+grrU43BBNe5s1veEofUINwSU4bjfEOHenfmA9OuR0fz97oj0pXGNb8iQ3T8g0adeRk1hFXfqbQAKcha3fY+kWGQWTuWqXTyGv0iS4/8HME6xos6JdnmReS+ckuPCAH9dsKUFWmHCtXSnBPhjZ6QxrAhzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910484; c=relaxed/simple;
	bh=8H275QvQbkJwvedzxkpnKmsh1Z0k3MuFIm2ngHnoGZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcOw/k2X94aL8y/BZPFGXqY9+j7yY8WNfwoibSV04xi/D7v5/7Kc8Bc0SbavQrUWn1fdaNkYMJ/RAgOHOpdMcTqpmUdL6vFE33nkIN1zuiLiTpDfgq19JZc25qztfkZoRPx6daSbGSv8eb8fDTIWElbAnP4waehaSK0kk4U0MMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrABnSQ5HUFRq8cRmAA--.54881S2;
	Mon, 13 Jul 2026 10:41:11 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXEMdDUFRqGpiAAA--.23670S2;
	Mon, 13 Jul 2026 10:41:07 +0800 (CST)
Message-ID: <9142a749-a3ff-4701-9fed-a3f34086ca04@hust.edu.cn>
Date: Mon, 13 Jul 2026 10:41:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs/zh_CN: Update rust/testing.rst translation
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1783905132.git.ben.guo@openatom.club>
 <a08043009080e3c9bc4717aba9783c3474ec2711.1783905132.git.ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <a08043009080e3c9bc4717aba9783c3474ec2711.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABnSQ5HUFRq8cRmAA--.54881S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyfXryfAr45trWDAr45trb_yoW8Ww1Up3
	yvgFWxK3W8A3W5G34xGr40qFyxGayxKw4UGF1Dtw15Wr4qya4ktrZrtrZ0gFWS9rZ5ZFWF
	vFWI9ryY9r1UZrDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96491-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.guo@openatom.club,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:gary@garyguo.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:hust-os-kernel-patches@googlegroups.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hust.edu.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:from_mime,hust.edu.cn:email,hust.edu.cn:mid,vger.kernel.org:from_smtp,openatom.club:email,garyguo.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 471FD746B70


On 7/13/26 9:46 AM, Ben Guo wrote:
> Update Documentation/rust/testing.rst translation.
>
> Update the translation through commit 09699b24199a
> ("Documentation: rust: testing: add Kconfig guidance")
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   Documentation/translations/zh_CN/rust/testing.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/rust/testing.rst b/Documentation/translations/zh_CN/rust/testing.rst
> index ca81f1cef6e..6747d001299 100644
> --- a/Documentation/translations/zh_CN/rust/testing.rst
> +++ b/Documentation/translations/zh_CN/rust/testing.rst
> @@ -128,10 +128,13 @@ Rust 测试中常用的断言宏是来自 Rust 标准库（ ``core`` ）中的 `
>   
>   这些测试通过 ``kunit_tests`` 过程宏引入，该宏将测试套件的名称作为参数。
>   
> +每个测试套件都应该由 ``rust/kernel/Kconfig.test`` 中的 Kconfig 选项保护。
> +
>   例如，假设想要测试前面文档测试示例中的函数 ``f``，我们可以在定义该函数的同一文件中编写：
>   
>   .. code-block:: rust
>   
> +	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
>   	#[kunit_tests(rust_kernel_mymod)]
>   	mod tests {
>   	    use super::*;
> @@ -158,6 +161,7 @@ Rust 测试中常用的断言宏是来自 Rust 标准库（ ``core`` ）中的 `
>   
>   .. code-block:: rust
>   
> +	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
>   	#[kunit_tests(rust_kernel_mymod)]
>   	mod tests {
>   	    use super::*;


