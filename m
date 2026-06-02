Return-Path: <linux-doc+bounces-90515-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lW8fMTfRHmq6VQAAu9opvQ
	(envelope-from <linux-doc+bounces-90515-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 14:48:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FF62E260
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 14:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bmADCqcm;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90515-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90515-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6DA930373CD
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995333DD87A;
	Tue,  2 Jun 2026 12:47:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E33DD525;
	Tue,  2 Jun 2026 12:47:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404432; cv=none; b=Yf+l9YVBwAT3AaopKtr0fYvJCdihMYJaUUrStTXRbpW9Mm/ANtBEvjEV1HD/zpzmVwVFbTmOAPlaLoVKrUhxEQJ35HnAAbgCTdacAdCo/vt+x2585tAKufnKfNYa4JGRUkLFZ4xziCQ6OSC5sfmkgbauskVqb2GYd8P0Kps8TP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404432; c=relaxed/simple;
	bh=oYOzxheVhJ9EgbC/FGP6BeKGVBfUT7lKCVc6Ed1ATZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBjPGVkFifqCPTkRb8khovsN66FuTXklDiNvnbcs8CGDLeqfUdJQV8708GhWUiEjfUvf2MUe6xzCCCvp345Wb25a5aDim8gMriXX3CXDK5txi9X3hzwENA1EPpkkFon9mNlExO0ePYWReJ0uPhIlytCkgNTm+RVxjzKfdT8uyhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmADCqcm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A211F00893;
	Tue,  2 Jun 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404431;
	bh=4TjPJ17gEtcnTt4IawZJaVkXbQlEiP6t8vVeLN4N89Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmADCqcmlTljvi3P17MrJrPZo0FsPvj93FnANV3ryXgXPv9XIVOp0hYwh3MoUrbLD
	 uPwrfdoYk8yMwg6SCxxGQYPrW8JR1OrN48Pw2vOOJ6LrDJXzLZ6JyqVdZoveV3gilY
	 pqMlMlxVr0DnAnYpm5MEwr9S9r4yzjaVIJJzN/pm6yq+iyMc5JnePZbEE0oPDdgNBK
	 2KYaRwUe2rnRAasxp6uDW0F5YF6OqMgJymUZ/63HTKzAp/IZvuheJXqcQgPrAw5rbn
	 QL2SLtpR4thMxcjkUPoFiyJL2omK9SCN2MKmAyu6LbNRHI3bc/gwz9yKUYF/EZdfvs
	 WFj+L4XkkisFQ==
Date: Tue, 2 Jun 2026 13:47:03 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, jic23@kernel.org,
	osama.abdelkader@gmail.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, suzuki.poulose@arm.com, maz@kernel.org,
	lpieralisi@kernel.org, timothy.hayes@arm.com,
	sascha.bischoff@arm.com, arnd@arndb.de, mrigendra.chaubey@gmail.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com,
	yangyicong@hisilicon.com, sudeep.holla@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ah7Qx6UmfJzlph6F@willie-the-truck>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90515-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:punit.agrawal@oss.qualcomm.com,m:jic23@kernel.org,m:osama.abdelkader@gmail.com,m:chenl311@chinatelecom.cn,m:fengchengwen@huawei.com,m:suzuki.poulose@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:timothy.hayes@arm.com,m:sascha.bischoff@arm.com,m:arnd@arndb.de,m:mrigendra.chaubey@gmail.com,m:pierre.gondois@arm.com,m:dietmar.eggemann@arm.com,m:yangyicong@hisilicon.com,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,lwn.net,linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,chinatelecom.cn,huawei.com,arndb.de,hisilicon.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D7FF62E260

On Tue, Jun 02, 2026 at 08:14:26PM +0800, Jinjie Ruan wrote:
> On 6/2/2026 7:09 PM, Will Deacon wrote:
> > Please can you check the Sashiko review comment?
> > 
> > https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> 
> On arm64, arch_unregister_cpu() enforces a safety block against physical
> CPU hot-removal by aborting early if cpu_present() is true but the
> device is no longer physically present, thereby skipping
> unregister_cpu() and leaking the sysfs device node.
> If acpi_unmap_cpu() blindly clears the present bit while the sysfs
> device remains registered, a subsequent hot-add attempt will see the
> valid leaked device pointer, skip acpi_processor_hotadd_init() (and thus
> skip acpi_map_cpu()), leaving the hot-added CPU permanently absent and
> deadlocked.
> 
> Hi, Will,
> 
> what do you think about fix it like this?
> 
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -455,7 +455,6 @@ EXPORT_SYMBOL(acpi_map_cpu);
> 
>  int acpi_unmap_cpu(int cpu)
>  {
> -       set_cpu_present(cpu, false);
>         return 0;
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 5932e5b30b71..507c6d761434 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -554,6 +554,7 @@ void arch_unregister_cpu(int cpu)
>         }
> 
>         unregister_cpu(c);
> +       set_cpu_present(cpu, false);
>  }
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */

Hmm, not sure. Doesn't that break error handling cleanup paths that
expect acpi_unmap_cpu() to undo acpi_map_cpu()? See
acpi_processor_hotadd_init(), for example.

Will

