Return-Path: <linux-doc+bounces-42491-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F4A7F540
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 08:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08301895326
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F20625DB0E;
	Tue,  8 Apr 2025 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="n1GxuTdu"
X-Original-To: linux-doc@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010015.outbound.protection.outlook.com [52.103.68.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281920E031;
	Tue,  8 Apr 2025 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094927; cv=fail; b=c3tN1Po1nO9QQrFaJfJnKqnNNRrAN9/SNwKMD5zgbhy6NdSTtXGLp07YK2ZINSTSHbrIRRNsbBlcolJ/+ZElsf0DAVTr+wEh2/qyiCWfaoW/2fNinZ0S+FMy64YhY64BDRRjhj0usIz7LtxYtKMgJIleFku96KzCSmS2BtKAvJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094927; c=relaxed/simple;
	bh=sDOf9fsQpzENBD1yhA+9248d0PgCMuBCna0vy22pB9g=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uTq43ywb9ChTciAimrA7D+ruezvmiYRQdYWU5TC0x3PJwFQb8hMeMsc6Ms0AhGio9YJtLUWlxBc1UktJcu8/fEyDS2qIJaAnARMfOskifhv3ZWzenAkmP/mt+wnubHqOqB1w9x3cVOsTHMU0XAm2KVmeuN3XLVmJjGGWMC4V6ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=n1GxuTdu; arc=fail smtp.client-ip=52.103.68.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBko4/dYStnxNm+vT8aS7CpoPjHWCWTnz494dCA4e7vN06uGwy5dFHKGTv2DZmU6Z5UJcIQzXnOA2K6hGHaqtkCKr07WAoXMKJoI7+GucoFvnGzX5lNgXxPahRVX8PvsMdd7ZNF5Pk38rAwMUWOBK9/qXitIlOy2z6mYTjPvSjTSjnPaUe/1nLgi7+xoLOWktXVZMskXBVkefUVqv8wZDUoYgfm5pXieptrqlA7a0qT4ifVzOSKcY2NadNdy6MkzDaFBWTXP3CEydyUsLnsYuyHdQeW5dH+tOPMAynpumeitdvi/AGSY1H4b0wfEb7LMpy41LqWkwM/aPswrJS8PGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfKNRZZ4wSX/GVjiAu61b39RPWBTnYTKKt8RDZMGdPQ=;
 b=I+8QFuqDJmFj5P5b/j2oklVeShRfhsvBn4JGP3zYuWw8ehbp8USnYxzEPYiaTmsjkbWtGiIDQhyXxPBVswhHhTr1czfD/C69ipQoJ1MvBp/tOuDJDlsmojsr+dHODYrJz4Jz00eDtP5kDy7CEiQmWbErpkf2D5DFhIF8fGdWBCjdDG/GA9J9WVbQZ+JfSKnkZwiz3GDK5tdGA9Qcu5FEUvP0advwovkPZN/emNMvGQTHLOCtfGbCY0JfFaCcnYdWzp66nVvE7fJo5YxvReT65jDkTSutHrIJlHRZHTJCtfWJWpyWU58auzTMszXH6wApLU7BdTtp49JHuHuwbVYxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfKNRZZ4wSX/GVjiAu61b39RPWBTnYTKKt8RDZMGdPQ=;
 b=n1GxuTduwTdvOj3V8sHpMuCq3cS/+vfKfDctqfttGE4I56phkMvEkyv7OVuAgzLBEiac59WQ1StGPump2mZDw2qZzRH2ExwKklG2i0H8MM5P/iV9vJfsP9dwx0lXrujNCpykXL/x7Vjm9de404chzJ/e1TsvZQF7niHD4WXAMjZ59U8v+L5NJj/OwK22F1wMgY9BT8hQtNwMxDjCSk0fBGDFjiaSPGnyCAGPBL/VxujBaIF3F/CuZYgP7X5f+TGAPZsJGfClBHTVrG/oky3wrjsP33kbqttgHUkB8wPRDuUuhmd43bhHVSW+gQsl4AGJbzYhEuH8f411uqY05xe+ng==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 06:48:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 06:48:36 +0000
Message-ID:
 <PN3PR01MB95973AF4F6262B2D1996FB25B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 12:18:32 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/3] printf: add tests for generic FourCCs
From: Aditya Garg <gargaditya08@live.com>
To: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <170a9e37-5e3d-4628-acb5-04959f8a6224@live.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA0PR01MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e00d81c-22df-4861-7f4e-08dd766962de
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|15080799006|7092599003|8060799006|19110799003|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0Zkdy9idFNaK0FyWjlpd250cjk0RmMrREMvajM5cldtVW95UExZS2NsWW5N?=
 =?utf-8?B?Q2ZxRndOdkhCTTBjSnRFUk5qOGMvNk4yUkh2TGYwS1pGUHdoVDZzenRJK2Nh?=
 =?utf-8?B?SkVyOTk4VG1pWXR2TzdsejRNYmFHSkw0OG15S1ptb3lUS0ltd08zbEVGMVdv?=
 =?utf-8?B?MjNDSnprcUxpY3BKa09rdFdiMzl2bzZzckhvRW80Q3hiNFpNSk5YbWM2NnVW?=
 =?utf-8?B?cVBpaENjR1Y0QTgxaUJJWkQvWVlDOEJDdHd0TFVlMHArSW5ZNmp0NWlsd2pZ?=
 =?utf-8?B?TC9qRkx1U1RWRXVPSGJWQXVZTVQ5RGV5SzRONkxHRWs1NlFuMHM3SU5SdHdE?=
 =?utf-8?B?NmtxWDlJeFdOam1FU0c0aXR2N2FzeTcweUhoZFM5NFRxeldwUW03LzZDNzJY?=
 =?utf-8?B?Z3NGZEd2Rm95c3ZRUXcyQXpYVnhUV3l3aHVpNVRxQm5DQlpycVNzRjNSY2VY?=
 =?utf-8?B?K1dBUjdMaVRvUDIxd2Y1RGowWm0xd2hJUWYrcXRGVml4Y25NbC9aZlg2OTFF?=
 =?utf-8?B?Q0JHdm5wOEtPbWxUNlNMOVVTQ1F1UjBCRXlYNDR5aGlwb0tzZ3ZNejlmQW1C?=
 =?utf-8?B?VFhJdUl3RlI3cFJxTUtGNG42TTdPeDBZeVFQV2pZSXdRdklSbVRhRkM1clNz?=
 =?utf-8?B?QjZXMTVueHN0U1lBTmZJeVZreXlrZ0JhTHFlOHhDMzJhbXhiYXRJNmhPMXVD?=
 =?utf-8?B?UDdLN3ZHbXlnSjh4dDU2a2wwVWl1cXUwcDhJLzNocGxqUHEreEN2YTN2bGdM?=
 =?utf-8?B?Tm9oNnp0SjBHZjhjN2hBcU5FY1Q5VEo3M2tHeGxTWk5IK293enl2NU9NaTBs?=
 =?utf-8?B?eW9pVmZxQjAxN1VZVTlIRks0SU56bTlRTXViZEhrQi9WTmFVNnBMSjVsM2l2?=
 =?utf-8?B?UlcxMVBLVUsxekhubUtXQjhQS2g2VFgyY2VUT091NDBLc0xDRkR5a1dVdytj?=
 =?utf-8?B?OE9pTnVtZGVtWDg4VC9XKytESWlGWlNHdnkzUEF6aThkUzhSaFp6KzNCbDlv?=
 =?utf-8?B?QWUwdW1VOHNpL1UrNWoxbmR0dk8yd1NXSGptMUF0TU0vMjgxVStiblUyMWc0?=
 =?utf-8?B?ZmJ5eTFOc2pjempnQnVHcksrbmFJOWZGejM4aWVobldLZW1jai9WZjFKR1Ar?=
 =?utf-8?B?RjM0dGtnNWVtdjJyMytTVUZCaW1hY2FVMDZvRVN6TDBHeFRRdHBVaW16b2xo?=
 =?utf-8?B?NFdMQTNaLzV1emlsbDdFMXFBSXdrWDMrRHpyaTFvWHVqcTZUOWxFbFAvTkN6?=
 =?utf-8?B?STJ0WjFKaGFxMWZNVzM3R2hrVE9QaXU1VU1XbTJGRlJqdUg5TlA1TTJEWk51?=
 =?utf-8?B?ZUpUSGNLYlNoQXJ5SXBNMG1sb0dyYWZtS3RtMFlOaHVlUS9WejV1eThGc1Fs?=
 =?utf-8?B?VGR2MXFoczBuZVZvME1yUHhDT0FDblBkSkJqb2srTmVzNDlHUkpFVmFMVHQ5?=
 =?utf-8?B?ZUJSSy9hdXZ4NEhJYUhsTmswTGhwNlkyakpqVkZ5S3RPVWJBNGg0TUw1bUhS?=
 =?utf-8?Q?r4P+boOcveOWqvdhjwLM+A9S8k8?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnQ1Ti9VN2dTUEt0SWh6QUN2V1RmZDVpY1FsdkVqVmxVd2FXQmF0UmVvd1p1?=
 =?utf-8?B?Q09ZM0JrQ1FoM3NpeXhNYjJlT2dZbmdJa0pRS3ZCM3JhZjN6Y1VoeDNBVlJu?=
 =?utf-8?B?NEM2eE5XbEZmeDBDMlUxdEo0Z0tpMFBGbVNFanc0Q1VudWIxd0xmTGFSWE9y?=
 =?utf-8?B?MTY2dkhiNG8wbUVmdmJMQ1FqcnduUm5mVkEycG1UY1FBUG92VWw0RXYxVFBw?=
 =?utf-8?B?VHU2TFFxNXFVcWRrMDhxKzBDNHdVcjdJempBOGEvYkpEL1RuYVVqcXJNQnBN?=
 =?utf-8?B?WTY5WjVPUDlaRk8yUDVaYWtUNnE1SUNTazdVTGhRdjdYcjg1ME9XaGtWdWF5?=
 =?utf-8?B?R3NiUGpCZjNpZmQzVkkvTmZjZkRYdktEcDA4d09NckdNQ2FJdytmVDIwSjVa?=
 =?utf-8?B?SVlHUkVqOGlwbWY2WDBDNC9WcTlQb3AzSkE2bEFGZWlSUEh2VHF4WVlSOVBC?=
 =?utf-8?B?dmtqMXIzTUJZYVZiVFdYRlpmTnV0ZkJYY2YvNWx0ZGZiZm9mOWFEbTR3V01R?=
 =?utf-8?B?QkZtY0MyWEV2M25kYnluTE9TRmhpc25xZy9FL1V5ejdPK1FyWVJCdnI5UFl0?=
 =?utf-8?B?dkhCQkVpa0lSVTZvWkk2R3VQMlM4dGlPekVQN3NDdVNoTWtLZG1hR0c2Zy93?=
 =?utf-8?B?ZHJORXdpdHlzVlJjNHh5VmhmdGd4NTliYWRqWUJFNklDZmw5NkFjMno4VHVX?=
 =?utf-8?B?Zzk1Skk5YzhlSEFyUVduNXdXc1dxTENPbzhZS0RJOGM0bWdnRldUL2FMYzNp?=
 =?utf-8?B?eWpqWm1xdGx4QkVSQm4wYXdvSDk0dXh5M2M4YVgrNysvWkh2Um5SRFhYWTB0?=
 =?utf-8?B?a1ZqTGptRnpDdHhrU1E3R3dTem5MMXdhclFnZytzbGU0dVZOMnE3eXhsTVFJ?=
 =?utf-8?B?ZHZoR3NuWE9Qd3hBSjEraUJsV2lSdTVWdHlSYzcyQXM1YzJuUHBaR3FpVlUx?=
 =?utf-8?B?am1idThBcnhER08vQnlKZng4K25zSG5acGljUmlEQVI5aTFjSkZJeHAyZDdz?=
 =?utf-8?B?eWU5NGkyd2pMZUlBQWtsYWFVb3krU0FBYXVJbDUvNDJhdnFGM1U1RTNrRVJ0?=
 =?utf-8?B?RGRHN0VSVDB5T3VsWWlYODgvdytvWllHbTltb1RCdWJDZlN2TUx4RWhLNm83?=
 =?utf-8?B?Z2FOTVBGNmkyMnFmcWF3a1drVlpONkpETC9CTTFOdm94c0RWazBEQTA3UTI1?=
 =?utf-8?B?blRmYkpYQU9XdTg0WXdDN0lsS3BPV2xoakdYZDJ1YnRPeUpsVFpmUGdoR3Fs?=
 =?utf-8?B?YldvYW04REpCTmNYOUkyNEEvMERBTTRNYXB4SkpHZlE3SFowWEYvNG5zaERE?=
 =?utf-8?B?djRrRnB2dzhFM1BGNDhVY2lEeXpwd21oR0V1S1FrbHFjblFucUhlU1ZONDBJ?=
 =?utf-8?B?RFlucjB6dTVJQTVaU2p2S3l1eWpzWXRyck9ZRVBZNUZzekdsNlFyd3RhZUZI?=
 =?utf-8?B?aDhkR0MrRE9hSmFGeUM0dHk4Z0ZSWXNmcm5CMWRDbDVWQzE5ZGV5S0hDZVFh?=
 =?utf-8?B?T2hTUzZFNXFxekpXbDZCQkdROFZPSnpXZS91ZDg4cUVkUWd0WlBTdTdCa0RK?=
 =?utf-8?B?QlJPZ2syeXBuNFFMZmh5Nk5ZZVNXbTQxNEN6RlFlUlVvcnhrdFk2RXkycHM4?=
 =?utf-8?B?ajVxckFOU1hYR21VZWhZYkozaW82VDBxQ2w4WmVoU1MwMjFZSWZsWllRdDRJ?=
 =?utf-8?B?cWsyTTdHMmZ2dXRuSWRQZGs4YlJ3VlBRV3NNbnZPU0ZaQ1l6RTV1OGI1Vjdt?=
 =?utf-8?Q?Yr8rl62PsKJIaHeM8LF+fx562IQlqTUSkS7NBaB?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e00d81c-22df-4861-7f4e-08dd766962de
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:48:36.1130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7052

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for kunit tests of generic 32-bit FourCCs added to
vsprintf.

Acked-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 lib/tests/printf_kunit.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 2c9f6170b..b1fa0dcea 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -701,21 +701,46 @@ static void fwnode_pointer(struct kunit *kunittest)
 	software_node_unregister_node_group(group);
 }
 
+struct fourcc_struct {
+	u32 code;
+	const char *str;
+};
+
+static void fourcc_pointer_test(struct kunit *kunittest, const struct fourcc_struct *fc,
+				size_t n, const char *fmt)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++)
+		test(fc[i].str, fmt, &fc[i].code);
+}
+
 static void fourcc_pointer(struct kunit *kunittest)
 {
-	struct {
-		u32 code;
-		char *str;
-	} const try[] = {
+	static const struct fourcc_struct try_cc[] = {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	static const struct fourcc_struct try_ch[] = {
+		{ 0x41424344, "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cn[] = {
+		{ 0x41424344, "DCBA (0x44434241)", },
+	};
+	static const struct fourcc_struct try_cl[] = {
+		{ (__force u32)cpu_to_le32(0x41424344), "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cb[] = {
+		{ (__force u32)cpu_to_be32(0x41424344), "ABCD (0x41424344)", },
+	};
 
-	for (i = 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(kunittest, try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(kunittest, try_ch, ARRAY_SIZE(try_ch), "%p4ch");
+	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4cn");
+	fourcc_pointer_test(kunittest, try_cl, ARRAY_SIZE(try_cl), "%p4cl");
+	fourcc_pointer_test(kunittest, try_cb, ARRAY_SIZE(try_cb), "%p4cb");
 }
 
 static void
-- 
2.43.0


