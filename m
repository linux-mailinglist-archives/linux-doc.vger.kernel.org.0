Return-Path: <linux-doc+bounces-16267-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884428C3988
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 02:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE33FB2098B
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 00:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36760368;
	Mon, 13 May 2024 00:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C4BBlA49"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2085.outbound.protection.outlook.com [40.107.114.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422217E;
	Mon, 13 May 2024 00:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715559090; cv=fail; b=RKP9g3F7UY4Dil9fJV8u0P1UUbOIyby+5sFS1pm2A+IYyAAFgyI74GSXKe9UX9IlEFX4SHC6LUZob9QHIwewQ9oNGvnFFIGNN65EJQwHuE1vBwdd6Vkv+Fpvy9wssR9h4YoonIJ5r+xl0BEe5gpP8KqhOq2a1qAFefAH7WsdrAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715559090; c=relaxed/simple;
	bh=eVxcQtLkImm7A/Ymi0UKXVh57KZEZCYP+40rl0ryttE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ClVfssX2QOURyIvJK3kqs1XXN6A8VAs2XzUpOlXkwEgmO2DT9JT/4CHy1ufpKnNC8C6iH0HjzEXHO+LvoZGyDxeRrQ1Z0Z7F52kjw8kv5FvxpLUedAet9yN8eoT0kQsmY3Q8Xoxia5NMwfnMjfJYKk4xC1im/EIx4Xp2SSYwx7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C4BBlA49; arc=fail smtp.client-ip=40.107.114.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGF9B3bKTyGDi1XnjECZ5kXEMXyJqQIj8xuIE6jmpUUTKPPnnZ/eLr4FwpQJ1WLQsP/lFb/kZGnE+BuYPDSt2toUIiOI7ipfOzEJPpPpCnC8LEO/FI+Lvf+vhdIvKXXb5RaIk0MbaxWEpOdUfbJCyIFJJ4WoOQ5rszJzA5WBmrdL/brD2aVtc+D9aHw0TnCMhzvBEkdHmn1xV+loX7/rtcbty46CbcwzEgt7E0OlK9JSNNNAeO8t7nxOO1yADxzXoZthendaE8gn5giM8PjNguwPEeXEsjzhE9mC99pblpniy6LQi1n6M+ICcK2fYPS+WgatuaA8UFYvZDCB2NFn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5iWd4d1Fy78CjS+zPylrfjZ1kac1GoR/o72tpzDLfw=;
 b=BgqME8gU5iF8ELpQxuDYf5lUdhGFerOgwWu1v2LvQxwZH9M/83PN1E3tZFwkuuguO+xXQmVBZg9VPoKe0ibCG4tr8JPeCFTXbPlzV8v5j1CaaWl4P2+AiRyuO66lpF9f9C9BY+9lCSniOdgvnPaPwOdeS5SkZ/Nr0S8d5KMym9+HemWbN9IdPlLQIhsGTYf4EJzPhvD++NHY8Nxe6n1IJ7KAw5ouW/XzPuKac5OlcXgYoEgBYBMCeKo4WscTxcxh1MzhYOn7YDmVg4QyPxdL5RC9612zSPhXLkTrLEUYRKrVGn3yok94NyYxWmzuVHxTgfLXDuvS1jDi+7chHZrbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5iWd4d1Fy78CjS+zPylrfjZ1kac1GoR/o72tpzDLfw=;
 b=C4BBlA49UabNkK5abNHv8vWz0rWJ1ec8A1RXpj3556JJcWAgb59/Y6BjR+Ux8zVT8HghdCGubi3LC9g92ggFjXYyCr7KW4bIMvvGvbYKPSBpsxcgqikAysbxY95szBcPYZ7h1QV3MR/YhDCMRLyihN7236k1JBau/2WgEVuoEd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7285.jpnprd01.prod.outlook.com
 (2603:1096:604:14b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:11:19 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:11:19 +0000
Message-ID: <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent 
   Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jiawei Wang <me@jwang.link>,	Jonathan  Corbet <corbet@lwn.net>,	Kai  
 Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,	Matthias  
 Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
	<1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
	<87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
	<87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
	<1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
	<878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
	<1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 00:11:18 +0000
X-ClientProxiedBy: TYAPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:404:28::29) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: c0014a64-ad7c-4ad6-02dd-08dc72e1371c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|52116005|7416005|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4SGEz8OdIwwOflmlloQGN42tHwkIjgSoH9GCCDAj3Ag6BqrAmx4b2Srg+JEm?=
 =?us-ascii?Q?8RiIMi/C4Wv0OKP0pY9s2SUfTr7FSbfIE+PQF0MOh+J5ISxcPN/Bl+WlOunT?=
 =?us-ascii?Q?gHs3MMGQpn5c1J39nHB+CXZzJrQakj6zpvdvSYrzSb42+Y6f7Etqd43L3yP1?=
 =?us-ascii?Q?VTeDAuxX/S7/6cpP3WVD6F4Ge/NSXR0dT2fRyJ4jQOibLPGas0HKeXYLxJcP?=
 =?us-ascii?Q?tvUQLFg3Ed0R2m7nI2+bmW0YHFG9bbfoUKk2MqwCyA/kClWNTXX8FMRcDi4r?=
 =?us-ascii?Q?xcuhQgV9suFDMvIBsYk0mbq+/PYF2R9ahMHYn8KsgAyMBHPXtV143lgxVVqC?=
 =?us-ascii?Q?RGe1CRKJfqBcU2jz4Hwd2qIIlMbSnfkuq+S/IeC5prwgQHQXnhrQN5gaFpwT?=
 =?us-ascii?Q?j4Br1nzoV2nkKvO+BLepKVsR6OjJRsRUXDPy3I+oAw0But5qBiw/BRVl1qMO?=
 =?us-ascii?Q?URA3nB9GUdkeEGm2yUMROwjrcmTh0prRDLebhBx6HCM+lkSeS9/wcHLrmpNe?=
 =?us-ascii?Q?Lb/Q5ZAslTGfQML3p23jFdFgilb9rQtEVtGBqTa6Du/KOm4ZNiKrqbvYDxo6?=
 =?us-ascii?Q?36niTqtk7a1UoBApLnX0FH2NXohslvU0+BLa02FywNKzs2y3EJH8LSdgCPWh?=
 =?us-ascii?Q?pwRKkV0N6ezVRyC3wkjffXOeqkhS4ab+riJD4UnKeAgf/D3ZUVGeHyZo9xfb?=
 =?us-ascii?Q?T87fL2utGayqm4EuudFGDpFBwBbCJA87MFcPBvfYwVDbLv2+XkfYYpr431r1?=
 =?us-ascii?Q?erwXQpwcDCBSFpbp7mGLwEm2pzKziz8QDmOp5PmEbAYlfuE8/UHDz35cLJMe?=
 =?us-ascii?Q?H9s+kryDi0b+M+BgrN0tftyCBdbwMSNDpA/9LNm5KKGrZMKG/TpN11hxVgMh?=
 =?us-ascii?Q?NHfYXaH5T0IN/8UpcDxfNk+iwP23WaU1LgdrSojJEHmSpYSbgbPwApEo4vq3?=
 =?us-ascii?Q?lbeJEBocEr3dteviSYU3nyIH7Z9UIugU2CaNUqHdybOahPQriPHReB/qZ3g9?=
 =?us-ascii?Q?YgAfXREJfDn+idyupWiRNntl0B3dzHOHgJl0KmrDUV3Dfw0tf6yynFjw9sJK?=
 =?us-ascii?Q?HVXg5sYftJ86OcqTUdsGu5BovP/Io8JLpjRbLw2ComDuxnUWhrvcs0pdwXLQ?=
 =?us-ascii?Q?l4vOf8814b4++tmSf7Ht4un+5xlnDhkVbVlRAgL/BMiEWC42v2Ri50CV5Jqe?=
 =?us-ascii?Q?oHLQRGDtdwDo5jwCygfjtliIXAuwzFPxGu7ol7N6iXXPvRdpWTOhLf63cZYs?=
 =?us-ascii?Q?TgISwQDibwBiV4RcS4Kwp3oh3ENRJUFIJj1w3TDffg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dfQ2za+zaHpVnKz4Od74lCWuujfcidrMt1xK80OAFIO+TtErj6/qIJxD7SXT?=
 =?us-ascii?Q?Kii6v555PjEY5rYm2+gm4LPNgQIfwavww1zK34tGX8n5oCnkc8NPlm4sl+xt?=
 =?us-ascii?Q?Y2Wv7UBB6uNAIILYhGyk5Goa2X4x/h72Z3wH31F2opmIuPERr/BebzKcKikT?=
 =?us-ascii?Q?n6vTM/Ko7k8yR2kWs4K2Butb4g5Z57CM5AZlv+H4+m6ct8b9E4hlnifknzss?=
 =?us-ascii?Q?6HW6AMXkDSO6pe/mTj7CAnWp28veZltbAa1UW+zJSfclYeeT+QPWml5tQral?=
 =?us-ascii?Q?WxT3MZnzDHJ9ojmI5G4drOhDQP5lwPilVBVsO6n2UZpovqTJjOmx5JpNWG4I?=
 =?us-ascii?Q?mLq4lKwpSHwAFdlbCzv8GhkpWEYJa0HQq56K77hbn/vZC3jNpB1SPH/rnMcg?=
 =?us-ascii?Q?oBrzwe8MLNEe1J5WdeBM/VwVe+UOSakZK8ou76LQwfzYdA+XLDzj3uK8eSrt?=
 =?us-ascii?Q?l0+gtyBMG3zICh5V39q2QEEIwsg4kp1EhrYx6HVddUmlj+/8wmCUzOlePuek?=
 =?us-ascii?Q?PwrYCpGSs3O27HpXUfRABNsasLaZsTRXmJXeRUyQ2P0GqAU/qDIyR+OAvpPN?=
 =?us-ascii?Q?giqXHSrkZN7pfY8oExfAerGmEeG6tj3Z0+aW4HXczN/e6WaUw8rNygGNhiqL?=
 =?us-ascii?Q?MQhDo8UoDor5aUL5G8crmtWSacyPrYrQHv+wil7wVqTcaSz9sBZiTEaYi+Io?=
 =?us-ascii?Q?Tec5DZEDBlQEvMWH9umLY3qS7bLqMpsqQlGqztrTle2gXQBj8JWk8bMbUdre?=
 =?us-ascii?Q?D1y5fTul6F/CUWi7XCEePS22Dw3MgMKd9hSFM9+mBF6vW66qfUBMZrM1xxE3?=
 =?us-ascii?Q?NrKe+sa1pwFkuw29uDCrgxlEeKsec49kcL635FFFl3H8H2oaB5clrMnfBQ7R?=
 =?us-ascii?Q?ze/3TcobMEUPO7QQUb9n0+QpW8BSN0Uqrg92RV3KsIOesE8wc/DbaVtzbqh3?=
 =?us-ascii?Q?wtCZwMWA7M3CG+Iij/dAA3UJZVoQ6cML/3g8pYNKvUYa/PRJvURtCjfICXV5?=
 =?us-ascii?Q?SY0ohfLULGXmmrp171cpSZNBQR5jZGhwSkPnrsrU3XsyJpOk0lVUQ6bdSRs3?=
 =?us-ascii?Q?w5SzqrPZmXMHzuKPNZml2npoQ3SVmmM/2Y6aPE0ixLaklYBLiKpilDmKMw8n?=
 =?us-ascii?Q?ElkY90qOuxbOogUzZnPOGz22TQDUkRm8QNGVh8ZV/aynj4uTP2j0ApyV6sTB?=
 =?us-ascii?Q?sZj5dePrRaumJNvnpSi/1CYGJc5WfaQQjkZVthIwTMonMEbZzbSqHJnkgY/H?=
 =?us-ascii?Q?XxlYqx+KBBfBLXs9RMrU7jfHNeT1t75S89eg2+w3TnZQdGXateRyhiW0n9S/?=
 =?us-ascii?Q?viJ+jVFY18Y2SFA3w/mC9LYCLXdjqZ4AEW8yyEjcZoQRku1AeSFbt36Ikl56?=
 =?us-ascii?Q?C3zqmve1cXHFJ+aptp7X/MS4e9ODXpWvT7eOVtrkPYoZ/pv9ANerZ6i0mzYj?=
 =?us-ascii?Q?RH7aSF9pHJPu34aOfaJhg/L3gU4qi+Lbbnyz1/FoOmonuw4pIM/L1h/ku11+?=
 =?us-ascii?Q?NTFIlxY4LDHglxX65bVHROk/+j15J/ldmkAwszOQnWKDgBsWho8hXkytjpKY?=
 =?us-ascii?Q?9c4x16R4ZxqPgvlAOOffv+pQlO/+xqVisMmydTPIzI/DwPa9Q8At6fhOWLzP?=
 =?us-ascii?Q?NZ7xWnINvu1gegtGc96QVnM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0014a64-ad7c-4ad6-02dd-08dc72e1371c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 00:11:19.8533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3XbBP7jzW4NbRo02y1f+I4ksb3AT0UrGx5SDMW4HO6IgcspVMg8AohxQg4qnC/XKyNZpGPqwwSUT4lvhYaW79Kttz7I+Uly2B2/qMSXYs7a3zIWLRiY0BGYa0hWGyZ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7285


Hi Jerome

Thank you for your feedback and analysis !

>  - 1st problem: I see that following your removal of
>    snd_soc_dai_link_set_capabilities(), the dpcm_playback/capture flags
>    are no longer properly initialised in the amlogic card drivers.
>    That will need fixing.
(snip)
> This codec is not meant to have capture channels.
> I think DT description and the card driver settings (before the removal of
> snd_soc_dai_link_set_capabilities()) are correct.

OK, I see. Thank you for your analysis.

The problem was my patch checks CPU direction vs Codec direction only,
thus, it will indicates unexpected warnings, like this case.

Thank you for finding it, I hope v2 patch should be OK for you.

> IMO, those check become too restrictive. We are adding a lot of code I'm
> not sure I understand what we stand by going so far in the
> consistency checks.
> 
> Initially those dpcm_playback/capture flag could be used to just
> forcefully disable a link direction, regardless of the CPUs or codecs present
> on the link. It was just another setting and it was not required to be consistent
> with anything. It just declared whether the direction was allowed on the
> link, or not.
> 
> It changed this commit, and the flags suddenly needed to be consistent
> with whatever was on link:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc?h=v6.9-rc7&id=b73287f0b074
> 
> I complained back then and I still don't think this change was good.
> 
> If the flags needs to consistent with what is on the link, and we have
> the ability to check it, why let card drivers set it and then complain
> about it in ASoC checks ? Why not deal with it in the framework directly ?
> 
> I think the simplest solution would to just go back to the initial
> meaning of these flags which was just the card driver declaring the
> direction allowed/disallowed on a link. Then ASoC can mix that
> information with whatever it finds with DAI drivers and figure out what
> is actually possible.
> 
> It would give a clear and separate semantic meaning to those flags
> instead something redundant with the DAI driver info.
> 
> What we have currently is not straight forward to set and check.
> It makes the code unnecessarily complicated and difficult to maintain. I
> think the difficulties with this patchset are a good illustration of
> that, unfortunately.

By this patch-set, it will be handled automatically via CPU and Codec
driver settings, Card driver will no longer need to consider about
direction (like non-DPCM), and I hope people (including you) will be
happy about that.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

