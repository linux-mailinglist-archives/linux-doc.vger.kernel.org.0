Return-Path: <linux-doc+bounces-14496-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA08A91D2
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 06:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91940282AE9
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 04:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41CE54676;
	Thu, 18 Apr 2024 04:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BQFUmqLW"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2081.outbound.protection.outlook.com [40.107.113.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77254679;
	Thu, 18 Apr 2024 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413636; cv=fail; b=rt857NWIXc3RsvrBTb3SbU1DaBXAjeHZO2e+HqkmRkbR/A6jvIMQV1j7R38YUhMyBaT46Vl0qugM21zUz/E2MWtlacW31on5J8WDL1QK9hBNKfkLPM3XgC2fHbP0mDPEED/cG6Mv6MZF1PidaephNZrgw88zbGML876I6RF0vBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413636; c=relaxed/simple;
	bh=gZqf9EppjTHPP4Ow84DWp/oDn9+B9H3x9KrdENjiYkk=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=JaKjIw811k55oIlVjR6GsI4eaWoNoDY1IYko8ktwu2hPBSlUoiXEC8ZEgY41vbuM04tryKPcV9fSh0W04aySe0fVw/IlAS8G1xJF4Fboh2z1sjXhVujEeIZjZmDcEgnyftGq7oCrqWUqDm4NliYHhJ469DtB0G6wGFDO4u1i4i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BQFUmqLW; arc=fail smtp.client-ip=40.107.113.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaJhYpuKvqucyIZbrekoVlhzUlDpXxW27ZkcXjplxkb3e8zHSCXhBE9xdSwmjd/T/4HnXbhc6nDnVvHXN1haXyxI/eFgHWhtNykxOtYIXmnl7usCjKBTvs+MzvR1r06wyP4RfsAQ51J7eeAaRi2nvulCtv0scqxt+tCjoVlhsr5/VVHj3tmS2aC6l9DOzaZf96OmmGc/WScFzDvld1tzkx56pdhRoDvk936AmhQWjogNmCREBsT705RmPhBFNi6CENOQW/rsaPG4g89ZKvgiuYraPYcLAE7IsjlGiiyZPx3Ohwwfm3XUS5WJU9xHab7oQ67lT3oF0ThF6b3G+sNwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoEicjAS+10uz/hOXN9BxUnocEqrLZpA78+Om/TJ28s=;
 b=G4rvKgilYGnkiHGvIucf6P1cFAqOdxvtWNW+YqLv8A9/9+aFjOLtO/fR4+aqGrJU+bsTY2U+T8Ge9kRoMfj31g2etvwu5ItV+n9j7PcM7Fqxekm55r5yttZlU1rk3HAgF7y00OyxEo5yZni26dlrA5eY0cOjjx2ZV1jmUkvxPG9Hhf9UNI3Q9oSwu6OxmkuDHUuSTXDFDeDNkOdpbuMc9X366o65BYv0spIzM6nTm1A5gK0YpaYaV9jEVVVOYACI2qsnoGo9qjyWvGbuqzl2HN61H+WL/GdglYXGhpYK2helDpjUmt6/FdU7Uz+Ar5NUytL+H5Cp0ckckKkfZMeW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoEicjAS+10uz/hOXN9BxUnocEqrLZpA78+Om/TJ28s=;
 b=BQFUmqLWDdD5xf5lJeePjvHZMCd9KUYZNWpREaUJPlliePwjEfoypb3u/Wv9FjqoccMq2M5MMlwA9/XarUJRkktsPlnkSf9UlI7MGjT6KGYz+AhwaKx6cuy6dbmrRF0/x6iHDX5ZmXxdz8Y6vSLSlTmUPtEroQLoA+xnFmQkt6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:13:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:13:52 +0000
Message-ID: <8734rj8fzz.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
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
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
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
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/23] ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:13:52 +0000
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4f9140-7cdc-41ab-992f-08dc5f5df509
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XIs5A3tEtUygxGXd1n3gJP8rHLKmnHwl+7inFUZqCvkHwHd/klgFtei8O0ELUCK8uA+VbzBJK5RqeRBU4ubCrSXro0dzV4nVVXOLi4nhkjcZLPHp8CLbBnW1qeFyK22eHiNvNUBNUZL4hGtOdKNG5LMYB+gjt9C4gmKykBeamxx5ZAjGwGSvYG783RISu6udBNyuJBLZxrwG+0QdSUEuOvHqIrZ80rEcrdD3aWamoYnC3mpLgNBw1XU+1gcucjq4wHTl6cHzFMHjkCLCHG53NHb/R2qgROaO2mRW1D29knuro8RGfXmta1qW3Njn1NXihn5iuMOjLemzbf7UUOmw8zVKfGTJF/FFR9QCwQT2Kz+beBgoiwKluNXBBARkTXPv+otnNuTGHjqP0sCj/Bw2GpWG0kH/HHOwX5nVj7yrUhs97vqpc7iu9LeHo7YaTZowwcoTsrdGUSsNVdRo8QzpRil86x7C4An6E91iHLbrd77oj+sP4z+iO7uTsXCPbzb3kd3Lqg5ZItGbl1v8r/BRcJJf5JP9Xoz1Ke65s0FYVAY+FvIvIaHRHAUcbCd0LGCGGMVtY8lD1crSm71X07qrXtyqB100fow/TvkhtRG/xy3zjcQlFF9gheJfcu4iTbayiexmmxleGkcFS3gNxPFvxD9BdCeaaXacXzB8DjND8pP0DHpCLoXcvg26ny87FwXXAjVft2zhZY4LhbLNuufeob6t7RMsA0abeNcjIzUAPxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yE+uQn0F4v0X0Q22MSO3eg5MeMkyA9WxU3UiRvyygl/CXVjcbwcr/oaTIvkn?=
 =?us-ascii?Q?drz4D7Llwe4rY0Bm0kPcmvWzTmUPaL5AQgeAOmuGTlU09DKQnniNvL5grCWq?=
 =?us-ascii?Q?qJ7fR6L3Kt8WEvxjNA5UaRPgPt2oOYKlCQHK3EK+g85mo7SEzH3AstnLh2Vt?=
 =?us-ascii?Q?jBvE5S+8z61v7sGH91WgCLZV3m/PAHdzJGbHJAw6888mlYab5uRsmTzPDQh6?=
 =?us-ascii?Q?WUWa1q9eyDl7PAM8bRked36Er10paMkV7ePNcNbrS5xl4ifs7w7B4/i1eGOR?=
 =?us-ascii?Q?ZyF1aamn2sLu70CPoFIRSPlxlRlviBKNWFE3QgvUx1u38ofi23VPghYNt0dF?=
 =?us-ascii?Q?rW/i8W9HB0JmGw1bzO7S8S1clF+guqd2xngn0tCpJYCfnwBXQA0o9LuWijov?=
 =?us-ascii?Q?NIeUMrTZ/DO53GpRn4wQPTGvz2ccuJP9NLUeBfmWQJxl/WG1MAA4xiyJTQ+W?=
 =?us-ascii?Q?XcsxZ9m4Ssq0+mKG4w0PsJOUsg0xxMN5gquhXZLGlfmYhBSxN0+tGx9Vvgkl?=
 =?us-ascii?Q?4qb02s8bM0xkNcYPxdrirWJWnw1FwyS4hpoD96Sr+I9kVL1lt3+YYrXelLGu?=
 =?us-ascii?Q?21n40wsl7sexZrpTUvKI0XV3wcLA+vtiZ8LpAj35WJOJRiESqlSq4BjNwQru?=
 =?us-ascii?Q?lssiyc7iWqthSaEMKBvjfWSy0s7/GuaCf1RCI5DQ/nsM6ysr3ffcVSxDCDlN?=
 =?us-ascii?Q?x9sfIevrFf2E37N9CJNFszl1GWOGv14Cx+xfDP/JsrNsdF2ANKzQJlzBuecq?=
 =?us-ascii?Q?dLa2K3U9oJu1W5wnUJc9tipvFenEni7b+vIk50uDEA7TtIlYfJ913jpIAH7s?=
 =?us-ascii?Q?TFr/9mlzpmxACufdxhgOh5pHKDcJGWyjS5dfxy5NL8/uHFMFKzzfGZ+VFq4s?=
 =?us-ascii?Q?xYSdAxyNKb0v15a31DZcx4B6c2ZeqtmFSUddJDo0GcWpqkZC5D1/tkUeZDfG?=
 =?us-ascii?Q?ZEMV1C6EPauA2IWiZm6AGV+dCvlX7O4R27ZqUKfyP3FUEABCdZ+/yoHCnHVZ?=
 =?us-ascii?Q?OZxoPPJoRi7H1OA0/0OxLoVjUNOmusVP8reltGekxtzHrzO+UuPC68/uRp36?=
 =?us-ascii?Q?aPuTYTlMIWwWiADTHHmDFXMBBXOZMkYLBbsemh6pZgvGTwRsSIS8ogYJeekw?=
 =?us-ascii?Q?YA6AS7faynSAdi/pmkuRI5qpA83q0oXalN2TPhQFSbFolKsvEXbLrTxDVDM5?=
 =?us-ascii?Q?7QTzDTfeaP00/myTR2K2WuhZVGJ4lL4uFGsRpVnPHI0TWn8ZWFBYA0vm9dee?=
 =?us-ascii?Q?jPEqZxsK4MbH1lewiXtUfkTd36jtfeUWeoj9diwS8o6wuug/5ai0y0JcV31k?=
 =?us-ascii?Q?rUT7LyeOnKODLaRbs5GGOlxQE3v+YVycmH3bF47QmpfXyrpckLY+htArke/c?=
 =?us-ascii?Q?veSKovbaFTOpgwj9B7HGxN/O1/ALhfx6OGFnyhCN5FJJ/H370C8k2lzQmGlK?=
 =?us-ascii?Q?BUVNmNdr4oYyjZ+DkTN1iHu6Oudb3whJFNVYe/NZ3LoX3o+QDJYF3ZtalKWc?=
 =?us-ascii?Q?t2192taayu357YMhmwvjc+ZGbvdDwPNnR14fqvlqs7WkZ0iuEhepbFHzIhe2?=
 =?us-ascii?Q?vQbWORdE3Qh5KzTLQwBlVBMNUUzAX3odG8INGZBXuq3hqI+afqHrp5cAPlK8?=
 =?us-ascii?Q?lGdv7WWoCmIUf9T+daRqkQQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4f9140-7cdc-41ab-992f-08dc5f5df509
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:13:52.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60a+B9/i9PsQ7JRYNDMSfH7Zgnvp5JzsO4EuKoCRNgSJCeqbzIE5eHl9E3OPz81kiOMC9mELbOHM4QfCoY8xBzP4GdKqNxaDH+tbyIsszjRdNzQBwdeDGwK0ly+lVc3F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts dpcm_xxx flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3ab6626ad680..6667f34e875a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2003,20 +2003,20 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 			if (!dai_link->no_pcm) {
 				dai_link->no_pcm = 1;
 
-				if (dai_link->dpcm_playback)
+				if (dai_link->playback_assertion)
 					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
+						 "invalid configuration, dailink %s has flags no_pcm=0 and playback_assertion=1\n",
 						 dai_link->name);
-				if (dai_link->dpcm_capture)
+				if (dai_link->capture_assertion)
 					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
+						 "invalid configuration, dailink %s has flags no_pcm=0 and capture_assertion=1\n",
 						 dai_link->name);
 
 				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
+				if (!(dai_link->playback_assertion ||
+				      dai_link->capture_assertion)) {
+					dai_link->playback_assertion = !dai_link->capture_only;
+					dai_link->capture_assertion = !dai_link->playback_only;
 				}
 			}
 
-- 
2.25.1


