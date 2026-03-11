Return-Path: <linux-doc+bounces-78852-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBCLd1msWnsugIAu9opvQ
	(envelope-from <linux-doc+bounces-78852-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 13:58:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94A263FCB
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 13:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D725B305596D
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD142D592F;
	Wed, 11 Mar 2026 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KJxcv0Cn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KJxcv0Cn"
X-Original-To: linux-doc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA51287247;
	Wed, 11 Mar 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233876; cv=fail; b=cJLA/7mVlYbsfers1/7qTe1WcdwzUuKWlfV3qD2EmG2HE7Jcv/5VLXSushyKrmFKEt+/e9yqAhFsGSH52H6cWnb6Rs24Y2x73VoOsgrkF4nSRSko+3cKT7nJ3GewVV/uVkdDjet+W6m8w8Er2Ci4S6EsqcdTBPNb2huNAVdNfvI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233876; c=relaxed/simple;
	bh=BBrabHLuraYgIRs7pwIzEiNa1TI93a5+uzLBgu3m+OI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aD7m2uGD6FD61hl5dsDRearMShuX3e+jnNQrty4r83ObT7RiF/8MH+fZNaQcwLl5XGz/mT89Y/xjlMJdXZxEJvJznhuWgqxOkWh7HgmuQMQ8xOCe/aRIGiZD3ft4oNJE1i6zg+EuErS39TeGAG75G7JDHndzWAPYmxUVOzYtjkg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KJxcv0Cn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KJxcv0Cn; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rWSKLVk+6YYTYZi5FXvh3PB2LUgog2Lrv2tfORGcFgFy2pGhsFV/DpnQ9amlU8l/spLC+7UitgParl2ppRVNPtEOsnYFlU2wKtMZWIpKvsO+iDW/z5NC4O5E5c88mCqgf2te99w2I2su24cgmmqJhU69wzdi73W1Nv1O9TWusHzQqFb8i3bxNDqzgJUA3vw6Os37vf3KmRE38zqQfLA0xSE43hH2dRQ1cMDLKcfBo/fjfbHlZEloMLho/BKr52ckr5QRM+9xXC6EXoH2oYevW6IT1Z/WUDVW1pgI78rgJKxnwetIXBT4SubTE9zvQQpIKZWNNSwuOpji4eQ1tQ0+jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCAA6JWmGuxW+ELD/ymApG2eCvlH2/Cf4nT6KNowou0=;
 b=S5XEni6uxgcdpbd8aI4eUEsjLZ86Zz9j989HHiDP/93AltzsdBonDHkojYWuVGhLvXAkqm48P1wq+/RCGLGWt5+MHtLNkpUS2Po1M2wD5oZ/zDYtW71g+rVlJGrJIALoUxaZLWJyiFLED6dY6sHRH0OEcA+vGZgdnAUKyNUxxLEERC7087KlwAd9ErgD+UcS6o28K43Z8lXOhWoPO1H0CHjsK0Zub45tsY3RhVlAbyaQZTAuVa6tZZnKsXkQCycLL6kndz1tQzpXAu8BYlxNOWA6iD1wrij/PT/D9u//ULsCQqjdoe7+o/0yLTPrl3Is+f9hDSpCE+sl9AZOKVmgMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=huawei.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCAA6JWmGuxW+ELD/ymApG2eCvlH2/Cf4nT6KNowou0=;
 b=KJxcv0CnzC9cuQGX4EvT3nB13HybXP+l/w73iOdOcg2t9nT1/zTQHH9r83T2Mf/SWeot7rcm0fkodNg2Pp46Ou8XpgsnismM5ePzNVwb8BbtpzE8G4A5Ma70R0TGX9KOMMqxzwEnPufDV7bftj36e6ruMAVkJgW5GYrjksQt/9s=
Received: from DU2PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:10:2b0::10)
 by AS2PR08MB8645.eurprd08.prod.outlook.com (2603:10a6:20b:55c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Wed, 11 Mar
 2026 12:57:49 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::20) by DU2PR04CA0155.outlook.office365.com
 (2603:10a6:10:2b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Wed, 11 Mar 2026 12:57:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXzTC1ejAXCdtI68rOPeIFbMbyfluqH9K/JWyKoXrnuWcziO0x64rVXp6mmz3ITcFaBR9efd4f0mVbK7DGnuQv+dxeI9XYCDc8FRUXk11BzqR+qyhdPhUQIdPm4XE6N475Ag6POUV2dbCWatBomld0SAKHqb07X46VgimXHCKVqtowRQlXxrqX6h7FaqKhrqubf+jrW77h/ISayEchhoYiAqshX6pYkyxgFps2hULzLQ7BPqMG/AzhteJF6rZZl1mnsfRavmLri7BS2r9zhs5zwtkNAK7WySe2dd5f+1MDGQknFuxMtyrTiDh8EdWCikkaaIW0fOEqH6hqw9sW4Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCAA6JWmGuxW+ELD/ymApG2eCvlH2/Cf4nT6KNowou0=;
 b=WXqd6iTZHAsOkvKLnCeD89OpzPiQimuldUcxdTQFlZM5f4ufWJos2WxyN6yIU6VMU8lcUgalPdWe2I54AaPyzXvug59DG1a87vvIxSiPpkYKgYOEMYXs1zf4RzTJjHlbGtDpa4wNM0U5zCRCCLU/UAqGak9U8hUW/GnOt3cDliwti0ALTRRBVYFiFNHjzFqGtVgWnx+GfXX/4HWKAl1I0emNmTFPWYUpKdIGRm+BUWHgfhD9n3jhnWVk+10RNuYjl11lS872ccfF8W/UVP0SodFPWjJnO7OavDPyUHiuejts9+FuhpA2u33abeo46QQkC7qprukCRqmg/1m3PJAPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCAA6JWmGuxW+ELD/ymApG2eCvlH2/Cf4nT6KNowou0=;
 b=KJxcv0CnzC9cuQGX4EvT3nB13HybXP+l/w73iOdOcg2t9nT1/zTQHH9r83T2Mf/SWeot7rcm0fkodNg2Pp46Ou8XpgsnismM5ePzNVwb8BbtpzE8G4A5Ma70R0TGX9KOMMqxzwEnPufDV7bftj36e6ruMAVkJgW5GYrjksQt/9s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11823.eurprd08.prod.outlook.com (2603:10a6:800:324::5)
 by GV2PR08MB11539.eurprd08.prod.outlook.com (2603:10a6:150:2b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 12:56:46 +0000
Received: from VI0PR08MB11823.eurprd08.prod.outlook.com
 ([fe80::694c:3790:be1a:8ddd]) by VI0PR08MB11823.eurprd08.prod.outlook.com
 ([fe80::694c:3790:be1a:8ddd%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:56:46 +0000
Message-ID: <255a576f-2d5f-44a0-af67-b6ff47be5a61@arm.com>
Date: Wed, 11 Mar 2026 12:56:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] ACPI: APEI: GHES: share macros via a private
 header
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
 robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
 <20260224152230.00000531@huawei.com>
 <d0911510-9f87-49ed-b896-fa00e5d2a98b@arm.com>
 <20260311123947.00000be3@huawei.com>
From: Ahmed Tiba <ahmed.tiba@arm.com>
In-Reply-To: <20260311123947.00000be3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To VI0PR08MB11823.eurprd08.prod.outlook.com
 (2603:10a6:800:324::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11823:EE_|GV2PR08MB11539:EE_|DB1PEPF00050A01:EE_|AS2PR08MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 411e1e31-14bb-474a-11be-08de7f6dcc6a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 yyYNkQFtaq5TM4VywHlHbZg4FmVp0yLASE5RRLHbkEU/7zhRyOrc7NCKKreDla1rDj3xZkNnMLqq1gT2rF8oKQtnCIujRr0rg5SEhEPobsabt+SGKOuEzkkJC87KxlHPo5TU3VNZyRL5BmWHnN94eE6nPOM1NemJkzv763EJv2roxoTV1RsFZHKjni7hOuooEyTNmz3ZpB9kdHf30XStqn782lZHPC06EOwNaN9hcIvYy5Ux/tBdpSpfT+ReY9uB9y+Se00/JOmTk/IMkVj/kkCqrGnT3MpePFzgYnrY3nLGNzfkEeDkdSdtR6KK2V828UZrAf+8WHi6JFVUi5LI4X67GbLlaahWsHqiHEJgyN0vzgq0fw9Fw/j0WGOHS9K9ZF5e1Pp+RpxNgtcKOxh1m3+e+WLSoRn1YDqmaL8bcB48VVc751baw9jFIhEh9zG7fAfgsS0TPRdQq8xQSov9Ck+LOWo6iOMus0nDr//7HYU2dX/WzB+HpzdqQ1Cy4n1tOP73gi4k14jUK2O9uW5MUXvgnqZrYiNInEQzTdBanwcXsQ5OkSrCLA5geE5lT09D1zuHrhjsVm0iiLHJjAl08oLS2ALlq1gs4TI06jO9lCdcgtJB+N/OUgoNTsya6HP52uDWaxqsc6R5vVeguYyU/SPImkOS36WAEaM9UHMGkA22d4og6+/ASsPR6lS3cfBARLj+YXZCNJLZeCDmPlZ1IKBvb8Sr4ybsLwe/m61+6rs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11823.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 pyWJzamWtJxfhVjllCjyXcRcL23iDrPDRgQ276RwYuI1mFY/53Li3Dzh1WXqYggcGUNkoIS0JOlKSwBRjCr5Nr8yjjUhhQVEMPmTmI0plcEWvj7pTS/3nh+dgg1xu3ROo2vPlLzNUn6Q+Ia6xwZyrL+6j5YZN8zFPxpOjsdQ8jBc49O3uDcAUPif5I2Lnn7d2nyOX4/t7cKBbEWapCeRmvM+EMY6yCXPW93bgnYCIEd8YUghqG/QI2A1KqlqBoLV+Ju6BR8/RCG6LUcd7EYHCwiwMMWia1CYSnezy2Uxfud3LRrc7Ne6Idqzf9WGO3LnGrws8/2FeJedJWGF5PpjIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11539
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e11a3083-fef2-4965-4da7-08de7f6da613
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|82310400026|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MpDz3KFvBy/mWIa9O5QhJ6ZaJcGx9pvKZAHt3pnWIda1sb5JB6N26pTWtqsxVY9US9QDpg1JX+ESOrczS4DgrI7XbriJpYF7+kc6rMbSbPRWXk1mMKEXwvfQJXja0b5uFCziAdhWmtOya16Cl+Ub0VYx+pc4mTnTHGTa/hSVaipMuY3bCQU7MhwEew+LGmUOJV/H2jULp0TW/1ReZ+RJmjP1jT0FpEMaC5xrK1hXtsWT3IAkq5o09frbapSATGH0vYM98qbOjvnibFU/vj5JiHQK51LvAQaW1+fCtqqm83JW1LhUB3c7aoYOcMC3aveLAZqV9oQUh9Ll9dESqENFx1EGo4IBe/ItEsCU6CzZf2T/IBpUk5D/TRs9klQOOCBHzOKGhQrRzyj9TvSiyukRAMD5mVXnInmbgykb5YwrlFcuBrvnyqEtNRFTtU+ektdD0GfvfDKK0ENxpk2A2wrzgn2Tvd8Qol2fJAWgHeiFSTfXU4EAE40tK81KZ8PB/JndrNkFdv/r5aCt2OChQ96ZyqTO6OCmAN2jeEXr87SNeBooaprI0NG+U/TFtaW3yn/aEVFFJE98e5dgMoNZtnY0a81QRcxrrUzwHPKHvA9YSpy2Rp8USE+fLD+GZ0x5ZWF0tUJI5m2OOjMLk0AapIpyPKzLtnulQy4n9KefvG0D2w6bTu4nisuVWK3g+hsf0n6GxqFGWm3sLUcMEyixT6z205JgIALNDRh+fCRgJ4Da/ZdZGRv+X6UCCx+WZOMt3ErLpcrF4jg0NzhRb7kTEbVowQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(82310400026)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	viXj5MH4Sp1xdgeT1iKO92nvLP1cAJxwUNzC2zNVu5Q2BfTzT0m8z8fSTNIOkmzm44NxjTC3LumGsSB5MPFPSBZloQdh3AXDw2If5U/cvkTHYwvkT/yK2lYfjK4pa3UyUwSyQyOIs8PkstV5DzcOE6jweEfHGEs8E5nZjC452FYYwfMzmukFiLWwpxRScSCG0xM/ff+Mi/4Pxy0w3AGsTNxA3yZFtyN1Vh7SsMZOJ4qw92CScx/l6MH2oxU070t49sk2c4+m1Pqud20ARa8lt+oiOza19w0tEmLpTb9yH795sp0gM8u5DuPc2IDpHDjy2MWEsS9WHdgBHb65xnQR/HLWsAZ3NGO3IkDglACl4aYNLBvmJiczR0Tcs3dvXu/ECIm/8pX6bMMZuyTqlU8SChG9jJU8gYZzR683sMn5TPri8ngyRFGifm53Ipx0gMRt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:57:48.9826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411e1e31-14bb-474a-11be-08de7f6dcc6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8645
X-Rspamd-Queue-Id: 4D94A263FCB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-78852-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 11/03/2026 12:39, Jonathan Cameron wrote:
> On Wed, 11 Mar 2026 11:39:38 +0000
> Ahmed Tiba <ahmed.tiba@arm.com> wrote:
> 
>> On 24/02/2026 15:22, Jonathan Cameron wrote:
>>> On Fri, 20 Feb 2026 13:42:19 +0000
>>> Ahmed Tiba <ahmed.tiba@arm.com> wrote:
>>>    
>>>> Carve the CPER helper macros out of ghes.c and place them in a private
>>>> header so they can be shared with upcoming helper files. This is a
>>>> mechanical include change with no functional differences.
>>>>
>>>> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>>> +CC Mauro as he's been doing a lot of work on error injection recently so
>>> can probably review the use of the various structures much more easily
>>> than I can!
>>>
>>> My main comment is on the naming of the new header.
>>>
>>> Jonathan
>>
>> The content is intentionally GHES‑specific CPER handling,
>> not generic UEFI CPER. It's the GHES view of CPER parsing/handling
>> and is used by the shared GHES/DT path, so keeping it in ghes_cper.h
>> documents that boundary better than moving it to ghes.h (which also
>> contains non‑CPER GHES logic). The helpers moved there are the ones
>> needed by the shared CPER handling path.
> 
> Ok. So the intended meaning here is GHES and CPER, not stuff specific
> to the CPER aspects of GHES.  Maybe, though I'm not sure why you
> don't just name ghes.h in that case as GHES always incorporates CPER.
> I guess because that file already exists and covers some ACPI specific parts
> and HEST bits that aren't of use to you.
> 
> Ah well, one for the ACPI maintainers to perhaps suggest what makes
> most sense to them.

Ok. I'll keep it GHES-scoped for now to avoid implying a generic UEFI
CPER API, but I'll defer to the ACPI maintainers if they prefer ghes.h
or another location.

>>
>>>> ---
>>>>    drivers/acpi/apei/ghes.c | 60 +-----------------------------
>>>>    include/acpi/ghes_cper.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 96 insertions(+), 59 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>>>> index f96aede5d9a3..07b70bcb8342 100644
>>>> --- a/drivers/acpi/apei/ghes.c
>>>> +++ b/drivers/acpi/apei/ghes.c
>>>    
>>>>    
>>>>    static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
>>>> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
>>>> new file mode 100644
>>>> index 000000000000..2597fbadc4f3
>>>> --- /dev/null
>>>> +++ b/include/acpi/ghes_cper.h
>>>> @@ -0,0 +1,95 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * APEI Generic Hardware Error Source: CPER Helper
>>>
>>> There is other stuff in her usch as the GHES acks etc
>>> in ghes_clear_estatus(). So I think this intro text
>>> needs a bit more thought.  The boundary is already rather
>>> blurred though as for example cper_estatus_len() is only
>>> tangentially connected to cper.
>>>    
>>>> + *
>>>> + * Copyright (C) 2026 ARM Ltd.
>>>
>>> Doesn't make sense to ad this copyright in this patch as so far
>>> it's cut and paste of code from a file that you didn't write (at least
>>> not in 2026!)
>>>
>>> Might make sense after a few patches, in which case add the copyright
>>> when it does.
>>
>> The file is new and maintained by Arm as part of this refactor,
>> so I kept the header consistent with other newly introduced files.
> 
> It's code moved from elsewhere, so you need to at least also list
> the copyright of the original file alongside the new Arm one.
> Just moving it and dropping that copyright is inconsistent with
> the license.

Agreed. This is moved from ghes.c, so I'll carry over the original
ghes.c copyright into the new header and won't add a new Arm copyright
for a pure move.


>>
>>>> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
>>>> + * Based on ACPI APEI GHES driver.
>>>> + *
>>>> + */
>>>> +
>>>> +#ifndef ACPI_APEI_GHES_CPER_H
>>>> +#define ACPI_APEI_GHES_CPER_H
> 


