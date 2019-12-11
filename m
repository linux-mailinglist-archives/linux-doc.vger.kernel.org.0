Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93AA711B801
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2019 17:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbfLKQLs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Dec 2019 11:11:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61804 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729870AbfLKQLr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 11:11:47 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBBGBeUT098273
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 11:11:46 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wtdp4jv1v-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 11:09:56 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Wed, 11 Dec 2019 16:09:22 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 11 Dec 2019 16:09:18 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xBBG9GQ735389666
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Dec 2019 16:09:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 69801A405F;
        Wed, 11 Dec 2019 16:09:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5C95FA4054;
        Wed, 11 Dec 2019 16:09:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 11 Dec 2019 16:09:14 +0000 (GMT)
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
To:     mpe@ellerman.id.au
Cc:     mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org,
        Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [PATCH v6 0/6] reorganize and add FADump sysfs files
Date:   Wed, 11 Dec 2019 21:39:04 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19121116-4275-0000-0000-0000038E019B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-4276-0000-0000-000038A1B827
Message-Id: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110136
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, FADump sysfs files are present inside /sys/kernel directory.
But as the number of FADump sysfs file increases it is not a good idea to
push all of them in /sys/kernel directory. It is better to have separate
directory to keep all the FADump sysfs files.

Patch series reorganizes the FADump sysfs files and avail all the existing
FADump sysfs files present inside /sys/kernel into a new directory
/sys/kernel/fadump. The backward compatibility is maintained by adding a
symlink for every sysfs file that has moved to new location. Also a new
FADump sys interface is added to get the amount of memory reserved by FADump
for saving the crash dump.

Changelog:
v1 -> v5:
  - https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-December/201642.html

v5 -> v6
  - Unregister FADump if fadump group creation fails.
  - Remove fadump_enabled symlink if fadump_registered symlink
    creation fails.
  - Removed CREATE_SYMLINK macro.

Sourabh Jain (6):
  Documentation/ABI: add ABI documentation for /sys/kernel/fadump_*
  sysfs: wrap __compat_only_sysfs_link_entry_to_kobj function to change
    the symlink name
  powerpc/fadump: reorganize /sys/kernel/fadump_* sysfs files
  powerpc/powernv: move core and fadump_release_opalcore under new
    kobject
  Documentation/ABI: mark /sys/kernel/fadump_* sysfs files deprecated
  powerpc/fadump: sysfs for fadump memory reservation

 .../ABI/obsolete/sysfs-kernel-fadump_enabled  |   9 ++
 .../obsolete/sysfs-kernel-fadump_registered   |  10 ++
 .../obsolete/sysfs-kernel-fadump_release_mem  |  10 ++
 .../sysfs-kernel-fadump_release_opalcore      |   9 ++
 Documentation/ABI/testing/sysfs-kernel-fadump |  40 ++++++
 .../powerpc/firmware-assisted-dump.rst        |  28 +++-
 arch/powerpc/kernel/fadump.c                  | 127 +++++++++++++-----
 arch/powerpc/platforms/powernv/opal-core.c    |  55 +++++---
 fs/sysfs/group.c                              |  28 +++-
 include/linux/sysfs.h                         |  12 ++
 10 files changed, 270 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_enabled
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_registered
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump

-- 
2.17.2

