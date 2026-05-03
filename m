Return-Path: <linux-doc+bounces-85566-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJMyC+dm92n6gwIAu9opvQ
	(envelope-from <linux-doc+bounces-85566-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:16:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D40F4B6366
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B8C30182BF
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B7026A1C4;
	Sun,  3 May 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cfzdDUHZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAA1A6808;
	Sun,  3 May 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821367; cv=none; b=pZj3C/4H7VIfUL4TZoyN+yT/2oKLpXRpNe+oOotqMvPze9IkElxX8zDzBpdJqBQWn5dH1wkOx/JMBhXNUG7PrRS9+wcNxWo5P+hQ+NBmbQc6MwwpUuVBzws4MwWFrO43wZTCjtA1OkxOYPblmTkXfgay2zjYT9r2M9iS3yaVmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821367; c=relaxed/simple;
	bh=FrQTgFh5xBirNB3V0+ic1VfjdTXAM3RePlrK+PRicyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HuijII0N/ceJYam/oKCvMxIDcOmdAz8+q8EDjnT23TX2q6vTWsHSxuSMtgu2dbpc/cVEMZDK388g8/qQLd7HxAYDlB38Li3Vuh+gaBk1x6tfUAyZsqzCq+7HQjtgrxxT+s35zF+705QZfDACcsDVXiHcXKexJHP62bkOAcpdW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cfzdDUHZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 131D041084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777821365; bh=xHtiiDrFaA5dwViXPQT0TECpzX0/1YLefV9TvY+Kca4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cfzdDUHZ4ysmxcxlb5UIH2LmUzmTS8DOhKD6sQ13tlLhC+ayQ4wC1/pZQ8QUI/z5O
	 WAyvU2wEvw5DTKUeQtfextYEtylNVOyLeNWl22YB+mFWyDEVyarEmKmoLnrDlRSpwr
	 yK+7VxT59Xouz+Ls2xYbm55rDPofU5EjxgI6QLbu32gdntWceYXtLOygCSpUF9jYYX
	 c51Yal5d7E7GW0sgGzGQmLjilzToGC+qr1jLsDE0IH77y4JnV2krzT6SMA+DR9xfZ0
	 7baeBQh7nfkuscaLxUSP/O4WEOy22oJNNuhusWxR1GrwisETSAXGYQLKUBYRSNABYH
	 b//q8tTJX515Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 131D041084;
	Sun,  3 May 2026 15:16:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Aaron Tomlin <atomlin@atomlin.com>, skhan@linuxfoundation.org
Cc: tglx@kernel.org, akpm@linux-foundation.org, bp@alien8.de,
 rdunlap@infradead.org, dave.hansen@linux.intel.com,
 feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 paulmck@kernel.org, lirongqing@baidu.com, bhelgaas@google.com,
 bigeasy@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
In-Reply-To: <20260421150911.42404-1-atomlin@atomlin.com>
References: <20260421150911.42404-1-atomlin@atomlin.com>
Date: Sun, 03 May 2026 09:16:01 -0600
Message-ID: <87y0i0bk26.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 8D40F4B6366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85566-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]

Aaron Tomlin <atomlin@atomlin.com> writes:

> There is a common misconception that the "irqaffinity=" boot parameter
> acts as a global override for all hardware interrupts. In reality, it
> only sets the irq_default_affinity mask, which is explicitly ignored
> by managed interrupts (e.g., modern multiqueue storage controllers).
>
> This patch updates kernel-parameters.txt to document this limitation,
> directs users to "isolcpus=managed_irq" and
> Documentation/core-api/irq/managed_irq.rst for further details.
> Additionally, it updates managed_irq.rst to provide a debugfs example
> demonstrating the IRQD_AFFINITY_MANAGED state flag.
>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
> Changes in v1 [1]:
>  - Provided an example of a managed IRQ using CONFIG_GENERIC_IRQ_DEBUGFS
>  - Referenced Documentation/core-api/irq/managed_irq.rst
>
> [1]: https://lore.kernel.org/lkml/20260414200245.1153919-1-atomlin@atomlin.com/
> ---
>  .../admin-guide/kernel-parameters.txt         | 11 ++++
>  Documentation/core-api/irq/managed_irq.rst    | 53 ++++++++++++++++++-
>  2 files changed, 62 insertions(+), 2 deletions(-)

[...]

> diff --git a/Documentation/core-api/irq/managed_irq.rst b/Documentation/core-api/irq/managed_irq.rst
> index 05e295f3c289..8e973a7d1bd1 100644
> --- a/Documentation/core-api/irq/managed_irq.rst
> +++ b/Documentation/core-api/irq/managed_irq.rst
> @@ -80,9 +80,58 @@ The following examples assume a system with 8 CPUs.
>      /proc/irq/48/effective_affinity_list:0
>      /proc/irq/48/smp_affinity_list:7
>  
> -  This can be verified via the debugfs interface
> -  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
> +  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
> +  enabled, this can be verified via the debugfs interface (e.g.,
> +  /sys/kernel/debug/irq/irqs/48). The dstate field will include
>    IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
> +  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:
> +
> +    # cat /sys/kernel/debug/irq/irqs/87
> +    handler:  handle_edge_irq
> +    device:   0000:41:00.0

This will not render the way you seem to expect, it should be a literal
block.  Please do build the docs and look at the results before sending
documentation patches.

Thanks,

jon

