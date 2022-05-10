Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 395B4521F17
	for <lists+linux-doc@lfdr.de>; Tue, 10 May 2022 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346042AbiEJPkA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 May 2022 11:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245010AbiEJPjb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 May 2022 11:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D744595DE7
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652196878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=srqi0Ee1ZZuxdNeGN/f9EUwU1VnA69ygMTjuWM3KpxQ=;
        b=GCqlcYuTgDejNBIdUhgbc0nUgNBDjZyu7Za+pwUp5fBWn4H5Jyq3dsEkht74rQgeRSuAyw
        qtHwfgpr5/gdf25gjUGMTdaP7h+cRclyQfTR4K0P4Qt2JKEoMkU0Q4cLAvSUxqadDIXyop
        hCYliBc2H8FUQ7qKb9dfXytDJ7yKQxQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-oe9aRfOWNq6BGMYINyQJnw-1; Tue, 10 May 2022 11:34:35 -0400
X-MC-Unique: oe9aRfOWNq6BGMYINyQJnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4D302919EA3;
        Tue, 10 May 2022 15:34:34 +0000 (UTC)
Received: from llong.com (dhcp-17-215.bos.redhat.com [10.18.17.215])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 30E7A401E31;
        Tue, 10 May 2022 15:34:34 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v11 4/8] cgroup/cpuset: Relax constraints to partition & cpus changes
Date:   Tue, 10 May 2022 11:34:09 -0400
Message-Id: <20220510153413.400020-5-longman@redhat.com>
In-Reply-To: <20220510153413.400020-1-longman@redhat.com>
References: <20220510153413.400020-1-longman@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, enabling a partition root is only allowed if all the
constraints of a valid partition are satisfied. Even changes to
"cpuset.cpus" may not be allowed in some cases. Moreover, there are
limits to changes made to a parent cpuset if it is a valid partition
root. This is contrary to the general cgroup v2 philosophy.

This patch relaxes the constraints of changing the state of "cpuset.cpus"
and "cpuset.cpus.partition". Now all valid changes ("member" or "root")
to "cpuset.cpus.partition" are allowed even if there are child cpusets
underneath it.

Trying to make a cpuset a partition root, however, will cause its state
to become invalid if the following constraints of a valid partition
root are not satisfied.

 1) The "cpuset.cpus" is non-empty and exclusive.
 2) The parent cpuset is a valid partition root.
 3) The "cpuset.cpus" overlaps parent's "cpuset.cpus".

Similarly, almost all changes to "cpuset.cpus" are allowed with the
exception that if the underlying CS_CPU_EXCLUSIVE flag is set, the
exclusivity rule will still apply.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 407 +++++++++++++++++++++--------------------
 1 file changed, 213 insertions(+), 194 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 6c65bcf278cb..ed17b14b6c09 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1218,13 +1218,15 @@ enum subparts_cmd {
 	partcmd_update,		/* Update parent's subparts_cpus */
 };
 
+static int update_flag(cpuset_flagbits_t bit, struct cpuset *cs,
+		       int turning_on);
 /**
  * update_parent_subparts_cpumask - update subparts_cpus mask of parent cpuset
  * @cpuset:  The cpuset that requests change in partition root state
  * @cmd:     Partition root state change command
  * @newmask: Optional new cpumask for partcmd_update
  * @tmp:     Temporary addmask and delmask
- * Return:   0, 1 or an error code
+ * Return:   0 or -1 (error)
  *
  * For partcmd_enable, the cpuset is being transformed from a non-partition
  * root to a partition root. The cpus_allowed mask of the given cpuset will
@@ -1235,28 +1237,22 @@ enum subparts_cmd {
  * For partcmd_disable, the cpuset is being transformed from a partition
  * root back to a non-partition root. Any CPUs in cpus_allowed that are in
  * parent's subparts_cpus will be taken away from that cpumask and put back
- * into parent's effective_cpus. 0 should always be returned.
+ * into parent's effective_cpus. 0 will always be returned.
  *
- * For partcmd_update, if the optional newmask is specified, the cpu
- * list is to be changed from cpus_allowed to newmask. Otherwise,
- * cpus_allowed is assumed to remain the same. The cpuset should either
- * be a partition root or an invalid partition root. The partition root
- * state may change if newmask is NULL and none of the requested CPUs can
- * be granted by the parent. The function will return 1 if changes to
- * parent's subparts_cpus and effective_cpus happen or 0 otherwise.
- * Error code should only be returned when newmask is non-NULL.
+ * For partcmd_update, if the optional newmask is specified, the cpu list is
+ * to be changed from cpus_allowed to newmask. Otherwise, cpus_allowed is
+ * assumed to remain the same. The cpuset should either be a valid or invalid
+ * partition root. The partition root state may change from valid to invalid
+ * or vice versa. An error code will only be returned if transitioning from
+ * invalid to valid violates the exclusivity rule.
  *
  * The partcmd_enable and partcmd_disable commands are used by
- * update_prstate(). The partcmd_update command is used by
- * update_cpumasks_hier() with newmask NULL and update_cpumask() with
- * newmask set.
- *
- * The checking is more strict when enabling partition root than the
- * other two commands.
+ * update_prstate(). An error code may be returned and the caller will check
+ * for error.
  *
- * Because of the implicit cpu exclusive nature of a partition root,
- * cpumask changes that violates the cpu exclusivity rule will not be
- * permitted when checked by validate_change().
+ * The partcmd_update command is used by update_cpumasks_hier() with newmask
+ * NULL and update_cpumask() with newmask set. The callers won't check for
+ * error and so partition_root_state will be updated directly.
  */
 static int update_parent_subparts_cpumask(struct cpuset *cs, int cmd,
 					  struct cpumask *newmask,
@@ -1278,92 +1274,104 @@ static int update_parent_subparts_cpumask(struct cpuset *cs, int cmd,
 	if (!is_partition_valid(parent) ||
 	   (newmask && cpumask_empty(newmask)) ||
 	   (!newmask && cpumask_empty(cs->cpus_allowed)))
-		return -EINVAL;
-
-	/*
-	 * Enabling/disabling partition root is not allowed if there are
-	 * online children.
-	 */
-	if ((cmd != partcmd_update) && css_has_online_children(&cs->css))
-		return -EBUSY;
+		return -1;
 
 	adding = deleting = false;
 	old_prs = new_prs = cs->partition_root_state;
 	if (cmd == partcmd_enable) {
 		/*
-		 * Enabling partition root is not allowed if not all the CPUs
-		 * can be granted from parent's effective_cpus.
+		 * Enabling partition root is not allowed if cpus_allowed
+		 * doesn't overlap parent's cpus_allowed.
 		 */
-		if (!cpumask_subset(cs->cpus_allowed, parent->effective_cpus))
-			return -EINVAL;
+		if (!cpumask_intersects(cs->cpus_allowed, parent->cpus_allowed))
+			return -1;
 
 		/*
 		 * A parent can be left with no CPU as long as there is no
-		 * task directly associated with the parent partition. For
-		 * such a parent, no new task can be moved into it.
+		 * task directly associated with the parent partition.
 		 */
-		if (cpumask_equal(cs->cpus_allowed, parent->effective_cpus) &&
+		if (!cpumask_intersects(cs->cpus_allowed, parent->effective_cpus) &&
 		    partition_is_populated(parent, cs))
-			return -EINVAL;
+			return -1;
 
 		cpumask_copy(tmp->addmask, cs->cpus_allowed);
 		adding = true;
 	} else if (cmd == partcmd_disable) {
-		deleting = cpumask_and(tmp->delmask, cs->cpus_allowed,
+		/*
+		 * Need to remove cpus from parent's subparts_cpus for valid
+		 * partition root.
+		 */
+		deleting = !is_prs_invalid(old_prs) &&
+			   cpumask_and(tmp->delmask, cs->cpus_allowed,
 				       parent->subparts_cpus);
 	} else if (newmask) {
 		/*
 		 * partcmd_update with newmask:
 		 *
+		 * Compute add/delete mask to/from subparts_cpus
+		 *
 		 * delmask = cpus_allowed & ~newmask & parent->subparts_cpus
-		 * addmask = newmask & parent->effective_cpus
+		 * addmask = newmask & parent->cpus_allowed
 		 *		     & ~parent->subparts_cpus
 		 */
 		cpumask_andnot(tmp->delmask, cs->cpus_allowed, newmask);
 		deleting = cpumask_and(tmp->delmask, tmp->delmask,
 				       parent->subparts_cpus);
 
-		cpumask_and(tmp->addmask, newmask, parent->effective_cpus);
+		cpumask_and(tmp->addmask, newmask, parent->cpus_allowed);
 		adding = cpumask_andnot(tmp->addmask, tmp->addmask,
 					parent->subparts_cpus);
 		/*
-		 * Return error if the new effective_cpus could become empty
-		 * and there are tasks in the parent.
+		 * Make partition invalid if parent's effective_cpus could
+		 * become empty and there are tasks in the parent.
 		 */
 		if (adding &&
-		    cpumask_equal(parent->effective_cpus, tmp->addmask) &&
+		    cpumask_subset(parent->effective_cpus, tmp->addmask) &&
+		    !cpumask_intersects(tmp->delmask, cpu_active_mask) &&
 		    partition_is_populated(parent, cs)) {
-			if (!deleting)
-				return -EINVAL;
-			/*
-			 * As some of the CPUs in subparts_cpus might have
-			 * been offlined, we need to compute the real delmask
-			 * to confirm that.
-			 */
-			if (!cpumask_and(tmp->addmask, tmp->delmask,
-					 cpu_active_mask))
-				return -EINVAL;
-			cpumask_copy(tmp->addmask, parent->effective_cpus);
+			part_error = true;
+			adding = false;
+			deleting = cpumask_and(tmp->delmask, cs->cpus_allowed,
+					       parent->subparts_cpus);
 		}
 	} else {
 		/*
 		 * partcmd_update w/o newmask:
 		 *
-		 * addmask = cpus_allowed & parent->effective_cpus
+		 * delmask = cpus_allowed & parent->subparts_cpus
+		 * addmask = cpus_allowed & parent->cpus_allowed
+		 *			  & ~parent->subparts_cpus
 		 *
-		 * Note that parent's subparts_cpus may have been
-		 * pre-shrunk in case there is a change in the cpu list.
-		 * So no deletion is needed.
+		 * This gets invoked either due to a hotplug event or from
+		 * update_cpumasks_hier(). This can cause the state of a
+		 * partition root to transition from valid to invalid or vice
+		 * versa. So we still need to compute the addmask and delmask.
+
+		 * A partition error happens when:
+		 * 1) Cpuset is valid partition, but parent does not distribute
+		 *    out any CPUs.
+		 * 2) Parent has tasks and all its effective CPUs will have
+		 *    to be distributed out.
 		 */
-		adding = cpumask_and(tmp->addmask, cs->cpus_allowed,
-				     parent->effective_cpus);
-		part_error = cpumask_equal(tmp->addmask, parent->effective_cpus) &&
-			     partition_is_populated(parent, cs);
+		cpumask_and(tmp->addmask, cs->cpus_allowed,
+					  parent->cpus_allowed);
+		adding = cpumask_andnot(tmp->addmask, tmp->addmask,
+					parent->subparts_cpus);
+		if ((is_partition_valid(cs) && !parent->nr_subparts_cpus) ||
+		    (adding &&
+		     cpumask_subset(parent->effective_cpus, tmp->addmask) &&
+		     partition_is_populated(parent, cs))) {
+			part_error = true;
+			adding = false;
+		}
+
+		if (part_error && is_partition_valid(cs) &&
+		    parent->nr_subparts_cpus)
+			deleting = cpumask_and(tmp->delmask, cs->cpus_allowed,
+					       parent->subparts_cpus);
 	}
 
 	if (cmd == partcmd_update) {
-		int prev_prs = cs->partition_root_state;
-
 		/*
 		 * Check for possible transition between PRS_ROOT
 		 * and PRS_INVALID_ROOT.
@@ -1378,27 +1386,21 @@ static int update_parent_subparts_cpumask(struct cpuset *cs, int cmd,
 				new_prs = PRS_ROOT;
 			break;
 		}
-		/*
-		 * Set part_error if previously in invalid state.
-		 */
-		part_error = is_prs_invalid(prev_prs);
-	}
-
-	if (!part_error && is_prs_invalid(new_prs))
-		return 0;	/* Nothing need to be done */
-
-	if (is_prs_invalid(new_prs)) {
-		/*
-		 * Remove all its cpus from parent's subparts_cpus.
-		 */
-		adding = false;
-		deleting = cpumask_and(tmp->delmask, cs->cpus_allowed,
-				       parent->subparts_cpus);
 	}
 
 	if (!adding && !deleting && (new_prs == old_prs))
 		return 0;
 
+	/*
+	 * Transitioning from invalid to valid (partcmd_update) may require
+	 * setting CS_CPU_EXCLUSIVE.
+	 */
+	if ((old_prs != new_prs) && is_prs_invalid(old_prs)) {
+		if (!is_cpu_exclusive(cs) &&
+		    (update_flag(CS_CPU_EXCLUSIVE, cs, 1) < 0))
+			return -1;
+	}
+
 	/*
 	 * Change the parent's subparts_cpus.
 	 * Newly added CPUs will be removed from effective_cpus and
@@ -1428,15 +1430,20 @@ static int update_parent_subparts_cpumask(struct cpuset *cs, int cmd,
 		cs->partition_root_state = new_prs;
 
 	spin_unlock_irq(&callback_lock);
+
+	if (adding || deleting)
+		update_tasks_cpumask(parent);
+
 	notify_partition_change(cs, old_prs);
 
-	return cmd == partcmd_update;
+	return 0;
 }
 
 /*
  * update_cpumasks_hier - Update effective cpumasks and tasks in the subtree
  * @cs:  the cpuset to consider
  * @tmp: temp variables for calculating effective_cpus & partition setup
+ * @force: don't skip any descendant cpusets if set
  *
  * When configured cpumask is changed, the effective cpumasks of this cpuset
  * and all its descendants need to be updated.
@@ -1445,7 +1452,8 @@ static int update_parent_subparts_cpumask(struct cpuset *cs, int cmd,
  *
  * Called with cpuset_rwsem held
  */
-static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp)
+static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
+				 bool force)
 {
 	struct cpuset *cp;
 	struct cgroup_subsys_state *pos_css;
@@ -1455,6 +1463,7 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp)
 	rcu_read_lock();
 	cpuset_for_each_descendant_pre(cp, pos_css, cs) {
 		struct cpuset *parent = parent_cs(cp);
+		bool update_parent = false;
 
 		compute_effective_cpumask(tmp->new_cpus, cp, parent);
 
@@ -1482,9 +1491,9 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp)
 
 		/*
 		 * Skip the whole subtree if the cpumask remains the same
-		 * and has no partition root state.
+		 * and has no partition root state and force flag not set.
 		 */
-		if (!cp->partition_root_state &&
+		if (!cp->partition_root_state && !force &&
 		    cpumask_equal(tmp->new_cpus, cp->effective_cpus)) {
 			pos_css = css_rightmost_descendant(pos_css);
 			continue;
@@ -1500,33 +1509,15 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp)
 		old_prs = new_prs = cp->partition_root_state;
 		if ((cp != cs) && old_prs) {
 			switch (parent->partition_root_state) {
-			case PRS_MEMBER:
-				/*
-				 * If parent is not a partition root or an
-				 * invalid partition root, clear its state
-				 * and its CS_CPU_EXCLUSIVE flag.
-				 */
-				WARN_ON_ONCE(!is_partition_invalid(cp));
-				new_prs = PRS_MEMBER;
-
-				/*
-				 * clear_bit() is an atomic operation and
-				 * readers aren't interested in the state
-				 * of CS_CPU_EXCLUSIVE anyway. So we can
-				 * just update the flag without holding
-				 * the callback_lock.
-				 */
-				clear_bit(CS_CPU_EXCLUSIVE, &cp->flags);
-				break;
-
 			case PRS_ROOT:
-				if (update_parent_subparts_cpumask(cp, partcmd_update, NULL, tmp))
-					update_tasks_cpumask(parent);
+				update_parent = true;
 				break;
 
-			case PRS_INVALID_ROOT:
+			default:
 				/*
-				 * When parent is invalid, it has to be too.
+				 * When parent is not a partition root or is
+				 * invalid, child partition roots become
+				 * invalid too.
 				 */
 				new_prs = PRS_INVALID_ROOT;
 				break;
@@ -1537,41 +1528,43 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp)
 			continue;
 		rcu_read_unlock();
 
+		if (update_parent) {
+			update_parent_subparts_cpumask(cp, partcmd_update, NULL,
+						       tmp);
+			/*
+			 * The cpuset partition_root_state may become
+			 * invalid. Capture it.
+			 */
+			new_prs = cp->partition_root_state;
+		}
+
 		spin_lock_irq(&callback_lock);
 
-		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
 		if (cp->nr_subparts_cpus && !is_partition_valid(cp)) {
+			/*
+			 * Put all active subparts_cpus back to effective_cpus.
+			 */
+			cpumask_or(tmp->new_cpus, tmp->new_cpus,
+				   cp->subparts_cpus);
+			cpumask_and(tmp->new_cpus, tmp->new_cpus,
+				   cpu_active_mask);
 			cp->nr_subparts_cpus = 0;
 			cpumask_clear(cp->subparts_cpus);
-		} else if (cp->nr_subparts_cpus) {
+		}
+
+		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
+		if (cp->nr_subparts_cpus) {
 			/*
 			 * Make sure that effective_cpus & subparts_cpus
 			 * are mutually exclusive.
-			 *
-			 * In the unlikely event that effective_cpus
-			 * becomes empty. we clear cp->nr_subparts_cpus and
-			 * let its child partition roots to compete for
-			 * CPUs again.
 			 */
 			cpumask_andnot(cp->effective_cpus, cp->effective_cpus,
 				       cp->subparts_cpus);
-			if (cpumask_empty(cp->effective_cpus)) {
-				cpumask_copy(cp->effective_cpus, tmp->new_cpus);
-				cpumask_clear(cp->subparts_cpus);
-				cp->nr_subparts_cpus = 0;
-			} else if (!cpumask_subset(cp->subparts_cpus,
-						   tmp->new_cpus)) {
-				cpumask_andnot(cp->subparts_cpus,
-					cp->subparts_cpus, tmp->new_cpus);
-				cp->nr_subparts_cpus
-					= cpumask_weight(cp->subparts_cpus);
-			}
 		}
 
-		if (new_prs != old_prs)
-			cp->partition_root_state = new_prs;
-
+		cp->partition_root_state = new_prs;
 		spin_unlock_irq(&callback_lock);
+
 		notify_partition_change(cp, old_prs);
 
 		WARN_ON(!is_in_v2_mode() &&
@@ -1632,7 +1625,7 @@ static void update_sibling_cpumasks(struct cpuset *parent, struct cpuset *cs,
 			continue;
 
 		rcu_read_unlock();
-		update_cpumasks_hier(sibling, tmp);
+		update_cpumasks_hier(sibling, tmp, false);
 		rcu_read_lock();
 		css_put(&sibling->css);
 	}
@@ -1692,27 +1685,36 @@ static int update_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 #endif
 
 	if (cs->partition_root_state) {
-		/* Cpumask of a partition root cannot be empty */
-		if (cpumask_empty(trialcs->cpus_allowed))
-			return -EINVAL;
-		if (update_parent_subparts_cpumask(cs, partcmd_update,
-					trialcs->cpus_allowed, &tmp) < 0)
-			return -EINVAL;
+		update_parent_subparts_cpumask(cs, partcmd_update,
+					       trialcs->cpus_allowed, &tmp);
 	}
 
+	compute_effective_cpumask(trialcs->effective_cpus, trialcs,
+				  parent_cs(cs));
 	spin_lock_irq(&callback_lock);
 	cpumask_copy(cs->cpus_allowed, trialcs->cpus_allowed);
 
 	/*
-	 * Make sure that subparts_cpus is a subset of cpus_allowed.
+	 * Make sure that subparts_cpus, if not empty, is a subset of
+	 * cpus_allowed. Clear subparts_cpus if partition not valid or
+	 * empty effective cpus with tasks.
 	 */
 	if (cs->nr_subparts_cpus) {
-		cpumask_and(cs->subparts_cpus, cs->subparts_cpus, cs->cpus_allowed);
-		cs->nr_subparts_cpus = cpumask_weight(cs->subparts_cpus);
+		if (!is_partition_valid(cs) ||
+		   (cpumask_subset(trialcs->effective_cpus, cs->subparts_cpus) &&
+		    partition_is_populated(cs, NULL))) {
+			cs->nr_subparts_cpus = 0;
+			cpumask_clear(cs->subparts_cpus);
+		} else {
+			cpumask_and(cs->subparts_cpus, cs->subparts_cpus,
+				    cs->cpus_allowed);
+			cs->nr_subparts_cpus = cpumask_weight(cs->subparts_cpus);
+		}
 	}
 	spin_unlock_irq(&callback_lock);
 
-	update_cpumasks_hier(cs, &tmp);
+	/* effective_cpus will be updated here */
+	update_cpumasks_hier(cs, &tmp, false);
 
 	if (cs->partition_root_state) {
 		struct cpuset *parent = parent_cs(cs);
@@ -2098,7 +2100,7 @@ static int update_flag(cpuset_flagbits_t bit, struct cpuset *cs,
  */
 static int update_prstate(struct cpuset *cs, int new_prs)
 {
-	int err, old_prs = cs->partition_root_state;
+	int err = 0, old_prs = cs->partition_root_state;
 	struct cpuset *parent = parent_cs(cs);
 	struct tmpmasks tmpmask;
 
@@ -2106,24 +2108,25 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		return 0;
 
 	/*
-	 * Cannot force a partial or invalid partition root to a full
-	 * partition root.
+	 * For a previously invalid partition root, leave it at being
+	 * invalid if new_prs is not "member".
 	 */
 	if (new_prs && is_prs_invalid(old_prs))
-		return -EINVAL;
+		return 0;
 
 	if (alloc_cpumasks(NULL, &tmpmask))
 		return -ENOMEM;
 
-	err = -EINVAL;
 	if (!old_prs) {
 		/*
 		 * Turning on partition root requires setting the
 		 * CS_CPU_EXCLUSIVE bit implicitly as well and cpus_allowed
-		 * cannot be NULL.
+		 * cannot be empty.
 		 */
-		if (cpumask_empty(cs->cpus_allowed))
+		if (cpumask_empty(cs->cpus_allowed)) {
+			err = 1;
 			goto out;
+		}
 
 		err = update_flag(CS_CPU_EXCLUSIVE, cs, 1);
 		if (err)
@@ -2137,19 +2140,22 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		}
 	} else {
 		/*
-		 * Turning off partition root will clear the
-		 * CS_CPU_EXCLUSIVE bit.
+		 * Switching back to member is always allowed even if it
+		 * disables child partitions.
 		 */
-		if (is_prs_invalid(old_prs)) {
-			update_flag(CS_CPU_EXCLUSIVE, cs, 0);
-			err = 0;
-			goto out;
-		}
+		update_parent_subparts_cpumask(cs, partcmd_disable, NULL,
+					       &tmpmask);
 
-		err = update_parent_subparts_cpumask(cs, partcmd_disable,
-						     NULL, &tmpmask);
-		if (err)
-			goto out;
+		/*
+		 * If there are child partitions, they will all become invalid.
+		 */
+		if (unlikely(cs->nr_subparts_cpus)) {
+			spin_lock_irq(&callback_lock);
+			cs->nr_subparts_cpus = 0;
+			cpumask_clear(cs->subparts_cpus);
+			compute_effective_cpumask(cs->effective_cpus, cs, parent);
+			spin_unlock_irq(&callback_lock);
+		}
 
 		/* Turning off CS_CPU_EXCLUSIVE will not return error */
 		update_flag(CS_CPU_EXCLUSIVE, cs, 0);
@@ -2162,15 +2168,24 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 
 	rebuild_sched_domains_locked();
 out:
-	if (!err) {
-		spin_lock_irq(&callback_lock);
-		cs->partition_root_state = new_prs;
-		spin_unlock_irq(&callback_lock);
-		notify_partition_change(cs, old_prs);
-	}
+	/*
+	 * Make partition invalid if an error happen
+	 */
+	if (err)
+		new_prs = PRS_INVALID_ROOT;
+	spin_lock_irq(&callback_lock);
+	cs->partition_root_state = new_prs;
+	spin_unlock_irq(&callback_lock);
+	/*
+	 * Update child cpusets, if present.
+	 * Force update if switching back to member.
+	 */
+	if (!list_empty(&cs->css.children))
+		update_cpumasks_hier(cs, &tmpmask, !new_prs);
 
+	notify_partition_change(cs, old_prs);
 	free_cpumasks(NULL, &tmpmask);
-	return err;
+	return 0;
 }
 
 /*
@@ -3239,12 +3254,31 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 
 	/*
 	 * In the unlikely event that a partition root has empty
-	 * effective_cpus with tasks or its parent becomes invalid, we
-	 * have to transition it to the invalid state.
+	 * effective_cpus with tasks, we will have to invalidate child
+	 * partitions, if present, by setting nr_subparts_cpus to 0 to
+	 * reclaim their cpus.
 	 */
-	if (is_partition_valid(cs) &&
-	   ((cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)) ||
-	    is_partition_invalid(parent))) {
+	if (cs->nr_subparts_cpus && is_partition_valid(cs) &&
+	    cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)) {
+		spin_lock_irq(&callback_lock);
+		cs->nr_subparts_cpus = 0;
+		cpumask_clear(cs->subparts_cpus);
+		spin_unlock_irq(&callback_lock);
+		compute_effective_cpumask(&new_cpus, cs, parent);
+	}
+
+	/*
+	 * Force the partition to become invalid if either one of
+	 * the following conditions hold:
+	 * 1) empty effective cpus but not valid empty partition.
+	 * 2) parent is invalid or doesn't grant any cpus to child
+	 *    partitions.
+	 */
+	if (is_partition_valid(cs) && (!parent->nr_subparts_cpus ||
+	   (cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)))) {
+		int old_prs;
+
+		update_parent_subparts_cpumask(cs, partcmd_disable, NULL, tmp);
 		if (cs->nr_subparts_cpus) {
 			spin_lock_irq(&callback_lock);
 			cs->nr_subparts_cpus = 0;
@@ -3253,40 +3287,25 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 			compute_effective_cpumask(&new_cpus, cs, parent);
 		}
 
-		/*
-		 * Force the partition to become invalid if either one of
-		 * the following conditions hold:
-		 * 1) empty effective cpus but not valid empty partition.
-		 * 2) parent is invalid or doesn't grant any cpus to child
-		 *    partitions.
-		 */
-		if (is_partition_invalid(parent) ||
-		    (cpumask_empty(&new_cpus) &&
-		     partition_is_populated(cs, NULL))) {
-			int old_prs;
-
-			update_parent_subparts_cpumask(cs, partcmd_disable,
-						       NULL, tmp);
-			old_prs = cs->partition_root_state;
-			if (!is_prs_invalid(old_prs)) {
-				spin_lock_irq(&callback_lock);
-				set_partition_invalid(cs);
-				spin_unlock_irq(&callback_lock);
-				notify_partition_change(cs, old_prs);
-			}
+		old_prs = cs->partition_root_state;
+		if (is_partition_valid(cs)) {
+			spin_lock_irq(&callback_lock);
+			set_partition_invalid(cs);
+			spin_unlock_irq(&callback_lock);
+			notify_partition_change(cs, old_prs);
 		}
 		cpuset_force_rebuild();
 	}
 
 	/*
 	 * On the other hand, an invalid partition root may be transitioned
-	 * back to a regular one or a partition root with no CPU allocated
-	 * from the parent may change to invalid.
+	 * back to a regular one.
 	 */
-	if (is_partition_valid(parent) && (is_partition_invalid(cs) ||
-	    !cpumask_intersects(&new_cpus, parent->subparts_cpus)) &&
-	     update_parent_subparts_cpumask(cs, partcmd_update, NULL, tmp))
-		cpuset_force_rebuild();
+	else if (is_partition_valid(parent) && is_partition_invalid(cs)) {
+		update_parent_subparts_cpumask(cs, partcmd_update, NULL, tmp);
+		if (is_partition_valid(cs))
+			cpuset_force_rebuild();
+	}
 
 update_tasks:
 	cpus_updated = !cpumask_equal(&new_cpus, cs->effective_cpus);
-- 
2.27.0

