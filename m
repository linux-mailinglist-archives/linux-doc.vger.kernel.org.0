Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD49485EF8
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jan 2022 03:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345009AbiAFCtb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jan 2022 21:49:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:35152 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344936AbiAFCtZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jan 2022 21:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641437365; x=1672973365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kaB8tLk1lhb8W+rT7/16+mJ4M42irVpYYrkqFKQYIWg=;
  b=FRlpmAG3HhmaLsgSDK9TOUSnRn5bKbzBiupiDN13Gj2q2/TIHAapes+2
   wkSocyA6nIQUQjVcxnwCYOojm0wZBKvF/E58tCAaM5o89xyzl5Ejfx6HE
   zclDW6jEvIsHo2N7IkludeyBV5T9mD+jFtYM+u3eoo1yRx9utu9ff1N3u
   0lkoCHRJ63ArUxZIB0zUAbwXJ9vuXPxRrum55x95VSunRwoQ/WtikuTA8
   ENz494hlepQSyIjzuhUfOPNHGfy3DaCgsPVwYdX5DnrswXvJldq8Ifa/1
   pPAFEuwsBcHXa4M+AGHf7lC15TRH998bGcc++xAAN0HgIfCZs/XhB55uU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241397539"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="241397539"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 18:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="488796548"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2022 18:49:23 -0800
From:   Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     x86@kernel.org, linux-doc@vger.kernel.org,
        Len Brown <len.brown@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Aubrey Li <aubrey.li@linux.intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Ricardo Neri <ricardo.neri@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] thermal: netlink: Add a new event to notify CPU capabilities change
Date:   Wed,  5 Jan 2022 18:50:58 -0800
Message-Id: <20220106025059.25847-7-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220106025059.25847-1-ricardo.neri-calderon@linux.intel.com>
References: <20220106025059.25847-1-ricardo.neri-calderon@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Add a new netlink event to notify change in CPU capabilities in terms of
performance and efficiency.

Firmware may change CPU capabilities as a result of thermal events in the
system or to account for changes in the TDP (thermal design power) level.

This notification type will allow user space to avoid running workloads
on certain CPUs or proactively adjust power limits to avoid future events.

The netlink message consists of a nested attribute
(THERMAL_GENL_ATTR_CPU_CAPABILITY) with three attributes:

 * THERMAL_GENL_ATTR_CPU_CAPABILITY_ID (type u32):
   -- logical CPU number
 * THERMAL_GENL_ATTR_CPU_CAPABILITY_PERFORMANCE (type u32):
   -- Scaled performance from 0-1023
 * THERMAL_GENL_ATTR_CPU_CAPABILITY_EFFICIENCY (type u32):
   -- Scaled efficiency from 0-1023

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Aubrey Li <aubrey.li@linux.intel.com>
Cc: Lukasz Luba <lukasz.luba@arm.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Reviewed-by: Len Brown <len.brown@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Changes since v2:
  * None

Changes since v1:
  * Reworded commit message.
  * Reworded the members of struct cpu_capacity for clarity. (Lukasz)
  * Defined the CPU capability attributes to be scaled in the [0, 1023]
    interval. (Lukasz)
---
 drivers/thermal/thermal_netlink.c | 55 +++++++++++++++++++++++++++++++
 drivers/thermal/thermal_netlink.h | 13 ++++++++
 include/uapi/linux/thermal.h      |  6 +++-
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_netlink.c b/drivers/thermal/thermal_netlink.c
index a16dd4d5d710..38e6c20f460c 100644
--- a/drivers/thermal/thermal_netlink.c
+++ b/drivers/thermal/thermal_netlink.c
@@ -43,6 +43,11 @@ static const struct nla_policy thermal_genl_policy[THERMAL_GENL_ATTR_MAX + 1] =
 	[THERMAL_GENL_ATTR_CDEV_MAX_STATE]	= { .type = NLA_U32 },
 	[THERMAL_GENL_ATTR_CDEV_NAME]		= { .type = NLA_STRING,
 						    .len = THERMAL_NAME_LENGTH },
+	/* CPU capabilities */
+	[THERMAL_GENL_ATTR_CPU_CAPABILITY]		= { .type = NLA_NESTED },
+	[THERMAL_GENL_ATTR_CPU_CAPABILITY_ID]		= { .type = NLA_U32 },
+	[THERMAL_GENL_ATTR_CPU_CAPABILITY_PERFORMANCE]	= { .type = NLA_U32 },
+	[THERMAL_GENL_ATTR_CPU_CAPABILITY_EFFICIENCY]	= { .type = NLA_U32 },
 };
 
 struct param {
@@ -58,6 +63,8 @@ struct param {
 	int temp;
 	int cdev_state;
 	int cdev_max_state;
+	struct cpu_capability *cpu_capabilities;
+	int cpu_capabilities_count;
 };
 
 typedef int (*cb_t)(struct param *);
@@ -190,6 +197,45 @@ static int thermal_genl_event_gov_change(struct param *p)
 	return 0;
 }
 
+static int thermal_genl_event_cpu_capability_change(struct param *p)
+{
+	struct cpu_capability *cpu_cap = p->cpu_capabilities;
+	struct sk_buff *msg = p->msg;
+	struct nlattr *start_cap;
+	int i, ret;
+
+	start_cap = nla_nest_start(msg, THERMAL_GENL_ATTR_CPU_CAPABILITY);
+	if (!start_cap)
+		return -EMSGSIZE;
+
+	for (i = 0; i < p->cpu_capabilities_count; ++i) {
+		if (nla_put_u32(msg, THERMAL_GENL_ATTR_CPU_CAPABILITY_ID,
+				cpu_cap->cpu)) {
+			ret = -EMSGSIZE;
+			goto out_cancel_nest;
+		}
+		if (nla_put_u32(msg, THERMAL_GENL_ATTR_CPU_CAPABILITY_PERFORMANCE,
+				cpu_cap->performance)) {
+			ret = -EMSGSIZE;
+			goto out_cancel_nest;
+		}
+		if (nla_put_u32(msg, THERMAL_GENL_ATTR_CPU_CAPABILITY_EFFICIENCY,
+				cpu_cap->efficiency)) {
+			ret = -EMSGSIZE;
+			goto out_cancel_nest;
+		}
+		++cpu_cap;
+	}
+
+	nla_nest_end(msg, start_cap);
+
+	return 0;
+out_cancel_nest:
+	nla_nest_cancel(msg, start_cap);
+
+	return ret;
+}
+
 int thermal_genl_event_tz_delete(struct param *p)
 	__attribute__((alias("thermal_genl_event_tz")));
 
@@ -219,6 +265,7 @@ static cb_t event_cb[] = {
 	[THERMAL_GENL_EVENT_CDEV_DELETE]	= thermal_genl_event_cdev_delete,
 	[THERMAL_GENL_EVENT_CDEV_STATE_UPDATE]	= thermal_genl_event_cdev_state_update,
 	[THERMAL_GENL_EVENT_TZ_GOV_CHANGE]	= thermal_genl_event_gov_change,
+	[THERMAL_GENL_EVENT_CPU_CAPABILITY_CHANGE] = thermal_genl_event_cpu_capability_change,
 };
 
 /*
@@ -356,6 +403,14 @@ int thermal_notify_tz_gov_change(int tz_id, const char *name)
 	return thermal_genl_send_event(THERMAL_GENL_EVENT_TZ_GOV_CHANGE, &p);
 }
 
+int thermal_genl_cpu_capability_event(int count, struct cpu_capability *caps)
+{
+	struct param p = { .cpu_capabilities_count = count, .cpu_capabilities = caps };
+
+	return thermal_genl_send_event(THERMAL_GENL_EVENT_CPU_CAPABILITY_CHANGE, &p);
+}
+EXPORT_SYMBOL_GPL(thermal_genl_cpu_capability_event);
+
 /*************************** Command encoding ********************************/
 
 static int __thermal_genl_cmd_tz_get_id(struct thermal_zone_device *tz,
diff --git a/drivers/thermal/thermal_netlink.h b/drivers/thermal/thermal_netlink.h
index e554f76291f4..44bc3dec5568 100644
--- a/drivers/thermal/thermal_netlink.h
+++ b/drivers/thermal/thermal_netlink.h
@@ -4,6 +4,12 @@
  *  Author: Daniel Lezcano <daniel.lezcano@linaro.org>
  */
 
+struct cpu_capability {
+	int cpu;
+	int performance;
+	int efficiency;
+};
+
 /* Netlink notification function */
 #ifdef CONFIG_THERMAL_NETLINK
 int __init thermal_netlink_init(void);
@@ -23,6 +29,7 @@ int thermal_notify_cdev_add(int cdev_id, const char *name, int max_state);
 int thermal_notify_cdev_delete(int cdev_id);
 int thermal_notify_tz_gov_change(int tz_id, const char *name);
 int thermal_genl_sampling_temp(int id, int temp);
+int thermal_genl_cpu_capability_event(int count, struct cpu_capability *caps);
 #else
 static inline int thermal_netlink_init(void)
 {
@@ -101,4 +108,10 @@ static inline int thermal_genl_sampling_temp(int id, int temp)
 {
 	return 0;
 }
+
+static inline int thermal_genl_cpu_capability_event(int count, struct cpu_capability *caps)
+{
+	return 0;
+}
+
 #endif /* CONFIG_THERMAL_NETLINK */
diff --git a/include/uapi/linux/thermal.h b/include/uapi/linux/thermal.h
index 9aa2fedfa309..fc78bf3aead7 100644
--- a/include/uapi/linux/thermal.h
+++ b/include/uapi/linux/thermal.h
@@ -44,7 +44,10 @@ enum thermal_genl_attr {
 	THERMAL_GENL_ATTR_CDEV_MAX_STATE,
 	THERMAL_GENL_ATTR_CDEV_NAME,
 	THERMAL_GENL_ATTR_GOV_NAME,
-
+	THERMAL_GENL_ATTR_CPU_CAPABILITY,
+	THERMAL_GENL_ATTR_CPU_CAPABILITY_ID,
+	THERMAL_GENL_ATTR_CPU_CAPABILITY_PERFORMANCE,
+	THERMAL_GENL_ATTR_CPU_CAPABILITY_EFFICIENCY,
 	__THERMAL_GENL_ATTR_MAX,
 };
 #define THERMAL_GENL_ATTR_MAX (__THERMAL_GENL_ATTR_MAX - 1)
@@ -71,6 +74,7 @@ enum thermal_genl_event {
 	THERMAL_GENL_EVENT_CDEV_DELETE,		/* Cdev unbound */
 	THERMAL_GENL_EVENT_CDEV_STATE_UPDATE,	/* Cdev state updated */
 	THERMAL_GENL_EVENT_TZ_GOV_CHANGE,	/* Governor policy changed  */
+	THERMAL_GENL_EVENT_CPU_CAPABILITY_CHANGE,	/* CPU capability changed */
 	__THERMAL_GENL_EVENT_MAX,
 };
 #define THERMAL_GENL_EVENT_MAX (__THERMAL_GENL_EVENT_MAX - 1)
-- 
2.17.1

