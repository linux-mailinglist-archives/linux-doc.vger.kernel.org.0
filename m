Return-Path: <linux-doc+bounces-83556-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHEAHBRr4GnggQAAu9opvQ
	(envelope-from <linux-doc+bounces-83556-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 06:52:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCA40A3B0
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 06:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C51F030A0AB2
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 04:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF2E248F64;
	Thu, 16 Apr 2026 04:52:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A22533CE9A;
	Thu, 16 Apr 2026 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776315131; cv=none; b=qsfY3ZwQyhE1QAMOUMyh4edhvnV/G3ULK0abI8g6BAsDC6atHjLHlLWVEh0YI0kFnINKfJvMaJxTIz8+JHgMPCxfu9CV75GtAXMVOAdl2r32OUT3nF1stHxsM0K+tB5a5qPY3HFTtxjYpfePcK+eB34jOMeWyhS0NQOpC1mc3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776315131; c=relaxed/simple;
	bh=UNRrCzLYgcw55l36z3jzmQwiHUrIy2lJiJUiDT/afAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVzb9KRv93yZaFYZKQpXpoHqIl8F8RMcS5bPzcYMajWnIcRurLeQnrTgHz1nNQFk+rHbwAPAEloUBl6S3/lHYcBpJN4cP8boQE6fg3wmzxJW/G22zFyzrZrRK4btMCiuy2hn8dxgg7Rx7B9kfg3BGP4L5VXL77lLTM0chkXd/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrADHz9_SauBpTEXIAw--.57479S2;
	Thu, 16 Apr 2026 12:51:30 +0800 (CST)
Received: from [10.12.170.198] (unknown [10.12.170.198])
	by gateway (Coremail) with SMTP id _____wBXX9fQauBpZefLAA--.4507S2;
	Thu, 16 Apr 2026 12:51:29 +0800 (CST)
Message-ID: <218e1d00-6394-4d4e-a9f6-73e3d7c104a5@hust.edu.cn>
Date: Thu, 16 Apr 2026 12:51:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add --no-merges to git log example in
 how-to.rst
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <20260416042647.3646595-1-ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260416042647.3646595-1-ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrADHz9_SauBpTEXIAw--.57479S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1DZF47Ww17GrWxuw4UJwb_yoW8Jw1UpF
	ykKa4xK3Z7tF1jkw12gr9Fg3W7ZFnrGa17Gr4DtwnYqrnrt3yktFyjy3s0grZ7Xry09ay5
	JFWava9YgFW29rDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dzm91@hust.edu.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83556-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[hust.edu.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openatom.club:email,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22BCA40A3B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/16/26 12:26 PM, Ben Guo wrote:
> Add --no-merges flag to prevent referencing merge commits in the
> through-commit field of translation commit messages.
>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>   Documentation/translations/zh_CN/how-to.rst | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 7ae5d876588..39ed7054fa3 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -257,7 +257,9 @@ Git 和邮箱配置
>   
>   	Update the translation through commit b080e52110ea
>   	("docs: update self-protection __ro_after_init status")
> -	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容
> +	# 请执行 git log --no-merges --oneline <您翻译的英文文档路径>
> +	# 并替换上述内容。注意：应引用实际修改文件内容的 commit，
> +	# 而非 merge commit
>   
>   	Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
>   	# 如果您前面的步骤正确执行，该行会自动显示，否则请检查 gitconfig 文件


