Return-Path: <linux-doc+bounces-23621-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38295C0E3
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2024 00:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF67D1C222F9
	for <lists+linux-doc@lfdr.de>; Thu, 22 Aug 2024 22:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523891D1F59;
	Thu, 22 Aug 2024 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxwMHXbs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C116C854;
	Thu, 22 Aug 2024 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724365811; cv=fail; b=Js0sbn1KWQv+ib0MIz5IvQdc0LXEUvKGf6/VO2EccKEgQuqbJ1eaJBCI154fbs47+1gHqn3vXFWOxG/I2/QoutNAC1VdNMRhud6aPQpKL2SGOQORsFOaBwPvXZbCY+bzVxmG3hTOVafh84IyJhGNgx1w3XOZVPCHH+BJH0tmek8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724365811; c=relaxed/simple;
	bh=N0ENB8GwKj0EPQhx64JICoaGugPkZIDJ7deTO/nldlo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZhbMomPiE2krIDBB8/k1NW4ghGCH5KdIdFikN4BL6aW5X1OrlNrI8ASXDgZSmrOrUlRWzBFAfZs+n6AcdK1YwFcw6tUvdBt783ttodoQTvXK3pdZ6PBwuMOL/MiqG9sALf4hbPnoOfuAE1Rd1b81z8WKUWm+YK73R1OJawkxnW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxwMHXbs; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724365809; x=1755901809;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N0ENB8GwKj0EPQhx64JICoaGugPkZIDJ7deTO/nldlo=;
  b=jxwMHXbs4QvX1YXAD7rJExysbsKWB4BjA1S1p9sMR7pkGkkg8HUgbukm
   Lyebu98RV1ObMwB7xq6lLGWmJtoIwxTbga4ZLkTehoLvVb4aCThsd0w/6
   2V86H2gEyDO5WnXvJ3W6Px4jNrhFQK5Ez5f3hF031XbQkojXsSJxb2jfA
   26N8hQZy2SlqrQ22UNv8G6eaUs6L1kWeh+PeCheIIQEwpoeOmKV4efTZZ
   LIWPgttLuaYqZu+6Q1B+FXXpHASOFW8roRaa5/MTZBQJDNfTDZxLsu70/
   LofOZu3CbvyMdfhlPzrnXQsyw/SEvmZoJ/wo/8QPW5SVgL/jVMtedFBjD
   A==;
X-CSE-ConnectionGUID: h7ZED+qGSZCZKqfl7Ps2TQ==
X-CSE-MsgGUID: +OvcOOSoSb+56a7QDtq2+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34231872"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="34231872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 15:30:08 -0700
X-CSE-ConnectionGUID: N+WAzxGPRN2TVWurfFpScA==
X-CSE-MsgGUID: te/hrPQkQP6ZRjPz4dXvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="61616611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 15:30:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 15:30:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 15:30:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 15:30:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 15:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5XX7XaLAgZyPn//natiBHu6Q5pNHylWHw6gGaJ3rbmEXJ2ZOA1LzmskS51B5ethFHK0K9l9CIYx8IF3NOpnNw2yWn5Nfu9fD25gbUQW0hDc+1KFq06gQ6ZP0tTBCVV8tv44eE72jACEaOO827aO0BqH1JEKGxsa3yiPqMj0+ie9Q/ikeIRRsNJDVDPxaFr59JIC0fsa+chnbW4GN0tZl07Wz4ZNfErEiLW1qZsirSO6fS/0pdVmvF0nkGnR4qr1sL+J44+Mw1cn9fO+UrOxs6yS+TiKFQItG8X1uVUci+8kvSKz8AhBXLZE6+7F0mHkEn42YXKZdbMuh9U+X4r/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5ORNo9XhehRNvozgI8QG3uhJHZFTwgf4MOrb/0ESNc=;
 b=QXDLkiE740nwX/u3iM72tgM14S8cmNCZ0hzsfhjMYpXHClXD1ncksUdb4bFzK7sHJKYRx5YPF9YsZjHZ+gTR5i+w5mFJMyQi6NGqW0/7CH2L9kjOW7qU8PI5071MjFgSznP1YwSqRlq4x9tsBjrvNF3PG8iT6T+o3+zdumpA9LwMsGTs3S3LfR58ymDMrfaWzeLB5J8KbALqTFIExi5jK+3nXAeE/ZMM7kM2VeQGEXDWn5EqNt0wxcPDdMsE2exYBmQCMmoWzALE5jdjmCgJFIRp4nDmnIMO3LHMGY+XxtDpDbLYg6BpKrsvAXTSaf81mHrQPGs42CuMfP6RhUncHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) by
 PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 22:30:04 +0000
Received: from DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::1d5f:5927:4b71:853a]) by DM6PR11MB4657.namprd11.prod.outlook.com
 ([fe80::1d5f:5927:4b71:853a%4]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 22:30:04 +0000
From: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
To: Jiri Pirko <jiri@resnulli.us>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>, "corbet@lwn.net"
	<corbet@lwn.net>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>, "Nguyen, Anthony L"
	<anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, "intel-wired-lan@lists.osuosl.org"
	<intel-wired-lan@lists.osuosl.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Loktionov, Aleksandr"
	<aleksandr.loktionov@intel.com>
Subject: RE: [PATCH net-next v2 1/2] dpll: add Embedded SYNC feature for a pin
Thread-Topic: [PATCH net-next v2 1/2] dpll: add Embedded SYNC feature for a
 pin
Thread-Index: AQHa9BI+bxoCmaD/0kqXeoLpNzzMLbIzEh8AgADJ+OA=
Date: Thu, 22 Aug 2024 22:30:04 +0000
Message-ID: <DM6PR11MB4657144AF4DBCE2B9018E3D09B8F2@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20240821213218.232900-1-arkadiusz.kubalewski@intel.com>
 <20240821213218.232900-2-arkadiusz.kubalewski@intel.com>
 <ZscRTKu6bFMm0VkQ@nanopsycho.orion>
In-Reply-To: <ZscRTKu6bFMm0VkQ@nanopsycho.orion>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4657:EE_|PH7PR11MB5941:EE_
x-ms-office365-filtering-correlation-id: 89614e9a-356e-49ba-17fe-08dcc2f9f7e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mWQssmmWkaoZKTREQSG7ekq+GYy0psBK9/fKFQmhYvRPPFnQCBViN2gL1hSv?=
 =?us-ascii?Q?61BBZaCSwu8aX+aS3vkzo9eg72KtjC8nC5wCW+PoSznZNMas/dHGDbFgTt/p?=
 =?us-ascii?Q?w7yycLpDV5KVQ4E+8Nx8ON+ld3EPtBM4aAbK4/2YzN6M0Y39n3hTytCkmgAn?=
 =?us-ascii?Q?W1l7Ue3hpsr8hhCTQaQxvkYD/0RWqbeLY3O36oZ22NkQX9mI1I4PWRw2rHtY?=
 =?us-ascii?Q?RZ9GuWsDAXyTpB9v6nO999olu6f5AJTwPc5soFGUzwBRRtCw49K/6tyeo1lX?=
 =?us-ascii?Q?gmG2siBIQYVGKWVOX526OrQrw5vFiesCosG4xX9rJ1j7EDmUVS+tGJMDSX9J?=
 =?us-ascii?Q?hUtsxuBHasO+9gwNShw/Yt3YGJtDtXRiTChHP2ZG4Ji7BqEZWLr8w2armYhG?=
 =?us-ascii?Q?F9ticSKrN1fWOsHD0kmUJh/pPmvsRrMVBqqKYy9RvmLY3iavNnohlW85V3RD?=
 =?us-ascii?Q?Odo4lnZu0INXo5Ytk0fy8ZHMGRoOI29UcxgprkqkUw3DT5rIkfDJVYmgmXUG?=
 =?us-ascii?Q?7tmj5Q3zyeZ9rQWEPtACawRQxvjkJQP/ZJZWFAAZvYKt3cLbNwkFDcg9Y4LR?=
 =?us-ascii?Q?MgOBwlj5j/znV/ELMc0ZtfRfDljSU1d3tbmjDcUrp9fLNp0KvXelxkTvsptX?=
 =?us-ascii?Q?HBbib1fGa9eJwUd4TNI979h6zpYAor8XUwzHe2t5ZJqeUO6waa1klTPkipuX?=
 =?us-ascii?Q?2OvXghPZiXKwA5HDx+Bvj9dsDH5EMK3Evsa7ATop4wHwQhvPs99m3YVg+mXG?=
 =?us-ascii?Q?l5PzrgFhb3fT3gJLK0jNx9pmvRIXKMZevR9PQ8OEprWYB8aD3qWcJbIO1Rmo?=
 =?us-ascii?Q?8ekorDWTT7xunyugRi3gD6eZQbrV1Vp6dBLzeZvo+/DrqjTwCzUZBVR5ukR2?=
 =?us-ascii?Q?TAwN2caJZZmietz8NHCdRQnWvlDKOlmOz3dRmu/BEXjP6RZZlwDlybD1QQsA?=
 =?us-ascii?Q?P7uKJd90IqrUm+NKXNk5P1gajJ6QKsOLP6MV2VV27ZO1ZabP/e6K48IWtF45?=
 =?us-ascii?Q?t3k7/VwYE1aQFUKbeoxxG0WPAUTB+U2BFAnEnaMxuIoiKflwuT98Y7D59ejj?=
 =?us-ascii?Q?YJQEs7sauMfix+djdsptMhLk5XdlPhOcopD0Edkl/z/SlLBp3pnYOMRwwTNy?=
 =?us-ascii?Q?q2jshXvueJkMLnY0JkYkMlf3VC9q544iYfvc/Xld1cp5yowiC7+P7My+wAJC?=
 =?us-ascii?Q?BD1DsjK9oifFDkS9m7ERoqnVrn+pzRo6dRARUiAaL7rWlu6BSIqEEH5v7Vlf?=
 =?us-ascii?Q?7z+Z7Mbe1aT8UWqo/j0ofJZrDDDIcvgdorQh+0ZpUzMP48mrS3lp4Dn0JD4n?=
 =?us-ascii?Q?yBscR5i2VY1/Oa8jRSHmXG2j+WZaRgwXWMInekWDhXGbRR0U9HYWMvogC6Yk?=
 =?us-ascii?Q?EZkUw/ZRkTF6mq41yHYGhEszZ9Npdb9/8g3orRS0vuV2b4TLAw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7EWf9QiPjHLBujH7BYH0ui4QT+ZjfRmMuE3kX3dbQRHEsUAVaU234bBpv5/F?=
 =?us-ascii?Q?CY+E5V1WYIcGHANT5vbrZ0coCZrjD9vLThnZseAoiPL+A/EITFDvVa+lbXEN?=
 =?us-ascii?Q?tJcDFCYr3eYuCGXJIS6c7jgO14+7siacplAS+R3TrLddtdCuuyADawpDrs7r?=
 =?us-ascii?Q?zyU3s8V/BYqLFk1r6Sam9G2Ks+fvd59ktyDrZv4z/JFCA/xQZxkyVnvXrXsM?=
 =?us-ascii?Q?9SF7BAIfYdiNBbLpYvPOGl0KQ8lW6UZhOtJMHnXAKAMTK7XcaeRqnj89+GPs?=
 =?us-ascii?Q?VMcEJ/kZK/ZBEs6cO8IDDav7kb0cxO1wYskuAZBABTcrA9lLx6EPMcDeQ0XR?=
 =?us-ascii?Q?dEBdAFxT/1U48lO8RrSmUGIHnwA5saSBlDL5AsrLN4+prPf1gTwpYjuiTHWQ?=
 =?us-ascii?Q?13PZVoiwsXd3H4Otj9iZ85aDDas64FncqS3PxVIX1DMDxENfq/gxSxb8wnOh?=
 =?us-ascii?Q?u5+iAeQnTAZQ6WmpocrOhisv/7w9HA480yoToyR91AnMQHcYM4aqPor7xMgf?=
 =?us-ascii?Q?/qJ/InaH2tS5eBkhq1nmtSYQIYoZeCL00NW9LkC7DVd+rW/LIO1dOqDCW8+4?=
 =?us-ascii?Q?1h/Im5bn1c0WU6BoyGZK2kbZjOYXdzm07OhHvfG+IFwWUP86mfmqXENMmDN5?=
 =?us-ascii?Q?qfq8lCmte7JurNcUsvppBWccrFdeC/tKjfygb48CX5L+9l8UMF9ft+5rrU1H?=
 =?us-ascii?Q?/B2gBv4hbXty44XJyb4hOy0e4CZIGgZsHAm0eW5lLlqaA9N4eZpvzNQOaAIz?=
 =?us-ascii?Q?0skcVsVDqA7dleObe3y+oyJrkOuOCILXMUF2+RzV5njZD4ODQ70py69Yr9yB?=
 =?us-ascii?Q?kDK3L1gc8NGhiMoFek34KS+ulvNiQWQyj0LdZRuBbmHe1N4HYo947i/I3pbM?=
 =?us-ascii?Q?mjg80p7DkNiE2sVrZfY2ctbJ0aNiGAfyA6OAv1i0VDsLdtN1PTGwC8Vpfj8D?=
 =?us-ascii?Q?G/4GvMle4Z1QSN8FyjSEOIVm+lbZeWOvSIXW4TDbA5GCct2I4c/KncKAs1z5?=
 =?us-ascii?Q?1EWTyuYih53M+zIH5+v+y7en8HU6TXGoky5Wl++XVLKOLGUNeA48ikaXqKWT?=
 =?us-ascii?Q?OwxTJ85eRCQfIiKsV2/8S3PlkdUFcfsN7drv2DrW3EB8PPMLUhebEEH9sMI1?=
 =?us-ascii?Q?7hXHnOr7CT3rVAQRsaiDM7fdj1uYuj4E0C9HLc6cIJt+60zot3qK/WOtjtht?=
 =?us-ascii?Q?H/KZH2kf+3yTrorTJwBx8tkcX/WO0aLOJqFKbMypt2Qk/Fzu3uHMq1wUub0r?=
 =?us-ascii?Q?59wtE9tkeToYBkcAQWAZkTfKdpy1mstWABapg+nm297vq3ddJqXqTwBnmHk8?=
 =?us-ascii?Q?P1sozAp/FaBshNnuN9o0VpNq02pi+0YFUSBtuPoEe2UPVn+a/9uTPfXhzWtX?=
 =?us-ascii?Q?03bPZzxkrOjpbyy+qIGPeKXIANoyXYajHKQdeYKjS0rYGqZrFGU7aFabXVpK?=
 =?us-ascii?Q?sKELALedC4Et51Wi5Zz6/XHAq8CC/Q/A5DomiDgY76FOegQkvVsZbIfDv1KT?=
 =?us-ascii?Q?vJwjtw6Hw/lWGLaIGoHMEbRyQLZVltXtYPvf40eaN4UAMwixC/DZ/zoLb2Mn?=
 =?us-ascii?Q?v40srgrO8237e0C2iKmPzfGrCr74twxfT+hB8tH0dAvmohghHTkyGkpdycXU?=
 =?us-ascii?Q?/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89614e9a-356e-49ba-17fe-08dcc2f9f7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 22:30:04.0903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kST8BujzSmAqjArx1qcC5eqYoR52sEsg1jd749CUOfg/htqKFbeRK23w2mXT37qL8oJ0ct5CHIbyCakkKyBY9Z8ia0FgxgwCrfVvm9aAQ9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
X-OriginatorOrg: intel.com

>From: Jiri Pirko <jiri@resnulli.us>
>Sent: Thursday, August 22, 2024 12:22 PM
>
>Wed, Aug 21, 2024 at 11:32:17PM CEST, arkadiusz.kubalewski@intel.com wrote=
:
>>Implement and document new pin attributes for providing Embedded SYNC
>>capabilities to the DPLL subsystem users through a netlink pin-get
>>do/dump messages. Allow the user to set Embedded SYNC frequency with
>>pin-set do netlink message.
>>
>>Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>---
>>v2:
>>- remove enum for pulse-ratio, instead use plain u32 value,
>>- provide e-sync-frequency attribute and value only if esync was
>>  enabled,
>>- rename: e_sync/E_SYNC -> esync/ESYNC,
>>- refactor .esync_get to allow multiple esync range values,
>>- define and use struct dpll_pin_esync for getting esync related info,
>>- rename esync -> freq to better align with existiong code,
>>- remove unneeded line break,
>>- respect 80 chars per line rule,
>>- fix typos,
>>
>> Documentation/driver-api/dpll.rst     |  21 +++++
>> Documentation/netlink/specs/dpll.yaml |  24 +++++
>> drivers/dpll/dpll_netlink.c           | 130 ++++++++++++++++++++++++++
>> drivers/dpll/dpll_nl.c                |   5 +-
>> include/linux/dpll.h                  |  15 +++
>> include/uapi/linux/dpll.h             |   3 +
>> 6 files changed, 196 insertions(+), 2 deletions(-)
>
>
>Looks fine. 2 nitpicks below:
>
>
>>
>>diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-
>>api/dpll.rst
>>index ea8d16600e16..a212b94ad52c 100644
>>--- a/Documentation/driver-api/dpll.rst
>>+++ b/Documentation/driver-api/dpll.rst
>>@@ -214,6 +214,27 @@ offset values are fractional with 3-digit decimal pl=
aces
>>and shell be
>> divided with ``DPLL_PIN_PHASE_OFFSET_DIVIDER`` to get integer part and
>> modulo divided to get fractional part.
>>
>>+Embedded SYNC
>>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>+
>>+Device may provide ability to use Embedded SYNC feature. It allows
>>+to embed additional SYNC signal into the base frequency of a pin - a one
>>+special pulse of base frequency signal every time SYNC signal pulse
>>+happens. The user can configure the frequency of Embedded SYNC.
>>+The Embedded SYNC capability is always related to a given base frequency
>>+and HW capabilities. The user is provided a range of Embedded SYNC
>>+frequencies supported, depending on current base frequency configured fo=
r
>>+the pin.
>>+
>>+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>+  ``DPLL_A_PIN_ESYNC_FREQUENCY``            current Embedded SYNC freque=
ncy
>>+  ``DPLL_A_PIN_ESYNC_FREQUENCY_SUPPORTED``  nest available Embedded SYNC
>>+                                            frequency ranges
>>+    ``DPLL_A_PIN_FREQUENCY_MIN``            attr minimum value of freque=
ncy
>>+    ``DPLL_A_PIN_FREQUENCY_MAX``            attr maximum value of freque=
ncy
>>+  ``DPLL_A_PIN_ESYNC_PULSE``                pulse type of Embedded SYNC
>>+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>+
>> Configuration commands group
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>
>>diff --git a/Documentation/netlink/specs/dpll.yaml
>>b/Documentation/netlink/specs/dpll.yaml
>>index 94132d30e0e0..f2894ca35de8 100644
>>--- a/Documentation/netlink/specs/dpll.yaml
>>+++ b/Documentation/netlink/specs/dpll.yaml
>>@@ -345,6 +345,26 @@ attribute-sets:
>>           Value is in PPM (parts per million).
>>           This may be implemented for example for pin of type
>>           PIN_TYPE_SYNCE_ETH_PORT.
>>+      -
>>+        name: esync-frequency
>>+        type: u64
>>+        doc: |
>>+          Frequency of Embedded SYNC signal. If provided, the pin is
>>configured
>>+          with a SYNC signal embedded into its base clock frequency.
>>+      -
>>+        name: esync-frequency-supported
>>+        type: nest
>>+        multi-attr: true
>>+        nested-attributes: frequency-range
>>+        doc: |
>>+          If provided a pin is capable of embedding a SYNC signal (withi=
n
>>given
>>+          range) into its base frequency signal.
>>+      -
>>+        name: esync-pulse
>>+        type: u32
>>+        doc: |
>>+          A ratio of high to low state of a SYNC signal pulse embedded
>>+          into base clock frequency. Value is in percents.
>>   -
>>     name: pin-parent-device
>>     subset-of: pin
>>@@ -510,6 +530,9 @@ operations:
>>             - phase-adjust-max
>>             - phase-adjust
>>             - fractional-frequency-offset
>>+            - esync-frequency
>>+            - esync-frequency-supported
>>+            - esync-pulse
>>
>>       dump:
>>         request:
>>@@ -536,6 +559,7 @@ operations:
>>             - parent-device
>>             - parent-pin
>>             - phase-adjust
>>+            - esync-frequency
>>     -
>>       name: pin-create-ntf
>>       doc: Notification about pin appearing
>>diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>>index 98e6ad8528d3..fe1a00ad84d1 100644
>>--- a/drivers/dpll/dpll_netlink.c
>>+++ b/drivers/dpll/dpll_netlink.c
>>@@ -342,6 +342,51 @@ dpll_msg_add_pin_freq(struct sk_buff *msg, struct
>>dpll_pin *pin,
>> 	return 0;
>> }
>>
>>+static int
>>+dpll_msg_add_pin_esync(struct sk_buff *msg, struct dpll_pin *pin,
>>+		       struct dpll_pin_ref *ref, struct netlink_ext_ack *extack)
>>+{
>>+	const struct dpll_pin_ops *ops =3D dpll_pin_ops(ref);
>>+	struct dpll_device *dpll =3D ref->dpll;
>>+	struct dpll_pin_esync esync;
>>+	struct nlattr *nest;
>>+	int ret, i;
>>+
>>+	if (!ops->esync_get)
>>+		return 0;
>>+	ret =3D ops->esync_get(pin, dpll_pin_on_dpll_priv(dpll, pin), dpll,
>>+			     dpll_priv(dpll), &esync, extack);
>>+	if (ret =3D=3D -EOPNOTSUPP)
>>+		return 0;
>>+	else if (ret)
>>+		return ret;
>>+	if (nla_put_64bit(msg, DPLL_A_PIN_ESYNC_FREQUENCY, sizeof(esync.freq),
>>+			  &esync.freq, DPLL_A_PIN_PAD))
>>+		return -EMSGSIZE;
>>+	if (nla_put_u32(msg, DPLL_A_PIN_ESYNC_PULSE, esync.pulse))
>>+		return -EMSGSIZE;
>>+	for (i =3D 0; i < esync.range_num; i++) {
>>+		nest =3D nla_nest_start(msg,
>>+				      DPLL_A_PIN_ESYNC_FREQUENCY_SUPPORTED);
>>+		if (!nest)
>>+			return -EMSGSIZE;
>>+		if (nla_put_64bit(msg, DPLL_A_PIN_FREQUENCY_MIN,
>>+				  sizeof(esync.range[i].min),
>>+				  &esync.range[i].min, DPLL_A_PIN_PAD))
>>+			goto nest_cancel;
>>+		if (nla_put_64bit(msg, DPLL_A_PIN_FREQUENCY_MAX,
>>+				  sizeof(esync.range[i].max),
>>+				  &esync.range[i].max, DPLL_A_PIN_PAD))
>>+			goto nest_cancel;
>>+		nla_nest_end(msg, nest);
>>+	}
>>+	return 0;
>>+
>>+nest_cancel:
>>+	nla_nest_cancel(msg, nest);
>>+	return -EMSGSIZE;
>>+}
>>+
>> static bool dpll_pin_is_freq_supported(struct dpll_pin *pin, u32 freq)
>> {
>> 	int fs;
>>@@ -481,6 +526,9 @@ dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll=
_pin
>>*pin,
>> 	if (ret)
>> 		return ret;
>> 	ret =3D dpll_msg_add_ffo(msg, pin, ref, extack);
>>+	if (ret)
>>+		return ret;
>>+	ret =3D dpll_msg_add_pin_esync(msg, pin, ref, extack);
>> 	if (ret)
>> 		return ret;
>> 	if (xa_empty(&pin->parent_refs))
>>@@ -738,6 +786,83 @@ dpll_pin_freq_set(struct dpll_pin *pin, struct nlatt=
r
>>*a,
>> 	return ret;
>> }
>>
>>+static int
>>+dpll_pin_esync_set(struct dpll_pin *pin, struct nlattr *a,
>>+		    struct netlink_ext_ack *extack)
>>+{
>>+	struct dpll_pin_ref *ref, *failed;
>>+	const struct dpll_pin_ops *ops;
>>+	struct dpll_pin_esync esync;
>>+	u64 freq =3D nla_get_u64(a);
>>+	struct dpll_device *dpll;
>>+	bool supported =3D false;
>>+	unsigned long i;
>>+	int ret;
>>+
>>+	xa_for_each(&pin->dpll_refs, i, ref) {
>>+		ops =3D dpll_pin_ops(ref);
>>+		if (!ops->esync_set || !ops->esync_get) {
>>+			NL_SET_ERR_MSG(extack,
>>+				       "embedded sync feature is not supported by
>>this device");
>>+			return -EOPNOTSUPP;
>>+		}
>>+	}
>>+	ref =3D dpll_xa_ref_dpll_first(&pin->dpll_refs);
>>+	ops =3D dpll_pin_ops(ref);
>>+	dpll =3D ref->dpll;
>>+	ret =3D ops->esync_get(pin, dpll_pin_on_dpll_priv(dpll, pin), dpll,
>>+			     dpll_priv(dpll), &esync, extack);
>>+	if (ret) {
>>+		NL_SET_ERR_MSG(extack, "unable to get current embedded sync
>>frequency value");
>>+		return ret;
>>+	}
>>+	if (freq =3D=3D esync.freq)
>>+		return 0;
>>+	for (i =3D 0; i < esync.range_num; i++)
>>+		if (freq <=3D esync.range[i].max && freq >=3D esync.range[i].min)
>>+			supported =3D true;
>>+	if (!supported) {
>>+		NL_SET_ERR_MSG_ATTR(extack, a,
>>+				    "requested embedded sync frequency value is not
>>supported by this device");
>>+		return -EINVAL;
>>+	}
>>+
>>+	xa_for_each(&pin->dpll_refs, i, ref) {
>>+		void *pin_dpll_priv;
>>+
>>+		ops =3D dpll_pin_ops(ref);
>>+		dpll =3D ref->dpll;
>>+		pin_dpll_priv =3D dpll_pin_on_dpll_priv(dpll, pin);
>>+		ret =3D ops->esync_set(pin, pin_dpll_priv, dpll, dpll_priv(dpll),
>>+				      freq, extack);
>>+		if (ret) {
>>+			failed =3D ref;
>>+			NL_SET_ERR_MSG_FMT(extack,
>>+					   "embedded sync frequency set failed for
>dpll_id:%u",
>
>Missing space after ":".
>

Sure, fixed in v3.

>
>>+					   dpll->id);
>>+			goto rollback;
>>+		}
>>+	}
>>+	__dpll_pin_change_ntf(pin);
>>+
>>+	return 0;
>>+
>>+rollback:
>>+	xa_for_each(&pin->dpll_refs, i, ref) {
>>+		void *pin_dpll_priv;
>>+
>>+		if (ref =3D=3D failed)
>>+			break;
>>+		ops =3D dpll_pin_ops(ref);
>>+		dpll =3D ref->dpll;
>>+		pin_dpll_priv =3D dpll_pin_on_dpll_priv(dpll, pin);
>>+		if (ops->esync_set(pin, pin_dpll_priv, dpll, dpll_priv(dpll),
>>+				   esync.freq, extack))
>>+			NL_SET_ERR_MSG(extack, "set embedded sync frequency
>>rollback failed");
>>+	}
>>+	return ret;
>>+}
>>+
>> static int
>> dpll_pin_on_pin_state_set(struct dpll_pin *pin, u32 parent_idx,
>> 			  enum dpll_pin_state state,
>>@@ -1039,6 +1164,11 @@ dpll_pin_set_from_nlattr(struct dpll_pin *pin, str=
uct
>>genl_info *info)
>> 			if (ret)
>> 				return ret;
>> 			break;
>>+		case DPLL_A_PIN_ESYNC_FREQUENCY:
>>+			ret =3D dpll_pin_esync_set(pin, a, info->extack);
>>+			if (ret)
>>+				return ret;
>>+			break;
>> 		}
>> 	}
>>
>>diff --git a/drivers/dpll/dpll_nl.c b/drivers/dpll/dpll_nl.c
>>index 1e95f5397cfc..fe9b6893d261 100644
>>--- a/drivers/dpll/dpll_nl.c
>>+++ b/drivers/dpll/dpll_nl.c
>>@@ -62,7 +62,7 @@ static const struct nla_policy
>>dpll_pin_get_dump_nl_policy[DPLL_A_PIN_ID + 1] =3D
>> };
>>
>> /* DPLL_CMD_PIN_SET - do */
>>-static const struct nla_policy
>>dpll_pin_set_nl_policy[DPLL_A_PIN_PHASE_ADJUST + 1] =3D {
>>+static const struct nla_policy
>>dpll_pin_set_nl_policy[DPLL_A_PIN_ESYNC_FREQUENCY + 1] =3D {
>> 	[DPLL_A_PIN_ID] =3D { .type =3D NLA_U32, },
>> 	[DPLL_A_PIN_FREQUENCY] =3D { .type =3D NLA_U64, },
>> 	[DPLL_A_PIN_DIRECTION] =3D NLA_POLICY_RANGE(NLA_U32, 1, 2),
>>@@ -71,6 +71,7 @@ static const struct nla_policy
>>dpll_pin_set_nl_policy[DPLL_A_PIN_PHASE_ADJUST +
>> 	[DPLL_A_PIN_PARENT_DEVICE] =3D
>>NLA_POLICY_NESTED(dpll_pin_parent_device_nl_policy),
>> 	[DPLL_A_PIN_PARENT_PIN] =3D
>>NLA_POLICY_NESTED(dpll_pin_parent_pin_nl_policy),
>> 	[DPLL_A_PIN_PHASE_ADJUST] =3D { .type =3D NLA_S32, },
>>+	[DPLL_A_PIN_ESYNC_FREQUENCY] =3D { .type =3D NLA_U64, },
>> };
>>
>> /* Ops table for dpll */
>>@@ -138,7 +139,7 @@ static const struct genl_split_ops dpll_nl_ops[] =3D =
{
>> 		.doit		=3D dpll_nl_pin_set_doit,
>> 		.post_doit	=3D dpll_pin_post_doit,
>> 		.policy		=3D dpll_pin_set_nl_policy,
>>-		.maxattr	=3D DPLL_A_PIN_PHASE_ADJUST,
>>+		.maxattr	=3D DPLL_A_PIN_ESYNC_FREQUENCY,
>> 		.flags		=3D GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
>> 	},
>> };
>>diff --git a/include/linux/dpll.h b/include/linux/dpll.h
>>index d275736230b3..3baa196d7000 100644
>>--- a/include/linux/dpll.h
>>+++ b/include/linux/dpll.h
>>@@ -15,6 +15,7 @@
>>
>> struct dpll_device;
>> struct dpll_pin;
>>+struct dpll_pin_esync;
>>
>> struct dpll_device_ops {
>> 	int (*mode_get)(const struct dpll_device *dpll, void *dpll_priv,
>>@@ -83,6 +84,13 @@ struct dpll_pin_ops {
>> 	int (*ffo_get)(const struct dpll_pin *pin, void *pin_priv,
>> 		       const struct dpll_device *dpll, void *dpll_priv,
>> 		       s64 *ffo, struct netlink_ext_ack *extack);
>>+	int (*esync_set)(const struct dpll_pin *pin, void *pin_priv,
>>+			  const struct dpll_device *dpll, void *dpll_priv,
>>+			  u64 esync_freq, struct netlink_ext_ack *extack);
>
>s/esync_freq/freq/
>

Ok, fixed in v3.

Thank you!
Arkadiusz

>
>>+	int (*esync_get)(const struct dpll_pin *pin, void *pin_priv,
>>+			  const struct dpll_device *dpll, void *dpll_priv,
>>+			  struct dpll_pin_esync *esync,
>>+			  struct netlink_ext_ack *extack);
>> };
>>
>> struct dpll_pin_frequency {
>>@@ -111,6 +119,13 @@ struct dpll_pin_phase_adjust_range {
>> 	s32 max;
>> };
>>
>>+struct dpll_pin_esync {
>>+	u64 freq;
>>+	const struct dpll_pin_frequency *range;
>>+	u8 range_num;
>>+	u8 pulse;
>>+};
>>+
>> struct dpll_pin_properties {
>> 	const char *board_label;
>> 	const char *panel_label;
>>diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
>>index 0c13d7f1a1bc..b0654ade7b7e 100644
>>--- a/include/uapi/linux/dpll.h
>>+++ b/include/uapi/linux/dpll.h
>>@@ -210,6 +210,9 @@ enum dpll_a_pin {
>> 	DPLL_A_PIN_PHASE_ADJUST,
>> 	DPLL_A_PIN_PHASE_OFFSET,
>> 	DPLL_A_PIN_FRACTIONAL_FREQUENCY_OFFSET,
>>+	DPLL_A_PIN_ESYNC_FREQUENCY,
>>+	DPLL_A_PIN_ESYNC_FREQUENCY_SUPPORTED,
>>+	DPLL_A_PIN_ESYNC_PULSE,
>>
>> 	__DPLL_A_PIN_MAX,
>> 	DPLL_A_PIN_MAX =3D (__DPLL_A_PIN_MAX - 1)
>>--
>>2.38.1
>>

