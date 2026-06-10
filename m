Return-Path: <linux-doc+bounces-91777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yMceJObBKGqSJAMAu9opvQ
	(envelope-from <linux-doc+bounces-91777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:46:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A26654D7
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=rYvBp0RK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91777-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91777-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7591E30BB9A8
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106F733556D;
	Wed, 10 Jun 2026 01:45:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B3331A78
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:45:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055939; cv=none; b=nd92rH4eCAwqghY9h7mA7x3YIxosM1fJBwdtHJ3zKP5pwfvWOTnU/wTWa94dgwRswpOBMy7Zphw9U/RxtxG+v/AcJmOfmVnzriIL8FFFpEWp6VYKvSt9ZGGP51HVaPxdFeLhHWblqrnnRLiqQaKS8vpcEkIYJZxEScSVlL2WItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055939; c=relaxed/simple;
	bh=8Jzxfarh3kFcVduKM3nTtCfp1Kiq3jIGAAIiFN4XSUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG636XzHvZQk5KFomRS9BUk2nak39Atoi5TDqn6Yuxt2bgF+mR/yh+TCYBLx8Cm448cDqCiBZzVUJQvtLtL6V93EIxgiaJkYkpSolmLyY8Oql5nfGLPUMelnboEw+HzOjOEXll32SYQPtfEh95DGPdNOS+gQhNUcAEphBarrqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rYvBp0RK; arc=none smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5175cb5946dso41140881cf.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 18:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055930; x=1781660730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKutm9+cyTIXeV2mo8MjsDLORYjIUZMG6rmHK81GwDk=;
        b=rYvBp0RK6rS5y9eHOoaKo8TGPX0WRF9hW1coBVw12TFzMDXM3WtuEGMTLEOVjJcJr3
         +mupQNyLOQ5bxwZ68Ou/xQB0QGoGBJkXSYqmd3tRIkuC1xsnFROsCb/ohUmDludUpMra
         ztEKMdCCteNaqWK1XmKn6slVV18pgfU0iatsRg7ei7stV/fcfemAW79oRLHOEGjEXFtd
         vmo8mpmD0KcCNMNRy2cN88bHe/cC4+CMUB8pNOksO1LV5UvZAY5s4I04I2GS0OweWk0j
         1qVWvPMy5fs/E8B2OThIlMW8AAFdGN44EOoITnzzWIVZYtoyc3tzFg16kSktdHUfoINc
         NpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055930; x=1781660730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKutm9+cyTIXeV2mo8MjsDLORYjIUZMG6rmHK81GwDk=;
        b=KAhzuD8Jsytyu5pzWqe00wAya/fe6akY74JHnysobelEcIh6pBY7jlUhxvjbazagbJ
         2iwXoaQKzvuh5JDNe80QKSiBx7SHeUAl5PMdBzPgTFGk1vGpAn2I60gsz89WlZskNP6t
         toei516yucGG76dlmq6lkD4U5kmnB5NIQAYs/bCIReoGYTIVU2Hgq093gDTv8xn9daa6
         qma1aJFDD1RpshZGV5VYlJWoJVSYHHnmgnctWpsvjOBo4xcfrLLDzlO0pS/KzXtp5ZFn
         paSu0i+hepI06i5c0yLuPO2NtIxxXRseJ0YPa/4oyKTdRn+h4WjBSf+VzG1HQHj+a9YA
         SeYg==
X-Forwarded-Encrypted: i=1; AFNElJ893/7Wm1orRIuSwPgJP3zagExwhVRrm+QQ5LRc4Tn4CeMQ49tNyc7vPg4mLWI/p+XpNgB2Rvlm4x0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Jwur/9en1kI1alK1ITczq4bb50qIve/JTXeiuMbyruIrq71S
	atxBMEYvSQkoSf2+9s9yhxycEvY6wQAIDUjQaEcsEuYKd0VB7cH0rBsAKf4U1vFXfHM=
X-Gm-Gg: Acq92OGUe0tfmWToJvkL4w9Wv7krHOs3OpOHmaKvjRG8saWWueYWARpGCaqtQqdPQMw
	3/fChFscPWRJ2ojmS/gBX2fvfU4k6fwiFjwI13nJaujRQdVosXvP1oku1GnbOOrvqFkQJgZ+u2S
	l2zPzFED5mlfPMorGzEQ18DglsCKCRNljgAcN2eV1ZDnEMtNrpavJwhVqxjP0NpiwWSC9xOnJMw
	lDpi4H4jTUenJ0mtikJLRXqLt/qvFHhBH19esuMbPlzqqMfcBImWC3KGYU19WhTdzc/Dp4n6xXw
	h1rsS49H+yihAix8QvHWISAPKh83H3KVzX2pSx46FHK1pshwbWcp+R5JucdF++OOov8AJQqBNWF
	hZzrOzrVaVo3YWhEK4nlNn3A5ZARTM4zttgesIQBZ/yCMUnCoiGaXX55rf/WUvZiTIQ/NlmZbPw
	EJUsPm1DHjL1iabUwIcjAGWghAFkzxNgN1wBSJH1n5DmM0I/88Dnsw8LUcxNDumFv0XD2ve1jBA
	ibhPvotaSzz7k+HVj3ku3o=
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr323037361cf.14.1781055930465;
        Tue, 09 Jun 2026 18:45:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:30 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	rafael@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	rdunlap@infradead.org,
	feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com,
	elver@google.com,
	kuba@kernel.org,
	ebiggers@kernel.org,
	lirongqing@baidu.com,
	paulmck@kernel.org,
	gourry@gourry.net,
	dave.jiang@intel.com,
	jic23@kernel.org,
	xueshuai@linux.alibaba.com,
	kai.huang@intel.com
Subject: [RFC PATCH 2/3] acpi/numa: add CONFIG_ACPI_NUMA_STANDBY_NODES
Date: Tue,  9 Jun 2026 21:45:16 -0400
Message-ID: <20260610014517.253609-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610014517.253609-1-gourry@gourry.net>
References: <20260610014517.253609-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:rafael@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:paulmck@kernel.org,m:gourry@gourry.net,m:dave.jiang@intel.com,m:jic23@kernel.org,m:xueshuai@linux.alibaba.com,m:kai.huang@intel.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91777-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[gourry.net];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B3A26654D7

Some platforms want to reserve empty NUMA nodes at boot so that drivers
can later place hotplugged memory on distinct nodes for memory tiering
or isolation, without those nodes being described by BIOS.

Add CONFIG_ACPI_NUMA_STANDBY_NODES, a platform-independent count of empty
nodes to reserve.

Deferring standby node creation until after NUMA emulation runs keeps
old numbering behaviors consistent for NUMA emulation users.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/acpi/numa/Kconfig | 15 +++++++++++++++
 drivers/acpi/numa/srat.c  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
index f33194d1e43f..ecf27bf45e5b 100644
--- a/drivers/acpi/numa/Kconfig
+++ b/drivers/acpi/numa/Kconfig
@@ -13,3 +13,18 @@ config ACPI_HMAT
 	 register memory initiators with their targets, and export
 	 performance attributes through the node's sysfs device if
 	 provided.
+
+config ACPI_NUMA_STANDBY_NODES
+	int "Additional standby NUMA nodes for runtime claiming"
+	depends on ACPI_NUMA
+	range 0 16
+	default 0
+	help
+	  Number of additional empty NUMA nodes to reserve at boot for
+	  runtime claiming via numa_request_exclusive_node().
+
+	  These nodes have no memory and no SRAT PXM association.
+	  Drivers can claim them to place hotplugged memory on distinct
+	  NUMA nodes for memory tiering or isolation purposes.
+
+	  Set to 0 (default) to disable.
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 62d4a8df0b8c..d7b0e4ece610 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -664,6 +664,9 @@ int __init acpi_numa_init(void)
 		return cnt;
 	else if (!parsed_numa_memblks)
 		return -ENOENT;
+
+	/* Request any standby nodes (created after numa emulation) */
+	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES);
 	return 0;
 }
 
-- 
2.54.0


