Return-Path: <linux-doc+bounces-95354-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bll5KrTfTGqGrQEAu9opvQ
	(envelope-from <linux-doc+bounces-95354-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 13:15:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1771AD87
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 13:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=sT4HpAzG;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95354-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95354-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1932E30071F6
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 11:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91AA3E6392;
	Tue,  7 Jul 2026 11:09:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA783DD522;
	Tue,  7 Jul 2026 11:09:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422554; cv=none; b=ESHeXIBTVyGWbYJdAsRqkr+t5Fyf1norkbxrGKgE7UtiCwyKPkGBiOt2hXTYIq5VbkPtahmABzTE/JBEEaHt5uOIE3hRcRDEkbgNoRJkkqBfFzeR/SUy4PMrNm+Isrec8cNLMFZv5nzzbhr5sXVSDDvsIHulW/qtHVQ6oqhzigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422554; c=relaxed/simple;
	bh=iK7dKcjYUoHiHjp3U9/+pUN7cnRMsGs/EjDO7OFT2Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnR1TnFW1VudPhftBp/EkBb2UIva/LURnL3CdHgWnYQwDXxEgFmp4QqI1KYygA/PLyxP4kHdBwfwTBll7AOF1m5H3M8Er/VbnnX5ZBT9tNg+9wlsCwJXzh9q1uUI0//lWUvpaXCUJDnKJqBr6wdvclxtPgkUOrBh/tJCXN1z+iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=sT4HpAzG reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 667B84DM000649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 20:08:04 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=g0ZGQJGJ1qWqh1QXg5+nZXDEWKnJXbLoKauNjx/PAYs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783422484; v=1;
        b=sT4HpAzGMYEhZYKHTkNka9jCpR9kdvZwWiGM6RHY8o5Jh50Xpv3CLKHIKN5BSGDP
         UO9T1j6Mo6pDZFawvG0JpSHS1WRGQgTcL5yPRrmCURV1XzeKV/H3TMAPnxTU9p1V
         BLHavpto5ibL75WXfBnQhvRrIXlF9L7zRvrsUE/sWBqGdW/n26udhLUkIK8iD6v2
         yiKor0wuTpnWYPkRduMdyP3Y5HN5FEhy/fSIctEA6OldtFope5KzYn0rd7aaALgB
         4kw5t2aTJC5oKb2k3QLKVcaLjYMySaA/rW8Xxp5xBwzj/GbXi2uJlJKHeUSBneYY
         1WxHlDXk9luvKXTDy+VdmA==
Message-ID: <e03f17b2-a765-4912-adf6-3da26e7eeecd@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 7 Jul 2026 20:08:03 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvgIWqBjAp_VA_A@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <akvgIWqBjAp_VA_A@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95354-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:oupton@kernel.org,m:maz@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DB1771AD87

On 2026/07/07 2:04, Oliver Upton wrote:
> Hi,
> 
> On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
>> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
>> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
>> That covers systems where PMUv3 is absent or non-uniform, as well as
>> systems where IMPDEF PMUv3 sysreg traps are unavailable.
>>
>> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
>> sysregs, but the pPMUs registered with KVM only cover a subset of
>> possible CPUs.
>>
>> Reject vPMU unless the registered pPMUs cover every possible CPU.
>> This avoids carrying support for partial pPMU coverage into the
>> fixed-counters-only UAPI introduced later in the series.
> 
> Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
> have a PMU after creating the VM.>
> I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
> system feature. That way any CPU which breaks the system-wide assumption
> cannot be onlined.

ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS only says that IMPDEF PMUv3 sysregs 
are trapped. It does not say that KVM has a driver-backed PMU usable for 
PMUv3 emulation. This patch checks that extra requirement.

I re-checked CPU hotplug. Onlining a CPU without a PMU later does not 
make an accepted VM unsafe, since the check is against 
cpu_possible_mask. The problem is the reverse case on ACPI: this check 
can disable vPMU when a possible CPU is offline. DT populates 
supported_cpus at boot, while ACPI initially populates it only from 
online CPUs and grows it as matching CPUs come online.

That makes this patch too conservative. In practice, I do not expect 
systems to mix CPUs with and without a usable PMU. A better approach is 
probably to treat such a host as out of spec and add 
TAINT_CPU_OUT_OF_SPEC. We already do that for architectural PMUv3 by 
detecting mismatches in ID_AA64DFR0_EL1.PMUVer; we can do the same for 
ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS with non-standard PMUs.

Regards,
Akihiko Odaki

