Return-Path: <linux-doc+bounces-40626-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30CA5DFF2
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 16:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B82AB3A9060
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 15:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8912C24A064;
	Wed, 12 Mar 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IqSo6V9/"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7D1E5B7C;
	Wed, 12 Mar 2025 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792494; cv=fail; b=lwDERUWxSC4BpL+9Gcv25DU26GUWu46MxKH5kCsWAC7fGhGz3mAhsmAX1RpKswjIcmVdG/HdDW51Ul4eIO/g3+9xyYnpMKOISuxyaDZ12QPUoyXgY7dUJP26FOWWUd90p0jfY+YMLVlRrJfy5XirRdUkeWaYAXtDxPa67fdnhbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792494; c=relaxed/simple;
	bh=/KuWQXrvY2b9KApAwnRXVsqz/TUlMQDWv7BnAw63Ha8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FeHYQKtYkyX93GR1fzY8jB9qYaaysAkzBDgm4B4pCwzxTlA6DTtjYYuJxD6hRH581gw9fhnhCHUvpyam/XsFkHkAFnj0ME6IDGhA772Exru1/fnUI0HMhvkXYWNIFlddQwG+1ajib4+8E8NMZwRU7FghkuSmbThsCH9v78CC1jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IqSo6V9/; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pf7jgwKCYnVSpcTHEBV5ap+uWeGP5zhvJNo1A0Fk5OJA3PohRWRhl/MzdtnRyn96QRvs0IxjZVzMUmHJ7tAxUAH7Lqdd0wHcT2LYvC2u34/Iy6N7u5wALs5B4GuXiD9Uj3YWSGBLJJBM8V7kqBpaWZR1sZ8zN7LLmIC7z53Uj46+N3QeUyr3nA/McplRBNGM7C7/O3iE9oxWCB6U7CkbbsejCMMZUKDX0kVo68VpnnfG0C7b0FERu20Xe6p17mTtHTyw/ToSkuV8r4UlWHWyD7GYGUTqK5itbxE+7w2ppssyAYD4yJWJUfjW4gx5VwBWLnXzVKHmN2zFUDJRL1USUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84A19ZRvUGH0GOUHnUuENI8Bfxm6LadYa4QQK4+tGnQ=;
 b=T4Sdh6hPgW1a0WA/iIs1qFQ54d0p0oSMekreA5/qeqahfnV6CBPP/bDN/hukkiTYECNyZR1gKgsAVgPso1cN+aBAwQhuyUVITClg5qhdCMqDfyLmV98YTWmuN417XKLZ7vK9f52mKvG3sO0byIWMJWQ1MKQkr/PNA/gF4MF30JLcaFeMriHkZXdGsrK30lQqDyP5BaGvIKdZ5af3oBnHsmPEBJ9QQO1Y6we4Q0yrh6fnGGycbPvm59X8CqEWLvfj5MxYOlVuBd9HYq8BPZK42wqs01Bm2SaSKGX5y3h4gweG9Z8XlEr0khVg9Nb6ojKB0wEXTBIJSo5e8yKmyszzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84A19ZRvUGH0GOUHnUuENI8Bfxm6LadYa4QQK4+tGnQ=;
 b=IqSo6V9/2D8W7LFJe0lynTXPBEbGFTRVjuWH+CwYSdEOnHA8fk9pgGuy509vRmD2ZGgIl13ySIl685zbXUs6xschA+scQ5UwjRoHA0rU2M+uL9pxjkCUZYqNrS/8vwaTArtPThY9aneUpuIekyV9OEnpgvwJSMa4U1FtstmHuXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:14:47 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:14:46 +0000
Message-ID: <40e5b14d-ea4f-4b9a-89a7-2e6e0c4ed1d0@amd.com>
Date: Wed, 12 Mar 2025 10:14:40 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 00/23] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, Peter Newman <peternewman@google.com>,
 Dave Martin <Dave.Martin@arm.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org,
 thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com,
 pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com,
 xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com,
 mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <f1744c45-9edf-4012-89bc-47393b4c53fc@amd.com>
 <CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com>
 <d1ca9220-1ab7-4a39-819a-03a6069b7ac4@amd.com>
 <CALPaoChLL8p49eANYgQ0dJiFs7G=223fGae+LJyx3DwEhNeR8A@mail.gmail.com>
 <a4ab53b5-03be-4299-8853-e86270d46f2e@amd.com>
 <c1c0a99a-a467-4ae6-80ee-04b6a9cdb6e5@amd.com>
 <Z890Q2GoP6GecwW4@agluck-desk3>
 <04e47d0e-6447-451e-98e4-7ea65187d370@amd.com>
 <6508cf67-3263-432e-892c-9b502b3c6cd4@intel.com>
 <f8a20ed8-6e30-4cff-a96b-8df89a605081@amd.com>
 <Z9CiwLrhuTODruCj@agluck-desk3>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <Z9CiwLrhuTODruCj@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QR2P297CA0001.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:6a::19) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: e2989392-104f-4a85-75bd-08dd61789ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWhTdEpBLzJhRUROOHpaNjREMEE2WU1OdWlvRDhRSGMwTmVlTG11Y00zd1J3?=
 =?utf-8?B?eDFub05XZ0c0TjhyZUZGNnl0ZWNldzg3cTFoME4vNXF3R3lUUytYVFB3b09o?=
 =?utf-8?B?OFlrOHFRUDhYRXRKU0hUeUJGVkFESnFIRHYzbUVaVlBJelVvNTJEUnQwU1RH?=
 =?utf-8?B?ZlBtdWphWEkvUkJTTkJ2UkFLNmdFMDdnandNVmYrVWQ4c083Wm9CL1Zqakl2?=
 =?utf-8?B?ckt0NVRvb3NSWFBKelhvdTVkZWxYUlZvekZHY3k4QmZBOGV5Y2xUWHhRQnVt?=
 =?utf-8?B?dkpRdTh1MzZTWW5DOGUyZStEUU1uZHdYSlowSU93aTNlTE1vMUlNVjFoQy9r?=
 =?utf-8?B?RjNDaUxyK0lyVnFCN3JCbVpvN3Rjdm9rdFVyYjZZU2RHUGZNZWl2UzdoZXNM?=
 =?utf-8?B?V0lRZ1N3S3BtdzVHSnZTSGI3VFc3RnNaOGxxcEpDdmRLOTJ4YkFpeHRqTnVs?=
 =?utf-8?B?OWw0Q1JyNkl5VGhYWWxlWnJTd3dPUE9MM2JsQ1BoakZ1bXMrUkk0S1I3eEM5?=
 =?utf-8?B?RUpiN0JjWXRrMUNGNGpVcVVJM1ZoMUtMc0xNWDdVVUlDRjd5N2dQWkZQR21z?=
 =?utf-8?B?S1ZzcWFxVS9BMWFJMTJ4SG5HRzFzTWVyQ2M2Ulo2Y3J0MkFLRzdndmt4VGJX?=
 =?utf-8?B?NFRXUm1wbGhyWHB3Y1RQRytzZkVLZCtYNlhtUWtaTEkxT05sLzdDRjFxbnlp?=
 =?utf-8?B?cjFTbHdUb2VxNjZBcytMb0hDYkgvOWwwKzk4Nmg4RmhrSjAvUll5MGtPbmc1?=
 =?utf-8?B?ZUMvc3BTVjhXZkRoRFptNjZON3V0NjhhMElYWko4Mkl1RlZsais2K282aUZa?=
 =?utf-8?B?NEVRZUpMZC9oM1pwdEZKSXNaTFhCb0E5M1VTSDNDUXJKalpjSUlFSkR0UW0r?=
 =?utf-8?B?ZXFuSzg2aUZpV2VLbjRqMEdmQXBVbTZuVXY4NHVlUmpweCsyankvWGUwZzQz?=
 =?utf-8?B?TmU0OG9TdU5KK0dHS055VHJMc1ZGeUs0a1JBQ0kxckRuQkhiT1BrN0M4TnBJ?=
 =?utf-8?B?NTlmZ21nd3ExK3lpTG4vbnVyd1gvVlhSelJPd2RlZmoxTFdDNWhTRHA3TUVZ?=
 =?utf-8?B?d1p2cC9EWnZ3cC9IMzRyT1R5RlhkUW1vUUJFOHdrT0JjMHdrY2FXVE9QLzhw?=
 =?utf-8?B?R3dPNDVxN1R0Z3FOL2N1MzVaeEVzUlAzcStaT0pkYXp0cmdJVHhPMlQ3eXBQ?=
 =?utf-8?B?S0I4eUtiWnk0c3VMVnZGdXFxNStHOWJSc0VHOGxmb05sRmZwZHM1akwzUFg4?=
 =?utf-8?B?L2JEVHNxOTliQVlWdHlKY25ibjN1VTJBQW9UME5sTXUyL1luUWZqMzMyTUc0?=
 =?utf-8?B?V0xKTEUzZytnajdWb09nNk9wd0FLOUhkMmVyRkZXWSt0YWZPSmw0WldzRmpl?=
 =?utf-8?B?VlI3T3JUb1lKL1hBVHZNeWdOdkJhQ1dya3hoN09pTXlEbHFJUnArMmY1QVU3?=
 =?utf-8?B?Y0tPZ2lSNmxhekduc1ZXMDZxLzlWZUpSVEVUeDhXaVdhbEZuazB0VzdPbGFh?=
 =?utf-8?B?MHNDRU9hKzA0U0hNR24vRzd1RzRhR29DeU1iZTRydkwvdWh5cmoxd2dCTGcr?=
 =?utf-8?B?OXVKRlp4RHB3U0hUVWFWNFdMZE1vNTY3T0haQjdhZjJVYVhnVWNhOUV3Uml3?=
 =?utf-8?B?VG94azBMWGJ5TGNFeUxFcWRCaDlNRzNRdkwxald3STFkNEpRTWNjVmN0WDBL?=
 =?utf-8?B?dVZNV2tQZldFWFRFZFJVTEpnRlNLTzB0RG83dWdWbG5EQTg1ZTZJVXA4WW9I?=
 =?utf-8?B?WjRpNjI5SEd5YS9jSEhObHlRVEtJNTFnZlpYd3pieEhLRExqYThnMFEzaHVT?=
 =?utf-8?B?bDl0dGVFWmNmSHRJaEhmdStXTy9tRXl4cXh3UitGOEt4NWF5NGc0N3dTbXVN?=
 =?utf-8?B?aS9CR3R2clMzNVJkQm9NeFAwL1dXUEZTYWNVczdrcUVqeHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkY0eWxsdUJqalErbkJQMThWN2JwZTA2V21EdmZKamwzazYrOGdLTUFRUXYz?=
 =?utf-8?B?WmxYb0tZbXlXZlFVM0dkVnFUSUVGN3ZMV3UzOGlHZXdKZFhNbDNsR1VpZ0My?=
 =?utf-8?B?UDFVNnNmT29CclBDekZNT0oreUUwT0ZPT001dmNwajJnQll5dVBaL2VVUDN3?=
 =?utf-8?B?WkJBL1owbkdJSVcrTXNuc1VnbkVIZC9qUFZuMURveWNBNWdGSHkwTUpua3h5?=
 =?utf-8?B?bGxnVFdKdTV0UzJKa2x3TkM4cTRyQXZocVlkOVRMU3NZcG5HUHpVcEdsaG1Z?=
 =?utf-8?B?Q0NkL0NpRjV5VG56dHQ0bEcxVXI1enhZcUNORkxPblA0V1IvVjZVWWZQalpi?=
 =?utf-8?B?aXpVTXVOalBtQmxRUGJ2MWxJaTdtNTUyd3p0Rm4xeDBJSWd6cE5yN2p0RENm?=
 =?utf-8?B?MXdYZlBXSGdydTNQVjQ5dFNTY0JDeHpURDcwdWtMcWowZXBZS0dPNFNxQVMv?=
 =?utf-8?B?WUZkazZhNGt1SXZ1b3dyR1BPbnVBWFI4NTRtL3hiT1kyU3pDRDhORGVaMnlx?=
 =?utf-8?B?NWxTVmNzMEZjdGEva1RhcFZoOStnazdZemtUdkx0Tkt5OUZRdnpLaG5lWWpt?=
 =?utf-8?B?eUVoZHRJQmlkbmg5L0pMSU9Oc3Bmdndlb211RW8veW5iSG9Ja3Azc0l6MzFm?=
 =?utf-8?B?RFltakJSZk1lS1NLcCtkQ2N6SHc4cStMVlBUZXdVRzViOWw3MVZxUHlSbnhX?=
 =?utf-8?B?VFFOOUNpT2Fsa0hqWU1XRlpzYVJGK2paa2VlRnhOZ3RXaElycDIrZFJ2RFUx?=
 =?utf-8?B?MjJNL1YvU3J4MUlBZk93ck5wNW1xNTZZcVk5VTI3bWlzMDV3L3ZMbVVNZXd2?=
 =?utf-8?B?NG4zcG8wemV5Y0JuMWZDNGsxMUhvWjVwcGZvekNGZ0FHaTFIOG42ZDZLQ0Yw?=
 =?utf-8?B?YmJjY3RDRlBVSTF6SitteVBMcDZzZ2FJcVJ0WXZQUGtWSm1jN0tGd0NvWmRR?=
 =?utf-8?B?WEQ1T0dLSUVBV2ZzMURTN1NFd3pJbTZFNVF0MDduSVRIYkhQeTVYM3BzZjRw?=
 =?utf-8?B?MVZMUm1YdC9MZXdjRXNhYUF5UVpjdWZwRXM2aTJINTVGeUhBSlRCeVZZdisw?=
 =?utf-8?B?TC90aGxRZm5BRW55M2x6RHNuM0tCUHF5bGNtcVdkWThxSDJHbHp3YnYrWTRx?=
 =?utf-8?B?OEh6S04xZFNIUnNudzNtZzEvT0dSMzNCbW9lVFllN3Awam5Sa1oyNVhwUFpk?=
 =?utf-8?B?N0ZvVWM5bUJzN2J6bWZiVzVUZldYTVQ0T1ViMm1MQUdwTXk1U3BDbnNkOUhx?=
 =?utf-8?B?VGdPa2lvWXRGMERYWnYzY3lvRVkzUGt6MkwvSkxzUUZSaURCQk1jSXduMi9M?=
 =?utf-8?B?ZDFKVGdXWGs5MnY2a2xyYUNmQ0k0VGoraUMzK21oeFE5MkRWYUFVd3lNbGEv?=
 =?utf-8?B?YVEyRmIzLzZlOFhsM2JOTGRpUkJDOXVqUzNQdUVpY0gvOEh5SVFFYWhLRXVp?=
 =?utf-8?B?a1FWTElLMmRpUEdyQTY0dFNUV3VqK2M4dVVlM2tybFI4QUo1S3N4ZFErc2Nm?=
 =?utf-8?B?cHR6UW1OcE5tcGRTNFl0NVJPM2YvU0R0UE52WlJ6OERGaXMxbmMyeXp5RHhG?=
 =?utf-8?B?RWpQVm9xR3RFN3hQY3k2dW5zSzgxOXZDczJqZ0VjUENpd3lVT3Vja2N6RTJi?=
 =?utf-8?B?SGhrc3o4Z205TDBKbkFsT0s1RjNab1pPbDFuWVJYaGNSRzBUTlhnR2JxMmtS?=
 =?utf-8?B?czhyZ09ZL0diTmdVUi9yNzBIZFRMazhtek5kaE11SEp2RHF2NEwxeWpXbjhB?=
 =?utf-8?B?VE5FcUt2Z2EwOWx2MklESzVvVVJMUFdSM1NsOHNTeDB3d2NWZHVKb2Ixdm1G?=
 =?utf-8?B?Y0s0cUtlNnNjbXpaK3oyTTZWSUduRURJVmxHeWM3ZGsrOWhuVm1SNGVHTW9z?=
 =?utf-8?B?Z2p3dXZ1VmJkQytaSU9VZDA4c3NkQkFvU2k1MGI4ellhUjUrYktlVEVZS1FM?=
 =?utf-8?B?TVpzL2lOR3dIUHZvbVZoTUhVZTZBV0tyV1dDYWp4S2ZteExYK2txV2tSQ2hW?=
 =?utf-8?B?MWZ5RU96dVN5VzdHQVFqVkFvb2g4Y3dKbjdtK09RMjNZcy80WWRyUEhGdlV0?=
 =?utf-8?B?VGkvTXBaTVgrTzlyUDI3TTcrdTc3U25SYVVpZmFvZHRoYmVXNDNqb2pYSE1E?=
 =?utf-8?Q?UC1Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2989392-104f-4a85-75bd-08dd61789ffc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:14:46.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2/CHV3gCuUCTfv2B4Z/ht3zCUrg8A4Jo5DxgIbrS8nO2grDg44IX7nvE/wvELuP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

Hi Tony,

On 3/11/25 15:53, Luck, Tony wrote:
> On Tue, Mar 11, 2025 at 03:35:28PM -0500, Moger, Babu wrote:
>> Hi All,
>>
>> On 3/10/25 22:51, Reinette Chatre wrote:
>>>
>>>
>>> On 3/10/25 6:44 PM, Moger, Babu wrote:
>>>> Hi Tony,
>>>>
>>>> On 3/10/2025 6:22 PM, Luck, Tony wrote:
>>>>> On Mon, Mar 10, 2025 at 05:48:44PM -0500, Moger, Babu wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> On 3/5/2025 1:34 PM, Moger, Babu wrote:
>>>>>>> Hi Peter,
>>>>>>>
>>>>>>> On 3/5/25 04:40, Peter Newman wrote:
>>>>>>>> Hi Babu,
>>>>>>>>
>>>>>>>> On Tue, Mar 4, 2025 at 10:49 PM Moger, Babu <babu.moger@amd.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Peter,
>>>>>>>>>
>>>>>>>>> On 3/4/25 10:44, Peter Newman wrote:
>>>>>>>>>> On Mon, Mar 3, 2025 at 8:16 PM Moger, Babu <babu.moger@amd.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Peter/Reinette,
>>>>>>>>>>>
>>>>>>>>>>> On 2/26/25 07:27, Peter Newman wrote:
>>>>>>>>>>>> Hi Babu,
>>>>>>>>>>>>
>>>>>>>>>>>> On Tue, Feb 25, 2025 at 10:31 PM Moger, Babu <babu.moger@amd.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Peter,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 2/25/25 11:11, Peter Newman wrote:
>>>>>>>>>>>>>> Hi Reinette,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On Fri, Feb 21, 2025 at 11:43 PM Reinette Chatre
>>>>>>>>>>>>>> <reinette.chatre@intel.com> wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Hi Peter,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 2/21/25 5:12 AM, Peter Newman wrote:
>>>>>>>>>>>>>>>> On Thu, Feb 20, 2025 at 7:36 PM Reinette Chatre
>>>>>>>>>>>>>>>> <reinette.chatre@intel.com> wrote:
>>>>>>>>>>>>>>>>> On 2/20/25 6:53 AM, Peter Newman wrote:
>>>>>>>>>>>>>>>>>> On Wed, Feb 19, 2025 at 7:21 PM Reinette Chatre
>>>>>>>>>>>>>>>>>> <reinette.chatre@intel.com> wrote:
>>>>>>>>>>>>>>>>>>> On 2/19/25 3:28 AM, Peter Newman wrote:
>>>>>>>>>>>>>>>>>>>> On Tue, Feb 18, 2025 at 6:50 PM Reinette Chatre
>>>>>>>>>>>>>>>>>>>> <reinette.chatre@intel.com> wrote:
>>>>>>>>>>>>>>>>>>>>> On 2/17/25 2:26 AM, Peter Newman wrote:
>>>>>>>>>>>>>>>>>>>>>> On Fri, Feb 14, 2025 at 8:18 PM Reinette Chatre
>>>>>>>>>>>>>>>>>>>>>> <reinette.chatre@intel.com> wrote:
>>>>>>>>>>>>>>>>>>>>>>> On 2/14/25 10:31 AM, Moger, Babu wrote:
>>>>>>>>>>>>>>>>>>>>>>>> On 2/14/2025 12:26 AM, Reinette Chatre wrote:
>>>>>>>>>>>>>>>>>>>>>>>>> On 2/13/25 9:37 AM, Dave Martin wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>> On Wed, Feb 12, 2025 at 03:33:31PM -0800, Reinette Chatre wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>> On 2/12/25 9:46 AM, Dave Martin wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>> On Wed, Jan 22, 2025 at 02:20:08PM -0600, Babu Moger wrote:
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> (quoting relevant parts with goal to focus discussion on new possible syntax)
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> I see the support for MPAM events distinct from the support of assignable counters.
>>>>>>>>>>>>>>>>>>>>>>>>>>> Once the MPAM events are sorted, I think that they can be assigned with existing interface.
>>>>>>>>>>>>>>>>>>>>>>>>>>> Please help me understand if you see it differently.
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> Doing so would need to come up with alphabetical letters for these events,
>>>>>>>>>>>>>>>>>>>>>>>>>>> which seems to be needed for your proposal also? If we use possible flags of:
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> mbm_local_read_bytes a
>>>>>>>>>>>>>>>>>>>>>>>>>>> mbm_local_write_bytes b
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> Then mbm_assign_control can be used as:
>>>>>>>>>>>>>>>>>>>>>>>>>>> # echo '//0=ab;1=b' >/sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>>>>>>>>>>>>>>>>>>>>>> # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_read_bytes
>>>>>>>>>>>>>>>>>>>>>>>>>>> <value>
>>>>>>>>>>>>>>>>>>>>>>>>>>> # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>>>>>>>>>>>>>>>>>>>>>>>>>>> <sum of mbm_local_read_bytes and mbm_local_write_bytes>
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> One issue would be when resctrl needs to support more than 26 events (no more flags available),
>>>>>>>>>>>>>>>>>>>>>>>>>>> assuming that upper case would be used for "shared" counters (unless this interface is defined
>>>>>>>>>>>>>>>>>>>>>>>>>>> differently and only few uppercase letters used for it). Would this be too low of a limit?
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> As mentioned above, one possible issue with existing interface is that
>>>>>>>>>>>>>>>>>>>>>>> it is limited to 26 events (assuming only lower case letters are used). The limit
>>>>>>>>>>>>>>>>>>>>>>> is low enough to be of concern.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> The events which can be monitored by a single counter on ABMC and MPAM
>>>>>>>>>>>>>>>>>>>>>> so far are combinable, so 26 counters per group today means it limits
>>>>>>>>>>>>>>>>>>>>>> breaking down MBM traffic for each group 26 ways. If a user complained
>>>>>>>>>>>>>>>>>>>>>> that a 26-way breakdown of a group's MBM traffic was limiting their
>>>>>>>>>>>>>>>>>>>>>> investigation, I would question whether they know what they're looking
>>>>>>>>>>>>>>>>>>>>>> for.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> The key here is "so far" as well as the focus on MBM only.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> It is impossible for me to predict what we will see in a couple of years
>>>>>>>>>>>>>>>>>>>>> from Intel RDT, AMD PQoS, and Arm MPAM that now all rely on resctrl interface
>>>>>>>>>>>>>>>>>>>>> to support their users. Just looking at the Intel RDT spec the event register
>>>>>>>>>>>>>>>>>>>>> has space for 32 events for each "CPU agent" resource. That does not take into
>>>>>>>>>>>>>>>>>>>>> account the "non-CPU agents" that are enumerated via ACPI. Tony already mentioned
>>>>>>>>>>>>>>>>>>>>> that he is working on patches [1] that will add new events and shared the idea
>>>>>>>>>>>>>>>>>>>>> that we may be trending to support "perf" like events associated with RMID. I
>>>>>>>>>>>>>>>>>>>>> expect AMD PQoS and Arm MPAM to provide related enhancements to support their
>>>>>>>>>>>>>>>>>>>>> customers.
>>>>>>>>>>>>>>>>>>>>> This all makes me think that resctrl should be ready to support more events than 26.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> I was thinking of the letters as representing a reusable, user-defined
>>>>>>>>>>>>>>>>>>>> event-set for applying to a single counter rather than as individual
>>>>>>>>>>>>>>>>>>>> events, since MPAM and ABMC allow us to choose the set of events each
>>>>>>>>>>>>>>>>>>>> one counts. Wherever we define the letters, we could use more symbolic
>>>>>>>>>>>>>>>>>>>> event names.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Thank you for clarifying.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> In the letters as events model, choosing the events assigned to a
>>>>>>>>>>>>>>>>>>>> group wouldn't be enough information, since we would want to control
>>>>>>>>>>>>>>>>>>>> which events should share a counter and which should be counted by
>>>>>>>>>>>>>>>>>>>> separate counters. I think the amount of information that would need
>>>>>>>>>>>>>>>>>>>> to be encoded into mbm_assign_control to represent the level of
>>>>>>>>>>>>>>>>>>>> configurability supported by hardware would quickly get out of hand.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Maybe as an example, one counter for all reads, one counter for all
>>>>>>>>>>>>>>>>>>>> writes in ABMC would look like...
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> (L3_QOS_ABMC_CFG.BwType field names below)
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> (per domain)
>>>>>>>>>>>>>>>>>>>> group 0:
>>>>>>>>>>>>>>>>>>>>    counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>>>>    counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>>>> group 1:
>>>>>>>>>>>>>>>>>>>>    counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>>>>    counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>>>> ...
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I think this may also be what Dave was heading towards in [2] but in that
>>>>>>>>>>>>>>>>>>> example and above the counter configuration appears to be global. You do mention
>>>>>>>>>>>>>>>>>>> "configurability supported by hardware" so I wonder if per-domain counter
>>>>>>>>>>>>>>>>>>> configuration is a requirement?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> If it's global and we want a particular group to be watched by more
>>>>>>>>>>>>>>>>>> counters, I wouldn't want this to result in allocating more counters
>>>>>>>>>>>>>>>>>> for that group in all domains, or allocating counters in domains where
>>>>>>>>>>>>>>>>>> they're not needed. I want to encourage my users to avoid allocating
>>>>>>>>>>>>>>>>>> monitoring resources in domains where a job is not allowed to run so
>>>>>>>>>>>>>>>>>> there's less pressure on the counters.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> In Dave's proposal it looks like global configuration means
>>>>>>>>>>>>>>>>>> globally-defined "named counter configurations", which works because
>>>>>>>>>>>>>>>>>> it's really per-domain assignment of the configurations to however
>>>>>>>>>>>>>>>>>> many counters the group needs in each domain.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I think I am becoming lost. Would a global configuration not break your
>>>>>>>>>>>>>>>>> view of "event-set applied to a single counter"? If a counter is configured
>>>>>>>>>>>>>>>>> globally then it would not make it possible to support the full configurability
>>>>>>>>>>>>>>>>> of the hardware.
>>>>>>>>>>>>>>>>> Before I add more confusion, let me try with an example that builds on your
>>>>>>>>>>>>>>>>> earlier example copied below:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> (per domain)
>>>>>>>>>>>>>>>>>>>> group 0:
>>>>>>>>>>>>>>>>>>>>    counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>>>>    counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>>>> group 1:
>>>>>>>>>>>>>>>>>>>>    counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>>>>    counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>>>> ...
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Since the above states "per domain" I rewrite the example to highlight that as
>>>>>>>>>>>>>>>>> I understand it:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> group 0:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>    domain 1:
>>>>>>>>>>>>>>>>>     counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>> group 1:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>    domain 1:
>>>>>>>>>>>>>>>>>     counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> You mention that you do not want counters to be allocated in domains that they
>>>>>>>>>>>>>>>>> are not needed in. So, let's say group 0 does not need counter 0 and counter 1
>>>>>>>>>>>>>>>>> in domain 1, resulting in:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> group 0:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>> group 1:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>    domain 1:
>>>>>>>>>>>>>>>>>     counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> With counter 0 and counter 1 available in domain 1, these counters could
>>>>>>>>>>>>>>>>> theoretically be configured to give group 1 more data in domain 1:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> group 0:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 0: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 1: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>> group 1:
>>>>>>>>>>>>>>>>>    domain 0:
>>>>>>>>>>>>>>>>>     counter 2: LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>    domain 1:
>>>>>>>>>>>>>>>>>     counter 0: LclFill,RmtFill
>>>>>>>>>>>>>>>>>     counter 1: LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>>     counter 2: LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>>     counter 3: VictimBW
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> The counters are shown with different per-domain configurations that seems to
>>>>>>>>>>>>>>>>> match with earlier goals of (a) choose events counted by each counter and
>>>>>>>>>>>>>>>>> (b) do not allocate counters in domains where they are not needed. As I
>>>>>>>>>>>>>>>>> understand the above does contradict global counter configuration though.
>>>>>>>>>>>>>>>>> Or do you mean that only the *name* of the counter is global and then
>>>>>>>>>>>>>>>>> that it is reconfigured as part of every assignment?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Yes, I meant only the *name* is global. I assume based on a particular
>>>>>>>>>>>>>>>> system configuration, the user will settle on a handful of useful
>>>>>>>>>>>>>>>> groupings to count.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Perhaps mbm_assign_control syntax is the clearest way to express an example...
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>    # define global configurations (in ABMC terms), not necessarily in this
>>>>>>>>>>>>>>>>    # syntax and probably not in the mbm_assign_control file.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>    r=LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>>>>>>>    w=VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>    # legacy "total" configuration, effectively r+w
>>>>>>>>>>>>>>>>    t=LclFill,RmtFill,LclSlowFill,RmtSlowFill,VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>    /group0/0=t;1=t
>>>>>>>>>>>>>>>>    /group1/0=t;1=t
>>>>>>>>>>>>>>>>    /group2/0=_;1=t
>>>>>>>>>>>>>>>>    /group3/0=rw;1=_
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> - group2 is restricted to domain 0
>>>>>>>>>>>>>>>> - group3 is restricted to domain 1
>>>>>>>>>>>>>>>> - the rest are unrestricted
>>>>>>>>>>>>>>>> - In group3, we decided we need to separate read and write traffic
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> This consumes 4 counters in domain 0 and 3 counters in domain 1.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I see. Thank you for the example.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> resctrl supports per-domain configurations with the following possible when
>>>>>>>>>>>>>>> using mbm_total_bytes_config and mbm_local_bytes_config:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> t(domain 0)=LclFill,RmtFill,LclSlowFill,RmtSlowFill,VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>> t(domain 1)=LclFill,RmtFill,VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>      /group0/0=t;1=t
>>>>>>>>>>>>>>>      /group1/0=t;1=t
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Even though the flags are identical in all domains, the assigned counters will
>>>>>>>>>>>>>>> be configured differently in each domain.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> With this supported by hardware and currently also supported by resctrl it seems
>>>>>>>>>>>>>>> reasonable to carry this forward to what will be supported next.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The hardware supports both a per-domain mode, where all groups in a
>>>>>>>>>>>>>> domain use the same configurations and are limited to two events per
>>>>>>>>>>>>>> group and a per-group mode where every group can be configured and
>>>>>>>>>>>>>> assigned freely. This series is using the legacy counter access mode
>>>>>>>>>>>>>> where only counters whose BwType matches an instance of QOS_EVT_CFG_n
>>>>>>>>>>>>>> in the domain can be read. If we chose to read the assigned counter
>>>>>>>>>>>>>> directly (QM_EVTSEL[ExtendedEvtID]=1, QM_EVTSEL[EvtID]=L3CacheABMC)
>>>>>>>>>>>>>> rather than asking the hardware to find the counter by RMID, we would
>>>>>>>>>>>>>> not be limited to 2 counters per group/domain and the hardware would
>>>>>>>>>>>>>> have the same flexibility as on MPAM.
>>>>>>>>>>>>>
>>>>>>>>>>>>> In extended mode, the contents of a specific counter can be read by
>>>>>>>>>>>>> setting the following fields in QM_EVTSEL: [ExtendedEvtID]=1,
>>>>>>>>>>>>> [EvtID]=L3CacheABMC and setting [RMID] to the desired counter ID. Reading
>>>>>>>>>>>>> QM_CTR will then return the contents of the specified counter.
>>>>>>>>>>>>>
>>>>>>>>>>>>> It is documented below.
>>>>>>>>>>>>> https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf
>>>>>>>>>>>>>    Section: 19.3.3.3 Assignable Bandwidth Monitoring (ABMC)
>>>>>>>>>>>>>
>>>>>>>>>>>>> We previously discussed this with you (off the public list) and I
>>>>>>>>>>>>> initially proposed the extended assignment mode.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yes, the extended mode allows greater flexibility by enabling multiple
>>>>>>>>>>>>> counters to be assigned to the same group, rather than being limited to
>>>>>>>>>>>>> just two.
>>>>>>>>>>>>>
>>>>>>>>>>>>> However, the challenge is that we currently lack the necessary interfaces
>>>>>>>>>>>>> to configure multiple events per group. Without these interfaces, the
>>>>>>>>>>>>> extended mode is not practical at this time.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Therefore, we ultimately agreed to use the legacy mode, as it does not
>>>>>>>>>>>>> require modifications to the existing interface, allowing us to continue
>>>>>>>>>>>>> using it as is.
>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> (I might have said something confusing in my last messages because I
>>>>>>>>>>>>>> had forgotten that I switched to the extended assignment mode when
>>>>>>>>>>>>>> prototyping with soft-ABMC and MPAM.)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Forcing all groups on a domain to share the same 2 counter
>>>>>>>>>>>>>> configurations would not be acceptable for us, as the example I gave
>>>>>>>>>>>>>> earlier is one I've already been asked about.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I don’t see this as a blocker. It should be considered an extension to the
>>>>>>>>>>>>> current ABMC series. We can easily build on top of this series once we
>>>>>>>>>>>>> finalize how to configure the multiple event interface for each group.
>>>>>>>>>>>>
>>>>>>>>>>>> I don't think it is, either. Only being able to use ABMC to assign
>>>>>>>>>>>> counters is fine for our use as an incremental step. My longer-term
>>>>>>>>>>>> concern is the domain-scoped mbm_total_bytes_config and
>>>>>>>>>>>> mbm_local_bytes_config files, but they were introduced with BMEC, so
>>>>>>>>>>>> there's already an expectation that the files are present when BMEC is
>>>>>>>>>>>> supported.
>>>>>>>>>>>>
>>>>>>>>>>>> On ABMC hardware that also supports BMEC, I'm concerned about enabling
>>>>>>>>>>>> ABMC when only the BMEC-style event configuration interface exists.
>>>>>>>>>>>> The scope of my issue is just whether enabling "full" ABMC support
>>>>>>>>>>>> will require an additional opt-in, since that could remove the BMEC
>>>>>>>>>>>> interface. If it does, it's something we can live with.
>>>>>>>>>>>
>>>>>>>>>>> As you know, this series is currently blocked without further feedback.
>>>>>>>>>>>
>>>>>>>>>>> I’d like to begin reworking these patches to incorporate Peter’s feedback.
>>>>>>>>>>> Any input or suggestions would be appreciated.
>>>>>>>>>>>
>>>>>>>>>>> Here’s what we’ve learned so far:
>>>>>>>>>>>
>>>>>>>>>>> 1. Assignments should be independent of BMEC.
>>>>>>>>>>> 2. We should be able to specify multiple event types to a counter (e.g.,
>>>>>>>>>>> read, write, victimBM, etc.). This is also called shared counter
>>>>>>>>>>> 3. There should be an option to assign events per domain.
>>>>>>>>>>> 4. Currently, only two counters can be assigned per group, but the design
>>>>>>>>>>> should allow flexibility to assign more in the future as the interface
>>>>>>>>>>> evolves.
>>>>>>>>>>> 5. Utilize the extended RMID read mode.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Here is my proposal using Peter's earlier example:
>>>>>>>>>>>
>>>>>>>>>>> # define event configurations
>>>>>>>>>>>
>>>>>>>>>>> ========================================================
>>>>>>>>>>> Bits    Mnemonics       Description
>>>>>>>>>>> ====   ========================================================
>>>>>>>>>>> 6       VictimBW        Dirty Victims from all types of memory
>>>>>>>>>>> 5       RmtSlowFill     Reads to slow memory in the non-local NUMA domain
>>>>>>>>>>> 4       LclSlowFill     Reads to slow memory in the local NUMA domain
>>>>>>>>>>> 3       RmtNTWr         Non-temporal writes to non-local NUMA domain
>>>>>>>>>>> 2       LclNTWr         Non-temporal writes to local NUMA domain
>>>>>>>>>>> 1       mtFill          Reads to memory in the non-local NUMA domain
>>>>>>>>>>> 0       LclFill         Reads to memory in the local NUMA domain
>>>>>>>>>>> ====    ========================================================
>>>>>>>>>>>
>>>>>>>>>>> #Define flags based on combination of above event types.
>>>>>>>>>>>
>>>>>>>>>>> t = LclFill,RmtFill,LclSlowFill,RmtSlowFill,VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>> l = LclFill, LclNTWr, LclSlowFill
>>>>>>>>>>> r = LclFill,RmtFill,LclSlowFill,RmtSlowFill
>>>>>>>>>>> w = VictimBW,LclNTWr,RmtNTWr
>>>>>>>>>>> v = VictimBW
>>>>>>>>>>>
>>>>>>>>>>> Peter suggested the following format earlier :
>>>>>>>>>>>
>>>>>>>>>>> /group0/0=t;1=t
>>>>>>>>>>> /group1/0=t;1=t
>>>>>>>>>>> /group2/0=_;1=t
>>>>>>>>>>> /group3/0=rw;1=_
>>>>>>>>>>
>>>>>>>>>> After some inquiries within Google, it sounds like nobody has invested
>>>>>>>>>> much into the current mbm_assign_control format yet, so it would be
>>>>>>>>>> best to drop it and distribute the configuration around the filesystem
>>>>>>>>>> hierarchy[1], which should allow us to produce something more flexible
>>>>>>>>>> and cleaner to implement.
>>>>>>>>>>
>>>>>>>>>> Roughly what I had in mind:
>>>>>>>>>>
>>>>>>>>>> Use mkdir in a info/<resource>_MON subdirectory to create free-form
>>>>>>>>>> names for the assignable configurations rather than being restricted
>>>>>>>>>> to single letters.  In the resulting directory, populate a file where
>>>>>>>>>> we can specify the set of events the config should represent. I think
>>>>>>>>>> we should use symbolic names for the events rather than raw BMEC field
>>>>>>>>>> values. Moving forward we could come up with portable names for common
>>>>>>>>>> events and only support the BMEC names on AMD machines for users who
>>>>>>>>>> want specific events and don't care about portability.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I’m still processing this. Let me start with some initial questions.
>>>>>>>>>
>>>>>>>>> So, we are creating event configurations here, which seems reasonable.
>>>>>>>>>
>>>>>>>>> Yes, we should use portable names and are not limited to BMEC names.
>>>>>>>>>
>>>>>>>>> How many configurations should we allow? Do we know?
>>>>>>>>
>>>>>>>> Do we need an upper limit?
>>>>>>>
>>>>>>> I think so. This needs to be maintained in some data structure. We can
>>>>>>> start with 2 default configurations for now.
>>>
>>> There is a big difference between no upper limit and 2. The hardware is
>>> capable of supporting per-domain configurations so more flexibility is
>>> certainly possible. Consider the example presented by Peter in:
>>> https://lore.kernel.org/lkml/CALPaoCi0mFZ9TycyNs+SCR+2tuRJovQ2809jYMun4HtC64hJmA@mail.gmail.com/
>>>
>>>>>>>>>> Next, put assignment-control file nodes in per-domain directories
>>>>>>>>>> (i.e., mon_data/mon_L3_00/assign_{exclusive,shared}). Writing a
>>>>>>>>>> counter-configuration name into the file would then allocate a counter
>>>>>>>>>> in the domain, apply the named configuration, and monitor the parent
>>>>>>>>>> group-directory. We can also put a group/resource-scoped assign_* file
>>>>>>>>>> higher in the hierarchy to make it easier for users who want to
>>>>>>>>>> configure all domains the same for a group.
>>>>>>>>>
>>>>>>>>> What is the difference between shared and exclusive?
>>>>>>>>
>>>>>>>> Shared assignment[1] means that non-exclusively-assigned counters in
>>>>>>>> each domain will be scheduled round-robin to the groups requesting
>>>>>>>> shared access to a counter. In my tests, I assigned the counters long
>>>>>>>> enough to produce a single 1-second MB/s sample for the per-domain
>>>>>>>> aggregation files[2].
>>>>>>>>
>>>>>>>> These do not need to be implemented immediately, but knowing that they
>>>>>>>> work addresses the overhead and scalability concerns of reassigning
>>>>>>>> counters and reading their values.
>>>>>>>
>>>>>>> Ok. Lets focus on exclusive assignments for now.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Having three files—assign_shared, assign_exclusive, and unassign—for each
>>>>>>>>> domain seems excessive. In a system with 32 groups and 12 domains, this
>>>>>>>>> results in 32 × 12 × 3 files, which is quite large.
>>>>>>>>>
>>>>>>>>> There should be a more efficient way to handle this.
>>>>>>>>>
>>>>>>>>> Initially, we started with a group-level file for this interface, but it
>>>>>>>>> was rejected due to the high number of sysfs calls, making it inefficient.
>>>>>>>>
>>>>>>>> I had rejected it due to the high-frequency of access of a large
>>>>>>>> number of files, which has since been addressed by shared assignment
>>>>>>>> (or automatic reassignment) and aggregated mbps files.
>>>>>>>
>>>>>>> I think we should address this as well. Creating three extra files for
>>>>>>> each group isn’t ideal when there are more efficient alternatives.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Additionally, how can we list all assignments with a single sysfs call?
>>>>>>>>>
>>>>>>>>> That was another problem we need to address.
>>>>>>>>
>>>>>>>> This is not a requirement I was aware of. If the user forgot where
>>>>>>>> they assigned counters (or forgot to disable auto-assignment), they
>>>>>>>> can read multiple sysfs nodes to remind themselves.
>>>>>>>
>>>>>>> I suggest, we should provide users with an option to list the assignments
>>>>>>> of all groups in a single command. As the number of groups increases, it
>>>>>>> becomes cumbersome to query each group individually.
>>>>>>>
>>>>>>> To achieve this, we can reuse our existing mbm_assign_control interface
>>>>>>> for this purpose. More details on this below.
>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> The configuration names listed in assign_* would result in files of
>>>>>>>>>> the same name in the appropriate mon_data domain directories from
>>>>>>>>>> which the count values can be read.
>>>>>>>>>>
>>>>>>>>>>    # mkdir info/L3_MON/counter_configs/mbm_local_bytes
>>>>>>>>>>    # echo LclFill > info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>>>>>>>>    # echo LclNTWr > info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>>>>>>>>    # echo LclSlowFill > info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>>>>>>>>    # cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>>>>>>>> LclFill
>>>>>>>>>> LclNTWr
>>>>>>>>>> LclSlowFill
>>>>>>>>>
>>>>>>>>> I feel we can just have the configs. event_filter file is not required.
>>>>>>>>
>>>>>>>> That's right, I forgot that we can implement kernfs_ops::open(). I was
>>>>>>>> only looking at struct kernfs_syscall_ops
>>>>>>>>
>>>>>>>>>
>>>>>>>>> #cat info/L3_MON/counter_configs/mbm_local_bytes
>>>>>>>>> LclFill <-rename these to generic names.
>>>>>>>>> LclNTWr
>>>>>>>>> LclSlowFill
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think portable and non-portable event names should both be available
>>>>>>>> as options. There are simple bandwidth measurement mechanisms that
>>>>>>>> will be applied in general, but when they turn up an issue, it can
>>>>>>>> often lead to a more focused investigation, requiring more precise
>>>>>>>> events.
>>>>>>>
>>>>>>> I aggree. We should provide both portable and non-portable event names.
>>>>>>>
>>>>>>> Here is my draft proposal based on the discussion so far and reusing some
>>>>>>> of the current interface. Idea here is to start with basic assigment
>>>>>>> feature with options to enhance it in the future. Feel free to
>>>>>>> comment/suggest.
>>>>>>>
>>>>>>> 1. Event configurations will be in
>>>>>>>      /sys/fs/resctrl/info/L3_MON/counter_configs/.
>>>>>>>
>>>>>>>      There will be two pre-defined configurations by default.
>>>>>>>
>>>>>>>      #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes
>>>>>>>      LclFill, LclNTWr,LclSlowFill,VictimBM,RmtSlowFill,LclSlowFill,RmtFill
>>>>>>>
>>>>>>>      #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes
>>>>>>>      LclFill, LclNTWr, LclSlowFill
>>>>>>>
>>>>>>> 2. Users will have options to update these configurations.
>>>>>>>
>>>>>>>      #echo "LclFill, LclNTWr, RmtFill" >
>>>>>>>         /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes
>>>>>
>>>>> This part seems odd to me. Now the "mbm_local_bytes" files aren't
>>>>> reporting "local_bytes" any more. They report something different,
>>>>> and users only know if they come to check the options currently
>>>>> configured in this file. Changing the contents without changing
>>>>> the name seems confusing to me.
>>>>
>>>> It is the same behaviour right now with BMEC. It is configurable.
>>>> By default it is mbm_local_bytes, but users can configure whatever they want to monitor using /info/L3_MON/mbm_local_bytes_config.
>>>>
>>>> We can continue the same behaviour with ABMC, but the configuration will be in /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes.
>>>
>>> This could be supported by following Peter's original proposal where the name
>>> of the counter configuration is provided by the user via a mkdir:
>>> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/
>>>
>>> As he mentioned there could be pre-populated mbm_local_bytes/mbm_total_bytes.
>>
>> Sure. We can do that. I was thinking in the first phase, just provide the
>> default pre-defined configuration and option to update the configuration.
>>
>> We can add the mkdir support later. That way we can provide basic ABMC
>> support without too much code complexity with mkdir support.
>>
>>>
>>>>
>>>>>
>>>>>>>
>>>>>>>      # #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes
>>>>>>>      LclFill, LclNTWr, RmtFill
>>>>>>>
>>>>>>> 3. The default configurations will be used when user mounts the resctrl.
>>>>>>>
>>>>>>>      mount  -t resctrl resctrl /sys/fs/resctrl/
>>>>>>>      mkdir /sys/fs/resctrl/test/
>>>>>>>
>>>>>>> 4. The resctrl group/domains can be in one of these assingnment states.
>>>>>>>      e: Exclusive
>>>>>>>      s: Shared
>>>>>>>      u: Unassigned
>>>>>>>
>>>>>>>      Exclusive mode is supported now. Shared mode will be supported in the
>>>>>>> future.
>>>>>>>
>>>>>>> 5. We can use the current /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>> to list the assignment state of all the groups.
>>>>>>>
>>>>>>>      Format:
>>>>>>>      "<CTRL_MON group>/<MON group>/<confguration>:<domain_id>=<assign state>"
>>>>>>>
>>>>>>>     # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>>      test//mbm_total_bytes:0=e;1=e
>>>>>>>      test//mbm_local_bytes:0=e;1=e
>>>>>>>      //mbm_total_bytes:0=e;1=e
>>>>>>>      //mbm_local_bytes:0=e;1=e
>>>
>>> This would make mbm_assign_control even more unwieldy and quicker to exceed a
>>> page of data (these examples never seem to reflect those AMD systems with the many
>>> L3 domains). How to handle resctrl files larger than 4KB needs to be well understood
>>> and solved when/if going this route.
>>
>> This problem is not specific this series. I feel it is a generic problem
>> to many of the semilar interfaces. I dont know how it is addressed. May
>> have to investigate on this. Any pointers would be helpful.
>>
>>
>>>
>>> There seems to be two opinions about this file at moment. Would it be possible to
>>> summarize the discussion with pros/cons raised to make an informed selection?
>>> I understand that Google as represented by Peter no longer requires/requests this
>>> file but the motivation for this change seems new and does not seem to reduce the
>>> original motivation for this file. We may also want to separate requirements for reading
>>> from and writing to this file.
>>
>> Yea. We can just use mbm_assign_control for reading the assignment states.
>>
>> Summary: We have two proposals.
>>
>> First one from Peter:
>>
>> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/
>>
>>
>> Pros
>> a.  Allows flexible creation of free-form names for assignable
>> configurations, stored in info/L3_MON/counter_configs/.
>>
>> b.  Events can be accessed using corresponding free-form names in the
>> mon_data directory, making it clear to users what each event represents.
>>
>>
>> Cons:
>> a. Requires three separate files for assignment in each group
>> (assign_exclusive, assign_shared, unassign), which might be excessive.
>>
>> b. No built-in listing support, meaning users must query each group
>> individually to check assignment states.
> 
> How big of a problem is this in reality? I'd assume that users of this
> feature would only reassign counter attributes at some slow rate (set
> up counters, measure for at least a few seconds, then set up for next
> measurement). Cost to open/read/close a few hundred kernfs files isn't
> very high. Biggest cost might be hogging the resctrl mutex which would
> cause jitter in the tasks reading data from resctrl monitors.

Yes. That is a good point. Dont know how big the problem it is.

But we all need to aggre that group listing is not requirement. We can go
ahead that route.

Lets hear from all the parties.

> 
> Anyone doing this at scale should be able to keep track of what they set,
> so wouldn't need to read at all. I'm not a big believer in "multiple
> agents independently tweaking resctrl without knowledge of each other".
> 
>>
>> Second Proposal (Mine)
>>
>> https://lore.kernel.org/lkml/a4ab53b5-03be-4299-8853-e86270d46f2e@amd.com/
>>
>> Pros:
>>
>> a. Maintains the flexibility of free-form names for assignable
>> configurations (info/L3_MON/counter_configs/).
>>
>> b. Events remain accessible via free-form names in mon_data, ensuring
>> clarity on their purpose.
>>
>> c. Adds the ability to list assignment states for all groups in a single
>> command.
>>
>> Cons:
>> a.  Potential buffer overflow issues when handling a large number of
>> groups and domains and code complexity to fix the issue.
>>
>>
>> Third Option: A Hybrid Approach
>>
>> We could combine elements from both proposals:
>>
>> a. Retain the free-form naming approach for assignable configurations in
>> info/L3_MON/counter_configs/.
>>
>> b. Use the assignment method from the first proposal:
>>    $mkdir test
>>    $echo mbm_local_bytes > test/mon_data/mon_L3_00/assign_exclusive
>>
>> c. Introduce listing support via the info/L3_MON/mbm_assign_control
>> interface, enabling users to read assignment states for all groups in one
>> place. Only reading support.
>>
>>
>>>
>>>>>>>
>>>>>>> 6. Users can modify the assignment state by writing to mbm_assign_control.
>>>>>>>
>>>>>>>      Format:
>>>>>>>      “<CTRL_MON group>/<MON group>/<configuration>:<domain_id>=<assign state>”
>>>>>>>
>>>>>>>      #echo "test//mbm_local_bytes:0=e;1=e" >
>>>>>>> /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>>
>>>>>>>      #echo "test//mbm_local_bytes:0=u;1=u" >
>>>>>>> /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>>
>>>>>>>      # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>>>>>>>      test//mbm_total_bytes:0=u;1=u
>>>>>>>      test//mbm_local_bytes:0=u;1=u
>>>>>>>      //mbm_total_bytes:0=e;1=e
>>>>>>>      //mbm_local_bytes:0=e;1=e
>>>>>>>
>>>>>>>      The corresponding events will be read in
>>>>>>>
>>>>>>>      /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
>>>>>>>      /sys/fs/resctrl/mon_data/mon_L3_01/mbm_total_bytes
>>>>>>>      /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>>>>>>>      /sys/fs/resctrl/mon_data/mon_L3_01/mbm_local_bytes
>>>>>>>      /sys/fs/resctrl/test/mon_data/mon_L3_00/mbm_total_bytes
>>>>>>>      /sys/fs/resctrl/test/mon_data/mon_L3_01/mbm_total_bytes
>>>>>>>      /sys/fs/resctrl/test/mon_data/mon_L3_00/mbm_local_bytes
>>>>>>>      /sys/fs/resctrl/test/mon_data/mon_L3_01/mbm_local_bytes
>>>>>>>
>>>>>>> 7. In the first stage, only two configurations(mbm_total_bytes and
>>>>>>> mbm_local_bytes) will be supported.
>>>>>>>
>>>>>>> 8. In the future, there will be options to create multiple configurations
>>>>>>> and corresponding directory will be created in
>>>>>>> /sysf/fs/resctrl/test/mon_data/mon_L3_00/<configation name>.
>>>>>
>>>>> Would this be done by creating a new file in the /sys/fs/resctrl/info/L3_MON/counter_configs
>>>>> directory? Like this:
>>>>>
>>>>> # echo "LclFill, LclNTWr, RmtFill" >
>>>>>          /sys/fs/resctrl/info/L3_MON/counter_configs/cache_stuff
>>>>>
>>>>> This seems OK (dependent on the user picking meaningful names for
>>>>> the set of attributes picked ... but if they want to name this
>>>>> monitor file "brian" then they have to live with any confusion
>>>>> that they bring on themselves).
>>>>>
>>>>> Would this involve an extension to kernfs? I don't see a function
>>>>> pointer callback for file creation in kernfs_syscall_ops.
>>>>>
>>>>>>>
>>>>>>
>>>>>> I know you are all busy with multiple series going on parallel. I am still
>>>>>> waiting for the inputs on this. It will be great if you can spend some time
>>>>>> on this to see if we can find common ground on the interface.
>>>>>>
>>>>>> Thanks
>>>>>> Babu
>>>>>
>>>>> -Tony
>>>>>
>>>>
>>>>
>>>> thanks
>>>> Babu
>>>
>>> Reinette
>>>
>>>
>>
>> -- 
>> Thanks
>> Babu Moger
> 
> -Tony
> 

-- 
Thanks
Babu Moger

