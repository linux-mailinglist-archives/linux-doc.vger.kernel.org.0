Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 962DBB3022
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2019 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfIONX2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 15 Sep 2019 09:23:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58308 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731092AbfIONX2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Sep 2019 09:23:28 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8FDMf2V004759
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 09:23:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2v1dht1r50-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 09:23:27 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Sun, 15 Sep 2019 14:23:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 15 Sep 2019 14:23:23 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8FDNMet53674072
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 15 Sep 2019 13:23:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7EC83A405F;
        Sun, 15 Sep 2019 13:23:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5578A405B;
        Sun, 15 Sep 2019 13:23:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.54.91])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sun, 15 Sep 2019 13:23:20 +0000 (GMT)
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
To:     linuxppc-dev@ozlabs.org
Cc:     mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, mpe@ellerman.id.au, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: [PATCH 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
Date:   Sun, 15 Sep 2019 18:53:09 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
References: <20190915132310.13542-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091513-0020-0000-0000-0000036CEECE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091513-0021-0000-0000-000021C28983
Message-Id: <20190915132310.13542-4-sourabhjain@linux.ibm.com>
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

The /sys/kernel/fadump_* sysfs files are replicated under
/sys/kernel/fadump/ directory. But we need to keep the old
sysfs files to maintain the backward compatibility.

The sysfs files are scheduled to remove by 2021.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../{testing => obsolete}/sysfs-kernel-fadump_enabled    | 3 +++
 .../{testing => obsolete}/sysfs-kernel-fadump_registered | 3 +++
 .../sysfs-kernel-fadump_release_mem                      | 3 +++
 .../sysfs-kernel-fadump_release_opalcore                 | 3 +++
 Documentation/powerpc/firmware-assisted-dump.rst         | 9 +++++++++
 5 files changed, 21 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled (66%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_registered (71%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_mem (73%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_opalcore (70%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
similarity index 66%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_enabled
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
index f73632b1c006..ca35a285905b 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_enabled
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_enabled.
+
 What:		/sys/kernel/fadump_enabled
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_registered b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
similarity index 71%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_registered
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
index 972e8c427ad4..2c1bc4adafb4 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_registered
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_registered.
+
 What:		/sys/kernel/fadump/fadump_registered
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
similarity index 73%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
index 9c20d64ab48d..8fef37d9b5ba 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_mem
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_release_mem.
+
 What:		/sys/kernel/fadump_release_mem
 Date:		Feb 2012
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
similarity index 70%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
rename to Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
index 53313c1d4e7a..c02be8f4471e 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_release_opalcore
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_release_opalcore.
+
 What:		/sys/kernel/fadump_release_opalcore
 Date:		Sep 2019
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 0455a78486d5..4fd7f5eab97d 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -292,6 +292,15 @@ Here is the list of files under kernel sysfs:
 
     echo 1  > /sys/kernel/fadump_release_opalcore
 
+Note: The following FADump sysfs files are deprecated.
+
+    Deprecated                       Alternative
+    -------------------------------------------------------------------------------
+    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
+    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
+    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem
+    /sys/kernel/fadump_release_opalcore  /sys/kernel/fadump/fadump_release_opalcore
+
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
 
-- 
2.17.2

