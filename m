Return-Path: <linux-doc+bounces-78111-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rUBFNNYQqmmBKgEAu9opvQ
	(envelope-from <linux-doc+bounces-78111-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 00:25:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 659042193E3
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 00:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 828F830101D5
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 23:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D178366838;
	Thu,  5 Mar 2026 23:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q7328M9N"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE9366831
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772753109; cv=none; b=mZjTnsL5aoISYQpy7SWYRDF6ajQ8C4f4DzP3rrUuDim0KQhGWc1l0exDAMZdwlOoqHheTrSjKp+Xq7PQB1rLiuT1aR8xtSBQ3dKUvEf6NAdtYXYX0r0fq7st8oZCnUqxfYpGZxvUmIMuNmOxTLXgKRw0+A7J7g6GZUa1mE8Nykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772753109; c=relaxed/simple;
	bh=I8bx73URgsv+B3XTQJSC92UQ3HusOP8ucy62VFj9MGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4DuS74EzWuCQFJLAH8gPJSiPZNe0/XF3U/uxo0hBiy8z8XIYuxbCZnAX/5VfOpjTIb/m5aYmUc3h0PY6JifsDG+7ZkTFEj0X0K7KR9YtspPo62W6iHfkbTAj3vMywYFWWIIkI5M35xVvV4mT0RitM6Xz7A6cgOlr92rM845uQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q7328M9N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8k/b0+8LyXoIZMHfVUIfx66lAJ/OS9UpbQwaLIKWq68=; b=q7328M9NNiN1wLQh23EDWeySmY
	o2jyE36EnBdbkONaoiR5NtNX1UwOiTbR5At3vwd0RG8ItJQ4nQ/NZ/RBwFXTa+SKR/UNfKHV/HhjP
	0oarY6t4tkwP65vTUhnZr0Fw0otiXIXOWNI5NeOfAozR9u0yLjLvdz5w1KsVor46QW+PqIJoLoNSH
	3RDNYbEwgdLmJiiCZg3ARil6tLQJA8ZCSYW60d+dKUxWh/EW3C97HYAZkO3+Lq3tZAZ+9or/Q58sn
	IBxmgDv7lfrfef6a/w7yuHXPalflGJvNfxvehhEI6FOH/DQWwMMMf6NmXGgSliLTrdcGg1UmfEfFQ
	dLsmdbMg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyI3x-00000002ilM-3yj8;
	Thu, 05 Mar 2026 23:25:01 +0000
Message-ID: <4c5323a3-73a0-465f-b31f-b7737b92613d@infradead.org>
Date: Thu, 5 Mar 2026 15:25:01 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: printk: warn about lockups from excessive
 use
To: hujinfei <3288824963@qq.com>, linux-doc@vger.kernel.org
Cc: pmladek@suse.com, senozhatsky@chromium.org, qujingling@huawei.com,
 zhangjiaji1@huawei.com, xushuangxing@huawei.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, hujinfei3@huawei.com
References: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 659042193E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78111-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,huawei.com:email,infradead.org:dkim,infradead.org:email,infradead.org:mid]
X-Rspamd-Action: no action



On 3/4/26 10:41 PM, hujinfei wrote:
> From: hujinfei <hujinfei3@huawei.com>
> 
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with slow consoles and suggesting alternatives like ratelimited printing,
> tracepoints, nbcon, and log level filtering.
> 
> Signed-off-by: hujinfei <hujinfei3@huawei.com>
> ---
>  Documentation/core-api/printk-basics.rst | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

