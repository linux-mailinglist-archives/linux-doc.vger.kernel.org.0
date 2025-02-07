Return-Path: <linux-doc+bounces-37324-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E0A2BAFA
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 07:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC2C164F90
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 06:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2389815383D;
	Fri,  7 Feb 2025 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="tiXbmEZd"
X-Original-To: linux-doc@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013065.outbound.protection.outlook.com [40.107.44.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195CAD26D;
	Fri,  7 Feb 2025 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908177; cv=fail; b=G8L6IqUJLkL+9XaR11fR7GT6o3xeovXT6Q24e8EMKncjDsQluIFj/AitJECPiq2Da1YkrTicq7A2kMWJGg+TBR5SNVtLhRcuszNcgljV2c/W15k3E4NHuWgdcFON0gQRNGZou8opaVX5UoFdrSkO9hvcAn1DOE3ivBrTsCoA5c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908177; c=relaxed/simple;
	bh=D1PrQ7yLFvw2HqJPo21pkgrlY+cmYg3Gcd+pkCFRPMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NwE1EZ3HLY4n477FX2cv57U/O+6mPVyvveX47uKTuYe7IQc3HgbTP/V2Iyx7Du5Po1+lAvq5fwqL6TWwIU5+0I2Srl7A9gKmMjTZTt2KrDkSnlUJACauynzqyRwgVcGaNGUhRcmeApd6M6NodR/5R2xGnHqo3rZAD9nhxe2KZVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=tiXbmEZd; arc=fail smtp.client-ip=40.107.44.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6QRoP1C7/I5TkyGztW79vQGYWpU9FcP/vGmQa5iGjaIgfv+qJmYtPBXfwhRZFB5TW3ms38uCxyR3I4hV0OnnjXacsAY/q4Olr3vTBCanCjYSaScvQi/+NUrjdqJyA0yuUZ9P+p/OZZ19vV1Rm6Ow4TZpYa/ss5djfeHw21T3mjXLXK94EzuhhFjQLz6Vwpo/HAmTDAIhpJXB6pIrpF+ih/lHo/R+NlPoh3UriDygCXaW+r7nhikXd4rmq+8sYVuFqIBuTl5fbYFWQWuv72ZF/ubsDzwHo8OSvYZIO+XiEYO8eclOXDQDprCeHX3ZkUao+5dWtjdkTnPmonH8ukPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1PrQ7yLFvw2HqJPo21pkgrlY+cmYg3Gcd+pkCFRPMc=;
 b=b73tpuL3e7eziT+7Wh/o4QCW/K28ygAHnBfRTJDaoRQT5SFJ0up25cIycbhLZveOc7sKFrMS2n9PpTK9UzDYd0cGLhRKlrDxZK0eRlB4NLoBYFgYLzi2uyqrpi0zjxF6YLIMQJcwV4ZnzGHov9/U/S8+F230SueLZBMVO5hEfNKjHIFVODe7AYBB6OfTKM5VPbsYIk998YVVCUrgc69pnXt2rIADzxfOcxn62g6mbfGrTXrTrhoyDOftfv3ZNnkwypurEHegcwwXI2CyYUrvuDO8SGUEZH3LG4dG+HYunXGa/328jwxDeQO/BrTaCGqNKQ7olpxaCquu8ZDxjv0sQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1PrQ7yLFvw2HqJPo21pkgrlY+cmYg3Gcd+pkCFRPMc=;
 b=tiXbmEZdidfXBWqfalMcIO6OLrrCvZDWjSS+PAaMujOEDe73IxE31bcG0fk9zwb2t7J/i4nBDuXs7qtMq46Z/+NCS0zmYPTIgYnzv2nhVbjLSVeihGfpDzxGqI/ZT0FkXYlHp3MGM/+umk4L7NLphJEb1LS7s17dVlRfv30b9s+CzMtQLLKtN+YnouAiyqw6lWhtxOPxQPPOL5BiwfYdYtEZ77VoSO0iTanvKJIZokLmhPDtX5/dFIS32nBUTcTIirwLf1V9xpqRJ8tEaMRSKFuStlLXubAAmrajageY0jP0bSnviwKCEzdR5gvH5jGQYZT+35ZIz8q39tv/3mixEg==
Received: from KL1PR0401MB5438.apcprd04.prod.outlook.com
 (2603:1096:820:a1::13) by PUZPR04MB6247.apcprd04.prod.outlook.com
 (2603:1096:301:eb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:02:48 +0000
Received: from KL1PR0401MB5438.apcprd04.prod.outlook.com
 ([fe80::83d8:cdd3:3cf1:1894]) by KL1PR0401MB5438.apcprd04.prod.outlook.com
 ([fe80::83d8:cdd3:3cf1:1894%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:02:48 +0000
From: Rush Chen/WYHQ/Wiwynn <Rush_Chen@wiwynn.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, Guenter
 Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
	<corbet@lwn.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH linux dev-6.6] A backport request for SY24655 driver in
 INA2XX driver for Linux kernel 6.6.
Thread-Topic: [PATCH linux dev-6.6] A backport request for SY24655 driver in
 INA2XX driver for Linux kernel 6.6.
Thread-Index: AQHbeERPFBil6W2lEUy1d8cW+RQFHLM68rWAgABgWCA=
Date: Fri, 7 Feb 2025 06:02:47 +0000
Message-ID:
 <KL1PR0401MB5438C48629014167A5BE3957E6F12@KL1PR0401MB5438.apcprd04.prod.outlook.com>
References: <20250206030747.268165-1-rush_chen@wiwynn.com>
 <9f0447151e6574d74e7fa9cbbb50d8e970059273.camel@codeconstruct.com.au>
In-Reply-To:
 <9f0447151e6574d74e7fa9cbbb50d8e970059273.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB5438:EE_|PUZPR04MB6247:EE_
x-ms-office365-filtering-correlation-id: faa6f4b5-e886-43d3-089e-08dd473d0c39
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yI78m/8WAyWW4031FFkuLGSKSTY3cxpE+yQkpOBZCY6Adnrd+PK4yaXVh6lo?=
 =?us-ascii?Q?DVfemGKQNVTHmSb0ktO8W544FbUa77DQrqhamJVKVgq2SRTD69iDdxtkx/n0?=
 =?us-ascii?Q?a3qESWAkyMmPxxNroUQuHI0QZ32lOBciJQLm6m1WkQ5bkb/VMiwJbtInKNzg?=
 =?us-ascii?Q?QJGPOOy+Nw6pnVWFIRRIphXbS6EFsPFpcaYSDUeldCPUIjvD6sFRGAsk+Ksk?=
 =?us-ascii?Q?PwyrCfxzteHTEECwSIX0IrodUgPPen6J1Iu41ThBtETOQGS+v6vqeZ81fl5B?=
 =?us-ascii?Q?Gh8BuDEalnjujX6PV+KpGpKn1uN2jFiMkfcFtLB6m340yDshSJzAVjJAokwl?=
 =?us-ascii?Q?U7qh2n1b+4teuoFqYPL41fxI1EvDuCYg1xVKb7RKDLyx+s/b+hyEv8HnwMya?=
 =?us-ascii?Q?H/jB0a8fpGsHiZRiKJuYuurtJQpXtmhEx0VfuGuuCz54TF0pmrlf7+YpCP1X?=
 =?us-ascii?Q?pVBs1ToFT9hv/BplZErVWNpsAs9ZvF6WW96Qv+bV0YLMq6GKaCdD5Pab2hU2?=
 =?us-ascii?Q?fMDKKy7d+h2gi2X8RPWl2MBHA7pNrYOfYsbVEqcVbXc52LmDQY5flrrIizs8?=
 =?us-ascii?Q?cEamq5/dGW+3uZcyjVTiggitxtmaSST08bWj9KAtOJjAc+pwRg/ZPtATN285?=
 =?us-ascii?Q?Ev3sefZJdG7vOBavKOY9+yxELzvhplE7XzaGQDyanPnj1cK4eHYCG9CQiNfl?=
 =?us-ascii?Q?Vhs8E3TKxSR3uhzpWI+9VPkhL2Qaptc7gZ7PL4Ltw+C5lG9Ng0CKgXFkqU/H?=
 =?us-ascii?Q?Z+BdFkv+9XA0OxNeV1gVz+RmOAC1AYr2pyW5xlC2pMyEMD2DqJJKlymDlrfs?=
 =?us-ascii?Q?O11z2qZRtEdksg70bFQ3n7qDS/VgDEdb/ikDZ5mcyFsMJTwMbZuKDjJJ6TbW?=
 =?us-ascii?Q?UU+70LtifE8vlRsJpocupqnIrTPLSglQdW7vR7ZURfGf34dIfdp8659oOq0y?=
 =?us-ascii?Q?pkHuuG3D2oC/zONxK4CDf2HUlSp5zKcXXSeab4AupMTV1oeAedLA+J99tsNl?=
 =?us-ascii?Q?cqyz/ZVToSW52pAcOSiU1GuT00ljnPtk79ZGLccnK7scwvKCo91+4y/TV5aG?=
 =?us-ascii?Q?E6OMcAbbpCBSfjRCz2MS20yWHr1iyc01r6ecHfkU+v6L+49xOaLAAhkzc/lt?=
 =?us-ascii?Q?hcatTz2Ryev5PD+BdHjCw0S/o1CSk6/lqOuT2ABKprhWXS70WZxxiLmYSV+n?=
 =?us-ascii?Q?RkX/+H29UaQWchxAuRuMZCH+h/liziWAJXO9ixl4GrpAo5HhjuwNltGtIwXd?=
 =?us-ascii?Q?GJOda/7J/+NU1ZNqbaGLYxNw189qZJIle7ndLoBpu+n6b7u0wOeGXmJh9616?=
 =?us-ascii?Q?r0ORD1QwvfrOMreJQ/+WxpG6av1vXKddnQSX/4B7U6BRQavHVanCA8py8ocO?=
 =?us-ascii?Q?apfnbrVjjO19Q7z6nnUBtxp88BD+cb8ah0N81AOmvh9t1K+6aQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB5438.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/jAfS5h/TXv9EXr3ceFMPLLisHRFaQFFNy9CT8tajfZQ8kzZir2/oe9kzrMM?=
 =?us-ascii?Q?GZN8+Nwqol6t6MMPrkhqfhrds/igpwW+DX4z7gukpdk06qlKKgzbSJt4zBA1?=
 =?us-ascii?Q?CP3sYrXdiOKW9RakEskW0AvFwAvRQqpMHBSYB9xqk4IHR9lv5gEB4aziPKEg?=
 =?us-ascii?Q?CVC76jm85DzG2xPOiMBzDp+ENY1vLKyvHNBu3gFmOWgvfXbXiy7XPxenqOMX?=
 =?us-ascii?Q?aOAh1WfRTeOfD/Kf6fiSsRpnMHClhUuXrZx9wRyQUB0YhcwLEcEqiIoDqn7J?=
 =?us-ascii?Q?cKjePMapTExAVrowrRsPQTYYo2A6E/8mBrqmpPsXIkrkM4aT9PxoOFOFTpUy?=
 =?us-ascii?Q?FQgvLSSvUKvE97J74ue25sDLUz5D2JM2wR1cJwCUKgGkaL5iTTTqUZe6bpLJ?=
 =?us-ascii?Q?S+QU9zKjZNl8X9ME4k6n2uv2hz/wELo7TBDm36e/acgxxkgS2P/wgw8l+YPG?=
 =?us-ascii?Q?Vj/XJWogputrQzgBufHFfzw51x5Ws+aSrw4/UXJY3e15DgoS0xbIADXKMVX0?=
 =?us-ascii?Q?iKEjJfuFB6/KcpzuayfK08muGqMR6QBqzBjtoFVaFr6awOHY7YY7ecSjumx0?=
 =?us-ascii?Q?51Qahov052idR/VmqE/NLRLaO6z2y8fpoWISEIyLQ7HGiiKrT1Y9j6X+rw5t?=
 =?us-ascii?Q?1C46N2ji5uEVLSRubcGLB1tVQRvEQyPtF1qqQZvCeY9vVbsKyIveAELVd2R3?=
 =?us-ascii?Q?ml/ax5sdZTfOKdpauOOsvLevnpA0i+PGOrh7NdDGL3USmvlysKOrS3ZJk5yM?=
 =?us-ascii?Q?/0Kiv3BxeFiZj+bdYHdphQiBE65Rd3KYR10n9bARVpFLm1+OyC/dAlhSJWcy?=
 =?us-ascii?Q?QzZFlKDHMVJAeU2K0n2ZdIKGbu6dxkMiOu07nmpzJFJBjkW7oLK3CO8Jiypu?=
 =?us-ascii?Q?aJqC78luscEEN+szxS6pmOPOh+bcKFYxB7XRV+S0GzQS+9sOY0Cv7nbeeyY7?=
 =?us-ascii?Q?K3NV3byNio0Qixx8hAYpl/jZMorHpj/8WenesDfgMGt5J0AZILOzAE7HqY0M?=
 =?us-ascii?Q?nkVmdlmQt1P3Y63ZP/pMWeuU2FXZjVnlfuWmjf94Yd7Zu6DNGctN5mfFDWRW?=
 =?us-ascii?Q?wlVPFyWhsYMH6oXpc9lEz9Kcla+e0Iq6Zm9fKjhGEoJCNuKf7JlDyFNkCMez?=
 =?us-ascii?Q?KKlY7FaZr5CYFHNQF1T9tPQYPv9lwTZFqxTtWNsGLVE2GX80ptRo2bC1idTX?=
 =?us-ascii?Q?Y40zREO4qlq6T21XPFvYa9EJTvITzuLXWEQPgFn3xHYfYdwIHnMEd2hXjyxJ?=
 =?us-ascii?Q?wF22IjKuHtX5rcaTXviMW7B/Gy/buh4HSjr4tz7r65ZCpIl712ODa2JZZf2N?=
 =?us-ascii?Q?YpxTgpB+fr52uP3CQHgl91O1F00GTZ1ImRs1Vz+S/0b+P/z62hrUTlN+W6LO?=
 =?us-ascii?Q?vh3Vkdrl3mT8RDsZVLsjW3YxL9T4Bz9ZNUKEj/Xmj6kqOJdiP6CiAMfjSxfo?=
 =?us-ascii?Q?9dSIDlP4DFMMfnTtz4gHqXvMkJH9fqxoFRDfYoNifcyml831RGF0GDUjV6m0?=
 =?us-ascii?Q?KrfGgHoOvhJGp/9/xg40uMnW65Xh4fM4ZdZSwd6aKgF9GuigXExnpWNJJ528?=
 =?us-ascii?Q?jjMhMFM7rTubWk9cq+fO1YVnSEUaCPvjF1xO4Sio?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB5438.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa6f4b5-e886-43d3-089e-08dd473d0c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:02:47.9891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3nvLMkLu+aRDUe4yZiYoRlK2mKZ4To6vXM9AbV2ZV51V8DoQntOzxGWF+kfL1e3Hp2pX7akZYNeCo7I0BEfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6247

Hi Andrew,

Thanks for your reply.
I will resend an email to the relevant.
If there is still any problem, please let me know.
Thank you.

Rush

-----Original Message-----
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Sent: Friday, February 7, 2025 7:48 AM
To: Rush Chen/WYHQ/Wiwynn <Rush_Chen@wiwynn.com>; openbmc@lists.ozlabs.org;=
 andrew@aj.id.au; Guenter Roeck <linux@roeck-us.net>; Jean Delvare <jdelvar=
e@suse.com>; Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vg=
er.kernel.org
Subject: Re: [PATCH linux dev-6.6] A backport request for SY24655 driver in=
 INA2XX driver for Linux kernel 6.6.

[You don't often get email from andrew@codeconstruct.com.au. Learn why this=
 is important at https://aka.ms/LearnAboutSenderIdentification ]

 [External Sender]

Hi Rush,

On Thu, 2025-02-06 at 11:07 +0800, Rush Chen wrote:
> From: Rush Chen <Rush_Chen@wiwynn.com>
>
> Summary:
> The driver SY24655 has been supported by INA2XX driver, since Linux
> kernel version 6.13.
>
> Issue a backport request to Linux kernel 6.6.
>
> Signed-off-by: Rush Chen <Rush_Chen@wiwynn.com>

From the way you've structured the subject prefix I expect you are asking f=
or this to be applied to OpenBMC's kernel fork (openbmc/linux).

If that's the case, this patch has no business bothering upstream maintaine=
rs (Guenter, Jean, Jonathan) or the upstream mailing lists (linux-hwmon@, l=
inux-kernel@, linux-doc@). The only people this should be sent to are mysel=
f and Joel, and the only list it should be sent to is openbmc@.

If you send a backport patch for openbmc/linux and are using `git send- ema=
il` to do so, then in nearly all cases you should use the `-- suppress-cc=
=3Dall` option to make sure upstream maintainers and lists are _not_ automa=
tically copied on the mail.

However, if you wish this change to be back-ported to an _upstream_ stable =
tree (e.g. the v6.6 series), please _first_ familiarise yourself with the s=
table tree rules, satisfy yourself that the change meets all the requiremen=
ts and constraints, and only then follow one of the documented processes:

https://docs.kernel.org/process/stable-kernel-rules.html#stable-kernel-rule=
s

If you have any questions do follow up with myself, Joel and the OpenBMC ma=
iling list, but make sure to exclude the upstream maintainers and lists for=
 now.

Thanks,

Andrew
WIWYNN PROPRIETARY
This email (and any attachments) contains proprietary or confidential infor=
mation and is for the sole use of its intended recipient. Any unauthorized =
review, use, copying or distribution of this email or the content of this e=
mail is strictly prohibited. If you are not the intended recipient, please =
notify the sender and delete this email immediately.

