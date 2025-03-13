Return-Path: <linux-doc+bounces-40771-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEA3A5FE5C
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 18:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57833188C0BD
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 17:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE60198A2F;
	Thu, 13 Mar 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Bs7/DDDz"
X-Original-To: linux-doc@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095E199934;
	Thu, 13 Mar 2025 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887741; cv=fail; b=GL5otmOcxp/0egtLFFNHAiDrxfvOl97OSyevUjfrJax9qvdVno3g+ifh5JGwswU/aGfyDgNhHg+EumHB97ot1VCcQCFdfaaJq1Q9K2n5aNHDlaNSINHCdfj6f3cGy3NucCh/67rOoai6P9HBEMkcScK4oeDHXoRB1Jp3FUtNLV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887741; c=relaxed/simple;
	bh=HfDEsF1s9QTVIDZGIsfd+BBEBfiPUsXYXc9pKGip340=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HKJSegKUOSQaPpOyANJfqsMPDjE46r8msAPzeD4DGsddNAjbaLf54hpFTrHCwHa+ry3Ybuej4jGnEf9J6gQ34xEEM/izG8qvBzQ/Y55DVMaw8c+JN2oi9+PSA4QQgEIUOrTYe1Oa+4EO4A7x0hWokL3DU8pKFpX1vUwukEkHkhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Bs7/DDDz; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKSWpA6UAFEvG9JwPYX3FTLP2iCvfB17K5n9LIGbIegkmsiFCUgEFMgxHjWHNzPP5+Hilm46dbwrcYWLSTrg7jwtTDGBAhWAjarQ0dAfkAHVboSp9VjgqbUmPZOEAXMavsq4du+ihloKMYXvjFFTQ333seYrfdYlYLuMCPAA2IuCtH347uMHZQifQCu8LKIFlRLvw74QSdgOn1mQKT2rZUklBgB5WKlzbXuqUzJBz994MwHU2xCBYs1ID0EXO1iAVEZrh92/cT6SPzkxqtWUt+iFiE3k0G3IRC9rMi2GjAwwSPSt1vQPs9ZP/anK/MCKn78WkfKkvxclu4Mq/8QGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfDEsF1s9QTVIDZGIsfd+BBEBfiPUsXYXc9pKGip340=;
 b=qbM/8Jfznrj53eWQi3H8FrvJgO9AP0Z2hVH+RDdjdSJKTynxpJQCcYKIUq7Vl7+Iw/JzpfvnjLIOH5zgM8EanWslJk5L0yZiH0q+yvbhsY7ysPTNbUytV2Qg7siAqXyTZsD5q5y/FSsO3Oj8/3mhGhaUIsklSZn6IrCNeQxmStno1UK35pxrvV2uDc3teNgwKtDYgv3GxWMrWrBlRDPvBX6+2GnWUtePZAeR6mP7BHzQE59AVMTsPS0q3I/yArSeYL1lgfgIO9pX6VlPy9TCFNwLoIxx3gKAFu2BgVGUL5IDowx6WnWBB5HSwKGeoZO/2VZZCFbQ2KgGsXXurjeeqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfDEsF1s9QTVIDZGIsfd+BBEBfiPUsXYXc9pKGip340=;
 b=Bs7/DDDzXbOPmCODEKMhh6zb3Zlkozr0rzHgAXembySTVLSWle6k5DYntKii6TyfbY8Kh6FUKRdR7Mm+b5iCHNRMBP9ee8EbYnJtPIGaMVBzKxmr5BhTomfIT3gDY0qqU/bpofaHDK63Zuq8IMleEJntik2t2r78u38cbu6qXOTCuBXRNLg7K4JOUlAf5GXEQ8SJLCxlVJPNpp4p3t3btYleBW9cWMtPvCcknt/LeXKbwOcMOeT45ThbZ0uCebf1NskCJpoMJsqe3E3CR6lWApJS2QyB5iku4BZ8RvZhuzRBzJOauRYfnD++FKgggJc5lvji7owIQQ3cED/A/JQtgw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PPF93CFE8D0C.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 17:42:10 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 17:42:10 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Kees Cook <kees@kernel.org>
CC: Petr Mladek <pmladek@suse.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Sven Peter <sven@svenpeter.dev>, Thomas
 Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, Maxime
 Ripard <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>,
	Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
	<senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
	<apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index:
 AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgADIeYCAABcugIAAAUrBgAAA64CAAASlV4AAGpYAgABy/ACAAACVLw==
Date: Thu, 13 Mar 2025 17:42:10 +0000
Message-ID:
 <PN3PR01MB95972EFA147FB0453D5A7FABB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References:
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9K36SRz7Ja_AyQb@pathway.suse.cz> <202503131035.A5FEBE32@keescook>
In-Reply-To: <202503131035.A5FEBE32@keescook>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PPF93CFE8D0C:EE_
x-ms-office365-filtering-correlation-id: 592b5f17-6819-404b-866a-08dd625661da
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|8060799006|19110799003|15080799006|6072599003|7092599003|10035399004|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0htbGFiKzYzclRDLzhOL05haUc5N2wxR3MyVFAxcEc1WnFPMkZ5S2VtNjJw?=
 =?utf-8?B?WmduWFJNNjBzYVQvNW9ZOEw5VGRDd0Zpa250aDJvdUx4QjBGS3R3YmExdTE3?=
 =?utf-8?B?SVZ4OHdMTDFIWGthWXdrbGxQT1ErT0tLVVdZd1phNWt1VldzSmVnTzdHc0c4?=
 =?utf-8?B?cnJZU09jZEs1aWNxVjR2Q05odHNVRmxZVkRjVnd4M21nb2h2UVhQSkhnODlh?=
 =?utf-8?B?anlqdTA1OEFxVTFKWXZzTmJ3R04wUGY1eEJJUzgrWW8zZlBaWlY4MWhUeUND?=
 =?utf-8?B?dVNBekw2c2JFSEdvenJVZVovdnFCSFdTaVQyeUdlbkpSdVRSb0lMSXFENjhW?=
 =?utf-8?B?cWoxSHN6TnQ3SjBycW1kVkJPcFJMUEhGY01BKzBkTDJLQ1kyeUZlM0RET3dh?=
 =?utf-8?B?NGdmS0hEZUtoTmlJSjdYM3FVb2xKM1R0OXdTUmpKUm8xVXpLSFI2dlJoZXJa?=
 =?utf-8?B?MW5TMENRRHpLUEFpanp3WEFXRGtiZDdOWWJ4MjVYSUhNc0lJT2s2ZEdPMjZs?=
 =?utf-8?B?elg5VlhoWnhJVmlzOS8vUGkrdWdlWTl6KzBxMlBhdnlwZjZHTTdXVjFvZXR1?=
 =?utf-8?B?NXIxUFdQV2I2UmFZU3hwd0I0ODhGbXh6Z1NCdDhFNDI0cnNTbktSaXF6L1g5?=
 =?utf-8?B?dUtKZzc4QlVRMityeXVPb1FpVzZ6SG5JQlllZHFmaW83K2t3SkhkS3lrZGRs?=
 =?utf-8?B?RTZxZnp1VkhhQ2xNS05jMlI3RWpuNXpnZFNKbzd5L0xOMi9TY1dRcWZsUU9I?=
 =?utf-8?B?WkttUUdXcFJSSmMvQ05OdHBvTGx5aEI0bXNnQ2tBTzF0dnZPcTF4TE1xcXFU?=
 =?utf-8?B?ZjZZUFRpanF2NDhzc3VHc1NUUFVCMGl3S0t6ZFVFeXBjNGJwWXExdjAwbmJU?=
 =?utf-8?B?UTdTemdpdThvenpwR3J6TmYzRkxOdy80cGVjckV6TmtoQWFyRityTjNEQUta?=
 =?utf-8?B?dXFjeDhIRlpLMDB2NkVybDRiSlVmRkgrTGZ3ZTRaS2tLczRwaTBUeVRJa2ta?=
 =?utf-8?B?ZHprRGVUaEJkUzV1cE9aTmJQdEo0TGt3aHB1dXZDRTFEWW0zRTBnVjR6Y0ZK?=
 =?utf-8?B?eExrQ0ZzU3puemdiOUdVRDZYRXdkWVFCbExNbE0zRTVGSXJ2a1YwZlNnN1Fx?=
 =?utf-8?B?WHFDTForTlZSK2d1MTlLNkZJUG5uN1NBZ1VrL0J5Unh4dHYrYnZWK0dkS3B4?=
 =?utf-8?B?Y001THlXaXF2VXJ1NktkTVlFci81dzEvSFFsUndaR1pyYVUySHhZRXA1bHJR?=
 =?utf-8?B?YWFjSERwaXEvOU5xLzRuOVNWcUdZcGd3VzRFTlNjd01McVdqV0k5UzFMQ1ps?=
 =?utf-8?B?YmhHZnhXL0JodjRySDZzdHBDSHZTcFFZT3RxbTQzakp2TEdRUXlXNEVpTEVB?=
 =?utf-8?B?b2JRemozci9iVWdHQmZXdVpvUXp0U2JwS1ZjT0xXMGtYWFB5TXlIWlhOekhq?=
 =?utf-8?B?a1BQRm1FZGJDKzlqTzdHaUE0S3I5WlhvRmZEc09sN29uR0RIOVFId2lWUFV5?=
 =?utf-8?B?LzZseWh2MmxQWmF2bGt3SUU4Vi80R2tYK1Rwbm9Ld1h1ZDl1OElHRUJJMGZ2?=
 =?utf-8?B?a1lSa0o2Mlp5ZmZDNmxBdmRkd2dVVU50ZzhVaE16REVUQmx1Qi9qVmc3WjBh?=
 =?utf-8?B?WlZwZEFkNDBGYkZib0xJd0pBMDBJVkE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEhFRG1PS1dsc3lhaTYyWk55cHVLZ0N4ckpwNWtyM1dRQmI2c3RGWEcrVE5r?=
 =?utf-8?B?QzNHbHZLSUl5MlJMcVkvL3oyMWJIeENGM2FkOUF1TmZCVDZyZWFBdmdTQmJj?=
 =?utf-8?B?R3JaRnp2T0hNTUw4VXdxRjBZMUR2NnhpQU9yRENxUzZYWTBIQWdIUXNtRXB6?=
 =?utf-8?B?VHdCOTJ4Um9FNE5hRlZ6L1pzaHNzeG41RDhOU054Z3NDTVlxWlljbXlBZ0RQ?=
 =?utf-8?B?Q1Jad0U2azBIN2MyWmZBbitRMlJhamNaU1hTV1QzZXJHclF2UFA3K1J1Wllu?=
 =?utf-8?B?RWp1VWVueXFWSC9QYTFLMFFIUVRERmhJN1N1bVdkbm5sVFJ1cGRFcEVsS3ha?=
 =?utf-8?B?bVZTOS81bWlRTnB4cW9FV00rSFRhRnM3SjBmU2hYMjQ3OGVzOEU0NEhSOHV3?=
 =?utf-8?B?d2ZzR1YwbEEzWjFDTVBiU0ZCVFo0MTg4Q3BESUI1bm1qdCthZllMYXczV213?=
 =?utf-8?B?RC9tWkNCdFlKUWVuOXhyeGRZcy9HNDhzVEdqcnFraDViYm5FOG1HTzFVck9v?=
 =?utf-8?B?a21iK1VseDNoSVZnQ0ptUDJ5YUFRdFM5SC9zVktRVlhhVDRjK0NDSzlVZjl3?=
 =?utf-8?B?ZUErOXFEV2VLU1ZsTEladVZGeWFWNC8zU2JWWHI2MmJYZ21HNXZkZlh5bjlY?=
 =?utf-8?B?aU1reVh4U1p1T0Ezd1pkRUZ6K1YvcUJ5MGZhNzM0RDVNdWIrRk5DOXc2clRn?=
 =?utf-8?B?QUNKcEx3SGJpYUJLV0pCSVlkUStVMHE5ZHk5S0xhUHpid2FaRHlVV05jbUhv?=
 =?utf-8?B?N2c2SExBUHQ1ZUFsQ1Ezb3I0VU1uVXRMSmE5Sk0wcEptdjMzMVNqY1RSS1Q2?=
 =?utf-8?B?Umh1dWVpaXBUWVJPWEhQOU9VaVJNOFg3Yko4VTBYb2VXTkVjaTh0OE5lYVkw?=
 =?utf-8?B?Q0pDeFFyVEx5T3VhNVF5RS9WY0N1aHgwdnBqbFh6OUQ2NVhIMjNnMk9MS2Y3?=
 =?utf-8?B?Z1lncGZPSFlGbDFrRDhJYmg5UUZrVlQwNUp1Z2pkU3JueklwbWExY0ZrOU9v?=
 =?utf-8?B?c1NkUExBNzhCM3NQc3dKWkk0NmkrTjhLeURiM2IyRzgvdjZaWWVxWmxyZFhG?=
 =?utf-8?B?QTR0QU9IL2dhT2M2Mzh2bk5KaVhaUGlCM0x5d2lmU1ZrVndVZFlZUDZheWhN?=
 =?utf-8?B?NDVRc3BjV1ZXcGhzRGthUi84NW0rRWtCRUdzOEMwdUhiNWk2Tm1ZbzhObnNp?=
 =?utf-8?B?Z2ZLSnJhUTZZV0hsVmhKcUQ4RVowYkE1Ty94Y0tWbGM5VlhiZGx0NFhqbkVG?=
 =?utf-8?B?ODVYMkdFRmUrZzdvVStCVCt4WWN4NTJvKzZPcnhPSHNaS2JQYmhFOHVSdUZF?=
 =?utf-8?B?SW1HUnExL0xtSVllOVVJWDh5TkJMRjE1SVhNcEdxa2NkTHc2YVhQWXlNcTdj?=
 =?utf-8?B?U1ZvSjRZNkQ0Q1pyaGFFQThEMzkrWVUrSEtZandZV2pBQjUwQ0VBTlZOZm1N?=
 =?utf-8?B?NVZpNU1SVnlQS2orQ213d3pQR2x4SWRxT3NLR20xSStxYXNRSE9sdFhpOVBk?=
 =?utf-8?B?LzJ0UVIydC9iNjJZU3BNL1Z0bmg1MmY2S3FTT2JSUVVOV0dzUy9rYStSTXZX?=
 =?utf-8?B?ZkJOWWQrR0VOcWtwSGpYUG05bnR0MkVSRkNZZldsREhnWnlKWkpMQzJySSsz?=
 =?utf-8?B?MmhJdkVaU25CREFvWENSUVpFanc5eWorc0hvUGV6RDVQMnhmeVR2QzF4K0Ji?=
 =?utf-8?B?cE1qOElQZ0FWejcxQ2R1Rm9mSlVuTjlZS3RsV0Q1ZDdIQ0N2WkxLSy94a01V?=
 =?utf-8?Q?8JKTglepMhyP/3q/s8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b5f17-6819-404b-866a-08dd625661da
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 17:42:10.4502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF93CFE8D0C

SGkNCg0KPiBPbiAxMyBNYXIgMjAyNSwgYXQgMTE6MTDigK9QTSwgS2VlcyBDb29rIDxrZWVzQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMTE6NDg6
MzJBTSArMDEwMCwgUGV0ciBNbGFkZWsgd3JvdGU6DQo+PiBTbyBJIGFtIGZpbmUgd2l0aCB0aGlz
IHBhdGNoOg0KPj4gDQo+PiBSZXZpZXdlZC1ieTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5j
b20+DQo+PiBUZXN0ZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPg0KPj4gDQo+
PiANCj4+IE5vdywgdGhlIHF1ZXN0aW9uIGlzIGhvdyB0byBnZXQgdGhpcyBwYXRjaCBpbnRvIHRo
ZSBtYWlubGluZS4NCj4+IA0KPj4gTm9ybWFsbHksIGl0IHdvdWxkIG1ha2UgcGVyZmVjdCBzZW5z
ZSB0byBxdWV1ZSBpdCB2aWEgdGhlIERSTSB0cmVlDQo+PiBiZWNhdXNlIGRyaXZlcnMvZ3B1L2Ry
bS90aW55L2FwcGxldGJkcm0uYyBpcyBhIG5ldyBkcml2ZXIuLi4NCj4+IA0KPj4gQnV0IHRoaXMg
dGltZSB0aGVyZSBpcyBhIGNvbmZsaWN0aW5nIHBhdGNoc2V0IHdoaWNoIGlzIHJld29ya2luZw0K
Pj4gdGhlIGVudGlyZSBsaWIvdGVzdF9wcmludGYuYyBmaWxlLCBzZWUNCj4+IDIwMjUwMzA3LXBy
aW50Zi1rdW5pdC1jb252ZXJ0LXY2LTAtNGQ4NWMzNjFjMjQxQGdtYWlsLmNvbQ0KPj4gQW5kIGl0
IHdpbGwgbGlrZWx5IGJlIHJlYWR5IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3cgYXMgd2VsbC4N
Cj4+IEkgYW0gZ29pbmcgdG8gcmV2aWV3IGl0IHJpZ2h0IGF3YXkuDQo+PiANCj4+IEl0IGlzIGV2
ZW4gbW9yZSBjb21wbGljYXRlZCBiZWNhdXNlIHRoZSBwYXRjaHNldCBjb252ZXJ0aW5nDQo+PiB0
aGUgcHJpbnRmIHRlc3QgbW9kdWxlIHRvIEtVTklUIGRlcGVuZHMgb24gYW5vdGhlciBjaGFuZ2Vz
DQo+PiBpbiBLZWVzJyB0cmVlIChtb3Zpbmcga3VuaXQgdGVzdCBtb2R1bGVzIHRvIGxpYi90ZXN0
cy8pLg0KPj4gU28gaXQgbWlnaHQgYmUgZWFzaWVyIHdoZW4gaXQgZ29lcyB2aWEgS2VlcycgdHJl
ZS4NCj4+IA0KPj4gQW5kIGl0IG1pZ2h0IGJlIGVhc2llciB3aGVuIGV2ZW4gdGhpcyBwYXRjaCBn
b2VzIHZpYSBLZWVzJyB0cmVlLg0KPj4gDQo+PiBNeSBwcm9wb3NhbDoNCj4+IA0KPj4gSSBzdWdn
ZXN0IHRvIHNlcGFyYXRlIHRoZSBmb3VyY2NfcG9pbnRlcigpIHRlc3QgdXBkYXRlDQo+PiB0byBh
IHNlcGFyYXRlIHBhdGNoIGFuZCBhZGQgaXQgbGF0ZXIgYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdw0K
Pj4gd2hlbiB0aGluZ3Mgc2V0dGxlIGRvd24uDQo+PiANCj4+IEkgbWVhbiB0byBzZW5kIHRoZSB2
c3ByaW50Zi5jLCBjaGVja3BhdGNoLnBsLCBhbmQgZG9jIHVwZGF0ZQ0KPj4gdmlhIERSTSB0cmVl
IHRvZ2V0aGVyIHdpdGggdGhlIG5ldyBhcHBsZXRiZHJtLmMgZHJpdmVyLg0KPj4gDQo+PiBBbmQg
dXBkYXRlIHRoZSBzZWxmdGVzdCBsYXRlciB3aGVuIGJvdGggRFJNIHRyZWUgYW5kIEtVTklUDQo+
PiB1cGRhdGUgcmVhY2hlcyBtYWlubGluZS4NCj4+IA0KPj4gSG93IGRvZXMgdGhhdCBzb3VuZCwg
cGxlYXNlPw0KPiANCj4gSSdtIGhhcHB5IHRvIGRvIHdoYXRldmVyIG1ha2VzIHRoaXMgZWFzaWVz
dC4NCj4gDQo+IElmIHBhdGNoICMxIGhlcmUgd2VyZSByZWJhc2VkIG9udG8gdGhlICJrdW5pdCBt
b3ZlIiB0cmVlOg0KPiBodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQva2Vlcy9saW51eC5naXQvbG9nLz9oPWZvci1uZXh0L21vdmUta3VuaXQtdGVzdHMN
Cj4gdGhlbiBJIGNvdWxkIGp1c3QgdGFrZSBpdCB0aGVyZT8NCg0KSSBhbHJlYWR5IHNlbnQgdGhl
IDFzdCBwYXRjaCB0byBEUk0uIEkgY2FuIHJlYmFzZSB0aGUgdGVzdC1wcmludGYgYml0IHRvIHRo
aXMgdHJlZS4gU291bmRzIGdvb2Q/DQo=

