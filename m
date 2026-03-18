Return-Path: <linux-doc+bounces-80057-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBZUHRMQu2kSegIAu9opvQ
	(envelope-from <linux-doc+bounces-80057-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 21:50:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F592C2A8E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 21:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA726316A40F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 20:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6500335BDBE;
	Wed, 18 Mar 2026 20:49:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFF830E821;
	Wed, 18 Mar 2026 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866963; cv=none; b=XduKV/9pAHZH3+geqlTR7GVGqvAgfsbE/3oO6+XmlB3NP7O5VhvLxgAO67kmF1L83NDi3+wLDtd+tLpJlZ7s8rkeQZSUQktdmRIvDYFbvKBEGsXMVDo2wYEGm7grwVk8m+bkjMqVd51hIrN2QUmCr3D2B574GDH0wFgzFhbqiTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866963; c=relaxed/simple;
	bh=n1fM29r4nuASTUHjHGhOCx77QdCEEOEgi8pNrgOqOLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=De6Fel5Nndm/+p/4CaZfDlYdhx6zYtT0E91KDFDpmWjB3xptR6m+3X0rVzmNCT55WQMRxyc/hSrbhrfp2TKKpNegsF9FIta9qHKrqK46On3EbhZUG5CGfcw6KHqBvb1UMzwXaBzZtViBCoqfvFI7GAb3ovwDrLvQRvsqieieOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600AA1BF7;
	Wed, 18 Mar 2026 13:49:15 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 849313F7BD;
	Wed, 18 Mar 2026 13:49:19 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Wed, 18 Mar 2026 20:48:02 +0000
Subject: [PATCH v3 05/10] ACPI: APEI: GHES: move vendor record helpers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-5-48e6a1c249ef@arm.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-cxl@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com, 
 rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de, 
 catalin.marinas@arm.com, krzk+dt@kernel.org, linux-doc@vger.kernel.org, 
 mchehab+huawei@kernel.org, tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=5704;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=n1fM29r4nuASTUHjHGhOCx77QdCEEOEgi8pNrgOqOLY=;
 b=MbC9LDgfo3k+E88lGzvGVrrqmdTJmvhilKaaxuunBzgcUB79Xdb4VDFcQ08KJnZ99GSPWFKy5
 /onGrfHdHMZATORliLlIYjw6lZQgh1cIqXWG/lA9+Zl4o48k3YbA2tT
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80057-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.551];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05F592C2A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shift the vendor record workqueue helpers into ghes_cper.c so both GHES
and future DT-based providers can use the same implementation. The change
is mechanical and keeps the notifier behavior identical.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c      | 50 ---------------------------------------
 drivers/acpi/apei/ghes_cper.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 include/acpi/ghes_cper.h      |  2 ++
 3 files changed, 57 insertions(+), 50 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 8a9b4dda3748..9703c602a8c2 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -383,56 +383,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 #endif
 }
 
-static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
-
-int ghes_register_vendor_record_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&vendor_record_notify_list, nb);
-}
-EXPORT_SYMBOL_GPL(ghes_register_vendor_record_notifier);
-
-void ghes_unregister_vendor_record_notifier(struct notifier_block *nb)
-{
-	blocking_notifier_chain_unregister(&vendor_record_notify_list, nb);
-}
-EXPORT_SYMBOL_GPL(ghes_unregister_vendor_record_notifier);
-
-static void ghes_vendor_record_work_func(struct work_struct *work)
-{
-	struct ghes_vendor_record_entry *entry;
-	struct acpi_hest_generic_data *gdata;
-	u32 len;
-
-	entry = container_of(work, struct ghes_vendor_record_entry, work);
-	gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
-
-	blocking_notifier_call_chain(&vendor_record_notify_list,
-				     entry->error_severity, gdata);
-
-	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
-	gen_pool_free(ghes_estatus_pool, (unsigned long)entry, len);
-}
-
-static void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
-					  int sev)
-{
-	struct acpi_hest_generic_data *copied_gdata;
-	struct ghes_vendor_record_entry *entry;
-	u32 len;
-
-	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
-	entry = (void *)gen_pool_alloc(ghes_estatus_pool, len);
-	if (!entry)
-		return;
-
-	copied_gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
-	memcpy(copied_gdata, gdata, acpi_hest_get_record_size(gdata));
-	entry->error_severity = sev;
-
-	INIT_WORK(&entry->work, ghes_vendor_record_work_func);
-	schedule_work(&entry->work);
-}
-
 /* Room for 8 entries */
 #define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
 static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
index 0a117f478afb..131980d36064 100644
--- a/drivers/acpi/apei/ghes_cper.c
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -14,12 +14,17 @@
 
 #include <linux/err.h>
 #include <linux/genalloc.h>
+#include <linux/irq_work.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/math64.h>
 #include <linux/mm.h>
+#include <linux/notifier.h>
+#include <linux/llist.h>
 #include <linux/ratelimit.h>
 #include <linux/rcupdate.h>
+#include <linux/rculist.h>
 #include <linux/sched/clock.h>
 #include <linux/slab.h>
 
@@ -266,6 +271,56 @@ void ghes_clear_estatus(struct ghes *ghes,
 		ghes_ack_error(ghes->generic_v2);
 }
 
+static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
+
+int ghes_register_vendor_record_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&vendor_record_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(ghes_register_vendor_record_notifier);
+
+void ghes_unregister_vendor_record_notifier(struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&vendor_record_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(ghes_unregister_vendor_record_notifier);
+
+static void ghes_vendor_record_work_func(struct work_struct *work)
+{
+	struct ghes_vendor_record_entry *entry;
+	struct acpi_hest_generic_data *gdata;
+	u32 len;
+
+	entry = container_of(work, struct ghes_vendor_record_entry, work);
+	gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
+
+	blocking_notifier_call_chain(&vendor_record_notify_list,
+				     entry->error_severity, gdata);
+
+	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
+	gen_pool_free(ghes_estatus_pool, (unsigned long)entry, len);
+}
+
+void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
+				   int sev)
+{
+	struct acpi_hest_generic_data *copied_gdata;
+	struct ghes_vendor_record_entry *entry;
+	u32 len;
+
+	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
+	entry = (void *)gen_pool_alloc(ghes_estatus_pool, len);
+	if (!entry)
+		return;
+
+	copied_gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
+	memcpy(copied_gdata, gdata, acpi_hest_get_record_size(gdata));
+	entry->error_severity = sev;
+
+	INIT_WORK(&entry->work, ghes_vendor_record_work_func);
+	schedule_work(&entry->work);
+}
+
 /*
  * GHES error status reporting throttle, to report more kinds of
  * errors, instead of just most frequently occurred errors.
diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
index 627fb1a5a121..6a37c03397fc 100644
--- a/include/acpi/ghes_cper.h
+++ b/include/acpi/ghes_cper.h
@@ -105,5 +105,7 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
 int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
 void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
 			    struct acpi_hest_generic_status *estatus);
+void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
+				   int sev);
 
 #endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


