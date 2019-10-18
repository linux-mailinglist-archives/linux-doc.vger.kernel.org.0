Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C487DDC5C0
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2019 15:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407903AbfJRNGd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Oct 2019 09:06:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39080 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2442844AbfJRNGc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Oct 2019 09:06:32 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x9ID37Fa028405
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2019 09:06:32 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2vq0ha8j87-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2019 09:06:29 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Fri, 18 Oct 2019 14:06:21 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 18 Oct 2019 14:06:17 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x9ID6FjY48103476
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Oct 2019 13:06:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C938EA4059;
        Fri, 18 Oct 2019 13:06:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BBD38A4051;
        Fri, 18 Oct 2019 13:06:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.73.145])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 18 Oct 2019 13:06:13 +0000 (GMT)
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
To:     mpe@ellerman.id.au
Cc:     mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH v2 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
Date:   Fri, 18 Oct 2019 18:35:56 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
References: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19101813-0012-0000-0000-000003594C98
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101813-0013-0000-0000-000021946DCE
Message-Id: <20191018130557.2217-4-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-10-18_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910180123
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
 .../sysfs-kernel-fadump_enabled                   |  3 +++
 .../sysfs-kernel-fadump_registered                |  3 +++
 .../sysfs-kernel-fadump_release_mem               |  3 +++
 .../sysfs-kernel-fadump_release_opalcore          |  2 ++
 Documentation/powerpc/firmware-assisted-dump.rst  | 15 +++++++++++++--
 5 files changed, 24 insertions(+), 2 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_enabled (66%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_registered (71%)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-fadump_release_mem (73%)
 rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (84%)

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
index dcf925e53f0f..3d881701dc11 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_registered
+++ b/Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
@@ -1,3 +1,6 @@
+This ABI is deprecated and will be removed after 2021. It is replaced
+with /sys/kernel/fadump/fadump_registered.
+
 What:		/sys/kernel/fadump_registered
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
diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
similarity index 84%
rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
index 53313c1d4e7a..b42e768bf922 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
+++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
@@ -1,3 +1,5 @@
+This ABI is moved to /sys/kernel/fadump/ directory.
+
 What:		/sys/kernel/fadump_release_opalcore
 Date:		Sep 2019
 Contact:	linuxppc-dev@lists.ozlabs.org
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index 0455a78486d5..6e2d329efda9 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -283,14 +283,25 @@ Here is the list of files under kernel sysfs:
     enhanced to use this interface to release the memory reserved for
     dump and continue without 2nd reboot.
 
- /sys/kernel/fadump_release_opalcore
+Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
+      /sys/kernel/fadump/fadump_release_opalcore.
+
+ /sys/kernel/fadump/fadump_release_opalcore
 
     This file is available only on OPAL based machines when FADump is
     active during capture kernel. This is used to release the memory
     used by the kernel to export /sys/firmware/opal/core file. To
     release this memory, echo '1' to it:
 
-    echo 1  > /sys/kernel/fadump_release_opalcore
+    echo 1  > /sys/kernel/fadump/fadump_release_opalcore
+
+Note: The following FADump sysfs files are deprecated.
+
+    Deprecated                       Alternative
+    -------------------------------------------------------------------------------
+    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
+    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
+    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem
 
 Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
-- 
2.17.2

