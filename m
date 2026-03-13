Return-Path: <linux-doc+bounces-79296-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN+pD8YotGkQiQAAu9opvQ
	(envelope-from <linux-doc+bounces-79296-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:09:58 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0C2859B6
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85C9530C4000
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B523B3BF3;
	Fri, 13 Mar 2026 14:48:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8DE3ACEE7;
	Fri, 13 Mar 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413312; cv=none; b=B1N3VovBFT3lsKoHSgvZzMA1c+NckHBFD1VNbitZQkDyCZcUtyF3U+iuoJfnsaLKsb6XtUfx30SoCN77TWrsAB4BOWRjU0dfTWXD+vZTtL+qoO9Ma06467KJgAp9nzYfCvYCmo+6TkgybGemmUO0EZQScKcjI8BA32XMeEnRTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413312; c=relaxed/simple;
	bh=6/+ypA5dK1dQY+joiCTcAJShi3CbzagZqTYql1DL9XM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q85QQolm/eilOQgmvRF78xAml7XZyEnrIXcJ5VAU+g7j4+ZNf0/QisfaL4gMu4l6igD0MUkoSZlc/tHPh3XlFGc0khrHooqkoqcBV11BHKzMrYoeBMQqL3dhv7BZGMjgOR7Bnsl0iBfsgfdGt/EYrQrpFoC9goyhz9nZ+CKoyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05DDC244C;
	Fri, 13 Mar 2026 07:48:24 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A7673F7BD;
	Fri, 13 Mar 2026 07:48:26 -0700 (PDT)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 28/40] arm_mpam: resctrl: Add support for csu counters
Date: Fri, 13 Mar 2026 14:46:05 +0000
Message-ID: <20260313144617.3420416-29-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-79296-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.633];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,huawei.com:email,fujitsu.com:email,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 4AC0C2859B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: James Morse <james.morse@arm.com>

resctrl exposes a counter via a file named llc_occupancy. This isn't really
a counter as its value goes up and down, this is a snapshot of the cache
storage usage monitor.

Add some picking code which will only find an L3. The resctrl counter
file is called llc_occupancy but we don't check it is the last one as
it is already identified as L3.

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Co-developed-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Allow csu counters however many partid or pmg there are
else if -> if
reduce scope of local variables
drop has_csu

Changes since v2:
return -> break so works for mbwu in later patch
add for_each_mpam_resctrl_mon
return error from mpam_resctrl_monitor_init(). It may fail when is abmc
allocation introduced in a later patch.
Squashed in patch from Dave Martin:
https://lore.kernel.org/lkml/20250820131621.54983-1-Dave.Martin@arm.com/

Changes since v3:
resctrl_enable_mon_event() signature update
Restrict the events considered
num-rmid update
Use raw_smp_processor_id()
Tighten heuristics:
 Make sure it is the L3
 Please shout if this means the counters aren't exposed on any platforms
Drop tags due to change in policy/rework

Changes since v4:
Move generic monitor boilerplate to separate patch
---
 drivers/resctrl/mpam_resctrl.c | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 88895d704625..00f3ad23a335 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -311,6 +311,28 @@ static bool class_has_usable_mba(struct mpam_props *cprops)
 	return mba_class_use_mbw_max(cprops);
 }
 
+static bool cache_has_usable_csu(struct mpam_class *class)
+{
+	struct mpam_props *cprops;
+
+	if (!class)
+		return false;
+
+	cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return false;
+
+	/*
+	 * CSU counters settle on the value, so we can get away with
+	 * having only one.
+	 */
+	if (!cprops->num_csu_mon)
+		return false;
+
+	return true;
+}
+
 /*
  * Calculate the worst-case percentage change from each implemented step
  * in the control.
@@ -636,6 +658,64 @@ static void mpam_resctrl_pick_mba(void)
 	}
 }
 
+static void counter_update_class(enum resctrl_event_id evt_id,
+				 struct mpam_class *class)
+{
+	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
+
+	if (existing_class) {
+		if (class->level == 3) {
+			pr_debug("Existing class is L3 - L3 wins\n");
+			return;
+		}
+
+		if (existing_class->level < class->level) {
+			pr_debug("Existing class is closer to L3, %u versus %u - closer is better\n",
+				 existing_class->level, class->level);
+			return;
+		}
+	}
+
+	mpam_resctrl_counters[evt_id].class = class;
+}
+
+static void mpam_resctrl_pick_counters(void)
+{
+	struct mpam_class *class;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		/* The name of the resource is L3... */
+		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
+			pr_debug("class %u is a cache but not the L3", class->level);
+			continue;
+		}
+
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
+			pr_debug("class %u does not cover all CPUs",
+				 class->level);
+			continue;
+		}
+
+		if (cache_has_usable_csu(class)) {
+			pr_debug("class %u has usable CSU",
+				 class->level);
+
+			/* CSU counters only make sense on a cache. */
+			switch (class->type) {
+			case MPAM_CLASS_CACHE:
+				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				break;
+			default:
+				break;
+			}
+		}
+	}
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
@@ -1270,6 +1350,9 @@ int mpam_resctrl_setup(void)
 		}
 	}
 
+	/* Find some classes to use for monitors */
+	mpam_resctrl_pick_counters();
+
 	for_each_mpam_resctrl_mon(mon, eventid) {
 		if (!mon->class)
 			continue;	// dummy resource
-- 
2.43.0


