Return-Path: <linux-doc+bounces-96226-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9mVbIk/UUGqX5gIAu9opvQ
	(envelope-from <linux-doc+bounces-96226-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811C73A0B3
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=oCRVGQbk;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96226-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96226-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 572B63002D00
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C35414A2A;
	Fri, 10 Jul 2026 11:15:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990FF3B1EE4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682119; cv=none; b=aV7yo1SYqVNG3bdppCdfXkYbLlDIAM+SRe5t6XoMB5lNJsfFkhdvcWpzixcaWumaODM1VBbq2kKEip4JJn0Glp+TRyca750zfC3YHRy4xbmsIRPCMeZBt8RIfO2DUCVQanRi2ZfzJgHkNPG2FoasiOn91R3VtYZY1zJadybnd+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682119; c=relaxed/simple;
	bh=fNgLUnEmlqyfrAV7tVVlH3jDqmlIGrds8QqIzA+zcPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/tJE6MDD0BESq7yAlEgKElvED980yoLb+OAsTpXjLPYAxmwmXiwnLs2xZ3PB7J0O4i/u1F1X1m5ZmqFN+o1d/5usB+POqntb4HelCgLzwi7oB9Hkjr3cH8GeaIfaj68Ot6jY8fO31NOcJohH/KLRVt83hLvGHsTdoM4pJ737zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=oCRVGQbk reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsF024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:09 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=A1U9p3xnoBS2jAZ6UnAQTf41UHMysFjf1pjjxobco+c=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682109; v=1;
        b=oCRVGQbk2lJFPvYDCiIYcmDhY2QoB5j+kQXnVsbuWv987cCUgl7i2HpWFxWoj4xo
         Czpj/FgXnC5PBzcTKP8RIvTl5RiMT5sCZEmDaw+XgbWmFn035W3GelktZZYaeQ7T
         kdWnua8L2gbpgR2CWWteNtuHejoivSLGWRF79n6FkfGoMg3yyXk7X/c5MpVrhz5h
         PBCCb2F3Z0bEce6wNHnSUuErwyhDfUQJUMBTLg3vXDs41GQn6Icf0CrOrajjhT1j
         pfvs94NvMST8YYjoRWgMvnbxCepQOMFZCscRIPpny2g/N9lKAH19mnwcTrOB58hc
         28NpAO2Y1ljEpmevXf1mSw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:14:55 +0900
Subject: [PATCH v8 01/11] KVM: arm64: Serialize userspace MDCR_EL2 access
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-1-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=fNgLUnEmlqyfrAV7tVVlH3jDqmlIGrds8QqIzA+zcPw=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFZM9IrZRGvlMeqLVClzr1HR2uRnwhHyw6qzWNz+z6
 v7c+u0dpSwMYlwMsmKKLClFu7k1oms/FSbEt8DMYWUCGcLAxSkAEzFpYvjvcVVnx2nF47oTHnvY
 /L2kvVD6Re9q+71iTSGfZ7LKTvgnzfA/MudQgPXLZ2rHoqwmf27ezuVkLFZqlpqabLFgduf7bg9
 eAA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,huawei.com,redhat.com,lwn.net,linuxfoundation.org,gmail.com,rasmusvillemoes.dk];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	TAGGED_FROM(0.00)[bounces-96226-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,u-tokyo.ac.jp:email,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5811C73A0B3

kvm_arm_set_nr_counters() updates MDCR_EL2.HPMN for every vCPU while
holding kvm->arch.config_lock. However, KVM_SET_ONE_REG currently writes
MDCR_EL2 through the generic sysreg path without taking the same lock.
Concurrent PMU configuration and register restore can therefore race and
lose updates to unrelated MDCR_EL2 bits.

Add explicit userspace accessors for MDCR_EL2. Serialize them with
config_lock so whole-register userspace writes cannot race with HPMN
rewrites, reject HPMN values above the configured PMU counter count, and
request a PMU reload when HPME changes to match guest trap behavior.

Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
Closes: https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d%40rsg.ci.i.u-tokyo.ac.jp?part=6
Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/sys_regs.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d217530359ba..2b2ea33159e9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2949,6 +2949,42 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static int get_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 *val)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	*val = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	return 0;
+}
+
+static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	struct kvm *kvm = vcpu->kvm;
+	u64 old, hpmn = FIELD_GET(MDCR_EL2_HPMN, val);
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	if (hpmn > vcpu->kvm->arch.nr_pmu_counters)
+		return -EINVAL;
+
+	old = __vcpu_sys_reg(vcpu, MDCR_EL2);
+	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
+
+	/*
+	 * Request a reload of the PMU to enable/disable the counters
+	 * affected by HPME.
+	 */
+	if ((old ^ val) & MDCR_EL2_HPME)
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
+	return 0;
+}
+
 static bool access_ras(struct kvm_vcpu *vcpu,
 		       struct sys_reg_params *p,
 		       const struct sys_reg_desc *r)
@@ -3652,7 +3688,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG_FILTERED(SCTLR2_EL2, access_vm_reg, reset_val, 0,
 			 sctlr2_el2_visibility),
 	EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
-	EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
+	SYS_REG_USER_FILTER(MDCR_EL2, access_mdcr, reset_mdcr, 0,
+			    get_mdcr, set_mdcr, el2_visibility),
 	EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
 	EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
 	EL2_REG_VNCR_FILT(HFGRTR_EL2, fgt_visibility),

-- 
2.55.0


