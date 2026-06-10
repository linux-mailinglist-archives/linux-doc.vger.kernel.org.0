Return-Path: <linux-doc+bounces-91778-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sRSUN+3BKGqYJAMAu9opvQ
	(envelope-from <linux-doc+bounces-91778-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:46:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF66654DA
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=R4ABMR3B;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91778-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91778-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 782F8303CD3F
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC2F331EC5;
	Wed, 10 Jun 2026 01:45:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6442A80
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:45:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055942; cv=none; b=RhZRTUg3DnJoPaTFddjMhomBbuPDnMvjf8PUuy1t7KFxgFUpAV3amNdEfgYfXHhxLK9BcP/5zwT8amnhtRQWLJSau5D1PJYugQhGLZI/WEszCj4w/qQudqjg6Gg20PsXCFn/WGiRldgEBStNNl0l/erUryVBMORIYdQSMEnGIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055942; c=relaxed/simple;
	bh=4lm3filvyu7qL3c3XAtVgVtfMqNVCD7xcUCj3uoAlw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMiXctg2eWGuxL12BPK02G3F76vCofAH+CKpZ7UsVbkt9B8mzkCcdz9EAf75EVla1YVN5uO/xZfaTYtYr7FVQEzzEuw7ber4/GMvtkUD0nGOXX6zscn7XHZv/Kr85oCTe+VsT8jurFyPbTbkvhAfakIx3+5NBOzpMFQB7gBHHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=R4ABMR3B; arc=none smtp.client-ip=209.85.160.169
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5177b1a7441so87143181cf.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055933; x=1781660733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsslT2SHe3Ngpr6+flW/+aA6XcPRV1aWnG37ChpGzVM=;
        b=R4ABMR3BVqUKgpCrs5HX9Qx21n9we9fMMneuOfN+2o+j+SxTUqIzgsTId4RsIjLFur
         x3gzwUzxl3WWgUKUhOslcR3bUoaUaraetL/fYz39bUjDJK/2kn8aWeVfHWQXHWb94iqv
         0ROGcQ3THu1iiunBAzWPX2G5b8RGEBCvgzVy6hFUXvhEdpqyg2rGomVXZSZ1X+6UGsIt
         mcmIymrI8zTBPAYRFQDu0iaDm37TgWM7juT+unyOA5BFtJA02qPKhjrdShUBWVixgXZ5
         8n0ltGSw1FzMfaVk2+qfzRCvdlKNmuOJ7ksoQLVgOAWf5s4ctnHPgy9PmJUN9631joTK
         E0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055933; x=1781660733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsslT2SHe3Ngpr6+flW/+aA6XcPRV1aWnG37ChpGzVM=;
        b=KHOnzV2PJyymlyK9FdpXXI6l9TCB52qA3JMOYCSEBaplDu01A4A3gnFLjuoxlgpOQb
         CFVzZJHDKXecJ3njloKLXJlG5XrIdqSoUpPWrSaCM4NP/DGLoWZihn698NeGNC6Ee5tN
         YemRcEXC6k+NB/57S7r9tp9WbaK1RPVocrW5G1oJ0CordnD0fbBokT+2qNnp1yh1QHNA
         t18NkQys30llge+wFiEwzD6tyzqGWQ7aBevXU+Cmeez6x4xRScizDDv4LigTj6fOMGnu
         l3Ia8p1bc2McYqYBLHshuO1IFpvc3SQAqebzfaCtZGhuRDTZqQFadW8pB6DA+vUuNyju
         6S4w==
X-Forwarded-Encrypted: i=1; AFNElJ8w/rGHkCSQ4gEMVk2Gu5QrzkgNlmBJRjJg7rJTuszAjXqRk6NHjo2pfdBrO4VacJLHhLRcVmAaEJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZNn9hRvtzlDQAkQ6YY56LdtGphCVy9ckaGvP3MwWdhooxyMB
	/LQL50FGiSxnPoE1yBchSTWyG8oI4BP0MepuFdZKin0a1D4nzROEmgBg/HglZ8bGgfU=
X-Gm-Gg: Acq92OF4ID4icw+QwgDL4QFTuWsmHPXlndF+fFQHEN5IfeQRUNu4u1xIfcitfB4h+kI
	SDWZgiW0qzoqxJfaGJckShlimwfu9JIfVW07ti9KuIJLpPVVHqrred8F1TwQFsKAbGlzucnqGZ/
	bs7m7qOEpx0s1DS7z0c58PemRHURXGpdNvYCcKV4Vk7+waN86fTV8eu+cA5zLCjkCxI9yOyNKQv
	qyxkdzOoTajxPB30wkkQMzkZuhcLCDf/X56Exf0n4sfyqe96ugOPu7Icxidj9o+sPXwdXTuSQN9
	Jm9Orq8eDk80/rJxEp7kj8leP18Q7KFxlUAnHkwwZGihWZmOdSeIQrxR58IClqk0d8JdjXMV7tE
	dUBN0dMr1N414VBxw+Jre1OMM2K3774rek3jGfQJAAE8I4dMejPSTLCQrn+BNBt26ap+ko0PvOs
	3qxOyeCOSKoZ1kglBar6YizU1jMot7FDK/dPhgC61MWo1dMrq96x8EL3iTzpYZizt4mTdrJCvH9
	QSfg75Yd/JNhA00iFKZbpA=
X-Received: by 2002:ac8:59cd:0:b0:517:b68a:8d84 with SMTP id d75a77b69052e-517c22529e3mr130851341cf.56.1781055932831;
        Tue, 09 Jun 2026 18:45:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:31 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] acpi/numa: add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES
Date: Tue,  9 Jun 2026 21:45:17 -0400
Message-ID: <20260610014517.253609-4-gourry@gourry.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:rafael@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:paulmck@kernel.org,m:gourry@gourry.net,m:dave.jiang@intel.com,m:jic23@kernel.org,m:xueshuai@linux.alibaba.com,m:kai.huang@intel.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91778-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[gourry.net];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DEF66654DA

CXL is intended to be a programmable topology, and a single CXL Fixed
Memory Window (CFMWS) may back memory that a driver wants to split across
multiple NUMA nodes for tiering or isolation.

Those nodes must exist at __init time to be usable later.

Add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES, the number of additional standby
NUMA nodes to reserve per CEDT CFMWS entry.

acpi_parse_cfmws() records the per-window count, which is folded into
the standby request on successful acpi_numa_init().

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/acpi/numa/Kconfig | 20 ++++++++++++++++++++
 drivers/acpi/numa/srat.c  | 13 +++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
index ecf27bf45e5b..65d7eb9a4022 100644
--- a/drivers/acpi/numa/Kconfig
+++ b/drivers/acpi/numa/Kconfig
@@ -14,6 +14,26 @@ config ACPI_HMAT
 	 performance attributes through the node's sysfs device if
 	 provided.
 
+config ACPI_NUMA_ADD_CFMWS_NODES
+	int "Additional standby NUMA nodes per CEDT CFMWS entry"
+	depends on ACPI_NUMA
+	range 0 4
+	default 0
+	help
+	  Number of additional standby NUMA nodes to reserve per CEDT
+	  CXL Fixed Memory Window Structure (CFMWS) entry.
+
+	  By default ACPI reserves 1 NUMA node per unique PXM entry in
+	  the SRAT, or 1 node for a CFMWS without SRAT mappings.
+
+	  Setting this > 0 reserves additional standby nodes per CFMWS
+	  that drivers can claim at runtime via
+	  numa_request_exclusive_node(). This is useful for CXL drivers
+	  that want to place memory on distinct NUMA nodes within the
+	  same CXL Fixed Memory Window.
+
+	  Set to 0 (default) to disable.
+
 config ACPI_NUMA_STANDBY_NODES
 	int "Additional standby NUMA nodes for runtime claiming"
 	depends on ACPI_NUMA
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index d7b0e4ece610..6c54d5f0cf0a 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -354,6 +354,7 @@ static int __init acpi_parse_slit(struct acpi_table_header *table)
 }
 
 static int parsed_numa_memblks __initdata;
+static int cfmws_standby_count __initdata;
 
 static int __init
 acpi_parse_memory_affinity(union acpi_subtable_headers *header,
@@ -454,7 +455,7 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
 	 * window.
 	 */
 	if (!numa_fill_memblks(start, end))
-		return 0;
+		goto standby_nodes;
 
 	/* No SRAT description. Create a new node. */
 	node = acpi_map_pxm_to_node(*fake_pxm);
@@ -473,6 +474,11 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
 
 	/* Set the next available fake_pxm value */
 	(*fake_pxm)++;
+
+standby_nodes:
+	/* Request any standby nodes (created after numa_emulation runs) */
+	cfmws_standby_count += CONFIG_ACPI_NUMA_ADD_CFMWS_NODES;
+
 	return 0;
 }
 
@@ -607,6 +613,8 @@ int __init acpi_numa_init(void)
 	if (acpi_disabled)
 		return -EINVAL;
 
+	cfmws_standby_count = 0;
+
 	/*
 	 * Should not limit number with cpu num that is from NR_CPUS or nr_cpus=
 	 * SRAT cpu entries could have different order with that in MADT.
@@ -666,7 +674,8 @@ int __init acpi_numa_init(void)
 		return -ENOENT;
 
 	/* Request any standby nodes (created after numa emulation) */
-	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES);
+	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES +
+				   cfmws_standby_count);
 	return 0;
 }
 
-- 
2.54.0


