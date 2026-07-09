Return-Path: <linux-doc+bounces-96084-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UqIgC03+T2p9rgIAu9opvQ
	(envelope-from <linux-doc+bounces-96084-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 22:02:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B30477353CC
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 22:02:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="IS9prdJ/";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96084-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96084-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C99301AC3F
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A3A2EE611;
	Thu,  9 Jul 2026 20:02:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EB449981;
	Thu,  9 Jul 2026 20:02:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783627338; cv=fail; b=pol1O7RiGYpLncCMsEImSxY3bpdKMFbRpiRQI4Ir0gUG4FN6T17bvaV6l2GeypLoX4OAmDQH8+BaywWfKn+4O/W25PrDubRdsRpSYWV6uBmgLL/2algm9iWvoJvwxe5HVET0coFLzv1XNgG0A7FSb0kkrmvEpoeTCrvXnCO9BuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783627338; c=relaxed/simple;
	bh=HuMIyjVBDQU8G5rj+TvObIE83y4nNwxvMbbOOofvwSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EVQpJtCeCqeuLY/Xt9MkrrfP2lYLIKdAIrV88V/Pj6xOGhBQAlwrHe8ZFZcBXmj1VNzWCX0QWNzLeoA0AvAdJ+4muUeW3qKqWUdrJzduFiCVmjW/vgYZ6qgzoSr+xWIN86leyueF6+dUm0wkjdCbv84BDKA4q7wh29fcs9uJYdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IS9prdJ/; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISDfq1DmjnQDgRVF+ksIunukFU2fZotzyUTJV0DXFfOIDPKA38GwTnLZUQAy7yRn8/kQ1bR3tPN0MLjVHdl/ZvlfWx3zP3dxt/nVT6t0535S3W6pv3EiQglCUI0QC9vhmbewxAXDrXuifQEPyLvJVKGRs830ygCIbh5qhVJngZkqPwUEPnnUzVV66zDkImIdDKuDb59+7tn1UKKGQEhL/LjRhfVpBglhYkRb4zpOXfwtJauIsu5556F3Vw+rePQF/O7buRmw4aBqz79J3p3GmI5PgpKLGUacN544CKIUBVpeYo/DmSfLj+hFeP1DTL44AZCDkcc8SHf/z7U1HX79mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Etbtj4aCPQjWZMUKLSWdW3bHmz31C7euv0k+wFByEI=;
 b=dHe+iYQFAt07eD22caPgT8JwiGbD5xK+Qz/4t3LsIsm5TWe71/W1e5s6pQkXhFQqG6GKDAfjUyLHYpYbQPr4w9ajLOB74TFLLnIFvx5yNno7qVmLwZ3HQR6xI/5/KHeMosdvPFoRsCT3N7l0LJds7JOMApriJzpnEbUyA3rjC9fPQ2VnWZyqe8degHDZQ+wcnRe4Btz9he47mWobah+tU4DQpBT2tMJ9sEFEBps6Jloe1wqnC5+cn5fNE5ETgfHzlyJbu1oSLeXXo7hShFkcW8Tk6vsH+ceD4SCi2aIKoXqedoS95EWdHmCxiC+84SnrIOjVGjkSYN8OFc/8cbj86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Etbtj4aCPQjWZMUKLSWdW3bHmz31C7euv0k+wFByEI=;
 b=IS9prdJ/zSrYcB0O21VLPj0sQITL9XnbH+bWBPRBNBGz8pr81OyAN24cYjnxDECFvi469JfgvIOaVRrKQ7ZXEapIqzmtq+TJ2i7GTFK1TaJnjDxIFpBViXZY42DkpzT/AlTDT91MgOhFSFwmp2WG6qp2X2ixuFMqPCWiE2goanE=
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 20:01:59 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 20:01:58 +0000
Message-ID: <1c256f7c-effa-4ba5-9d1a-bcb510892458@amd.com>
Date: Thu, 9 Jul 2026 15:01:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 11/15] fs/resctrl: Program kernel-mode binding
 when CPU comes online
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
 <a8255414ef95dcb83b6eabbb210f45a17fec5c38.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <a8255414ef95dcb83b6eabbb210f45a17fec5c38.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::26) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: bebf408a-7cab-457d-c88d-08deddf4ef03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|56012099006|13003099007|3023799007|18002099003|22082099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	EI8cm6keA4BHmTP1/OjA7w8JSWNVyGqK/ZEYkmAZWp9pEuakm50KZ7LXz1hsl7i+26BRgQG6atA9dSgmX10566ofSiR3ZYTShyXvaFSNKT/yBNaMXjMKKXTNupmllODpLYvyhShz/3EPUjiBTGwe5CB5KL+Nk3z/LHDJPRCiurJb2ZzxMYqieciR99a9J2s1hf7ArcLEQF3FoOCG+qq/JSSvxCZixj7aHB8nFE6evUoepNa9oiuUdan1tJK7KNox+pnqPDdsJaVzR9OK5X9r8PGzjXsCwc+4DgYycaoQD33uy5WVaNDW9hNlnmE89SN1GoQje8fM4s0IXzuXJUmXPbJ3q44JFbJMTrdvcV6NyUGF4/sLLnPWB1qrgwbcp6b8bHyg8IX903SWWQSqzdOahRqdGfksnJbBeguMJX4HImVrfBgG89jkYlL145zViDcv/yiLRoIUgfHA/dH1sE2pvc1VCQQjV0j7ne/GniMQPmKRl64wtyeEfV86Gv1iM00dNSa0LxjaHr2HPiYxU4LS6aAVjgFzA0aKNfsYQtFXHsjLirjkXsJR0qSKyqhIwcBKKSnOLtScdY0lrlO8JQy4zf1ZTcfUcpdRexSo+ct/Elw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(56012099006)(13003099007)(3023799007)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEJMellrOXZlTzlsblVXQTYzR3hJSEJJTEZEZENuSDBES1RoNUhENTFrdHhh?=
 =?utf-8?B?MUs3Y2d1Vi9TUzZhcFU1Rkk4a1ZEblFoa2l6QTRMNEhNb3loOWNsRExoTUQw?=
 =?utf-8?B?UFFGU2NXMzZVbDFSbHZWc08yTGxVN1crWHQ0Q2Z4QTFUV1lLcjUvMzl3VXN5?=
 =?utf-8?B?QXRvaFlBNlRPMDQ5cXNNL0VZajhpMHlNeFRwRnh3a05FNHcvcW5RdythNUJU?=
 =?utf-8?B?Y0MvNE5CMHJXMkxkeE1XcVJtSXV2S1F4K0pyZTJOVnk0aEliakRMVDFERkov?=
 =?utf-8?B?UC9CWXh0bkkrMlB2NXBiVlFrTjhDemV1L01kRnEyUzNvRWw4NVAyd1crcUI4?=
 =?utf-8?B?RFNITWJ5c2pmQTdkWDVnZy9TUEV6OU1NWnBGUER2VXp6YkYvWVBKZDNBVWdI?=
 =?utf-8?B?TGZ4d2VuUDRBdGtxQmJvSStOTWpUUVQyRUp4L0txNGJVNWZJL0IxcFlGaDdm?=
 =?utf-8?B?NWowZWFJS2R2YURiSmlmaGJEMXhWWVNyR1NQNWM2dE5waDYxRE1hRU81cks5?=
 =?utf-8?B?QVpCS2ZvdDVkUk0zdjQwY25OWloxcCtyNWZtNFpiMWY4V3hZdWNiNnNocE1O?=
 =?utf-8?B?eXhmZWJGUUMxRUo5US9ycDNudUpMTUoxQkZGaVdDcE1HNDk1dW45ODVGbkd6?=
 =?utf-8?B?b0sveVV4SCtHT09zVk5qM1M1QWpteFJKQ0dielBtQmJhOCtrWkI5NlAra2xB?=
 =?utf-8?B?YTVLWVZ4by94cWt1QlVVeDlMS2piT2ZuN0dVbmVXUWVJNU9zU3czTUxDUDl3?=
 =?utf-8?B?b0NJd1FtTUF1Wml1Q3pIclQ4MitTempPQWdIVThXNHNtMU1EU0dtNVczdWpo?=
 =?utf-8?B?OGg2T212WGlab3VsTlhEL1BlM1dmYm00OU44WXREWmw3YmFzQ2ljOTJRNGFi?=
 =?utf-8?B?Ukdkd0xuUHkxQ1k5V2lNV1pjL1NoZWwyTFBrVUdlUC8zZjZkRk9DRE4yUkpo?=
 =?utf-8?B?TGdIbUtteXZOYlpKSEJPYkRWOUwyUW5pWStrdGVkOWFwVFovOXV1TlNidk1W?=
 =?utf-8?B?L1NZaGZNaDE4SGdEZjM5WnFYaDNrR2tpaitmN0JXWUdMak5qQlE4RG8wTlRG?=
 =?utf-8?B?bC9RMDNGa0pGZVFNK3hPNnZXcUhMT0M0YkgzUHVLaGdnUXVXdS82L2Nvc0Jv?=
 =?utf-8?B?TTdSS3BtdGtMZGxlVFFVeVlvVVBDWTY0dUQ0N21XTHpIR2RWOGN2T0c1dGMv?=
 =?utf-8?B?ZmZsWXBqNTlLckpxSHdFUzBtUDFxQzJQam9iVVVwS1VkcTJQd1p5bG41RGtq?=
 =?utf-8?B?Y3gvWmg5dUxoOEE1NDRXOWNtdkxXdDN0b3RSWWxuM1p3SUY0cFlGVnY4MWpE?=
 =?utf-8?B?cUdsMGJjNzlqeVZtTy94akxQZGhjRjJ2MHBHYkh2NFR4bThWb3FrVnAxN0Zq?=
 =?utf-8?B?cUw2YkFSc20zYzlKeXp4dHJON3FQRUhjOVNXQVZxWmorN2QzM082bHE5OHFK?=
 =?utf-8?B?UEZ3dmx1bnZEL1BvTElDV3VscnVaZDg3eEFnbUNBbC9pcmNrNGFvcTBpUUFC?=
 =?utf-8?B?YnUwL1BseUFoSTFnZEFqZTUyMXZXWkErU3JSazBTRFBTWlRmY0dFc3ZEWUZ3?=
 =?utf-8?B?SGZ2elltUkdkTGZ6d3JndXd2dnhZZERsTE96UFBwZlZLMFI4YlZ2cmpMWmZI?=
 =?utf-8?B?VlB3cll5Z0graEQ0N3hURjlzSEdwMVp5dDdnWncxQm1hNDJuVTluMnI3NGp0?=
 =?utf-8?B?YWsrZ2hwYkFBVEpqQXExU1lnTDdmN0ZONWY5TDg1Q2dIbGxDdzAyNTJ2MUV2?=
 =?utf-8?B?aW94b3BqZDExMmk1MzQybWs2ZUFpOEJCVVF3WTJlMmlUYVdIa2ZxOGh5aFds?=
 =?utf-8?B?SW1vWitnS2pGQnlMVFE4NVNYcVVYTXN0R1BTREdCSVVjUlM4RVg5WXhKV3Bz?=
 =?utf-8?B?cDVEU0xzQXB1NHZuclhaRG11MEg1dFVNL0E1enZwWE1nTUlCNVpJNWVuWVNy?=
 =?utf-8?B?Sy8rdmFVSUhDYUU4TERaaTd1Qzl2ZVJBdURjcDNqUjJzY0FNT0YxZzBIQzg3?=
 =?utf-8?B?SG5HQ0xPbzVoL0VocE9vY3ltRk5ZQzlLNzlaK2VLbzhmUnB5aGt5aW9jcjds?=
 =?utf-8?B?VWExaktOTmZKM3dFdVg0NFlWYWE2eFNqYUQ1bUMzOU5RUFNvNHFJMlBUV1k0?=
 =?utf-8?B?VDNyNDh6dWlORS9ZUnVSMlNNL29KUXZxdWx3WTZDcjA4N0dGbGsrck04dndv?=
 =?utf-8?B?YUJJYWJYdnN0OG5VRlhNdC9IaGdIZUtGOU5BL25yOS9Nai9FcnFmR1h3eUxl?=
 =?utf-8?B?VGRwVTdMQSsyYkl1dzhaNGxmSTRGZE12a0JHOVU5aERuOGkwR0RlaE9KQ0dU?=
 =?utf-8?Q?EOfPiqXy2fMXyeFD6q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebf408a-7cab-457d-c88d-08deddf4ef03
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:01:58.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LWuSyTSw1PfY4vO1ykzVMhJpg1Wa7AfA3ytVs9ZGeXz5+9x4NkMBXba2rSTDbAk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,amd.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96084-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[babu.moger@amd.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com,m:qinyuntan@linux.al
 ibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B30477353CC



On 7/7/26 16:50, Babu Moger wrote:
> Kernel-mode resctrl associations are programmed per CPU. When a
> global-assign kernel-mode policy is selected, all CPUs that are online at
> that time are configured; however, CPUs that come online later are not
> automatically updated.
> 
> As a result, hot-added CPUs, or CPUs that were offline when the policy was
> selected, can run without the active kernel-mode association even though
> the resctrl policy is still in effect.
> 
> Add resctrl_kmode_online_cpu() and call it from resctrl_online_cpu(). When
> a global-assign policy is active, add the newly online CPU to the bound
> group's kmode_cpu_mask and program the kernel-mode association on that CPU.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: New patch in the series. Patch taken from:
>      https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
>      Updated the code to enable kernel-mode by default whenever a CPU comes online when
>      one of global-assign mode is enabled.
> ---
>   fs/resctrl/rdtgroup.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 21659fd75850..413d3ff14546 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4722,11 +4722,40 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
>   	return err;
>   }
>   
> +/*
> + * resctrl_kmode_online_cpu() - Configure kernel-mode binding for a CPU that
> + *				comes online
> + * @cpu: CPU that has just been brought online.
> + *
> + * Kernel-mode associations are maintained per CPU. When a CPU becomes
> + * online after a global-assign policy has been applied, it is updated
> + * with the current kernel-mode configuration. The CPU is then added to
> + * the bound group's kmode_cpu_mask, and the appropriate association is
> + * programmed for it.
> + */
> +static void resctrl_kmode_online_cpu(unsigned int cpu)
> +{
> +	struct rdtgroup *rdtgrp = resctrl_kcfg.k_rdtgrp;
> +	bool assign_mon = false;
> +
> +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON || !rdtgrp)
> +		return;
> +
> +	assign_mon = (resctrl_kcfg.kmode_cur == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
> +
> +	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
> +
> +	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, rdtgrp->mon.rmid,
> +				     assign_mon, true);
> +}
> +
>   void resctrl_online_cpu(unsigned int cpu)
>   {
>   	mutex_lock(&rdtgroup_mutex);
>   	/* The CPU is set in default rdtgroup after online. */
>   	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
> +	/* Program any active kernel-mode binding on this CPU. */
> +	resctrl_kmode_online_cpu(cpu);
>   	mutex_unlock(&rdtgroup_mutex);
>   }
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=11

--- Patch [11]: [RESEND PATCH v4 11/15] fs/resctrl: Program kernel-mode 
binding when CPU comes online ---
commit ab44f1490e3dbe9a24a0baa6c7b98b7456c62c03
Author: Babu Moger <babu.moger@amd.com>
fs/resctrl: Program kernel-mode binding when CPU comes online
Kernel-mode resctrl associations are programmed per CPU. When a 
global-assign
kernel-mode policy is selected, all CPUs that are online at that time are
configured; however, CPUs that come online later are not automatically
updated.
Link: 
https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 21659fd75850e..413d3ff14546b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
[ ... ]
 > @@ -4722,11 +4722,40 @@ int resctrl_online_mon_domain(struct 
rdt_resource *r, struct rdt_domain_hdr *hdr
 >  	return err;
 >  }
 >
 > +/*
 > + * resctrl_kmode_online_cpu() - Configure kernel-mode binding for a 
CPU that
 > + *				comes online
 > + * @cpu: CPU that has just been brought online.
 > + *
 > + * Kernel-mode associations are maintained per CPU. When a CPU becomes
 > + * online after a global-assign policy has been applied, it is updated
 > + * with the current kernel-mode configuration. The CPU is then added to
 > + * the bound group's kmode_cpu_mask, and the appropriate association is
 > + * programmed for it.
 > + */
 > +static void resctrl_kmode_online_cpu(unsigned int cpu)
 > +{
 > +	struct rdtgroup *rdtgrp = resctrl_kcfg.k_rdtgrp;
 > +	bool assign_mon = false;
 > +
 > +	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON || !rdtgrp)
 > +		return;

If a CPU goes offline while a kernel-mode policy is active, and the 
policy is subsequently disabled (reverting to INHERIT_CTRL_AND_MON), 
does returning early here leave the newly onlined CPU with a stale 
kernel-mode resctrl association?

Looking at clear_closid_rmid(), it does not reset 
MSR_IA32_PQR_PLZA_ASSOC during CPU online initialization. Could this 
lead to the CPU executing CPL0 traffic with an invalid or malicious 
cache allocation if the stale CLOSID/RMID is reallocated?

--------------------------------------------------------------------

Yes. This is an issue.
Need to clear the kmode_cpu_list if the cpu being offlined is part of
the current kmode. Also, need to disable PLZA on the CPU that is offlined.

Will take care of this in resctrl_offline_cpu().

-------------------------------------------------------------------
 > +
 > +	assign_mon = (resctrl_kcfg.kmode_cur == 
GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
 > +
 > +	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);

Since the CPU is added to kmode_cpu_mask here when it comes online, 
shouldn't it be removed when it goes offline?
Looking at resctrl_offline_cpu(), it clears the CPU from rdtgrp->cpu_mask:
	if (cpumask_test_and_clear_cpu(cpu, &rdtgrp->cpu_mask)) {
		clear_childcpus(rdtgrp, cpu);
		break;
	}
But there is no corresponding logic to clear it from kmode_cpu_mask. 
Does this cause stale state to be exposed to userspace via the 
kmode_cpus file?

----------------------------------------------------------------------

Ditto: Will take care of this in resctrl_offline_cpu().

----------------------------------------------------------------------

Is it possible for a MON group that is actively bound to a kernel-mode 
policy to be reparented?

Looking at rdtgroup_rename(), it allows reparenting if cpu_mask is empty
without checking kmode_cpu_mask:
	if (!cpumask_empty(&rdtgrp->cpu_mask)) {
		ret = -EINVAL;
		goto out;
	}
Then mongrp_reparent() updates the closid but fails to reprogram PLZA 
MSRs for CPUs in kmode_cpu_mask:
	rdtgrp->mon.parent = new_prdtgrp;
	rdtgrp->closid = new_prdtgrp->closid;
	/* Propagate updated closid to all tasks in this group. */
	rdt_move_group_tasks(rdtgrp, rdtgrp, cpus);
	update_closid_rmid(cpus, NULL);

Does this leave CPUs in kmode_cpu_mask running with the old parent's 
CLOSID?

-----------------------------------------------------------------------

I don't see a reason to reparent the active kernel-mode group.

I'll add a check for:

if (!cpumask_empty(&rdtgrp->kmode_cpu_mask))

Thanks
Babu

