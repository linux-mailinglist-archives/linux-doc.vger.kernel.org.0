Return-Path: <linux-doc+bounces-96620-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 99FWI9tdVWq8nQAAu9opvQ
	(envelope-from <linux-doc+bounces-96620-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:51:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3274F5AD
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=q+pvPfzK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96620-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96620-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89078300C03E
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 21:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196A1360EFC;
	Mon, 13 Jul 2026 21:51:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167E63438BD;
	Mon, 13 Jul 2026 21:51:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979481; cv=none; b=KhVx3MgIOg/5g8jJHJKE7aMQNQ/c9DXw0Gh5HqnKwP4C/NEbGv42J+6JgB+1NGUt9QXi7wSGcAtbwy/5KYQ+SAhz5B4UFAZWbUqsgfZ1yfvXeQb8FRfMwTsAAJdHsOnUOm3N3WsLI3tO+eVJaydEmOqDBCB8ZUQOmutuKRxb05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979481; c=relaxed/simple;
	bh=cknK5Ss3uLo2RtS0e7PCBty02RMBUc1/0IuYTI2AZPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEm/EnfjZr+8MqTvpVfyR7TEMmY6Vhv1PIhfJ0AIOPGWoAi7aTgh142GfopBC8p+I/ZTAKEDRBB3CFrofPyUCBEAAIB/mhrcAd/bdIL+fqu9d0gBQFfUwsviOtqlBdQIqfrGiYQmhiNylHENp1eMnzIwp/5VhIvw8yQc10Jt0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=q+pvPfzK reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from [192.168.10.145] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66DLoXiN028776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jul 2026 06:50:33 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=YQuvSU+rvn/LSkKpcRyfWMx1R3fVRsbIfemsxe/bHdc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783979433; v=1;
        b=q+pvPfzKFHSCkTHNmb/RFGkEuDeEHQA9xBGPxWZit+9tf2IF+rWDbWtk7ztw/ptF
         +qts/pQlOV9MYwwhT3TkFKpq2vAKva18A6kqasaKTynJQB/QJtST5nTTqqB2fcl/
         /5t1BcqsT9i0r95mZuDPBghdn3PFh1cJ/jsWRa8768dzLqpPDCsV96BWN5Il9p+3
         +1zD5gjHAmkatHOVvDZdrYIR7JFnj9FpWL2OipiA+Z5seE6lR8R0A9GOZ0hu49Zu
         NrB/4ds5LcG2XzYsOY/IDjrwpDZi4as/XfAcGpqGMwZ2QQg1i+Opw04aroZk8XgY
         sSmITQApacG55s+3lNKtSg==
Message-ID: <bb1224e8-ff4b-4e5d-babb-b6a2970219ab@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 14 Jul 2026 06:50:33 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/11] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
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
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-9-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <alSWtwHVfYh0zdPy@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <alSWtwHVfYh0zdPy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96620-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oupton@kernel.org,m:maz@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,huawei.com,redhat.com,lwn.net,linuxfoundation.org,gmail.com,rasmusvillemoes.dk,lists.infradead.org,lists.linux.dev,vger.kernel.org,daynix.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,rsg.ci.i.u-tokyo.ac.jp:from_mime,rsg.ci.i.u-tokyo.ac.jp:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19C3274F5AD

On 2026/07/13 16:41, Oliver Upton wrote:
> On Fri, Jul 10, 2026 at 08:15:03PM +0900, Akihiko Odaki wrote:
>> @@ -813,6 +842,15 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>>   	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>>   		return;
>>   
>> +	/*
>> +	 * IMPDEF PMUv3 traps are non-architectural, and KVM cannot assume a
>> +	 * uniform PMUv3-compatible arm_pmu is available on all CPUs.
>> +	 */
>> +	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS)) {
>> +		kvm_info("Non-architectural PMU, tainting kernel\n");
>> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
>> +	}
>> +
> 
> This is an unrelated change, and really the taint should be added with the
> .cpu_enable() for this capability. That's the point where we flip the
> magic bit.

I'm abandoning this change because it does not effectively cover all 
corner cases we don't want to support:
https://lore.kernel.org/all/0e5e64ea-2f3c-4ce6-88ac-08b66f13027c@rsg.ci.i.u-tokyo.ac.jp/

> 
>> +void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
>> +{
>> +	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu || last_cpu == -1)
> 										^~~~~~~~~~~~~~
> 
> Does this do anything other than avoid a spurious reload on the first KVM_RUN?

Yes. Without this check, the value will be passed to cpu_max_bits_warn() 
in the following call chain, resulting in a warning ifdef 
CONFIG_DEBUG_PER_CPU_MAPS:

1. kvm_vcpu_load_pmu()
2. kvm_pmu_probe_armpmu()
3. cpumask_test_cpu()
4. cpumask_check()
5. cpu_max_bits_warn()

Regards,
Akihiko Odaki

