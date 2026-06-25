Return-Path: <linux-doc+bounces-93472-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z+8ZCf+JPGrKpAgAu9opvQ
	(envelope-from <linux-doc+bounces-93472-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 03:53:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024A6C23D3
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 03:53:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="dFlfRoD/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93472-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93472-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6893A30356F3
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 01:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6E9383313;
	Thu, 25 Jun 2026 01:51:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D43876B5;
	Thu, 25 Jun 2026 01:51:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352285; cv=fail; b=E1jW0qlbhVKqTjpLpMOYTRcqOcYjkS/N+dMzf9nPJEguTWgk4Nd6LspZSkp3sW6pI8TQTAR80CnS9zMcSIxPg3uNQtByRSLS7bR5oj8sRicbraZs2JAIiaAEEFxXLFxt8RnLDS8FrUF+sYrEBYifWf1FCAo48bAe13wwI2+yAXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352285; c=relaxed/simple;
	bh=C6XVTJIElHpX+QIGCrdJpKCuNojy/oGKyvEu/s4PFVU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CAznpbx2SI0sliPySWgRa4q5I9K6U715OYKirzWsLHWaetbLlp/j9l322QhnV3YUClWuKLfuM8W4ORj63Qxy7UvhHOP3KKZbWvzpkKEsrIx1dM86LKq5SBB9IA4HUyGXtTugmibiQTpiLkv0VZgZIv+GY3R7lnx1cGdSYgCxyyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFlfRoD/; arc=fail smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782352280; x=1813888280;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=C6XVTJIElHpX+QIGCrdJpKCuNojy/oGKyvEu/s4PFVU=;
  b=dFlfRoD/gWipGf6KBCNMgi8i47vCnuuGNQOnwvwcdAJhLEPeuP+u+lx5
   w/pEfxKrHdCbrqAEt1FLLJMp77Bv7FCBxlWonfSSgiEbVpF5JhVbVCPcY
   C9rfnSIRa348uiZOss/2lsfvefcTtXPwhKUxRGlW8PF0BKpko175h88yp
   J+VYTakQi7tRUVHvslrLTBy+S4SUP+i5KlaU3uApcDDiuPhgRmsathWh0
   2CDZf+tDF9B8BLz1D8a+0HeIxzG+RN8ddcUeBb8/ATK7kE2lkpJWw8Jwk
   9vEY5gxMe18eVxte44yw5wFTCE+S6Z08cGusneE7VOjL17eucEdZQ/ivV
   A==;
X-CSE-ConnectionGUID: S+3ezXrmTSeasHEYsZyQ0w==
X-CSE-MsgGUID: rMyYols9Tb+MhyHUWMxMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93725080"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="93725080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:51:19 -0700
X-CSE-ConnectionGUID: xb94SW6qRfKVT6UkgtGKGg==
X-CSE-MsgGUID: vyio9+qGQJqjF0Wl36Jifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="255034145"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:51:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 18:51:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 18:51:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 18:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHkAioOCye0cirRm05e2c+IvyIhRMauMWbz8kQmZDq8GkyJy1H2aanz1cgkMQ01vVwOVb4wc+X1nyf78ZCG4cbip6prraIBa0TQuLRkHa5ztbPCQ6YzAPZ3lLhXpVK0uCEvNsqn1JeNZWF9eYLxPb903H0CVGB9d2gTmxxssuIepKdTa6L2pY0fksZU3VAFgq0aT0TLfW1zqv7NVXKDhwRTJ/BxqyAty95wYelMvFN7XVWU0ZeS69guRRAoOqaST8r3SZc8a0mDRQN2F1ALzkjGeZt11jNGlPidsRu/SY5rsfP6w5ugYXO++UI66EqIbZHDRh+KcihAr+WR532OYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpqZ7AB4PddwUfgiSvXzYuwNvPjiNpm1Ysu2T/OYD2c=;
 b=vZ3ewn1VB8YTmUulGeMU3O1lkeyAb1OkKx1DfotgDxHc3un+CojbTJ7AlI/IXPjAGUtQlbjtmoieqMKJiwfUvOvw4m4o3ZhNiO2idIDdmRFFqa9x4ZbzWn+8HGnWpqbNl2CoCX+wOXHFu+4/yn1T25VfMfjIUkLcdV2M3F4Z6Uz3C68N+aMlfD5xZyVEs8c/fcLkPPQP1FzdsFTCDt8jynGw1dANxilPwBiTAv4g/3ZA9/2Wyw/rBD8c5oV+4VwV+YvtDsuk1MjMkBDx2QkLd+44XapE43nhqcwjklLTCD9/E1sIzjr/YG0faKK5hdm2J5VNZDrFA7G6RvNPyxt/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 01:51:14 +0000
Received: from SN7PR11MB7468.namprd11.prod.outlook.com
 ([fe80::c17a:b7fa:6361:dbee]) by SN7PR11MB7468.namprd11.prod.outlook.com
 ([fe80::c17a:b7fa:6361:dbee%7]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 01:51:14 +0000
Date: Thu, 25 Jun 2026 09:51:01 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Ackerley Tng <ackerleytng@google.com>, <aik@amd.com>,
	<andrew.jones@linux.dev>, <binbin.wu@linux.intel.com>, <brauner@kernel.org>,
	<chao.p.peng@linux.intel.com>, <david@kernel.org>, <jmattson@google.com>,
	<jthoughton@google.com>, <michael.roth@amd.com>, <oupton@kernel.org>,
	<pankaj.gupta@amd.com>, <qperret@google.com>, <rick.p.edgecombe@intel.com>,
	<rientjes@google.com>, <shivankg@amd.com>, <steven.price@arm.com>,
	<tabba@google.com>, <willy@infradead.org>, <wyihan@google.com>,
	<forkloop@google.com>, <pratyush@kernel.org>, <suzuki.poulose@arm.com>,
	<aneesh.kumar@kernel.org>, <liam@infradead.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
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
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the
 default
Message-ID: <ajyJhZcgfYFtGfS2@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
 <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajx5Vrz9ma--hrGH@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ajx5Vrz9ma--hrGH@google.com>
X-ClientProxiedBy: KUZPR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:26::6) To DS0PR11MB7457.namprd11.prod.outlook.com
 (2603:10b6:8:140::18)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7468:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 691001c7-a1dc-48fb-ff1c-08ded25c3cbc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3P/8TwxqHtqh/YIyX3wbjw4VAp7tPQn+GPWGyn6jlbJnVFqKsDQ+4v9Z1f6OcPcKiTWjOk5ntnfZ1vcheEXT1kX122oaPdbwVyCqCVP10KrwZSNKXwfNgFkzPKplnsNjPN2ib+KkdjtMZHLey5MbyX9uDbuVluMpnOzmkS4DmUOYXjUQbXUNuDh/+ZzhSdNu3Daxu7TLrhPiE87Paovrwwix3J+40Ijj+zEqAtHIqZNVeWwnJm6LKVWUezNZOsZekF3jXMT11HAAD1bPdFlQ/qPVP4SHloKx1lDFuCtUsWKZUeR4U0pISNgGdje9QPo8LUikkoFa0oXXugMCW5Q0BRd75V0vZzI5xXOFnUsyUqQka3LOZO5SDtaY6j2x36uxXl5bI8/AHWwdr/UW7SdYTNEuVWMUeW50z+C1UrdDGl3Sy0fil29dTDwinXb8W5y1/WFAQ4T+UsOh1anMZ3YoiULQSWbyUmJiPTQtrc0Uo6gEvvWHv5zatWB9uMXHiqVmoIKW9+TNBYDLfG5E9bT/ZhoWrsYmtp1BDI4d3Cw4LTHZL1gBod9TdM1hqDBKDYkqEFhYTXTCUoi9wpdvydArG7mItA6jEmkawYUBByGdXa/ys4N4GP2GdqOYvV8pjSGWlGZscc5327MwnnL+VY+mkD5UYd1tGCWbfL9iMI/axFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pb4uAPpBfkDox81EsdlqZ/HaWIxTJBisWdg50pqqr3i8qa1fbmDUVrw3C/+h?=
 =?us-ascii?Q?NTvRsEVnaN/RXupCZOx11+3JElw6gzlfK9qeVuZGBTZuzOf9AZnXFCmPs+Bq?=
 =?us-ascii?Q?4a+Q5E35b1rs89APj4wpEbpF/96R0BaLHCAHlf3/ZNA+uswZ0X02Hx4HOBg4?=
 =?us-ascii?Q?Ow+BK++X/nO/CS9cPW5ZTxj+bCYXttdQNkrK0ErEscF3i1GlaVz+vYGjAxaA?=
 =?us-ascii?Q?cPlvhtoMf7O43SxxqjkwR+wNPNmCe0q+D7rQyFqak5BDc0BiPGarLIdw2yHv?=
 =?us-ascii?Q?nAVvvmT5rTvVL53sNFacANQ1IOUJt5aR0phTW4Rprznz8qUC6AuSSd5hrcfN?=
 =?us-ascii?Q?hMxFQHtevyA8mmdjY/sCUphpAfV9yZfpkzgWOR+da2sUcOsoU9yd13iJv4l3?=
 =?us-ascii?Q?tk9RdbqDArWJJ3E29oUzWN8lFVml/cNIcy24sMpytEbxV0hmhd/2UfJ8EG7Z?=
 =?us-ascii?Q?v4NCQyINfQYmfe/qht3HfVUkcbM9ZjA2dMdMT6dSv8Cx9FQlCWFUT5P0IXoT?=
 =?us-ascii?Q?Du455NB20heD6b37xUV9i9+1PkfjXZBcfbDyRpHyuGSWC2O+m5Y5iyvaazI9?=
 =?us-ascii?Q?7xirikYsOA12JMDTBOz8AKdfeMA/MGTY0EgzXGbyLdOtRJ8psQtfPdOWirhW?=
 =?us-ascii?Q?hofVkse0DfS4VcL0aKPEqp5Hu5Ry1DEqqHBtnw/kEJrLPMDr9/gXS/p04Dw+?=
 =?us-ascii?Q?TC9AVJjSulzlDjJElzad53/z0KJTFHWg45qU1wY4s2x0emARxe0Ub45h7cER?=
 =?us-ascii?Q?0w8cgyovKX1l2PdUKC/XOOZZ2jBpNTv0hOELs53xKZaK6JcUtD/XZU1GYSvU?=
 =?us-ascii?Q?tcyDxAvys4ZDzmHH/1cq9th+FKPUN/a83Z1MX9I06mho4W0iDew28U8EI7Ue?=
 =?us-ascii?Q?P6naedlpJSytJk3qxI+aIclDjrsPOpNw9UfidLMXTd0vTRZt5zvgKfX4Cc+s?=
 =?us-ascii?Q?BdT++RZeq4u1h7mqLZLewmldtxqheE0iv11TIClyB7WRwb2auD7cRVyOfhhl?=
 =?us-ascii?Q?ze6EVoimmGiaYDHAyxokmUsyzAg2eeR4xBQStCDqWfDEBsdTWEcORLzV4ROP?=
 =?us-ascii?Q?4USncsml04nXadLh30DlOKzQmkM75wTyMxr/c5Qbc7NvwptjzDwizqs/q+dr?=
 =?us-ascii?Q?Psg3Yfd+mn4mWiA1zhPK0k3WEmh6eFYpB569zVyN8GRXL/A7hJfECKz0Bdsg?=
 =?us-ascii?Q?/xINkroDmIU84zomYek2EuALVAIq6TL/WbL9KOi2VT3F3axXv89QoCXKqVXd?=
 =?us-ascii?Q?cTUG7uuQkbXxoNbkHQtjO/uiKyeEXFsHJLJzo+ftroKWCkFzUIXJ3rujQTtl?=
 =?us-ascii?Q?XORoFcZA6KoYCCJxYZi4GMoQYC2uatk43m7X74papXeysZuc9Ob1CullW7TA?=
 =?us-ascii?Q?BjdpM/rd0VEbGBE59Sgq1hPHsT1HVLpLxQRY9mwbmXmRXN2UGOaHwBxwyZr4?=
 =?us-ascii?Q?5x4qPno4rwPmQxRK/yiiLPebtreReai4e9nSsPocCk49sX48CrTCWFsGssQT?=
 =?us-ascii?Q?No2+o9xYvjYmeej7V+LuJ2B8Zesz8lacfxB8sm+uNxPtFMR7wgz29sF/h30d?=
 =?us-ascii?Q?taIDUaYEod6oKV0vJePRx3lMrKAH9zezzdFvu4Oce3+yD0fMpzLBZYKLnLjc?=
 =?us-ascii?Q?cc9kUHKfqjCZcEQD91tcMkN4NRD5rrCKCsHvXg4sdObPzyAwxEG+si8VPaZw?=
 =?us-ascii?Q?kY63IYkqHNwGuQCzO6uVrPx7o7Qs/848BLv5gsJjurR29pDO1sDi1dLIZ2VT?=
 =?us-ascii?Q?OTk8beXL8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: K3JI1c250hZVPM4jt2viKbnlvHnvC3MpVmQKWLG12KGBKpUbaJQJqvGsQTHUeh0ZpAOCh8l00yqnvlja9XdL7+hmE2+e/jgm7/1lFwPIdSuY1x4cVmE0JWPLY3auR4bdQaC71YTMUbhjpC1HlYc5DZ/YATcZCV0wNe8LbgjdQ0oI/CJVP9eoZZUFKTWCu3va/BA2+gR+INLTfWsil01Z4vDDZj8FdoHK2OmY/sWnO6uKG95fz1wv9u36a7epmvXSrpxfePuULhG+JsvUcYq6Wvdwl74DcDhAQjE2JfnXYEW8JzOG/SJK65X7/Py2zc6K7gedjESZMOQHDB9MUUWu/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 691001c7-a1dc-48fb-ff1c-08ded25c3cbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7457.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 01:51:13.9997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULT79I2hHVsbbzdlft9l+lnbu42yyBUQ9mzWVNug492V5EN6/ASJFJneGvDwak7lyHgvI/E/zUWYin96cFlx0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-93472-lists,linux-doc=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huawe
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:replyto,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yzhao56-desk.sh.intel.com:mid];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yan.y.zhao@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7024A6C23D3

On Wed, Jun 24, 2026 at 05:41:58PM -0700, Sean Christopherson wrote:
> On Wed, Jun 24, 2026, Ackerley Tng wrote:
> > Yan Zhao <yan.y.zhao@intel.com> writes:
> > > With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> > > MMAP flag. In such cases, shared memory is allocated from different backends.
> > > This means this module parameter only enables per-gmem memory attribute and does
> > > not guarantee that gmem in-place conversion will actually occur.
> 
> KVM module params are pretty much always about what KVM supports, not what is
> guaranteed to happen.
> 
>   - enable_mmio_caching doesn't guarantee there will actually be MMIO SPTEs,
>     because maybe the guest never accesses emulated MMIO.
>   - enable_pmu doesn't guarantee VMs will get a PMU, because userspace may elect
>     not to advertise one.
>   - and so on and so forth...
> 
> Yes, there's a small mental jump to get from "KVM supports in-place conversion"
> to "I need to set memory attributes on the guest_memfd instance, not the VM",
> but I don't see that as a big hurdle, certainly not in the long term.  And once
> the VMM code is written, I really do think most people are going to care about
> whether or not KVM supports in-place conversion, not where PRIVATE is tracked.
Sorry, I just saw this mail after posting my reply in [1].

I'm ok with gmem_in_place_conversion=true just means KVM supports in-place
conversion, while we can still create VMs with shared memory not from gmem.

Though it still feels a bit odd to require TDX huge pages to depend on
gmem_in_place_conversion=true when shared memory is not currently allocated from
gmem, it should become more natural over time once gmem supports in-place
conversions for huge page.

[1] https://lore.kernel.org/all/ajyCn0PnFtQK+Nka@yzhao56-desk.sh.intel.com


> > > To avoid confusion, could we rename this module parameter to something more
> > > accurate, such as gmem_memory_attribute?
> > 
> > I asked Sean about this after getting some fixes off list. Sean said
> > gmem_in_place_conversion is named for a host admin to use, and something
> > like gmem_memory_attributes is too much implementation details for the
> > admin.
> > 
> > Sean, would you reconsider since Yan also asked? If the admin compiled
> > the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
> > admin would also be able to use a param like gmem_memory_attributes?
> 
> No, because it's not all memory attributes, it's very specifically the PRIVATE
> attribute that will get moved to guest_memfd.  I don't want to pick a name that
> will become stale and confusing when RWX attributes come along.  The RWX bits
> will be per-VM, while PRIVATE will be per-guest_memfd.

