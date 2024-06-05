Return-Path: <linux-doc+bounces-17794-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C78FD43D
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 19:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159051F2157D
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 17:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC7713A86E;
	Wed,  5 Jun 2024 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cO74xiHn"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657542770E;
	Wed,  5 Jun 2024 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717609369; cv=fail; b=nncf2GuMLcMQmybBsOGWDHFs1YsKCId7DTVHia+LLH9Mok1oH2yMNudQVh4btKxLgVCMGjmde9yPJA+EXk6U4upA9ItTXcwEJsxMFWNoSfg0izj94ooP5kcjc1hJ5gh6Elp9dMYMl3NTCr5Mb2GUeUrnMI84vmPnUzx8hnNmE1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717609369; c=relaxed/simple;
	bh=mcAB2AWXlH0v/9d/cRlWrwitAjtGDQ7IrQikt+fOthU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZPAmLbTfNwK8We+IPg7DDuRq24WPGs65udXGLh/RcXF3zQmQFON1y1yikWldhwMPZi1pXSgidpUw6c9kCgkiUV4np2b3S3km5/X36auJIGD0eoVlBXl5+Y9qW767xNkWwcbbMTxuTpUs+7WNKLT9qPbkEIDs5EbMJ1iyTuJLLaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cO74xiHn; arc=fail smtp.client-ip=40.107.237.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnBdj2R5tF11o1N6evdvExu7Fem8U9pk8A7g6at5YNU6aq2YbkkoIJ7VvPsqK4j8zkM8Wn3zmAkwgZxSPQs+H1PHY20+bUn+sTa/k9X9PBw/jwfQ49tUd+hTRWRWlLgQHj/xXWwvN80LkKyPBzQ4EmhQn38qXD0f750u4KPfUZ8NBFaxtYasaLWBRPbx1yzUneX6IOKIYbQGv4XzvnQn/wFw42gewjuhPk82lRgzuoWs2jujpp7fM//mhgpEwj9u8WpYkGVPURXZtwCH3CEOFHXs6jWdfzLyX9eDwUYpY1HAmHiYPFPsWPN8Opx9WPxk0mNbWy3NomwK08Tdr1A+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9/8nvnXJAX5AHBr5JDvxI0NAkubjE/A9D4WeVQrwzk=;
 b=ZVlv38KHOdUsDUnArg14n+BLJL0n4Sd3eVC2MeCsBU2lh2ilbOPOStzgvSEj/SZgnTQH5Sby/2ZJpVSawWp9R8V2J6C89DvyutPh0XV35hRl48m9ncqhQ6xnXf1x1PC8qtCy60U6bGESOqNFLFP2vZllX02brzgu5CXStYnL+XYMtfcyLldd8KVY1CNe7lol7bpGNn/ivzcvT3JrLQGBQgONskC0EbjWgy4VsqA/tdddOdDowycOZCbW4V950SrAt2/nptvBwk4EG2RVzYhbuYksyGyUD6mfJ5FqJaqHL/JpwXzAABtUhUU1SZ71Juk3mPD5h41Mm7Kc760SjufuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9/8nvnXJAX5AHBr5JDvxI0NAkubjE/A9D4WeVQrwzk=;
 b=cO74xiHn+2Uxr6WPFQLzsXacfZnmjubNa5erxK8IcUZAEg5KaO8HikIDwaqgKQa06c0C4lsdzzhhW8hvDPKan4doxrbybTXzCxUm3hZnMbjQo7v3cW4iFe+IbbMXmbBycQ/bOK36vYgLNISV+uKh4V7GVX8M1bjZzDms9pWV7Nc2se4cX5o13xZ6jyhYEbPTLC5ppzmyFwmpKhYehCSt/as3dowmvmvv2Z/RcNqnYD8vneLNX2uMkZOC3+34Lmvko41BMMCaqcGHu3VC0HITDEC+ziXQ46QY54hU4uN4h4mrtWbjwnwOzEdXrIAFQ8oRGcklOo0AwE+MUOjcq9BlXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) by
 DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Wed, 5 Jun 2024 17:42:43 +0000
Received: from DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::10e2:bf63:7796:ba08]) by DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::10e2:bf63:7796:ba08%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 17:42:43 +0000
Message-ID: <1e32711c-a89d-40e6-9b34-485b58a3c9a6@nvidia.com>
Date: Wed, 5 Jun 2024 20:42:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/7] net: ethtool: pass ethtool_rxfh to
 get/set_rxfh ethtool ops
To: Ahmed Zaki <ahmed.zaki@intel.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, corbet@lwn.net,
 jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, vladimir.oltean@nxp.com,
 andrew@lunn.ch, horms@kernel.org, mkubecek@suse.cz,
 willemdebruijn.kernel@gmail.com, alexander.duyck@gmail.com,
 linux-doc@vger.kernel.org, Igor Bagnucki <igor.bagnucki@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>
References: <20231120205614.46350-1-ahmed.zaki@intel.com>
 <20231120205614.46350-2-ahmed.zaki@intel.com>
 <20231121152906.2dd5f487@kernel.org>
 <4945c089-3817-47b2-9a02-2532995d3a46@intel.com>
From: Gal Pressman <gal@nvidia.com>
Content-Language: en-US
In-Reply-To: <4945c089-3817-47b2-9a02-2532995d3a46@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To DS7PR12MB6288.namprd12.prod.outlook.com
 (2603:10b6:8:93::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6288:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 61082cc0-2e2c-4358-eb28-08dc8586e722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUJtcUQwdWVBWXE5TkY2Q3FmNDQwS0lhNkhnVGxnUkFYVUJaTnk4Y0gwTWNy?=
 =?utf-8?B?b3dyM0hnQnRpMmFpd1A0VE5VMStvRmpKYXFFWW5EbDRMOUFPRk15QWdNMlhy?=
 =?utf-8?B?MUcwdHJ1eGJLNVdmV0FnUndENElyTmc0MWlHQjVDVG4zam5JL3JGa0NGQlM0?=
 =?utf-8?B?YUZ0bzNSbmVKdkR6Y1VEaWNmdHdOZE1MMHhWOEZOaDJkZGVKSEVob0VHVm9S?=
 =?utf-8?B?WmhtL2JBNVpVMEk5dnJaMkcxTlg4dGRpMUh1Rmk0cTlLT3BTL3dEd2MySFBs?=
 =?utf-8?B?blRLN3pZazZzaDVMdUg0M2NoM0ZwN2hCMFNKOWJidmVYbmpPSzFpdXJFZ0ZJ?=
 =?utf-8?B?YlZtdXBBMjU5UTZDZExIVDhpVmpRTEJzZlZHdFBtVzM0V1I0K3JhNVJBaU9P?=
 =?utf-8?B?SFZEbGoyWXR4MjE4UmdCTXVIckh6WXdGZE5kSldPNnUvZmlmNzhNUFk1aWRO?=
 =?utf-8?B?UUF1RjBxRzdUTGZFN3R0S1N1QWcrNjRLZ293ZEpMZWtWKzJ2TnJ2UERCeFgy?=
 =?utf-8?B?dTNEQkpJYTRWdmxrNDE1KzRxN0NIZHFDWjNjcWZXVnFWMG9sb3l4eFYxMDJR?=
 =?utf-8?B?czI4eHR4WGhHWjA0SG1oOHlhbFV5WEloZ1M3bW1DK093ekUySjJwNjRNZlhQ?=
 =?utf-8?B?QUV2WnZka1pvdUQwYit0clo5Z0thV3Y2RXFBQUdEbHdhaCswQUs4bXRxMHpW?=
 =?utf-8?B?NE1ETG5YV3JOdnF5QUF6Y3cyMGZpMU1CUWJVQ2pHN1ZhZ0FHMUg0L0x5MVRX?=
 =?utf-8?B?c0VLNTA1Y05LRlN4NDkrWDVMWjFUbWJkNm5YaFpEN2M0Y0pjdHhISHVRSnla?=
 =?utf-8?B?d3hkK2ljMStQYlNOMDd5cXV6eW1sL2dkNWw5eGZKOXVxYnpFMlJSY2tCdDU4?=
 =?utf-8?B?dUJrU3M2b1JTTFEvSUEyTU5qWDF1cFVHMWQ0WW9Ed2RFOGZLR3k2L3RaYTJB?=
 =?utf-8?B?WHptZEhTdnFGSzJ5dEhSSE95bVo0SmtqUDdPTDNGd2s1RjNXbVQ4T2Y4YjI5?=
 =?utf-8?B?N1o5ZGQzWDR0NFUyQXZrd3JGZUxYb2VYUkVhdFZSZEw0VGlTUG9LN1dyY2pL?=
 =?utf-8?B?bi94MHI3dTJrczlFdnB0ei83RXo1WTFZQnFBMlBja3NGTi9UKy9UaFg4a2pn?=
 =?utf-8?B?THVIeG1aSHZqd1hCbktudTBsTVV3Rk4zRkZtMHdLZUNMeFdzanF0SzlJcW04?=
 =?utf-8?B?RWNXN0R5T0hFUTJzOGZuL3JMeW8vTFRlUWwyMzMwQlVLNGhOSStyTVNlZnkx?=
 =?utf-8?B?cmJXTThZaGVLU2U0TTRRTzVhWUROczE0OStpTm5sZkpCbUE1M0hsczdWSGpt?=
 =?utf-8?B?cllpN05pRVRrd2tiejBYbFlwdk1wT3VOS3hHVmtFSFRkbG93RlBNdjlzVG9M?=
 =?utf-8?B?SnVkV3hBMG1rRzB4VUNHSm9YYXNGeCtLWDY0S3dJM0V2VkhKYitySlpDSFk4?=
 =?utf-8?B?SE9KNk9kbHJ6WUFiWnMwa002eUNSMWpOOFlFc3RUR3NnY21KV2x0cnh3THZo?=
 =?utf-8?B?RlBZbWp2NkZDSTU1RTVLMVN6S0ZjMDVZNnZBRjB4MHZiVUM4bGZkNlJ4aVV1?=
 =?utf-8?B?YkdpSlBkQnpLekZtdkl3aTBualhjYlRsR1FDMUxNN0JmUy9XaDFWQWc2S0NN?=
 =?utf-8?B?cFhqdnJxQ1BXVENFSzJraWQrRit2N2pmcG5OakxkZzd4UEpIQnp3ejBSQk9F?=
 =?utf-8?B?ZDQyd25WMTJMWjE3M29FTE9mVUNQVVdENjBXZGpIcGNUOFFSR29nQjRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6288.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkRNNFBKQ1JOVmNsUHpXdFNVaXhSbks2WkNGc2oyL2EyRnRXMzBmSkJtN0hu?=
 =?utf-8?B?RjA3TDFlN0U0WityWG42cmVMWGluRDlqM1llcStpYk51cURBdnNab2tzSWJM?=
 =?utf-8?B?UXVybml4azZsUkhjWjNvNTlUczBPYzBHMUE4ajVmM0Q1TTJoZWxrUTFWNVBu?=
 =?utf-8?B?VHZLVmRlT1BmUEZmbHZEMy9WTUhmT2NoaUlkSUJvVUZ2bW1iaGlOd2JrOVcv?=
 =?utf-8?B?eFVwN0VEUlRGaGg4SGx5OE1QejZXMVoyYlo5K2FJVkpzWkNjVzFBWHZHaW96?=
 =?utf-8?B?bnhPdjY2dUlPNVdqdzJINHlJRjdicmNIZ1E2Q3hWbkJnL084QXFyZExkcEV3?=
 =?utf-8?B?NXpOWFZjYWp2aFhaVVc1RXlpNU5IRTYySzNxd2N2UWxYOUdManYyZTJqWGUz?=
 =?utf-8?B?VCs1TWMxWFU0ZHdNZHAyeDdNS295S1cyUUJDOXUxK3J2UzZmb25EL3E4cEpC?=
 =?utf-8?B?eURUQWtuamY3ejM3T29zaTZ0b2dHZ2NlN0JPaUlrUGxKdUdpWnJFZDU2VXJh?=
 =?utf-8?B?WFNGT0ZIb0Exc1dIQk9EVlRKS1dMbkpHeElwWXhjekE3Rk5ZU0pqZHI0by9X?=
 =?utf-8?B?elRtSmx5K1AzUDRRSjBnVk5GeVhMVlZDU1lDRG52V3JIMTc1cmpTWmt3Vnh1?=
 =?utf-8?B?eWxYMnZKVDBSemJsQlZzeEpSNGpocUQ3dXhoUENRc3ZYUmJGN0tLQWUwUi83?=
 =?utf-8?B?ZklRYkNFNTJxSWFzK0poMnVVTXMvVUhTQlI3am50czY3MFVFZ3o0VllZdzlW?=
 =?utf-8?B?THRLZW83YkNUOXY4M3dFSDl4RlV1SlExa1M5MXR6Y3NqaklPR3Fpamt1djRE?=
 =?utf-8?B?Z3JmWlZzazM3eGtaWGk4M0NIeUFyVGdmQUNLcnVMMndvSHlhRUV0L1VtbnNL?=
 =?utf-8?B?OWRmMkQvK250TC93K0tYOHVrRmxjNEdnSlFKQ2pwY0p2cFliUmVKZnVoRUFm?=
 =?utf-8?B?dlBJckdZaFVpaEJJZHhoWHhaV2dGVlNOWVA3bVlFOWsrR1BiWk5VUWp5M0FL?=
 =?utf-8?B?d01uRlFNZ1BuemY4UWNueTdXaUFCa05jclN0VVRkS3VSNXE1bjJhcGJrVWE3?=
 =?utf-8?B?eTdDUDJjSnNVYWNHL0RhblgyTWI4TlVDVFpWQ3UvSE1oM1JoajRaM3FVaUJ3?=
 =?utf-8?B?V203d3RSUE9pdnhoNDI2Wks0TkRZakFqL0FDazgyVGRQMFJkTkVTL2hxWTBU?=
 =?utf-8?B?U0J3UjRjVUhpVnMwOEw5THdsZXZCUmlYN050cHdWdmRUa3Y2MXJQczdyMGRp?=
 =?utf-8?B?NnJTd1F3cUdHTjhtUTFEZmx0SWRJMkVNaDBVN3prc3ZqY09wcGpJYmlaUGxo?=
 =?utf-8?B?VDJtNE1aeUdEMjd0R2JsOXVqWERFWWFadGprdWVMMUg4ZjNtdmtwSHVaZFEz?=
 =?utf-8?B?VnVSM3AvNHZydTN0VkxudnpQeWFIaUM1N2RRN0ZlTXBLeEx1cE1BOWZkNXZv?=
 =?utf-8?B?QjBqSThvSDdMQTU0NXBOOWthRSs5YjFMS1NXcytqdGRiMkk2cDNhV2p2TmNX?=
 =?utf-8?B?ZjMzQ2F3WTZUNDQyVU4yWW1rN1FXQU5RRTcxZ0ozOERPSkdzWVpDTExxUU02?=
 =?utf-8?B?N3JXZWwyY1F0cW4zQ3ZqZHZOWHViMUpzcVBsOCtCMlRqdzNTUlhxZlBPVC8y?=
 =?utf-8?B?SUs2N0FqRU1XR05mTXVzdVlBMkl5RUF5L055Q29SbWxvTGd0ZVhNOXE5VzVH?=
 =?utf-8?B?dlFsRjFxMXhLU0NFMVVIU2VxcVA1MTNJb2phL1dVbFdFWkhTQjI4RFl2bTZZ?=
 =?utf-8?B?Z1J1Q01ES084bWF3VFJaTHZKbDNObzVFV2MyamErdjMrWnBtVDZuSnFMSSty?=
 =?utf-8?B?RnkybkVNMVBOT0hmWWlweEVHbjVFNkxvOTVQZkZUa1dwUEVtRSswU0JWZU1C?=
 =?utf-8?B?djFxVlVxMi9HQ2hMMUUzenJ1a3BrTzZURkwzYVdVY2wyUlJyRWV4TVV4dzFE?=
 =?utf-8?B?ZG4rUTVPaVhNeXEvMGZ5M0xOMEI2WGdYcEM2MmNkVUJjTzZCVzRUcEUxZFdh?=
 =?utf-8?B?UWpuL2htRDYzZ1YzZHB6enpjYjZ6TktyS3l5Mkw4T1Qvb1oyU3Vhc0RuMkRG?=
 =?utf-8?B?VncrdlJRcE9UNWJ2MWNTRmxmdkpPVEFWY2I2NjExVWNSNWhJRDNtdjhzUW9h?=
 =?utf-8?Q?UqRl8aixbE7XsWDD+PQdhZJZ3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61082cc0-2e2c-4358-eb28-08dc8586e722
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6288.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:42:43.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6GI8gNtYChnkrYHrc4zLGmAIWLA6FUhVxWk6fDIolvWVU8788SaWZP05YNRafNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769

On 27/11/2023 16:14, Ahmed Zaki wrote:
> 
> 
> On 2023-11-21 16:29, Jakub Kicinski wrote:
>> On Mon, 20 Nov 2023 13:56:08 -0700 Ahmed Zaki wrote:
>>>       u32    (*get_rxfh_key_size)(struct net_device *);
>>>       u32    (*get_rxfh_indir_size)(struct net_device *);
>>> -    int    (*get_rxfh)(struct net_device *, u32 *indir, u8 *key,
>>> -                u8 *hfunc);
>>> -    int    (*set_rxfh)(struct net_device *, const u32 *indir,
>>> -                const u8 *key, const u8 hfunc);
>>> +    int    (*get_rxfh)(struct net_device *, struct ethtool_rxfh *,
>>> +                u32 *indir, u8 *key);
>>> +    int    (*set_rxfh)(struct net_device *, struct ethtool_rxfh *,
>>> +                const u32 *indir, const u8 *key);
>>>       int    (*get_rxfh_context)(struct net_device *, u32 *indir, u8
>>> *key,
>>>                       u8 *hfunc, u32 rss_context);
>>>       int    (*set_rxfh_context)(struct net_device *, const u32 *indir,
>>
>> This conversion looks 1/4th done. You should do the following:
>>
>>   - First simplify the code by always providing a pointer to all params
>>     (indir, key and func); the fact that some of them may be NULL seems
>>     like a weird historic thing or a premature optimization.
>>     It will simplify the drivers if all pointers are always present.
>>     You don't have to remove the if () checks in the existing drivers.
>>
>>   - Then make the functions take a dev pointer, and a pointer to a
>>     single struct wrapping all arguments. The set_* should also take
>>     an extack.
> 
> Can we skip the "extack" part for this series? There is no
> "ETHTOOL_MSG_RSS_SET" netlink message, which is needed for user-space to
> get the ACK and adding all the netlink stuff seems a bit out of scope.

Hi Ahmed,

Sorry for reviving this old thread, I noticed you kept the extack in the
set_rxfh callback eventually. Was that on purpose?
It's weird that we have a parameter that is always passed as NULL.

