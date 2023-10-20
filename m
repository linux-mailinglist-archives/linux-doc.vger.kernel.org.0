Return-Path: <linux-doc+bounces-718-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B87D1806
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 23:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF3D28269C
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 21:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2268B2B742;
	Fri, 20 Oct 2023 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T63VU1pG"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B328D2E3;
	Fri, 20 Oct 2023 21:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F09D6E;
	Fri, 20 Oct 2023 14:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697837119; x=1729373119;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1ckfocGUi2+19y7bFPa8D/E2n8UZkoYUNX+3NrBuTbw=;
  b=T63VU1pG+jEm40OtItoItjHNitzLrNXtpKWOKdEJGjSF7BI1m4vATTqF
   Ao0sWXw+IJra/73y8LpR2bZfzay2mvvQj6JrBsNxhdvcboCQToKfxxHkv
   LkxVL55sldUCDcSA6RyieUgcOk7Xc0ue2E2qocXNFXn7s1wAJX8yySWVn
   aiY3xejjqN852YEo6ZDzT9b5ay4o2hE0L2Z4v2gw3ECCBh1chD7R7WBMd
   s+IlOCXSfVFFY5Bw8uaoatOc2NxNhXNlunKtZYf5Nkd+3PCMfSCNocBIN
   hzncWemqvwFLXIRIPW+ruxKDrBRncsDTFOpxXkdq8ZctZEajG7CVI6L/i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417710334"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417710334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 14:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5221626"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 14:23:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 14:24:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 14:24:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 14:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzs3+Na0cLQF8p+ku7SOVaIDclZVY1Bre4OsQtq4zaw1k4XhuH9rxFf9/rroDVOZ/JD2Vj3FmxEFgb3o9qcu+C3T5F1MipuBX/LuoArzQBdQ8Ma+fYRefCxBqetpvqBtMR4ZE+g31sSh/eV2tehMdkkqNkxioTun+B9LnMA/zUCUPoanN3RyTyEQiDVYQU6nsuNKYHtapN4tN4vkaYOWtJZZ03oO2GGaoDMvdZ01Fm6RDA/juhLHZkyLGxflpOVRcrn6VO1r1vTrj2y/7L8L2HDpxwiDaz+mewitjC61MKLk2EX2fhbIyLBxGcImbvQUk7eCqaN/UQjyP1hMHXoxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piE1GxIm/ge6Lco87oibGc+Iv1ghZW07y1JNnflR69g=;
 b=SWEtVJ6gDBXEjtGn0PN149D2Z4t/+VVcWLDQR84VIizXf063gg7T+Jp08ULmZpXT86EdAXSIsINo8GX3ogtdQDbN0/iVP7rpgG3q1MbeQB8Rj8opwmhZs2K8ojl9E329ctPkrSCfqNF2uAJwBRfqS2lwxcUhynlHBOS3mSYQdtS3RrJ1vSKCpUxS5gb9IupvFUBywU3cEXEOVlE7/VLa1NIBZxRtvkclStpUvb+lVDSilkvhHPSDcJZ2L9eT44BAHeWeJpi5yH3fp3rpRRPLnMK1wokfGSE5zdfLcY99pFwnH25IOupYvgScxN+qqmjX/dpHOLYCzFy/+Py3QZjTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 21:24:54 +0000
Received: from SN7PR11MB7420.namprd11.prod.outlook.com
 ([fe80::2329:7c5f:350:9f8]) by SN7PR11MB7420.namprd11.prod.outlook.com
 ([fe80::2329:7c5f:350:9f8%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 21:24:54 +0000
Message-ID: <45c6ab9f-50f6-4e9e-a035-060a4491bded@intel.com>
Date: Fri, 20 Oct 2023 15:24:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/6] net: ethtool: allow symmetric-xor RSS
 hash for any flow type
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>
CC: <netdev@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
	<corbet@lwn.net>, <jesse.brandeburg@intel.com>, <anthony.l.nguyen@intel.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
	<vladimir.oltean@nxp.com>, <andrew@lunn.ch>, <horms@kernel.org>,
	<mkubecek@suse.cz>, <linux-doc@vger.kernel.org>, Wojciech Drewek
	<wojciech.drewek@intel.com>, Alexander Duyck <alexander.duyck@gmail.com>
References: <20231016154937.41224-1-ahmed.zaki@intel.com>
 <20231016154937.41224-2-ahmed.zaki@intel.com>
 <8d1b1494cfd733530be887806385cde70e077ed1.camel@gmail.com>
 <26812a57-bdd8-4a39-8dd2-b0ebcfd1073e@intel.com>
 <CAKgT0Ud7JjUiE32jJbMbBGVexrndSCepG54PcGYWHJ+OC9pOtQ@mail.gmail.com>
 <14feb89d-7b4a-40c5-8983-5ef331953224@intel.com>
 <CAKgT0UfcT5cEDRBzCxU9UrQzbBEgFt89vJZjz8Tow=yAfEYERw@mail.gmail.com>
 <20231016163059.23799429@kernel.org>
 <CAKgT0Udyvmxap_F+yFJZiY44sKi+_zOjUjbVYO=TqeW4p0hxrA@mail.gmail.com>
 <20231017131727.78e96449@kernel.org>
 <CAKgT0Ud4PX1Y6GO9rW+Nvr_y862Cbv3Fpn+YX4wFHEos9rugJA@mail.gmail.com>
 <20231017173448.3f1c35aa@kernel.org>
 <CAKgT0Udz+YdkmtO2Gbhr7CccHtBbTpKich4er3qQXY-b2inUoA@mail.gmail.com>
 <20231018165020.55cc4a79@kernel.org>
From: Ahmed Zaki <ahmed.zaki@intel.com>
In-Reply-To: <20231018165020.55cc4a79@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:8:1::22)
 To SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7420:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bcda90-f324-44e1-1857-08dbd1b30073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pqr0m7/ttqeh9AlRpDbpbe5jOHA8AHHNkNCyuJ2S0I0pGzFLt4d4aVCRdLFsHFMtZHgRH1phRowco3aLBUHeiRUuwOuZJSCviKy89pLSM/TSphv8oBNHqoSo+aep7O5NR9ltgy9SsAYXTVRS2l+k0UWtgYiMZBRbd49f5MFzE51fvkYl3Jwii3NOQlqMIiyGC+QTzOX3ZCeYc8rg5k4TnOKlWzMdG1piR4GRoTHE6I0hGXNzFRrWtnpAVjpH7FS6AWay3cjyhjAbACZC5yWAPlomgwqbX/yp47klBMi3eGvpaw/RJART1H7xN1Fmx+F/wSqJF/58cKcPNvNxTf9qNBxxK0a5BE+nJLzYx3LjQoXagb5uL5gy5b4k4N02LJFOV4jXhxoMlO/muKmAuaE28Aw/6W+EjT4BuegVPXFss6eRgoSL+iAvOUMueNtxeVYLm7N8OAG/eyUZzFLJxH6+ZJ20OmTrPKHk5Nnv0NrC8VXazqKpm4jx42df9t3MOhIUMYQhJYr3XlK27JFYrRkBq5ZwP70YLhTuq3GUQ8G1yqayCCxKAzvpw1QKkxGSrOWGAZRC8w2W6TXU5oR6ok22SHbINvkfufwKcLF2o1EcvX+AeRM3KoHFplHMAKMQt7hEYct1FGUn5bGFKWKNPipqow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(2906002)(66476007)(66946007)(66556008)(6486002)(316002)(54906003)(8676002)(8936002)(6666004)(478600001)(4326008)(41300700001)(4001150100001)(86362001)(83380400001)(44832011)(36756003)(5660300002)(31696002)(38100700002)(7416002)(6506007)(53546011)(26005)(2616005)(6512007)(82960400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzVpWG1pZW83dlJBakVLTm9tckkrOVhMOWtab2NEWDJ1TWk1R2drUUhlVGVS?=
 =?utf-8?B?dU1yVlZqVnBSSnJIS1RwQzVXbmxOUktrVUxnTWJoRmRWb3E4WUZSV0pMRHU1?=
 =?utf-8?B?YU1XV3RTL2lGdUI2TC9GSHdsbXNlTS9uY2FMZGozWVdzMG1xNVFpMHduT0t0?=
 =?utf-8?B?eWo2eG05V1ZrNklTUU8zZVhSOXE2VkRjZ0NiOHU5L1VweHNoQ2VwQkFhZlE3?=
 =?utf-8?B?bGJDN1NuWXlhOGtlQzdrSCtGTXUzZmVlMFFEb2xvYVZJVTExRml6QzRWMWgw?=
 =?utf-8?B?Vnl0TDVxaE1kZUlzTEd6L2xoTmxIU2pkdzNiVjdMSHp0aFUxbmFXSG81QTln?=
 =?utf-8?B?bDlQMURxRjVnd1N0U0hZRWd3ZThSdVlLZm9ybzI2STMvTGgvSm5oYUUySElL?=
 =?utf-8?B?NWdubENvSnhBZ25pWTJQWFFqT3BTQ1RCck5jOWxnWEJuRGgvZHhRZnE0QzBz?=
 =?utf-8?B?QzIwai80V0t0ZTIzbzIwanlWTHZhUXVlZEg0S1ZRQkZCN0tEOUI0U1o2Tkhp?=
 =?utf-8?B?UnlvVnJ0cVk0aXNSMzBBVjFZZFFxcEdWcldkR3FZakJ6ZWFUYUZ4SjlTSkhs?=
 =?utf-8?B?cEd4Z3NwQVIzL1k3d2tnWFJaZEdZYlRQa1JwVHlJNTZRZGlqQTdZRThEbzha?=
 =?utf-8?B?a1pBTUNZNFBiVFgvLzNuNFZkcnJSOXdkRytRNUtQZWIzSGZMMU8yZUtJMFJM?=
 =?utf-8?B?MkRQQXVRMUtpMUROUHFoemRHZGJQSUpVMk5ldEUrSFZsdUorbXlhZkZUN0FH?=
 =?utf-8?B?QXNJS0F6QlMxamZKZFVsUENpMEIvOXdraGpYS3JLV3B2MWFpMjdTRmp0Z0dE?=
 =?utf-8?B?RzJtZ0NLTkxyQ1I4M0I1VXBkVGl2aEpMenhoM2srbVFxQ0hYWHhXenJEd2o0?=
 =?utf-8?B?ZHYyTE5abFVNUjh4ZXdQdlYyRzdnbHZsc1YrMG9Fd2pqQzdYdnNNZmpTMFR3?=
 =?utf-8?B?ZHVPcyszdFdPaWZFZFJUck0zcFpYTmx0UXBTbjVmZFE2WU1qZlJrS2gzNVdU?=
 =?utf-8?B?cVY0YUpJclJpamFDVk5tMlpwRHpuZVV6QVpGNnIrN3Z0eVJEeFRocjlWMVFr?=
 =?utf-8?B?QXJXK2hldXNqNytPUHJNSmI4QmJReGpLc01MbGtPemNNNHZia2hnNXFQTytn?=
 =?utf-8?B?NlNqNjErNVEwUDh4a3Bid25SRjZUSjEydy9vbitZc3ljUGYrcC9HM0lpdmVV?=
 =?utf-8?B?bXNrZ3hzQUJ4RjVlY2hKQWxCL1NCdmZ4TFV0RGYvbmF1czhKZUw2b3FjTWp6?=
 =?utf-8?B?L1JtOW1jc2FTT2RuTk9ZSU9lS2ZVU2RCMTEzaWtOb2hHNFlXYjcyYUp6Ritm?=
 =?utf-8?B?QWdSd3JMOGt5Y3Q3WnJQMklWdGxsdVl4OGZIT3JWNVdmWkZDbkx4TFRWUkVS?=
 =?utf-8?B?emNrNzcrcFJzdzFlQm5laTFpb1lCc1I3dGV4TWhkV1dRMXBDL2c1ZS9KU1RQ?=
 =?utf-8?B?M1lNTkl2UGhaMHZmQkFDWnBoS0l6djJITnY5S1EyQnJybVFmL1ozclNURWpr?=
 =?utf-8?B?V25xMEczdGZwRjRRNlJVTzRVUHYyTVFWcFpTZmZVWE9FRThPb3ZiczY0Wm5Y?=
 =?utf-8?B?SG9uSXpMWE9Ea0gwemtGcFVpTUR1bWY1NU5qN3YxWEJ0ZWxDamR0dndwVWJR?=
 =?utf-8?B?NlVHMjlUaHRDWHpsUE9RcEhoSGFidHFtRGgybWFOMlRQZXhMK21kdnB3S0d1?=
 =?utf-8?B?WllwQi8wcjg3REJaRS9SVUpiUU9zZTRnNVNlWndkRnZBN0JqaDcybnd3dWdR?=
 =?utf-8?B?TkpaMmVGWlJPa3VzVXRDSXVKOXQyWng5Uis5VFlRdjI2bVVIeTZRSnNMbnFv?=
 =?utf-8?B?UDJrTnV2WXlHT2lhaFU0cVVoYXVVUFZIUWlFdnZmK2JJdmZ0clE4Q2VGT2x0?=
 =?utf-8?B?Q3lBTE94MERER2h0YkZtZk5MaTdkWjNKakYrSWJCQkU1WGFJVDV5SzdaVWlC?=
 =?utf-8?B?d2tSOFoxSGU1RFdwTXM0SjkrTjVrMGJYdFBWVk9HTW82WXJ1VURLOG1ieEpw?=
 =?utf-8?B?T3VUd0lxNmxjVjRWb3p6M21Ja0ZQMCtkMjBxaHlUVERJK2ZXQlcranlkRllQ?=
 =?utf-8?B?TWlwQmYyM2Y5Yi8xKzFTbkpHbS9SM095eFNkblpZVCswNGRQNTY0NlZlU0Fh?=
 =?utf-8?Q?ArtbYWo8JyhKzHXhBWu9NwNvb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bcda90-f324-44e1-1857-08dbd1b30073
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 21:24:54.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBhB8nkqPYl+CsmtFQrddJ317DWbQcjcWzPBcT81ywOk7PqcWFDkCKKCdtj2OeGDu5S1/vhZDNlUzjnNyD9nKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-OriginatorOrg: intel.com



On 2023-10-18 17:50, Jakub Kicinski wrote:
> On Wed, 18 Oct 2023 11:12:13 -0700 Alexander Duyck wrote:
>>>> Based on earlier comments it doesn't change the inputs, it just
>>>> changes how I have to handle the data and the key. It starts reducing
>>>> things down to something like the Intel implementation of Flow
>>>> Director in terms of how the key gets generated and hashed.
>>>
>>> About Flow Director I know only that it is bad :)
>>
>> Yeah, and that is my concern w/ the symmetric XOR is that it isn't
>> good. It opens up the toeplitz hash to exploitation. You can target
>> the same bucket by just making sure that source IP and port XOR with
>> destination IP and port to the same value. That can be done by adding
>> the same amount to each side. So there are 2^144 easily predictable
>> possible combinations that will end up in the same hash bucket. Seems
>> like it might be something that could be exploitable. That is why I
>> want it marked out as a separate algo since it is essentially
>> destroying entropy before we even get to the Toeplitz portion of the
>> hash. As such it isn't a hash I would want to use for anything that is
>> meant to spread workload since it is so easily exploitable.
> 
> I see your point.
> 
> Which is not to say that I know what to do about it. crc or any
> future secure algo will get destroyed all the same. It's the input
> entropy that gets destroyed, independently of the algo.
> 
> We already support xor, and it doesn't come with a warning saying
> it's insecure so we kind of assume user knows what they are doing.
> 
> I think the API we pick for configuring sym-xor should be the same as
> sym-sort. And the "makes algo insecure" argument won't apply to sort.
> 
> IMO fat warning in the documentation and ethtool man saying that this
> makes the algo (any / all) vulnerable to attack would be enough.
> Willem?

Please advise on the next step. Should I send a new version with the Doc 
warning, or will you use v5?

Thanks.

