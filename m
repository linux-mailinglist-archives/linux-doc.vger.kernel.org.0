Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24727B301F
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2019 15:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbfIONXZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 15 Sep 2019 09:23:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53486 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726268AbfIONXZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Sep 2019 09:23:25 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8FDMcFh011094
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 09:23:24 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2v1dtn9f2f-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 09:23:23 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Sun, 15 Sep 2019 14:23:22 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 15 Sep 2019 14:23:18 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8FDNHaF33226884
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 15 Sep 2019 13:23:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 61E7BA405F;
        Sun, 15 Sep 2019 13:23:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 866C4A405B;
        Sun, 15 Sep 2019 13:23:15 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.54.91])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sun, 15 Sep 2019 13:23:15 +0000 (GMT)
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
To:     linuxppc-dev@ozlabs.org
Cc:     mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, mpe@ellerman.id.au, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/4] powerpc/fadump: replicate /sys/kernel/fadump_* sysfs into /sys/kernel/fadump/
Date:   Sun, 15 Sep 2019 18:53:07 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
References: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091513-0020-0000-0000-0000036CEEC9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091513-0021-0000-0000-000021C2897F
Message-Id: <20190915132310.13542-2-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-15_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909150147
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As the number of FADump sysfs files increases it is hard to manage all of
them inside /sys/kernel directory. It's better to have all the FADump
related sysfs files in a dedicated directory /sys/kernel/fadump. But to
maintain the backward compatibility all the /sys/kernel/fadump_* sysfs
files are replicated inside /sys/kernel/fadump/ and eventually get removed
in future.

Added ABI documentation for all the replicated FADump sysfs file in
Documentation/ABI/testing/sysfs-kernel-fadump.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump | 41 +++++++++++++++++++
 arch/powerpc/kernel/fadump.c                  | 29 +++++++++++++
 arch/powerpc/platforms/powernv/opal-core.c    |  7 ++++
 3 files changed, 77 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
new file mode 100644
index 000000000000..ed8eec3d759c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -0,0 +1,41 @@
+What:		/sys/kernel/fadump/fadump_*
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:
+		The /sys/kernel/fadump/fadump_* is a collection of FADump
+		sysfs file provide information about the configuration status
+		of Firmware Assisted Dump (FADump).
+
+What:		/sys/kernel/fadump/enabled
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read only
+		Primarily used to identify whether the FADump is enabled in
+		the kernel or not.
+User:		Kdump service
+
+What:		/sys/kernel/fadump/registered
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read/write
+		Helps to control the dump collect feature from userspace.
+		Setting 1 to this file enables the system to collect the
+		dump and 0 to disable it.
+User:		Kdump service
+
+What:		/sys/kernel/fadump/release_mem
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	write only
+		This is a special sysfs file and only available when
+		the system is booted to capture the vmcore using FADump.
+		It is used to release the memory reserved by FADump to
+		save the crash dump.
+
+What:		/sys/kernel/fadump/release_opalcore
+Date:		Sep 2019
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	write only
+		The sysfs file is available when the system is booted to
+		collect the dump on OPAL based machine. It used to release
+		the memory used to collect the opalcore.
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ed59855430b9..bb70fa208a86 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1418,6 +1418,9 @@ static int fadump_region_show(struct seq_file *m, void *private)
 	return 0;
 }
 
+struct kobject *fadump_kobj;
+EXPORT_SYMBOL_GPL(fadump_kobj);
+
 static struct kobj_attribute fadump_release_attr = __ATTR(fadump_release_mem,
 						0200, NULL,
 						fadump_release_memory_store);
@@ -1435,6 +1438,11 @@ static void fadump_init_files(void)
 	struct dentry *debugfs_file;
 	int rc = 0;
 
+	fadump_kobj = kobject_create_and_add("fadump", kernel_kobj);
+	if (!fadump_kobj) {
+		pr_err("failed to create fadump kobject\n");
+		return;
+	}
 	rc = sysfs_create_file(kernel_kobj, &fadump_attr.attr);
 	if (rc)
 		printk(KERN_ERR "fadump: unable to create sysfs file"
@@ -1458,6 +1466,27 @@ static void fadump_init_files(void)
 			printk(KERN_ERR "fadump: unable to create sysfs file"
 				" fadump_release_mem (%d)\n", rc);
 	}
+	/* Replicating the following sysfs attributes in a new directory
+	 * named fadump.
+	 *
+	 *	- fadump_enabled
+	 *	- fadump_registered
+	 *	- fadump_release_mem
+	 */
+	rc = sysfs_create_file(fadump_kobj, &fadump_attr.attr);
+	if (rc)
+		pr_err("unable to create fadump/fadump_enabled sysfs file (%d)\n",
+		       rc);
+	rc = sysfs_create_file(fadump_kobj, &fadump_register_attr.attr);
+	if (rc)
+		pr_err("unable to create fadump/fadump_registered sysfs file (%d)\n",
+		       rc);
+	if (fw_dump.dump_active) {
+		rc = sysfs_create_file(fadump_kobj, &fadump_release_attr.attr);
+		if (rc)
+			pr_err("unable to create fadump/fadump_release_mem sysfs file (%d)\n",
+			       rc);
+	}
 	return;
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index ed895d82c048..8c31aefe8814 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -631,6 +631,13 @@ static int __init opalcore_init(void)
 			rc);
 	}
 
+	/* Replicating the fadump_release_opalcore sysfs file */
+	rc = sysfs_create_file(fadump_kobj, &opalcore_rel_attr.attr);
+	if (rc) {
+		pr_warn("unable to create fadump/fadump_release_opalcore sysfs file (%d)\n",
+			rc)
+	}
+
 	return 0;
 }
 fs_initcall(opalcore_init);
-- 
2.17.2

