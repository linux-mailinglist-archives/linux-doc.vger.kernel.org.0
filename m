Return-Path: <linux-doc+bounces-18978-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD090F9DF
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 01:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF4C1C21773
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 23:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C5A15383B;
	Wed, 19 Jun 2024 23:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hyGeumgs"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2062.outbound.protection.outlook.com [40.107.114.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F5139CE5;
	Wed, 19 Jun 2024 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841310; cv=fail; b=hUGuRFzxoMdHguejP9Y2CnO8iMuuI0O9DTi4NXOwfvfRyMSTzfmXS5IIG56+oBYDHPmoULHEV3VpBn5DiUsQSyRX8REhgoQ9TZdSSKTxxIRMsmJl5a5el4Z1Kwn5dIwT0ovIAtC2EgfM45YX2e8vVZJvOrKZdR+F+9FCIRO1ng0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841310; c=relaxed/simple;
	bh=eSSIrUdVhHzV4EszI7vuCiXk4qXtV3I1+l8147KA6nw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qv2rl+GE8wzqfkTgVimKH3E8rJc2p95WzDnqd/XNIBNP18D+Nzd+qCAuDNDbmPK+h1iQhuvHTkTypx4axIhgjAF/iJ6kfzPgoFMSMAZTQ2cPEcffyGwpHajrZ5CDMGasMx0+CCek6hAQVcx0XbCgeqGc4vrqbQ4WHRKvEDHTkJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hyGeumgs; arc=fail smtp.client-ip=40.107.114.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDzDbqhTOeZ+DG3iXGZyRSePHSgcB16nF95uDIkRt5ec0w3+05V/+xJpVTcPPAdd+x5cTDpIA2dKreo1OvK0jbQYW3peyDAeW1y2dV++sIh2Wz3XqsDgFRy7nxmrUIwdE9c1HIg47jFzW7jg99fMEujDra3umjJIHIuec0+TDh6ekf+edSR7LeqMGtVfGZ3wTIi9TOSZqLEE/y+WNbhXGAyYQphRn52cqC2yiCWt82+bWPsf18ncy0k6LZYqdsYcNNi/3WW7C5yIcM5IR3+Tvv9W86Q6BmozVxTYk1irYpBAo6Yq6aa3CgK+fx5b4r3w5WaQYlolnI/Lup/jcNbp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pJqKHT0noCUcUFgqmK5KfDxeaXAYxHuyvwIja3Mwvk=;
 b=ICxJhAqY+AQKroYb+YRkLQlxNlatqfjJHpE7RN1+YHk2GLRbrYnA8ljuSGv3etNZRKiDz6MmjsohbmFUY/XQTepj2yFE+8uMEqKtycmsxF/mlYWMVMtRbfhKlBT3QV02PbDuDFLFUKGmHqB3HbOaVfEUylHHujPU0AYQ6d7fkiqMWIZzUP0rY403jXDBPndAk0xaUEmNQVDPtHA9VzcYgYps+JjKSd+7qz5N4erDyPP0BkMG/UwAWFNWEJC3MqVfAD+seFbqYcKiiJ0RKoFFnkQPgtj1FxQco1HelwzpsHOEACE9+e258XJJxvqmcB7o9z8mB1cEawEPPPemsj3qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pJqKHT0noCUcUFgqmK5KfDxeaXAYxHuyvwIja3Mwvk=;
 b=hyGeumgs3PiG3h4XEJi/dlzJOmAgIWbpSOifhjSwQcp06cnXAAxufZhl+saC6yCwYe29yk/FuFCj+hNmIj0qvsVU2CKx3q3ODOZD7H+GfRt6sFnnM3mb4hh0HYXfPbf/1YqfdqE3fCWA7JML56y5p3gFp9T1Bj198TJl/wvemFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5909.jpnprd01.prod.outlook.com
 (2603:1096:604:c5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 23:55:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.020; Wed, 19 Jun 2024
 23:55:04 +0000
Message-ID: <87y170pjxk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, imx@lists.linux.dev,linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
In-Reply-To: <71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
	<6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
	<877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
	<71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 23:55:03 +0000
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: b41565bc-844d-487e-c52e-08dc90bb3d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IZmKS3XlziqAYna2Ih4y4fbaUijRKFQ5h30JcEnNgpQAy9CzaJAv+j8/mOFQ?=
 =?us-ascii?Q?AhNe5563Q5kXDTZ3C9YN7G4wh2cMaN18+InWlHpWzysbXRs+DwE3Nj7hoVNy?=
 =?us-ascii?Q?zCerEtnKM/If1dkgcXxMzGGsAFTO7pcufSO9qltgbrcYvmWAPZpj3h3lPyuB?=
 =?us-ascii?Q?pJPhW0BdFR8/RFoJpl16Qs64+37WMESaebZvf3YkhUGiLEJB+xWLkv1oJhwr?=
 =?us-ascii?Q?vlVf9KnodYKFZ9t4LjHvXlrWgKo4XiVgfh1KN30xkimYBiE1gTLpJEoQH4Ns?=
 =?us-ascii?Q?WYDWTtd93/BEd5jAfI5sdSlmGQ2+9+ATOjI6haMBFUcJJRHRWVtAywDTWSYU?=
 =?us-ascii?Q?WGmEdW5xulklfU9DnKLhPQpZjvdDUYpLJlPPa6fONI9mGZ5tCIJmQ7yv3oj6?=
 =?us-ascii?Q?/Yk9pp/afilxSG8QJ/KCXdN/5fqvTy2lcZjF8hN2RuwnKqIh/yT48/oM3jiK?=
 =?us-ascii?Q?Pab77vGVxUPDnIBboPqpiH7ukOHRrLKr8L2rhNLELPNUBogb2/7s/f+KV3gr?=
 =?us-ascii?Q?BCY94so47BWxQwLIx1EA2OmFELdDKDNwSvrzSxeGFNbMBhJAVlifdw/piU2P?=
 =?us-ascii?Q?VSK+DbfJJtqhTatlGv3mMKl4J88VXVMOD1KBFaF0UmxKNZEhmwSjjFDjzbIG?=
 =?us-ascii?Q?dzpM/8KOyyd/jyW72NhocJPCdlPlOz8GvILD59SB7v76alTtYHBKBv2hpfom?=
 =?us-ascii?Q?PUUA7WiL3DQdx6KsM5moLnzUWGCzFYGgofEleCG5GExlSYm4ivyq+b6jNmTt?=
 =?us-ascii?Q?UDEL2/J71zmVg2WVeFt2HRpACNhXO+X4H7lM1pAT5pp2sWeeCIe+ppLbQzSS?=
 =?us-ascii?Q?x9kizxtvw+NyRXpCHXjT2yW9aRLaQk5EVmEXqBAChsxD+FZr1kKMYanGQv7p?=
 =?us-ascii?Q?6/+Gs8AeUQHejBj/0DqLYMCnaGE+eFiH/29H0J9gjFHl14FMF51irgA5WXnX?=
 =?us-ascii?Q?4KhHRL26mfi/j9TXLdZ2UgkbU3qonLWuST6yukycalcRkbQLfG4ETo1HFD0b?=
 =?us-ascii?Q?gHZjAM08GV5uE6HnxbOP7Q7n/gJ19dITYe+VDXqWpaGmDEyFXHWfKELA46bH?=
 =?us-ascii?Q?LdR7LOokJTRB5hPuOFDwEa+jmpbJpza1u81OJXeJ4HxhqIU2xyducgzARXhs?=
 =?us-ascii?Q?mmwq4O+7Dz4bsSRCmUKkAhg3xYaVOj/IKzFpk4VTkN8UyZTqNjPT9UzJoolH?=
 =?us-ascii?Q?UxIAR9AINk+5PDxCGcm37J2pDcKTbZpDPwgPhRHocU7ggNowxXOnw6OhAgQ0?=
 =?us-ascii?Q?3pbbjLOtqsAc8mzaGlhsZLJ5ZjTvL1+1JWdr3HgCJmvT+lmzMkebWSqjGSjY?=
 =?us-ascii?Q?v1enGtSWgsGxZDuwiCUnHaibCdaGidWyrFPi2INScZ/WXOmX+XEdI3FIdW8k?=
 =?us-ascii?Q?NCLQibY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?36AFCmJ+zAvw8ZdHMS73OjQOHXM/v9fchbD9M9FF62RHYUDmeHisbxvxj+Wd?=
 =?us-ascii?Q?RQgfzsppuLFn0rqxAsLqbDEnoo1HXjFPeUaTsTZdokoOKmuAqusNPQeueTOp?=
 =?us-ascii?Q?hjZAeQyBi4ZI/u7p+9HDDk+aHW3qnZZlFfZUqRoRkaGHa6IgoDfJWKFRqkZ2?=
 =?us-ascii?Q?x+Stv/y2QxgkobSA0zhfZEf5SP62td/NpTkFcG6ay23oiKqevuQV/lWMWijM?=
 =?us-ascii?Q?hf+980ClkyBg9h5sACPB9k/GJrIUfp0i+3Yv3qqj41a4ZmlPUWkhvTWE58ui?=
 =?us-ascii?Q?rzKNyXpRrbSXtzVrrunwTYecwX5uuICtxmbGSoZuXPzRks9QgXuiAO6Bz9oK?=
 =?us-ascii?Q?KIJaYhx4HAtnIkfgRp7qrUxtWQ+T1RackPrJhRK6Oz08yF9b32Mqyq6RZXTc?=
 =?us-ascii?Q?o2Mg1F2Obus/iOq13RvJFRhDz14ZqJxYrrSvaGpWfwNNK7ultoZTR+pXSJf4?=
 =?us-ascii?Q?pqBm0mc+95mv5JfVJLe6ZkDXTWG56jPIgE7WNYw7TM+EX0x3UaOG6hOKVzpn?=
 =?us-ascii?Q?fZwYP8/um3cKQJDPIen2hEqpl4RuOu+iDRXaAMMEtQpiPWHKC63Dd63GHv1V?=
 =?us-ascii?Q?7yMpI/8aykzS2lwCcpsZZfOy2jhbJgcOl8wMmWXmWTZmFCCTrGaY9EU7YNIP?=
 =?us-ascii?Q?iSxF+T4+LdnPW17xTaCeLH9KcGRsvRdAT7pl8U0SA0ArY4lxdr2HucmKAhaW?=
 =?us-ascii?Q?09T0r8paHhWVorG+yYCyingzUGZmWPqpJfJaLwz+i3MjRgc6q86RV/Fc6q7i?=
 =?us-ascii?Q?0V2Pk2vACy8GQoLaYU3zsKcZphzbJQ3mUiWssr2+C0v+K3DQBn49pnAb/hwl?=
 =?us-ascii?Q?2ECsF6NMoKe5ybD9eWnQIXVkDbxC2JC80QerBnfONeTjUF43mpT60S2ELsnA?=
 =?us-ascii?Q?HGU4wIsorZEh2EgoXE1mbkQZu1GorK4CfQDZguROYz+GtnDT+z4o0osvrurG?=
 =?us-ascii?Q?gzHGMlwLFGQGB5d+MlnjpyQoV+wNbPFn5Nw9DuhOMICGG2swtXSjRmVEqunc?=
 =?us-ascii?Q?itKZCV2Oh7sg2TM+J1t+gyqPDI9allu2xudAi5LxTI/qkkE9XFZmECd1gdnn?=
 =?us-ascii?Q?sFj5Hk5zVBRmetrIEUrqgurJF7Pp5q6SWaNQAjMiMlhLbrR0QyR9Gszmhkhz?=
 =?us-ascii?Q?hRnjIHynY+PlcSRm+2dzq+Gl5Xoo4kJ/KW5ZIeZpfE/hrEBTPuRAGU9LIOT0?=
 =?us-ascii?Q?snAKaRHrDBY764bG28/4qNWXbfxF6tKE2qFGYGZCPp1oqhlwl+SBsfJBvkD2?=
 =?us-ascii?Q?sUzvuOhQGHz9sQ0keXM2CIJ04kzjn/wHGhwo2np0ahvO0ZTPjD/BFWSwZ4xJ?=
 =?us-ascii?Q?llIgztVJKgWFBqI53E0MTaN5DuWafjyYTd+i1MQZYlThR7NNZ0wCO4iy4PXy?=
 =?us-ascii?Q?nIGTT9UkEVIHo33cbqjfCCGYddDJYNYybZISUXAeFrBsXiDb1AKXhxR7GyYa?=
 =?us-ascii?Q?vBslQsV8p0psxMoqnImABQ9/D1+Z1ERlqFgOQ+T8ZGMkpcuorusEruPvNpdC?=
 =?us-ascii?Q?SQSppSORigTjWsbf80XcPCw6qsa9gc137bl9dRJ7/Sdk6Eqm8oOq0ImUhu8I?=
 =?us-ascii?Q?eLxs70Fhe1aSoa8YFBe3lu9ckFCAk8ley0b5jIDgiKmCsfPXKTb2rd9cjAq5?=
 =?us-ascii?Q?TYeHe4gbpPAZlX2C5//fzvc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41565bc-844d-487e-c52e-08dc90bb3d33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:55:04.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqAjbFVmcAg6wfyoBXelqdNUVlgnqIhZopy1j6kX8GKkoT+ZI7Br6h8E9LPXE6XaylRubUNzKxJZAuOH5sT1xzAKqePfmPMI7okD01zlgqmoon1RBY1MkdZtTuiooACC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5909


Hi Mark

> > > This doesn't apply against current code, please check and resend (it's
> > > simple-card and audio-graph-card2 that conflict).
> 
> > Ah, I guess you used "v5 original" patch-set.
> > "v5 resend" patch-set or today's "v6" patch-set should be OK.
> 
> Oh, if you mark something as a resend then it sounds like it should be
> exactly the same as it was before, if you've rebased you should increase
> the version number.

Thanks, I learned it this time. Will do since next time.
And now I could understand the reason that sometime maintainer get strange
conflict which I don't have :)


Thank you for your help !!
Best regards
---
Kuninori Morimoto

