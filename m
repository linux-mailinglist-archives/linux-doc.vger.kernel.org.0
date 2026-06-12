Return-Path: <linux-doc+bounces-92186-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VNV5C2VeLGoJQAQAu9opvQ
	(envelope-from <linux-doc+bounces-92186-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:30:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FA67C012
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=qt4zRkD3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92186-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92186-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B46336A08B
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BDA3B388B;
	Fri, 12 Jun 2026 19:29:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF33AD53F
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292558; cv=none; b=XL1RyS7EDn/2Yl4GdEAhlLaA5xrx/AjwbOWvW6RYkr5JxAy6Rd4VXBkMsemw1hFFT4pWeljuuetQscjBYeK/3peRPqpQWJxf/RzV89jreDGLxkiZn4z+EU1oz+lrLa5MGj4ohLZ2to0E/9KHIf8rSpDeapN8INp8X7SJM25WpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292558; c=relaxed/simple;
	bh=06yjw3p+ipuRaTZAWCI5G1pBBjTnmA793yGUK4DpqJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lEfvsBCM90qH/yqeAxnJjibHtLoJtkZl71wNg3W6p6fPROYPZuVe+1RhOLps1B2RsWnu0cyypz5+SA4XePnom6tyOL1HVVzHYP23nBEHILbVd4rOoJP3GoSHAXX/4VYt8GTQQdNWWlvX5c4gvjqMCALsQ52IhSlA/bwSUOmEXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qt4zRkD3; arc=none smtp.client-ip=209.85.167.201
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-4862fcd9a3cso1686014b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292555; x=1781897355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=qt4zRkD3P79O7CMpCSgk2omvpeByXpgYK9BDRDYhwAC8+FHRR8aGBq7LgT2OwxcuoU
         PwPKAiPPDUmcZyakBXMBHt5xbzkAyuwYYVR388mFOdByzJkudKL3psOSscsWulusiIOC
         Br8SXVene6LB43AzjyN7JDdft61KRpCxslVBWRa3ZsAduCrt3p4ztm3NNtAZZiu3ipQX
         3j+2fq85DkWaFF/y34kN5cpPYuATR3h8HakRWBcVgHlzN9iZDoCOspsFGGOjpslvcipm
         FgrQUGSgAcntqR6Txf4LGNcWg0mkC9dNcAHrz0JEh04lpgLotX6ynmO59E2pEn09Riwl
         B4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292555; x=1781897355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2M2UIoQTEUhWBAO6CcMuiUQsYo7FQeN0Fuvmz5eDMgU=;
        b=mga/ro9+Q94AcwvkciFj9Pt0KaXWHnO3KjcNqxfwVCzOr0jDXshSu9r51GFsKWcgWJ
         XClVDDo63p5YZfTvDOSrCPwaJwlK5U7HpPZwvhxkzEKu5W1E3Jryn0BSZPTxpLNdegxb
         38GkcsuVsY6uUp5UDIJhNswbGxwZQDT5RqWmuhYjzy7zYaa0k4Fv/uKbDJa9SEX+HBfn
         Wees1993uK9rj3tiLAkhDerK1SzQkJRNERWsWmcN248arsHOx7fwHf2bRCTNZcm4JdIY
         7YJ1riWriuQNKBvWVXzNfp2GnfVtKG4ZbjZnFSHp/XxqlDJ+kKLVrAFZsaSY76EOitdr
         lclA==
X-Forwarded-Encrypted: i=1; AFNElJ8lzjtK2vfKzaxGLVk9J1ZaXKyHQQlxZ/NXX4gZsgSjrlfPm64+FDe5T2GvJWHFjHpgxv0z5VFJwSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAIJovoQ75QE9sofg+3MbJqhLJS+C6Jwy4TFK1ynIzKubOm9x
	I92Tip3Oxn49p15QwbLZVL2e1E5iqnkQpsMC30Xt7KJJCGb+ZAqAv5M3KZxxx6BHgvom4OBrWq0
	Pf0sgkw/RTsH/WzhZPpkJkIPjHw==
X-Received: from ilbdw10-n1.prod.google.com ([2002:a05:6e02:410a:10b0:502:1132:3db9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1920:b0:479:e7c7:dc76 with SMTP id 5614622812f47-4872f4bc1a3mr2488426b6e.26.1781292554890;
 Fri, 12 Jun 2026 12:29:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:53 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-6-coltonlewis@google.com>
Subject: [PATCH 05/21] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kvm@vger.kernel.org,m:alexandru.elisei@arm.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maz@kernel.org,m:oliver.upton@linux.dev,m:mizhang@google.com,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:mark.rutland@arm.com,m:shuah@kernel.org,m:gankulkarni@os.amperecomputing.com,m:james.clark@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:coltonlewis@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92186-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C13FA67C012

Check cntr_mask before using pmccntr to ensure it's available. With a
partitioned PMU, there may be instances where pmccntr is being used by
the guest and will be absent from cntr_mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1cceb1f614515..17bb1cfdc271c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1028,7 +1028,8 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
-		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
+		if (test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask) &&
+		    !test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
 			return ARMV8_PMU_CYCLE_IDX;
 		else if (armv8pmu_event_is_64bit(event) &&
 			   armv8pmu_event_want_user_access(event) &&
-- 
2.54.0.1136.gdb2ca164c4-goog


