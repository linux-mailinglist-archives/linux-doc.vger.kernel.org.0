Return-Path: <linux-doc+bounces-20671-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC51930BBD
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jul 2024 23:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7A21F21633
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jul 2024 21:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E0E13CFBB;
	Sun, 14 Jul 2024 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bx8KV75M"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332553B79F
	for <linux-doc@vger.kernel.org>; Sun, 14 Jul 2024 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720992397; cv=none; b=hBYqjz5cYIkuH6CKugtUEBAjwAF4bwmPekQ/bbPj1UucVjOGbV2kviIhKE9dYJNBVlUIYP06I+gr2hMvRclqmq3wKtkmsr5Wnb3ZRxgMqPrOhOXIG1BdaW5FZWGf4uhKHv1rsG+3EqSlKy3oJLcc8uXBFYTkBl35CxVLbZ2DnPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720992397; c=relaxed/simple;
	bh=ka/A/W4GdI4A1aJUauCep0wRGNIuV8xAdltC5dKeGE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPDrp8J2YjSo5OJPKPazlX8nOlhh25+BtYYTLl6U74eXusKi4rZuD8TxZc/G0zwFEkeQUFAQy++pFN6ExI32L6/oqEphYl85K61A6gELv9+pJQJCsOQ/59k9qzYYdQjzfuc4+O6Tw3z9W0BkHy6T359SUrW5HC9ENOsZSNmEOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bx8KV75M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720992395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDiKkAtznrxe/bIQFxB20HO8ILSBHP/uTJbFQfy2mG0=;
	b=bx8KV75MNedpOhmNFCz0ARVLxH/mMvLLsHAl8cpg9JDVNMQShT3485p6q5Up8lwXLR1hBs
	h+09Bm7c7eftQYO59L3y8GcadGfeS1sf8g0Aq2w8Jaz2J+1XGO+qbVnQ1wST5iV1/1Gh4d
	nLe2NS3QKT3w+EvESnG3GpT72uKI5kI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-V4Z6S_slMwOel7WP4u4EDw-1; Sun,
 14 Jul 2024 17:26:27 -0400
X-MC-Unique: V4Z6S_slMwOel7WP4u4EDw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECDE71955F3B;
	Sun, 14 Jul 2024 21:26:24 +0000 (UTC)
Received: from [10.22.64.27] (unknown [10.22.64.27])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E7011956066;
	Sun, 14 Jul 2024 21:26:21 +0000 (UTC)
Message-ID: <1abe11be-b6d7-4d64-a341-e41a59fdc8c8@redhat.com>
Date: Sun, 14 Jul 2024 17:26:20 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: remove deprecated xen_nopvspin boot parameter
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20240710110139.22300-1-jgross@suse.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240710110139.22300-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 7/10/24 07:01, Juergen Gross wrote:
> The xen_nopvspin boot parameter is deprecated since 2019. nopvspin
> can be used instead.
>
> Remove the xen_nopvspin boot parameter and replace the xen_pvspin
> variable use cases with nopvspin.
>
> This requires to move the nopvspin variable out of the .initdata
> section, as it needs to be accessed for cpuhotplug, too.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  5 -----
>   arch/x86/xen/spinlock.c                       | 20 +++++--------------
>   kernel/locking/qspinlock.c                    |  2 +-
>   3 files changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b33d048e01d8..2074ba03f2e3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7439,11 +7439,6 @@
>   			access functions when running as Xen PV guest. The
>   			default value is controlled by CONFIG_XEN_PV_MSR_SAFE.
>   
> -	xen_nopvspin	[X86,XEN,EARLY]
> -			Disables the qspinlock slowpath using Xen PV optimizations.
> -			This parameter is obsoleted by "nopvspin" parameter, which
> -			has equivalent effect for XEN platform.
> -
>   	xen_nopv	[X86]
>   			Disables the PV optimizations forcing the HVM guest to
>   			run as generic HVM guest with no PV drivers.
> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
> index 5c6fc16e4b92..8e4efe0fb6f9 100644
> --- a/arch/x86/xen/spinlock.c
> +++ b/arch/x86/xen/spinlock.c
> @@ -18,7 +18,6 @@
>   static DEFINE_PER_CPU(int, lock_kicker_irq) = -1;
>   static DEFINE_PER_CPU(char *, irq_name);
>   static DEFINE_PER_CPU(atomic_t, xen_qlock_wait_nest);
> -static bool xen_pvspin = true;
>   
>   static void xen_qlock_kick(int cpu)
>   {
> @@ -68,7 +67,7 @@ void xen_init_lock_cpu(int cpu)
>   	int irq;
>   	char *name;
>   
> -	if (!xen_pvspin)
> +	if (nopvspin)
>   		return;
>   
>   	WARN(per_cpu(lock_kicker_irq, cpu) >= 0, "spinlock on CPU%d exists on IRQ%d!\n",
> @@ -95,7 +94,7 @@ void xen_uninit_lock_cpu(int cpu)
>   {
>   	int irq;
>   
> -	if (!xen_pvspin)
> +	if (nopvspin)
>   		return;
>   
>   	kfree(per_cpu(irq_name, cpu));
> @@ -125,10 +124,10 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
>   void __init xen_init_spinlocks(void)
>   {
>   	/*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
> -	if (num_possible_cpus() == 1 || nopvspin)
> -		xen_pvspin = false;
> +	if (num_possible_cpus() == 1)
> +		nopvspin = true;
>   
> -	if (!xen_pvspin) {
> +	if (nopvspin) {
>   		printk(KERN_DEBUG "xen: PV spinlocks disabled\n");
>   		static_branch_disable(&virt_spin_lock_key);
>   		return;
> @@ -143,12 +142,3 @@ void __init xen_init_spinlocks(void)
>   	pv_ops.lock.kick = xen_qlock_kick;
>   	pv_ops.lock.vcpu_is_preempted = PV_CALLEE_SAVE(xen_vcpu_stolen);
>   }
> -
> -static __init int xen_parse_nopvspin(char *arg)
> -{
> -	pr_notice("\"xen_nopvspin\" is deprecated, please use \"nopvspin\" instead\n");
> -	xen_pvspin = false;
> -	return 0;
> -}
> -early_param("xen_nopvspin", xen_parse_nopvspin);
> -
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index 1df5fef8a656..7d96bed718e4 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -583,7 +583,7 @@ EXPORT_SYMBOL(queued_spin_lock_slowpath);
>   #include "qspinlock_paravirt.h"
>   #include "qspinlock.c"
>   
> -bool nopvspin __initdata;
> +bool nopvspin;
>   static __init int parse_nopvspin(char *arg)
>   {
>   	nopvspin = true;
Acked-by: Waiman Long <longman@redhat.com>


