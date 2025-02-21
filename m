Return-Path: <linux-doc+bounces-38860-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6590A3E881
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 00:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F50319C528E
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 23:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8CB267B8D;
	Thu, 20 Feb 2025 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2dqq6Kp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA72673AB
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094208; cv=none; b=RPUu4dc+RKrpghjqk9/r7+CQyak893jQI5HqPYuTyatUcogZ3B22EnXPx4WvrKgBdyFm9YLtCQKZDVxLqCWYBzrmyrKvleA2LdDP5nyRoezOxmG661yab22BZLHh+pbHNPbPAH+UjZ3NgbvSI2Rzm/HrfRtpai+2pgOKChzVbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094208; c=relaxed/simple;
	bh=Fq8ncCchsrCrQKzLlD/2bWJsivf8RZKsUMKlivyOCis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hEI/dkjF7EEqFeUEvDLnFaQnrCAX2HK3oe4UaHSuZExfCMRFvCcGDFkwu9PqXbmAoNRaJwONviYzB9gSgyxfQGnzzNDWizQQDFjV+rmxcvjCx9VzggJRUN8o1JvHx8fmLFFK+hOgd7e+hamsM07/nh+2PZtjD5h7VgEJI3THD3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2dqq6Kp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso4809136a91.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 15:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740094205; x=1740699005; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRXbppsiEDXYIZyPawrnpzOZz1QBOlzbaekCOtPmh4=;
        b=G2dqq6KpID2lHOI9enGwIclsha+QLdenLhKYcW6u/emKZoy/JTDWAVFNCvt5q0o5bH
         blKt1ihzrwCAFi0avFohtePC7BeoJNjtvuo6YVTN+2bwU5lnISE4tmWaNVmSVY2QQNLm
         bqt/UEMzCOl5UDk/TzkpHeVsHk0q/+1aVOm5B640TEMKR09xZGzS/0SpA6HvjJ6OJHl2
         thwnWeuivK9V1xAgtEmRdMeE3E6pW4jWM3Z68nBs/KqzeUcXUWQ6pkp6YVaL6l9Dp/Xt
         qhKQUoSBrZ5z+IxuGw9w0+rTlzNNh3eviao2M/yB6nekL2iChihDJRp5YHu3pzokr3j0
         Gb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740094205; x=1740699005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRXbppsiEDXYIZyPawrnpzOZz1QBOlzbaekCOtPmh4=;
        b=I0g3Ebg9jmJDcUzgddaPlleyn1L8954I6FUCOtInsQl6eXiAeScnUpDlSyR4hLMB+S
         RUoobQWSuacc0Q4h4KXpN0Vohf8P7bHg1zh94tr2s2hiE2iTTWb2PuU51OLQBl6xclBD
         hYSleinAnMNkASI7BDHMzUHVuEcSEjkTVzmOpWp0jS5qm9QyGbl779W5zdkrSedlHPE9
         IBtPDZ0Gao27OA7MEoce6z9tjn+PoPNYwApuF7wh4Pk5/lg55Dz45srGQf8WbJQeLM3g
         2ayJ+ZH34XqkhEATmAS7DhVL+ukW9ItwzdI2e1lPgpeXFcHw6wRZT9vUIJRETfILWXtD
         ejlw==
X-Forwarded-Encrypted: i=1; AJvYcCVnAgD7IuSmpLlWUJJsYtcsrougb/cMH+dvrDY1AGClgyJ0S76sByooVsc50nByAMn4BEJTrdRHT44=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1dOTB9wyaImPjcpLgYmWzjkLbFTwMXbk1Kp7+shh6eyj3IcI
	yr5wtVgxeFBtnzcPTihE0efYHaenSjDn2TUxFg61Cc7hqxdks4FIMPYRIW6qG1CcpllZf0h2gDP
	TqMhBdUyItQ==
X-Google-Smtp-Source: AGHT+IEJgmi64wdMWyANqEO34cKSZI9Wuz5tHq4A/owmtalUI629cLYAyrOiwBDklXhEIDQhnrCFWifbpOyeVA==
X-Received: from pjz8.prod.google.com ([2002:a17:90b:56c8:b0:2fc:c98:ea47])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2590:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2fce75e1b18mr2115049a91.0.1740094205662;
 Thu, 20 Feb 2025 15:30:05 -0800 (PST)
Date: Thu, 20 Feb 2025 23:29:58 +0000
In-Reply-To: <20250220232959.247600-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250220232959.247600-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250220232959.247600-2-jiaqiyan@google.com>
Subject: [RFC PATCH v3 2/3] KVM: arm64: set FnV in vcpu's ESR_ELx when host
 FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). This means the
poisoned guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value. KVM sends SIGBUS
to interrupt VMM/vCPU but the si_addr will be zero.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in vcpu's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
  and holds garbage value
- in vcpu's ESR_EL2 to let nested virtualization know that FAR_EL2 is
  invalid and holds garbage value

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..2b01b331a4879 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -13,6 +13,7 @@
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_ras.h>
 #include <asm/esr.h>
 
 static void pend_sync_exception(struct kvm_vcpu *vcpu)
@@ -81,6 +82,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.48.1.658.g4767266eb4-goog


