Return-Path: <linux-doc+bounces-36514-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 336AEA23824
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2025 01:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7973B1884093
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2025 00:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A6D136A;
	Fri, 31 Jan 2025 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YL1Tx9re"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E56ECF;
	Fri, 31 Jan 2025 00:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282455; cv=fail; b=HueI0OLMFSvpqVaM3TQSp4S8UYf3qKqDh5C4iqDkBGdF3ZIoLHpVxfnP2gs9L1u6ZZR6ICtCxvrNLO/Z6B5q+rY3rH9kLl/y1wdHPs2ByI+u5AEN75su2/IocUFJJ56ns9NZjiEa+HOzgQ+K+8MrD3riiaGDpX5V5j04FOgGOB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282455; c=relaxed/simple;
	bh=3zavP893nO7zOxQLVFpktCX97lXvJjOANBulpE2gsaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gs3qzCIhZsA7H89luMlVg+uzrxd80H4X3PCHrMt/teCBG1Uz++YJaK29bLatPFyhra+j5cRFishYySzcxlHBll+M1iVMkWd6+C6qWZyNgRznCPRC0DbVJPZdlIw01cxHsAyM7a4M7freV7xTszGNTFRJyn+3m+pXcE6/n7UVshI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YL1Tx9re; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1ZyAQOzACdF/9e23rD/uVgmRfHmdLn0TzMvQx5BQbLSZ0tJiQopMeLAhKbptOXDeFEJU6h0GKMoEQ6SUwHx0qThvkTf2Vas/X3FFR+ILVeOCEzeumA/0irhARjSDgnjPcYKmabIiCnvp87PkPw/eU2MoEBiJtfInG7tghyCBTWy/64PCz/foL085Ypsl8cDFqlcbJsf3Y/FTo3D6Jj893778KEVJQ6rgbz4cow8QOPwd2U9IkCC2lIwvgQuM3Wv9uCjk+6FJMKygJ8DYMEPXDtFb4B0rD+6s3x7SuTT5WlLa9FN98WimeIovXW6xI/mIEfsr8IIssGgWCfgGA+RxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H9XqPoeWghVWbr6WyBez6/QTKW/JC424R/4Da4sPsI=;
 b=T8gq60cBPisr+d8ckMJ1a18PnME+wYTgDBGoQmnenn6y7T89jEjTVQemg34Ima1/UjR57UM7/sLQkdorEyhcpJybO6qhvOeDCKvuvVU/fHCBNA93B6S6e3Cs5V6Zii+39IwQA/WTH5fFZj81d3OU1hlYUl3E0/e63Fp+CMmrFSACYd4Dc/As4Pb3WD29wx1Uw9/dtooP7cW5qrTsJFqM4xoPPM4qAukMm6mt47Wh+AS3yG1fMLAyakf/EeSPweDJ7vvIq6+TS92FdkcMJR4uJutsNC1n+4ilvIfFYQj7EQInDLP13A0IlLzDksUwyBcO+vS7Fp44OkYy9xg2E1Qq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H9XqPoeWghVWbr6WyBez6/QTKW/JC424R/4Da4sPsI=;
 b=YL1Tx9re7jr1/hkQOnSfU7jSQTrKjilX7pJslkQqfq3V2o4OMNe5K9b+wb/6moR3UPzYoQMX2PhE8HeBq6glhqZmLPcMTc0gu9GQuWxLMNM44qoPnD0PBeGBgQLvwuTbHJ/tio8cDbs4dtDKIr6oecvvh5sZIBBuNA1+wZW+2my6pGsG0GWomZW3kDcNuhzBdVFLN+Ss2ioV9g/t5LOPstt8ILIMbAeT3fNsZ83xsi2gnZCmq4bLNit4y6D8p291rQi2aWSAoxS5mwshZZ11TryvYisNTFWAquRfN+15zAVTYBsp1+t0b+HdE8UbgMYg0I7ypHQE6brS67zFP+crvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Fri, 31 Jan 2025 00:14:11 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 00:14:11 +0000
Date: Fri, 31 Jan 2025 11:14:06 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, 
	Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <upvlv4b2zly56trmoaocs5gl34ykd7tjz2grzqtwkfy45gbm7l@uxsmqdjgyo5n>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
 <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
 <d27c35d5-918f-4550-9975-eb7ba59ac9be@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d27c35d5-918f-4550-9975-eb7ba59ac9be@redhat.com>
X-ClientProxiedBy: SYYP282CA0005.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3f5606-4761-45a7-fbdd-08dd418c2fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WdmNBnEGOH1D7FefbO+MLQ5/7Q958P7OIgrLT4zmamZJdtrf0OXVO4ElBPt?=
 =?us-ascii?Q?/ay90ELX1xuTZ2BR36H5+wOmPZ6r1qdJ6x+5rQM6nyQ7fkX+s0qgl9d02ECZ?=
 =?us-ascii?Q?g21eQ+kHq1+cRqnepYWq7UoVpdIAdpNPJzGF3ReraiZhWsDAPdwau/3YE2+L?=
 =?us-ascii?Q?2MqauLTH1z5Si66Ag7pP3JNbpSudV4Y5fJoxxF96DUQ82QVSaK2Z0UBaM1oy?=
 =?us-ascii?Q?WsFu92Q5ysLjpXORjpXTz1wFhLpWvJWmEx5O2TT/y3nIAdoRiSTJKkqIoxJJ?=
 =?us-ascii?Q?cN1XsEhVLqvbHYRm+lXjZ5wJsqOiabjzDnUs4mri+xlmVphY1FoxuviVmmja?=
 =?us-ascii?Q?t+sx7U/EHVCiy9YB8sd1kjmQdvyTvlJ3Y6mec7vtV4fgV5OJRguwahwAwKXh?=
 =?us-ascii?Q?f8UdnlYq4xyxtp70/meuLTj2/QD+hw2ECDsS7eNamoURGu5b53Z+vslbMVFM?=
 =?us-ascii?Q?uA7uC0TGDbkQOumc4Z022hyrNjRvEM/vOwLvolRE7u/+OCmNcuAB+qaHANw3?=
 =?us-ascii?Q?6haB9NmswyGJXHFch+RjwgKn/zfwl7/0JMjtph0bIRaRnMHcwyXXUlPNvH6s?=
 =?us-ascii?Q?YZk3p+Q+fkU8l+54PVsmbCQj8ijNAmWkY36bqeypSbHp/FK3ekH7p//oMP+u?=
 =?us-ascii?Q?kiagvYo+f9ZWs3VnzchhTc+hQdNww1TFW6711bU7kCPOwMk7qU4BaOPPhhHo?=
 =?us-ascii?Q?xlRNE/uUlmiHdxfokQFA1HjyE5AaEFbw0Ko/BZ176fHXRt1IsG6xWN1XhsJ7?=
 =?us-ascii?Q?ibLvWbBg5727Its0lHNYzFJKS/LE/entkWBSXDcimzWVYf1KwO2XBJgxGqZg?=
 =?us-ascii?Q?2alhPGGV/iTc2CZcyAa11Du5boMwEdXfZAYk2IgpKVdTHfsX5H5Upqsod0AB?=
 =?us-ascii?Q?EUbBOPvQCIBX0qntQ6LyPHX4hXW6Z/GIRh+xtwYLxdd0Pm2qGfb8uJdOqbdp?=
 =?us-ascii?Q?Pn3kRQx9CSiWSWO3za3Nr2oAgJToRb/+Yh2Dq9sljX+/hudVRa7lKH0Gw1nw?=
 =?us-ascii?Q?3Rn08rLMBGNmDw75GbatHBX68GH1teOktw52X+z324s1r0+IOPfuL93ufq7D?=
 =?us-ascii?Q?zRSXhjNPXJGx92/vqSMKOhJf8fBCrVSjM4jlJbjzuxbgT4M0XwCVBnXz+0Md?=
 =?us-ascii?Q?VxZy7ngKJQjBXiNRV6r3eHnhF0pp5XBT513Lx6//Pw1u3l/GyaLhzMD/pcqo?=
 =?us-ascii?Q?tTVo1KaQ1FLgstkq5EVN9R+J56syzusNNTdAl8AJSSzPqxyptbP8ITblZizr?=
 =?us-ascii?Q?9oU/i7yoBmc+YMIPAaQrY8QiSSdKBPW35r4ImwP9XV4aG2cF1Kt/Ny7xTQrZ?=
 =?us-ascii?Q?InqGrM0Urqj6xBLEY8+6rFoqzIsp+cF4hk7gU8mzlAUCRrgG95+K44/uTH12?=
 =?us-ascii?Q?tqRlus7yT04Qea48qdZtorZ2smPs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OE6dtCC/VBGV8J4iMHBYoOjSJ1QY4tMJY4bO2vCqRXqSbotlv+RUcw3ep9aj?=
 =?us-ascii?Q?/YEWqoMUVnT2n0Hgi28yK0/+dRr5+3JSAhmtQz11B8Y429s7TB1nygrkp8K4?=
 =?us-ascii?Q?MnIPNWJxu87ZR8l8QN41x315qvPpktZ5aFfDEGjso7SmOU9NL9QqEeN/nrzB?=
 =?us-ascii?Q?RFdxx706oSyxEvZz3EHUyGfQfv0DNhLGTddwwE/kWUdxisJg+J75EF/HBQBb?=
 =?us-ascii?Q?/o5hTJR2269QfoN6dNmkjrIRCmRMlHq/iQC7A+Fh2w2I9IHjr/iLOoRPni8s?=
 =?us-ascii?Q?n4EX51bIAJVbtyfAVtURVzyfZXHEqqKNyPMyAccdph+PNs+7YW6NjIPrNQoM?=
 =?us-ascii?Q?1Y5HBmIQJ1qsEwvjczC33mml8ucMQ+pKdQIR98jD6aFDPhLfMhI5suTeTxqM?=
 =?us-ascii?Q?LPgS94DFu++aRmmUUUpCaBzzviPja5IEJi+WoOL6HfU2qWShNjsZs9EsaEmP?=
 =?us-ascii?Q?0zb0iOt1Pwb2pGEpH4Nc6kzkmeSuNxhfm26HUD9LoC/LruMtWHBdYie7wHA1?=
 =?us-ascii?Q?7ovPreb1U61e07hOjund2cRKiY4JipWk75vggMudeHP5XWBV+FbEi1vJs1MS?=
 =?us-ascii?Q?11FCRQcUG9kbVMTIr8a38vxz/bVvBeg1E3LWPBye482dbHTxNpXIF8LTel4J?=
 =?us-ascii?Q?0sX4UZ6zVVBxF1wEOQSNfcauMbHGGjFydjUYCwh20+JhvHiTiwvNtbpo09Ei?=
 =?us-ascii?Q?QyNmG4m6ieh3MpQqC1YMU9qZg4SUP21LEBWf+8uTfXQhqzzeZwANuI/epGig?=
 =?us-ascii?Q?51HCI7JGv9OqsnvBLcR5YtuW0TN6pauMWy5a7h8m4qIadNa9FeS358Up7zE8?=
 =?us-ascii?Q?vFQR2d3UV4C8/SPeq/T5z9bcJhviEG8Y1aHomwofh84h3K2/VOAoajh5yoP1?=
 =?us-ascii?Q?6ad9J3/J0vrke2HjdEt4v5S2zKX3SaqXZ8gwOh/dwtl59jPYxIVivr9fpFo8?=
 =?us-ascii?Q?oITi4jN0ZJSo9xzZ4niw7l1PzugJW2IDgoBZSP8kBNOmk1R5IzUlPM1Qi6G6?=
 =?us-ascii?Q?hBh7/myO5SvwA3v53PjTMmywpeqeogLYuJ6fVz0PIYQhturVdlpfUk9GPEC6?=
 =?us-ascii?Q?dBYzI9C3ze4U6fyYOCuf1WVe46IbkXzQ9WwTFLHWKg0+Ln5oJesNZtUMY1gb?=
 =?us-ascii?Q?RGVIxwQPTws25vBvxa3BEeZQ57rAlQP1VNDLc4AXPSz1yX9RX34pCcQLfI4k?=
 =?us-ascii?Q?Jc3atTnm5lI+gEH/qqIGTCWDVkuBj/0QHFdAYlCaodieWDQ3ugOtpXthr31D?=
 =?us-ascii?Q?3Lq8AACYXV8VXYRzy1RtQlYGVHzNhsHwYV9MHOV3AWH2JlyCwBtDsQUYMw9H?=
 =?us-ascii?Q?aXLVm0oHVza3Fcn9HGcrH990riUiJj9kzuqhQpAqIO3+3/n6QrlQuXRcVa69?=
 =?us-ascii?Q?t9WIt0+vHKWEK+xzHgRXL3Ws3Otuye3C6JShQcSe6UJWYGn1Uw5eNmqbFEtL?=
 =?us-ascii?Q?snIi8rym+BL8SIT8ouw5ZgBkMGXImHWuTB+m08Q4tpCTfUUPF1mJMvdqA6xR?=
 =?us-ascii?Q?wZJIZlpV+4jWH2He3evbz2Qmlrbm5KGl+UUMkGHSMVtpuPgWqChbfUYg5WLi?=
 =?us-ascii?Q?S5I4ts9EIxo+AVBlsT+tbmDOzVOFpb3PNbOIyPU2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3f5606-4761-45a7-fbdd-08dd418c2fb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 00:14:11.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHi1LxoZ3o57ZHrHTUas86KSZQOHh5B7ZN4EaQzR3yfIJ7ncHFyU2JHpphr49WbMNaxTimQPi70ArC91nMAMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

On Thu, Jan 30, 2025 at 04:29:33PM +0100, David Hildenbrand wrote:
> On 30.01.25 14:31, Simona Vetter wrote:
> > On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
> > > On 30.01.25 01:27, Alistair Popple wrote:
> > > > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > > > Let's document how this function is to be used, and why the requirement
> > > > > for the folio lock might maybe be dropped in the future.
> > > > 
> > > > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > > > the GPU got a chance to make forward progress by mapping the page. Without it
> > > > the CPU could immediately invalidate the entry before the GPU had a chance to
> > > > retry the fault.
> > > > > Obviously performance wise having such thrashing is terrible, so should
> > > > really be avoided by userspace, but the lock at least allowed such programs
> > > > to complete.
> > > 
> > > Thanks for the clarification. So it's relevant that the MMU notifier in
> > > remove_device_exclusive_entry() is sent after taking the folio lock.
> > > 
> > > However, as soon as we drop the folio lock, remove_device_exclusive_entry()
> > > will become active, lock the folio and trigger the MMU notifier.
> > > 
> > > So the time it is actually mapped into the device is rather
> 
> I meant to say "rather short." :)
> 
> > 
> > Looks like you cut off a bit here (or mail transport did that somewhere),
> > but see my other reply I don't think this is a legit use-case. So we don't
> > have to worry.
> 
> In that case, we would need the folio lock in the future.
> 
> > Well beyond documenting that if userspace concurrently thrashes
> > the same page with both device atomics and cpu access it will stall real
> > bad.
> 
> I'm curious, is locking between device-cpu or device-device something that
> can happen frequently? In that case, you would get that trashing naturally?

It results in terrible performance so in practice it isn't something that I've
seen except when stress testing the driver. Those stress tests were useful for
exposing a range of kernel/driver bugs/issues though, and despite the short time
it is mapped the lock was sufficient to allow atomic thrashing tests to complete
vs. having the device fault endlessly.

So unless it's making things more difficult I'd rather keep the lock.

> -- 
> Cheers,
> 
> David / dhildenb
> 

