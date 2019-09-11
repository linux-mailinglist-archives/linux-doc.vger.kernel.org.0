Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF49AFE2E
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2019 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfIKN5q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Sep 2019 09:57:46 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:35354 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725981AbfIKN5p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Sep 2019 09:57:45 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8BDtwkw031522;
        Wed, 11 Sep 2019 15:57:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LIPK+mmht7E3Mdg8xZ7l7TYgMgc8zT91Yzpj/CithUk=;
 b=sk4pwqlrLpyl+38JV1bjZthuj4I8wuM+xdwesG37RTHsBTbyLWDsnSnltU9E/3DzZlBs
 47HF0avQv8Xb/cBqAF85UtRiQrMZ6z8OckwOpROanbu0J8FOIzeUvH4OK0MANtj/x6Eo
 DqqcFUWwW5piPtu+W3USZ1jAGawTIkD2O2lIAs+8znqcCbLwnlyjggytGO2bz4uRqFN3
 ZnzidwhM4LBDy62UdB5Mpuq8djCvzaouQB05vTwoTobuMCpVExWf7mwlNSH4pztHeWeC
 9+ebsV8Rv2PhYEqAgeEBljEu4hIPNrlla+0KOMtyJfmE8idHWxOWNvd+FOxm/pT+8fvJ IA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx07-00178001.pphosted.com with ESMTP id 2uv212ud60-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 11 Sep 2019 15:57:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 622B624;
        Wed, 11 Sep 2019 13:57:30 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7C7A2C7F50;
        Wed, 11 Sep 2019 15:57:29 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 11 Sep
 2019 15:57:29 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 11 Sep 2019 15:57:26
 +0200
From:   Fabien Dessenne <fabien.dessenne@st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Suman Anna <s-anna@ti.com>, Jonathan Corbet <corbet@lwn.net>,
        <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3] hwspinlock: allow sharing of hwspinlocks
Date:   Wed, 11 Sep 2019 15:57:07 +0200
Message-ID: <1568210227-32135-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_08:2019-09-11,2019-09-11 signatures=0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Allow several clients to request (hwspin_lock_request_specific()) the
same lock.
In addition to that, protect a given lock from being locked
(hwspin_trylock{_...}()) by more that one client at a time.

Since the RAW and IN_ATOMIC modes do not implement that protection
(unlike the default, IRQ and IRQSTATE modes that make use of
spin_lock{_irq, _irqsave}), protect __hwspin_trylock with the atomic
bitop test_and_set_bit().
This bitop is atomic (SMP-safe), does not disable neither preemption
nor interrupts, hence it preserves the RAW and IN_ATOMIC modes
constraints.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
Changes since v2:
- Drop the DeviceTree-based implementation.
- Do not let the choice between exclusive and shared usage : locks are
  always shared.
- Add a protection (atomic bitop) working in any modes to allow safe
  sharing between clients.

Changes since v1:
- Removed useless 'status = "okay"' from stm32mp157c.dtsi
---
 Documentation/hwspinlock.txt             |  9 ++-
 drivers/hwspinlock/hwspinlock_core.c     | 98 +++++++++++++++++++++++---------
 drivers/hwspinlock/hwspinlock_internal.h |  4 ++
 3 files changed, 81 insertions(+), 30 deletions(-)

diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.txt
index 6f03713..5f6f660 100644
--- a/Documentation/hwspinlock.txt
+++ b/Documentation/hwspinlock.txt
@@ -53,9 +53,8 @@ Should be called from a process context (might sleep).
 
   struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 
-Assign a specific hwspinlock id and return its address, or NULL
-if that hwspinlock is already in use. Usually board code will
-be calling this function in order to reserve specific hwspinlock
+Assign a specific hwspinlock id and return its address. Usually board
+code will be calling this function in order to reserve specific hwspinlock
 ids for predefined purposes.
 
 Should be called from a process context (might sleep).
@@ -449,11 +448,15 @@ of which represents a single hardware lock::
 	* struct hwspinlock - this struct represents a single hwspinlock instance
 	* @bank: the hwspinlock_device structure which owns this lock
 	* @lock: initialized and used by hwspinlock core
+	* @is_locked: whether this lock is currently locked
+	* @reqcount: number of users having requested this lock
 	* @priv: private data, owned by the underlying platform-specific hwspinlock drv
 	*/
 	struct hwspinlock {
 		struct hwspinlock_device *bank;
 		spinlock_t lock;
+		unsigned long is_locked;
+		unsigned int reqcount;
 		void *priv;
 	};
 
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 8862445..e9d3de10 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -29,6 +29,7 @@
 
 /* radix tree tags */
 #define HWSPINLOCK_UNUSED	(0) /* tags an hwspinlock as unused */
+#define HWSPINLOCK_DYN_ASSIGN	(1) /* dynamically assigned hwspinlock */
 
 /*
  * A radix tree is used to maintain the available hwspinlock instances.
@@ -96,14 +97,25 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 	BUG_ON(!flags && mode == HWLOCK_IRQSTATE);
 
 	/*
+	 * Check if the lock is already taken by another context on the local
+	 * cpu.
+	 * Calling atomic test_and_set_bit_lock() ensures that hwspinlock is
+	 * SMP-safe (so we can take it from additional contexts on the local
+	 * host) in any mode, even those where we do not make use of the local
+	 * spinlock.
+	 */
+
+	if (test_and_set_bit_lock(0, &hwlock->is_locked))
+		return -EBUSY;
+
+	/*
 	 * This spin_lock{_irq, _irqsave} serves three purposes:
 	 *
 	 * 1. Disable preemption, in order to minimize the period of time
 	 *    in which the hwspinlock is taken. This is important in order
 	 *    to minimize the possible polling on the hardware interconnect
 	 *    by a remote user of this lock.
-	 * 2. Make the hwspinlock SMP-safe (so we can take it from
-	 *    additional contexts on the local host).
+	 * 2. Make the hwspinlock SMP-safe.
 	 * 3. Ensure that in_atomic/might_sleep checks catch potential
 	 *    problems with hwspinlock usage (e.g. scheduler checks like
 	 *    'scheduling while atomic' etc.)
@@ -124,9 +136,9 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 		break;
 	}
 
-	/* is lock already taken by another context on the local cpu ? */
+	/* sanity check (this shouldn't happen) */
 	if (!ret)
-		return -EBUSY;
+		goto clear;
 
 	/* try to take the hwspinlock device */
 	ret = hwlock->bank->ops->trylock(hwlock);
@@ -149,7 +161,7 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 			break;
 		}
 
-		return -EBUSY;
+		goto clear;
 	}
 
 	/*
@@ -165,6 +177,11 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 	mb();
 
 	return 0;
+
+clear:
+	/* Clear is_locked */
+	clear_bit_unlock(0, &hwlock->is_locked);
+	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(__hwspin_trylock);
 
@@ -299,6 +316,9 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 		spin_unlock(&hwlock->lock);
 		break;
 	}
+
+	/* Clear is_locked set while locking */
+	clear_bit_unlock(0, &hwlock->is_locked);
 }
 EXPORT_SYMBOL_GPL(__hwspin_unlock);
 
@@ -504,7 +524,9 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		hwlock = &bank->lock[i];
 
 		spin_lock_init(&hwlock->lock);
+		clear_bit(0, &hwlock->is_locked);
 		hwlock->bank = bank;
+		hwlock->reqcount = 0;
 
 		ret = hwspin_lock_register_single(hwlock, base_id + i);
 		if (ret)
@@ -664,12 +686,16 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 		return ret;
 	}
 
-	/* mark hwspinlock as used, should not fail */
-	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	/* update reqcount */
+	if (!hwlock->reqcount++) {
+		/* first request, mark hwspinlock as used, should not fail */
+		tmp = radix_tree_tag_clear(&hwspinlock_tree,
+					   hwlock_to_id(hwlock),
+					   HWSPINLOCK_UNUSED);
 
-	/* self-sanity check that should never fail */
-	WARN_ON(tmp != hwlock);
+		/* self-sanity check that should never fail */
+		WARN_ON(tmp != hwlock);
+	}
 
 	return ret;
 }
@@ -706,7 +732,7 @@ EXPORT_SYMBOL_GPL(hwspin_lock_get_id);
  */
 struct hwspinlock *hwspin_lock_request(void)
 {
-	struct hwspinlock *hwlock;
+	struct hwspinlock *hwlock, *tmp;
 	int ret;
 
 	mutex_lock(&hwspinlock_tree_lock);
@@ -728,6 +754,13 @@ struct hwspinlock *hwspin_lock_request(void)
 	if (ret < 0)
 		hwlock = NULL;
 
+	/* mark this hwspinlock as dynamically assigned */
+	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
+				 HWSPINLOCK_DYN_ASSIGN);
+
+	/* self-sanity check which should never fail */
+	WARN_ON(tmp != hwlock);
+
 out:
 	mutex_unlock(&hwspinlock_tree_lock);
 	return hwlock;
@@ -764,18 +797,19 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
-	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
-		pr_warn("hwspinlock %u is already in use\n", id);
+	/* mark as used and power up */
+	ret = __hwspin_lock_request(hwlock);
+	if (ret < 0) {
 		hwlock = NULL;
 		goto out;
 	}
 
-	/* mark as used and power up */
-	ret = __hwspin_lock_request(hwlock);
-	if (ret < 0)
-		hwlock = NULL;
+	/*
+	 * warn if this lock is also used by another client which got this lock
+	 * with dynamic assignment using the hwspin_lock_request() API
+	 */
+	if (radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_DYN_ASSIGN))
+		pr_warn("hwspinlock %u is shared with a 'dynamic' user\n", id);
 
 out:
 	mutex_unlock(&hwspinlock_tree_lock);
@@ -799,7 +833,7 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 {
 	struct device *dev;
 	struct hwspinlock *tmp;
-	int ret;
+	int ret, id;
 
 	if (!hwlock) {
 		pr_err("invalid hwlock\n");
@@ -810,30 +844,40 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	mutex_lock(&hwspinlock_tree_lock);
 
 	/* make sure the hwspinlock is used */
-	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	id = hwlock_to_id(hwlock);
+	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
 	if (ret == 1) {
 		dev_err(dev, "%s: hwlock is already free\n", __func__);
 		dump_stack();
 		ret = -EINVAL;
-		goto out;
+		goto out_unlock;
 	}
 
 	/* notify the underlying device that power is not needed */
 	ret = pm_runtime_put(dev);
 	if (ret < 0)
-		goto out;
+		goto out_unlock;
+
+	/* update reqcount */
+	if (--hwlock->reqcount)
+		goto out_put;
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	tmp = radix_tree_tag_set(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
 
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(tmp != hwlock);
 
+	/* clear the dynamically assigned tag */
+	tmp = radix_tree_tag_clear(&hwspinlock_tree, id, HWSPINLOCK_DYN_ASSIGN);
+
+	/* self-sanity check which should never fail */
+	WARN_ON(tmp != hwlock);
+
+out_put:
 	module_put(dev->driver->owner);
 
-out:
+out_unlock:
 	mutex_unlock(&hwspinlock_tree_lock);
 	return ret;
 }
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 9eb6bd0..a3aae55 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -35,11 +35,15 @@ struct hwspinlock_ops {
  * struct hwspinlock - this struct represents a single hwspinlock instance
  * @bank: the hwspinlock_device structure which owns this lock
  * @lock: initialized and used by hwspinlock core
+ * @is_locked: whether this lock is currently locked
+ * @reqcount: number of users having requested this lock
  * @priv: private data, owned by the underlying platform-specific hwspinlock drv
  */
 struct hwspinlock {
 	struct hwspinlock_device *bank;
 	spinlock_t lock;
+	unsigned long is_locked;
+	unsigned int reqcount;
 	void *priv;
 };
 
-- 
2.7.4

