Return-Path: <linux-doc+bounces-42140-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EDA7B422
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 02:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9FF43B85D0
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 00:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA8B3D6F;
	Fri,  4 Apr 2025 00:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bSkD9s/Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B459475;
	Fri,  4 Apr 2025 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725931; cv=fail; b=qdf7yJSdF/nFetsHNln4gAa+8+kii7dh+K4/xxVayYf5kZMwTKpBrsCb2Uu8bI+IYI6fPEW0R/rzHlvvY8vlfPJCJzY4d/slixBFOj4+7hzdjwRjyOJADd20rj9GpcEw9c7wfg+6Vsm+8kVkT7MbNViydf9yMvlkbv/yZN/5a7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725931; c=relaxed/simple;
	bh=QMdCjhe97tl9V582KJLYjo/ZoFScnEJMUNX5iuX8AIo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sCapQAJRtfgkBTp1dlRJWAOWdJfZBZ59dMmwzIio8NpnOD1yHX809/FbatRyFJ7qVvVQFTQ0ofxH0NRdhWfXrGxbPjNI9+59+T0tVgsuyR92ofbW/eKpUxEuUbZ+VJOfQ6iFFmI+mJKBqV/mf9krcWrBVTIdfH9Xi1c13CnekYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bSkD9s/Z; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdDwraagKARoO/5ncH+paB9eRxn96lmcFcHp2ZFp4TDr2ZQy7q+FAxQgFG95kTXFKLLBvaGnsQsv4vRVGOCdByWE7Jnm6wr+Xv4WWXi4e9FK15VR8zcbpfPMC1/DYgjOastTtLL+tAyTRVhnXoJmfOOufZjRIfQ+lUvza+Uss2QW39C2KYDWOZ9D1qNSKClku/TrTRsdVqcKXZOxh0RhY08RX8H6q9pZ2OKQAS3rHN1C+jV+B9f318E8WgVZGpqEzaXui+GcP7/NlNGr5fWb6O4uFtck6uC8UTjb/8RIwJRH8tUJu8VrQH4nGaybOzcPQzBmiVDRg+abXgbBUfFnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK51DT2+xcgV8nILjq7rLmvM9pKvURHL+PwXZ5dM9DE=;
 b=B/iGM2qBWVfBUf1oBRdoMRClnzHJ4NjGj9yvfhytxyP6D8xVsQqm52tpzxU2WS7nb6pBhkaUSzXdIUWwZY4EKz8JEkrC1uXSiwDSixDGJHUPXR0bkFoEsyQydxAidk//vWEIuio0AKln61iWVod1tqtA8dckjVpnEktkvf4+lvo8dMmHgk+UrAHahvm5Bbda9MvihRvuisNkCD3LZ56fYCoDsJfE1/OwYsgzUtHWeK4bNB//GWeMHu384X19hLWqvkfLpGJ/JbfU5zNcryRa+LlmiRNIbPR2rImaOWZ64Pi0+evcpJemBLAl5g2tyWdvAMLAaQzDt0tvgmsaViNgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK51DT2+xcgV8nILjq7rLmvM9pKvURHL+PwXZ5dM9DE=;
 b=bSkD9s/ZGyjYRHBkX00C54KXFdpme4wQUOLwHsQRiPcvBYB6+7kQdT8WF7YOeLQzhkgCWQUhbha3TEvFZq+2zwIJ3DUPR+PTU/xto+RXx4WwKVL+rLz23zJn/FVz54G4F8+bdu2HD41m1G2sbes9mlJTofg2cr+CagjC1sRPrn8=
Received: from SJ0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:a03:331::28)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:18:45 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::1f) by SJ0PR03CA0083.outlook.office365.com
 (2603:10b6:a03:331::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Fri,
 4 Apr 2025 00:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:18:44 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:18:41 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 00/26] x86/resctrl : Support AMD Assignable Bandwidth Monitoring Counters (ABMC)
Date: Thu, 3 Apr 2025 19:18:09 -0500
Message-ID: <cover.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de90207-a763-4ad2-4e78-08dd730e42fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVB0cWtCV09TaXhNTWhENzhOSmQvMEpPcFF1cy9ReGxaWCt5ME03b1dnYXZT?=
 =?utf-8?B?bXdmY0Z3aGk4eHg5U3hxKzhWZnJxamhzSEo0TkJOb0MvWmMvalJqZDJacUZs?=
 =?utf-8?B?Vm9VVVdhMWsvK1hVSjIvR1BzRnpwM3MwWlBGejdVTmhHL3ZKb1RlYXdCRVl5?=
 =?utf-8?B?TnFZQlRDenJzc2ZwZzI1NWF5Y29FL2J6Nmd3T0pYMTBmYWpaUUM1VnY3azFl?=
 =?utf-8?B?R2U4cEY5cHFsZnczWGUyVGo5N3NKSUVTRndrOE54UFAxdmZydG5maGhadGNB?=
 =?utf-8?B?L05xSDFSMHlENlU2VWo1VXczZU8rVm8wSVphTGRKY1RMR2xwS0Q4TUZZWVRv?=
 =?utf-8?B?MHg4YmNETXU4T1lLalVqQVlTT0dwVlFpTXB1d2doNUpibDJoc2tjSHZLQkFt?=
 =?utf-8?B?ZGVTcGNuVUVSMmxQVFM5UGdrdURCSmM5Vm9TWU1ZSVhRUEQyNVJzVWVhd25m?=
 =?utf-8?B?cUx2RjhvQngwVVpndU1FeUI2ZnZDdU9VSERyU0h5Yk8zSDRqZmZ3QStDbFVV?=
 =?utf-8?B?TElCY1MrdHlxeU9hOW00SHlKK3ZuZWlqUU5qdTdYOUZURGNGWnY5VUV0Zm1X?=
 =?utf-8?B?NkJvL1dCVkVnSWFGQlYxZ3FQT2FmWnhMUWMxS0FObXZDSG5pajNMNEQyT2I0?=
 =?utf-8?B?SUZISGUyQ2VKTmZUN2JNUWJQUk1JRHVqMkRHTXJGdDZVRklRckNNSWJNSGV6?=
 =?utf-8?B?bVZGME1KVThzTE9JQUo0bXpDd0R6RU9QWEdsV1JMZnhnWkd6UmxEZGlsUkty?=
 =?utf-8?B?allaN3ZHY013b2kyWExRSHJGTm1nWXVPemdhM2RubzlZOWZ0SjZJRmU3TG4y?=
 =?utf-8?B?emZ6MUJvVFdrYTJ6MnZQaTdiRFl1d2lZMmJBN1UxVDN1Ui9lbGdPb1FCWVlN?=
 =?utf-8?B?b0dtMVE4MVhIL3NiVE1PQmZkckhOanBaOG9rd1gralo1MldpeituU3UyRkJ0?=
 =?utf-8?B?b1VnbmZteTVGazhsVXMwbGRibWNrRnFwK2xpcDBxWkJCb01PQW1ONGZTaHRM?=
 =?utf-8?B?azdvSm5lNE45bFZjUXJrdERSbUYvM3gyM0pPQ0F5NXM2eEs5SzZhTG9VT2Fu?=
 =?utf-8?B?bngxSjFJSzNmWDRsbVR6VDZuWm5VeVhkQytnUUtyaHhYdEdITWxiU1RrSkVX?=
 =?utf-8?B?Y0E0M2RVMTc1OWZQTHd0MG9JdWV5MTNZRDE3dWhVZ3VLNXlvYUMzdDRYWmtB?=
 =?utf-8?B?a1lpQnJJUFVzNHVKMGEyZTdSZmI1cnlhNVdTeldjUml0ZmdTaFFlc0dvRU1S?=
 =?utf-8?B?RjJjbVJlaGpVK3lBV1NkQlBJTVNJaHJTei9MVHdVY2c4M21IZDdMMnhCVU9n?=
 =?utf-8?B?UUI4VjRjREtxMHBlR2VweFYyQk04bzBCNjVpbVE0OGY3MThuOVcrZ3NjNmtJ?=
 =?utf-8?B?ejg2b3dQQTRMVXBrMmxtYW11RG1SUXFhSEJYLzZhYS9wUi94QkFOOWxCZzBB?=
 =?utf-8?B?MDNHRC8vYnVnL3FmeHl3cG5kMVhESmMxVFhOOGpnL2tqUTVuNjhtRm5icWE2?=
 =?utf-8?B?RHB3K0VrWVlVWTlLb0lzeGFZR1ZGREF4cWpjS0pxRDUwTjVjbEVlNDQ2cGdW?=
 =?utf-8?B?SUV2bnRrMTVQemxtRG9xM05NQ3AxVGw3WHhTK1JCSU9WQWplZ2I3aVd1WDFH?=
 =?utf-8?B?QXc5U0xwQnpOQVVRcDVJdURvV2dubjBhREgxbHVaTVNhdUNQNHB3VFFZb2sv?=
 =?utf-8?B?SGRDcFpmVUUybjZKODJ1T1JTb3Vsa0FSVkVvYVdsNFZzaFRsOWM3bVdMUk9Z?=
 =?utf-8?B?SDJDZU1HZysyUmhVZGFmcHZrSG1nbWVOVm9TU0hNMUhab3AvOHVRTzBUWENh?=
 =?utf-8?B?aWZxQlczcExUOTJLaUJPWkNkNm5tdGttK3c4YVVJaVpRZnBPb1Z0SjZkWWY3?=
 =?utf-8?B?WTdSTVl5MnlHSHZoOWV0Zi9VQVhVTkFxZlFiUTU4aHlxbkxaOG5pOEx1WUZC?=
 =?utf-8?B?NGYwMTBhUFFVYkVGaTQxSnN6K0VHczNSM25LQzdtTS9iVUJ1ZlU1TWM0Wm9P?=
 =?utf-8?Q?+sPlykFPuWEVmUjITl9bEaP/YNDqmQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:18:44.5352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de90207-a763-4ad2-4e78-08dd730e42fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435


This series adds the support for Assignable Bandwidth Monitoring Counters
(ABMC). It is also called QoS RMID Pinning feature

Series is written such that it is easier to support other assignable
features supported from different vendors.

The feature details are documented in the  APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC). The documentation is available at
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit
bab03103a34f1 Merge branch into tip/master: 'x86/sev'

# Introduction

Users can create as many monitor groups as RMIDs supported by the hardware.
However, bandwidth monitoring feature on AMD system only guarantees that
RMIDs currently assigned to a processor will be tracked by hardware.
The counters of any other RMIDs which are no longer being tracked will be
reset to zero. The MBM event counters return "Unavailable" for the RMIDs
that are not tracked by hardware. So, there can be only limited number of
groups that can give guaranteed monitoring numbers. With ever changing
configurations there is no way to definitely know which of these groups
are being tracked for certain point of time. Users do not have the option
to monitor a group or set of groups for certain period of time without
worrying about counter being reset in between.
    
The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it is
assigned.  The assigned RMID will be tracked by the hardware until the user
unassigns it manually. There is no need to worry about counters being reset
during this period. Additionally, the user can specify a bitmask identifying
the specific bandwidth types from the given source to track with the counter.

Without ABMC enabled, monitoring will work in current 'default' mode without
assignment option.

# History

Previous implementation of ABMC had dependancy on BMEC (Bandwidth Monitoring
Event Configuration). Peter had concerns with that implementation because
it may be not be compatible with ARM's MPAM.

Here are the threads discussing the concerns and new interface to address the concerns.
https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=ky4MZw@mail.gmail.com/
https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/

Here are the finalized requirements based on the discussion:

*   Remove BMEC dependency on the ABMC feature.

*   Eliminate global assignment listing. The interface
    /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.

*   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/counter_configs/.
    The configuration file names should be free-form, allowing users to create them as needed.

*   Perform assignment listing at the group level by introducing mbm_L3_assignments
    in each monitoring group. The listing should provide the following details:

    Event Configuration: Specifies the event configuration applied. This will be crucial
    when "mkdir" on event configuration is added in the future, leading to the creation
    of mon_data/mon_l3_*/<event configuration>.

    Domains: Identifies the domains where the configuration is applied, supporting multi-domain setups.

    Assignment Type: Indicates whether the assignment is Exclusive (e or d), Shared (s), or Unassigned (_).

*   Provide option to enable or disable auto assignment when new group is created.

This series tries to address all the requirements listed above.

# Implementation details

Create a generic interface aimed to support user space assignment of scarce
counters used for monitoring. First usage of interface is by ABMC with option
to expand usage to "soft-ABMC" and MPAM counters in future.

Feature adds following interface files:

/sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
monitoring features supported. The enclosed brackets indicate which
feature is enabled.

/sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
counters available for assignment.

/sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: Reports the number of monitoring
counters free in each domain.

/sys/fs/resctrl/info/L3_MON/counter_configs : Directory to hold the counter configuration.

/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter : Default configuration
for MBM total events.

/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter : Default configuration
for MBM local events.

/sys/fs/resctrl/mbm_L3_assignments: Interface to list or modify assignment states on each group.

# Examples

a. Check if ABMC support is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	[mbm_cntr_assign]
	default

	ABMC feature is detected and it is enabled.

b. Check how many ABMC counters are available. 

	# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
	32

c. Check how many ABMC counters are available in each domain.

	# cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs 
	0=30;1=30

d. Check default counter configuration.

	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter 
	local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
        local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all

	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter 
	local_reads, local_non_temporal_writes, local_reads_slow_memory

e. Series adds a new interface file "mbm_L3_assignments" in each monitoring group
   to list and modify any group's monitoring states.

	The list is displayed in the following format:

        <Event configuration>:<Domain id>=<Assignment type>

        Event configuration: A valid event configuration listed in the
        /sys/fs/resctrl/info/L3_MON/counter_configs directory.

        Domain ID: A valid domain ID number.

        Assignment types:

        _ : No event configuration assigned

        e : Event configuration assigned in exclusive mode

	Initial group status:
	# cat /sys/fs/resctrl/mbm_L3_assignments
	mbm_total_bytes:0=e;1=e
	mbm_local_bytes:0=e;1=e

	To unassign the configuration of mbm_total_bytes on domain 0:
	#echo "mbm_total_bytes:0=_" > mbm_L3_assignments
	#cat mbm_L3_assignments
	mbm_total_bytes:0=_;1=e
	mbm_local_bytes:0=e;1=e

	To unassign the mbm_total_bytes configuration on all domains:
    	$echo "mbm_total_bytes:*=_" > mbm_L3_assignments
	$cat mbm_L3_assignments
	mbm_total_bytes:0=_;1=_
	mbm_local_bytes:0=e;1=e

	To assign the mbm_total_bytes configuration on all domains in exclusive mode:
    	$echo "mbm_total_bytes:*=e" > mbm_L3_assignments
	$cat mbm_L3_assignments
	mbm_total_bytes:0=e;1=e
	mbm_local_bytes:0=e;1=e

g. Read the events mbm_total_bytes and mbm_local_bytes of the default group.
   There is no change in reading the events with ABMC. If the event is unassigned
   when reading, then the read will come back as "Unassigned".
	
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	779247936
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes 
	765207488
	
h. Check the default event configurations.

	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
	local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
	local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all

	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
	local_reads, local_non_temporal_writes, local_reads_slow_memory

i. Change the event configuration for mbm_local_bytes.

	#echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
	/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter

	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
	local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads
	
        This will update the assignments where mbm_local_bytes are configured.
	
j. Now read the total event again. The first read may come back with "Unavailable"
   status. The subsequent read of mbm_total_bytes will display only the read events.
	
	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	Unavailable
	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	314101

k. Users will have the option to go back to 'default' mbm_assign_mode if required.
   This can be done using the following command. Note that switching the
   mbm_assign_mode will reset all the MBM counters of all resctrl groups.

	# echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	mbm_cntr_assign
	[default]
	
l. Unmount the resctrl
	 
	#umount /sys/fs/resctrl/
---
v12:
   This version is kind of RFC series with a new interface.
   
   Removed Reviewed-by tag on few patches when the patch has changed.

   Moved BMEC related patches (1 and 2) to beginning of the series.
   Removed the dependancy on BMEC to ABMC feature.

   Removed the un-necessary initialization of mon_config_info structure.
   Changed wrmsrl instead of wrmsr to address the below comment.
   https://lore.kernel.org/lkml/0fc8dbd4-07d8-40bd-8eec-402b48762807@zytor.com/

   Fixed the conflicts due to recent changes in rdt_resource data structure.
   Added new mbm_cfg_mask field to resctrl_mon.
   
   Added the code to reset arch state inside _resctrl_abmc_enable().

   Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
   This will be defined only in arm and not in x86.

   Changed the code to display the max supported monitoring counters in each domain.
   
   Fixed the struct mbm_cntr_cfg code documentation.
   Moved the struct mbm_cntr_cfg definition to resctrl/internal.h as suggested by James.

   Replaced seq_puts(s, ";") with seq_putc(s, ';');
   Added missing rdt_last_cmd_clear() in resctrl_available_mbm_cntrs_show().

   Added the check to reset the architecture-specific state only when assign is requested.

   Added evt_cfg as the parameter to resctrl_arch_config_cntr() as the user will
   be passing the event configuration from /info/L3_MON/event_configs/.

   Changed the check in resctrl_alloc_config_cntr() to reduce the indentation.
   Fixed the handling error on first failure while assigning.
   Added new parameter event configuration (evt_cfg) to get the event configuration from user space.

   Added tte support for reading ABMC counters. This is bit involved change and affects lots of code.

   New patch to support event configurations via new counter_configs method.

   Removed mbm_cntr_reset() as it is not required while removing the group.

   Added new patch to handle auto assign on group creation ("mbm_assign_on_mkdir")

   Added couple of patches add interface for "mbm_L3_assignments" on each mon group.

   Introduced mbm_cntr_free_all() and resctrl_reset_rmid_all() to clear counters and
   non-architectural states when monitor mode is changed.
   https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/

   Moved the resctrl_arch_mbm_cntr_assign_set_one to domain_add_cpu_mon().

   Patches 17, 18, 19, 20, 21, 23, 24 are completely new to address the new interface requirement.

v11:
   The commit 2937f9c361f7a ("x86/resctrl: Introduce resctrl_file_fflags_init() to initialize fflags")
   is already merged. Removed from the series.
   
   Resolved minor conflicts due to code displacement in latest code.
 
   Moved the monitoring related calls to monitor.c file when possible.
   Moved some of the changes from include/linux/resctrl.h to arch/x86/kernel/cpu/resctrl/internal.h
   as requested by Reinette. This changes will be moved back when arch and non code is separated.
   
   Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
   Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().

   Moved the mon_config_info structure definition to internal.h.
   Moved resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
   to monitor.c file.

   Moved resctrl_arch_assign_cntr() and resctrl_abmc_config_one_amd() to monitor.c.
   Added the code to reset the arch state in resctrl_arch_assign_cntr().
   Also removed resctrl_arch_reset_rmid() inside IPI as the counters are reset from the callers.

   Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
   Refactored the resctrl_assign_cntr_event().
   Added functionality to exit on the first error during assignment.
   Simplified mbm_cntr_free().
   Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
   figure out if the counter is assigned or not.
   
   Renamed rdtgroup_unassign_cntr_event() to resctrl_unassign_cntr_event().
   Refactored the resctrl_unassign_cntr_event().

   Moved mbm_cntr_reset() to monitor.c.
   Added code reset non-architectural state in mbm_cntr_reset().
   Added missing rdtgroup_unassign_cntrs() calls on failure path.

   Domain can be NULL with SNC support so moved the unassign check in rdtgroup_mondata_show().

   Renamed rdtgroup_mbm_assign_mode_write() to resctrl_mbm_assign_mode_write().
   Added more details in resctrl.rst about mbm_cntr_assign mode.
   Re-arranged the text in resctrl.rst file in section mbm_cntr_assign.

   Moved resctrl_arch_mbm_cntr_assign_set_one() to monitor.c

   Added non-arch RMID reset in mbm_config_write_domain().
   Removed resctrl_arch_reset_rmid() call in resctrl_abmc_config_one_amd(). Not required
   as reset of arch and non-arch rmid counters done from the callers. It simplies the IPI code.

   Fixed printing the separator after each domain while listing the group assignments.
   Renamed rdtgroup_mbm_assign_control_show to resctrl_mbm_assign_control_show().

   Fixed the static check warning with initializing dom_id in resctrl_process_flags()

   Added change log in each patch for specific changes.

v10:
   Major change is related to domain specific assignment.
   Added struct mbm_cntr_cfg inside mon domains. This will handle
   the domain specific assignments as discussed in below.
   https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
   I did not see the need to add cntr_id in mbm_state structure. Not used in the code.
   Following patches take care of these changes.
   Patch 12, 13, 15, 16, 17, 18.
   
   Added __init attribute to cache_alloc_hsw_probe(). Followed function
   prototype rules (preferred order is storage class before return type).
   
   Moved the mon_config_info structure definition to resctrl.h
   
   Added call resctrl_arch_reset_rmid() to reset the RMID in the domain inside IPI call
   resctrl_abmc_config_one_amd.
   
   SMP and non-SMP call support is not required in resctrl_arch_config_cntr with new
   domain specific assign approach/data structure.
   
   Assigned the counter before exposing the event files.
   Moved the call rdtgroup_assign_cntrs() inside mkdir_rdt_prepare_rmid_alloc().
   This is called both CNTR_MON and MON group creation.
   
   Call mbm_cntr_reset() when unmounted to clear all the assignments.
   
   Fixed the issue with finding the domain in multiple iterations in rdtgroup_process_flags().
   
   Printed full error message with domain information when assign fails.
   
   Taken care of other text comments in all the patches. Patch specific changes are in each patch.
   
   If I missed something please point me and it is not intentional.

v9:
   Patch 14 is a new addition. 
   Major change in patch 24.
   Moved the fix patch to address __init attribute to begining of the series.
   Fixed all the call sequences. Added additional Fixed tags.

   Added Reviewed-by where applicable.

   Took care of couple of minor merge conflicts with latest code.
   Re-ordered the MSR in couple of instances.
   Added available_mbm_cntrs (patch 14) to print the number of counter in a domain.

   Used MBM_EVENT_ARRAY_INDEX macro to get the event index.
   Introduced rdtgroup_cntr_id_init() to initialize the cntr_id

   Introduced new function resctrl_config_cntr to assign the counter, update
   the bitmap and reset the architectural state.
   Taken care of error handling(freeing the counter) when assignment fails.
  
   Changed rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs() to return void.
   Updated couple of rdtgroup_unassign_cntrs() calls properly.

   Fixed problem changing the mode to mbm_cntr_assign mode when it is
   not supported. Added extra checks to detect if systems supports it.
   
   https://lore.kernel.org/lkml/03b278b5-6c15-4d09-9ab7-3317e84a409e@intel.com/
   As discussed in the above comment, introduced resctrl_mon_event_config_set to
   handle IPI. But sending another IPI inside IPI causes problem. Kernel
   reports SMP warning. So, introduced resctrl_arch_update_cntr() to send the
   command directly.

   Fixed handling special case '//0=' and '//".
   Removed extra strstr() call in rdtgroup_mbm_assign_control_write().
   Added generic failure text when assignment operation fails.
   Corrected user documentation format texts.

v8:
  Patches are getting into final stages. 
  Couple of changes Patch 8, Patch 19 and Patch 23.
  Most of the other changes are related to rename and text message updates.

  Details are in each patch. Here is the summary.

  Added __init attribute to dom_data_init() in patch 8/25.
  Moved the mbm_cntrs_init() and mbm_cntrs_exit() functionality inside
  dom_data_init() and dom_data_exit() respectively.

  Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
  Renamed resctrl_arch_event_config_get() to resctrl_arch_mon_event_config_get().
          resctrl_arch_event_config_set() to resctrl_arch_mon_event_config_set().

  Rename resctrl_arch_assign_cntr to resctrl_arch_config_cntr.
  Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
  Added the code to return the error if rdtgroup_assign_cntr_event fails.
  Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
  Renamed rdtgroup_mbm_cntr_is_assigned to mbm_cntr_assigned_to_domain
  Added return error handling in resctrl_arch_config_cntr().
  Renamed rdtgroup_assign_grp to rdtgroup_assign_cntrs.
  Renamed rdtgroup_unassign_grp to rdtgroup_unassign_cntrs.
  Fixed the problem with unassigning the child MON groups of CTRL_MON group.
  Reset the internal counters after mbm_cntr_assign mode is changed.
  Renamed rdtgroup_mbm_cntr_reset() to mbm_cntr_reset()
  Renamed resctrl_arch_mbm_cntr_assign_configure to
            resctrl_arch_mbm_cntr_assign_set_one.

  Used the same IPI as event update to modify the assignment.
  Could not do the way we discussed in the thread.
  https://lore.kernel.org/lkml/f77737ac-d3f6-3e4b-3565-564f79c86ca8@amd.com/
  Needed to figure out event type to update the configuration.

  Moved unassign first and assign during the assign modification.
  Assign none "_" takes priority. Cannot be mixed with other flags.
  Updated the documentation and .rst file format. htmldoc looks ok.

v7:
   Major changes are related to FS and arch codes separation.
   Changed few interface names based on feedback.
   Here are the summary and each patch contains changes specific the patch.

   Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the bitmap.
   WARN_ON is not required anymore.
 
   Renamed the function resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

   Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
   and renamed to resctrl_arch_mbm_cntr_assign_set(). Passed the struct rdt_resource
   to these functions.

   Removed resctrl_arch_reset_rmid_all() from arch code. This will be done from FS the caller.

   Updated the descriptions/commit log in resctrl.rst to generic text. Removed ABMC references.
   Renamed mbm_mode to mbm_assign_mode.
   Renamed mbm_control to  mbm_assign_control.
   Introduced mutex lock in rdtgroup_mbm_mode_show().
 
   The 'legacy' mode is called 'default' mode. 

   Removed the static allocation and now allocating bitmap mbm_cntr_free_map dynamically.

   Merged rdtgroup_assign_cntr(), rdtgroup_alloc_cntr() into one.
   Merged rdtgroup_unassign_cntr(), rdtgroup_free_cntr() into one.
   
  Added struct rdt_resource to the interface functions resctrl_arch_assign_cntr ()
  and resctrl_arch_unassign_cntr().
  Rename rdtgroup_abmc_cfg() to resctrl_abmc_config_one_amd().
   
  Added a new patch to fix counter assignment on event config changes.

  Removed the references of ABMC from user interfaces.

  Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
  Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.

  Thomas Gleixner asked us to update  https://gitlab.com/x86-cpuid.org/x86-cpuid-db. 
  It needs internal approval. We are working on it.

v6:
  We still need to finalize few interface details on mbm_assign_mode and mbm_assign_control
  in case of ABMC and Soft-ABMC. We can continue the discussion with this series.

  Added support for domain-id '*' to update all the domains at once.
  Fixed assign interface to allocate the counter if counter is
  not assigned.   
  Fixed unassign interface to free the counter if the counter is not
  assigned in any of the domains.

  Renamed abmc_capable to mbm_cntr_assignable.

  Renamed abmc_enabled to mbm_cntr_assign_enabled.
  Used msr_set_bit and msr_clear_bit for msr updates.
  Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
  Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().

  Changed the display name from num_cntrs to num_mbm_cntrs.

  Removed the variable mbm_cntrs_free_map_len. This is not required.
  Removed the call mbm_cntrs_init() in arch code. This needs to be done at higher level.
  Used DECLARE_BITMAP to initialize mbm_cntrs_free_map.
  Removed unused config value definitions.

  Introduced mbm_cntr_map to track counters at domain level. With this
  we dont need to send MSR read to read the counter configuration.

  Separated all the counter id management to upper level in FS code.

  Added checks to detect "Unassigned" before reading the RMID.

  More details in each patch.

v5:
  Rebase changes (because of SNC support)

  Interface changes.
   /sys/fs/resctrl/mbm_assign to /sys/fs/resctrl/mbm_assign_mode.
   /sys/fs/resctrl/mbm_assign_control to /sys/fs/resctrl/mbm_assign_control.

  Added few arch specific routines.
  resctrl_arch_get_abmc_enabled.
  resctrl_arch_abmc_enable.
  resctrl_arch_abmc_disable.

  Few renames
   num_cntrs_free_map -> mbm_cntrs_free_map
   num_cntrs_init -> mbm_cntrs_init
   arch_domain_mbm_evt_config -> resctrl_arch_mbm_evt_config

  Introduced resctrl_arch_event_config_get and
    resctrl_arch_event_config_set() to update event configuration.

  Removed mon_state field mongroup. Added MON_CNTR_UNSET to initialize counters.

  Renamed ctr_id to cntr_id for the hardware counter.
 
  Report "Unassigned" in case the user attempts to read the events without assigning the counter.
  
  ABMC is enabled during the boot up. Can be enabled or disabled later.

  Fixed opcode and flags combination.
    '=_" is valid.
    "-_" amd "+_" is not valid.

 Added all the comments as far as I know. If I missed something, it is not intentional.

v4: 
  Main change is domain specific event assignment.
  Kept the ABMC feature as a default.
  Dynamcic switching between ABMC and mbm_legacy is still allowed.
  We are still not clear about mount option.
  Moved the monitoring related data in resctrl_mon structure from rdt_resource.
  Fixed the display of legacy and ABMC mode.
  Used bimap APIs when possible.
  Removed event configuration read from MSRs. We can use the
  internal saved data.(patch 12)
  Added more comments about L3_QOS_ABMC_CFG MSR.
  Added IPIs to read the assignment status for each domain (patch 18 and 19)
  More details in each patch.

v3:
   This series adds the support for global assignment mode discussed in
   the thread. https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
   Removed the individual assignment mode and included the global assignment interface.
   Added following interface files.
   a. /sys/fs/resctrl/info/L3_MON/mbm_assign
      Used for displaying the current assignment mode and switch between
      ABMC and legacy mode.
   b. /sys/fs/resctrl/info/L3_MON/mbm_assign_control
      Used for lising the groups assignment mode and modify the assignment states.
   c. Most of the changes are related to the new interface.
   d. Addressed the comments from Reinette, James and Peter.
   e. Hope I have addressed most of the major feedbacks discussed. If I missed
      something then it is not intentional. Please feel free to comment.
   f. Sending this as an RFC as per Reinette's comment. So, this is still open
      for discussion.

v2:
   a. Major change is the way ABMC is enabled. Earlier, user needed to remount
      with -o abmc to enable ABMC feature. Removed that option now.
      Now users can enable ABMC by "$echo 1 to /sys/fs/resctrl/info/L3_MON/mbm_assign_enable".
     
   b. Added new word 21 to x86/cpufeatures.h.

   c. Display unsupported if user attempts to read the events when ABMC is enabled
      and event is not assigned.

   d. Display monitor_state as "Unsupported" when ABMC is disabled.
  
   e. Text updates and rebase to latest tip tree (as of Jan 18).
 
   f. This series is still work in progress. I am yet to hear from ARM developers. 

--------------------------------------------------------------------------------------

Previous revisions:
v11: https://lore.kernel.org/lkml/cover.1737577229.git.babu.moger@amd.com/
v10: https://lore.kernel.org/lkml/cover.1734034524.git.babu.moger@amd.com/
v9: https://lore.kernel.org/lkml/cover.1730244116.git.babu.moger@amd.com/
v8: https://lore.kernel.org/lkml/cover.1728495588.git.babu.moger@amd.com/
v7: https://lore.kernel.org/lkml/cover.1725488488.git.babu.moger@amd.com/
v6: https://lore.kernel.org/lkml/cover.1722981659.git.babu.moger@amd.com/
v5: https://lore.kernel.org/lkml/cover.1720043311.git.babu.moger@amd.com/
v4: https://lore.kernel.org/lkml/cover.1716552602.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1711674410.git.babu.moger@amd.com/  
v2: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/

Babu Moger (26):
  x86/resctrl: Introduce mbm_total_cfg and mbm_local_cfg in struct
    rdt_hw_mon_domain
  x86/resctrl: Remove MSR reading of event configuration value
  x86/cpufeatures: Add support for Assignable Bandwidth Monitoring
    Counters (ABMC)
  x86/resctrl: Add ABMC feature in the command line options
  x86/resctrl: Consolidate monitoring related data from rdt_resource
  x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
  x86/resctrl: Add support to enable/disable AMD ABMC feature
  x86/resctrl: Introduce the interface to display monitor mode
  x86/resctrl: Introduce interface to display number of monitoring
    counters
  x86/resctrl: Introduce mbm_cntr_cfg to track assignable counters at
    domain
  x86/resctrl: Introduce interface to display number of free MBM
    counters
  x86/resctrl: Add data structures and definitions for ABMC assignment
  x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter
    with ABMC
  x86/resctrl: Add the functionality to assign MBM events
  x86/resctrl: Add the functionality to unassign MBM events
  x86/resctrl: Report 'Unassigned' for MBM events in mbm_cntr_assign
    mode
  x86/resctrl: Add the support for reading ABMC counters
  x86/resctrl: Add default MBM event configurations for mbm_cntr_assign
    mode
  x86/resctrl: Add event configuration directory under info/L3_MON/
  x86/resctrl: Provide interface to update the event configurations
  x86/resctrl: Introduce mbm_assign_on_mkdir to configure assignments
  x86/resctrl: Auto assign/unassign counters when mbm_cntr_assign is
    enabled
  x86/resctrl: Introduce mbm_L3_assignments to list assignments in a
    group
  x86/resctrl: Introduce the interface to modify assignments in a group
  x86/resctrl: Introduce the interface to switch between monitor modes
  x86/resctrl: Configure mbm_cntr_assign mode if supported

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/arch/x86/resctrl.rst            | 186 ++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   2 +
 arch/x86/kernel/cpu/resctrl/core.c            |  15 +-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  18 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  98 +++
 arch/x86/kernel/cpu/resctrl/monitor.c         | 456 +++++++++-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 809 ++++++++++++++++--
 arch/x86/kernel/cpu/scattered.c               |   1 +
 include/linux/resctrl.h                       |  72 +-
 include/linux/resctrl_types.h                 |  17 +
 13 files changed, 1559 insertions(+), 120 deletions(-)

-- 
2.34.1


