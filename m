Return-Path: <linux-doc+bounces-35734-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33236A16CED
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 14:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1C48188230C
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 13:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991DF1E0DD8;
	Mon, 20 Jan 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fFu3FyiB"
X-Original-To: linux-doc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223EC1E0B62;
	Mon, 20 Jan 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378451; cv=fail; b=F249pw+uNh9QJutglrWN9UkQ2BGrtuY5Xr1sHqZEA10tCtKFwwWyonUxMZ9VFBcywov9YFHjKFFgUZQqfXYOFCIceMtACFU2hYlh1Bd4ojXK+j/cZ4iBiWVvaKfqFR+WS1Xehu7eWRByGljrKaDyJ39dWWnJoRDEY+6Au2LXywo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378451; c=relaxed/simple;
	bh=qF5KIfHcegBTANguC7z/y56OudzLJLc40cb2K+xd2Ko=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F49jC6uiGLycz79whX7xhPilCj8GyOuFqrKSrvHo3BPQRdM0LZ//raDhgzQDuY/MApaX0JRspMbRqvsZ8heL3/QNYZcu2kHWLXxgdwLJ8FA1AK7PFZFfu7xjxoUYWxBMz534Nzabze/Lh9R45iDhO6PY5RF0U4Iv1xfpfznJLoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fFu3FyiB; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIxK8t1awCLxPD1nGj0nAJF5xbb2LxJ9JsGHB7m5d9nYoNAOvpv+oeUtJYWwvI19562FHtQltaLtSk8agboQi4RujzCDA45gJew4+wkw6uoW2qvqwZYQZiAq5s0uDlArgnm3B2ha5qMuQxW4sXTh1T9hlXdllQeAAaMkvZaSztdi5AR3QxggNdg3YAQo4U9NX1B4VV9FdPScb8iQFhpVeyPLj3QpJ5OVDkChZVJF+WSaRUFMReehCr2I+ImvaZnPIxrBU3t4P6sdNTapFtv1sIAzo9XYMWCgc4zFklk2QOJlsoBlUMumz6QCCLp02NP9YUhnV8cX/lj2QJpmYEyKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EfLcY9T1d4B3nmyRriifOShx3UMW7Yiw51czBXy0sY=;
 b=Zv4Ey8T2VNCFvEkdl3ipkRnuvvxxinaqHgCjP/AtxAGAUgNXFG50JPnTQIUMaeF5/+KOp+0kYevLY/uKqJwRmUcY4UaSG5lQ5S2UHicZ649c8a6ZSpGOixNmLZMfubaICRj/fuNW5Il1goq5S1GgA61KJDQTf9vOe5NVkngk9SwGdHN0dDE7+umbmkX6Vnna6IUjed3l87E0T85CNuQs+QM3slHItdv2MVApcIm6wThEQzj3X/ysfdUZhepnWXdLG0PgLXAi4FV5HZl4wASDTd0tmqRXUnQOTqGkMRmjFUzhjWj3W3Wd2qh4OD/fpYvgiTz3hRZ1ymrnK4YZH6RyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EfLcY9T1d4B3nmyRriifOShx3UMW7Yiw51czBXy0sY=;
 b=fFu3FyiBE4ZjgFQ4ROzhjf0oCtJTaDb3tlgIfPUCTxYAR8rwpR5URRDHrLUP2uR9daY11H/LGwyq934avjaRiREZEX0vD8eLddmQxPy6VO7jFbmT2F3nGTco1FF0+WIwOasfrlUdWKcD9rGKSz0SXMCjquVmMrt5u0LLkY09zPThe2tqIq5lw44Iu+vA2Z9BYOKOxPnQEDQ6dxEb0sNRK7XYgo/yECLApyVSnr7nGG5Zygx2B2arGCp6q0I57E1AX7fUJRshBSoky6plr4v7XF6BpE43GXBsT+GyjEgLPc/kYlF14Ah4r38PskkYp84DkG2fOugVdWTXBlnATRcsKA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 13:07:24 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 13:07:24 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: RE: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw
 binding doc
Thread-Topic: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw
 binding doc
Thread-Index: AQHbay5sFM0Ime543E+XE0l8NPyxXLMfk+gAgAAN2VA=
Date: Mon, 20 Jan 2025 13:07:24 +0000
Message-ID:
 <AM9PR04MB86049239156AC82F0AA4BCCA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-2-c5ec9754570c@nxp.com>
 <6110fd00-c050-4bcf-8971-674bc8c0bfc7@kernel.org>
In-Reply-To: <6110fd00-c050-4bcf-8971-674bc8c0bfc7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VE1PR04MB7471:EE_
x-ms-office365-filtering-correlation-id: 7daef09d-0ba2-4e05-b34c-08dd395361db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUpBc09kZTdwNnFFWkpybGZzYnI0QXF4MUorVkszTkFiYk9CbUIzc0F2cXZP?=
 =?utf-8?B?MUh3S3FlcTdnL21ib0I5OU83K2c2ZlppbmYrV1RoclYvRHpwOEhLZWl5V3RX?=
 =?utf-8?B?WUs3eUlyRlJBaGNtR0t2b2ZCTEJmL0xBblM4NmpqZVY2VHJYMXo1OW9BVWNB?=
 =?utf-8?B?TExFK29nbHZvbm5QVGR0SHA2cUwwak1SUjZWWjdlM2puWjNkZVExWFpDVVpp?=
 =?utf-8?B?L3QvNUVhbDloVDVreko4ZnFEMnhXKzUrR1RVTUNVK3h3elhUZnNhRXl4enJy?=
 =?utf-8?B?b21vSVAwYUZxLytpcHdjeGJSTUJ0VndYV0ZwVmZkZGVUNnVJaVh2WFQwUlA0?=
 =?utf-8?B?b3pBYkhQWk9zVVZ1bURLRldPMXVWZnNiWmN2a3pndHZZOHRHMHQxUmVza2R2?=
 =?utf-8?B?TEROV0lxMy9qWk1oNHpiZWxCclFETCt6UU9kcVBnbTBWeEltRFhkd0dIaW1x?=
 =?utf-8?B?L2FDc1A1S2tXY1pFVlhjNkgvNFR4NzlHRjVQby9hMDRBVUl4TnV2aXZ0RkNY?=
 =?utf-8?B?K2VKUXh4MG5FYU1VSnFtREVySkpreWMxUCs4WDdiMUVOQVg2cFpVa3NXTnlB?=
 =?utf-8?B?RGxkWlUwNVVRUEI2bTZxTlEyb3d3QmZEZUFtalI3cHQ2anF4WUNFdm1ZTG9t?=
 =?utf-8?B?cUtLREJXSytPVTNSMElXMXlmMTZEa1dzMjFldm15RllrLzlLNmd1MzNYWEtm?=
 =?utf-8?B?NFhnUkpVNldHSG5hR0FmNGhBUkFBMjRwZ24wQjQ0VHdKN1dVU1RRdUdCeFFB?=
 =?utf-8?B?NE9JK0xUa08rRXN5MkdHNlZSMUZKeS9mazNhR0NBV0g0am5wSGlXUkEyZW55?=
 =?utf-8?B?NXpBZWVGVEo5M3ZwUXJJd0JHenNwM0VDZFU5Z2pDREJ2KzQxUUFwelBvQXBH?=
 =?utf-8?B?RWlFZnNNWVhGQzN1bGJVRit5Vm1Xdk1nRXpCeko4R1hIYUhXNUQ4WmdxNnN3?=
 =?utf-8?B?TmQ3T2xoRFlLYWJ0UHJCRDJKeFc1Y2pDcEZMTCtqdCs0ZnFlOElWYUtTM3hi?=
 =?utf-8?B?cUlxKzgrMkh4MlBEMHZiS3ZXZ2owcXBZNC94dTNrcTFQcUpQQmFWM3hmNmNN?=
 =?utf-8?B?b0V0SmVoR2VaQnVLZ0ROZDRISHZqVW9hTmlFVFJkazEreTF5dHNzK3MwWENz?=
 =?utf-8?B?L0dmRi9vOVJCRDRqZXgxWWZ0U0J2ZVoxM0ZwWDFlN3V0T2Q2YmIxaE0rSjZV?=
 =?utf-8?B?TURObVUyTm9IVFRnT1hDUG5UcFRiVi9TMWRuZWNVWFljRlUzaEZPSFVjakFS?=
 =?utf-8?B?ZmsyS3NRRzlMazRWbW1zZ241U2xXMnpQUjAwZVhZS2M0ckVndzJsa1c5dHds?=
 =?utf-8?B?WnJyVnhLVlBPZ1ZNWngzTkpsak4xZmxySjQydUZ5ai9oOXY1dHVTbjRnTU5S?=
 =?utf-8?B?WGlXbmlCWldSdm5PUU5sV0UzL0RqcWVuV2toSURScXUwNnJ6VFE1LzNsSUlY?=
 =?utf-8?B?c3dxTlBlK1NMUnZndmd5ZWFXUkNvTlhMZE9Waml6MjVTcUIzeTQ2ekd6SFZT?=
 =?utf-8?B?S1Q0K3hvbEd4Myt1UEZlQlBsc2E2NmRrN0tmRVppd2x4cjJZRjFLK2dXa2JJ?=
 =?utf-8?B?aVU2ekVNanpCRkQ1VzVjdnk1ajBEek5QUXRxamJ3a3dta1NTQ1ZhRUJKRG1t?=
 =?utf-8?B?VFY0ZDhTSTVEbkUxQjkydVpTeW9oVUp1OFNUTHR4enRrRFR5VFArcFVPVFNH?=
 =?utf-8?B?UDg0UkF5TGM1MThrUE1udjFzbXd4elRiaUZOUmpTMldHanY1ams3c3ZnVU81?=
 =?utf-8?B?akNldEVxNjB2b0ZLMDRwYnJMT2RKMDVjSmxDVlJqdk1Ic2xabzJ3cmhtUThv?=
 =?utf-8?B?NFZPbDdIZG11VzJVSmtxaFZPS0dmT1hlT1VNemgrMXBPc3lXZFlZUGEzSGtB?=
 =?utf-8?B?Y1BtL3hFMjdnem5RRmkyL0gvY3hNeXJBU01yZ2VCRVdOSTh2Wjc0bzdaOEdB?=
 =?utf-8?Q?9Y3/evBZnr7scJI5MaErlkMmUQ3AP2DG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTR6UzhBdTQ1QWFyUTJDSzFiNVNCQVlJVWJHMDBuMmtiS1lWRjE2UGx1M2V3?=
 =?utf-8?B?Sm96N1pSY052bE9iL3FDZzk3TmRjaHA5QWN6T3lReU8vQVNJNDFadHlGYmdl?=
 =?utf-8?B?MVFpOHBjZ3h0MlZRTXpYbGRIaXNXL1Nudk9kSklyU1F0TkxmaHN5emR2cytQ?=
 =?utf-8?B?dHl0bkpSaGtHb1Nzc2xRc25VejZ2clk5ZkFWZnl5VFpvM0Y2WGdHdG1JWWpI?=
 =?utf-8?B?NDRQWHBoWkxHc1R2MGkrR3BhNHpKRWNEaWtGVzVFbDBSbjJ3TlZWL3VQQzVV?=
 =?utf-8?B?dDFFUjNLNnROTjJDUkNHUW1BaEZ6azU3KzVnUC9aV1QvYWtKZ3ZscEtlUVln?=
 =?utf-8?B?aEhpbi83WFUvWXB6alFwYVZiVk1STWxLcVpmQ1NpL3R6NWxVNU00dkh5T2Vk?=
 =?utf-8?B?NVFsa2ZlMXdJbmJhL093NGl0djRUMEV6MnF0L0FaZzZqMG1oRFRJeWhFR21o?=
 =?utf-8?B?RUFlNkpiaFUwQ2U4cWJZOTY3OGptVkdKUTBVbU9VanpEbGE4WGtoWVZaRkZL?=
 =?utf-8?B?UnFOd3d6a1NZTytZaklEd0x4azBQSkRUME56OVNGcEp4UW42L0F3L2tWK0l3?=
 =?utf-8?B?bksxUHVzR0tNZTZMTUZwSU50QUNqcW00eFh1d1lPSG9mTzdyN3hhenpLd2k0?=
 =?utf-8?B?d2YxbmNvQ00ycjhXV1p6dlQ1Yk0xd2VLUllMN1RvUHR5RzNDVnJzeFpBWnkw?=
 =?utf-8?B?OFVNOEp0MytVamJpUXhRLy9DVmlUQ2ZyR1k3R0U4UXNLVnRscnkyU3ppdk44?=
 =?utf-8?B?NSs0LzM5V21MU2FWTkd2aWczbGFzR1hFWmU2NDM1alhjWkZjSXk5eWo5WnJv?=
 =?utf-8?B?VFEyc2pyT012eWNOc0Z2bDZ2VHdCR2trM3VVdFJabGFoSFVyN3lrRElZbnJK?=
 =?utf-8?B?ZHppRjhSUVRoVmw4QkM2SVlZa3lDbFMyVmlzaUFvVlRkb1dBL01nT2RHeUpS?=
 =?utf-8?B?MWVyZXZDK1EwdUhaTDFRWUxxN1d3U0ErTE0zQkg3V21hdzlhMDNmWTJ2MEU5?=
 =?utf-8?B?QmFIanQyRWFWTEhuZ0tTeXhtc0l6ZjJmR1BBL3Y3TC9NWVdwN3FNU01la095?=
 =?utf-8?B?YlRVa29HR0lqVHdpS1NVdVFJRUcyQmg4TDlEM09tVm9zKytRZmlnUlV1dnlH?=
 =?utf-8?B?UlM2ZTdYSmZiWiszdmtDSTJTYVFlQ29NQ0FHZkswby9pcFRUcnFpcHZZd0ZZ?=
 =?utf-8?B?WEtLUXBsWUVhRmEwRlNRK2hpVmhLVXEyZW5jeWZZa0dKNmUxRk4va2FPM1lN?=
 =?utf-8?B?UkRPWHJaUXlnd2o1UGVNREN5RlBjMFpYTDFZeEdya2VsNzF2dmlHZmtzcCs2?=
 =?utf-8?B?UUFkRytaVytSZGFCUUlCMlllSEZnczN5L2h0TmxSWWRzMGxyQlBOVWJuN2Nx?=
 =?utf-8?B?WCsxODltWkl2S05qMzlKT3Z0Mktod0d5TlhZOUFTUE1NNHZMV0s0dm9FVFBU?=
 =?utf-8?B?ZWl0NkV3ZzFNaFV3bDV2N2RBazM0YlNmOWJyM0pmU0NZUEo2cXQ3R01ZUGdW?=
 =?utf-8?B?emJRUVpHZzFUVGFQOUFId1R1c05raTlZTVlOWGVBeUJnNUxFV3R6Wm00a3g2?=
 =?utf-8?B?UmROYkZwakY5T0tqWUNsSnRxbWd4UFRDaFgrRi9wdEdJQUNFL0ZxRVJWRG1r?=
 =?utf-8?B?QkNzTVpRb3dUcHhCNERQOTVEdE9VMUtieTJaZXFZclJrSkl1c2Z3QUp0YytN?=
 =?utf-8?B?bmxqZFZaTzJXQ1ZnYUdad1UxTEM5bkpnOHMzZm9ZUW5uMk8wT3J6dk4xYjh0?=
 =?utf-8?B?RTYxdVBHNG9KdXozYXVKcTUxWkk5V2ZQRFdvcjZWakoxVzdaV0FpOHlwYzBy?=
 =?utf-8?B?T2M5T04xelFSQ1lhVTBxaXNJdFR2R2JTd1Q0UnpDZmh6cE9YTUxwcWlic1Br?=
 =?utf-8?B?UVNLUEVHeGRnb1JpcVdnamdoMFR4S0toV2xjQVFUd1BxTGpQZTVuaHZLcmsw?=
 =?utf-8?B?VUFaTXZxVzNwUFRISTZKUTFFU3B4TWhHYktDak9aTmtVVjFURjRpU1o3QWR3?=
 =?utf-8?B?S0dEY05GQTFSVXB4enFhVTJNZEVHalVGbEVGNlRHTEoxRm1ONzlaVDFHWjhn?=
 =?utf-8?B?YVRRRUtrK3d6WWNHSXV5TFZDSldqdnU2ZmFhMVlIRmhiV25FUVhGVWpJUFRM?=
 =?utf-8?Q?t1eUqMOktp7OBoSsTyRlGjFGN?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_055C_01DB6B6A.578D1210"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7daef09d-0ba2-4e05-b34c-08dd395361db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 13:07:24.2866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBXyJ/pE2Ox+TONtkEAba2Q2WfBV561EW9IcNs3Yzii1bvorBVlvHvvQ5JW7njGlUGcBzNW4AX60WQpfLJM+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

------=_NextPart_000_055C_01DB6B6A.578D1210
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Monday, January 20, 2025 5:47 PM
To: Pankaj Gupta <pankaj.gupta@nxp.com>; Jonathan Corbet <corbet@lwn.net>; Rob 
Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor 
Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer 
<s.hauer@pengutronix.de>; Pengutronix Kernel Team <kernel@pengutronix.de>; 
Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org; Conor Dooley <conor@kernel.org>
Subject: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw 
binding doc

Caution: This is an external email. Please take care when clicking links or 
opening attachments. When in doubt, report the message using the 'Report this 
email' button


On 20/01/2025 17:52, Pankaj Gupta wrote:
> The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
> creates an embedded secure enclave within the SoC boundary to enable
> features like:
> - HSM
> - SHE
> - V2X
>
> Secure-Enclave(s) communication interface are typically via message
> unit, i.e., based on mailbox linux kernel driver. This driver enables
> communication ensuring well defined message sequence protocol between
> Application Core and enclave's firmware.
>
> Driver configures multiple misc-device on the MU, for multiple
> user-space applications, to be able to communicate over single MU.
>
> It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Conor Dooley <conor@kernel.org>

> Where Conor's review tag was actually given?
On v6.

> I don't see any hints in the changelog.
Accepted. Will update it in the change log, under v6.


> Best regards,
> Krzysztof

------=_NextPart_000_055C_01DB6B6A.578D1210
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
KoZIhvcNAQkFMQ8XDTI1MDEyMDEzMDcyMVowIwYJKoZIhvcNAQkEMRYEFEYerm1ZmbKdZU8SOSOv
tg977xPJMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
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
AQAtC83J20LU8mWAnFVZLTie77DjrwHx6kWmGGFtPweHEbRFP/MjgwwpIVaBMyYl+b9zeon12uoM
qhoJdGel6rkkhZhuFGYSHtUYSvdW38ckDsJw5U/0IPNBAan9oppreVGqiqviDufk3KkFDtV70dl4
y13tFWBwksh2R/umpnc2Et0ZeAqoDAB2AmNtNu4t1uz4mZ4lCR2NZ8UItyKQDwXwOVRM5ZBt2FAx
8uynfdzLNXal8YK0OEwz9SZ5sJTX72OpHIx5ThJ9ZJ0uOD5uZjLRuccwgeFPc3Wyj4yBeh6kGjKt
SMmL7eaMtAz2O4ZUOyuKj4cSzJtuJLbdG5SrI8KIAAAAAAAA

------=_NextPart_000_055C_01DB6B6A.578D1210--

