Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6F6662B78
	for <lists+linux-doc@lfdr.de>; Mon,  9 Jan 2023 17:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjAIQoj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Jan 2023 11:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbjAIQoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jan 2023 11:44:17 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3F81DDE7;
        Mon,  9 Jan 2023 08:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an0IokUgHQlDE0tj4d/hub+OkkOVI8HfaRKudlNg1IwYMiddV2Ci9G/QEkTjsXV/d/zdri6S7bmDheCKcNX4SOoNSKouUrZhgWlfxo3QgNiV3GpOw2n/OzBoHoCqxp2tOeSOXh8McMcgy+D8RA7bDCctmKe4xC9ODjEMVep+ns1dGeDsIp+4N1Q3YIIiYSnYBeFmcR3x3I3ul8AhVD4Y43a6aqmckBdP/NZEqrX+htrpnYH5vyYUteX/C4egCKb4uRsBsFaI28f9z+HhpZl131j5yFrVj5WyQrgxkpfvrqOXs6p5d/jvz838CSIUuatzNIBdOwnxJnkAzlhEM/SDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjPc0Xiwn4PWqpurKfB1jo57PYW7jyABJlqa/9FoI5k=;
 b=Qta3PN4YPf3hXYShgJRiLiTTlXaSLbg04KsridL8tTKqyLplCy7894VDRTzk7chIlU3tHLxC7MCDk5cQkcsrOxOM7A+Bih0zDe/OlN9J1IRMl1IHKWIGiAdaCl1eIuZcHFh3VOejz7cu1zBR5xyExGfoFusxiMgtwIDRVNu4AHPTtN5Bi5x0DVFLi1weYfnrVctio+OsSnsdG1AY4oKCgBWzamjX+WXvGBCtVx8LIrbSKY7O1q5+0Ifsy8b2+a+hONQ5sVItFzLR6fesPUv1zw9aWnFx1cwdjR4q2IHwaUSNnQQ6JqNXlaVfT6mqwlxvwMNpIY+vLFBdQq1hcG+nnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjPc0Xiwn4PWqpurKfB1jo57PYW7jyABJlqa/9FoI5k=;
 b=W9lCIsAUkjL+cSOSxzrx7R7NOD5F+GF/PZzdc2/GFTivBUf0OzEiuLoGQMty18ut6VI3afYzzouC67iJg2ccrol3SegvvN71LfVmKw2cWGFsZGCsCWqSMijG4d6BV/sEoJquoGDJ3zVl2/Q9nR6qMU14jiiDwFHXeDbq8h4IDM4=
Received: from DM6PR12CA0005.namprd12.prod.outlook.com (2603:10b6:5:1c0::18)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:44:13 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::12) by DM6PR12CA0005.outlook.office365.com
 (2603:10b6:5:1c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 16:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 16:44:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 10:44:11 -0600
From:   Babu Moger <babu.moger@amd.com>
To:     <corbet@lwn.net>, <reinette.chatre@intel.com>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>
CC:     <fenghua.yu@intel.com>, <dave.hansen@linux.intel.com>,
        <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
        <akpm@linux-foundation.org>, <quic_neeraju@quicinc.com>,
        <rdunlap@infradead.org>, <damien.lemoal@opensource.wdc.com>,
        <songmuchun@bytedance.com>, <peterz@infradead.org>,
        <jpoimboe@kernel.org>, <pbonzini@redhat.com>, <babu.moger@amd.com>,
        <chang.seok.bae@intel.com>, <pawan.kumar.gupta@linux.intel.com>,
        <jmattson@google.com>, <daniel.sneddon@linux.intel.com>,
        <sandipan.das@amd.com>, <tony.luck@intel.com>,
        <james.morse@arm.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bagasdotme@gmail.com>,
        <eranian@google.com>, <christophe.leroy@csgroup.eu>,
        <jarkko@kernel.org>, <adrian.hunter@intel.com>,
        <quic_jiles@quicinc.com>, <peternewman@google.com>
Subject: [PATCH v11 00/13] x86/resctrl: Support for AMD QoS new features
Date:   Mon, 9 Jan 2023 10:43:52 -0600
Message-ID: <20230109164405.569714-1-babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d88fc3-03f4-42f3-822c-08daf260bd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18rcjTdBgxM5vE2KqVTfgrr0pOeJXDgE9y/XS1gqMBmV+XSSfnxPlaHW7JkCxBq1261xMzziT95HsM2X4zoaJbFtRsL0umoWo5Mr0PLFSQNlf4qpH2mvbxZLInHXxu7e7QrrLNo4qqeZ7Hsw6fq4YN5gDeHprxxe+/KWjBTksw/ldDOASSwOBHJfTk4uJyRDihghwmfdR+Jz4StXyEZLnYaAehOdQublaUlDFYYnVn3B4cKWgNXW8pxyDOCQ0d8B1BJKGPTHrJcDzccvXwANNfjfTxOdspWd7ghIs0DewLVZjUMCEk69dJLhQcbb6hq1TBJs0D1p0fWKwCkFI4UwbCy2UoULGM/zJs7Seml5dDl/oJjkQjCzZgKE1zHBDYJH0335v4XN+saF7/UEwVabf4OLcPMZRb+40WxqwqEDB2GDCNAT/XCfO8FarP66/F6HfLgpLyrNM8gg4Z9MUiFndRFy11Gytpog3K1y1Av5LSVUkSlczdQNw7GDr0ZxnG+AJUDEw5/xXM/2cSuHq7gL3X+ipF2eNrXhqtHo/AnzD+LYMPOazX7rZ8EVIb4M1js9YQLRDUS/z4UVR4MA29oDcSsWsJiFwVWzYUanQjnxIA9F7QoBo48S92ZlupoDdNs9dUJdmePKWmht0ATWvi1xl+nl3sIIp+58T1K+jocngu5YWrpUUr4+Xp3At9C/uH1immK/69f5braXncScHTJ8GdxtSt/rxrQBNUbTol9Uk7XHlzL2MR6IStFxTpbfkI1iG4EC5YwuvPnBXf4qz7zo9EDwYI78+EFLZO1+8jltT/U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(2906002)(8936002)(7416002)(7406005)(44832011)(5660300002)(36756003)(41300700001)(6666004)(70586007)(70206006)(8676002)(316002)(7696005)(110136005)(54906003)(4326008)(966005)(40480700001)(26005)(478600001)(16526019)(186003)(336012)(2616005)(1076003)(426003)(86362001)(47076005)(36860700001)(83380400001)(40460700003)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:44:13.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d88fc3-03f4-42f3-822c-08daf260bd67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

New AMD processors can now support following QoS features.

1. Slow Memory Bandwidth Allocation (SMBA)
   With this feature, the QOS enforcement policies can be applied
   to the external slow memory connected to the host. QOS enforcement
   is accomplished by assigning a Class Of Service (COS) to a processor
   and specifying allocations or limits for that COS for each resource
   to be allocated.

   Currently, CXL.memory is the only supported "slow" memory device. With
   the support of SMBA feature the hardware enables bandwidth allocation
   on the slow memory devices.

2. Bandwidth Monitoring Event Configuration (BMEC)
   The bandwidth monitoring events mbm_total_event and mbm_local_event 
   are set to count all the total and local reads/writes respectively.
   With the introduction of slow memory, the two counters are not enough
   to count all the different types are memory events. With the feature
   BMEC, the users have the option to configure mbm_total_event and
   mbm_local_event to count the specific type of events.

   Following are the bitmaps of events supported.
   Bits    Description
     6       Dirty Victims from the QOS domain to all types of memory
     5       Reads to slow memory in the non-local NUMA domain
     4       Reads to slow memory in the local NUMA domain
     3       Non-temporal writes to non-local NUMA domain
     2       Non-temporal writes to local NUMA domain
     1       Reads to memory in the non-local NUMA domain
     0       Reads to memory in the local NUMA domain

This series adds support for these features. Also added a minor cleanup(PATCH 1).

Feature description is available in the specification, "AMD64 Technology Platform Quality of Service Extensions, Revision: 1.03 Publication # 56375
Revision: 1.03 Issue Date: February 2022".

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Link: https://www.amd.com/en/support/tech-docs/amd64-technology-platform-quality-service-extensions
---
v11:
 Summary of changes:
 Removed cpus_read_lock() from the patch 11 and 12 based on our discussion.
 https://lore.kernel.org/lkml/3dc31a6d-5485-746d-3c49-df7dcd1827e3@intel.com/
 Picked up all the Reviewed-by by Reinette.
 Minor text changes on patch 13.
 
v10:
 https://lore.kernel.org/lkml/20221222233127.910538-1-babu.moger@amd.com/
 Summary of changes:
 1. Moved the patch 12 to 1 ("x86/resctrl: Replace smp_call_function_many() with on_each_cpu_mask()")
 2. No need to write MSR_IA32_EVT_CFG_BASE on all the CPUs. Replaced on_each_cpu_mask with smp_call_function_any.
 3. Updated the subject line of the patches to replace sysfs with resctrl.
 4. Added Reviewed-by for the patches which are reviewed by Reinette.
 5. Added few more comments suggested by Reinette.
  
v9:
 https://lore.kernel.org/lkml/166990882621.17806.16780480657453071426.stgit@bmoger-ubuntu/
 Summary of changes:
 1. Rebased on top of lastest tip/master as of 11/30.
 2. Most of the changes are result of the comments from Fenghua, Reinette and Peter Newman.
 3. Fixed the cpuid dependancy.
 4. Added the __init attribute to rdt_get_mon_l3_config and mbm_config_rftype_init.
 5. Added new function resctrl_arch_reset_rmid_all to clear all rmid statues.
 6. Changed mon_event_config_index_get based on Reinette's comments.
 7. Changed mbm_config_rftype_init to take care of few extra error handling.
 8. Few other minor changes and text changes.

v8:
 https://lore.kernel.org/lkml/166759188265.3281208.11769277079826754455.stgit@bmoger-ubuntu/
 Changes:
 1. Removed init attribute for rdt_cpu_has to make it available for all the files.
 2. Updated the change log for mon_features to correct the names of config files.
 3. Changed configuration file name from mbm_total_config to mbm_total_bytes_config.
    This is more consistant with other changes.
 4. Added lock protection while reading/writing the config file.
 5. Other few minor text changes. I have been missing few comments in last couple of
    revisions. Hope I have addressed all of them this time.

v7:
 https://lore.kernel.org/lkml/166604543832.5345.9696970469830919982.stgit@bmoger-ubuntu/
 Changes:
 Not much of a change. Missed one comment from Reinette from v5. Corrected it now.
 Few format corrections from Sanjaya.

v6:
 https://lore.kernel.org/lkml/166543345606.23830.3120625408601531368.stgit@bmoger-ubuntu/
 Summary of changes:
 1. Rebased on top of lastest tip tree. Fixed few minor conflicts.
 2. Fixed format issue with scattered.c.
 3. Removed config_name from the structure mon_evt. It is not required.
 4. The read/write format for mbm_total_config and mbm_local_config will be same
    as schemata format "id0=val0;id1=val1;...". This is comment from Fenghua.
 5. Added more comments MSR_IA32_EVT_CFG_BASE writng.
 5. Few text changes in resctrl.rst 
 
v5:
  https://lore.kernel.org/lkml/166431016617.373387.1968875281081252467.stgit@bmoger-ubuntu/
  Summary of changes.
  1. Split the series into two. The first two patches are bug fixes. So, sent them separate.
  2. The config files mbm_total_config and mbm_local_config are now under
     /sys/fs/resctrl/info/L3_MON/. Removed these config files from mon groups.
  3. Ran "checkpatch --strict --codespell" on all the patches. Looks good with few known exceptions.
  4. Few minor text changes in resctrl.rst file. 

v4:
  https://lore.kernel.org/lkml/166257348081.1043018.11227924488792315932.stgit@bmoger-ubuntu/
  Got numerios of comments from Reinette Chatre. Addressed most of them. 
  Summary of changes.
  1. Removed mon_configurable under /sys/fs/resctrl/info/L3_MON/.  
  2. Updated mon_features texts if the BMEC is supported.
  3. Added more explanation about the slow memory support.
  4. Replaced smp_call_function_many with on_each_cpu_mask call.
  5. Removed arch_has_empty_bitmaps
  6. Few other text changes.
  7. Removed Reviewed-by if the patch is modified.
  8. Rebased the patches to latest tip.

v3:
  https://lore.kernel.org/lkml/166117559756.6695.16047463526634290701.stgit@bmoger-ubuntu/
  a. Rebased the patches to latest tip. Resolved some conflicts.
     https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
  b. Taken care of feedback from Bagas Sanjaya.
  c. Added Reviewed by from Mingo.
  Note: I am still looking for comments from Reinette or Fenghua.

v2:
  https://lore.kernel.org/lkml/165938717220.724959.10931629283087443782.stgit@bmoger-ubuntu/
  a. Rebased the patches to latest stable tree (v5.18.15). Resolved some conflicts.
  b. Added the patch to fix CBM issue on AMD. This was originally discussed
     https://lore.kernel.org/lkml/20220517001234.3137157-1-eranian@google.com/

v1:
  https://lore.kernel.org/lkml/165757543252.416408.13547339307237713464.stgit@bmoger-ubuntu/


Babu Moger (13):
  x86/resctrl: Replace smp_call_function_many() with on_each_cpu_mask()
  x86/cpufeatures: Add Slow Memory Bandwidth Allocation feature flag
  x86/resctrl: Add a new resource type RDT_RESOURCE_SMBA
  x86/cpufeatures: Add Bandwidth Monitoring Event Configuration feature
    flag
  x86/resctrl: Include new features in command line options
  x86/resctrl: Detect and configure Slow Memory Bandwidth Allocation
  x86/resctrl: Add __init attribute to rdt_get_mon_l3_config()
  x86/resctrl: Support monitor configuration
  x86/resctrl: Add interface to read mbm_total_bytes_config
  x86/resctrl: Add interface to read mbm_local_bytes_config
  x86/resctrl: Add interface to write mbm_total_bytes_config
  x86/resctrl: Add interface to write mbm_local_bytes_config
  Documentation/x86: Update resctrl.rst for new features

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/x86/resctrl.rst                 | 142 +++++++-
 arch/x86/include/asm/cpufeatures.h            |   2 +
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   2 +
 arch/x86/kernel/cpu/resctrl/core.c            |  54 ++-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  13 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  28 ++
 arch/x86/kernel/cpu/resctrl/monitor.c         |  30 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 307 ++++++++++++++++--
 arch/x86/kernel/cpu/scattered.c               |   2 +
 include/linux/resctrl.h                       |  11 +
 12 files changed, 554 insertions(+), 41 deletions(-)

-- 
2.34.1

