Return-Path: <linux-doc+bounces-81626-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG1XJ37Fx2mTcAUAu9opvQ
	(envelope-from <linux-doc+bounces-81626-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 13:11:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0AD34E5B1
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 13:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD492300C560
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 12:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4121D29B79B;
	Sat, 28 Mar 2026 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XXn2OJVp"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2883793D4
	for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699897; cv=none; b=Asea9fluFUdGzRKHSApthxp012dofFpxddMZ8ANs3mrKLi/2FYCRAoZv8Wg4MIqfB1r5OpqGnAojyaq+UqnU1hHRu6I3K3AaetEO5YZAB9p8M6wnNUNycSpsiPTzTdbDT3S/J2T6Zdq/biu/9m9WUV8FwkpuYrCM1yws/em6EDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699897; c=relaxed/simple;
	bh=OcG2M3cyjvOlS4YdA93CygvKHUP7fT0s9QuPgEQuByo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/wqkhg1VxcInopehFYFHydBVkvfz3ifPXspnv3tLeY6LaBzw0iq8NG9VioRJazP2Fg1SpN2dKlBWjH947qu7hVs0yqbu77GiN9E7xcuYUZMSQbbd/8CIsMwg5WoJoHEpiyzNwNpmXLaQlcLuDwp3a7C734/nICj1k2+GVp+dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XXn2OJVp; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <72410214-c360-4779-a555-9ed06ba8263d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774699892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=samCHmNKOt5KtEY2CmsqqgoxSZSDRFmVAR/EmqMGN/k=;
	b=XXn2OJVp5KzHWE9lH2Mf4xACiAC+5KL5rVgmyz8i3fR/Vemdi+TE7ZbbWuT5QIo5YNU0O3
	nuNIpuAT8ZhJ0s9Qmi/II22ccXsd3QJ+wlnID1qupBveF0RKs/u8bLs89UG9XPZNvpzuBp
	ppjC+jb4K4wMSVwt2CsCy9BvYwMKFKU=
Date: Sat, 28 Mar 2026 20:11:22 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: proc: remove description of prof_cpu_mask
To: linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260311070940.94838-1-zenghui.yu@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260311070940.94838-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81626-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 9E0AD34E5B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jon,

On 3/11/26 3:09 PM, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> Commit 2e5449f4f21a ("profiling: Remove create_prof_cpu_mask().") said that
> no one would create /proc/irq/prof_cpu_mask since commit 1f44a225777e
> ("s390: convert interrupt handling to use generic hardirq", 2013). Remove
> the outdated description.
> 
> While at it, fix another minor typo (s/DMS/DMA/).
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  Documentation/filesystems/proc.rst | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index b0c0d1b45b99..9a943b9f20ee 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -727,7 +727,7 @@ files are there, and which are missing.
>                in the kernel image
>   cpuinfo      Info about the CPU
>   devices      Available devices (block and character)
> - dma          Used DMS channels
> + dma          Used DMA channels
>   filesystems  Supported filesystems
>   driver       Various drivers grouped here, currently rtc	(2.4)
>   execdomains  Execdomains, related to security			(2.4)
> @@ -861,14 +861,13 @@ i386 and x86_64 platforms support the new IRQ vector displays.
>  Of some interest is the introduction of the /proc/irq directory to 2.4.
>  It could be used to set IRQ to CPU affinity. This means that you can "hook" an
>  IRQ to only one CPU, or to exclude a CPU of handling IRQs. The contents of the
> -irq subdir is one subdir for each IRQ, and two files; default_smp_affinity and
> -prof_cpu_mask.
> +irq subdir is one subdir for each IRQ, and default_smp_affinity.
>  
>  For example::
>  
>    > ls /proc/irq/
> -  0  10  12  14  16  18  2  4  6  8  prof_cpu_mask
> -  1  11  13  15  17  19  3  5  7  9  default_smp_affinity
> +  0  10  12  14  16  18  2  4  6  8  default_smp_affinity
> +  1  11  13  15  17  19  3  5  7  9
>    > ls /proc/irq/0/
>    smp_affinity
>  
> @@ -899,9 +898,6 @@ The node file on an SMP system shows the node to which the device using the IRQ
>  reports itself as being attached. This hardware locality information does not
>  include information about any possible driver locality preference.
>  
> -prof_cpu_mask specifies which CPUs are to be profiled by the system wide
> -profiler. Default value is ffffffff (all CPUs if there are only 32 of them).
> -
>  The way IRQs are routed is handled by the IO-APIC, and it's Round Robin
>  between all the CPUs which are allowed to handle it. As usual the kernel has
>  more info than you and does a better job than you, so the defaults are the

Will you pick this patch up for 7.1? Or please let me know if there are
any points that need improvement.

Thanks,
Zenghui

