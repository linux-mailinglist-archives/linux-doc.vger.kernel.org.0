Return-Path: <linux-doc+bounces-93049-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C09SHT/rOGpFkAcAu9opvQ
	(envelope-from <linux-doc+bounces-93049-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 09:58:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D64936AD751
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 09:58:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=is9oaNMz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93049-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93049-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E023B300764B
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 07:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFE6382F23;
	Mon, 22 Jun 2026 07:58:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD3380FF3;
	Mon, 22 Jun 2026 07:58:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115132; cv=fail; b=dVXaeplAF9fV1a118a0nF0ah4rkV0QxxMfN56/WZcu0wybxfSVPQZTRNUHf9BGafdPVfdsGe4s6oR7OXI99ImP784Nv8OfQwGxi4QjH234uGVekObW8aGfrHlwohDtghgZya3FQ5+Z3+1JLIU3GhoD0cTZH6D/hApT6AJ/Ejkdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115132; c=relaxed/simple;
	bh=lhKY9etCnJA3/I2fuAp43H9m2wzKW+K9NNHAD2KkssM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RmSLjfXjjnY5geJHZOAPeS0t4IclipwZjSRYrEDplOauWFYO3ELVk221cZ/hUdKdK4R+MUzUjJiNmcTQe9I8DbqjvtJso2nIPta3W7ndx8y7YrHX8XrESxm/D3gvPbvFVUqTH/FnYix/EuDVhK4e6AAgeuPcsPFuWanI1MEPVSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=is9oaNMz; arc=fail smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782115130; x=1813651130;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=lhKY9etCnJA3/I2fuAp43H9m2wzKW+K9NNHAD2KkssM=;
  b=is9oaNMzUW0ujybKUfmp9YbRd7B5iCduUtdzdU/N4mHvAWZCXOjRt289
   ZupsGcX+NODabGQg+c1dVdbzJIEjrU/R/Sbrd/v6dq4NYxcdtTwBg/8dC
   Xmp6ms5kWBKk9KUSb/evEBQBT40OdH65VA+O8lDka4JlO9i0QB63DmHvE
   DKMct3NkwOZ63R85ajne89tUw1GFhb0uwZD9w4303ei0GcIVQHjLtMmcK
   wcXohgX6BJbiH2gSDF9ym/FtAb0JKEzHCxxfwu8rxPi+XW9fyDCRmtd8u
   e762U0mjtGeZFMHyfubAQp00ltF0tQpVGDDpM7UPomvPpb8Nfuc3/07hY
   w==;
X-CSE-ConnectionGUID: pFFq9Q0IRt2G6nR1l7zDuA==
X-CSE-MsgGUID: 8piwz1l+QlK0NELdpSjCdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93204492"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93204492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:58:49 -0700
X-CSE-ConnectionGUID: nLS4n/G5SK2QIWgxpZ3mHw==
X-CSE-MsgGUID: 8nwwG6u8QTeqM2BiLUN3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="245010789"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:58:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:58:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 00:58:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:58:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMpvMV/cGySFaEA+hJDKcpi+EBW7bk6UJoPHjhcEPHhu+fKeWyvo30rMfwPtVbt7hkaclUPgGuT6WCBL3wurYY/E3dfEelxGJsSCwNKdWVdU3QsOd/whOJeNZeEVQZCAZVqBEhJhd1oJ+WcE08uIKLp561UbbhGdCLb0ufsx7o1i380TNgxq5UHDPELYsmqK2FyC5lNnL2wRovf1mehyMWaT6WLQYIPnVJRdxunShjzShSA/Y2tbClMSnwSM0CaKGvdjOJJ3Y6B4ctdDBEmca8avCnz+bImXFS9cdhOn7vjwCHEJap0sYBFMiCjrcgXHP6xNvC+PiFmThtZZsM8QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhKY9etCnJA3/I2fuAp43H9m2wzKW+K9NNHAD2KkssM=;
 b=yyVvud6/meHfXL51v6y/jJbeuYYep7zxgf0Hcj4eHceyy+B+T2v6bOgeIGhiIdjb/4Kdp20stehEOLIs54M2DMZIu7RxTfMQmvPzXxHNkksvG1BphmIzjFq00PwHk0T0vlgy/lXzq7oC3HcCgQ1WcmEie4Ts4fDv2nnP3YpPppmyiRf8aWP0/kodjLnwOlYwQZ9KbpuFiU+eg52pfgLiqsS6cWHXtCrLJWxEV1qxaZ58k0KP3FqbL6qHC1eK1NrZpxzd60sxzPU2p8x/I1h87SxZpRk1jvNJALWIl2HKwRu/9I/Y7O/1UA7eU/dCg5TGSnqAYrCLuiv4EZEukCkCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 07:58:43 +0000
Received: from PH0PR11MB7472.namprd11.prod.outlook.com
 ([fe80::1bad:44dd:4e60:6475]) by PH0PR11MB7472.namprd11.prod.outlook.com
 ([fe80::1bad:44dd:4e60:6475%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:58:42 +0000
Date: Mon, 22 Jun 2026 15:18:11 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Fuad Tabba <tabba@google.com>
CC: <ackerleytng@google.com>, <aik@amd.com>, <andrew.jones@linux.dev>,
	<binbin.wu@linux.intel.com>, <brauner@kernel.org>,
	<chao.p.peng@linux.intel.com>, <david@kernel.org>, <jmattson@google.com>,
	<jthoughton@google.com>, <michael.roth@amd.com>, <oupton@kernel.org>,
	<pankaj.gupta@amd.com>, <qperret@google.com>, <rick.p.edgecombe@intel.com>,
	<rientjes@google.com>, <shivankg@amd.com>, <steven.price@arm.com>,
	<willy@infradead.org>, <wyihan@google.com>, <forkloop@google.com>,
	<pratyush@kernel.org>, <suzuki.poulose@arm.com>, <aneesh.kumar@kernel.org>,
	<liam@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, "Sean
 Christopherson" <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, Axel Rasmussen
	<axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
	<weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, Qi Zheng
	<qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau
	<kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe
	<jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-coco@lists.linux.dev>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for
 KVM_TDX_INIT_MEM_REGION
Message-ID: <ajjhs+bEfgpS4mFR@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
 <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0031.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::12) To PH0PR11MB7472.namprd11.prod.outlook.com
 (2603:10b6:510:28c::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7472:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcd5c92-c136-479f-04bd-08ded034142e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1B+OdNLW8d1PlCMImIWyD1dEfBRPHN1f5uQ+Id+V3PzENni3Iv/3XUX+3yt5lAQvIuJhHFsf86rlbDoPqE8q9NoeFI0D4F44GnBcHZHDNj6GIKhbBnLhnN8EBLPCV5n3S/EB2712zwsO4aPKPwtR1U16FwZVTDuJm49+aJLSNd9M3uTPem/O9uPm+ne1xPGWRH15S0/C+gU9o7Su21lGOcmKGz2nGlgy4QiI55ki/PbV9u4Z6iFladLjG3d03BFWpzVm1m0aWEjyjIm0eYpI7RJgDB2L3SNS/wdjOA9vSnnk/79ki9e7FOlqUFWbaga4e/v7B1oDBLEKESf3p3DYXJYfu5FbF96rBzHx5bqu869CBVj3kxNgr4QX99bbEQAirXAmyen1t6qLb2D2cMreAN+MX9SZk4C/vW4am6t0lhtz9u/kc7XHIgQMAf3sXZwCm+PqGTErronPS0EkhpLooTd6codFtqn5Ll2UpRD2WvucyW73D3oeILzpI4Md0wODONwiEIV4oQ+pZ64m/1YCYTbzTi70LpxSq4YBpp9/n6HKNm4UIfL9ZxJkyxbDUyQlMdqY8pRfwbagvsynKvw2ZR5AVLBdIBV9K1SFu2/BYVMpwtMrlDTfDMK0WxakLpOl8stPWTMjXb/L5mswrk9X7bh9BABmdN0VwHRNBXCXX4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7472.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHBT0zwvvFAdvsOWMC/xsWojo9y8SyNMYv+RDoyiD9IqwvnYEIT73vuvoqNH?=
 =?us-ascii?Q?y04SYVtK8r9+ykBZ+pn0MAO9ceuT118icSapSOXx5UtdE1OIWzILSL+A3p6W?=
 =?us-ascii?Q?hyU4YNnQk7AvyRP9A1qLbud63I8UYrKmgMSRtBDyVm1W6QXd6W/UuTqAjLa7?=
 =?us-ascii?Q?21hdkpOdAx0ntbHzRfTzrjqXUSDzqNghw78YtGe1pZ8lfbKL/D9BXCJwwW8c?=
 =?us-ascii?Q?oduWG4QW69hPaf3cVOelmdO3YbfypIccurwhLo/um9xEkQ0BE11s3AxMuN8t?=
 =?us-ascii?Q?9A+1pVHa3YC7707bhtyfpqJVDnp5HC7tWXqQV2uKF+JzWlbcdTWvjnHEWOLO?=
 =?us-ascii?Q?mnpxkgU4U55zsenxWGFLbgQDtzX0601oz7lL/a02xetuYyIGtI/ISIzbL89H?=
 =?us-ascii?Q?t+3VjY4Ym8xjYdthk5zuwYY9ItWopV6loweML/qcOrkK2oRXxcBEERlfjCBx?=
 =?us-ascii?Q?/3kcqik6R781A5n6vEW8oBBiEJ7wHGy3XW/092CM1/C82bRP1WNoBOcoMIUi?=
 =?us-ascii?Q?QbZQT0xtIRHcEVYTi4ltBi5i/6t38BkhjViyV/zQWaHGB4OALaiZXKXWGrnQ?=
 =?us-ascii?Q?b7bTdtnTqYW7GTn1POJB6NAPIcAwbvTMGD+tf6eKZ7ylS+IwTvWuv/sfh2on?=
 =?us-ascii?Q?DLCm5i5YAs+za51DSfbknIj4cJCUO0bl18ECS23qPxzzGmSiVLPNqrCo8JXP?=
 =?us-ascii?Q?c7uvy3JkTfuss2S7qr2yCl555dSzmf/2oVk+rnbeYd70tLuUJ8nTGH8ub9wU?=
 =?us-ascii?Q?UmWhH4GFyk2w6cpH1WAZAowzCGyXfWYBYscMHNFa+MA57HDahVrNTiviLCwU?=
 =?us-ascii?Q?KvCpV6hAZvYPspsUDt4KTBAesbY2z1gWEKVe9Lv4ZXtmGKgOrhOU3NNI06VR?=
 =?us-ascii?Q?tD1AVm70jU1WJOH842GEojqbxYN1gpEfDO4sugKTKJ2oMWbwdNSPzO6sIxmY?=
 =?us-ascii?Q?O8e2mjv6Pa3lrf1aZ+qcIiEjCPyLGE8qH08d9ZQxgRtWdtLARofs/zQiNQue?=
 =?us-ascii?Q?pGzc3kFUtWuvoGYAEthZQRR91PjTHkkplFi9RGTCykXEqDa2OMBWw6XoeQPO?=
 =?us-ascii?Q?HEvTcPBpikCVRlncQFaUIu3OF7W/xbA1dZjL1ixr6ubUPsUeyC9iW1Aqz+il?=
 =?us-ascii?Q?/bvV+doEka7BgEXPkzRtiv33rbvTFK4oDivhwbQ+ymE0ofdKgExGqEU4CvA0?=
 =?us-ascii?Q?ABMxKpEE7AdFe49St2GACXai7DEVH5y3eO9S3fllBrXBMLecxRGeB+2sTu8P?=
 =?us-ascii?Q?l0nT3acMCo5d2RehHCDjDowumNKGdX3/pmkpIIDZF0grVUvCbC2XK0TL5eop?=
 =?us-ascii?Q?7QEEBCdHHIskBoqjkrV2F9/5p7yZGRiVX7Z5D0RR5c4+Qbub4GPE1BZ9gnQq?=
 =?us-ascii?Q?I24gnvvrASVxQ2U4OPYI3DJxHEGN6zDXdIAWyBKpQNOX3ukSLS5Se+e++g0I?=
 =?us-ascii?Q?VpAErmnQU7MaXO+BqP78nWugaySwDnnMmAPSXrSEEeomottcVgOktlAzTo8K?=
 =?us-ascii?Q?W8u7Yl9f7Y2LV43GCwnnxWIwNLNRiyrV9IJU3IW6ZcPSw1WogRhf+X2u7lZg?=
 =?us-ascii?Q?cjuPkWVw3WdUs+5v7Q/65xhxmnIcG0PK8lK4bG3IXcpzy15pMNhxXdfNdweY?=
 =?us-ascii?Q?cwtX8X70aofV6t9l/0tw6i5MyrmEsRKQoLBklE/ZoO7Ps8Axi+spQH1NjhmW?=
 =?us-ascii?Q?kIZHQRYNiDz8lzYc6xXmoTgWGdcXv/gvef+v3DMHBkCaIJUm/GZnbDuF3kC4?=
 =?us-ascii?Q?zUs4gT9+7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: kaxwNY6zpcD170oQbPSfM2tyKl+1UY+zcWS7d1LpfmKz635osuzH7+o1yYKRCt6lZ2WHuUT8eWrF/FI886r0QRm3XzOJhw4IE/XcVZKFA/KjRrW7bvz9c0MNA4n4MVh39yM+z0jZ7oJ9yxJ7uX4dRYZ5GI7MJVHL7n6yGoSWJn4Ntv862Wrls/RXFfhAXbzZb2Hwnc5PDRuXZ+6LCz3DcTsqe2mkhxxKp5hhfxjQsdlf1iDKWKTx2qlbvTA4ohmLitIoCw5/Br3ftPWatw7fAGorjeOCh6QtdElAzEGjM0DSod11YqBWH0EAPWioukDf3M/GYcy34/xKt0mPLaZJoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcd5c92-c136-479f-04bd-08ded034142e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7472.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:58:42.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvTTRoNLofmSxhWG3Klz4SfVuj7SC8EDos1vF2wzHt/wFIkYEiDc/OosRqO4MZiGNeeQ6My1vMmbGFlNk9D3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-93049-lists,linux-doc=lfdr.de];
	REPLYTO_EQ_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tabba@google.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huawe
 icloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yan.y.zhao@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[yan.y.zhao@intel.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:replyto,intel.com:url,intel.com:from_mime,yzhao56-desk.sh.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yan.y.zhao@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D64936AD751

On Fri, Jun 19, 2026 at 12:09:54PM +0100, Fuad Tabba wrote:
> Sashiko flagged that when src_page = pfn_to_page(pfn),
> tdh_mem_page_add gets identical physical addresses for r8
> (destination) and r9 (source), reading with host KeyID and writing
> with TD KeyID on the same address.
This is allowed :)

See below description in the spec [1].

In-Place Add:
It is allowed to set the TD page HPA in R8 to the same address as the source
page HPA in R9. In this case the source page is converted to be a TD private
page.

[1] https://www.intel.com/content/www/us/en/content-details/853294/intel-trust-domain-extensions-intel-tdx-module-base-architecture-specification.html


