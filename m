Return-Path: <linux-doc+bounces-17258-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 437658D42C9
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 03:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6FF285798
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 01:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D41710953;
	Thu, 30 May 2024 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bAOzjsBc"
X-Original-To: linux-doc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23CF510;
	Thu, 30 May 2024 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031903; cv=fail; b=rbkFT1Skz0WtAhVClrC+VOedHmizdV0XXR0s7VZBNNeLQJikT5pw62IbmLvsA5+5kbz4g5XkoVVhthS9VANak6gUXanZOxMs+0x1Ud1efmQASEbM1Xg7pklhJF+nqciXkzCE8o6Y0RKgzOvTAhfK1g0Ui2wjd6fDuHd2g0adivc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031903; c=relaxed/simple;
	bh=B5RO6p7327DKtCZ1Iqx5LT+0U1LaPgTSoSUsM8Ty2Sw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EhlRjt4t85osCkJcdiIHVKSJs4IOp34uejAKCnpgvFZfiHBDZwYVn3Ja4i1fkCObEl04gzoI7UwyBGr7yR6+MQpqQNc+IOGGgPsZpyXgFjeQssjoaYouWWDkHu4e0LmZu76W6KUplyjaUR3fZU7BUHaTgN/eYXaGx62Uvj7rouA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bAOzjsBc; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY1Ak7eIh42d6MOad/Q80VqgEu1ERAr0B+JxeATBEJffXlsnWqaYsRzmEAnboTscPYKhx9OMZn0m4zile+lIh+BP70Myha65eMVrS66Ka8YKf1XCTxiIcZmpHcfOFVCkyOhbenV4+aJce3dZIYXgJh9iIBgCStJuFWM8KCil9PRnjKvfmOqate2WU4xhFynyfZonnhshkbKDeRGP10Z0wYLUrd92CZkscJnvtHsdoA7rN1Lf9ZPkNPXi+WicVuWA+wmPkpprpP7ooJE9rePPxlFuT/vmAOzjmMLZFUnqGTf3yXXKUk6sGEAnabDMJDAo9PoDkgfG90dgtuFrf2LidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pUbo9QCCHlxibWt8XhYosX8ClUeSIMH3Y0wEycUZdc=;
 b=el8HqcWAb0b3E2klBpFi7IdN4HmJ1bJVTsSjMQevfwJCBl1OzuO2QAQNX+Aokfhcv3b0V2Ax6nztMreQ+kT1tSCv/o/utEVtpozcaEWkf6UldWe8GyFMNWfTtrffZLSmSGL57N2Geecfj4yZf7LlBCX5jbm1XH585xMLVxwhaAYicEMycir+B5WWjr5IM+i1EDRhhg78/kwKsziKCzyzsNcKLVXX7yKrjyUEZjAzqmoLz7+yC1+FIBqrOqOPAuZrOaayz0SMDjT5mM/ChkON/uXlofWYJzH+LrYs/emTCQj3JkGdaChuahgFo3AYn9qyl+6m7bHac60F53S1hV99sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pUbo9QCCHlxibWt8XhYosX8ClUeSIMH3Y0wEycUZdc=;
 b=bAOzjsBc9zMbXwJ3Q8DKLOto6BTxYMvkguddvVJ2RqTjYgJ3QkkWDlXVPCP86/2nuva26tE2/BvjAjeP49Oim5cliJ9E9XjhyFRe45CfdJZmlT+/+Is7X5yh149qgkX9a+Gqgw8FR9E0ii75Ho0eBvoiETL5Lvn8ghZ/EfmGv5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6933.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 01:18:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:18:19 +0000
Message-ID: <875xuwqeqt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:18:19 +0000
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c37bd4f-bf6c-48fb-47f1-08dc80466406
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|376005|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cxugt8KhzLxk/YqqzvnVNYaKak+9FQ3Aa4L17r/Q6VT/7Hemz6jnC9CGBMFi?=
 =?us-ascii?Q?9jcHzztQ12KUpVhJMiqSvNoZeqAEVM2sH9bVtJ6NN3c8dMtuXIXIik1w6Nmo?=
 =?us-ascii?Q?EJWvSFzSkZe92gypkqS7jd1t492NcFFTiXWFrUe+m9zG4kD2/lcsQTV7BTX0?=
 =?us-ascii?Q?h7L+gMNwsLuYWdDDFAunU3nvltL1+Y7veM8BtT/F2fLTC+kGG2rGLEDXcH2B?=
 =?us-ascii?Q?i/wmilfYarOmehhLw+oCqgOlJmzi36+NQ4UzHJ2k7Tye6A2TILMCiY5Fzu8I?=
 =?us-ascii?Q?yc2rEgGR6Qu8tzFi4o6CM/7JhKJ4JL5FpoNIIDqZU1S0h7aYrl3p1+U7OoI4?=
 =?us-ascii?Q?ovFg4vh22taKQzD+gWIViefG7N3mQ6kOfx0v6kRdfksHc5TdUcjYGyWB21PW?=
 =?us-ascii?Q?GmFdTeFMNha95QCIzYNsXlsVaQ4nYGnO3HH2dVT6ov2CEWO5WXmn8J3Ug+fc?=
 =?us-ascii?Q?ebLnxDMp7czY4RnT6Uq7pYxQFoIktPPQwLxpmZXtCLms0lUIlxk19fu6KxQe?=
 =?us-ascii?Q?BoWwfsBUuXE6k5IUyU+/hBn8D/88+UjyE2aUB9G9u5yCzTQS1q1PSdHHzqfP?=
 =?us-ascii?Q?EakZ6VlUc1VM41lE/glzS2d7SBKd3TqOyTQUGgfLW/R6R6cvY9+bCNebyfBK?=
 =?us-ascii?Q?NVB5I0ogFK64MgzYg5UOIZTwpK44wym574LesvL4AxRAE16m6SoDjZuuUIXC?=
 =?us-ascii?Q?U2FGpnLF58DbEUCJFwRjMgnqzfsisLLYZJM3FGDdKDzxKIebafXrlxuvbefz?=
 =?us-ascii?Q?RAowRgj4/8Ogcx/cAnPXsy2K5V0OEGqfr9ItK7F07bNsBzdOKGfG4RnGCoM1?=
 =?us-ascii?Q?X5MEhATMaqeedHvBk4ghB9TSdN3OYsahwovRwKR75b2AVJYQ6A7nsuodEh0L?=
 =?us-ascii?Q?eG3kBS92QKSuDDwMkpVz68tFk7laSXvf8vF9paWpx+mPzcE4PrD9UI9cTGWL?=
 =?us-ascii?Q?vdtY0xGa/E2ht9ywQqh/yl/uOmvRQLjjEpHGexNRsaxiE/qY3vaLSHRHj5YB?=
 =?us-ascii?Q?YizgV0dI1phUZ6c3ZFj6qS9PPCQGEo9eRIduyEom5KasEe+HgPNoNR647r3U?=
 =?us-ascii?Q?tzcd2uYZXQ58DvdlJ1/CKfpZRJYHMCGIKVoQS/6CYqTkyZj219rrDwu7CZ/r?=
 =?us-ascii?Q?O/2lV+FhrCKVAmSR46ruXjMRVWwZd+QOtZefr9R2pPyTVSRpRJqYSntSNaaa?=
 =?us-ascii?Q?3nYEXRgyg/wZmgzFBJy+6ggvjNzUwXKzhhQt2WBoKmtJsntflLpPfe/WdogT?=
 =?us-ascii?Q?gHqp1hIlCwtySPzdOOIgqwHu0FME0GgO+ZrNws7u1UVEZJh2mLv8oKH8dKzm?=
 =?us-ascii?Q?nacas4WSNy4v//ojwi8oOJ7D/B+aQSQ//odId8m9mbXMg749r9MdOe2QSqgK?=
 =?us-ascii?Q?xbMq9Xk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+L9U2XyvvC//kO1W1u3Wdg6928eaa7OerkxwUMOm/zU5g6zhMvOWhYvhQKhc?=
 =?us-ascii?Q?GeVZHyndXny44cg55TaxvO03cFbLhzg4UKDABk5MwUulEvZtUidtnj5nFTJj?=
 =?us-ascii?Q?IXcbe0dp5+KZ90ZY7tLznSsQjJd2OfUdcrQ+EqmwO/rwMDovo/fsNqJZMnTI?=
 =?us-ascii?Q?F4vs4r5haqoZ1pzj2es94+j6UY+3hbY7Nu5U7Gl7sAHTtJkEIPgiqYnaTtLx?=
 =?us-ascii?Q?qQqYP42AB0oUXz73Zvu8CjXt4ed7JVpL6HmsJcWT9ghJ2ix/u5qxuYXgpf67?=
 =?us-ascii?Q?754x/87HLmkVjCttJbGxgDtA1C/uCHC4/X8ilxepaGDhGr5a2SnBxD8fQLYW?=
 =?us-ascii?Q?OBmOSthHG6EU/ncPO2I876Ihu6fB3B3Fcljt5vaDTGKozzEFLiSX8Q+Yf0ZI?=
 =?us-ascii?Q?4pmtmzCiQeEBLqxUzSoNa5G6lboZwcUb9R0mBKutDR5BiEUW9u9MXrTfbPmc?=
 =?us-ascii?Q?kE9cvJhdU1JXQ82dkCfw1oy+ybbqqgg7RkH4CdJSleYu0vwxKIOEVrERyinQ?=
 =?us-ascii?Q?yNfp58JPUz6ZZSLE3hAwtDcZDFer4aArJcsEfVaOo/FkV/V2Xc+W9F+jiGXN?=
 =?us-ascii?Q?M21QaOXMr3gh7RWHKKqqYWUloZzWtOeV1tXDk8rxdQowdEgT6TIHvX5TYwey?=
 =?us-ascii?Q?KOiNUFWvFoGc+L6NRyk6CA1fWHx+BRw5O4evffsS4i7yXqujWebGWm+MKAuV?=
 =?us-ascii?Q?dbMi87gUNSpkd6eLawBJLX1aPkT39pj6496fcRoJwOxQEZRXh9rUe5mj8ypL?=
 =?us-ascii?Q?VtT5+ZbYzLlA/cEX7LoIYu+JwX7X4k78t4PcGRi9veg96PhXpilkkFmQgvQ+?=
 =?us-ascii?Q?myMQO0msFZQvuUd0JfJWVeVlvfcmaEMFYtF7OtUBYd8kPf0Y4f5UEXbzqmVs?=
 =?us-ascii?Q?q1YL52lp19DLkm0Zfp5uYFY++MBOmbxPA/UqrMhYndbnn+9Q/bxZcWYhF00G?=
 =?us-ascii?Q?28HnVpcJJjmcYQusQRb2hrfGBrSc225KHxPYohn0+px5rrAO07weQ+UoPkV0?=
 =?us-ascii?Q?9Z0CYdVVomqcQFvr+dgE0AaTt0Q9Gpfz/ytwoQuK3IUPdSlJ2GBEDziSiLxz?=
 =?us-ascii?Q?gfab5/rEI8Q7VEqVlhx6UYcOfzoBdo1LyaZ8MQQXif5UpjlWbpCtbHlJd12R?=
 =?us-ascii?Q?afkve9R2X2Gmj4zYfK1d3jcY3F0sR5y9BYhrtKmJd9SjPZODM7UkkuC2emGW?=
 =?us-ascii?Q?A/C27Z5pjVuq/Uiocj3718Y2cfcyphjzImO2BFeE3RLJRmqxoVXJNXt63OU+?=
 =?us-ascii?Q?GdvY/4Zx1QBhdSr3Hr272Wu31vGqkkWxJdGOoNHezS/Vx9scV6PLzGVy9nMn?=
 =?us-ascii?Q?teeFaYWabiMPKlM06LThycJ5axkYd7jBrZgQ+d0EY9dgEZ9n65pNVMfN7Ts6?=
 =?us-ascii?Q?dm/K16Wg+cARFkFdM7TVGRUIWKKhphOBdphRMImrc9XClko76q/ERlqycWAo?=
 =?us-ascii?Q?Kof/Iy1y2SznlLEyKRkS0/LjNYFL1orCrvY49CPKkG5JbtdTtmJAHvSVWZAO?=
 =?us-ascii?Q?xnK1NApRBwW8yhCcML6TAIkuKS2yjjnGpJMHABIoXd+5Z/oY2DyuXFFt7jzJ?=
 =?us-ascii?Q?wwa4fV8TGfVy4uBy/hIYjGfytx/y7XyhpLU7RIILJyCNrL8CvFFlht1BDhrb?=
 =?us-ascii?Q?f1+wyJnb5FVOUj72TURQfdo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c37bd4f-bf6c-48fb-47f1-08dc80466406
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:18:19.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cwabnNh7jdPnkKKH9ams6ADus0e4aE12Ao6sV2+Dh8VQvMkgTXAH110+qsPUjyW6bkju2K7p8Gr78ZorW737cVQ8JwrHmU+K8ggBzAp3oWkQRSvGOeLgxManHJ1cyRD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6933

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


