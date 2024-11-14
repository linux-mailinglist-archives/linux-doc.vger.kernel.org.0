Return-Path: <linux-doc+bounces-30830-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A69C938A
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 21:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B179C1F21B60
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 20:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407F61AC8AE;
	Thu, 14 Nov 2024 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f7eUkF6x";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JfRyq595"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60BB1ABED9;
	Thu, 14 Nov 2024 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731617695; cv=fail; b=Bq6sh3TLWrUp7uURb8OMyNx+tr7c46IsceummkahRe7yoIlpkwlzwUuyUQ2bFvmp7wCSebn5J+e3PPNWbGkCyI63eznR+z9duq5o1d1lBWrrIElQ+j8hQsBFiTdiCz3rGyKH2HJRGUIG6gxj3oZfjE42qrCki1RZN+dF/G9ewAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731617695; c=relaxed/simple;
	bh=BZh2yzXzIi+ZN/d/c5u+DFcj99aKhBwG4K0BKi8LYh8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Eyn2VJRBDE4hFjOUxGunX7DsufNmRuRCJ8Mz64KCUb/lYZGombTAejXPrelWJOcJH20KYfwlmV7g5NbjoiysjcFUSU97KKzA/c+817ZeEgnv1LE8EBiePJFu6LkIoqLFpr+WKrCyoVSgsP//lMqcRd5GqqsnXSjkwwL1UiHsdkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f7eUkF6x; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JfRyq595; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEKfZ2A001940;
	Thu, 14 Nov 2024 20:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=WGcuikW5p7aST8hI
	GoIYKMCJKzA8BLf0CRriLR6BBuU=; b=f7eUkF6xSxh3HmysrlCICUCjXcNUZmj/
	1MVVR4zfhBq+tdvd/ulgMMxpupT802BliPour3X3P0tvtConmbxuC4MWKI3dQQCH
	tMxY/X/G1BA+272PLt0yMfJHLGaAiBOHdy/YTKHKdh0vpiS22+08SlzdQOil2pEg
	szvCp4X8Xid0egWnklsDAX+nWmpuBYwPqsBHQH/fBP1TtMr0eyeGCgEgky1pXykt
	mgJ+TzM20QA5GC1c7Wmhx4AkpgvQbRzfhqLfh9N1As/gETUYI6qI5BnY+HvdX38s
	7K5rokLOBvMCG4edoMIQqpWy/WQGq6C/1q+dLYz+gZVbyNwVHi3gUA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwt77y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 20:54:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEKgY6t025867;
	Thu, 14 Nov 2024 20:54:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bcakc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 20:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/7BkhadXeoqXL0u0zoz6MYffdsdpAmjB3pu3LE2W+ZU23wtGyjArIFTXmc0QwHwqnHGO51kGdRn34MaId35zJJg82pizeGrwop4fkXK2vlnn1YEiTusm0qjRcFCfVPy/rfibOe+JQ70SaMJ6yndQ2FUey4wIY0dTfPDoPR84Guuej++1aarryBnW8soh2nQ6j+d4gE7A/XeyPKtWNNIog0UzkfmU3oprD84c2E3afbyU78XQTDey3eARQYaZw+sD5rLfATBpeU1SsBMjtXtGUQUquSX0S3gi/xlE5qyIfS/ha/r91NF31+9Xw8pdb4b6AAoiPUC0X8uJGZqnyHTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGcuikW5p7aST8hIGoIYKMCJKzA8BLf0CRriLR6BBuU=;
 b=gHiHPS+0fbpf1rEGA97IlIypuJVErwrIHZXQA6O8XxLk7H6n6jYwFV9QJkdlZ5p6+LuISeQny6szOqozpvcEbuHBjzXbKFEL3oDrqKZYhoH/818/nAf4XtECXvQva+kRXs/V8oJRWCfS7WbWCR9G/eaMtMswN9Le1uz1lVgdcNlU1oer2qGzhOzoSeHmZtpQn5KTfzTi3ITs/QV8AU/IOCS2mqwsAHvzf4gfwZ36sq1VF3XAODzRDnVJSYRi0ZCJi2ZmHx1HpD8pG/VDxz1ro/zJ08GLUx+UAP5jTNcLQ+R8ZHl1VYJy9wQlOE/KVlT7wKsJEnoAiOQ4gcaK3nw/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGcuikW5p7aST8hIGoIYKMCJKzA8BLf0CRriLR6BBuU=;
 b=JfRyq595nQRl8WSNG6P/63rpMMzZFVaFADycTYnohbYPbKoFmQN0ptC2IJU/UWpbD6TFXKJe8LX21CDsoQaclWqqgyl2jyffkj2BIDFudHoRylkQN77UKRq9F4l50SZeTO18DY0OjGevDtJhAgF7PtI4TD7X2ACyOhcIPwfliGo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Thu, 14 Nov
 2024 20:54:08 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 20:54:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
        Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
        Hillf Danton <hdanton@sina.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
        SeongJae Park <sj@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v3] docs/mm: add VMA locks documentation
Date: Thu, 14 Nov 2024 20:54:01 +0000
Message-ID: <20241114205402.859737-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e357572-95d7-4252-732c-08dd04ee7bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajdDVktyQUQ3cnFjcUFoUFJBbWZkL0tPeUkwdENvVGJ4Rm9xUFNQbkRvQUNl?=
 =?utf-8?B?ODVJOUhlQnNHUks2UXFxai9yM3JKSjBLSVlMN2o5azhqVzBGZWRDUU5JUHVH?=
 =?utf-8?B?Nkptd3FMUTRaaGxabkgwZUhsaFZzNmtHcGs5MklTYVBoYXdnUjFYNXRQNHNN?=
 =?utf-8?B?NEM0WHM3V291bmtVamoyblJxZnFVNDRPek82djJRc1Q3b1lEQkZFdzcyTFFH?=
 =?utf-8?B?Wmo5NW1GSUJ3TGlTVUdCZTU4VWVDcWU2N1NzVlNlM2s4bW9TUjVHSVkvL3R6?=
 =?utf-8?B?aFBSSDNJMnZtMnVqVnJpY3lsS05MaWFzN3JoYWcxOFozYm1IUnFLNEtmaUx3?=
 =?utf-8?B?UFVxdGVMcnZMQnVuM3JpL3dKTk9naEJuR3RRZU1XSW1kSFhUdUZ5Y3lsOUpa?=
 =?utf-8?B?QUVXUFBVSkFjcUt2SWhzVC9oNHh0dGVBT0tsZHRPVFpEYWdLOWVxcGpNNm8x?=
 =?utf-8?B?dkxLendTNGVzNjI4OFhVWVZSaFZlMUVCOG5xcWRWRk9SNkFkYVVkWnY1dGE5?=
 =?utf-8?B?ME1EK1duT2dDTUZWakxKUWFuWXNsWi9NVWhFakJENXY2amRWcWlmYzhaQnJq?=
 =?utf-8?B?N0dYc1g3STFiaklSMjVoLzUyRGlqMDNIcUpLdFJwY084d0lxeVpUZmJsYnFQ?=
 =?utf-8?B?QkVZSDJXcjdhNXpMR0Y4MXd3N0Z4R0VJM1A4dGNjM3kxbVg0MnpWV2pHRi9B?=
 =?utf-8?B?NVpIYmNZVnlPdU43UW52S2o0azdiczJGTTZ0a09hU1MxdEYrVW9XUWhVK21X?=
 =?utf-8?B?aHh0aDJYOWNtQW9Jd1dkTEt3MzFpNDBXamd6clNMMk9SMWpZZ3p2MHRyUjdK?=
 =?utf-8?B?bjFySGo1Qm5XS3hFS09ibmZhcHQ0bnErRElDd1lMQlhTMUN5R25XeVd0VVli?=
 =?utf-8?B?YWNQeGhlRXdpUndOVnhLVnN6SzRNYzZ2NU5MWVpRQnFaYVV5S0pXNHVEOGJq?=
 =?utf-8?B?N1BlbXY1bk90dFd2dTNmMExoemdlR2grMWgyVG52cXdkR0t5a2tBR2hpZXpo?=
 =?utf-8?B?MlUrVHBvd2FaTUtRNk51ekdpRDFuRnl6Y1UyUGxwcEJFbGd1U0M3c3VJd28x?=
 =?utf-8?B?amhQZnFYOGo2ekJrcDFaYTJpSVEzODhyNnpBVTBUWDJSdFNKblhOdXR2QzA1?=
 =?utf-8?B?WDZySDdpVUpBTm5VbVpkV2JORWRWK09STWE4eUhySXJVTUIxekhoWHIybUZR?=
 =?utf-8?B?bEZhRUZQMWNDeURMenJzZU9IZWZ1L2ljMHdlMytKYm9MTGxYVFg3cWJMYUY2?=
 =?utf-8?B?cWxZR0VULzJ0QmRjOStMSlZjQkFmOHZDVFY2V29GVGRuZi9lMmhkQ3lKR0dR?=
 =?utf-8?B?bms3TG9DZzR4QzF4UUxQdFVyNkRHWnkyYm1yMzIvOGpJeXMzY01MVmdZT3da?=
 =?utf-8?B?T3N3T0JoZ1Q5NkJzVWxSSjVYU29pakxkQmxJZE1NMWk4ZDBML0RnRGZ0UUFS?=
 =?utf-8?B?RjlwZVFSa1JvUUNsOUlnQlMwTkxreHREK3Y1UnYxOUhLYzdHZEhQUHFjMXpU?=
 =?utf-8?B?UjBtYlVwWWY3ZjFtVkVRV1hCOTRKa1JNMXhnYzd2T1hPVWlFRHRtbkRlM0NX?=
 =?utf-8?B?enRSQzljL2NyZ0RlYnlzVU4xWHFxcm93YW52MEl2UWpQZ0JhZktPakp3Z01X?=
 =?utf-8?B?ckN4QjIyNG1RUy94bDUyWi8yVnY0MzhEay9HMFkvVVdFeFVjUkZrR1NJU1Jz?=
 =?utf-8?B?MTRqOEtuQjFKMGRGK1BybUpLOEFtSEs3Yk5BNThIS2x3Qm9kZWs1eEtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXQwN3RqLzdZZkZmMTAxT1hDQ0hhakZIN0ZBOHA3cUU3dnl0MVVWV1hYKytJ?=
 =?utf-8?B?MHBkN0EwUTJHZUM3Z210MFVOMlNOdk9SY0xKc0o1c3RORFlOcWdQajFscnhz?=
 =?utf-8?B?Z1dXNnZzM2VyZzQ1NTFpNUNQckVLSFhVRDFaKzk2VFNYVXgzbjRWdXdlUVRq?=
 =?utf-8?B?bXhQblIxclNNMFlEVFpSbVpxLzd6NHB1akEyYTAvQkp1YjVTWTlselZFZElP?=
 =?utf-8?B?ZFpXUVU5WFlvRXR3cm55RVE1dit2UkZ1Vll5TEFUVnVvQWRyK0ZDUmNzUFQ3?=
 =?utf-8?B?VndicmRWS3pITEQ2ZzVXbWt2ZEFURWY3V3RlOTQ1bEtKVytHM2Y1bVo0eGFZ?=
 =?utf-8?B?V284K1cyS0UybW1IcDRla2liTG90RmJVZWFKNEl5VE1XWWRFSUZ5eUcwUnJG?=
 =?utf-8?B?OHZmZWJTMjR5SGtDVG5qZk03NTd3WGRTekpyOUlaME5TWnVXZXdyRUNGVFJ1?=
 =?utf-8?B?U3ZVWDUyUG5URzZwQjdPaVREUnZ0SmI4cGtUV1RDWGpjM3lWQzZjVnRkYyty?=
 =?utf-8?B?MGlvZE5QZmpNNFdLUnBQbzR3eGVWRXdkNzJPeHA5MG9NOXY5dXFXYWwxVzRU?=
 =?utf-8?B?aGVLNWVUWWdnRkRyWjJSQW51RVVNbFJZQ0NnK2V2Qkl5VHQvTzIrQkRyMngv?=
 =?utf-8?B?WktmK1NtMFFSMVF4cG9qR2pUUlljd3pWblo2STlYZVJTaGE4dWFFbWFFT3Ey?=
 =?utf-8?B?aG84eUE5SVVlZkZocEZlUUtpSXZTc0tZUXVPSzVmZUs4Q2pTTUJiaWRWMmJE?=
 =?utf-8?B?bjZRQmkwL1pzeWVnYTdoSm80TTFSTnROTlZSQmVDKzRjLytSTWgzUklGbW9s?=
 =?utf-8?B?eGRHYVR6WW9QT01NeFVSdnlma01pSmhqbXg4VmJQZjhqTXdVVTEvb0h3VDRo?=
 =?utf-8?B?c3JDWHUvZW1OL3E4VTNnV1pmK1U1M2RrbXIyRm1VUjU1MTBycThwOXR3ai92?=
 =?utf-8?B?RTVTbjJTZVA5MHZOS3I1RDVhZTNRY1BacmxBQ3Vpd0U5dWFnWFNjaHRpNzcx?=
 =?utf-8?B?eXFHdkVXN3IySWlYcE1nWUpHK3JKMzQycEhZdExXWlJVQVJVdWF1NXVQNndP?=
 =?utf-8?B?bXMzcHdrR1pMSnJUcGJWOFRHRC93K1BmOUYzTld0QUNWR2RpekM4Mmk1MjN3?=
 =?utf-8?B?YjJkOHFmTzhmaEtmMkJWdlRFYjJZZlhFeS9YT0JFbUUwRkNoeHB0RlVJUUdO?=
 =?utf-8?B?TFc2L05HeWZ6Qm9FY2lPaDQ5RTMzRkxFQjd1dEJZYzBRUEdYZFo0VGd3U3lW?=
 =?utf-8?B?WkxMSGJMeTR4OG9qOWNCV3NRbms5a0NBMUY3cDlRTk1UUVFDbHpITWsxa1Zo?=
 =?utf-8?B?Q3JVVFVobVcrTzhYRURXbG83YWJmM1RFbWpDeUpuNW1rd1p0WjMrUi9JSDlo?=
 =?utf-8?B?aW5YeWlEUmF2WExpczNld3JnRnovYzBqK0FNc2hEVWIzdGNnYUNJaVhBN3pC?=
 =?utf-8?B?T1h5NUpLd25TOFZKNkh1bFNZcm1xQldQQ3BEMEhGZnFMdnJSODhWckdReDRo?=
 =?utf-8?B?Z3VKNFNTRDhIU3FreVdsT3JPWjY4L1BGbnRiSjZ5d09XcnRUbi9Xa1N0bytX?=
 =?utf-8?B?Q3hIVE5VS09EWFVwYmRuUUZqMTRiclhiL0tXNFpoZllsUU4zdVo5YzNOdjBX?=
 =?utf-8?B?MmJlQTBHU1BKVUdNZVlGL1crZkdjeHpCSHo5RURqUzIybG5lT1doSmJ6a0sw?=
 =?utf-8?B?ZG5oSVV5bi9LK0k3elpKeTRNKzQvZWhiUk9WTmFHUEtDdWFPUjdQVTRSWUhz?=
 =?utf-8?B?eUFNZzBudHgwUTJJRVhlbUYxQ0hKZGRXMFlVVzNtZUdtaGJKbmZvODMrdDJS?=
 =?utf-8?B?R29DMnRXbGx0QjB1T093aXZjWkhXTjdpWm0wSlZJR1kzOEJ0Y2lqNllQdGtH?=
 =?utf-8?B?NEFsL3pLcEtadUNrNHZielZtSzhqRE02YndqRElGZTN1djI5bzRJb0FKSy9W?=
 =?utf-8?B?MXlvWkpKeHRHdHJtdUVSQnhCOWhXQmJialc3eWxNeXZSNkZRRzZmR1ZaZEVz?=
 =?utf-8?B?cVRvaDVVZVRpbk5uZkF2UGE0Uk9NMWhmdStDQ2Nkb1ZRUHJkMEgyNXh5cUk0?=
 =?utf-8?B?M0ZYK245M3BFSERTR2R4R29VdjBrL1k2VUNGaUwyUnNCQkwybVZJWHdYKzZF?=
 =?utf-8?B?MXVMRXZOQzdhYTAvaWswMVk5TlcxVU5PMVdvVGVxdDc5UFJLd3MxRVk3U2p6?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jLQhehGfhfhd24uzozF/11xRsvmDuHM3RI2tysK32hdI5vgvCP9+hCFBH2nTesGYlEufs3tOQqqpob9LsehgyShH2dw0QiYOxZk7TgMCfm7MXRXYfRHrFMXefX1GEVmp4biDcejl+ZfC/quyi8mApCAgplzja3SDihynqlxriDZq38GUTH6NzaZ2nMuAhaRZMrZf6ZVskw1ybBDc6r2eQLVAjexz3Hcy3pTLqBEDGH2pIAQRZq782aEXBhjNqrypHtIpg62rJFbNJCpokQ4mj+bV9mcV6GNPj2saVPo55K+psiWUPmFCgiQt3jYrBnDSsS32Jmd+bte9NQs9mQoYXxUjkv10W2Mr0cZ6mhUDi1MIYmpUd+w5Lr1+9x434iu1qchki7kks6km1YPMfPWY4Tr2SRi7xFr/SfzA7Mot/+VicHXcR2F1m0Mugia5sg3LNF73PupiErQHb/I36tERIjyKfjy4v5QfL7+LmelfZ6VkhQ7D+lDC0yTXqa7b/ogngizvyiYchlwDPjy6AiwMiKS+jY2U3/P6olMotNmIyfWgi6xYXwHMqtD3HYIMi11zDHaEPo+DGXvfxHciVWBMfty1ryEyHdSLJAKNwycfeQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e357572-95d7-4252-732c-08dd04ee7bd5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:54:08.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiLdlGdXIp5ZzWanx9RULUAT1aUjpgV8PIIWhsDHPrgKiuVAuOfSXCqxtRJqD2QfBnhXAwxQ5k9mHt83LhABJDahsU7qJ4Nylm3F8KIVNIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411140164
X-Proofpoint-GUID: 4M22PQb3j0v23LOPlb13NTsaFPqoKlZv
X-Proofpoint-ORIG-GUID: 4M22PQb3j0v23LOPlb13NTsaFPqoKlZv

Locking around VMAs is complicated and confusing. While we have a number of
disparate comments scattered around the place, we seem to be reaching a
level of complexity that justifies a serious effort at clearly documenting
how locks are expected to be used when it comes to interacting with
mm_struct and vm_area_struct objects.

This is especially pertinent as regards the efforts to find sensible
abstractions for these fundamental objects in kernel rust code whose
compiler strictly requires some means of expressing these rules (and
through this expression, self-document these requirements as well as
enforce them).

The document limits scope to mmap and VMA locks and those that are
immediately adjacent and relevant to them - so additionally covers page
table locking as this is so very closely tied to VMA operations (and relies
upon us handling these correctly).

The document tries to cover some of the nastier and more confusing edge
cases and concerns especially around lock ordering and page table teardown.

The document is split between generally useful information for users of mm
interfaces, and separately a section intended for mm kernel developers
providing a discussion around internal implementation details.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <zhengqi.arch@bytedance.com> (for page table locks part)
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Jann Horn <jannh@google.com>
---
REVIEWERS NOTES:
* As before, for convenience, I've uploaded a render of this document to my
  website at https://ljs.io/v3/mm/process_addrs
* You can speed up doc builds by running `make SPHINXDIRS=mm htmldocs`.

v3:
* Typo/prose fixups.
* Various typo fixes as per Jann.
* Some clarification on rmap operations like migration re: page tables as
  per Jann.
* Added a comment about how writers don't limit readers as a result of the
  per-VMA lock as per Liam.
* Added a note about ref counting and sharing of anon_name and mempolicy
  objects in VMAs as per Liam.

v2:
* Fixed grammar and silly typos in various places.
* Further sharpening up of prose.
* Updated remark about empty -> populated requiring mmap lock not rmap -
  this goes for populating _anything_, as we don't want to race the gap
  between zap and freeing of page tables which _assumes_ you can't do this.
* Clarified point on installing page table entries with rmap locks only.
* Updated swap_readahead_info and numab state entries to mention other
  locks/atomicity as per Kirill.
* Improved description of vma->anon_vma and vma->anon_vma_chain as per
  Jann.
* Expanded vma->anon-vma to add more details.
* Various typos/small tweaks via Jann.
* Clarified mremap() higher page table lock requirements as per Jann.
* Clarified that lock_vma_under_rcu() _looks up_ the VMA under RCU as per
  Jann.
* Clarified RCU requirement for VMA read lock in VMA lock implementation
  detail section as per Jann.
* Removed reference to seqnumber increment on mmap write lock as out of
  scope at the moment, and incorrect explanation on this (is intended for
  speculation going forward) as per Jann.
* Added filemap.c lock ordering also as per Kirill.
* Made the reference to anon/file-backed interval tree root nodes more
  explicit in implementation detail section.
* Added note about `MAP_PRIVATE` being in both anon_vma and i_mmap trees.
* Expanded description of page table folding as per Bagas.
* Added missing details about _traversing_ page tables.
* Added the caveat that we can just go ahead and read higher page table
  levels if we are simply _traversing_, but if we are to install page table
  locks must be acquired and the read double-checked.
* Corrected the comments about gup-fast - we are simply traversing in
  gup-fast, which like other page table traversal logic does not acquire
  page table locks, but _also_ does not keep the VMA stable.
* Added more details about PMD/PTE lock acquisition in
  __pte__offset_map_lock().
https://lore.kernel.org/all/20241108135708.48567-1-lorenzo.stoakes@oracle.com/

v1:
* Removed RFC tag as I think we are iterating towards something workable
  and there is interest.
* Cleaned up and sharpened the language, structure and layout. Separated
  into top-level details and implementation sections as per Alice.
* Replaced links with rather more readable formatting.
* Improved valid mmap/VMA lock state table.
* Put VMA locks section into the process addresses document as per SJ and
  Mike.
* Made clear as to read/write operations against VMA object rather than
  userland memory, as per Mike's suggestion, also that it does not refer to
  page tables as per Jann.
* Moved note into main section as per Mike's suggestion.
* Fixed grammar mistake as per Mike.
* Converted list-table to table as per Mike.
* Corrected various typos as per Jann, Suren.
* Updated reference to page fault arches as per Jann.
* Corrected mistaken write lock criteria for vm_lock_seq as per Jann.
* Updated vm_pgoff description to reference CONFIG_ARCH_HAS_PTE_SPECIAL as
  per Jann.
* Updated write lock to mmap read for vma->numab_state as per Jann.
* Clarified that the write lock is on the mmap and VMA lock at VMA
  granularity earlier in description as per Suren.
* Added explicit note at top of VMA lock section to explicitly highlight
  VMA lock semantics as per Suren.
* Updated required locking for vma lock fields to N/A to avoid confusion as
  per Suren.
* Corrected description of mmap_downgrade() as per Suren.
* Added a note on gate VMAs as per Jann.
* Explained that taking mmap read lock under VMA lock is a bad idea due to
  deadlock as per Jann.
* Discussed atomicity in page table operations as per Jann.
* Adapted the well thought out page table locking rules as provided by Jann.
* Added a comment about pte mapping maintaining an RCU read lock.
* Added clarification on moving page tables as informed by Jann's comments
  (though it turns out mremap() doesn't necessarily hold all locks if it
  can resolve races other ways :)
* Added Jann's diagram showing lock exclusivity characteristics.
https://lore.kernel.org/all/20241107190137.58000-1-lorenzo.stoakes@oracle.com/

RFC:
https://lore.kernel.org/all/20241101185033.131880-1-lorenzo.stoakes@oracle.com/

 Documentation/mm/process_addrs.rst | 824 +++++++++++++++++++++++++++++
 1 file changed, 824 insertions(+)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index e8618fbc62c9..1bf7ad010fc0 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -3,3 +3,827 @@
 =================
 Process Addresses
 =================
+
+.. toctree::
+   :maxdepth: 3
+
+
+Userland memory ranges are tracked by the kernel via Virtual Memory Areas or
+'VMA's of type :c:struct:`!struct vm_area_struct`.
+
+Each VMA describes a virtually contiguous memory range with identical
+attributes, each described by a :c:struct:`!struct vm_area_struct`
+object. Userland access outside of VMAs is invalid except in the case where an
+adjacent stack VMA could be extended to contain the accessed address.
+
+All VMAs are contained within one and only one virtual address space, described
+by a :c:struct:`!struct mm_struct` object which is referenced by all tasks (that is,
+threads) which share the virtual address space. We refer to this as the
+:c:struct:`!mm`.
+
+Each mm object contains a maple tree data structure which describes all VMAs
+within the virtual address space.
+
+.. note:: An exception to this is the 'gate' VMA which is provided by
+          architectures which use :c:struct:`!vsyscall` and is a global static
+          object which does not belong to any specific mm.
+
+-------
+Locking
+-------
+
+The kernel is designed to be highly scalable against concurrent read operations
+on VMA **metadata** so a complicated set of locks are required to ensure memory
+corruption does not occur.
+
+.. note:: Locking VMAs for their metadata does not have any impact on the memory
+          they describe nor the page tables that map them.
+
+Terminology
+-----------
+
+* **mmap locks** - Each MM has a read/write semaphore :c:member:`!mmap_lock`
+  which locks at a process address space granularity which can be acquired via
+  :c:func:`!mmap_read_lock`, :c:func:`!mmap_write_lock` and variants.
+* **VMA locks** - The VMA lock is at VMA granularity (of course) which behaves
+  as a read/write semaphore in practice. A VMA read lock is obtained via
+  :c:func:`!lock_vma_under_rcu` (and unlocked via :c:func:`!vma_end_read`) and a
+  write lock via :c:func:`!vma_start_write` (all VMA write locks are unlocked
+  automatically when the mmap write lock is released). To take a VMA write lock
+  you **must** have already acquired an :c:func:`!mmap_write_lock`.
+* **rmap locks** - When trying to access VMAs through the reverse mapping via a
+  :c:struct:`!struct address_space` or :c:struct:`!struct anon_vma` object
+  (reachable from a folio via :c:member:`!folio->mapping`). VMAs must be stabilised via
+  :c:func:`!anon_vma_[try]lock_read` or :c:func:`!anon_vma_[try]lock_write` for
+  anonymous memory and :c:func:`!i_mmap_[try]lock_read` or
+  :c:func:`!i_mmap_[try]lock_write` for file-backed memory. We refer to these
+  locks as the reverse mapping locks, or 'rmap locks' for brevity.
+
+We discuss page table locks separately in the dedicated section below.
+
+The first thing **any** of these locks achieve is to **stabilise** the VMA
+within the MM tree. That is, guaranteeing that the VMA object will not be
+deleted from under you nor modified (except for some specific fields
+described below).
+
+Stabilising a VMA also keeps the address space described by it around.
+
+Lock usage
+----------
+
+If you want to **read** VMA metadata fields or just keep the VMA stable, you
+must do one of the following:
+
+* Obtain an mmap read lock at the MM granularity via :c:func:`!mmap_read_lock` (or a
+  suitable variant), unlocking it with a matching :c:func:`!mmap_read_unlock` when
+  you're done with the VMA, *or*
+* Try to obtain a VMA read lock via :c:func:`!lock_vma_under_rcu`. This tries to
+  acquire the lock atomically so might fail, in which case fall-back logic is
+  required to instead obtain an mmap read lock if this returns :c:macro:`!NULL`,
+  *or*
+* Acquire an rmap lock before traversing the locked interval tree (whether
+  anonymous or file-backed) to obtain the required VMA.
+
+If you want to **write** VMA metadata fields, then things vary depending on the
+field (we explore each VMA field in detail below). For the majority you must:
+
+* Obtain an mmap write lock at the MM granularity via :c:func:`!mmap_write_lock` (or a
+  suitable variant), unlocking it with a matching :c:func:`!mmap_write_unlock` when
+  you're done with the VMA, *and*
+* Obtain a VMA write lock via :c:func:`!vma_start_write` for each VMA you wish to
+  modify, which will be released automatically when :c:func:`!mmap_write_unlock` is
+  called.
+* If you want to be able to write to **any** field, you must also hide the VMA
+  from the reverse mapping by obtaining an **rmap write lock**.
+
+VMA locks are special in that you must obtain an mmap **write** lock **first**
+in order to obtain a VMA **write** lock. A VMA **read** lock however can be
+obtained without any other lock (:c:func:`!lock_vma_under_rcu` will acquire then
+release an RCU lock to lookup the VMA for you).
+
+This constrains the impact of writers on readers, as a writer can interact with
+one VMA while a reader interacts with another simultaneously.
+
+.. note:: The primary users of VMA read locks are page fault handlers, which
+          means that without a VMA write lock, page faults will run concurrent with
+          whatever you are doing.
+
+Examining all valid lock states:
+
+.. table::
+
+   ========= ======== ========= ======= ===== =========== ==========
+   mmap lock VMA lock rmap lock Stable? Read? Write most? Write all?
+   ========= ======== ========= ======= ===== =========== ==========
+   \-        \-       \-        N       N     N           N
+   \-        R        \-        Y       Y     N           N
+   \-        \-       R/W       Y       Y     N           N
+   R/W       \-/R     \-/R/W    Y       Y     N           N
+   W         W        \-/R      Y       Y     Y           N
+   W         W        W         Y       Y     Y           Y
+   ========= ======== ========= ======= ===== =========== ==========
+
+.. warning:: While it's possible to obtain a VMA lock while holding an mmap read lock,
+             attempting to do the reverse is invalid as it can result in deadlock - if
+             another task already holds an mmap write lock and attempts to acquire a VMA
+             write lock that will deadlock on the VMA read lock.
+
+All of these locks behave as read/write semaphores in practice, so you can
+obtain either a read or a write lock for each of these.
+
+.. note:: Generally speaking, a read/write semaphore is a class of lock which
+          permits concurrent readers. However a write lock can only be obtained
+          once all readers have left the critical region (and pending readers
+          made to wait).
+
+          This renders read locks on a read/write semaphore concurrent with other
+          readers and write locks exclusive against all others holding the semaphore.
+
+VMA fields
+^^^^^^^^^^
+
+We can subdivide :c:struct:`!struct vm_area_struct` fields by their purpose, which makes it
+easier to explore their locking characteristics:
+
+.. note:: We exclude VMA lock-specific fields here to avoid confusion, as these
+          are in effect an internal implementation detail.
+
+.. table:: Virtual layout fields
+
+   ===================== ======================================== ===========
+   Field                 Description                              Write lock
+   ===================== ======================================== ===========
+   :c:member:`!vm_start` Inclusive start virtual address of range mmap write,
+                         VMA describes.                           VMA write,
+                                                                  rmap write.
+   :c:member:`!vm_end`   Exclusive end virtual address of range   mmap write,
+                         VMA describes.                           VMA write,
+                                                                  rmap write.
+   :c:member:`!vm_pgoff` Describes the page offset into the file, mmap write,
+                         the original page offset within the      VMA write,
+                         virtual address space (prior to any      rmap write.
+                         :c:func:`!mremap`), or PFN if a PFN map
+                         and the architecture does not support
+                         :c:macro:`!CONFIG_ARCH_HAS_PTE_SPECIAL`.
+   ===================== ======================================== ===========
+
+These fields describes the size, start and end of the VMA, and as such cannot be
+modified without first being hidden from the reverse mapping since these fields
+are used to locate VMAs within the reverse mapping interval trees.
+
+.. table:: Core fields
+
+   ============================ ======================================== =========================
+   Field                        Description                              Write lock
+   ============================ ======================================== =========================
+   :c:member:`!vm_mm`           Containing mm_struct.                    None - written once on
+                                                                         initial map.
+   :c:member:`!vm_page_prot`    Architecture-specific page table         mmap write, VMA write.
+                                protection bits determined from VMA
+                                flags.
+   :c:member:`!vm_flags`        Read-only access to VMA flags describing N/A
+                                attributes of the VMA, in union with
+                                private writable
+                                :c:member:`!__vm_flags`.
+   :c:member:`!__vm_flags`      Private, writable access to VMA flags    mmap write, VMA write.
+                                field, updated by
+                                :c:func:`!vm_flags_*` functions.
+   :c:member:`!vm_file`         If the VMA is file-backed, points to a   None - written once on
+                                struct file object describing the        initial map.
+                                underlying file, if anonymous then
+                                :c:macro:`!NULL`.
+   :c:member:`!vm_ops`          If the VMA is file-backed, then either   None - Written once on
+                                the driver or file-system provides a     initial map by
+                                :c:struct:`!struct vm_operations_struct` :c:func:`!f_ops->mmap()`.
+                                object describing callbacks to be
+                                invoked on VMA lifetime events.
+   :c:member:`!vm_private_data` A :c:member:`!void *` field for          Handled by driver.
+                                driver-specific metadata.
+   ============================ ======================================== =========================
+
+These are the core fields which describe the MM the VMA belongs to and its attributes.
+
+.. table:: Config-specific fields
+
+   ================================= ===================== ======================================== ===============
+   Field                             Configuration option  Description                              Write lock
+   ================================= ===================== ======================================== ===============
+   :c:member:`!anon_name`            CONFIG_ANON_VMA_NAME  A field for storing a                    mmap write,
+                                                           :c:struct:`!struct anon_vma_name`        VMA write.
+                                                           object providing a name for anonymous
+                                                           mappings, or :c:macro:`!NULL` if none
+                                                           is set or the VMA is file-backed. The
+							   underlying object is reference counted
+							   and can be shared across multiple VMAs
+							   for scalability.
+   :c:member:`!swap_readahead_info`  CONFIG_SWAP           Metadata used by the swap mechanism      mmap read,
+                                                           to perform readahead. This field is      swap-specific
+                                                           accessed atomically.                     lock.
+   :c:member:`!vm_policy`            CONFIG_NUMA           :c:type:`!mempolicy` object which        mmap write,
+                                                           describes the NUMA behaviour of the      VMA write.
+                                                           VMA. The underlying object is reference
+							   counted.
+   :c:member:`!numab_state`          CONFIG_NUMA_BALANCING :c:type:`!vma_numab_state` object which  mmap read,
+                                                           describes the current state of           numab-specific
+                                                           NUMA balancing in relation to this VMA.  lock.
+                                                           Updated under mmap read lock by
+                                                           :c:func:`!task_numa_work`.
+   :c:member:`!vm_userfaultfd_ctx`   CONFIG_USERFAULTFD    Userfaultfd context wrapper object of    mmap write,
+                                                           type :c:type:`!vm_userfaultfd_ctx`,      VMA write.
+                                                           either of zero size if userfaultfd is
+                                                           disabled, or containing a pointer
+                                                           to an underlying
+                                                           :c:type:`!userfaultfd_ctx` object which
+                                                           describes userfaultfd metadata.
+   ================================= ===================== ======================================== ===============
+
+These fields are present or not depending on whether the relevant kernel
+configuration option is set.
+
+.. table:: Reverse mapping fields
+
+   =================================== ========================================= ============================
+   Field                               Description                               Write lock
+   =================================== ========================================= ============================
+   :c:member:`!shared.rb`              A red/black tree node used, if the        mmap write, VMA write,
+                                       mapping is file-backed, to place the VMA  i_mmap write.
+                                       in the
+                                       :c:member:`!struct address_space->i_mmap`
+                                       red/black interval tree.
+   :c:member:`!shared.rb_subtree_last` Metadata used for management of the       mmap write, VMA write,
+                                       interval tree if the VMA is file-backed.  i_mmap write.
+   :c:member:`!anon_vma_chain`         List of pointers to both forked/CoW’d     mmap read, anon_vma write.
+                                       :c:type:`!anon_vma` objects and
+                                       :c:member:`!vma->anon_vma` if it is
+                                       non-:c:macro:`!NULL`.
+   :c:member:`!anon_vma`               :c:type:`!anon_vma` object used by        When :c:macro:`NULL` and
+                                       anonymous folios mapped exclusively to    setting non-:c:macro:`NULL`:
+                                       this VMA. Initially set by                mmap read, page_table_lock.
+                                       :c:func:`!anon_vma_prepare` serialised
+                                       by the :c:macro:`!page_table_lock`. This  When non-:c:macro:`NULL` and
+                                       is set as soon as any page is faulted in. setting :c:macro:`NULL`:
+                                                                                 mmap write, VMA write,
+                                                                                 anon_vma write.
+   =================================== ========================================= ============================
+
+These fields are used to both place the VMA within the reverse mapping, and for
+anonymous mappings, to be able to access both related :c:struct:`!struct anon_vma` objects
+and the :c:struct:`!struct anon_vma` in which folios mapped exclusively to this VMA should
+reside.
+
+.. note:: If a file-backed mapping is mapped with :c:macro:`!MAP_PRIVATE` set
+          then it can be in both the :c:type:`!anon_vma` and :c:type:`!i_mmap`
+          trees at the same time, so all of these fields might be utilised at
+          once.
+
+Page tables
+-----------
+
+We won't speak exhaustively on the subject but broadly speaking, page tables map
+virtual addresses to physical ones through a series of page tables, each of
+which contain entries with physical addresses for the next page table level
+(along with flags), and at the leaf level the physical addresses of the
+underlying physical data pages or a special entry such as a swap entry,
+migration entry or other special marker. Offsets into these pages are provided
+by the virtual address itself.
+
+In Linux these are divided into five levels - PGD, P4D, PUD, PMD and PTE. Huge
+pages might eliminate one or two of these levels, but when this is the case we
+typically refer to the leaf level as the PTE level regardless.
+
+.. note:: In instances where the architecture supports fewer page tables than
+	  five the kernel cleverly 'folds' page table levels, that is stubbing
+	  out functions related to the skipped levels. This allows us to
+	  conceptually act as if there were always five levels, even if the
+	  compiler might, in practice, eliminate any code relating to missing
+	  ones.
+
+There are four key operations typically performed on page tables:
+
+1. **Traversing** page tables - Simply reading page tables in order to traverse
+   them. This only requires that the VMA is kept stable, so a lock which
+   establishes this suffices for traversal (there are also lockless variants
+   which eliminate even this requirement, such as :c:func:`!gup_fast`).
+2. **Installing** page table mappings - Whether creating a new mapping or
+   modifying an existing one in such a way as to change its identity. This
+   requires that the VMA is kept stable via an mmap or VMA lock (explicitly not
+   rmap locks).
+3. **Zapping/unmapping** page table entries - This is what the kernel calls
+   clearing page table mappings at the leaf level only, whilst leaving all page
+   tables in place. This is a very common operation in the kernel performed on
+   file truncation, the :c:macro:`!MADV_DONTNEED` operation via
+   :c:func:`!madvise`, and others. This is performed by a number of functions
+   including :c:func:`!unmap_mapping_range` and :c:func:`!unmap_mapping_pages`.
+   The VMA need only be kept stable for this operation.
+4. **Freeing** page tables - When finally the kernel removes page tables from a
+   userland process (typically via :c:func:`!free_pgtables`) extreme care must
+   be taken to ensure this is done safely, as this logic finally frees all page
+   tables in the specified range, ignoring existing leaf entries (it assumes the
+   caller has both zapped the range and prevented any further faults or
+   modifications within it).
+
+.. note:: Modifying mappings for reclaim or migration is performed under rmap
+          lock as it, like zapping, does not fundamentally modify the identity
+          of what is being mapped.
+
+**Traversing** and **zapping** ranges can be performed holding any one of the
+locks described in the terminology section above - that is the mmap lock, the
+VMA lock or either of the reverse mapping locks.
+
+That is - as long as you keep the relevant VMA **stable** - you are good to go
+ahead and perform these operations on page tables (though internally, kernel
+operations that perform writes also acquire internal page table locks to
+serialise - see the page table implementation detail section for more details).
+
+When **installing** page table entries, the mmap or VMA lock must be held to
+keep the VMA stable. We explore why this is in the page table locking details
+section below.
+
+**Freeing** page tables is an entirely internal memory management operation and
+has special requirements (see the page freeing section below for more details).
+
+.. warning:: When **freeing** page tables, it must not be possible for VMAs
+             containing the ranges those page tables map to be accessible via
+             the reverse mapping.
+
+             The :c:func:`!free_pgtables` function removes the relevant VMAs
+             from the reverse mappings, but no other VMAs can be permitted to be
+             accessible and span the specified range.
+
+Lock ordering
+-------------
+
+As we have multiple locks across the kernel which may or may not be taken at the
+same time as explicit mm or VMA locks, we have to be wary of lock inversion, and
+the **order** in which locks are acquired and released becomes very important.
+
+.. note:: Lock inversion occurs when two threads need to acquire multiple locks,
+   but in doing so inadvertently cause a mutual deadlock.
+
+   For example, consider thread 1 which holds lock A and tries to acquire lock B,
+   while thread 2 holds lock B and tries to acquire lock A.
+
+   Both threads are now deadlocked on each other. However, had they attempted to
+   acquire locks in the same order, one would have waited for the other to
+   complete its work and no deadlock would have occurred.
+
+The opening comment in :c:macro:`!mm/rmap.c` describes in detail the required
+ordering of locks within memory management code:
+
+.. code-block::
+
+  inode->i_rwsem        (while writing or truncating, not reading or faulting)
+    mm->mmap_lock
+      mapping->invalidate_lock (in filemap_fault)
+        folio_lock
+          hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
+            vma_start_write
+              mapping->i_mmap_rwsem
+                anon_vma->rwsem
+                  mm->page_table_lock or pte_lock
+                    swap_lock (in swap_duplicate, swap_info_get)
+                      mmlist_lock (in mmput, drain_mmlist and others)
+                      mapping->private_lock (in block_dirty_folio)
+                          i_pages lock (widely used)
+                            lruvec->lru_lock (in folio_lruvec_lock_irq)
+                      inode->i_lock (in set_page_dirty's __mark_inode_dirty)
+                      bdi.wb->list_lock (in set_page_dirty's __mark_inode_dirty)
+                        sb_lock (within inode_lock in fs/fs-writeback.c)
+                        i_pages lock (widely used, in set_page_dirty,
+                                  in arch-dependent flush_dcache_mmap_lock,
+                                  within bdi.wb->list_lock in __sync_single_inode)
+
+There is also a file-system specific lock ordering comment located at the top of
+:c:macro:`!mm/filemap.c`:
+
+.. code-block::
+
+  ->i_mmap_rwsem                        (truncate_pagecache)
+    ->private_lock                      (__free_pte->block_dirty_folio)
+      ->swap_lock                       (exclusive_swap_page, others)
+        ->i_pages lock
+
+  ->i_rwsem
+    ->invalidate_lock                   (acquired by fs in truncate path)
+      ->i_mmap_rwsem                    (truncate->unmap_mapping_range)
+
+  ->mmap_lock
+    ->i_mmap_rwsem
+      ->page_table_lock or pte_lock     (various, mainly in memory.c)
+        ->i_pages lock                  (arch-dependent flush_dcache_mmap_lock)
+
+  ->mmap_lock
+    ->invalidate_lock                   (filemap_fault)
+      ->lock_page                       (filemap_fault, access_process_vm)
+
+  ->i_rwsem                             (generic_perform_write)
+    ->mmap_lock                         (fault_in_readable->do_page_fault)
+
+  bdi->wb.list_lock
+    sb_lock                             (fs/fs-writeback.c)
+    ->i_pages lock                      (__sync_single_inode)
+
+  ->i_mmap_rwsem
+    ->anon_vma.lock                     (vma_merge)
+
+  ->anon_vma.lock
+    ->page_table_lock or pte_lock       (anon_vma_prepare and various)
+
+  ->page_table_lock or pte_lock
+    ->swap_lock                         (try_to_unmap_one)
+    ->private_lock                      (try_to_unmap_one)
+    ->i_pages lock                      (try_to_unmap_one)
+    ->lruvec->lru_lock                  (follow_page_mask->mark_page_accessed)
+    ->lruvec->lru_lock                  (check_pte_range->folio_isolate_lru)
+    ->private_lock                      (folio_remove_rmap_pte->set_page_dirty)
+    ->i_pages lock                      (folio_remove_rmap_pte->set_page_dirty)
+    bdi.wb->list_lock                   (folio_remove_rmap_pte->set_page_dirty)
+    ->inode->i_lock                     (folio_remove_rmap_pte->set_page_dirty)
+    bdi.wb->list_lock                   (zap_pte_range->set_page_dirty)
+    ->inode->i_lock                     (zap_pte_range->set_page_dirty)
+    ->private_lock                      (zap_pte_range->block_dirty_folio)
+
+Please check the current state of these comments which may have changed since
+the time of writing of this document.
+
+------------------------------
+Locking Implementation Details
+------------------------------
+
+Page table locking details
+--------------------------
+
+In addition to the locks described in the terminology section above, we have
+additional locks dedicated to page tables:
+
+* **Higher level page table locks** - Higher level page tables, that is PGD, P4D
+  and PUD each make use of the process address space granularity
+  :c:member:`!mm->page_table_lock` lock when modified.
+
+* **Fine-grained page table locks** - PMDs and PTEs each have fine-grained locks
+  either kept within the folios describing the page tables or allocated
+  separated and pointed at by the folios if :c:macro:`!ALLOC_SPLIT_PTLOCKS` is
+  set. The PMD spin lock is obtained via :c:func:`!pmd_lock`, however PTEs are
+  mapped into higher memory (if a 32-bit system) and carefully locked via
+  :c:func:`!pte_offset_map_lock`.
+
+These locks represent the minimum required to interact with each page table
+level, but there are further requirements.
+
+Importantly, note that on a **traversal** of page tables, no such locks are
+taken. Whether care is taken on reading the page table entries depends on the
+architecture, see the section on atomicity below.
+
+Locking rules
+^^^^^^^^^^^^^
+
+We establish basic locking rules when interacting with page tables:
+
+* When changing a page table entry the page table lock for that page table
+  **must** be held, except if you can safely assume nobody can access the page
+  tables concurrently (such as on invocation of :c:func:`!free_pgtables`).
+* Reads from and writes to page table entries must be *appropriately*
+  atomic. See the section on atomicity below for details.
+* Populating previously empty entries requires that the mmap or VMA locks are
+  held (read or write), doing so with only rmap locks would be dangerous (see
+  the warning below).
+* As mentioned previously, zapping can be performed while simply keeping the VMA
+  stable, that is holding any one of the mmap, VMA or rmap locks.
+* Special care is required for PTEs, as on 32-bit architectures these must be
+  mapped into high memory and additionally, careful consideration must be
+  applied to racing with THP, migration or other concurrent kernel operations
+  that might steal the entire PTE table from under us. All this is handled by
+  :c:func:`!pte_offset_map_lock` (see the section on page table installation
+  below for more details).
+
+.. warning:: Populating previously empty entries is dangerous as, when unmapping
+             VMAs, :c:func:`!vms_clear_ptes` has a window of time between
+             zapping (via :c:func:`!unmap_vmas`) and freeing page tables (via
+             :c:func:`!free_pgtables`), where the VMA is still visible in the
+             rmap tree. :c:func:`!free_pgtables` assumes that the zap has
+             already been performed and removes PTEs unconditionally (along with
+             all other page tables in the freed range), so installing new PTE
+             entries could leak memory and also cause other unexpected and
+             dangerous behaviour.
+
+There are additional rules applicable when moving page tables, which we discuss
+in the section on this topic below.
+
+.. note:: Interestingly, :c:func:`!pte_offset_map_lock` holds an RCU read lock
+          while the PTE page table lock is held.
+
+Atomicity
+^^^^^^^^^
+
+Regardless of page table locks, the MMU hardware concurrently updates accessed
+and dirty bits (perhaps more, depending on architecture). Additionally, page
+table traversal operations in parallel (though holding the VMA stable) and
+functionality like GUP-fast locklessly traverses (that is reads) page tables,
+without even keeping the VMA stable at all.
+
+When performing a page table traversal and keeping the VMA stable, whether a
+read must be performed once and only once or not depends on the architecture
+(for instance x86-64 does not require any special precautions).
+
+If a write is being performed, or if a read informs whether a write takes place
+(on an installation of a page table entry say, for instance in
+:c:func:`!__pud_install`), special care must always be taken. In these cases we
+can never assume that page table locks give us entirely exclusive access, and
+must retrieve page table entries once and only once.
+
+If we are reading page table entries, then we need only ensure that the compiler
+does not rearrange our loads. This is achieved via :c:func:`!pXXp_get`
+functions - :c:func:`!pgdp_get`, :c:func:`!p4dp_get`, :c:func:`!pudp_get`,
+:c:func:`!pmdp_get`, and :c:func:`!ptep_get`.
+
+Each of these uses :c:func:`!READ_ONCE` to guarantee that the compiler reads
+the page table entry only once.
+
+However, if we wish to manipulate an existing page table entry and care about
+the previously stored data, we must go further and use an hardware atomic
+operation as, for example, in :c:func:`!ptep_get_and_clear`.
+
+Equally, operations that do not rely on the VMA being held stable, such as
+GUP-fast (see :c:func:`!gup_fast` and its various page table level handlers like
+:c:func:`!gup_fast_pte_range`), must very carefully interact with page table
+entries, using functions such as :c:func:`!ptep_get_lockless` and equivalent for
+higher level page table levels.
+
+Writes to page table entries must also be appropriately atomic, as established
+by :c:func:`!set_pXX` functions - :c:func:`!set_pgd`, :c:func:`!set_p4d`,
+:c:func:`!set_pud`, :c:func:`!set_pmd`, and :c:func:`!set_pte`.
+
+Equally functions which clear page table entries must be appropriately atomic,
+as in :c:func:`!pXX_clear` functions - :c:func:`!pgd_clear`,
+:c:func:`!p4d_clear`, :c:func:`!pud_clear`, :c:func:`!pmd_clear`, and
+:c:func:`!pte_clear`.
+
+Page table installation
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Page table installation is performed with the VMA held stable explicitly by an
+mmap or VMA lock in read or write mode (see the warning in the locking rules
+section for details as to why).
+
+When allocating a P4D, PUD or PMD and setting the relevant entry in the above
+PGD, P4D or PUD, the :c:member:`!mm->page_table_lock` must be held. This is
+acquired in :c:func:`!__p4d_alloc`, :c:func:`!__pud_alloc` and
+:c:func:`!__pmd_alloc` respectively.
+
+.. note:: :c:func:`!__pmd_alloc` actually invokes :c:func:`!pud_lock` and
+   :c:func:`!pud_lockptr` in turn, however at the time of writing it ultimately
+   references the :c:member:`!mm->page_table_lock`.
+
+Allocating a PTE will either use the :c:member:`!mm->page_table_lock` or, if
+:c:macro:`!USE_SPLIT_PMD_PTLOCKS` is defined, a lock embedded in the PMD
+physical page metadata in the form of a :c:struct:`!struct ptdesc`, acquired by
+:c:func:`!pmd_ptdesc` called from :c:func:`!pmd_lock` and ultimately
+:c:func:`!__pte_alloc`.
+
+Finally, modifying the contents of the PTE requires special treatment, as the
+PTE page table lock must be acquired whenever we want stable and exclusive
+access to entries contained within a PTE, especially when we wish to modify
+them.
+
+This is performed via :c:func:`!pte_offset_map_lock` which carefully checks to
+ensure that the PTE hasn't changed from under us, ultimately invoking
+:c:func:`!pte_lockptr` to obtain a spin lock at PTE granularity contained within
+the :c:struct:`!struct ptdesc` associated with the physical PTE page. The lock
+must be released via :c:func:`!pte_unmap_unlock`.
+
+.. note:: There are some variants on this, such as
+   :c:func:`!pte_offset_map_rw_nolock` when we know we hold the PTE stable but
+   for brevity we do not explore this.  See the comment for
+   :c:func:`!__pte_offset_map_lock` for more details.
+
+When modifying data in ranges we typically only wish to allocate higher page
+tables as necessary, using these locks to avoid races or overwriting anything,
+and set/clear data at the PTE level as required (for instance when page faulting
+or zapping).
+
+A typical pattern taken when traversing page table entries to install a new
+mapping is to optimistically determine whether the page table entry in the table
+above is empty, if so, only then acquiring the page table lock and checking
+again to see if it was allocated underneath us.
+
+This allows for a traversal with page table locks only being taken when
+required. An example of this is :c:func:`!__pud_alloc`.
+
+At the leaf page table, that is the PTE, we can't entirely rely on this pattern
+as we have separate PMD and PTE locks and a THP collapse for instance might have
+eliminated the PMD entry as well as the PTE from under us.
+
+This is why :c:func:`!__pte_offset_map_lock` locklessly retrieves the PMD entry
+for the PTE, carefully checking it is as expected, before acquiring the
+PTE-specific lock, and then *again* checking that the PMD entry is as expected.
+
+If a THP collapse (or similar) were to occur then the lock on both pages would
+be acquired, so we can ensure this is prevented while the PTE lock is held.
+
+Installing entries this way ensures mutual exclusion on write.
+
+Page table freeing
+^^^^^^^^^^^^^^^^^^
+
+Tearing down page tables themselves is something that requires significant
+care. There must be no way that page tables designated for removal can be
+traversed or referenced by concurrent tasks.
+
+It is insufficient to simply hold an mmap write lock and VMA lock (which will
+prevent racing faults, and rmap operations), as a file-backed mapping can be
+truncated under the :c:struct:`!struct address_space->i_mmap_rwsem` alone.
+
+As a result, no VMA which can be accessed via the reverse mapping (either
+through the :c:struct:`!struct anon_vma->rb_root` or the :c:member:`!struct
+address_space->i_mmap` interval trees) can have its page tables torn down.
+
+The operation is typically performed via :c:func:`!free_pgtables`, which assumes
+either the mmap write lock has been taken (as specified by its
+:c:member:`!mm_wr_locked` parameter), or that the VMA is already unreachable.
+
+It carefully removes the VMA from all reverse mappings, however it's important
+that no new ones overlap these or any route remain to permit access to addresses
+within the range whose page tables are being torn down.
+
+Additionally, it assumes that a zap has already been performed and steps have
+been taken to ensure that no further page table entries can be installed between
+the zap and the invocation of :c:func:`!free_pgtables`.
+
+Since it is assumed that all such steps have been taken, page table entries are
+cleared without page table locks (in the :c:func:`!pgd_clear`, :c:func:`!p4d_clear`,
+:c:func:`!pud_clear`, and :c:func:`!pmd_clear` functions.
+
+.. note:: It is possible for leaf page tables to be torn down independent of
+          the page tables above it as is done by
+          :c:func:`!retract_page_tables`, which is performed under the i_mmap
+          read lock, PMD, and PTE page table locks, without this level of care.
+
+Page table moving
+^^^^^^^^^^^^^^^^^
+
+Some functions manipulate page table levels above PMD (that is PUD, P4D and PGD
+page tables). Most notable of these is :c:func:`!mremap`, which is capable of
+moving higher level page tables.
+
+In these instances, it is required that **all** locks are taken, that is
+the mmap lock, the VMA lock and the relevant rmap locks.
+
+You can observe this in the :c:func:`!mremap` implementation in the functions
+:c:func:`!take_rmap_locks` and :c:func:`!drop_rmap_locks` which perform the rmap
+side of lock acquisition, invoked ultimately by :c:func:`!move_page_tables`.
+
+VMA lock internals
+------------------
+
+Overview
+^^^^^^^^
+
+VMA read locking is entirely optimistic - if the lock is contended or a competing
+write has started, then we do not obtain a read lock.
+
+A VMA **read** lock is obtained by :c:func:`!lock_vma_under_rcu`, which first
+calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
+critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
+before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
+
+VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
+their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
+via :c:func:`!vma_end_read`.
+
+VMA **write** locks are acquired via :c:func:`!vma_start_write` in instances where a
+VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock is always
+acquired. An mmap write lock **must** be held for the duration of the VMA write
+lock, releasing or downgrading the mmap write lock also releases the VMA write
+lock so there is no :c:func:`!vma_end_write` function.
+
+Note that a semaphore write lock is not held across a VMA lock. Rather, a
+sequence number is used for serialisation, and the write semaphore is only
+acquired at the point of write lock to update this.
+
+This ensures the semantics we require - VMA write locks provide exclusive write
+access to the VMA.
+
+Implementation details
+^^^^^^^^^^^^^^^^^^^^^^
+
+The VMA lock mechanism is designed to be a lightweight means of avoiding the use
+of the heavily contended mmap lock. It is implemented using a combination of a
+read/write semaphore and sequence numbers belonging to the containing
+:c:struct:`!struct mm_struct` and the VMA.
+
+Read locks are acquired via :c:func:`!vma_start_read`, which is an optimistic
+operation, i.e. it tries to acquire a read lock but returns false if it is
+unable to do so. At the end of the read operation, :c:func:`!vma_end_read` is
+called to release the VMA read lock.
+
+Invoking :c:func:`!vma_start_read` requires that :c:func:`!rcu_read_lock` has
+been called first, establishing that we are in an RCU critical section upon VMA
+read lock acquisition. Once acquired, the RCU lock can be released as it is only
+required for lookup. This is abstracted by :c:func:`!lock_vma_under_rcu` which
+is the interface a user should use.
+
+Writing requires the mmap to be write-locked and the VMA lock to be acquired via
+:c:func:`!vma_start_write`, however the write lock is released by the termination or
+downgrade of the mmap write lock so no :c:func:`!vma_end_write` is required.
+
+All this is achieved by the use of per-mm and per-VMA sequence counts, which are
+used in order to reduce complexity, especially for operations which write-lock
+multiple VMAs at once.
+
+If the mm sequence count, :c:member:`!mm->mm_lock_seq` is equal to the VMA
+sequence count :c:member:`!vma->vm_lock_seq` then the VMA is write-locked. If
+they differ, then it is not.
+
+Each time the mmap write lock is released in :c:func:`!mmap_write_unlock` or
+:c:func:`!mmap_write_downgrade`, :c:func:`!vma_end_write_all` is invoked which
+also increments :c:member:`!mm->mm_lock_seq` via
+:c:func:`!mm_lock_seqcount_end`.
+
+This way, we ensure that, regardless of the VMA's sequence number, a write lock
+is never incorrectly indicated and that when we release an mmap write lock we
+efficiently release **all** VMA write locks contained within the mmap at the
+same time.
+
+Since the mmap write lock is exclusive against others who hold it, the automatic
+release of any VMA locks on its release makes sense, as you would never want to
+keep VMAs locked across entirely separate write operations. It also maintains
+correct lock ordering.
+
+Each time a VMA read lock is acquired, we acquire a read lock on the
+:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
+the sequence count of the VMA does not match that of the mm.
+
+If it does, the read lock fails. If it does not, we hold the lock, excluding
+writers, but permitting other readers, who will also obtain this lock under RCU.
+
+Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
+are also RCU safe, so the whole read lock operation is guaranteed to function
+correctly.
+
+On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
+read/write semaphore, before setting the VMA's sequence number under this lock,
+also simultaneously holding the mmap write lock.
+
+This way, if any read locks are in effect, :c:func:`!vma_start_write` will sleep
+until these are finished and mutual exclusion is achieved.
+
+After setting the VMA's sequence number, the lock is released, avoiding
+complexity with a long-term held write lock.
+
+This clever combination of a read/write semaphore and sequence count allows for
+fast RCU-based per-VMA lock acquisition (especially on page fault, though
+utilised elsewhere) with minimal complexity around lock ordering.
+
+mmap write lock downgrading
+---------------------------
+
+When an mmap write lock is held one has exclusive access to resources within the
+mmap (with the usual caveats about requiring VMA write locks to avoid races with
+tasks holding VMA read locks).
+
+It is then possible to **downgrade** from a write lock to a read lock via
+:c:func:`!mmap_write_downgrade` which, similar to :c:func:`!mmap_write_unlock`,
+implicitly terminates all VMA write locks via :c:func:`!vma_end_write_all`, but
+importantly does not relinquish the mmap lock while downgrading, therefore
+keeping the locked virtual address space stable.
+
+An interesting consequence of this is that downgraded locks are exclusive
+against any other task possessing a downgraded lock (since a racing task would
+have to acquire a write lock first to downgrade it, and the downgraded lock
+prevents a new write lock from being obtained until the original lock is
+released).
+
+For clarity, we map read (R)/downgraded write (D)/write (W) locks against one
+another showing which locks exclude the others:
+
+.. list-table:: Lock exclusivity
+   :widths: 5 5 5 5
+   :header-rows: 1
+   :stub-columns: 1
+
+   * -
+     - R
+     - D
+     - W
+   * - R
+     - N
+     - N
+     - Y
+   * - D
+     - N
+     - Y
+     - Y
+   * - W
+     - Y
+     - Y
+     - Y
+
+Here a Y indicates the locks in the matching row/column are mutually exclusive,
+and N indicates that they are not.
+
+Stack expansion
+---------------
+
+Stack expansion throws up additional complexities in that we cannot permit there
+to be racing page faults, as a result we invoke :c:func:`!vma_start_write` to
+prevent this in :c:func:`!expand_downwards` or :c:func:`!expand_upwards`.
--
2.47.0

