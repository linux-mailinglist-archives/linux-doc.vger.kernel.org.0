Return-Path: <linux-doc+bounces-95999-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Iw1LKhfAT2pDnwIAu9opvQ
	(envelope-from <linux-doc+bounces-95999-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:36:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C66732FE9
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EfAIeprg;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95999-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95999-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BF543002B51
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 15:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9B9364052;
	Thu,  9 Jul 2026 15:15:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013021.outbound.protection.outlook.com [40.93.196.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343A35E1BC;
	Thu,  9 Jul 2026 15:15:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610116; cv=fail; b=hrXbg87nk+sm4JoURPnm/rEFLP8RHiVrR5HQzERHugP17x2ItZ83CdATM1pYE/jB65+EEExZuxFx+31qsMcYHNi4faFGaEG/P74Vv3FH5M3lbP3Tpx5+U3SQ/h+PD88f9YpLgpPyXROe9znbfN9rgrI5/d9FRXTsvqUga+fNgxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610116; c=relaxed/simple;
	bh=1dyzi1BGeQ0Wb7bDAlznAQsUapkfXnt7oqc+Zy0WayI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ACX6y+MSeN6hy1+biTT61kFyWpxx0zMJkOBvx4dNqjmknIyWvxWBIrDJHAEsSARUFfrZWWcSq5Sx4A2RH6Z+F0GXXFeJVivP9iyTv+1y8amGW0qWRpEq0yaqnLizohxWS9yO29I8xPB5bLD6qX2hLbgOV9Ab3OJ3W1/nsqVsxo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EfAIeprg; arc=fail smtp.client-ip=40.93.196.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMXaHNgvmOw9qgoBWoVlMZID04T6wCKWxw1JZMnYZS3wuNEsjpGnLPROLNeeKSkmylOmS6ZUEkpKzq3W/uHuXXIB/X5x0Mr7Q1GkTUbyPIKCFnUMe4YVPIjzM8GI08yf6jRCWn0cP6OHtW967x/vxzQv1iegTU4F52ADiyr2g7eE2nGa1NFl1Rsmj9qGS3uo0A/odZ68H05XU8evqS0321uW4UKzIJp4Dz4KGm1irQ3oDCtAHgeHcvDr5c0ndzIiIhHxTFStieqx1Cw78Zi4UacvGf+SD5Pr74YroLcBqO5zzdb6rXKQnqbtZG7d4axR9jWoChdFStJGBhZje1w8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jceejj6O1NCYILj8l5t4lt/vYeGPZf+kRHBqpkc+lWY=;
 b=byXfjSztb8xOFQBHPUjfjubw6ZanBsdwcTAWdt/NA6hW7xAs+nVmvmWGv8G0L2B+OrxYxGGX/YbwnBCX3RDZBFskHgYIPkbJog5W0gw/c1Ov08mhkg9y8JFRXyew/EkgSYESxcHNK/3PIwlU+3eTUWXm1oZ6EiqldxW6BeKt0bw50xXlzcw5KsIvo9TbcU0bv3J3L3chVHpRWeOnsuFEe3grRroVG4ziaRwx4GkqVyxIQRs4KbQ03pih2N+O+9Rq/fw0wKTCQf4ee9NTXTVXIPMSc2nuGqvDkz7qhLoyf1aBDmg1oGcBxvkSmiLX7r0WqwNg1e4XaYCpam7+vqiDMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jceejj6O1NCYILj8l5t4lt/vYeGPZf+kRHBqpkc+lWY=;
 b=EfAIeprgyrZ//K1+vxpNsrmYf5Uu0UPUNkTdOPZZ20JdEA4tg4Uc3vpMjJlpT/XtdYY/S2nZRLUYJNkRmp91XTmpi4VStUHQvOKv/Q7u/Jbmu8BQRnp1gTIM/ufR/ljqX2QbWGuYrV17PqPHbIFYohkFLcPKPKYUtkwCudasY6Q=
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 15:15:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 15:15:05 +0000
Message-ID: <4f8e737d-d2bf-40d0-b93c-943510b3fd7f@amd.com>
Date: Thu, 9 Jul 2026 10:15:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 07/15] x86/resctrl: Expose the supported PLZA
 kernel-mode policies during init
To: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 ben.horgan@arm.com, fenghuay@nvidia.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com,
 seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
References: <cover.1783461016.git.babu.moger@amd.com>
 <09deaa2e58b5e83f748c50a6fae0f2480fe642f6.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <09deaa2e58b5e83f748c50a6fae0f2480fe642f6.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::31) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6bc756-3942-4fec-c5e7-08deddccdb28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|4143699003|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lf7ESXDz5+ap2HLztRFlGqqZ7Y2MWHcyy6S9zcDv+EqArDKzBKpkco48+ww+5A6NYdYQMns4LvUsnZvee9A0VJHi+JjRJyJ2fR5zrD0RHNUqsfwdlntmz7zJ5cdnZKTdnGN+TV/R9yLaeDhNNO3/zYglPBrul5qzDkSuURjEd9hC8h7dZlzEsR9Y4z8jjA70XpcUWlkjgB7IpN/p4YcyxEqLxu8jIBUxK8OAgsQcgTpOBTmcLqNegVe3wqhPL+lolfChmhbnz6Gf2YoEuTh3wJFfYkJaFKyPJo11kKq4O8fVfwUUx6CiPvXjmSuzERdD+qk5PJKBjntHxHg/aqNa75WzGzbOBiClo4nz+HNUPipaWtbbz3GeRHSVb9hObPyIvwemGYpn+sIJPLgQ7mEyHEX4qVE383W8KI9c4cq+3iuBlhVrqtBzINSyeqS1x5xS2QR4AGGxY/DlnhZKsAdEgJcCSFJCC8GRsXwIKzzpdsRCc6ZXP6GTepkeq3eiQ8jSi0xvmrjBWzarOtkLbtaHxy+xDMIv/T667jesYKouv0oWOcuWKOgIGf6hkgZN1gjeYZJC1cKbNHYJDokj04nx0RwkXIlxyBOH3cr9cZzWaos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENYeUMxOXJTQmtrZHdOZU12VnAzNnY5cVVtNXNiZ0k0NXI4V2NaRDVZWEdP?=
 =?utf-8?B?MG9xSytMQzVZaHg5MWo0TGFrOEJTdjBjT0R2VGRDKzd6emJLbkh1RG13ZlBV?=
 =?utf-8?B?Nmd1c3c2VDRycXU2UENrSldMMXo1R1Ezd3UwaVdBN0cvVERGeHVDeG9QbXBM?=
 =?utf-8?B?VWxvWlgwalQraU1pK0R1UjBBSEJRWjJxbVM1aURWY09ySkJKaEFGSXREK2ZM?=
 =?utf-8?B?eTVmVG9nQUh4N3J6OG9XeDlWNDE5ZFJrM1VYRFZwcVhIeFRRM1dqbTA4SGha?=
 =?utf-8?B?M0lwSncyR3RQdW5paStzbkJPc0FXMExNMk9FWTZvSi92MWRwTzU4RFBvbzg3?=
 =?utf-8?B?WkEvR3E5MlR2QjJOekxmVlc2di9nSEgwSlV1WWxNVHkxbkZjdXRYd1BiblEv?=
 =?utf-8?B?ZnVjZlRDQzFrTmRqQ2RkY0Y4UUpIMnYvTzNrRDhHZ3JET0dSbXVOWnc0VG9w?=
 =?utf-8?B?M05YRkVUblp0WlZyNU0zUFNBQWpwMWVLT3QwQmNrcFhkKzZrQ0N0YVF5YXlZ?=
 =?utf-8?B?b1c4YUwyT3JxbUNkbHRlaE1iY0ZIaW1oZEhSK1pzT0h0SHRnNmZWckVxRk9j?=
 =?utf-8?B?Ty9vQjA4M2xkQnl0VlJPNVpJUnM2dDBnNXp4MVNrcEVZa2FpN2gySXRaMkI0?=
 =?utf-8?B?MWxyejl1OHhoNXlnblROQ1ZLaUJ6Q0lKRGVhVXJDK3pvdzRzWnJlaVdmQmFo?=
 =?utf-8?B?MkNzdC8vc2FweTZLN0dyc01NRG93b3lqcEFDdEZVVm9rTEJwS2JsT1BGWkhS?=
 =?utf-8?B?ckRWMnB1NnRLUXdYUE5BVDFVeStUZ0MzS3lGU052dVpMT092dTFlR3FBNkJu?=
 =?utf-8?B?M01WVVg5VkhRbTFBN0RIT1dqenF2dzRpSFROLzBOcExIUElXTDlXNXFGN3ZJ?=
 =?utf-8?B?dW4wUTJ2SFBuL25nZm1ibG5BMU5DbG1jaVJNWkM0NFllYkRFcGpuU1JmdlpW?=
 =?utf-8?B?UzA4aUU0Q1VWWkhsb3dnWkM3MXZGdFp2WDhnNE1GVXFnMmZUUVJ2cmJIcTBF?=
 =?utf-8?B?SHVqbFB4WW43UnZpMzg3UkRpLzdBMUlvRkZlN0hWWEk5WXBsaXNUTi9sUzdx?=
 =?utf-8?B?bWg0ZGg3cFZvaUJIeHp2bW0rRmJ6alB2QWgzWThhME9iaEZ5cEtCVGhnNE9u?=
 =?utf-8?B?MXdpbzdxTWtQU21RbVAvUUFUaEEzQi9VSjd5TWN5VjJVcGhnVzBkci9URlFq?=
 =?utf-8?B?cW1ZVG52cjZ5VnNDT3R2UW1uZk9QN1NnR0pCOEtnUmdWOSs5SUJ3TS9yMVdL?=
 =?utf-8?B?WExrVEJRK2F6YnQwZlY0K2RWajlUUmdrSVIrcHJlTHptUVpVZkF3WU5Vb1VZ?=
 =?utf-8?B?clY4VCtXWWY4MmdLVDRQWnFGV1ZtaVo3UEk0R1B3QXB5dzJHY2dXVHE1TWU2?=
 =?utf-8?B?WmlHd1RHUk80c01LZENuZ254TU15Smx0c0NnQ2FOSFFCYU5iSWRITmpCbVll?=
 =?utf-8?B?Sm5tQ200ZXZEcjV1WGpRNFp6bzhMSkdwOXpOK25kZXkvaFVpQ2krRkhsWUtM?=
 =?utf-8?B?QmZUZlU4amJ4Z0txUUFoRnBHR2lvR1Z3emxVREVPT3J6T2t5alRZdStEK3dY?=
 =?utf-8?B?SXBuMU9PdUVDVTVZY1c3RmxQclNmV1FNYTNWRmtuVGdUZG1CMWplbU95RjYx?=
 =?utf-8?B?S014d3pqVzJQYy9ScFRsUHVqL2ZRaDR6QXJRMThPMUREclllNE9RcTVUQm1L?=
 =?utf-8?B?eE4rSjJEY0ZhVUVxVHk0RU1qWm5vbW53bEVTS2VZMWJHVG54S0JWNGQ4eVE3?=
 =?utf-8?B?S1FKUzczUEtqL2tuTnBCS0NMUmphNER3QVBjcisyRXgxMHJLcmFsRGhtWEpl?=
 =?utf-8?B?SXRrSDFiT2MxUEhDbUttVDIwZzc5VDdBSFRaZ2dpV0ZDL001RVoyaFZyY05U?=
 =?utf-8?B?VFBDTGlyY2RnRkIwYTMvbkJCQ042SWZKdERLb2ZhRkRkNWdoTVJVNVBRNW5C?=
 =?utf-8?B?SnFObFF1aENaanJCVlB0YkllK0IxWFRRVkRxaEVGclY5WDlPRHhSZVdLWFFG?=
 =?utf-8?B?TE03bjNkak1vRnNadGFRVFVLQUtPbkRycEdLc3pUbkdKaVhyZCszZHkzdDFP?=
 =?utf-8?B?WTJTT2RKd1hPZnRycVF2QW91NXk5MmJlVjRNK05xSFlHWk52UG1va0I2OEk2?=
 =?utf-8?B?RmZ1TGRCYjhPRko2V2FUNEpHRUdYOXF1eEdCZ3ZYUmxCaWtCZm5kQWpKWVV0?=
 =?utf-8?B?YUFiTHpEL0JPYVNZQ01JR0VGaVRjNC9mUnBXRDVrT2xHMlRNYk1kRUFEdjZp?=
 =?utf-8?B?d05Bc1czUzJGZUlqSzhnMS9iOVpNQ1MrZ3F5TjRXQXJSUHVyQUlqZm9RNmpa?=
 =?utf-8?Q?cm9vH+BQZfJejX/504?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6bc756-3942-4fec-c5e7-08deddccdb28
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:15:05.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2yC7zRUTvMWjUNnURRiGwNvAKOPFUIKLflE2ywEfyTN1s3hYWam8+kesqy2hOtY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,amd.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95999-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[babu.moger@amd.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com,m:qinyuntan@linux.al
 ibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[babu.moger@amd.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9C66732FE9



On 7/7/26 16:50, Babu Moger wrote:
> Generic resctrl exposes kernel-mode policy options via sysfs only after
> architectures indicate the set of supported policies using
> resctrl_set_kmode_support().
> 
> On AMD systems, Privilege Level Zero Association (PLZA) provides two
> global assignment modes:
> 
> - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assigns the resource allocation
>    for kernel work; but monitoring is inherited from the user task.
> - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assigns a dedicated resource
>    allocation and monitoring for kernel work.
> 
> Expose these modes during resource discovery when PLZA is available.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: New patch to set the supported features during arch init.
> ---
>   arch/x86/kernel/cpu/resctrl/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 27e09cded829..df7e19fe6007 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -962,6 +962,9 @@ static __init bool get_rdt_alloc_resources(void)
>   	if (get_slow_mem_config())
>   		ret = true;
>   
> +	if (ret && rdt_cpu_has(X86_FEATURE_PLZA))
> +		resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU);
> +
>   	return ret;
>   }
>   
> @@ -988,6 +991,9 @@ static __init bool get_rdt_mon_resources(void)
>   	if (!ret)
>   		return false;
>   
> +	if (rdt_cpu_has(X86_FEATURE_PLZA))
> +		resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +
>   	return !rdt_get_l3_mon_config(r);
>   }
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=7

--- Patch [7]: [RESEND PATCH v4 07/15] x86/resctrl: Expose the supported 
PLZA kernel-mode policies during init ---
commit 6d029d053cc0d67da93c0b4ae5419b85cfaeb5aa
Author: Babu Moger <babu.moger@amd.com>
x86/resctrl: Expose the supported PLZA kernel-mode policies during init
This commit updates the generic resctrl subsystem to expose PLZA
kernel-mode policies during resource discovery. When X86_FEATURE_PLZA
is present, it sets up support for GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU
and GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU policies.
 > diff --git a/arch/x86/kernel/cpu/resctrl/core.c 
b/arch/x86/kernel/cpu/resctrl/core.c
 > index 27e09cded8299..df7e19fe60078 100644
 > --- a/arch/x86/kernel/cpu/resctrl/core.c
 > +++ b/arch/x86/kernel/cpu/resctrl/core.c
[ ... ]
 > @@ -988,6 +991,9 @@ static __init bool get_rdt_mon_resources(void)
 >  	if (!ret)
 >  		return false;
 >
 > +	if (rdt_cpu_has(X86_FEATURE_PLZA))
 > +		resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
Is it possible for GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU to be advertised
here even if resource allocation features are disabled on the system?
Because this policy assigns a dedicated resource allocation for kernel work,
should this check verify rdt_alloc_capable before exposing the policy?
If allocation is disabled via kernel command-line parameters (like
rdt=!l3cat), but monitoring features are present, it seems like we might
expose an allocation-dependent policy to userspace incorrectly.
------------------------------------------------------------------------

PLZA is really meaningful when allocation is enabled. I think it would 
be better to check rdt_alloc_capable before enabling 
GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU. Will add the check.

if (rdt_alloc_capable && rdt_cpu_has(X86_FEATURE_PLZA)) 
resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);

Thanks
Babu



