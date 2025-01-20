Return-Path: <linux-doc+bounces-35689-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB726A16907
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 10:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C803A5F09
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA5B1946A1;
	Mon, 20 Jan 2025 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bcOzY2+B"
X-Original-To: linux-doc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F4187342;
	Mon, 20 Jan 2025 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364663; cv=fail; b=TJ5MIwH5R9LLzK4y5RBzeFICLACIvi04mhcoRtaD4yn3tu2+Spz/yLg3Ym9VNzIC20P0SbMZs70XB5BThvkM9kq1ioDkZ6SV0y8+X3BBz5AJQeZiI7RQWy6x+cwPriSdzFOWmO3WNgLqKvO7mWtQB1Jp47yEGVOlmiBMwPQOTbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364663; c=relaxed/simple;
	bh=VCAbINnL+nxqkmhKnSrrxGOVUx4vTNZF9uIbtjp0kbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DiHbwg5/QPX87Pd9JILtMaLYGB5C++wnL3LvnHy69/4GJKVCxlZm21RQ/YYQv8VTQ2ASttABcgxhuIhi9QxaaYzLLmStIiCwo5zbXCrhPtmnxXUD2M9NyYRzaTNx7gqcvv9H5wLb35GM62klZJKEuw6ZZxqOjx+bRfoiXhZ7g2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bcOzY2+B; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUw8pB9Oym2iZv6ALe/whnGEJ2B96OoHGXtwIufrItthc00GWLQ2GRn6e3ayAMECEN5MzeR75Adc/LZyRVImFX52KHl8TeCZYFoNb40/ArZmFfTFoNI8O9Eh+9x0io8SwKxG1x5FUog6n9HNAaJYfJ6yJ/YljR5aqgPq+AiSKvZQsyZyXIr09mllgPRD/hPIxEInJ2s9WAY4V8g3nQqK6r70XYdTovqmdnfMJKcDMEiKbyEpbvEWc4YeYigO8Eu7eWx/pt18d9j0LpUUJSJcIH++jnyjcBXzYoqHOcJeRudrwxe2vyEqnsmdESzQVLeCcRoW3PFbi8Y2NRxBgYYdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PsAFKovgFm3yjvGQ7ooOun1oXIIN698eQq2t/TYGUg=;
 b=ks2XN5CgGTgzu5S3N1oFVG1dGCAJApPOUmV7hyUAW042Cza6MLZGqcVUI6GZX0LhQ8gonD5AQFNvcH7UpJdnsiG1o0ZqtjvE8mo/kKs19r/J3Td/YNBHv3Kw46kh8AVSuPfnCuFGmqhb0rEbogn83SFH8ksUvBLeXnF8mfQUcDxRruqd0kRlSYiJFryD0uE0YRo1RdqNlDVnFWpPMZQr3/H6Ynk2Get9TFvPNGIMiNTFkuT55preut2LrCO5MFmAbelvsOrj6UeuuLg19FLJKDiSoGU0EBXswpEdNk3OBdFV3gtW5FhiHjxjKmrtfW/peEgPtcctrLS/FkX6zggGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PsAFKovgFm3yjvGQ7ooOun1oXIIN698eQq2t/TYGUg=;
 b=bcOzY2+B2MRoy3U6jNrHU5cdx49DV+5+tW1WWlG2kaZtdPGzRPubJFMhFuyfT18ngisO8EBXSyGLj54VgQk2PgWqPyGaSIkshbsHBaE3bORla9MXG7q3aSiO2N3t6yErjQyfC4aMZmSL1jK8gOBW7mUtKK4jrY4fCCtBo3MqiQsVbRB4zMst4mPXdSKqdIS+0JCz5HC+Enx7ptf7TBe2NoNhyxZ7Na3tqNZC8znGeGfjJQTubb8XMN9dqdMIbEdqeKQZwKGCWiJIafyhLWnEtKaW3SxU4TzNKUP2XshUasqbduMYbbpJ72UYf8shnUT8Io/6MDg8Cv/Sv+hjAKjXuQ==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 09:17:34 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:17:34 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v11 7/7] ele_common.c
Thread-Topic: [PATCH v11 7/7] ele_common.c
Thread-Index: AQHbaxvz9CQg1q4coE6NfF5NshEKIbMfYdDA
Date: Mon, 20 Jan 2025 09:17:34 +0000
Message-ID:
 <AM9PR04MB86045FF4C650AA15C5081F3F95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <20250120-imx-se-if-v11-7-4d7d8f7f4b56@nxp.com>
In-Reply-To: <20250120-imx-se-if-v11-7-4d7d8f7f4b56@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VE1PR04MB7360:EE_
x-ms-office365-filtering-correlation-id: 22ac142c-e08c-497b-27b6-08dd39334692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHoxZm1KUGljaytDMWhMTEd3RFlRWk5YL2hZSDhzY3JYWGpxUUhnSXN2ZU9L?=
 =?utf-8?B?YmN3S05jZytmYkhzZjJBRGxodGx0SUV4VjdLSUsxeFk1UEZZNWJDMFBKZTFx?=
 =?utf-8?B?c3ZlYXVwd05HZUtMZWVNeTIyUE1JUTVkWDRJTGg1ZVpGMXdjOXRZdzBDRG4v?=
 =?utf-8?B?L2p2ZVcxRzRzYjZUcUdsbXpMRFdtSktmVGI2WkRHMGM1aW9TZ2tzb2hyTTRj?=
 =?utf-8?B?TWRoeXdscFh6S3plWXlwQkxGcXh6SHpSc2ZTTEJLY2dIQkZaWlprTjMzUlVU?=
 =?utf-8?B?L1NNRUpNTXFxWnBBMzY1TmFCUTk0dFExc0VyRkhuQW56bEwxWGlXM3MwTXJW?=
 =?utf-8?B?QWdTSWo0bGtPeVNNbWY2czZoWkFjSUFiVnpzbmdINmxSWXJGVWt2TlUvZVVM?=
 =?utf-8?B?bWlBT3BKbDFDS240L3hkbk9BdWtpeGs1RjJYdzZzOEQ4NTNlWTdONlFBOVNS?=
 =?utf-8?B?dDEyUGpIWW4ydmUrWjcwOWlJbm54VzdKcWFiT2haaTVZeDQ4em1FSVBoMk8v?=
 =?utf-8?B?WWVtTWoyYXdIMnJ5aFU1elhOVWdSN0k5eGkvb2hUYzBacmJsTFNuRkZWSWZE?=
 =?utf-8?B?c2IzY3dGQkFobEtYRDcrUkxxeUVmREI1R0hRNVc0VEZwWWdZVmlHMTRyYXRG?=
 =?utf-8?B?MHNEZUtOTXU2NlFzcmFPOW9ubDlvT0FpM2NZNGxqNVNjQW9mMnV5VERIRk53?=
 =?utf-8?B?by9FRklQNFpiKzk2Y1UrRUtPOFhZaGZGUUFUQ1M4YWJ5TEZEakZCZldrdlBM?=
 =?utf-8?B?NWxuaHVrRHpXdmEwZ3dpRjVsZEwwNTRkTG1DZTN5YkQvNmcrZm9FOExOTDBC?=
 =?utf-8?B?TE9lVGhYMlJRZUlXeTJ2cHpRM2dpRUJjdWg5SlJhNG1hVTl0dU9wN2MxMW9C?=
 =?utf-8?B?UUVYNkk1VW4wK1lJUXl2SjlKZ3IvdW9GOWJnRFhoZ0FuT1Q2TlRaZWhDL0xI?=
 =?utf-8?B?V2pLTEY4WFB4dHhKR0JQd1dmVFRLYWMrbCtucXkzWnhLOXovN1JZT0l5YzJT?=
 =?utf-8?B?ZDlBYkJrRWN4V0dPZTRGNjNtZERvYXIzSmpDUDYyZEpDSFozSjlOVnVrUHpz?=
 =?utf-8?B?ZWp3L3VTbW5mNktDaEo1bGN2aEpmSk1oemFDekNUTGpnVEszd2VacVZEU3Jx?=
 =?utf-8?B?MHQ1NEo3Rmx4cS9wVE5pM0t1U0wwOXplZ2VjcDNwZDNCQUZNR2FySlRVbUoz?=
 =?utf-8?B?eDFuMDZIQ2wrRjRPaitkSDRLcm9DM1dSRjFCeHQrSWIxK25QcW5WaHdWS0Yy?=
 =?utf-8?B?VDVMckhGT2R3WFdLcnFVT0dyRko5M0JsWklCR3ZvcDVrRjA3bk1hQmk2VDht?=
 =?utf-8?B?ZDg1djBSMTRXY0hRM1hIYUpxdHBBYWUzS0hCWlFFYTN3U1J0bFVkYXVPM2J3?=
 =?utf-8?B?V2VuUlB5bFJWSUFiOUp6TGlNckxMVjlUMkoyZFZHL3dFcThDVHJ4S3E3WGI0?=
 =?utf-8?B?MWVXaC9zNi9SZi9yYklBYjFLazQ2aWxXL2F0VTlQSHBTZzFkN3RKa2VwcjBr?=
 =?utf-8?B?VytYR1ArNXdZWkZOeFBsQ2xqdEpjTk1aVFRMSHlPdVF1Q0VmVnF2OXdOdHFN?=
 =?utf-8?B?ZEpweTFFWEtsNDMxMm0zUTRCQTBzUXFYQnB2TW45WUdpeDZ6RW53c3gzRXdN?=
 =?utf-8?B?TXFRYmRYQklVSDlmRVh0UEtWR2FIZFhvK0syNjFLek84WGU4Rkx6cy9qSUdW?=
 =?utf-8?B?OFpHWGh2bFFjdzlSL2lSZ29aYXlFL1BUZ0ZlYW56U1JGUUl2dFRZOEwzK0JI?=
 =?utf-8?B?MmZXcy91WWp3Y2dNMGFRQjVhSmYvR0RqOTV5cEcyUENZNEUvOE8vMDlYTkM2?=
 =?utf-8?B?VE5mNWhXc3A4SE9CS3NwTjV0bWRSTStIQVhkSWg3K0xERnVFT1hjZHF3T3BN?=
 =?utf-8?B?cG9ONHQ2RmJaWmgzRjFwdEFaR3JqK1ZxK2xxN3RrSlJYWDlwZTlnd0w3ckRs?=
 =?utf-8?Q?D9xadaXe3DgEI+5R+LKxoA/yX81gM3Mp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bE9CSEs3UVRESm9WREY2VUZFREQrcXRPL1VUeW5WZnBnOGpoeHovS0daam5v?=
 =?utf-8?B?WTJQNlJwajVMOGJxcjFpT2R6cjl2ZVlzRmVTcHJ1NUlBTTVRT05yNGJIbU0z?=
 =?utf-8?B?SXpnaHJYbVNIYXJPVExVL2RWazBGNmNqS0E3emJ4bDZoNXVIaEVoc1RDejlY?=
 =?utf-8?B?N3pPZjNOWFM4NCtFVzJ6eXg2NmdkcnhTRFMxYitCL2RPV2E3UEQ1QzFOWW5t?=
 =?utf-8?B?ZzFMRVc5VkVjK1gvbjVCZEdnc09IZUJRWXVwSmNSVGlMdFZTOGQ5dmZPbkdo?=
 =?utf-8?B?ODdrZ21vMng1Q3VCdDdVVFZGWXdsdnBjb040cUs5TkJVMmtSd1ZFWkJrRXVG?=
 =?utf-8?B?NitKb3JkMjByODRBYXAyT1ErNE9iaitQREFET3ZhLy9MZmcxTkNTOVlhRHUr?=
 =?utf-8?B?eFhMUDZaT0VHcVFCem1xZ21iODdjZStzeGdaVmw0UVpFK3Q4SlNxQ0FIUDNx?=
 =?utf-8?B?MmRzVnBsRC9ScDYvdXFUTExYYzA4TzhaSXlUSlgrbHgwVjFnbWsrdm5Zdzkw?=
 =?utf-8?B?Z015Nm1LdXpicnBRWEtQWUJRUFVxZFBGK2NHZC9DNjh5bkJqLzVWQ1I0TDlh?=
 =?utf-8?B?eHduREhhRHJuYlhXcDRPVTdqZ3hDS21wUmtERmhnU0RoeXNCR3lDWGI3MzNy?=
 =?utf-8?B?U2ZnOHAxUWxSanVxM1F5dnh6K2o1VVd3ay90cndnUE0xWW5NOTZKQ1A1ZnlW?=
 =?utf-8?B?d1FBOWN0RXZScmR1ZzhyOHJvdGIzRWJSSFkzMnQxV0pweWkvVm9kK3hiSTRv?=
 =?utf-8?B?bjVRanl0b2hvTGxzbTdzVVVLNlNBSkRzelJrWnUrdkxTcU9BMWc2OG1PVTJq?=
 =?utf-8?B?U0ZBdkZQbzFtZ1RwOXE1aFBZazcwV08xUlo4SXFxT1JnU2VaT1NIS2ZZVzdo?=
 =?utf-8?B?ZUZQWFVOVjlJWmxRR3ZpaUZzZE1CQTZJN3BQdkRmamRnb2V2elpSWnRtenc3?=
 =?utf-8?B?NFFlaVZmck1FQXlLMTRKU0RwbFVmVmxxTDdMTmVtMGxhbjVlZ0taZERFTkZU?=
 =?utf-8?B?MFlvRkRFU0gwaWdKNkp3L01EU0VTVk9jR1lvMlU3dVNPcnVTK3FUVW5JY1Ri?=
 =?utf-8?B?aWt0L0dhc3d0NHNrRlZJOHRiSFB4YnRDM1ppbWhDMGlSTU55NnJUNmZtOXNM?=
 =?utf-8?B?WlBLbkNZV3J5djhoOTEyaEFtNHc3bGR2SHBMMzM1d0pCZUoxYlE5L1VJRHo2?=
 =?utf-8?B?UnQvRWx5TzA1b2pVS0NoU1hHeU5PTlZYalVtYlM1cWNPVW5uWCtNYU5talhu?=
 =?utf-8?B?VFlFOTNyT2lpUE9zTnRuTXhWNmFwRGpCVWNtcTlDSTJOemNraFlNNXMyV1Q5?=
 =?utf-8?B?VUxHSkRlV3A3OW1HUVJzcGN6SExYNGUyTDB4MWRNalU1MFNHdENuRkpnNkVI?=
 =?utf-8?B?YkZHdzhjR0RLZGZYRDNCQmI4WWpNNFNENHVUdFJGd09LWXlJb1VWcFF0alhT?=
 =?utf-8?B?eXh5RFBlWWVHUERyekRmcWNpMndBeC9Tck5XYWRvVW9iQjBzREZwWTMxbGR3?=
 =?utf-8?B?cGFudGZGY2p6eHdNcHlOV3JOWlJLWmxLSEpxRmdRWHJHSzZKQU1tOWdPYWpn?=
 =?utf-8?B?ZVIxeHdmNU9HSnFDNkptS0lFTWVvMlBaWm5HNUYzQnA2NEJSMzJIbGF5RFlq?=
 =?utf-8?B?djIvSjU2YVc2UGROcktGM1dNK0FOYU1OV1JkNkhOajZtcjluVkxPYkhWblZ5?=
 =?utf-8?B?TVYzc1NzYjdkWHh4S3RYREk5UENYOU8rTldXZ0VDNkdlOWNhQ2FtMHdkNmtZ?=
 =?utf-8?B?ckw4S29VM3FPLzZnOGxhQXFKM1l2WnF4cVlJa3JydnJlUXhDU1lpeDhYODdS?=
 =?utf-8?B?L09JcmhoaUVhVFBlL1VnUHlzN3pxS0Y0OEFha28zR2ZUT0FRNWROOFNSbG9Y?=
 =?utf-8?B?Rm15SVZiRE94cXo0TlFvWm1RUlhIM1JkRDVtY0Q5LzZYbHpPMmoyUUswUjNN?=
 =?utf-8?B?c1Q0Tnd1Wk52RG5KTlYveFptUXdwTEFMNGk5WWQwUDFJUDJuTi95Yk9Vb1dZ?=
 =?utf-8?B?cnVwNCtneHpIa0s1RmxydmVjTU9aNzVQMDEzT1FMR0ZLK1NMWUV5TzBiL1ZY?=
 =?utf-8?B?eDhUVm14Y1lDSkhaL0d1NlpVdUVTaE4yYXhjY0FvSy9VWnBOclBvcnJhWFIx?=
 =?utf-8?Q?LbrQGOiZYn0VJ1jSGeqH1hx21?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0419_01DB6B4A.3C4F3F20"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ac142c-e08c-497b-27b6-08dd39334692
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:17:34.5948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7im6w02/THfxRnzBsaZt7EQtgZ6T6+2DphbvOr8cLHrecaMXaKFIVSGcDayHzVdtPTS6JjXyobSUj9QOQQ03kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

------=_NextPart_000_0419_01DB6B4A.3C4F3F20
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Ran "b4 send --reflect"
But it sent to all.
Please ignore.

-----Original Message-----
From: Pankaj Gupta
Sent: Monday, January 20, 2025 2:46 PM
To: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof 
Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo 
<shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix 
Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; 
Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 7/7] ele_common.c

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/ele_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/imx/ele_common.c 
b/drivers/firmware/imx/ele_common.c
index acabbccf3e36..2e14aec3f2e7 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -6,6 +6,8 @@
 #include "ele_base_msg.h"
 #include "ele_common.h"

+#define SE_RCV_MSG_TIMEOUT	120000
+
 u32 se_add_msg_crc(u32 *msg, u32 msg_len)  {
 	u32 nb_words = msg_len / (u32)sizeof(u32); @@ -43,7 +45,7 @@ int 
ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 			/* FW must send the message response to application in a finite
 			 * time.
 			 */
-			wait = msecs_to_jiffies(10000);
+			wait = msecs_to_jiffies(SE_RCV_MSG_TIMEOUT);
 			err = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, wait);
 		}
 		if (err == -ERESTARTSYS) {
@@ -304,7 +306,8 @@ int se_save_imem_state(struct se_if_priv *priv, struct 
se_imem_buf *imem)
 			 "Exported %d bytes of encrypted IMEM\n",
 			 ret);

-	return ret;
+	imem->size = ret;
+	return ret > 0 ? 0 : -1;
 }

 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)

--
2.34.1


------=_NextPart_000_0419_01DB6B4A.3C4F3F20
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMDA5MTczMlowIwYJKoZIhvcNAQkEMRYEFIIJ0sJqQ1xps6k3dTmu
LzNQo42BMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQCLyH2tfHpiRtgvwrtRTa4Dd9SfcPSLg6GHWU0qklvXQ11YbK8Dvz3ix5gxQ/9npc08jJQhTiQx
EM7PjDSTApJpEthuuwimWfPHh8PRP0ZWsn7gMTq12beYsSsgag+tpj147cIsySQfidFMXyYB6lkc
ns7bXzGROinGsXwm+MRSNFi1jU0BPgEZVuuqfOpgr6hjTm6XwnfPDBnu5Vg9FT+T7w4TzY+hmVt+
J+Rd4H1HYFY4L2tnijxcLh9zRXNfj++4ly1lhIVY0hfu6I38pt/QR3NCC5PVLR79QRhwO3InGoFU
emnRHx6/MZykFNnUop0Gt6nWLWBY41PSIczwMSKaAAAAAAAA

------=_NextPart_000_0419_01DB6B4A.3C4F3F20--

