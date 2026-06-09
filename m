Return-Path: <linux-doc+bounces-91722-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d51mDUxUKGohCQMAu9opvQ
	(envelope-from <linux-doc+bounces-91722-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 19:58:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CB66320A
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 19:58:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Z6Z5Snih;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91722-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91722-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CA81301AFC9
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 17:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E8B3C10AD;
	Tue,  9 Jun 2026 17:58:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979536F91F;
	Tue,  9 Jun 2026 17:58:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781027912; cv=none; b=Q1GPiHkr00D9gboE/jjOBCgsk4YqomUVKlWC6FzL+OwTKELaSNp1L5FAMGaGJuhwTMvHPvqvRhLS0dRTjnFKOBPNARDDE6fOTHa5CKrH6I8YeXOb+MeuwbfjAOZhiMLbezlFZLmiDmAESDTxcW35dyaTz+GXuCYIOzYI0Qz6yhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781027912; c=relaxed/simple;
	bh=17UlZdz2nMdyTrEUz5ek0AIVuii3F4B4SW4ls8GDlUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdKoCUtFXtDwSYK5AZVCPPyB9A749sgbxq3Lyrv1+Mh3aiqQn1szh7o6K77IL7HpbFbUMytX9kDIXPSaEsk2Vvlj3HiJBeuJJ22mtiUVGp0kTOpggkd3xNMxzgNQJ16UOVsx6bFp22tW1R8Rg7u2hGNevVxcb54/ScdFw0F4ILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z6Z5Snih; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318813D6A;
	Tue,  9 Jun 2026 10:58:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D051A3FD88;
	Tue,  9 Jun 2026 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781027909; bh=17UlZdz2nMdyTrEUz5ek0AIVuii3F4B4SW4ls8GDlUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6Z5SnihxPnVvw5f2YFVpT+cXdhZQ3cGlZ9ugH8oZDKRKqqlFvR4Ixvr32QCZgoaZ
	 By/APjldmxiBEx8OxV20fU3AnRHw7W3UvPLWXY+AATEGfZsa998kCI25uXWKj3SIn6
	 xRS1CtMTLn0G9Dd+gfe+E1qeHn7iV/STrgzcZbfs=
Date: Tue, 9 Jun 2026 18:58:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Will Deacon <will@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, punit.agrawal@oss.qualcomm.com,
	jic23@kernel.org, osama.abdelkader@gmail.com,
	chenl311@chinatelecom.cn, fengchengwen@huawei.com,
	suzuki.poulose@arm.com, maz@kernel.org, lpieralisi@kernel.org,
	timothy.hayes@arm.com, sascha.bischoff@arm.com, arnd@arndb.de,
	mrigendra.chaubey@gmail.com, pierre.gondois@arm.com,
	dietmar.eggemann@arm.com, yangyicong@hisilicon.com,
	sudeep.holla@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aihUPsuEytsM6Dly@arm.com>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,oss.qualcomm.com,gmail.com,chinatelecom.cn,huawei.com,arm.com,arndb.de,hisilicon.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91722-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:punit.agrawal@oss.qualcomm.com,m:jic23@kernel.org,m:osama.abdelkader@gmail.com,m:chenl311@chinatelecom.cn,m:fengchengwen@huawei.com,m:suzuki.poulose@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:timothy.hayes@arm.com,m:sascha.bischoff@arm.com,m:arnd@arndb.de,m:mrigendra.chaubey@gmail.com,m:pierre.gondois@arm.com,m:dietmar.eggemann@arm.com,m:yangyicong@hisilicon.com,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B45CB66320A

Hi Jinjie,

On Wed, Jun 03, 2026 at 02:38:11PM +0800, Jinjie Ruan wrote:
> On 6/2/2026 7:09 PM, Will Deacon wrote:
> > On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
> >> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
> >> enumerated CPUs as "present" regardless of their status in the MADT. This
> >> causes issues with SMT hotplug control. For instance, with QEMU's
> >> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
> >> follows: the first four CPUs are marked Enabled while the remaining four
> >> are marked Online Capable to support potential hot-plugging.
> >>
> >> Fix this by:
> >>
> >> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
> >>    entry before calling set_cpu_present() during SMP initialization.
> >>
> >> 2. Properly managing the present mask in acpi_map_cpu() and
> >>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
> >>    other architectures like x86 and LoongArch.
> >>
> >> 3. Update the arm64 CPU hotplug documentation to no longer state that all
> >>    online-capable vCPUs are marked as present by the kernel at boot time.
> >>
> >> This ensures that only physically available or explicitly enabled CPUs
> >> are in the present mask, keeping the SMT control logic consistent with
> >> the actual hardware state.
> > 
> > Please can you check the Sashiko review comment?
> > 
> > https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> 
> I think commit eba4675008a6 ("arm64: arch_register_cpu() variant to
> check if an ACPI handle is now available.") introduced this bug.
> 
> It introduced an architectural safety block inside
> arch_unregister_cpu(). If a hot-unplug operation is determined to be a
> physical hardware removal (where _STA evaluates to
> !ACPI_STA_DEVICE_PRESENT), it aborts the unregistration transaction
> early to protect unreadied arm64 infrastructure, thereby skipping
> unregister_cpu().
> 
> However, the generic ACPI processor driver path in
> acpi_processor_post_eject() currently treats arch_unregister_cpu() as
> an unconditional void operation. When arch_unregister_cpu() bails out
> early, the subsequent cleanup flow blindly proceeds to call
> acpi_unmap_cpu(), clears global per-cpu processor arrays, and
> unconditionally free the 'struct acpi_processor' object.
> 
> I think we can fix this by:
> 
>     1. Refactoring arch_unregister_cpu() to return an integer
> transaction status. It returns -EOPNOTSUPP when aborting due to physical
> hot-remove blocking, -EINVAL/-EIO on firmware failures, and 0 only upon
> successful unregistration.
> 
>     2. Guarding the downstream execution flow in
> acpi_processor_post_eject(). If arch_unregister_cpu() returns a error
> code, the hot-unplug transaction is considered aborted.

I wonder whether we need all this guarding. In the worst case, we could
rewrite the function, something like below, to always unregister and
only warn:

void arch_unregister_cpu(int cpu)
{
	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
	struct cpu *c = &per_cpu(cpu_devices, cpu);
	acpi_status status;
	unsigned long long sta;

	if (!acpi_handle) {
		pr_err_once("Removing a CPU without associated ACPI handle\n");
	} else {
		status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
		if (!ACPI_FAILURE(status) &&
		    cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT))
			pr_err_once("Changing CPU present bit is not supported\n");
	}

	unregister_cpu(c);
}

However, on the first condition, can we actually trigger !acpi_handle?
If not, we could just drop it. I tried to look up the paths and I don't
think we'd ever end up in this function with !acpi_handle. So this
leaves us with the next checks.

On the second/third conditions, it's more about preventing physical CPU
hotplug as we haven't properly defined it for arm yet but we could just
add a WARN_ONCE() to make it more visible and still proceed with the
unregistering. I think with your proposal, we don't fully unroll the
state anyway just by returning an error in arch_unregister_cpu(), so I'd
rather continue here.

What does firmware do for virtual CPU hotplug w.r.t. _STA? I noticed a
slight change in wording in the cpu-hotplug.rst doc with your patch from

  On virtual systems the _STA method must always report the CPU as
  ``present``

to

  On virtual systems the _STA method must report the CPU as ``present``
  when it is activated by the firmware

Was your intention that _STA.PRESENT can become 0 when hot-unplugging
virtual CPUs?

-- 
Catalin

