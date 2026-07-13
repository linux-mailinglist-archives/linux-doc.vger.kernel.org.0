Return-Path: <linux-doc+bounces-96617-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C3TyFHxZVWr6nAAAu9opvQ
	(envelope-from <linux-doc+bounces-96617-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:32:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FD74F467
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=FMjG4TN5;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96617-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96617-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9A4E30146B6
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 21:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30417350D7D;
	Mon, 13 Jul 2026 21:32:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BDAD24;
	Mon, 13 Jul 2026 21:32:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978359; cv=none; b=dC29zrjBWkFcd/0lnrRW5RNN5Nfj+gGhxQnWy7Xw5qB2DydPzyYU/pGJTWtv011HWGYiiCIOgnPhyrWolY4WxB+YzC6swi9aVZgY3/gm3LJlfjCOePcuYjB/WEgYu6S0VGxcUS1ak+t1pGFTGWi6Id4l9JMH8f2blxvAQ+xoTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978359; c=relaxed/simple;
	bh=Z0sMSCAgLgyNWSE7K/gg8WQciaf2vPqoggdSKX7+Z/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mUk6FbS6JQ/NMRwtIxkGU/fWlE7Svaujl/Mzm74hbAjS7xWVQO0cK0RucupuAJtTy6U0g/ycMu+A2ERr5N39Nelh/UW+cBsElqEgjY+rIgZA4hUEcx19uxjgmHsCSmwbhhCJwSP7hK6bJlQEPM4xs3BxV0BTirBKggnWMWeRqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=FMjG4TN5 reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from [192.168.10.145] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66DLVGmU018090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jul 2026 06:31:16 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=7vu1Cqv1kY9MENEn9rk5xVTv4OyzC50IlKtSKEl+6V4=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783978277; v=1;
        b=FMjG4TN5ZC4Lzu6aXdhRf2FxBZecWOyitGLFQbs5P8rBoBKp/nTv9LnXYVx8oAxD
         HioMIzBQr+XCM+O6fR/Pvg6nKp/eg6Ob+S2qp3XmTrIy8hywhIiaoHUcPKYfv4L1
         tnJOgYvDpM6/vO3n6m3GEtGPLislK5pioqa1KHKC6Q0HGtPyPrQQPbRtYqbyqL/X
         Rk/vz4oWXClhNVmeJpbg4C1yARqOa+eOIntlSDqXm/NIVdc9unvml6NsgkKFMRVm
         gCD0Q0c/NpMtRSfDmGd1egtNS9hNUbih+ffwx9egfb+j+Dm1fBhkUBrr5KtBQr9w
         PiCYTiHTQ1815xOjwOQfSQ==
Message-ID: <3389f9d7-15cb-4bf8-804b-7dcaee2d252e@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 14 Jul 2026 06:31:16 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: Re: [PATCH v8 01/11] KVM: arm64: Serialize userspace MDCR_EL2 access
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
 <20260710-hybrid-v8-1-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <alSU0ZoIQ3sMLo0p@kernel.org>
Content-Language: en-US
In-Reply-To: <alSU0ZoIQ3sMLo0p@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96617-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[u-tokyo.ac.jp:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,rsg.ci.i.u-tokyo.ac.jp:from_mime,rsg.ci.i.u-tokyo.ac.jp:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B19FD74F467

On 2026/07/13 16:33, Oliver Upton wrote:
> Hi,
> 
> On Fri, Jul 10, 2026 at 08:14:55PM +0900, Akihiko Odaki wrote:
>> kvm_arm_set_nr_counters() updates MDCR_EL2.HPMN for every vCPU while
>> holding kvm->arch.config_lock. However, KVM_SET_ONE_REG currently writes
>> MDCR_EL2 through the generic sysreg path without taking the same lock.
>> Concurrent PMU configuration and register restore can therefore race and
>> lose updates to unrelated MDCR_EL2 bits.
> 
> Ugh, we should just stop updating MDCR_EL2.HPMN altogether. Since this
> overwrites the previous value (rather than clamping it) we could discard
> a legal value set by userspace.
> 
>  From the UAPI POV all we need to do is ensure the reset value is sane.
> The documentation says that system registers are reset to their warm
> reset values when KVM_ARM_VCPU_INIT is called. Which in this would mean
> HPMN is reset to the number of implemented counters at the time of the
> ioctl.
> 
> If userspace changes the number of counters afterwards, that's their
> problem.

One wrinkle is that KVM_ARM_VCPU_PMU_V3_SET_PMU and 
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS can only be used after 
KVM_ARM_VCPU_INIT. Thus, either change necessarily occurs after the
initial MDCR_EL2.HPMN reset value has been established. Userspace can 
issue KVM_ARM_VCPU_INIT again to reset HPMN from the new counter count.

This is awkward, but reflects the ordering imposed by the current UAPI. 
On real hardware, the counter count is fixed before the CPU is reset, 
whereas the UAPI configures it after the initial vCPU reset. 
Reinitializing the vCPU is at least consistent with the documented warm
reset semantics.

I'll update the next version to stop rewriting MDCR_EL2.HPMN after vCPU 
initialization. This also removes the need to serialize userspace 
MDCR_EL2 access or reject HPMN values.

Regards,
Akihiko Odaki

> 
>> Add explicit userspace accessors for MDCR_EL2. Serialize them with
>> config_lock so whole-register userspace writes cannot race with HPMN
>> rewrites, reject HPMN values above the configured PMU counter count, and
>> request a PMU reload when HPME changes to match guest trap behavior.
>>
>> Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
>> Closes: https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d%40rsg.ci.i.u-tokyo.ac.jp?part=6
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>> ---
>>   arch/arm64/kvm/sys_regs.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index d217530359ba..2b2ea33159e9 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2949,6 +2949,42 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>>   	return true;
>>   }
>>   
>> +static int get_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>> +		    u64 *val)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +
>> +	guard(mutex)(&kvm->arch.config_lock);
> 
> Hrm... I would strongly prefer that we *not* take the config_lock for
> this register since there's no way for userspace to avoid lock
> contention. ID registers are special and documented as VM-scoped, so an
> aware VMM could potentially set these once (avoiding the lock).
> 
>> +	*val = __vcpu_sys_reg(vcpu, MDCR_EL2);
>> +
>> +	return 0;
>> +}
>> +
>> +static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>> +		    u64 val)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +	u64 old, hpmn = FIELD_GET(MDCR_EL2_HPMN, val);
>> +
>> +	guard(mutex)(&kvm->arch.config_lock);
>> +
>> +	if (hpmn > vcpu->kvm->arch.nr_pmu_counters)
>> +		return -EINVAL;
> 
> KVM allows userspace to write whatever it wants right now, we can't
> start rejecting values that were previously valid. The architecture also
> allows anything to be written to the field, just that unimplemented
> values have UNKNOWN behavior.
> 
> Thanks,
> Oliver


