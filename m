Return-Path: <linux-doc+bounces-20206-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBFA92A4C4
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 16:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772DD28193F
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 14:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ACF1E49D;
	Mon,  8 Jul 2024 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bdJu9Krw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Oq5TyecJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4162744C;
	Mon,  8 Jul 2024 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720449209; cv=fail; b=H0utH3lWspFuhkW33r7t7zR6vB9ZwQAZ9wAcwmyyQbdgpsu8i5Pgc/nPI7s4hpUfJSwBZ839Bjv1S/RS6diaNbBKCN2WymSbnWV1HLuxeC64Mi3a8PpJ3GUkTA5fNImQ4agLBO6LxeNEyaPE61camr2yY7mRFreNQ5AtAaAG6aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720449209; c=relaxed/simple;
	bh=z6ISXNRUG8orGUiT20tie9Plhoze9IfcFtvsGXIWLgA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b25SZLgcfPKgSghU1UdSq4UZq3fQ6nm+3fbyWi6aiyKLmwGON5T268VS+AuTjQhET4owrRREbmqWi/ZzHJ/S4qhhvtqSHNEbZCCmwDFKzN2upadH2MAal1rwm1fYydVulGSBTJw2q3QjTsLgAdTeR6I76j+9tMpN2ypTTPYfxhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bdJu9Krw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Oq5TyecJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4687gANW018533;
	Mon, 8 Jul 2024 14:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=ZnwlyQvoE3Rv2/At91FpookQgeRnODnb3bxS9ygpmgg=; b=
	bdJu9KrwwT1dtgSZIP6XxuqtYu3LQE/aIrFjift2j2RR8fLk9f4DTVcDuSAa/Ppy
	ZXWcN9r+R+75VkoAC2LFPuh4axlrVcb1HRBYuiPNZvqhNPx0NwkraeHROGd+wIM2
	WPx0kUzkdYFDeH4TlS6HCcicHE7L1jv53vfBIt0YwqEkXBkARh1LU6DUKofL1szz
	v4O60ZCvgd9W62/4sBYHwidiRYIrdIPc0i0AIWHU1kmgM3xAtx26pqbH3vptpY1X
	1BaantUbzMX8KgaCEYKhjkZxQQWHAnVMNEeGePsrC8ZfZqZMF+/cH6x6vnZXsJM1
	2hlP4b2C8xidoj4lta7aVA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wknjskc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2024 14:32:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 468DOfTo029834;
	Mon, 8 Jul 2024 14:32:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 407tts7pwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2024 14:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSwVlLpV/Fb5rygUPc4N/zrZCVh76tklHR9T2ZR0UWsCJ6n5m/NMcVwTICJFU48jJjyDzv7Btifm13Bmk9aChqvuG12YQVLW2eymvkEsmTRO5FmcAdXMDRc8rcNcDPIGuDUWSNECJikOpjvLVUXffgvRTdAcBgsNoVGGszltBf05HRxq8eaJ7c4BpvUHqFeaPyji3NpnDILEfaTaEVYQCNcPCj71ucsZi3i3LuO4S6RkRgUVm7KrDPiCtT0V/aPh7o9KO2tZk0G+lWbgOwIllmk0GPjrKQaEplwOBkseYs4CA7sOMW0U+n8ZIQut735lvErkxz18gy5Ut7WxzSVEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnwlyQvoE3Rv2/At91FpookQgeRnODnb3bxS9ygpmgg=;
 b=RZkMaT8WbaERjmtWWSnLyTxKZ2FKDLbHeZeEtAD8nlVCg7P0Jnb0atRdsSCBqe/eShWZbN9tMjJtLymKrTiVdxYeUgLA5qcIlRdd6kLaFt7AQSYM9aYi7ptzO/cVM406HgjWUqQFgEybT4RTeFBSFEwj56w9wQGhWgDXN93WLegnS26hftor1rj0AMthZnvXUVSSA73R6nSV86jbCQZ2mw0+F+F+cLH4BXLbItofwgMVUNkofZ8eaTL2g79iDfqed0iBcy2+R+/9SS1f4cazITfdeu2S9dhsX9bP7yWpCYEpNnZkqUjcXsWoJL1z/lVI4ocKiUSxUlGVVJNC0jn0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnwlyQvoE3Rv2/At91FpookQgeRnODnb3bxS9ygpmgg=;
 b=Oq5TyecJhBnFz4yTTZ4OduvpleW38mUA1EXGGYCd7wTsvN3cETb8Wtr6n6Fegy7BrAXqzb5QBsCw1iKs6xoIF61UBInKIpRYPtc3p7QKMYEBTJtg2MxIfc60uOzbX1c7otkE/S+YjPFWZhXateiN1N9zzeoEAYnes49N2iNtNe8=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS7PR10MB4895.namprd10.prod.outlook.com (2603:10b6:5:3a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 14:32:49 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 14:32:49 +0000
Message-ID: <9495c804-6d23-43c5-a3c9-b91b9c27cef5@oracle.com>
Date: Mon, 8 Jul 2024 10:32:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make multicall debug boot time selectable
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20240703115620.25772-1-jgross@suse.com>
 <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
 <2d9ffe19-1663-499c-9699-c13ab7a341ee@suse.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <2d9ffe19-1663-499c-9699-c13ab7a341ee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR12CA0007.namprd12.prod.outlook.com
 (2603:10b6:208:a8::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS7PR10MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 13536dca-f0b9-4816-5468-08dc9f5ad757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SERWNlQ1VExpd2N4Z2FBbDJhK0diUWtTalJXdHhRaHRPS2JkNmpnVk1Xdzhh?=
 =?utf-8?B?RmY1dmhNYStYZ2w0U1VEaUZ4QzhqSnMzblREaXNDWFM5TGUwMzdaY2hId1d2?=
 =?utf-8?B?elNhbmUrZFR2cjhvWGVXUjRPaUM5QXk0Qm1QalJOVThXVU55VVhuVkZpRGhW?=
 =?utf-8?B?Y29CLzh6SmpuZzZhOVZEaEJYMjE1SDRjL3hmUWNEdGpvSi8rMGpjL09zV2J3?=
 =?utf-8?B?eWVrRURiQWttMTMyd016YkRqYTY1VVljQVpFcm1ZZUhNRjBMZTNrWUorYmZk?=
 =?utf-8?B?R09qaEkzNTBzKzhRS3ZXckc5Rmsyb2xSVm01YmlFYmJTYkFTcGp1VzFLOXJ5?=
 =?utf-8?B?QnY0YXVpaXlkRnJxQXhSbmw3Z2JqWDVDbUd5WHFPSU16TThqR2NWUHN6WThp?=
 =?utf-8?B?WWRtblp2WlRRaHNBVy9nMWtsaHpOazFQZEtiRlcxVkpUMlVkNXhtdzRJUlNr?=
 =?utf-8?B?SkJzYisxREREd0ZVQnByUm9UWE0xMzBPcXprbDZ5QTc5Ykt4MVo0cGZhd0ZP?=
 =?utf-8?B?UXZHRnFqZmlOZkc4UWZJemxscUU3NXJJalExRVE3bkR1U0JpVHorY0hDNVc0?=
 =?utf-8?B?aVAyZXhLOU11ZndoaDdSSEpjSVl1WmxXV09hQ3hGSXY4emlGT1JMRTUzVEJQ?=
 =?utf-8?B?VWVrVlFFbzFPTXFPaWFlMjhKell5QUpQUGo0bzdPT3B2dXk4L204T2VEWVg1?=
 =?utf-8?B?M0RyaGxjUWwybDRUVXV5Q0tWaEs3OUFoMXhwMnViZkZvM0FWbGQ3V0hkTDBS?=
 =?utf-8?B?ekFlK2laR2ZSclFKSGN5cEJEQjlDdW5MMFl1TmdndWxTcjQwYldUOGNzSTNT?=
 =?utf-8?B?Z0cvR2tCeVZRQy9WNjRacFNIZXZhZTV3SDg0ay9wNkRFRWh0cm56a2J4OGdI?=
 =?utf-8?B?M0p1a0V1Rkl3Tk5tL05XRGx6OTNLNkNiNDlBSTFtSmFHNkZDRWVra0tLVnZt?=
 =?utf-8?B?M1ZLOTJZRVFiWGljOGRJalFiWDl3SVlKb0xvVXZ3NzM3S1RQRTdEUzl6V1NG?=
 =?utf-8?B?SlFzbTdibnFBSE44aXpIZEJjK0hZdFVjRjZLaDJteXhvWEdKci9WRllNQVRK?=
 =?utf-8?B?NVJ2OStqa0hFdlF0d3FQTlY3UjBRWGZzS05CLyt6TTZNWmQ2UzN0bW1xTWVK?=
 =?utf-8?B?N0hjOU1UeDVlRjVqMHhxL3lwV2tpaGx3dktkMXNyQTJkR21EeHc3RCtwdkZ2?=
 =?utf-8?B?bW1XWXhtSzFETUtyemNlMnArUmRNQ3lLMjRkQ0xtbmNYbXJPejlYMk5IYVA0?=
 =?utf-8?B?UjdKRjJlY3hUMG5LVDdML0dqMHB3M2x5WDdsTGpQWE41RGpnQ3FmdEd5Y0xx?=
 =?utf-8?B?aVR2eFkzNndPZHpLRnloQlBsQ0JsM1RRbXFaWjR2Q0IzWElNN0Q2SC9RYWVx?=
 =?utf-8?B?bzFFVFRFc1JzZjE2bmdWdzJZckRCcG1HNkZWZ01GQkF1RlJvSndYa1NaQlFt?=
 =?utf-8?B?S2hPZTM2RzdGZU1qYS9oY2hFMkVjekpDQTZZSnBBYUlEMDhzQmtETXJhL2Ix?=
 =?utf-8?B?emppVGZBVFo0VE9odnFwR0U4ajFVV1UrZW5mSjUwaGVlRTB0a0wxRWhpZE82?=
 =?utf-8?B?UktvUHNWRUhUdldFWk93eGwvcVNDY3d2Qzc0VVV5Ny9VeEhZWnRJN0hiZjhy?=
 =?utf-8?B?MGM3dUN2TTdaaXg5aDd2K2tzWWpOcytGckViUUJ5WDh3bG1Da1FzNm5WQVV6?=
 =?utf-8?B?akxUSkgrN2p4bjhBR0hnRzRqOW93ajA5REJTQkVUdmNGNml5Zmo5T0Ewb09E?=
 =?utf-8?B?WmJuUUhrUTlRMFIyM3dTRSt2MHhZSnMraTVEc0tLTHFZbWpvTDFxdzZtR0lN?=
 =?utf-8?B?LzhEWDZ1M2IxMlhWM011dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OW5WaFhENm1WL0RjZTUvSkZBZjBOK0ZmNzViUE84cjQ5RHk5bWxSd1JmSXl3?=
 =?utf-8?B?RmhYeWxvVEZKcEtMdWhiTGFMTWdKWk9ZOElqd0IxYVMvUXlWcmxBODdEbjVi?=
 =?utf-8?B?RUMwSE1sVFZTbHB1eGlXNTFRN05YUkpWZzBjZ1JkYWQwdFpYMnpaZnpmT0tl?=
 =?utf-8?B?MTNFbEZkcXJhVTVybVBtbWRRTzhvSk5BUFUwUEJMZWNKdDVhdGQwQXl2aU9V?=
 =?utf-8?B?TFBHZm9KK2xNbWV5RG5JTTJPZjQ0czRQT1g4R2xtUVpHN0R5b1RSSzU4dWJO?=
 =?utf-8?B?TUxBRmZtejFrSFhmeVZYZ0tnMGMxbmJidXh0VGF5V2xsMVNzYlYxRHA3NVZL?=
 =?utf-8?B?MnhsdjEzYUZxQk8vN1hoNDIwRHBuUTRRRzBkNTNuNVRNYWwxNW5lZHpmM0cy?=
 =?utf-8?B?NjNNSGJTcW5mWHBqOWUvbHlDeVhrenR2UGZSbEVmb1lWREVINFcwS1phSmlX?=
 =?utf-8?B?M1dhL3lOcFJnRHJQbEFid3pzZnVCU2x4Z1BiTE5xeWs2U1JQWHJWREg4Z0pK?=
 =?utf-8?B?RmpjaDVOdlg1ZW9oOXFhNXI3OWNvWEdrVHZBbng0Rys4U1V0VHllVnVlSWNk?=
 =?utf-8?B?UlI1bWM5N0pDT1hGZDdld2xxVXRyYUEraWFjVE5PdXVmSCs0U3ptZ0RZUmJO?=
 =?utf-8?B?cFUxVGhINTI1dC9NQ3NmMU1tWGdIb0JpRGFRVzlON3ZQUXkrellLVk1CN3Zv?=
 =?utf-8?B?WlQ2cjBoOXB3OUxvQWRUZmZMMXRPV0NrTmkydGlZK0pXbzgzeVZUcU9qN0Z1?=
 =?utf-8?B?eTd4NjJWbnZUa2U3UUZxRHN3RXlEVVh0VnNSbzdDVzhDcVlmNHpYUUpJMHVo?=
 =?utf-8?B?a2UwYmxKRDFPbDVPSjlDR2psK3FnamdBMFNEeU9oL1VkdVRITFJYS2szZlJW?=
 =?utf-8?B?OVEySlltZ1B0cEpyeEhyc1FjTGIyKzlTeHZkK3lQbjJTQjBQRExQSUtMMWU5?=
 =?utf-8?B?Z2xqWGNuZXEzbC8vZnlHdWxLczZ5cFhpUm1ocHRKU1ZocE90VEY4aHQzL0JF?=
 =?utf-8?B?T0JJblg2a0ptU0dRQ0tCdXMxZVA3Zlc1dTVDR3k3TEQxTzAzVUtvbTlXUERv?=
 =?utf-8?B?NDJVZ2Fod3ZraVVRc0ZmMWg4ckppR3Rtbll0eGdYS3IwRTF3dGZ4RDkvN2FV?=
 =?utf-8?B?M2FFbEs5dW82eUIvMXN3OHZsZ292bFA4LzVPNlhpQmwxN1Fhd01kRG40SFM0?=
 =?utf-8?B?L1FuV25EVGJNMGptWldvOWhtWUdmSkovSFlTZUNMNW9UQ1VvRjd1eDVocjlS?=
 =?utf-8?B?ZmNlbDdYWC81T0REbkFja2toNWVKVTZIUzA1bEhyTmg5aEJmZFJvZFdlM1hW?=
 =?utf-8?B?eXV5bTlHWWlJaGhJY1ZBK3JtcU1jQld2UThLYTdqUUNwdVhLTG1JVmZYcWFW?=
 =?utf-8?B?YWg0aXZaYkhCSG9oMURVejRDd3VYa1A4cUVQWXZGdEZ2dHl0NXY2cGNjYWRT?=
 =?utf-8?B?SGxKd2wwVzdESHgzTnZ0c0pOdmEwb1FvelJDVW9neGo0enZmVHQ0eWJ5U0wr?=
 =?utf-8?B?Sy9iUTVYOTZQWjBPNmRCZnpvUzlBVFhoSDVrSEF1bWVwQXNJSEsvOUpHanc4?=
 =?utf-8?B?cFl5MzdSN3p6UUt1dFdsRzhwV2JmREkrcElpMVJNQllpRFd5QTNiTllldlYx?=
 =?utf-8?B?cTRrRmcvcmFCbXFWV0lMQzNjZ0ZYWksvN2xubi8yLzVkRU5QZlFOeXVrQkRj?=
 =?utf-8?B?UWZoMi9TZFk1aTJQemUxK1pYdWg5b0NWL1JGZWlCZzhWV3FwM0QrZHhFemQy?=
 =?utf-8?B?V2Rub1hOeWVDc1loY291QUlnaUhqUzRKR0VzQzB2ZnFHRXlZMEN1aW16Skty?=
 =?utf-8?B?OTF2NmFQZGZTM3l6dm1KQ01kUlcxT0p4UVV2T1FTR1JVbzZvWTB4NHI1bGZ1?=
 =?utf-8?B?Z1FKYUFnanVMSE8zODR3dTF1MUxCRWo4clpZMnRQaVZNOXRTcUk5RkM0TTdI?=
 =?utf-8?B?MWJyU0ZnTEs2YnNLdVJ4ZkoyU1BkME44YW1kNk00MHNxR1krTTZLS0xka2Jp?=
 =?utf-8?B?T0hzY05mc1NxRWh2aTl3bExJYTRyeTRSWk1lbmplZW5TelJVNWg0MERGK2or?=
 =?utf-8?B?OE5DUkdLZWZHTXlJd2xPUWpWTmZoR1p4ZUdzWEhuV0R0YS9tUW55cU5wVGZB?=
 =?utf-8?B?ZEFwS0oweUpqd3ZZakpnSHJuWFdWRzE5eDRKTDgwZlhNS01nRWE1ZkRKd1BW?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yIXFP3aiai+S0/6+IipzCc8LKVX+MnSrrTjWx2Y6ErewuhG2Tvw+5vBbdHNstrtp35xNW6h74NHk7IMwboh1V/z+pg6lUttuhyPaRHqf/x6FANkBFsDSog1sPJcuSmay0VgOL4n75SnkSxfutew/caIrvHStXacbUhaJ8Qcrr5XoBRcsPrmtLOcSDFCwKwO31Hi9Bvt8Lh980qvKrciI+n6FjT9jpqSIpnSpy9ZD9qz8DwHLKCWSbQqIT5JkZpsiMP2/p3hHvYZGrmosliX8auWVyY7q94RWHJ78joD6WjHPQFEvIpcrrSLKhB2buOl6/V0qW+RrgdgCLfZuWqJXgtsW2emizSlE4R3diKYKVNeHtW1E2sWu0EUC4+F8gQ5UoD6qq3+lYNbEJ+f7Yd/Gc05x8oGp3UJChkMIPnS0KNejzNIqHIY/TtnLoiBP3sNuvxbfVFXQlsrlBPbCqxfoqlP1zpBaFaG/GmVxcnEuzH7awCpWUvw7gNkvkjt31D5BZ3z76ToLtUVB7HLeGDz/vhTjndSOlrrY+rIzoYtKrbAI5519jXeKXltxx2yfKkIHkuSuTXDSEcsCadMx9c6Cz/xXe+j8wUJt7l2iH5Sm+xY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13536dca-f0b9-4816-5468-08dc9f5ad757
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 14:32:48.9368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pA0Io4IxTz9Y9WzzVbAT4Finbz6VjHDj0nXLMxzsaROtWCxLmev+aDJCTmzBNul1pHPyDYpUMv2gWR4XcmbTvVJw95jYaKFiainF3R8MNYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4895
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407080109
X-Proofpoint-GUID: H-b-0uLI3KfpxXfO-DwWy8c9NY6Umx_E
X-Proofpoint-ORIG-GUID: H-b-0uLI3KfpxXfO-DwWy8c9NY6Umx_E



On 7/8/24 5:04 AM, Jürgen Groß wrote:
> On 06.07.24 00:36, boris.ostrovsky@oracle.com wrote:
>>
>>

> 
>> Also, would it be better to keep these fields as a struct of scalars 
>> and instead have the percpu array of this struct? Otherwise there is a 
>> whole bunch of [MC_BATCH] arrays, all of them really indexed by the 
>> same value. (And while at it, there is no reason to have 
>> callbacks[MC_BATCH] sized like that -- it has nothing to do with batch 
>> size and can probably be made smaller)
> 
> As today the mc_buffer's entries are copied via a single memcpy(), there
> are 3 options:

Ah yes, it's memcpy, I didn't think of that. Then leaving it as is is 
the best.

> 
> - make mc_debug_data a percpu pointer to a single array, requiring to
>    copy the mc_buffer's entries in a loop
> 
> - let struct mc_debug_data contain two arrays (entries[] and struct foo 
> {}[],
>    with struct foo containing the other pointers/values)
> 
> - keep the layout as in my patch
> 
> Regarding the callbacks: I think the max number of callbacks is indeed 
> MC_BATCH,
> as for each batch member one callback might be requested. So I'd rather 
> keep it
> the way it is today.


Right, I was trying to point out that it's the max number but I suspect 
it usually is smaller --  we currently ask for a callback in fewer than 
half of the cases where we submit a request.


-boris

