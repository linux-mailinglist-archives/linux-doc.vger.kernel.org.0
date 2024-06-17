Return-Path: <linux-doc+bounces-18674-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD990A0F9
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 02:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2ABEB20F42
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 00:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3542B20EB;
	Mon, 17 Jun 2024 00:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QcEUN4Vs"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2088.outbound.protection.outlook.com [40.107.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987033E7;
	Mon, 17 Jun 2024 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585464; cv=fail; b=D7qnyEvGJEIRkt0CcK55SvRMcbGprT6j7kF0t0PsV7Y4HnjJ6jifcpx1xLOJTpRLep+/Ql70O7ZPQ2ISClTwDTHFfSiXtSvGyy3C0eDrVkFfA08KF9oAL7wpW/l4SKmxJTIxqSogO3B51a/bYtHLzRCMVpb7/OHij/qWmcGoN3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585464; c=relaxed/simple;
	bh=B5RO6p7327DKtCZ1Iqx5LT+0U1LaPgTSoSUsM8Ty2Sw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rvQnh0RTUS70JVou0nIAvgKfiGoNByEDWAbnaepnNA7ISXpd7yHS6M/qCu7/uZYSTvkX7FmMhWk/pdOyuRWqUlSHQVG9QHq9/OL8INz7Rrd4TNWomY/mlHFtbCJFQ8Po382NEu9QDByTguqVBW1OmoG5vUdj7VVGthIJN6LvFEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QcEUN4Vs; arc=fail smtp.client-ip=40.107.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmS5ZQy4HPDqZ+Z5fp2HxsjRyRNy3Buk4YNcyzSe4PvEnmag55CWCn7fIWJHVwdEB8R1IsN7RLajofoF+iWMDEKL8rW/Bo9oi7pjMFn+YDx4mZZOKbKCZ4oYOLJ3c+7TXAjPpqNvKTDOyC5Gz/DzTZPWHwwMOUvEq+RBqwUcxxNoLc1918lgmzPKN6RzbqWIlahljlGGZvV1+e55ff0b8g9VUN9+oNkBOml/Z2pLc2RNK0FovbzV9WiZ2osk+G7zPeBziAeUfDV97p5fkne33iR1Kps/WWGKLX1jB/fxxKDIlmoUTY32hdcijRf7w221t6/7s5NTo1xvEyvzIOMtww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pUbo9QCCHlxibWt8XhYosX8ClUeSIMH3Y0wEycUZdc=;
 b=kpNLuuy7vpT6FvI709hXlynGAwxd9vDQQjWWNpdv4UybQ58UeXJ44BK4vRmGlc//OwkNtc3SZGqmkTVSx2v4WFwnlXxL43JdF7Hqr4sD6czQF0/GyXxCHfGj77Ew1Ue6b679YXxAPv0Vtar2ZagrK+QkzbZAFAnPCg4Tr/UCVKyaNj6Fsor1wH7+0ZO1d1e8eaiAmdA7zFMCJ1Q8y9lY1z7+sFJhEP1ki8a6Vq9P4CCiBxaU0M7YyYlpA4CqUsMqA3H3+0EIFpuqMjwCEyO/gCk0Mm7xzZAwBEUqePl3mRafgKpZombRO/NI/0c9xi9T4jCi8t8SIkdhdZdpsT9Lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pUbo9QCCHlxibWt8XhYosX8ClUeSIMH3Y0wEycUZdc=;
 b=QcEUN4VsYMle0vMtVHqsc1mjCMB4VKis9iB/YYM/NZEcsSf3yiU0U4Ejski/dGkNqLWEYOaZdB2/ARpYydYCe9aNrfQRQpMJEZUy7/gijkxxtwmh4wJqZSnavcNQQz6KsmI6XHSUPWbhgpqN7gD/0JKLDMUC2PBkwsgZo/IYrpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7897.jpnprd01.prod.outlook.com
 (2603:1096:604:178::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 00:50:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:50:57 +0000
Message-ID: <87wmmos87k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
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
In-Reply-To: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
References: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:50:56 +0000
X-ClientProxiedBy: TY2PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:404:a::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: a87bd248-171b-4eec-3b0b-08dc8e678c96
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kBu26N/kU4QKSxUpoGi5JWj78YJxq4gIdtzwlE2wNFAHT2RV0YRSYIXMpagK?=
 =?us-ascii?Q?JW2ljqyC9l64/sx6V2L3RO/guVdSAX+sC1448SmVzqnG6q9zkEVNnRv70+3q?=
 =?us-ascii?Q?/xF+apaWHHFOX5+5GO8ZW+RNq8zq46bTZ2LcdjYxdiJNfrNOUf6hbg0XbLix?=
 =?us-ascii?Q?ic3C7g0EtifYT5Da8Zq5gZvjE/TIcL50A5TgLzbuJGKa6ltY71aQERx0ObRm?=
 =?us-ascii?Q?d/c0zEvDk984J7zMMqq9e8joN3GuFWsCKS3b9FMGEsqj4s+HiG5K3oUCLW85?=
 =?us-ascii?Q?LJLfFBMc8H7nPBOTB13EwXjkTjRJvqBaijP9AeP1d2DkbRr0umF9REz3ZfRM?=
 =?us-ascii?Q?SLj3XMUDfA5z6JqHBBHRgNGZuzML4OxNdrWlH3ESZ5FVEXAdcTJJBy3mfVPe?=
 =?us-ascii?Q?Lh1JuuuuDVAYn1VwblJyLEkiRSsZMSI6Y0DpwaKkR7VHdgPIgwJYR2H48jKr?=
 =?us-ascii?Q?eCdRnfmM/CrPwo4OBYyO0AagbLunFOK49xuDVTiDM6nXxdXYmeQWLiZIA1XM?=
 =?us-ascii?Q?nylGwtFbrJqQYJc43Dlx/DAmc7oO8OcQlVvZ52JaLSnEeIdBw4aG6IGlJK0h?=
 =?us-ascii?Q?pscWtrSQAdgZibmQztpfWEnaZE3Atz0LUGHjfJf5+IGKFmcV14Q0eg9DVxL/?=
 =?us-ascii?Q?qjLdTInNRK4N7NkuVHGppngCtDVHH3grjfIUUZbU9u93rqagT+5x7pQAVNST?=
 =?us-ascii?Q?pSuQXyKh3+Sm87mL2e2bU1K36Rqh14ptqSiouauFKuxKiAKbTtFn9pdERi3W?=
 =?us-ascii?Q?7pCcDXFAVPYfJvYpyUIBzfBHtx1gnJPpBA1kt0cS8EcrQBfUtA0eUDf+ctzw?=
 =?us-ascii?Q?PLNYN/wFKG3oqfSgILoXefuwrR1nN4h7RlEUndR+EGYPKcOZrchqg4hqLAYA?=
 =?us-ascii?Q?9UkztKIQeiK82EOIhPSjpP/zbyefuhnHXrj8n3ZImqEVJHnPyDY1qj58X413?=
 =?us-ascii?Q?PgxGiw0IRkH5j1ieostBNOGny1xIBnp2+dwa17bz+uFw2wbFfj1jkpyR86n2?=
 =?us-ascii?Q?CcmrULl3FBnGeiuNCMnjFL2gG55StaOM7N7TNKY3mIME43npxoT1rJw1l1Om?=
 =?us-ascii?Q?GO1QM3RvF1hW5LJn42FYLj5TasyvzVJAuEpLe8xyP04XReZMbBI/WRWp3T/P?=
 =?us-ascii?Q?bZHDo/XBGghl7bte4sRSdkNzn5NziqI6TACJSGf3OnHZlXUjVpa6W7AQfjjr?=
 =?us-ascii?Q?gmm2SoCJl54gmAP7sQTu6I6OFXB5dJqthx8y48DwUEE3k8VADNvrxfJdKoXq?=
 =?us-ascii?Q?ASFBUcJedNrvPZ+DPuJGffts3baqH8ufT4hAQ1LzUaQNiHo7Hx+vcriB9Xfg?=
 =?us-ascii?Q?96agNOzAQfpBlXqrP/ESkIgAiLjgmEfymEEIbbvzt4jLbPrYRJQ1+qhHYgkP?=
 =?us-ascii?Q?kvW7tHg8rSPgzrb7CQLwnTMjbbTG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NyvfCFSwNTy8WiogRZWQ8ty9BM2NXN1LwcyprEi59qbK8sdBu7XO5064yDuz?=
 =?us-ascii?Q?uFz9SESPThNKlOBEwQnmAjW2FlZUIM5KyS0Ve7tj8Se6r3tXcSqgqdhaM/Jv?=
 =?us-ascii?Q?Xo7zcluDo9qW2Hx94KPPf+XGrOTB6FnLaLO3Gz2Bsa5rBBG7101W0DknHsS8?=
 =?us-ascii?Q?Zvtd0csAZbDMsnwsWZgxj/syBdARQyhHFa0g+bkNa4SpLNksb6upTYzO2TY2?=
 =?us-ascii?Q?lVL3D+rs5R0Wp84NQpLtSrzFTJmdSqd8y2qlbHRIXPixP37t7aBSUnvprw4o?=
 =?us-ascii?Q?2iLzWDxq8wBHz3orWSY0h8B/TrOO4J6P9kAox+esc4NPUxFcqBNW2Of52Rpa?=
 =?us-ascii?Q?htp8nhmKQysZ/Mw+wgBdiwsFEgIdSaB+6T7Y031fpJaBjOLS9M+b2lex34Ji?=
 =?us-ascii?Q?bE4PndvN4EdKAfLJJ8yd8oXsS52nfEsMzOFGjkWKGGjEyITvPrV/wG4lb1DP?=
 =?us-ascii?Q?dUJPwfmDUckcCRBYdlYh50eRqqgPTGdhG3KIQ0dQxzw/bMMvB2gDvF1J4BnO?=
 =?us-ascii?Q?RCtjM+/yIssuxvI9FSYMyG0LfNEDcIql1AfSv/S5pHlKPTOL2X5Cfon6wfGf?=
 =?us-ascii?Q?J5qdizE8cZt4yE91kE3W3I1TeiK+3Hs2eEB1Mf4Yfg8kAdiHowHMpVb8DsbG?=
 =?us-ascii?Q?XJa+RJfFdcq2r0DoBUZc6Gb6S3+VE0bAbTG/cOFQPFqZ/5MU/c8SqKSXcgmu?=
 =?us-ascii?Q?l0htce5VAYUnaZRd6W4fFGYvpnpDhNhcGMD+GnCLo/XUimJa0UHPuCUeTGpO?=
 =?us-ascii?Q?WzNZ1H44dAEV84cQ7B0kP1ehivdBh1n3AC0qmO2DZcgCOcF5+sSRkLnOBpRc?=
 =?us-ascii?Q?7aNuF29Jl468AeXXFIj8cXA9qzZsZl6x/41+VlcjJsr22RJdEk20Lu4Tmu/r?=
 =?us-ascii?Q?Z4sSks/xn13kqHKRdCI+JcSD4/2KS9t4RO4uJBRA6idcBEQhc3T2P08ytUX/?=
 =?us-ascii?Q?2hCkDRfm9Fu/PMUYjTJ0fGJlMlksxEpff7EgzDZjPxPwBIwsYOgtwyB2zTyJ?=
 =?us-ascii?Q?Rzuo6DHxTLpUWiIb9myl0oY6M/YWKvYNChVBkbItDl+cmQJkCcAITUhOXYrb?=
 =?us-ascii?Q?NYbYZ50cZz3xUNgBJHhbCofzNHIdI1gRmTQ3Xomxo+fEQUUx7hnJp1QP8ULP?=
 =?us-ascii?Q?7+DXrqpNWOdIjDtSn+PStUYC1lLjWbjaPZWq5/7gCbxpjhiZLn+IdemRt39c?=
 =?us-ascii?Q?pZ/Gm34/g/lEuYlXezx228prBw/M7StqjSdp/w2WL8GP49iyTbv+ssC58UiN?=
 =?us-ascii?Q?BzAeRNKaLdTQZJJG/sE7UPGU5k/VwVrSfhITf/AXazQ72sn702slg3UK/byU?=
 =?us-ascii?Q?VIlNXm/8PIt38h2SXs846SW238RdSlf7kro6GhwRJCJKDQR3dZTAyZTcjyPh?=
 =?us-ascii?Q?Kp9A3Eo0tRBueRvXjoYFeOFABKampUMOZ6781cdHsPDcYRo1Q332WNQo7z19?=
 =?us-ascii?Q?yWMsUYRMh6F7a9AfIYRevxgRagN7iSS0Y776OtPVuK2mg8OiC2Z8w1PsAzNu?=
 =?us-ascii?Q?WVcUIeGzzLfTAVH++KEjSmB6+nZyyBCDxo01X3gyo7qyV3uAF3A+Z9biEgU/?=
 =?us-ascii?Q?+4YtCVfjro5NdGeRHTdV8FuSuFS90jHh+98WXTHoEkLM1KIGBB5vDSpQuES2?=
 =?us-ascii?Q?xn9Pdjdwc2uOQALCsZXw/oM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87bd248-171b-4eec-3b0b-08dc8e678c96
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:50:57.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiDwBMOlxP30EVPWboCXwcc15lfmEEGMRrC1OJMOr+Sl032scFiJdh70Vg5JMAYkDJ+pBI3FWoX0+kCZudfQaTuVzpdYWGvRsmgkhxMUbX+YDfFf/0zbArOq36vt4nw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7897

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Prepare for removal of dpcm_playback and dpcm_capture flags in
dailinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b646b32dd3119..3d11718198650 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1271,8 +1271,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only = playback && !capture;
+	dai_links->capture_only = !playback && capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
-- 
2.43.0


