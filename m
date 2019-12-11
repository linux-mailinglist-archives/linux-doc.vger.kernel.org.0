Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91EAD11B850
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2019 17:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbfLKQQL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Dec 2019 11:16:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26724 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729296AbfLKQQL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 11:16:11 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBBGG9GV117827
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 11:16:09 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wtfbxm5k4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 11:15:54 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Wed, 11 Dec 2019 16:09:35 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 11 Dec 2019 16:09:33 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xBBG9VX654526068
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Dec 2019 16:09:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 75CE8A4068;
        Wed, 11 Dec 2019 16:09:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5010AA405B;
        Wed, 11 Dec 2019 16:09:29 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 11 Dec 2019 16:09:29 +0000 (GMT)
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
To:     mpe@ellerman.id.au
Cc:     mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH v6 4/6] powerpc/powernv: move core and fadump_release_opalcore under new kobject
Date:   Wed, 11 Dec 2019 21:39:08 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121116-0016-0000-0000-000002D3DF98
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-0017-0000-0000-00003335FFA8
Message-Id: <20191211160910.21656-5-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912110137
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The /sys/firmware/opal/core and /sys/kernel/fadump_release_opalcore sysfs
files are used to export and release the OPAL memory on PowerNV platform.
let's organize them into a new kobject under /sys/firmware/opal/mpipl/
directory.

A symlink is added to maintain the backward compatibility for
/sys/firmware/opal/core sysfs file.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../sysfs-kernel-fadump_release_opalcore      |  2 +
 .../powerpc/firmware-assisted-dump.rst        | 15 +++--
 arch/powerpc/platforms/powernv/opal-core.c    | 55 ++++++++++++++-----
 3 files changed, 51 insertions(+), 21 deletions(-)
 rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (82%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
similarity index 82%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
index 53313c1d4e7a..a8d46cd0f4e6 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
+++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
@@ -1,3 +1,5 @@
+This ABI is moved to /sys/firmware/opal/mpipl/release_core.
+
 What:		/sys/kernel/fadump_release_opalcore
 Date:		Sep 2019
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 0455a78486d5..345a3405206e 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -112,13 +112,13 @@ to ensure that crash data is preserved to process later.
 
 -- On OPAL based machines (PowerNV), if the kernel is build with
    CONFIG_OPAL_CORE=y, OPAL memory at the time of crash is also
-   exported as /sys/firmware/opal/core file. This procfs file is
+   exported as /sys/firmware/opal/mpipl/core file. This procfs file is
    helpful in debugging OPAL crashes with GDB. The kernel memory
    used for exporting this procfs file can be released by echo'ing
-   '1' to /sys/kernel/fadump_release_opalcore node.
+   '1' to /sys/firmware/opal/mpipl/release_core node.
 
    e.g.
-     # echo 1 > /sys/kernel/fadump_release_opalcore
+     # echo 1 > /sys/firmware/opal/mpipl/release_core
 
 Implementation details:
 -----------------------
@@ -283,14 +283,17 @@ Here is the list of files under kernel sysfs:
     enhanced to use this interface to release the memory reserved for
     dump and continue without 2nd reboot.
 
- /sys/kernel/fadump_release_opalcore
+Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
+      /sys/firmware/opal/mpipl/release_core
+
+ /sys/firmware/opal/mpipl/release_core
 
     This file is available only on OPAL based machines when FADump is
     active during capture kernel. This is used to release the memory
-    used by the kernel to export /sys/firmware/opal/core file. To
+    used by the kernel to export /sys/firmware/opal/mpipl/core file. To
     release this memory, echo '1' to it:
 
-    echo 1  > /sys/kernel/fadump_release_opalcore
+    echo 1  > /sys/firmware/opal/mpipl/release_core
 
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index ed895d82c048..6dba3b62269f 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -71,6 +71,7 @@ static LIST_HEAD(opalcore_list);
 static struct opalcore_config *oc_conf;
 static const struct opal_mpipl_fadump *opalc_metadata;
 static const struct opal_mpipl_fadump *opalc_cpu_metadata;
+struct kobject *mpipl_kobj;
 
 /*
  * Set crashing CPU's signal to SIGUSR1. if the kernel is triggered
@@ -428,7 +429,7 @@ static void opalcore_cleanup(void)
 		return;
 
 	/* Remove OPAL core sysfs file */
-	sysfs_remove_bin_file(opal_kobj, &opal_core_attr);
+	sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
 	oc_conf->ptload_phdr = NULL;
 	oc_conf->ptload_cnt = 0;
 
@@ -563,9 +564,9 @@ static void __init opalcore_config_init(void)
 	of_node_put(np);
 }
 
-static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
-					     struct kobj_attribute *attr,
-					     const char *buf, size_t count)
+static ssize_t release_core_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
 {
 	int input = -1;
 
@@ -589,9 +590,23 @@ static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
 	return count;
 }
 
-static struct kobj_attribute opalcore_rel_attr = __ATTR(fadump_release_opalcore,
-						0200, NULL,
-						fadump_release_opalcore_store);
+static struct kobj_attribute opalcore_rel_attr = __ATTR_WO(release_core);
+
+static struct attribute *mpipl_attr[] = {
+	&opalcore_rel_attr.attr,
+	NULL,
+};
+
+static struct bin_attribute *mpipl_bin_attr[] = {
+	&opal_core_attr,
+	NULL,
+
+};
+
+static struct attribute_group mpipl_group = {
+	.attrs = mpipl_attr,
+	.bin_attrs =  mpipl_bin_attr,
+};
 
 static int __init opalcore_init(void)
 {
@@ -609,7 +624,7 @@ static int __init opalcore_init(void)
 	 * then capture the dump.
 	 */
 	if (!(is_opalcore_usable())) {
-		pr_err("Failed to export /sys/firmware/opal/core\n");
+		pr_err("Failed to export /sys/firmware/opal/mpipl/core\n");
 		opalcore_cleanup();
 		return rc;
 	}
@@ -617,18 +632,28 @@ static int __init opalcore_init(void)
 	/* Set OPAL core file size */
 	opal_core_attr.size = oc_conf->opalcore_size;
 
+	mpipl_kobj = kobject_create_and_add("mpipl", opal_kobj);
+	if (!mpipl_kobj) {
+		pr_err("unable to create mpipl kobject\n");
+		return -ENOMEM;
+	}
+
 	/* Export OPAL core sysfs file */
-	rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
-	if (rc != 0) {
-		pr_err("Failed to export /sys/firmware/opal/core\n");
+	rc = sysfs_create_group(mpipl_kobj, &mpipl_group);
+	if (rc) {
+		pr_err("mpipl sysfs group creation failed (%d)", rc);
 		opalcore_cleanup();
 		return rc;
 	}
-
-	rc = sysfs_create_file(kernel_kobj, &opalcore_rel_attr.attr);
+	/* The /sys/firmware/opal/core is moved to /sys/firmware/opal/mpipl/
+	 * directory, need to create symlink at old location to maintain
+	 * backward compatibility.
+	 */
+	rc = compat_only_sysfs_link_entry_to_kobj(opal_kobj, mpipl_kobj,
+						  "core", NULL);
 	if (rc) {
-		pr_warn("unable to create sysfs file fadump_release_opalcore (%d)\n",
-			rc);
+		pr_err("unable to create core symlink (%d)\n", rc);
+		return rc;
 	}
 
 	return 0;
-- 
2.17.2

