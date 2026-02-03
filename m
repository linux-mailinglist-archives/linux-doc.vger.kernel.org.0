Return-Path: <linux-doc+bounces-75152-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCfHOW1ugmlkUAMAu9opvQ
	(envelope-from <linux-doc+bounces-75152-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:53:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25EDF010
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0958F305EC30
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 21:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A6E37BE6D;
	Tue,  3 Feb 2026 21:46:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A937237474E;
	Tue,  3 Feb 2026 21:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155165; cv=none; b=TuxVdZ5HReS6MsGwBWESjR7XKeName8wQFEb/Jh+maZfaHs0iqn+0uZCUAhA38O643+N/q65LzXHr6qrPkXjXX4Uqh944jgYSFmgbpWC94lm/9PgwY7jUr/l+WW5pCmNuvLNvvkNp4TJBD9y2GXN4EPndsWznI0qOSmeWb5bM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155165; c=relaxed/simple;
	bh=1lIrBwqG43E6F5Ld2gMLyVOvADphvqgOKdh0VuDd4Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eALGfI1nNut+4VmmOq4J4QIV0then3xol35J3/YODpO/WNKw8YYSOWWkJ1NPH0II94AGtzeayuQMx4yQqKxvr/SlVMjb0kmwnT4RZ7zz+RscLreX6DsApIsPbQMJjwBoWHH06PUUP0cNZjqIbpI9btR79VQ+idCDyW55A+1AZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB76A339;
	Tue,  3 Feb 2026 13:45:56 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0C0F3F778;
	Tue,  3 Feb 2026 13:45:57 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v4 21/41] arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
Date: Tue,  3 Feb 2026 21:43:22 +0000
Message-ID: <20260203214342.584712-22-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75152-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,huawei.com:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 0C25EDF010
X-Rspamd-Action: no action

From: Dave Martin <Dave.Martin@arm.com>

MPAM uses a fixed-point formats for some hardware controls.  Resctrl
provides the bandwidth controls as a percentage. Add helpers to convert
between these.

Ensure bwa_wd is at most 16 to make it clear higher values have no meaning.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Ensure bwa_wd is at most 16 (moved from patch 40: arm_mpam: Generate a
configuration for min controls)
Expand comments
---
 drivers/resctrl/mpam_devices.c |  7 +++++
 drivers/resctrl/mpam_resctrl.c | 51 ++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bf99c37a80a7..965384c667f6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -713,6 +713,13 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			mpam_set_feature(mpam_feat_mbw_part, props);
 
 		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
+
+		/*
+		 * The BWA_WD field can represent 0-63, but the control fields it
+		 * describes have a maximum of 16 bits.
+		 */
+		props->bwa_wd = min(props->bwa_wd, 16);
+
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_max, props);
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 12017264530a..ece46e0d2ab3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <linux/list.h>
+#include <linux/math.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/resctrl.h>
@@ -228,6 +229,56 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
 	return class->props.cpbm_wd <= 32;
 }
 
+/*
+ * Each fixed-point hardware value architecturally represents a range
+ * of values: the full range 0% - 100% is split contiguously into
+ * (1 << cprops->bwa_wd) equal bands.
+ *
+ * Although the bwa_bwd fields have 6 bits the maximum valid value is 16
+ * as it reports the width of fields that are at most 16 bits. When
+ * fewer than 16 bits are valid the least significant bits are
+ * ignored. The implied binary point is kept between bits 15 and 16 and
+ * so the valid bits are leftmost.
+ *
+ * See ARM IHI0099B.a "MPAM system component specification", Section 9.3,
+ * "The fixed-point fractional format" for more information.
+ *
+ * Find the nearest percentage value to the upper bound of the selected band:
+ */
+static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
+{
+	u32 val = mbw_max;
+
+	val >>= 16 - cprops->bwa_wd;
+	val += 1;
+	val *= MAX_MBA_BW;
+	val = DIV_ROUND_CLOSEST(val, 1 << cprops->bwa_wd);
+
+	return val;
+}
+
+/*
+ * Find the band whose upper bound is closest to the specified percentage.
+ *
+ * A round-to-nearest policy is followed here as a balanced compromise
+ * between unexpected under-commit of the resource (where the total of
+ * a set of resource allocations after conversion is less than the
+ * expected total, due to rounding of the individual converted
+ * percentages) and over-commit (where the total of the converted
+ * allocations is greater than expected).
+ */
+static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
+{
+	u32 val = pc;
+
+	val <<= cprops->bwa_wd;
+	val = DIV_ROUND_CLOSEST(val, MAX_MBA_BW);
+	val = max(val, 1) - 1;
+	val <<= 16 - cprops->bwa_wd;
+
+	return val;
+}
+
 /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
 static void mpam_resctrl_pick_caches(void)
 {
-- 
2.43.0


