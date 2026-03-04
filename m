Return-Path: <linux-doc+bounces-77890-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFDqJaShqGnFwAAAu9opvQ
	(envelope-from <linux-doc+bounces-77890-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 22:18:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F055F207DB5
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 22:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5306303989E
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 21:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6BA35BDC7;
	Wed,  4 Mar 2026 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F+RCXShR"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34E1946DA
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659106; cv=none; b=iQkfR22WSQ7uKFl75Layo9fZJcKJuVgtWwYhrj/fV9Z7h9LXj4E+aA8VvrgH4fpoow8vEjhFcbd1nbJjBlNhtlMElOB3jP8azESd3kmSV9m1dHIMfL5q/qPnyySj6ez66BwWZsmY4QUhRivbim/9XRN/awpr5Y1lDYqfO2T1WFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659106; c=relaxed/simple;
	bh=8VA4Vn1T6cDuXcv752zdxbp2zKzdCWSxN2i0mbiMS+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXRUdmSc1LTrLRPfoQo8FMRZnzKtIitR7vEaJ8hZwOME1QVEkfhPbU633GiI0P91+Rb8WdCQOnbqKm8MC0qw9cYbf3d9C7ySnw1NK/SHNkv6adz/d7UiLaXmkfPwMXTBO6JlnW+Cn27mBgxT0rnNoQlaJJrZVYaK21+odww9D6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F+RCXShR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=427mNJp0IWz9phXKPN0DXG7SDSfRencsJVWyFHX4VTA=; b=F+RCXShRvCi/jezJJXyF+fkl1o
	KGfiW4YNtPAXOclKT5nJ6D/VdWpqMZ0AFfP5+bp8VJiIqQ7GkPWnZequErLdABuw+QBmFPY2hnFBY
	oldFMGk3ESiTUyQo3QpssJVxm2dbilHup2ofAHXdQNfSPAQB3Oq8tiJdzc4tCssCatbrxp4kMQnH6
	c6HPpYVs3aNXKby0RfZLSQ+/6TN+L2OhPSc0hetGsKUVDdaODE6RaGaCP0Of0NINx5TZ6SqZtSmsT
	ECOf3wR4OZbnJnvb8rcPJJfu7uQHLVTkX8ujq9iQ2oaWupTnU3HvRm6yhHG7NoMZrOdoJo0kXVUvY
	Zy2bzGKg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtbl-00000000VAW-1Vdl;
	Wed, 04 Mar 2026 21:18:17 +0000
Message-ID: <2a635ace-ee14-4d13-bf45-36329d83fed1@infradead.org>
Date: Wed, 4 Mar 2026 13:18:16 -0800
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
References: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F055F207DB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77890-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:email,infradead.org:dkim,infradead.org:email,infradead.org:mid]
X-Rspamd-Action: no action

Hi,

On 3/4/26 6:40 AM, hujinfei wrote:
> From: hujinfei <hujinfei3@huawei.com>
> 
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with slow consoles and suggesting alternatives like ratelimited printing,
> tracepoints, nbcon, and log level filtering.
> 
> Signed-off-by: hujinfei <hujinfei3@huawei.com>
> ---
>  Documentation/core-api/printk-basics.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Please limit lines to maximum of 80 characters each. The rest of the
file is already like that.

> diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
> index 2dde24ca7..a9da8c336 100644
> --- a/Documentation/core-api/printk-basics.rst
> +++ b/Documentation/core-api/printk-basics.rst
> @@ -103,6 +103,28 @@ For debugging purposes there are also two conditionally-compiled macros:
>  pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
>  also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
>  
> +Avoiding lockups from excessive printk() use
> +============================================
> +
> +Do not use ``printk()`` in hot paths such as interrupt handlers, timer callbacks,
> +or high-frequency network receive routines. When a slow console (e.g., ``console=ttyS0``)
> +is active, ``printk()`` may synchronously acquire ``console_sem`` and block while
> +flushing messages, potentially disabling interrupts long enough to trigger hard or
> +soft lockup detectors.
> +
> +To avoid this:
> +
> +- Avoid ``printk()`` in hot paths and interrupt contexts.
> +- Use rate-limited variants (e.g., pr_xxx_ratelimited()) or one-time macros (e.g., pr_*_once()).

Since you use pr_xxx_ratelimited(), how about doing similar to that
with pr_xxx_once()?
I only care because the '*' mucks up the html output. :(

> +- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages and filter
> +  console output via ``console_loglevel``.
> +- Use consoles that implement the non-blocking ``nbcon`` API (indicated by ``CON_NBCON``),
> +  which offload message printing to a dedicated kernel thread outside emergency contexts.
> +  Note that asynchronous printing increases the risk of message loss during crashes;
> +  increasing the kernel log buffer size may help retain more messages.
> +
> +Temporary debugging may use ``trace_printk()``, but it must not appear in mainline
> +code. See the section about ``trace_printk()`` in Documentation/trace/debugging.rst.
>  
>  Function reference
>  ==================

Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

