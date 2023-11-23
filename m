Return-Path: <linux-doc+bounces-2975-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E07F6059
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 14:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E24BB2144E
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 13:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EFD22F1D;
	Thu, 23 Nov 2023 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nj698A/r"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CA1C1;
	Thu, 23 Nov 2023 05:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysew8BLSOz8d6oQbD2UfEvJFiflON3RltpyB5QqD5cYBXtsQM9spSW4DIrShx6pICJ5NfR4hPneYi5eYcAUsSrDXo2Z2hllk7d+doKL0CdmGmQ9FvTlFKmQ8q2bzpZutLf3sO54RMc5ca1F22b17rXpKLEVRX01eKpFCI2sIK4V7L1ouFuJRnE38pHEM0ESdLRJvSvbS1isx0SrMH0QcG6Zz8y5b5UaTWXmdMktbKNnlX4MEFSm2jv/6fqKo18TidqrOaL6ne5gaTFrdsBRN3aoJovHdGkQ9Y512FtlL7VbcHLSPPH/5+K3AikZcJ5dZ1tI4PQ7UB9QO+lzAqyr2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxkQWRP/60Zdzw27+TAaJ8X/W/zdq+CQedqmZL7HNh8=;
 b=NZSzDDhoTM9pQCjZ8zbF5E+D7WZKbtgZtjrEz/pnGk3+c/AePp6nfgxM7RFDVPRQBwLIqShM5kHvWAP2jBpaViCYf39XwM/Gp4353ZvubBxLm8lcWG1iaQZZSC4nh/lWhMOfq+rGRBXJq4knEJsZLkqVJ6vIwbBnbykINJQGK9YI1OUeW+k7kBdpfJko0u87liq9RxDJqOq7bb1nmogKnyHLXFpEhTlnPLCg5K7EWkQOLE1w2IV3lirV9dAVLz9VJVhKiSI44QJILGd21yrhf4YDy1OQi2trwLu/qDl9/NtCJ5ipaTW2KYePvYvAdgNfhtYTS6Up/qKnQoVq3QGrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxkQWRP/60Zdzw27+TAaJ8X/W/zdq+CQedqmZL7HNh8=;
 b=Nj698A/rcpv/SPFZyccMOQkMx5PJ028gL7zkyopInHfwbd7NKHju1gm4rYOBaoH/HUFMD0xljri3MpmdjaS/O8GPUOUuu5503WPE5kw40QVXa8bOUZOynFHUgpdbT8lltL0hALEKKnDdBA+pe/Hmq5H/nnN/sjYLGDW36sN/MzFda1yr/lQdesjg4uzcwJsidMfnZDmMUfyiMZnQU4kijMsf7mgX6JFZQdd/PugnIELtGABZEKpMoL3AJqmpygft4P3guV/JahoRFLWO8nSOnnGNvhnnFE85C/cuHATsp39au5aPpJGLarIQCCxg67jN2VtqiHPzo4vzsFCsL9/0Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) by
 SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 13:33:12 +0000
Received: from DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::8cde:e637:db89:eae6]) by DS7PR12MB6288.namprd12.prod.outlook.com
 ([fe80::8cde:e637:db89:eae6%5]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 13:33:12 +0000
Message-ID: <96d16597-12a7-4574-9c22-98a1b70bc21a@nvidia.com>
Date: Thu, 23 Nov 2023 15:33:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/7] net: ethtool: add support for
 symmetric-xor RSS hash
To: Jakub Kicinski <kuba@kernel.org>, Ahmed Zaki <ahmed.zaki@intel.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, corbet@lwn.net,
 jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, vladimir.oltean@nxp.com,
 andrew@lunn.ch, horms@kernel.org, mkubecek@suse.cz,
 willemdebruijn.kernel@gmail.com, alexander.duyck@gmail.com,
 linux-doc@vger.kernel.org, Wojciech Drewek <wojciech.drewek@intel.com>
References: <20231120205614.46350-1-ahmed.zaki@intel.com>
 <20231120205614.46350-3-ahmed.zaki@intel.com>
 <20231121153358.3a6a09de@kernel.org>
Content-Language: en-US
From: Gal Pressman <gal@nvidia.com>
In-Reply-To: <20231121153358.3a6a09de@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To DS7PR12MB6288.namprd12.prod.outlook.com
 (2603:10b6:8:93::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6288:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ee6061-7e76-41c1-ec00-08dbec28bd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OtGaZgJimyU40O9NNCgYO58wJU1r87PiaEuCQ77spGlMkmCn5TL2RJYNnHZOeKpAiR2pymIK7TPbH+l5l9sDeK3sQx0b6mfdSeyNlEoeLVsqm+BBNQl/orzuZ4cqZonETS0eMhtxr6qLCtUtPvWwFY0qZDz/PxZyREsXRf6e8o72mQeH8LbBtzFODFDJwYYp4Ss/b1e+1zSVbr+oNFIPUrSK6HXp0Z2O38dfTF3G423+5OyWWjtU/BWXNZiwPVqAxMTi2FFuCn750Vj8gH59f8Nf/CMkPRv4GBk073HduRu/Qy2Obrhwo/K2TXMTwpC1imMnQH4dAkBsX3vMysbbyvDEFEiK5GLNPtgCC+r0yMGgzSuucyPubcbzLwKQF8GV35wkZfC88rq0VWw8rHkXxHq+wmEnyh8tTv6k3YJxY6c4NK0tFOJ2NA/o9Bq8SqZtq8eOCG1pYrh4hLF7K2ZtGSv3i9aq22nS2EN+n3bxdnWQg8A5vup+Y32I0C1yhuLqhlxiPas0ltQn3XIY+bOkZyYU98qBhSJrGJNZwiiS23QGpXJTMY42Yxw29BOEmhdJGx5NQJ2NhfF/MiH91EErweqIYvqF93EKXtYk4tEN0v1mCF821SMEudmASy26FQrJ5ow/OKOABJsoe+sZeVnDYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6288.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(7416002)(5660300002)(4744005)(2906002)(8936002)(41300700001)(4326008)(8676002)(316002)(66476007)(66556008)(66946007)(110136005)(6666004)(6506007)(478600001)(6486002)(31686004)(53546011)(26005)(2616005)(6512007)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnVIdEJMQ2pBVDF2aHBnM1RNaWwrRUZDbE1Pdy9qeVFwOGpMOC9GMkl2QmNu?=
 =?utf-8?B?dnh2U1Z5d1J6U08xZDdBT1pZV2pTYkN1Wi9jbHZOUE5IakFTcXJjdVhkOUY5?=
 =?utf-8?B?MkxTcGhVRVpzUmx2eld5b0N6YmNmRzJ1aXBZbFNCN3ZjNzRaTGpVdDU4TzdQ?=
 =?utf-8?B?VGQvbzdxK2tub2NaeHd6YjN0NlpkNmRZTEFTKzdTTXhpWWFQN245TGFkcTUy?=
 =?utf-8?B?L043TVNRMnNmTTB1YzBEcGdBREtaMEd1TEwzK0dpK2tRVHVLUlp1ODJhbGxW?=
 =?utf-8?B?NHdmQ2EyYlBGY1JTYmlnTzkvZjF6R0I1c3hUZFc4VjZQUmhHckEvcExNbHZ5?=
 =?utf-8?B?OHVRdEhjdi9vS0ZCWTdSWjAvRFo3Vm5wUGd3MTNrelo0WGh1cW9sNDNyNWIw?=
 =?utf-8?B?VzYrUTlCQjh6YjJuSmNSTS9Qd3ZJL1J1elRuWWRheGg5cGRnRjJvSmdQdlMy?=
 =?utf-8?B?Q1B1am9ua3B5V0hkaElqaGlMTHlCM0g3T0FEbWdBVkQyNWJldDhsZTAvQXRw?=
 =?utf-8?B?REw1OCs4dUVKWnlyU1lUWkFacGVRSEkxcThoU0pDcmV2alRMQm00Nlc5VmdJ?=
 =?utf-8?B?V1ExQ01NYXlRUnAyajl6S1g0RzlndkNwcW1SK0Z2Z0dmTjFUTmUzSzFaZ2g4?=
 =?utf-8?B?QTZQV2dHMVRraDMxKy9sa3BDaEdEbGt5Z3BRRUF2d0J0Snd0ckRWY0NFTzJ4?=
 =?utf-8?B?dnl2VFY4Q2l2aFhocHdVTEdUUkxsZFoxU0FpK3Y1dWhUTEV6YzJlbTNLZUVy?=
 =?utf-8?B?MEtPM29TMXlKZVBSZlY2cVRtNVdHUWhqR3g1cTNMdGFKR3lXQWxINitoUFNi?=
 =?utf-8?B?bGdySUE0ZW1yUUk0OUViWnlROHUrc2RiWWEyd2l3eHhoZm15aXR3SHk3UExL?=
 =?utf-8?B?bHhpT0hKL0k3WndVL1p5dTE2OUJESlJlNkNKV2hlS3lzWGZ2NEVDcmJDSnQw?=
 =?utf-8?B?VnZFd2RuMmY0VWFyL1p3WVdUSmpmMWNCQnUvVWRMR1JkTkUyaFkrbWhvcGh1?=
 =?utf-8?B?bUJmd1dEVTJ4bWVoN0FZL21xa0IrWnVqbkd6d3F0dG1NMTlxeDIwQUp6eGNX?=
 =?utf-8?B?Zy9hVWhuY1kzRzNrbzVlakZ4ZkY3eTczM2hIemdLSWR2VU9QL204dnFHbGNz?=
 =?utf-8?B?TzNtK1VpRUlxYk1pYmxCYTNvM1JMUGZDWEMrbHJEanhKd2dlcGo3MFdSNTFU?=
 =?utf-8?B?cXozdm84SnROSlJjaHdPK2xJTVJLaldYL1dzK1Uva0d5d0g3RlJta29ub0xW?=
 =?utf-8?B?emlPVVNYa0NzRURRYkR1UlZEWVg4L0RoU1o2SnNuQ3lXSTBPWFZwdXNjdTM1?=
 =?utf-8?B?OWRDeGVKZ0tsOHRGVzVzYzdPSElHblhxMEFvUDRkY0ZxUmxEbDRoTWFpTXlK?=
 =?utf-8?B?a1JiMVFINmhaQStqVXk4QUhDNDB4OVFHS1U0Z1cycjlyVFJoY0NSUXluQzZ5?=
 =?utf-8?B?T0dvdVdZUUVoSTBha3V2U0J5bWZ0eDRXaGNnRWJ4VVUzS2h3UVF4MS9YcVBQ?=
 =?utf-8?B?a3NjTE95d1Fhcmoxa3ZxZjlUb0NEb0lYb0R0cE1TeXk2TVdUMUhuQlFXZkUx?=
 =?utf-8?B?SFVLQUFySks2WlVaazc1M0hxYXh6SnRKeEE3ZU5pTkVVYzJiNklvWUJKUXYw?=
 =?utf-8?B?SDhpUS83UzE1cWdNekI3TzltYzlVb3JkRHhhalNDUlhaQWVsS0xFUGlzK3cy?=
 =?utf-8?B?UUJ1NUpVYVB3dUFkcENzM1NTWGkzMEVxY0d6bHowVS9wckpYcVljbG9jdGRx?=
 =?utf-8?B?ZU8yMDlOM0pCVE0vcHZjdDZDL2U5Z25RK250ZGFDNmQ1b29SbmYveXdRekhs?=
 =?utf-8?B?RTBWTTlhbng4MVpsUlBoVVBDbThLcnZzVDd2Y3pyeHVUTVI5SkU1Qm15M1dj?=
 =?utf-8?B?aytGcGpqck1mYnV0WGg3U3A1dVJwM2tmVVR2c2greGNuNTRKZUlqVDFobHNy?=
 =?utf-8?B?YkdubTBiTkk4SHgrMWpQeVMrd0tOMmhYVy9jb1BpVDFHQkUyMnpUQ2lsaERU?=
 =?utf-8?B?dWFhNjB6R0oxUjJjZE1ROTFWa0hwZEVHOXFmS2p4YWQyTkRPaFlHZm9NY28y?=
 =?utf-8?B?SG05d3U4NktIWGVWbFVWWnNSelJSa2NXUytIN3NIUHdIRXdQbnRPcXFDZnVE?=
 =?utf-8?Q?2ikQ8P+Akt+vfEUfK0auyPKiW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ee6061-7e76-41c1-ec00-08dbec28bd53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6288.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 13:33:12.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjha633eUSM7A1zGlQXfLhX7kT7MhRgfCCJcV/oimfFVj3DNMZMz0FIPgeBPVQE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144

On 22/11/2023 1:33, Jakub Kicinski wrote:
> Last but not least please keep the field check you moved to the drivers
> in the core. Nobody will remember to check that other drivers added the
> check as well.

The wording of this sentence is a bit confusing, so I might be repeating
what you already said, but this patchset needs to make sure that drivers
that do not support the new symmetric flag return an error instead of
silently ignoring it.

