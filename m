Return-Path: <linux-doc+bounces-25548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD397EB57
	for <lists+linux-doc@lfdr.de>; Mon, 23 Sep 2024 14:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748B2281D88
	for <lists+linux-doc@lfdr.de>; Mon, 23 Sep 2024 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F196B19885B;
	Mon, 23 Sep 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SWyKDt/c"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC0823AC;
	Mon, 23 Sep 2024 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093285; cv=fail; b=GBlCgA9Wn5XjHSb0E/6RoU5HA7tU4A5/4jn0EguHDtDeK1oBNyBcumJbWm34KUS2dJQKbBKmcCmv+G+RyhqremtEzHzzX4KQej7AVplzMTO7c2R7nkKTJUs5FUuTCWA12xzSjBUfPjotQtCDMiPf5bq69JLb/TTc7Jz/cmWgPCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093285; c=relaxed/simple;
	bh=8J7mXO/pTkbF4r/cmEE+7ueYjbVcT3Qakn8k0uhFmqw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nYI+5Onw3EMJmNEHbnEC/sn580pqtBS0wE2k9wSQhQ+Y3+FjZAv4VZydVYJ45kUriwB4JTpimTnnXhVA7W3VEdVGWnDslORQXdXPtLgiQfs/1ABfFL5XK5Mlf+Lb2DvFzR+OAl1CGNdWuxcUuo2YwMT8g8nCrNi+oNE646uZ+O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SWyKDt/c; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNXLqO6w2yWDK28UOEn/3wRshS7syr5VxkCKD05SPg+3C3vYKPjLvqiOohGxkb2YK1OMEluUjdCwycJu/lilP6GHjTdgDEjOM0QGNp9DF1svlg4swJX+3J5/Vn8f2mFib18BlfudHBUR8JwXQHJolhucpVP/A7Guw1BOigcvyNmeoBXLD6iZMaFzL0GQXaMKoNjo92Djn2dVfCQkAM2KWMSrO/VS1BRjlPTV/edTMHN5YhbFXeIWS886tuXTYh4znJ8rMeduXJE2XJMHUU2yDML6/wJEEIDOpi44W9uAzKg6eXz3gkIa0c3K8J93WIvzGhwKh9GbpNZt1cxeSULY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O83q7XW/kuZpGuYZL0rWisrfrgu0a6zj+dpgTr1aJcY=;
 b=GTYKOMUbY6hQx8hixc05hOMYnj01LqnfBqsqC3YCSUNzB7FjL/KWAUCspk4ig8WskStwYNB5rTbv2MfyCuA7GXpjMIco3wRK60Ux3CJ3PxdVKrErfGSINULbHwr7OYzH4BLxr5iHWOhNXlt1I4UBjQpyCyTjz9sTIgeJLH2boQbxPT1iBsmga4zTqG1OnTwTvmrGoFbFodZJgqYzvDZWUus+mqmThPg8n8ZgZxLnqrI7NZeQXGnkvv8sI+sn149Ih7qjABA/z6bb7ZvznqQEKK4PuSWmQYHdP0W9a3RjCiWExgY/rJXeL9ZTeJkuuypxTP5xcmdC92lRKKMSOg3R8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O83q7XW/kuZpGuYZL0rWisrfrgu0a6zj+dpgTr1aJcY=;
 b=SWyKDt/cbWwGcBSyal2R2BEBVQ1S8J+vG0ha0F4aoukBLrazQSfgU2vYG4A55+WjWWiI/OHmBZK3o74BW8zO+4aqSkTLpPCh44v93iKie2O5Z83umuZi5zZMFDAVP3F8uz/s/Rr9qfpG6FPffpdR4IyuWGjxavAhwl9f9zCf4Xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 12:07:59 +0000
Received: from DM6PR12MB4202.namprd12.prod.outlook.com
 ([fe80::f943:600c:2558:af79]) by DM6PR12MB4202.namprd12.prod.outlook.com
 ([fe80::f943:600c:2558:af79%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 12:07:59 +0000
Message-ID: <a660f2be-55a2-eca3-bfb3-aa69993f86e5@amd.com>
Date: Mon, 23 Sep 2024 13:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V5 1/5] PCI: Add TLP Processing Hints (TPH) support
Content-Language: en-US
To: Wei Huang <wei.huang2@amd.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Jonathan.Cameron@Huawei.com, helgaas@kernel.org, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, alex.williamson@redhat.com, gospo@broadcom.com,
 michael.chan@broadcom.com, ajit.khaparde@broadcom.com,
 somnath.kotur@broadcom.com, andrew.gospodarek@broadcom.com,
 manoj.panicker2@amd.com, Eric.VanTassell@amd.com, vadim.fedorenko@linux.dev,
 horms@kernel.org, bagasdotme@gmail.com, bhelgaas@google.com,
 lukas@wunner.de, paul.e.luse@intel.com, jing2.liu@intel.com
References: <20240916205103.3882081-1-wei.huang2@amd.com>
 <20240916205103.3882081-2-wei.huang2@amd.com>
From: Alejandro Lucero Palau <alucerop@amd.com>
In-Reply-To: <20240916205103.3882081-2-wei.huang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::17) To DM6PR12MB4202.namprd12.prod.outlook.com
 (2603:10b6:5:219::22)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4202:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3eebc7-b691-4995-b8db-08dcdbc85de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2VzSnJoL3o1NTU4eHpYV3BhMDNBaTJEb3JUWEV2eEZFVVlaNEI5QVl0bVhG?=
 =?utf-8?B?VUJUYTJJUFZhcDRKYUt1YzhxNmtLTDk4dnNRR3VTaURHcnhLaUQrRElSS3ds?=
 =?utf-8?B?ZTJwKzlhMXhiSmRXVlRmS2VVZjNBa2d6N0VHclRId2xwYXQwNS9mdHBmR3VK?=
 =?utf-8?B?RS9VMmdtTkVVSGFUUmZSOWYzS1QrcFhEcUNoZHNvVTRnV28reGpiVVBTanBl?=
 =?utf-8?B?K2RUOVlycFhyNjd6KzV6M1czUmErVnJvYTdMOHVsc21CZEQ1aUIvSDZpd2ow?=
 =?utf-8?B?VkJVMzRVek9OdW5BT3FSTG5wOGdTbXU4djVlNXVidUhkQ2c0VlF5T1daS1Ro?=
 =?utf-8?B?aTB3c0FDY0lIa1VaL0V5emZhRzB1VGRhejFMQmJDUDhRcXZYanNUOFF1cVRB?=
 =?utf-8?B?RU9YR1lFOGx1ZlJpVE80cmJTR3JVcWhkV0FJbGtxVjZWajNudHpZMFhQclZV?=
 =?utf-8?B?SjFGOHNhVmJTUDlWOEhnMEVHM1lkRGw3RitTZTY2eUFPYktTTFdtNUx4VlM1?=
 =?utf-8?B?OHI2MlBpSEtQWnJpdVdGVWxIS0pxK3Z5Wkd0OWxMQzA5OHp2V0J4MlFkQ0hZ?=
 =?utf-8?B?V05wSUFoMEg1eFVpRmxzQWV5OHRUOHF1YmRIZnFNemI5VXFsM1Y5Tk54dUVU?=
 =?utf-8?B?a1Ftd1hUeERCeSt3MVAxTkpETGMvdE5ZelRGQVpkdFBYNlluaE1TemowdWFL?=
 =?utf-8?B?VCt5VlgwSG55alVOSEFBeFdYSHREclBxTE1FTlFTVDUxMzhQb2xsNi9NbzB4?=
 =?utf-8?B?eitJQzNKVTE3QXA1bTNITVpRd3NCb1BWNlBiMnU1MmNRRGI2ZlMzSTZLK2FG?=
 =?utf-8?B?UFpqY244Q2llemltSkViRlM5ZFFncElYVDBEdG51Y3graTVZT3FxTGw5bEZV?=
 =?utf-8?B?d3FKT0FRVFpvenU0K0VlcjlWTU5yd2FqZG9ETUFBQXJLOXhIU1FsR2tueHE3?=
 =?utf-8?B?YzJZL1JUbGZ1OW42VWFvdTl3WVZVVFdTOTVzNVBsZTk3T0pLU21XUHNtOGlV?=
 =?utf-8?B?NGQ2dCs1SFF4Sk4vdDBhM1hYY1VZcGpmd1NHYkFFdEtlRFJOS2J5WkxVcDFl?=
 =?utf-8?B?Z1NhUGtseTFCN25MYnQzcXoza2VXMGNLTklyRjZkVm1lOExaQ1BldnVjT0Rk?=
 =?utf-8?B?OTUybU5Vd3dBdElid3dhK05OMXo5V0RoL2QvWVRvTjE1cUgxb3FEdTRucFR5?=
 =?utf-8?B?ZHJlcW5kZ1NkckNxbEl6ekdzYzNRY1BjMDBsREZ0bFA2WG9sNlJVY2RBMms3?=
 =?utf-8?B?TmRGL0Q3UVdQMjUxdzYwTDhXamZtMHpvZ0xsaTErSjJzS1JmQ0tmL0MrUXFG?=
 =?utf-8?B?aWl6eUd2QkZyMFFYc1VzVFl3WEhXWDYrSkNwaFhqM1RTWjVOYlg2R3cybWRR?=
 =?utf-8?B?UGFZMW9jMXRkWnlIVmtvZnVteEpndmVoOGs0dENXb3RYdHA0bGRSMmNJS3R5?=
 =?utf-8?B?WVliVjNrMUlES2FybEFqNi9kMXlydXlZcWVjWlE3c3pjQnkzUnJFZHJjWEdh?=
 =?utf-8?B?SjZyZUpmUXhVM0RFdE5pQ0hvVzVuYVVMOWxkajFPRkZOckpXR3NnUUdMWFdE?=
 =?utf-8?B?UU9HKzNvell4TmpFUlBBWVlhRVgzeHJWdHRQV3o2Yms2R3JYOW5aYkNDK3VK?=
 =?utf-8?B?U0Zsb2lRWEdJSmFaaTBXNTdCaWdlWllNb2kzZU82aVViL05IUzlqWktXMTlm?=
 =?utf-8?B?cUZGNm91Q20vTW9SODJpMXdQSEp0OVNyWmdOb1d4ZjQ4dkM1NWc3TWN5VExH?=
 =?utf-8?B?ZmNYYVAzcG5CUDk3RHdmRXF5ckZKbkxCRlhWbWF0Y0ozUTFyRnd3SC9zUDdN?=
 =?utf-8?B?KzZoaTFNdUNWaFpETFo1UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4202.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1lHMkxLdGQ2b00vYkRyblVOMmNXcHRNRTVPZXF6QzBaWnRyczZ0SGpMVXFk?=
 =?utf-8?B?QnNja3MyaHROZXZSRWFxS2t3VEdBWTMvamJHSGFORzdXUWhZNVh2YzIyMEg3?=
 =?utf-8?B?bG4yYzVpME14N2pjVjI4bEo5NXpBbkZkZFNqWmdaT3VEbkVhb2JxWncrUXM2?=
 =?utf-8?B?Vy8wR29iblJXWDhlUVVDaFBRSEMzbXZjalJ6LzQzVTFGY1RpNHpqVG1QdlZv?=
 =?utf-8?B?UHBlYVlKNUM4aTFMNHEzUU9nMUt4UkxzUFFkcXIzYjdLSjVGVFdEeE1lWSs3?=
 =?utf-8?B?Q1pnL3l1T2llTVNmQnJlbXNRSWF0Ylo3cE55RTN1Q0M1M3p1TmcxVmNPUUlB?=
 =?utf-8?B?RC9DamJTMnJteVo3d0JjUWZpWG1hRkl3dlFjMjBrZkI2c2JiRFRrbUQvOHlV?=
 =?utf-8?B?V3FMSVNrb3Jxd3RiZmtEaFhtejZWVk1ZMXNBdmp5OEp4SVRGOU5iZ1hZRUY0?=
 =?utf-8?B?MEI2TDIzMW0wRW1haFJYOHA2eXMwMWdRQ01UZEhwaE1mOTRUUmNJaHBsY1Fi?=
 =?utf-8?B?OGV3aU5KdThoU0JUVjY2bXhaMWtxSHppeE9Idkt5RldsSURrL3lwYTZCb3N0?=
 =?utf-8?B?NFRmTi9VTU9GbGFxTzNPTVIrMFBpM1BzbTByZXgvalBoZE8yZGd3N3NNMUx5?=
 =?utf-8?B?QzVkbDlDNW1vQTdieTFmZ25TdDJreHRPcFB6cDBiSDQrK0hpaTFDWDhQRzJS?=
 =?utf-8?B?M0x4NW5RcWRxUFU1VnBjZ0ptTVB5dWozbVFKNy9RWnkvQTEreWtzRk9kN1Vr?=
 =?utf-8?B?UGVpTk9JVUxvOXlFWVNyUm5HVkdWMllIOHU4RHFMcE5UQnVKa1k2ZUhaNStK?=
 =?utf-8?B?SDF2ZU9SdTJteW8rTG9jVDBBeVcyOE9pbEJzZ2xFa25HY2NseVRDQ01UeUFK?=
 =?utf-8?B?Um9idmsrcUJuYTlCVUxCTG9lTXY3cnZCWldlbi9xL3NJZXpYZ01DN1dGejA4?=
 =?utf-8?B?dEkzVmYwZGRENVJhVnN5OFRFenFzN25pbHJIZTZmU2dRazdyb09vOERUVkhM?=
 =?utf-8?B?N3Z4QlNYSUdYVUlmUTRWR1Q5RG9WdUgxUENjdnBRMUJhWWdBNHVLMDhMYVlt?=
 =?utf-8?B?cXgrWUFiUzF3Q3VwMlNPeGRWa1IrWnE3L3B0Y2NWU1NKVFBRMmtGUmdaTzFs?=
 =?utf-8?B?MENjK2tKQ2M2SUxGYVlBSThnaXlUMGtwUkRUbGExckVSYTN6TUorR21LWTVo?=
 =?utf-8?B?YmV0WTZxdzZNckZldnduYmZaYVV2RDBFdHNLOGxEd0dUcmhIbHNCWUZHdHdC?=
 =?utf-8?B?L2hsNGgybmVnQ01KZjlNY0cvdlJSeUlMNXNLUW1nSWJKVTl4czg5N1JvdlVp?=
 =?utf-8?B?d0xUTWxtdjAvUUxTVnNrd3ZCcnF6OVhJais5WmlYRWlsRUR5NlN5UTBMOGFm?=
 =?utf-8?B?eEEyVGZyRjlYUSs0cCtQNEltdy9MOFVneU4zZVd6RXB0SUhWSzl0M202Z0Mr?=
 =?utf-8?B?Q2ZKV2dqeXVrZnNQZGVpTkJqbnREZG04QWlsTFdqOHNtbmtYQm0wV0RXbWFT?=
 =?utf-8?B?TnNtalE0bHNlVTBUQXpCUWVyZWdBdm81VzJvU3o2d1VwUll1ZXVQQitSY2Vv?=
 =?utf-8?B?amVDSmNtZTgwM3ZiZlVjNGw4Qk1oSjF0dXh6UjJnTXJES0I2OWdrK2RDRStx?=
 =?utf-8?B?WjFtRnBWaUFlMFZHNU1saWEvcUJqaW8rZjlOcUI3RS8wWC9aamxtbEVHSlFi?=
 =?utf-8?B?TlNaM29sLy95ZTBoeUU3cENac1E5OHc1MS9keGxpd21TVktqeEpIblY4L2V3?=
 =?utf-8?B?MmpWRm5kSzZUdlJwdzhMZ25paHNlQmxWZzBlOGFTUlJ2Z0JwRkhNK1RNdkVO?=
 =?utf-8?B?eWRrNjZPd1pKeTcxSEs1ekNhVDk3bEpaWkRqNk1pYlNUcmtVeUFHVE5ZdWlC?=
 =?utf-8?B?SG8xVytzVVkvS0tVc20zSGMyOWRwTW1lMlRLV3o2RFVMcDRNRncxSHlqSll5?=
 =?utf-8?B?VGZUTnRqUXpjYUFPMC9zNE1WbFcrOVd2MC9ZR0dtTk9BLy9jeFgwZGx3Ulg4?=
 =?utf-8?B?TERlUnZ4bXE2L3I1K2hwREZVbldmRGNyZURDMWtRR1RVNkpqMG9KbWk5UEc2?=
 =?utf-8?B?QmFMb0N0RGRLQTYrekE4OGswRUZoeURKVVZKcndORkkwcjNpOXBpS29TWEtm?=
 =?utf-8?Q?3svdv1zp7UrRaqgzHGH60e6y6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3eebc7-b691-4995-b8db-08dcdbc85de2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4202.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 12:07:59.6505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPbKqj9Bef1TVUBlQAs2i6ECv+g7AMXXdTQ2rz0twEvftV/KzvVGdiPD5aSyqIdrwxruxVVKV7padDGjta/5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648


On 9/16/24 21:50, Wei Huang wrote:
> Add support for PCIe TLP Processing Hints (TPH) support (see PCIe r6.2,
> sec 6.17).
>
> Add missing TPH register definitions in pci_regs.h, including the TPH
> Requester capability register, TPH Requester control register, TPH
> Completer capability, and the ST fields of MSI-X entry.
>
> Introduce pcie_enable_tph() and pcie_disable_tph(), enabling drivers to
> toggle TPH support and configure specific ST mode as needed. Also add a
> new kernel parameter, "pci=notph", allowing users to disable TPH support
> across the entire system.
>
> Co-developed-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Co-developed-by: Paul Luse <paul.e.luse@linux.intel.com>
> Signed-off-by: Paul Luse <paul.e.luse@linux.intel.com>
> Co-developed-by: Eric Van Tassell <Eric.VanTassell@amd.com>
> Signed-off-by: Eric Van Tassell <Eric.VanTassell@amd.com>
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> Reviewed-by: Ajit Khaparde <ajit.khaparde@broadcom.com>
> Reviewed-by: Somnath Kotur <somnath.kotur@broadcom.com>
> Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> ---
>   .../admin-guide/kernel-parameters.txt         |   4 +
>   drivers/pci/pci.c                             |   4 +
>   drivers/pci/pci.h                             |  12 ++
>   drivers/pci/pcie/Kconfig                      |  11 +
>   drivers/pci/pcie/Makefile                     |   1 +
>   drivers/pci/pcie/tph.c                        | 199 ++++++++++++++++++
>   drivers/pci/probe.c                           |   1 +
>   include/linux/pci-tph.h                       |  21 ++
>   include/linux/pci.h                           |   7 +
>   include/uapi/linux/pci_regs.h                 |  38 +++-
>   10 files changed, 290 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/pci/pcie/tph.c
>   create mode 100644 include/linux/pci-tph.h
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 09126bb8cc9f..8579d0fbcd33 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4617,6 +4617,10 @@
>   		nomio		[S390] Do not use MIO instructions.
>   		norid		[S390] ignore the RID field and force use of
>   				one PCI domain per PCI function
> +		notph		[PCIE] If the PCIE_TPH kernel config parameter
> +				is enabled, this kernel boot option can be used
> +				to disable PCIe TLP Processing Hints support
> +				system-wide.
>   
>   	pcie_aspm=	[PCIE] Forcibly enable or ignore PCIe Active State Power
>   			Management.
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ffaaca0978cb..b6f60f7476cc 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1813,6 +1813,7 @@ int pci_save_state(struct pci_dev *dev)
>   	pci_save_dpc_state(dev);
>   	pci_save_aer_state(dev);
>   	pci_save_ptm_state(dev);
> +	pci_save_tph_state(dev);
>   	return pci_save_vc_state(dev);
>   }
>   EXPORT_SYMBOL(pci_save_state);
> @@ -1917,6 +1918,7 @@ void pci_restore_state(struct pci_dev *dev)
>   	pci_restore_vc_state(dev);
>   	pci_restore_rebar_state(dev);
>   	pci_restore_dpc_state(dev);
> +	pci_restore_tph_state(dev);
>   	pci_restore_ptm_state(dev);
>   
>   	pci_aer_clear_status(dev);
> @@ -6869,6 +6871,8 @@ static int __init pci_setup(char *str)
>   				pci_no_domains();
>   			} else if (!strncmp(str, "noari", 5)) {
>   				pcie_ari_disabled = true;
> +			} else if (!strncmp(str, "notph", 5)) {
> +				pci_no_tph();
>   			} else if (!strncmp(str, "cbiosize=", 9)) {
>   				pci_cardbus_io_size = memparse(str + 9, &str);
>   			} else if (!strncmp(str, "cbmemsize=", 10)) {
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 79c8398f3938..8eeabbbfa137 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -571,6 +571,18 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
>   
>   #endif /* CONFIG_PCI_IOV */
>   
> +#ifdef CONFIG_PCIE_TPH
> +void pci_restore_tph_state(struct pci_dev *dev);
> +void pci_save_tph_state(struct pci_dev *dev);
> +void pci_no_tph(void);
> +void pci_tph_init(struct pci_dev *dev);
> +#else
> +static inline void pci_restore_tph_state(struct pci_dev *dev) { }
> +static inline void pci_save_tph_state(struct pci_dev *dev) { }
> +static inline void pci_no_tph(void) { }
> +static inline void pci_tph_init(struct pci_dev *dev) { }
> +#endif
> +
>   #ifdef CONFIG_PCIE_PTM
>   void pci_ptm_init(struct pci_dev *dev);
>   void pci_save_ptm_state(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index 17919b99fa66..61e4bd16eaf1 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -155,3 +155,14 @@ config PCIE_EDR
>   	  the PCI Firmware Specification r3.2.  Enable this if you want to
>   	  support hybrid DPC model which uses both firmware and OS to
>   	  implement DPC.
> +
> +config PCIE_TPH
> +	bool "TLP Processing Hints"
> +	depends on ACPI
> +	default n
> +	help
> +	  This option adds support for PCIe TLP Processing Hints (TPH).
> +	  TPH allows endpoint devices to provide optimization hints, such as
> +	  desired caching behavior, for requests that target memory space.
> +	  These hints, called Steering Tags, can empower the system hardware
> +	  to optimize the utilization of platform resources.
> diff --git a/drivers/pci/pcie/Makefile b/drivers/pci/pcie/Makefile
> index 6461aa93fe76..3542b42ea0b9 100644
> --- a/drivers/pci/pcie/Makefile
> +++ b/drivers/pci/pcie/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_PCIE_PME)		+= pme.o
>   obj-$(CONFIG_PCIE_DPC)		+= dpc.o
>   obj-$(CONFIG_PCIE_PTM)		+= ptm.o
>   obj-$(CONFIG_PCIE_EDR)		+= edr.o
> +obj-$(CONFIG_PCIE_TPH)		+= tph.o
> diff --git a/drivers/pci/pcie/tph.c b/drivers/pci/pcie/tph.c
> new file mode 100644
> index 000000000000..1efd76c8dd30
> --- /dev/null
> +++ b/drivers/pci/pcie/tph.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TPH (TLP Processing Hints) support
> + *
> + * Copyright (C) 2024 Advanced Micro Devices, Inc.
> + *     Eric Van Tassell <Eric.VanTassell@amd.com>
> + *     Wei Huang <wei.huang2@amd.com>
> + */
> +#include <linux/pci.h>
> +#include <linux/pci-acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/msi.h>
> +#include <linux/pci-tph.h>
> +
> +#include "../pci.h"
> +
> +/* System-wide TPH disabled */
> +static bool pci_tph_disabled;
> +
> +static u8 get_st_modes(struct pci_dev *pdev)
> +{
> +	u32 reg;
> +
> +	pci_read_config_dword(pdev, pdev->tph_cap + PCI_TPH_CAP, &reg);
> +	reg &= PCI_TPH_CAP_ST_NS | PCI_TPH_CAP_ST_IV | PCI_TPH_CAP_ST_DS;
> +
> +	return reg;
> +}
> +
> +/* Return device's Root Port completer capability */
> +static u8 get_rp_completer_type(struct pci_dev *pdev)
> +{
> +	struct pci_dev *rp;
> +	u32 reg;
> +	int ret;
> +
> +	rp = pcie_find_root_port(pdev);
> +	if (!rp)
> +		return 0;
> +
> +	ret = pcie_capability_read_dword(rp, PCI_EXP_DEVCAP2, &reg);
> +	if (ret)
> +		return 0;
> +
> +	return FIELD_GET(PCI_EXP_DEVCAP2_TPH_COMP_MASK, reg);
> +}
> +
> +/**
> + * pcie_disable_tph - Turn off TPH support for device
> + * @pdev: PCI device
> + *
> + * Return: none
> + */
> +void pcie_disable_tph(struct pci_dev *pdev)
> +{
> +	if (!pdev->tph_cap)
> +		return;
> +
> +	if (!pdev->tph_enabled)
> +		return;
> +
> +	pci_write_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, 0);
> +
> +	pdev->tph_mode = 0;
> +	pdev->tph_req_type = 0;
> +	pdev->tph_enabled = 0;
> +}
> +EXPORT_SYMBOL(pcie_disable_tph);
> +
> +/**
> + * pcie_enable_tph - Enable TPH support for device using a specific ST mode
> + * @pdev: PCI device
> + * @mode: ST mode to enable. Current supported modes include:
> + *
> + *   - PCI_TPH_ST_NS_MODE: NO ST Mode
> + *   - PCI_TPH_ST_IV_MODE: Interrupt Vector Mode
> + *   - PCI_TPH_ST_DS_MODE: Device Specific Mode
> + *
> + * Checks whether the mode is actually supported by the device before enabling
> + * and returns an error if not. Additionally determines what types of requests,
> + * TPH or extended TPH, can be issued by the device based on its TPH requester
> + * capability and the Root Port's completer capability.
> + *
> + * Return: 0 on success, otherwise negative value (-errno)
> + */
> +int pcie_enable_tph(struct pci_dev *pdev, int mode)
> +{
> +	u32 reg;
> +	u8 dev_modes;
> +	u8 rp_req_type;
> +
> +	/* Honor "notph" kernel parameter */
> +	if (pci_tph_disabled)
> +		return -EINVAL;
> +
> +	if (!pdev->tph_cap)
> +		return -EINVAL;
> +
> +	if (pdev->tph_enabled)
> +		return -EBUSY;
> +
> +	/* Sanitize and check ST mode comptability */
> +	mode &= PCI_TPH_CTRL_MODE_SEL_MASK;
> +	dev_modes = get_st_modes(pdev);
> +	if (!((1 << mode) & dev_modes))


This is wrong. The mode definition is about the bit on and not about bit 
position. You got this right in v4 ...


> +		return -EINVAL;
> +
> +	pdev->tph_mode = mode;
> +
> +	/* Get req_type supported by device and its Root Port */
> +	pci_read_config_dword(pdev, pdev->tph_cap + PCI_TPH_CAP, &reg);
> +	if (FIELD_GET(PCI_TPH_CAP_EXT_TPH, reg))
> +		pdev->tph_req_type = PCI_TPH_REQ_EXT_TPH;
> +	else
> +		pdev->tph_req_type = PCI_TPH_REQ_TPH_ONLY;
> +
> +	rp_req_type = get_rp_completer_type(pdev);
> +
> +	/* Final req_type is the smallest value of two */
> +	pdev->tph_req_type = min(pdev->tph_req_type, rp_req_type);
> +
> +	if (pdev->tph_req_type == PCI_TPH_REQ_DISABLE)
> +		return -EINVAL;
> +
> +	/* Write them into TPH control register */
> +	pci_read_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, &reg);
> +
> +	reg &= ~PCI_TPH_CTRL_MODE_SEL_MASK;
> +	reg |= FIELD_PREP(PCI_TPH_CTRL_MODE_SEL_MASK, pdev->tph_mode);
> +
> +	reg &= ~PCI_TPH_CTRL_REQ_EN_MASK;
> +	reg |= FIELD_PREP(PCI_TPH_CTRL_REQ_EN_MASK, pdev->tph_req_type);
> +
> +	pci_write_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, reg);
> +
> +	pdev->tph_enabled = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(pcie_enable_tph);
> +
> +void pci_restore_tph_state(struct pci_dev *pdev)
> +{
> +	struct pci_cap_saved_state *save_state;
> +	u32 *cap;
> +
> +	if (!pdev->tph_cap)
> +		return;
> +
> +	if (!pdev->tph_enabled)
> +		return;
> +
> +	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_TPH);
> +	if (!save_state)
> +		return;
> +
> +	/* Restore control register and all ST entries */
> +	cap = &save_state->cap.data[0];
> +	pci_write_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, *cap++);
> +}
> +
> +void pci_save_tph_state(struct pci_dev *pdev)
> +{
> +	struct pci_cap_saved_state *save_state;
> +	u32 *cap;
> +
> +	if (!pdev->tph_cap)
> +		return;
> +
> +	if (!pdev->tph_enabled)
> +		return;
> +
> +	save_state = pci_find_saved_ext_cap(pdev, PCI_EXT_CAP_ID_TPH);
> +	if (!save_state)
> +		return;
> +
> +	/* Save control register */
> +	cap = &save_state->cap.data[0];
> +	pci_read_config_dword(pdev, pdev->tph_cap + PCI_TPH_CTRL, cap++);
> +}
> +
> +void pci_no_tph(void)
> +{
> +	pci_tph_disabled = true;
> +
> +	pr_info("PCIe TPH is disabled\n");
> +}
> +
> +void pci_tph_init(struct pci_dev *pdev)
> +{
> +	u32 save_size;
> +
> +	pdev->tph_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_TPH);
> +	if (!pdev->tph_cap)
> +		return;
> +
> +	save_size = sizeof(u32);
> +	pci_add_ext_cap_save_buffer(pdev, PCI_EXT_CAP_ID_TPH, save_size);
> +}
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index b14b9876c030..c74adcdee52b 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2498,6 +2498,7 @@ static void pci_init_capabilities(struct pci_dev *dev)
>   	pci_dpc_init(dev);		/* Downstream Port Containment */
>   	pci_rcec_init(dev);		/* Root Complex Event Collector */
>   	pci_doe_init(dev);		/* Data Object Exchange */
> +	pci_tph_init(dev);		/* TLP Processing Hints */
>   
>   	pcie_report_downtraining(dev);
>   	pci_init_reset_methods(dev);
> diff --git a/include/linux/pci-tph.h b/include/linux/pci-tph.h
> new file mode 100644
> index 000000000000..58654a334ffb
> --- /dev/null
> +++ b/include/linux/pci-tph.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TPH (TLP Processing Hints)
> + *
> + * Copyright (C) 2024 Advanced Micro Devices, Inc.
> + *     Eric Van Tassell <Eric.VanTassell@amd.com>
> + *     Wei Huang <wei.huang2@amd.com>
> + */
> +#ifndef LINUX_PCI_TPH_H
> +#define LINUX_PCI_TPH_H
> +
> +#ifdef CONFIG_PCIE_TPH
> +void pcie_disable_tph(struct pci_dev *pdev);
> +int pcie_enable_tph(struct pci_dev *pdev, int mode);
> +#else
> +static inline void pcie_disable_tph(struct pci_dev *pdev) { }
> +static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
> +{ return -EINVAL; }
> +#endif
> +
> +#endif /* LINUX_PCI_TPH_H */
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 4cf89a4b4cbc..6f05deb6a0bf 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -433,6 +433,7 @@ struct pci_dev {
>   	unsigned int	ats_enabled:1;		/* Address Translation Svc */
>   	unsigned int	pasid_enabled:1;	/* Process Address Space ID */
>   	unsigned int	pri_enabled:1;		/* Page Request Interface */
> +	unsigned int	tph_enabled:1;		/* TLP Processing Hints */
>   	unsigned int	is_managed:1;		/* Managed via devres */
>   	unsigned int	is_msi_managed:1;	/* MSI release via devres installed */
>   	unsigned int	needs_freset:1;		/* Requires fundamental reset */
> @@ -530,6 +531,12 @@ struct pci_dev {
>   
>   	/* These methods index pci_reset_fn_methods[] */
>   	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
> +
> +#ifdef CONFIG_PCIE_TPH
> +	u16		tph_cap;	/* TPH capability offset */
> +	u8		tph_mode;	/* TPH mode */
> +	u8		tph_req_type;	/* TPH requester type */
> +#endif
>   };
>   
>   static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 94c00996e633..25af1976953c 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -340,7 +340,9 @@
>   #define PCI_MSIX_ENTRY_UPPER_ADDR	0x4  /* Message Upper Address */
>   #define PCI_MSIX_ENTRY_DATA		0x8  /* Message Data */
>   #define PCI_MSIX_ENTRY_VECTOR_CTRL	0xc  /* Vector Control */
> -#define  PCI_MSIX_ENTRY_CTRL_MASKBIT	0x00000001
> +#define  PCI_MSIX_ENTRY_CTRL_MASKBIT	0x00000001  /* Mask Bit */
> +#define  PCI_MSIX_ENTRY_CTRL_ST_LOWER	0x00ff0000  /* ST Lower */
> +#define  PCI_MSIX_ENTRY_CTRL_ST_UPPER	0xff000000  /* ST Upper */
>   
>   /* CompactPCI Hotswap Register */
>   
> @@ -657,6 +659,7 @@
>   #define  PCI_EXP_DEVCAP2_ATOMIC_COMP64	0x00000100 /* 64b AtomicOp completion */
>   #define  PCI_EXP_DEVCAP2_ATOMIC_COMP128	0x00000200 /* 128b AtomicOp completion */
>   #define  PCI_EXP_DEVCAP2_LTR		0x00000800 /* Latency tolerance reporting */
> +#define  PCI_EXP_DEVCAP2_TPH_COMP_MASK	0x00003000 /* TPH completer support */
>   #define  PCI_EXP_DEVCAP2_OBFF_MASK	0x000c0000 /* OBFF support mechanism */
>   #define  PCI_EXP_DEVCAP2_OBFF_MSG	0x00040000 /* New message signaling */
>   #define  PCI_EXP_DEVCAP2_OBFF_WAKE	0x00080000 /* Re-use WAKE# for OBFF */
> @@ -1020,15 +1023,34 @@
>   #define  PCI_DPA_CAP_SUBSTATE_MASK	0x1F	/* # substates - 1 */
>   #define PCI_DPA_BASE_SIZEOF	16	/* size with 0 substates */
>   
> +/* TPH Completer Support */
> +#define PCI_EXP_DEVCAP2_TPH_COMP_NONE		0x0 /* None */
> +#define PCI_EXP_DEVCAP2_TPH_COMP_TPH_ONLY	0x1 /* TPH only */
> +#define PCI_EXP_DEVCAP2_TPH_COMP_EXT_TPH	0x3 /* TPH and Extended TPH */
> +
>   /* TPH Requester */
>   #define PCI_TPH_CAP		4	/* capability register */
> -#define  PCI_TPH_CAP_LOC_MASK	0x600	/* location mask */
> -#define   PCI_TPH_LOC_NONE	0x000	/* no location */
> -#define   PCI_TPH_LOC_CAP	0x200	/* in capability */
> -#define   PCI_TPH_LOC_MSIX	0x400	/* in MSI-X */
> -#define PCI_TPH_CAP_ST_MASK	0x07FF0000	/* ST table mask */
> -#define PCI_TPH_CAP_ST_SHIFT	16	/* ST table shift */
> -#define PCI_TPH_BASE_SIZEOF	0xc	/* size with no ST table */
> +#define  PCI_TPH_CAP_ST_NS	0x00000001 /* No ST Mode Supported */
> +#define  PCI_TPH_CAP_ST_IV	0x00000002 /* Interrupt Vector Mode Supported */
> +#define  PCI_TPH_CAP_ST_DS	0x00000004 /* Device Specific Mode Supported */
> +#define  PCI_TPH_CAP_EXT_TPH	0x00000100 /* Ext TPH Requester Supported */
> +#define  PCI_TPH_CAP_LOC_MASK	0x00000600 /* ST Table Location */
> +#define   PCI_TPH_LOC_NONE	0x00000000 /* Not present */
> +#define   PCI_TPH_LOC_CAP	0x00000200 /* In capability */
> +#define   PCI_TPH_LOC_MSIX	0x00000400 /* In MSI-X */
> +#define  PCI_TPH_CAP_ST_MASK	0x07FF0000 /* ST Table Size */
> +#define  PCI_TPH_CAP_ST_SHIFT	16	/* ST Table Size shift */
> +#define PCI_TPH_BASE_SIZEOF	0xc	/* Size with no ST table */
> +
> +#define PCI_TPH_CTRL		8	/* control register */
> +#define  PCI_TPH_CTRL_MODE_SEL_MASK	0x00000007 /* ST Mode Select */
> +#define   PCI_TPH_ST_NS_MODE		0x0 /* No ST Mode */
> +#define   PCI_TPH_ST_IV_MODE		0x1 /* Interrupt Vector Mode */
> +#define   PCI_TPH_ST_DS_MODE		0x2 /* Device Specific Mode */
> +#define  PCI_TPH_CTRL_REQ_EN_MASK	0x00000300 /* TPH Requester Enable */
> +#define   PCI_TPH_REQ_DISABLE		0x0 /* No TPH requests allowed */
> +#define   PCI_TPH_REQ_TPH_ONLY		0x1 /* TPH only requests allowed */
> +#define   PCI_TPH_REQ_EXT_TPH		0x3 /* Extended TPH requests allowed */
>   
>   /* Downstream Port Containment */
>   #define PCI_EXP_DPC_CAP			0x04	/* DPC Capability */

