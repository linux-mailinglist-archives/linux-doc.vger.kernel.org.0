Return-Path: <linux-doc+bounces-96227-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B5KQIk/UUGqY5gIAu9opvQ
	(envelope-from <linux-doc+bounces-96227-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3673A0B4
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=JLT8WZJt;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96227-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96227-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56F28300C7D7
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 11:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C7416CE5;
	Fri, 10 Jul 2026 11:15:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8440F8D6
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682119; cv=none; b=GEH/pOt9Xf89bNAhUOg5WMLzgYu4t4BbduXtKHUKjtQqEPge7pUXmpipcrAIaBDHEHb4eLbddthgkl13OPVdWWkH+sFK3eSEXp46sgheVEIFvDMPhya6GPv5TkCeivm7DPbCE8jWPGpLVYhhSFYb/kkVVQ8i8ltTG/q63MEawXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682119; c=relaxed/simple;
	bh=GcmCes6lQAiKzkcGE+JER7EEugEN/SgS0n7mt6P7COA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBe0L3izPHHhK8MCFWhZaNpbBsko39f/Koh/ckCMW+lNA39AWOAOd2/ppyi92NKhQd3OHiZEhKZ7j4Qk4cd9r8qit49lu7J8JXuZZi3HwbMwJTeMWEj5c5qCtYukH9ls659cwiksd1Muexn+1Bn+fPECy95zSywBdDnj+i6waM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=JLT8WZJt reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsL024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:11 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=HxASWJordbwbK0dfh3jueBnYsD6Vv4drYFkhabaJ2Rc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682111; v=1;
        b=JLT8WZJtnfeQSeysxTLOQv/IXLP7DcdbdUjW4OoAjvT4T9QU43XTaks92DVo4AH8
         pVRBO1OUBCY9+7ldEgHCNEkz0D3UQxywyHV5JWmA4b3VUqwnNX7DaBhgTDDzB7A6
         7z7lAd1QSP63gD4twKdcwt7lXNTCXCiJPAiKIma59MNehFLYZxGBBpHpYXIcWyq1
         MYOOjnJ1hpmN0/Thgx/MPwK9RAYpjw5h7pdM4fd+3X/NbuzxipYq/tvzDALFYjPR
         rfCt5IgbblbGYpT4EPCP7BTI7wsAKXBx5aUZyC3bHa4O/f/Q230Ha1RcE50cBysI
         dWfH7/p6807zzdxFesKpRg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:15:01 +0900
Subject: [PATCH v8 07/11] KVM: arm64: PMU: Pass the pPMU to
 kvm_map_pmu_event()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-7-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=GcmCes6lQAiKzkcGE+JER7EEugEN/SgS0n7mt6P7COA=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFYs6gwv31I7O9j67mbfs16Z5uUYnUvquVQUxn1p1v
 X3OiYv3O0pZGMS4GGTFFFlSinZza0TXfipMiG+BmcPKBDKEgYtTACbi9pfhn+lrkXeBwpfPpO25
 3BBslG79XuhN+/dHnInJPiWnFRR5NzIy/Jt8fMvhiBT1oPuVdhsXbin7I6vw0+zTWq3P/5fXTTV
 3ZQYA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-96227-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,u-tokyo.ac.jp:email,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79E3673A0B4

Replace the VM argument with the pPMU used for event creation. The
current caller still passes the VM's default pPMU, but this removes the
implicit lookup from kvm_map_pmu_event() so later changes can map events
against the pPMU selected for an individual vCPU.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 68fce960ba69..1d03d0cb62f3 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -665,10 +665,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
-static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
+static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
 {
-	struct arm_pmu *pmu = kvm->arch.arm_pmu;
-
 	/*
 	 * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
 	 * for the guest's PMUv3 event ID.
@@ -720,7 +718,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
+	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 

-- 
2.55.0


