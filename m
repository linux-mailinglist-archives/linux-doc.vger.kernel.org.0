Return-Path: <linux-doc+bounces-90514-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QGDBFiPKHmqPVAAAu9opvQ
	(envelope-from <linux-doc+bounces-90514-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 14:18:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B804362DEE4
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 14:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ByDqvzRn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90514-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90514-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C90302F4C9
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 12:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1C23D9026;
	Tue,  2 Jun 2026 12:14:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFDA33D4E9;
	Tue,  2 Jun 2026 12:14:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402481; cv=none; b=D5jYPbo+bLedgDMmg0bShqVqV41LhkT94ulL+N1kyIJJ1ZAD4H6tE4cAti/AuIq0Ph8/KA+CL3VnTMJVGmJiCf20NJAYxm/rFHxllVJiM72ZttgMBOrdWaeG1aCF5Ozp/6us/ZXXNYAAFOsrOpmRHb+bH78NTDa7QEUPVtQOxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402481; c=relaxed/simple;
	bh=0ROmfkAcZ0XHG8Ud0AbBSBnV9t1q7XNmRmq3jamMkZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KpNN3K0Pz7Sj+R8t8bISAWzkdRJ6W+UZm1MwIPOv9R2CTB9P4yzUvooBiOI8riWRrSchb5Akg3bRMLdeWWC3wxmnGwbdhbuoMkBKzjdd3BY/A46hEYYnK9w9kDGZ3D7WXQBHXpTpSYVtU/Yei26Py/knDQSqeWtgRTJT3EDxXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ByDqvzRn; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DcFDkH7OKiLQtjPcKiWGd0H8nAOe5WjORs+AxCHbS3I=;
	b=ByDqvzRnRvzNvkY/aS0pjNOXsjflbJv2AjZdiaFs7F0qsdZHbKhMGZeFMf+ObixV1aSqqGp6+
	97oJ/5fDAWuITZaAUp278GuZ99JQU96AEZq3jqk8v5IIBhdxiTCAwyroJ6lWqMZG9lxuMS48np9
	wP6vRM04hg1n0JpXIuO4mZA=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gV8gw4NxQzKm4Z;
	Tue,  2 Jun 2026 20:06:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DCD74048B;
	Tue,  2 Jun 2026 20:14:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 20:14:26 +0800
Message-ID: <37bc3f0c-adeb-41b8-9b26-fabe43f47e6a@huawei.com>
Date: Tue, 2 Jun 2026 20:14:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<punit.agrawal@oss.qualcomm.com>, <jic23@kernel.org>,
	<osama.abdelkader@gmail.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <suzuki.poulose@arm.com>, <maz@kernel.org>,
	<lpieralisi@kernel.org>, <timothy.hayes@arm.com>, <sascha.bischoff@arm.com>,
	<arnd@arndb.de>, <mrigendra.chaubey@gmail.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<sudeep.holla@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ah65zXlOH6a9geD9@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90514-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:catalin.marinas@arm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:punit.agrawal@oss.qualcomm.com,m:jic23@kernel.org,m:osama.abdelkader@gmail.com,m:chenl311@chinatelecom.cn,m:fengchengwen@huawei.com,m:suzuki.poulose@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:timothy.hayes@arm.com,m:sascha.bischoff@arm.com,m:arnd@arndb.de,m:mrigendra.chaubey@gmail.com,m:pierre.gondois@arm.com,m:dietmar.eggemann@arm.com,m:yangyicong@hisilicon.com,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,lwn.net,linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,chinatelecom.cn,huawei.com,arndb.de,hisilicon.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,huawei.com:mid,huawei.com:from_mime,huawei.com:dkim,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B804362DEE4



On 6/2/2026 7:09 PM, Will Deacon wrote:
> On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
>> On arm64, when booting with `maxcpus` greater than the number of present
>> CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
>> but have not yet been registered via register_cpu(). Consequently,
>> the per-cpu device objects for these CPUs are not yet initialized.
>>
>> In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
>> _cpu_up() for these unregistered CPUs eventually leads to
>> sysfs_create_group() being called with a NULL kobject (or a kobject
>> without a directory), triggering the following warning in
>> fs/sysfs/group.c:
>>
>> 	if (WARN_ON(!kobj || (!update && !kobj->sd)))
>> 		return -EINVAL;
>>
>> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
>> enumerated CPUs as "present" regardless of their status in the MADT. This
>> causes issues with SMT hotplug control. For instance, with QEMU's
>> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
>> follows: the first four CPUs are marked Enabled while the remaining four
>> are marked Online Capable to support potential hot-plugging.
>>
>> Fix this by:
>>
>> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>>    entry before calling set_cpu_present() during SMP initialization.
>>
>> 2. Properly managing the present mask in acpi_map_cpu() and
>>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>>    other architectures like x86 and LoongArch.
>>
>> 3. Update the arm64 CPU hotplug documentation to no longer state that all
>>    online-capable vCPUs are marked as present by the kernel at boot time.
>>
>> This ensures that only physically available or explicitly enabled CPUs
>> are in the present mask, keeping the SMT control logic consistent with
>> the actual hardware state.
> 
> Please can you check the Sashiko review comment?
> 
> https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com

On arm64, arch_unregister_cpu() enforces a safety block against physical
CPU hot-removal by aborting early if cpu_present() is true but the
device is no longer physically present, thereby skipping
unregister_cpu() and leaking the sysfs device node.
If acpi_unmap_cpu() blindly clears the present bit while the sysfs
device remains registered, a subsequent hot-add attempt will see the
valid leaked device pointer, skip acpi_processor_hotadd_init() (and thus
skip acpi_map_cpu()), leaving the hot-added CPU permanently absent and
deadlocked.

Hi, Will,

what do you think about fix it like this?

--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -455,7 +455,6 @@ EXPORT_SYMBOL(acpi_map_cpu);

 int acpi_unmap_cpu(int cpu)
 {
-       set_cpu_present(cpu, false);
        return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 5932e5b30b71..507c6d761434 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -554,6 +554,7 @@ void arch_unregister_cpu(int cpu)
        }

        unregister_cpu(c);
+       set_cpu_present(cpu, false);
 }
 #endif /* CONFIG_ACPI_HOTPLUG_CPU */


> 
> Cheers,
> 
> Will
> 


