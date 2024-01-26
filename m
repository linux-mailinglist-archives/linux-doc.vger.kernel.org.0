Return-Path: <linux-doc+bounces-7629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C495183E5AC
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 23:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96541C249ED
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 22:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6518150A9F;
	Fri, 26 Jan 2024 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vp3p/Oz3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D645967;
	Fri, 26 Jan 2024 22:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308732; cv=none; b=QpRnKUd3Kpy8xiQNrVHyuBiAKabEIpxGKv7udB9FakZUmUwdLNNtZL2QUUYN2hpyKQ2NuI7RfydTmSkiadB2iDJO/Z/QWbBl/TxP/L9K1Xm8a3SqSpI9VMag8Y3aw4WbbrC4zf4QAXJt40wd8RK1iWXqImiKc53bInHZg7Rucz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308732; c=relaxed/simple;
	bh=aJLwZmVMTDiqbHOgXX5R6HittHryAm5B3XHDT3TSs5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoBVGRmmy7h5qDDbsB8wL931Kgu5LpWHvAmqQUv8LpuT28iy9Ofp5lJIudDjTKfPcSZUmS/3oEIbGlC8F6WLeyrJrFAToo7TvaYuAVMqZOUmc5kLKOdIRnCiUBDdUGw2xIp17/v0FIwEHNqsBEfq0LX6YGKalJnE5BOFcUKc+Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vp3p/Oz3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706308730; x=1737844730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aJLwZmVMTDiqbHOgXX5R6HittHryAm5B3XHDT3TSs5o=;
  b=Vp3p/Oz3fiWuSrEx4XefYQbwi6SRGGAm3msCCGRIZ+uOOSAx1K03d+t/
   uPaKCFLm2w4CtkdMHiODQty29jFq6qO2QHXZ++TfRfVHBEHsnBDX0AV59
   Sa0boENM74hXC3pvqgOAaGtuhOJskYBPkP66HF8+OUl1gUOrrYbjbUhZU
   4+2nw8pntTQFI8hn5DnzgBgLDEna65aF0+oCaGsC4gHb/pjFUjwPdYjrg
   e4ydIBvYCHo9Yh+6fDk4b3XfeyfKvv6qfoQnzXuFORs9TG//IUFCpzUCJ
   +TwelwPg/gRYgS5chZ2Df2i49gOaGniS2IzAoYVnBMo7L96zbqA2CkAgj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9707660"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9707660"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 14:38:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35560251"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 14:38:47 -0800
From: Tony Luck <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Peter Newman <peternewman@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v14 2/8] x86/resctrl: Prepare to split rdt_domain structure
Date: Fri, 26 Jan 2024 14:38:31 -0800
Message-ID: <20240126223837.21835-3-tony.luck@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126223837.21835-1-tony.luck@intel.com>
References: <20231204185357.120501-1-tony.luck@intel.com>
 <20240126223837.21835-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rdt_domain structure is used for both control and monitor features.
It is about to be split into separate structures for these two usages
because the scope for control and monitoring features for a resource
will be different for future resources.

To allow for common code that scans a list of domains looking for a
specific domain id, move all the common fields ("list", "id", "cpu_mask")
into their own structure within the rdt_domain structure.

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h                   | 16 ++++--
 arch/x86/kernel/cpu/resctrl/core.c        | 26 +++++-----
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 22 ++++-----
 arch/x86/kernel/cpu/resctrl/monitor.c     | 10 ++--
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 14 +++---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 60 +++++++++++------------
 6 files changed, 78 insertions(+), 70 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 7d4eb7df611d..c4067150a6b7 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -53,10 +53,20 @@ struct resctrl_staged_config {
 };
 
 /**
- * struct rdt_domain - group of CPUs sharing a resctrl resource
+ * struct rdt_domain_hdr - common header for different domain types
  * @list:		all instances of this resource
  * @id:			unique id for this instance
  * @cpu_mask:		which CPUs share this resource
+ */
+struct rdt_domain_hdr {
+	struct list_head		list;
+	int				id;
+	struct cpumask			cpu_mask;
+};
+
+/**
+ * struct rdt_domain - group of CPUs sharing a resctrl resource
+ * @hdr:		common header for different domain types
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
  * @mbm_total:		saved state for MBM total bandwidth
  * @mbm_local:		saved state for MBM local bandwidth
@@ -71,9 +81,7 @@ struct resctrl_staged_config {
  *			by closid
  */
 struct rdt_domain {
-	struct list_head		list;
-	int				id;
-	struct cpumask			cpu_mask;
+	struct rdt_domain_hdr		hdr;
 	unsigned long			*rmid_busy_llc;
 	struct mbm_state		*mbm_total;
 	struct mbm_state		*mbm_local;
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 268965c7c7ef..625f75899d7b 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -354,9 +354,9 @@ struct rdt_domain *get_domain_from_cpu(int cpu, struct rdt_resource *r)
 {
 	struct rdt_domain *d;
 
-	list_for_each_entry(d, &r->domains, list) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
 		/* Find the domain that contains this CPU */
-		if (cpumask_test_cpu(cpu, &d->cpu_mask))
+		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
 			return d;
 	}
 
@@ -400,12 +400,12 @@ struct rdt_domain *rdt_find_domain(struct rdt_resource *r, int id,
 	struct list_head *l;
 
 	list_for_each(l, &r->domains) {
-		d = list_entry(l, struct rdt_domain, list);
+		d = list_entry(l, struct rdt_domain, hdr.list);
 		/* When id is found, return its domain. */
-		if (id == d->id)
+		if (id == d->hdr.id)
 			return d;
 		/* Stop searching when finding id's position in sorted list. */
-		if (id < d->id)
+		if (id < d->hdr.id)
 			break;
 	}
 
@@ -528,7 +528,7 @@ static void domain_add_cpu(int cpu, struct rdt_resource *r)
 
 	d = rdt_find_domain(r, id, &add_pos);
 	if (d) {
-		cpumask_set_cpu(cpu, &d->cpu_mask);
+		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 		if (r->cache.arch_has_per_cpu_cfg)
 			rdt_domain_reconfigure_cdp(r);
 		return;
@@ -539,8 +539,8 @@ static void domain_add_cpu(int cpu, struct rdt_resource *r)
 		return;
 
 	d = &hw_dom->d_resctrl;
-	d->id = id;
-	cpumask_set_cpu(cpu, &d->cpu_mask);
+	d->hdr.id = id;
+	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
 	rdt_domain_reconfigure_cdp(r);
 
@@ -554,11 +554,11 @@ static void domain_add_cpu(int cpu, struct rdt_resource *r)
 		return;
 	}
 
-	list_add_tail(&d->list, add_pos);
+	list_add_tail(&d->hdr.list, add_pos);
 
 	err = resctrl_online_domain(r, d);
 	if (err) {
-		list_del(&d->list);
+		list_del(&d->hdr.list);
 		domain_free(hw_dom);
 	}
 }
@@ -582,10 +582,10 @@ static void domain_remove_cpu(int cpu, struct rdt_resource *r)
 	}
 	hw_dom = resctrl_to_arch_dom(d);
 
-	cpumask_clear_cpu(cpu, &d->cpu_mask);
-	if (cpumask_empty(&d->cpu_mask)) {
+	cpumask_clear_cpu(cpu, &d->hdr.cpu_mask);
+	if (cpumask_empty(&d->hdr.cpu_mask)) {
 		resctrl_offline_domain(r, d);
-		list_del(&d->list);
+		list_del(&d->hdr.list);
 
 		/*
 		 * rdt_domain "d" is going to be freed below, so clear
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 3f8891d57fac..23f8258d36a8 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -67,7 +67,7 @@ int parse_bw(struct rdt_parse_data *data, struct resctrl_schema *s,
 
 	cfg = &d->staged_config[s->conf_type];
 	if (cfg->have_new_ctrl) {
-		rdt_last_cmd_printf("Duplicate domain %d\n", d->id);
+		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
 		return -EINVAL;
 	}
 
@@ -146,7 +146,7 @@ int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
 
 	cfg = &d->staged_config[s->conf_type];
 	if (cfg->have_new_ctrl) {
-		rdt_last_cmd_printf("Duplicate domain %d\n", d->id);
+		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
 		return -EINVAL;
 	}
 
@@ -226,8 +226,8 @@ static int parse_line(char *line, struct resctrl_schema *s,
 		return -EINVAL;
 	}
 	dom = strim(dom);
-	list_for_each_entry(d, &r->domains, list) {
-		if (d->id == dom_id) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
 			data.buf = dom;
 			data.rdtgrp = rdtgrp;
 			if (r->parse_ctrlval(&data, s, d))
@@ -274,7 +274,7 @@ static bool apply_config(struct rdt_hw_domain *hw_dom,
 	struct rdt_domain *dom = &hw_dom->d_resctrl;
 
 	if (cfg->new_ctrl != hw_dom->ctrl_val[idx]) {
-		cpumask_set_cpu(cpumask_any(&dom->cpu_mask), cpu_mask);
+		cpumask_set_cpu(cpumask_any(&dom->hdr.cpu_mask), cpu_mask);
 		hw_dom->ctrl_val[idx] = cfg->new_ctrl;
 
 		return true;
@@ -291,7 +291,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_domain *d,
 	u32 idx = get_config_index(closid, t);
 	struct msr_param msr_param;
 
-	if (!cpumask_test_cpu(smp_processor_id(), &d->cpu_mask))
+	if (!cpumask_test_cpu(smp_processor_id(), &d->hdr.cpu_mask))
 		return -EINVAL;
 
 	hw_dom->ctrl_val[idx] = cfg_val;
@@ -318,7 +318,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 		return -ENOMEM;
 
 	msr_param.res = NULL;
-	list_for_each_entry(d, &r->domains, list) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
 		hw_dom = resctrl_to_arch_dom(d);
 		for (t = 0; t < CDP_NUM_TYPES; t++) {
 			cfg = &hw_dom->d_resctrl.staged_config[t];
@@ -466,7 +466,7 @@ static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int clo
 	u32 ctrl_val;
 
 	seq_printf(s, "%*s:", max_name_width, schema->name);
-	list_for_each_entry(dom, &r->domains, list) {
+	list_for_each_entry(dom, &r->domains, hdr.list) {
 		if (sep)
 			seq_puts(s, ";");
 
@@ -476,7 +476,7 @@ static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int clo
 			ctrl_val = resctrl_arch_get_config(r, dom, closid,
 							   schema->conf_type);
 
-		seq_printf(s, r->format_str, dom->id, max_data_width,
+		seq_printf(s, r->format_str, dom->hdr.id, max_data_width,
 			   ctrl_val);
 		sep = true;
 	}
@@ -505,7 +505,7 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
 			} else {
 				seq_printf(s, "%s:%d=%x\n",
 					   rdtgrp->plr->s->res->name,
-					   rdtgrp->plr->d->id,
+					   rdtgrp->plr->d->hdr.id,
 					   rdtgrp->plr->cbm);
 			}
 		} else {
@@ -536,7 +536,7 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
 	rr->val = 0;
 	rr->first = first;
 
-	smp_call_function_any(&d->cpu_mask, mon_event_count, rr, 1);
+	smp_call_function_any(&d->hdr.cpu_mask, mon_event_count, rr, 1);
 }
 
 int rdtgroup_mondata_show(struct seq_file *m, void *arg)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3a6c069614eb..310ab05f0cb7 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -238,7 +238,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain *d,
 	u64 msr_val, chunks;
 	int ret;
 
-	if (!cpumask_test_cpu(smp_processor_id(), &d->cpu_mask))
+	if (!cpumask_test_cpu(smp_processor_id(), &d->hdr.cpu_mask))
 		return -EINVAL;
 
 	ret = __rmid_read(rmid, eventid, &msr_val);
@@ -340,8 +340,8 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
 
 	entry->busy = 0;
 	cpu = get_cpu();
-	list_for_each_entry(d, &r->domains, list) {
-		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
+		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask)) {
 			err = resctrl_arch_rmid_read(r, d, entry->rmid,
 						     QOS_L3_OCCUP_EVENT_ID,
 						     &val);
@@ -639,7 +639,7 @@ void cqm_setup_limbo_handler(struct rdt_domain *dom, unsigned long delay_ms)
 	unsigned long delay = msecs_to_jiffies(delay_ms);
 	int cpu;
 
-	cpu = cpumask_any(&dom->cpu_mask);
+	cpu = cpumask_any(&dom->hdr.cpu_mask);
 	dom->cqm_work_cpu = cpu;
 
 	schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay);
@@ -686,7 +686,7 @@ void mbm_setup_overflow_handler(struct rdt_domain *dom, unsigned long delay_ms)
 
 	if (!static_branch_likely(&rdt_mon_enable_key))
 		return;
-	cpu = cpumask_any(&dom->cpu_mask);
+	cpu = cpumask_any(&dom->hdr.cpu_mask);
 	dom->mbm_work_cpu = cpu;
 	schedule_delayed_work_on(cpu, &dom->mbm_over, delay);
 }
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 2a682da9f43a..fcbd99e2eb66 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -221,7 +221,7 @@ static int pseudo_lock_cstates_constrain(struct pseudo_lock_region *plr)
 	int cpu;
 	int ret;
 
-	for_each_cpu(cpu, &plr->d->cpu_mask) {
+	for_each_cpu(cpu, &plr->d->hdr.cpu_mask) {
 		pm_req = kzalloc(sizeof(*pm_req), GFP_KERNEL);
 		if (!pm_req) {
 			rdt_last_cmd_puts("Failure to allocate memory for PM QoS\n");
@@ -301,7 +301,7 @@ static int pseudo_lock_region_init(struct pseudo_lock_region *plr)
 		return -ENODEV;
 
 	/* Pick the first cpu we find that is associated with the cache. */
-	plr->cpu = cpumask_first(&plr->d->cpu_mask);
+	plr->cpu = cpumask_first(&plr->d->hdr.cpu_mask);
 
 	if (!cpu_online(plr->cpu)) {
 		rdt_last_cmd_printf("CPU %u associated with cache not online\n",
@@ -856,10 +856,10 @@ bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_domain *d)
 	 * associated with them.
 	 */
 	for_each_alloc_capable_rdt_resource(r) {
-		list_for_each_entry(d_i, &r->domains, list) {
+		list_for_each_entry(d_i, &r->domains, hdr.list) {
 			if (d_i->plr)
 				cpumask_or(cpu_with_psl, cpu_with_psl,
-					   &d_i->cpu_mask);
+					   &d_i->hdr.cpu_mask);
 		}
 	}
 
@@ -867,7 +867,7 @@ bool rdtgroup_pseudo_locked_in_hierarchy(struct rdt_domain *d)
 	 * Next test if new pseudo-locked region would intersect with
 	 * existing region.
 	 */
-	if (cpumask_intersects(&d->cpu_mask, cpu_with_psl))
+	if (cpumask_intersects(&d->hdr.cpu_mask, cpu_with_psl))
 		ret = true;
 
 	free_cpumask_var(cpu_with_psl);
@@ -1199,7 +1199,7 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 	}
 
 	plr->thread_done = 0;
-	cpu = cpumask_first(&plr->d->cpu_mask);
+	cpu = cpumask_first(&plr->d->hdr.cpu_mask);
 	if (!cpu_online(cpu)) {
 		ret = -ENODEV;
 		goto out;
@@ -1529,7 +1529,7 @@ static int pseudo_lock_dev_mmap(struct file *filp, struct vm_area_struct *vma)
 	 * may be scheduled elsewhere and invalidate entries in the
 	 * pseudo-locked region.
 	 */
-	if (!cpumask_subset(current->cpus_ptr, &plr->d->cpu_mask)) {
+	if (!cpumask_subset(current->cpus_ptr, &plr->d->hdr.cpu_mask)) {
 		mutex_unlock(&rdtgroup_mutex);
 		return -EINVAL;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 1a9b2cd99b5f..a459c16735f7 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -91,7 +91,7 @@ void rdt_staged_configs_clear(void)
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	for_each_alloc_capable_rdt_resource(r) {
-		list_for_each_entry(dom, &r->domains, list)
+		list_for_each_entry(dom, &r->domains, hdr.list)
 			memset(dom->staged_config, 0, sizeof(dom->staged_config));
 	}
 }
@@ -295,7 +295,7 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 				rdt_last_cmd_puts("Cache domain offline\n");
 				ret = -ENODEV;
 			} else {
-				mask = &rdtgrp->plr->d->cpu_mask;
+				mask = &rdtgrp->plr->d->hdr.cpu_mask;
 				seq_printf(s, is_cpu_list(of) ?
 					   "%*pbl\n" : "%*pb\n",
 					   cpumask_pr_args(mask));
@@ -984,12 +984,12 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 
 	mutex_lock(&rdtgroup_mutex);
 	hw_shareable = r->cache.shareable_bits;
-	list_for_each_entry(dom, &r->domains, list) {
+	list_for_each_entry(dom, &r->domains, hdr.list) {
 		if (sep)
 			seq_putc(seq, ';');
 		sw_shareable = 0;
 		exclusive = 0;
-		seq_printf(seq, "%d=", dom->id);
+		seq_printf(seq, "%d=", dom->hdr.id);
 		for (i = 0; i < closids_supported(); i++) {
 			if (!closid_allocated(i))
 				continue;
@@ -1302,7 +1302,7 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)
 			continue;
 		has_cache = true;
-		list_for_each_entry(d, &r->domains, list) {
+		list_for_each_entry(d, &r->domains, hdr.list) {
 			ctrl = resctrl_arch_get_config(r, d, closid,
 						       s->conf_type);
 			if (rdtgroup_cbm_overlaps(s, d, ctrl, closid, false)) {
@@ -1417,7 +1417,7 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r,
 		return size;
 
 	num_b = bitmap_weight(&cbm, r->cache.cbm_len);
-	ci = get_cpu_cacheinfo(cpumask_any(&d->cpu_mask));
+	ci = get_cpu_cacheinfo(cpumask_any(&d->hdr.cpu_mask));
 	for (i = 0; i < ci->num_leaves; i++) {
 		if (ci->info_list[i].level == r->scope) {
 			size = ci->info_list[i].size / r->cache.cbm_len * num_b;
@@ -1465,7 +1465,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 			size = rdtgroup_cbm_to_size(rdtgrp->plr->s->res,
 						    rdtgrp->plr->d,
 						    rdtgrp->plr->cbm);
-			seq_printf(s, "%d=%u\n", rdtgrp->plr->d->id, size);
+			seq_printf(s, "%d=%u\n", rdtgrp->plr->d->hdr.id, size);
 		}
 		goto out;
 	}
@@ -1477,7 +1477,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 		type = schema->conf_type;
 		sep = false;
 		seq_printf(s, "%*s:", max_name_width, schema->name);
-		list_for_each_entry(d, &r->domains, list) {
+		list_for_each_entry(d, &r->domains, hdr.list) {
 			if (sep)
 				seq_putc(s, ';');
 			if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
@@ -1495,7 +1495,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 				else
 					size = rdtgroup_cbm_to_size(r, d, ctrl);
 			}
-			seq_printf(s, "%d=%u", d->id, size);
+			seq_printf(s, "%d=%u", d->hdr.id, size);
 			sep = true;
 		}
 		seq_putc(s, '\n');
@@ -1555,7 +1555,7 @@ static void mon_event_config_read(void *info)
 
 static void mondata_config_read(struct rdt_domain *d, struct mon_config_info *mon_info)
 {
-	smp_call_function_any(&d->cpu_mask, mon_event_config_read, mon_info, 1);
+	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_read, mon_info, 1);
 }
 
 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
@@ -1566,7 +1566,7 @@ static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid
 
 	mutex_lock(&rdtgroup_mutex);
 
-	list_for_each_entry(dom, &r->domains, list) {
+	list_for_each_entry(dom, &r->domains, hdr.list) {
 		if (sep)
 			seq_puts(s, ";");
 
@@ -1574,7 +1574,7 @@ static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid
 		mon_info.evtid = evtid;
 		mondata_config_read(dom, &mon_info);
 
-		seq_printf(s, "%d=0x%02x", dom->id, mon_info.mon_config);
+		seq_printf(s, "%d=0x%02x", dom->hdr.id, mon_info.mon_config);
 		sep = true;
 	}
 	seq_puts(s, "\n");
@@ -1639,7 +1639,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
-	smp_call_function_any(&d->cpu_mask, mon_event_config_write,
+	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_write,
 			      &mon_info, 1);
 
 	/*
@@ -1686,8 +1686,8 @@ static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)
 		return -EINVAL;
 	}
 
-	list_for_each_entry(d, &r->domains, list) {
-		if (d->id == dom_id) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
 			mbm_config_write_domain(r, d, evtid, val);
 			goto next;
 		}
@@ -2227,14 +2227,14 @@ static int set_cache_qos_cfg(int level, bool enable)
 		return -ENOMEM;
 
 	r_l = &rdt_resources_all[level].r_resctrl;
-	list_for_each_entry(d, &r_l->domains, list) {
+	list_for_each_entry(d, &r_l->domains, hdr.list) {
 		if (r_l->cache.arch_has_per_cpu_cfg)
 			/* Pick all the CPUs in the domain instance */
-			for_each_cpu(cpu, &d->cpu_mask)
+			for_each_cpu(cpu, &d->hdr.cpu_mask)
 				cpumask_set_cpu(cpu, cpu_mask);
 		else
 			/* Pick one CPU from each domain instance to update MSR */
-			cpumask_set_cpu(cpumask_any(&d->cpu_mask), cpu_mask);
+			cpumask_set_cpu(cpumask_any(&d->hdr.cpu_mask), cpu_mask);
 	}
 
 	/* Update QOS_CFG MSR on all the CPUs in cpu_mask */
@@ -2263,7 +2263,7 @@ void rdt_domain_reconfigure_cdp(struct rdt_resource *r)
 static int mba_sc_domain_allocate(struct rdt_resource *r, struct rdt_domain *d)
 {
 	u32 num_closid = resctrl_arch_get_num_closid(r);
-	int cpu = cpumask_any(&d->cpu_mask);
+	int cpu = cpumask_any(&d->hdr.cpu_mask);
 	int i;
 
 	d->mbps_val = kcalloc_node(num_closid, sizeof(*d->mbps_val),
@@ -2312,7 +2312,7 @@ static int set_mba_sc(bool mba_sc)
 
 	r->membw.mba_sc = mba_sc;
 
-	list_for_each_entry(d, &r->domains, list) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
 		for (i = 0; i < num_closid; i++)
 			d->mbps_val[i] = MBA_MAX_MBPS;
 	}
@@ -2648,7 +2648,7 @@ static int rdt_get_tree(struct fs_context *fc)
 
 	if (is_mbm_enabled()) {
 		r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
-		list_for_each_entry(dom, &r->domains, list)
+		list_for_each_entry(dom, &r->domains, hdr.list)
 			mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL);
 	}
 
@@ -2775,9 +2775,9 @@ static int reset_all_ctrls(struct rdt_resource *r)
 	 * CBMs in all domains to the maximum mask value. Pick one CPU
 	 * from each domain to update the MSRs below.
 	 */
-	list_for_each_entry(d, &r->domains, list) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
 		hw_dom = resctrl_to_arch_dom(d);
-		cpumask_set_cpu(cpumask_any(&d->cpu_mask), cpu_mask);
+		cpumask_set_cpu(cpumask_any(&d->hdr.cpu_mask), cpu_mask);
 
 		for (i = 0; i < hw_res->num_closid; i++)
 			hw_dom->ctrl_val[i] = r->default_ctrl;
@@ -2981,7 +2981,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	char name[32];
 	int ret;
 
-	sprintf(name, "mon_%s_%02d", r->name, d->id);
+	sprintf(name, "mon_%s_%02d", r->name, d->hdr.id);
 	/* create the directory */
 	kn = kernfs_create_dir(parent_kn, name, parent_kn->mode, prgrp);
 	if (IS_ERR(kn))
@@ -2997,7 +2997,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	}
 
 	priv.u.rid = r->rid;
-	priv.u.domid = d->id;
+	priv.u.domid = d->hdr.id;
 	list_for_each_entry(mevt, &r->evt_list, list) {
 		priv.u.evtid = mevt->evtid;
 		ret = mon_addfile(kn, mevt->name, priv.priv);
@@ -3045,7 +3045,7 @@ static int mkdir_mondata_subdir_alldom(struct kernfs_node *parent_kn,
 	struct rdt_domain *dom;
 	int ret;
 
-	list_for_each_entry(dom, &r->domains, list) {
+	list_for_each_entry(dom, &r->domains, hdr.list) {
 		ret = mkdir_mondata_subdir(parent_kn, dom, r, prgrp);
 		if (ret)
 			return ret;
@@ -3204,7 +3204,7 @@ static int __init_one_rdt_domain(struct rdt_domain *d, struct resctrl_schema *s,
 	 */
 	tmp_cbm = cfg->new_ctrl;
 	if (bitmap_weight(&tmp_cbm, r->cache.cbm_len) < r->cache.min_cbm_bits) {
-		rdt_last_cmd_printf("No space on %s:%d\n", s->name, d->id);
+		rdt_last_cmd_printf("No space on %s:%d\n", s->name, d->hdr.id);
 		return -ENOSPC;
 	}
 	cfg->have_new_ctrl = true;
@@ -3227,7 +3227,7 @@ static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid)
 	struct rdt_domain *d;
 	int ret;
 
-	list_for_each_entry(d, &s->res->domains, list) {
+	list_for_each_entry(d, &s->res->domains, hdr.list) {
 		ret = __init_one_rdt_domain(d, s, closid);
 		if (ret < 0)
 			return ret;
@@ -3242,7 +3242,7 @@ static void rdtgroup_init_mba(struct rdt_resource *r, u32 closid)
 	struct resctrl_staged_config *cfg;
 	struct rdt_domain *d;
 
-	list_for_each_entry(d, &r->domains, list) {
+	list_for_each_entry(d, &r->domains, hdr.list) {
 		if (is_mba_sc(r)) {
 			d->mbps_val[closid] = MBA_MAX_MBPS;
 			continue;
@@ -3859,7 +3859,7 @@ void resctrl_offline_domain(struct rdt_resource *r, struct rdt_domain *d)
 	 * per domain monitor data directories.
 	 */
 	if (static_branch_unlikely(&rdt_mon_enable_key))
-		rmdir_mondata_subdir_allrdtgrp(r, d->id);
+		rmdir_mondata_subdir_allrdtgrp(r, d->hdr.id);
 
 	if (is_mbm_enabled())
 		cancel_delayed_work(&d->mbm_over);
-- 
2.43.0


