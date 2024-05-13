Return-Path: <linux-doc+bounces-16270-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0198C399E
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 02:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52921F2135F
	for <lists+linux-doc@lfdr.de>; Mon, 13 May 2024 00:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C3833F9;
	Mon, 13 May 2024 00:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D7P6XUJx"
X-Original-To: linux-doc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129EC7483;
	Mon, 13 May 2024 00:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715560316; cv=fail; b=DfUho49LbnUZJum9sZUnGtvO7aJUoI76FVSWRBG43f8s8q20teRB03spxNDo3VbWxGXTximJeSe2yv414TQO/29T/OTd3DVjMYnAnRC+PTsHXzrrUIvRovgN6X8MIAsF2F22MNMM3jFMyjqwVwAAqMJpQlSi29yT8wDphsUXjoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715560316; c=relaxed/simple;
	bh=LpEgflAnaRpE4Ou+VTtJmDUg1kREtmzu8AUQFFn+8ks=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=OW4MB3qFTHvYDoPpKC6NWuybg9NfarXJBCUa95st2ZIdQSVAcAXCS1JasvzwafCsbIWkoNwcmwnTIbWT66oe+RluoW993lo7IjKQ5NyhE8Jw+LRVJxtXGf74suDXF3kJNOZS8GlXkZwq5WdoS4kvimBQCc+1y2SuByLMYKz2IRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D7P6XUJx; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b//KgNpYaCSclrhrLVDUcST1F4Mt9rptDZUrO0PavInZR5Pasr1KfhFOApX9NcRq0a6IrSskPCr4yv9KREfOCrfYQsaxYRR8HlDXEY2da1wnaJJmv/xNY/9axyIgk8g0WwVtf/8VSFCq0L+H8WUtCj9J1ratWXAj5zicBR7s8UL8pO6EEENq5SoCX/Ss/nbohKeN6Wx6Hv4VCaNMfxjOp7rdoLYl7UD9wNZWxmv30r5BGgQYBdBiqA7kvyFLLwXbXotqneWOqZqMLhaUNsXedESTU6gZ8P53quWipw7eMpLMJQ0k/koA3ofCaEDx91w8nSAJlDuaX7pl5lv9SQeWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N891GCPkFOK6Q9TdgM4xmubqMKrzaFgOQMTodNvQuvs=;
 b=nWVOPNesCc/BwtK1UhAK06jHit/N1WWmryBHgstY7Sl2iQMLSb+VUlTwnipFvkg2Y2LlbP3T8upSychV04W+t1b3OC6z2Hn7AtvU83blw84bPC3PLs33628vZBEkAPR6HnqbhyKV4p2ZFU2mkn4hoVWyhdAEv/8IlMZa+Od8ZYw70d/dDPUosjaKmzCyX92J0iNWlgbvIAlbc+xn3y9xwrQ8XKWNyUKjqKr0zh//KpFJRR+yHhABmr/Fgddv9g8GdJX9GYZhsFA7H7D71smCEm8Aj9K0/OQLU9EurTcte2bnyHGt5/ZpmEfprqlkvFvEOew7T1eQCiKsfaiKE4IL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N891GCPkFOK6Q9TdgM4xmubqMKrzaFgOQMTodNvQuvs=;
 b=D7P6XUJxdq/970h3pqbx4nNnC7m6iUWrjo3ByFKe0oFhYYuUWaF3iw0rOhwaqtfMfHxI3ZPbEzcFfYI2Yixu6/3TcFM++BjKDNK2MarIflhzUrTA9+Cofqn3BuqKRUzS8dCBsINiOeq8ODeF/ThYgHZumF0tEIdIWPBCC7d1gog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7383.jpnprd01.prod.outlook.com
 (2603:1096:604:14a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:31:52 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:31:52 +0000
Message-ID: <87le4ezh53.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 00:31:52 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 662768c2-0b69-44b1-6f0f-08dc72e415de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|366007|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HVcToIRM7Yr4ByKjWaLSPjxPaqqlo5qYDS3ZnM+Tq7+TfEmaCuvfFjngHWOC?=
 =?us-ascii?Q?3meHaLNrLbhtIwA2ToF6XutYCcohtUTooKgjnljATIsng061q34mKdgRdLk7?=
 =?us-ascii?Q?GxWN94Rxp5DR1/xEWAKOvZNRafEK050GHKQVEmB3gmhd1JXuHIzApze0drn6?=
 =?us-ascii?Q?QqMcZkoQlOMXrVr2wri7R68Lk2h+2PD7HRFqKR5G9ljDcYhBXA6UhA+v66Zp?=
 =?us-ascii?Q?MInY7Est5MHxlVNDiHpvsMszKANiWHK020My5w3wvX+DxW50QjQK1utKgi8/?=
 =?us-ascii?Q?yQjVBbBYkct3DSD6tfnoojMHxeA8pcILHHaVUFFUUnoJdYP3F13rYk71VG3F?=
 =?us-ascii?Q?VeHGlrMn33aXBHOsm5dD3n1S50grW3EizoCZSIGuPXDKIfYJK/mbQyVWmQ+Q?=
 =?us-ascii?Q?xF0X9W9KQM5K5PYnvYdvBF2dpN7bXNGgIKMN2Atet07ZEX0Td4BOHVOU1d1W?=
 =?us-ascii?Q?tMKYUdQ7dL34iLSzezO1xP8pDoOny9UnfFHFmIxattNku3oVUn/jYoOkQJNO?=
 =?us-ascii?Q?PTQSP1wxRw3NIT/M+axgJHMUJnIEFAGA96DJjbpROVbeoAKJFTPtkZupH6JW?=
 =?us-ascii?Q?D6yFiYDTd9No5hvZJGhyau/LIgak/TLjtKbfR+IPaNCelj2jXkT9fQ2exVc0?=
 =?us-ascii?Q?HNe7nNPy/TfabhTjs8q1K2r1A7d+nDbuzeR4Z6Vkb0hOcjBlAlcn/CwXPAq1?=
 =?us-ascii?Q?dYWHw7vG1Os02dpv1BnR+OIJtzXIxKru45lRSh+JTQKo45haELyRf8rl3Orw?=
 =?us-ascii?Q?msbeY66AO1bAHpXQ2I0d0uFtgQvRc6/Yw4xZOAgBzfQX/SKck/8jZF9FQ4JN?=
 =?us-ascii?Q?BJCmiegj6TmN+3xaWE0P1y3xc1YUtwAuvUbJ9QFOv/ge8ADh5RMm1SWHcNk/?=
 =?us-ascii?Q?hy1ZG/gN2Xi4r4PmRKiP75CxXL2fI/2PAhYfW4aeSlE1T+Qg6/yiFVqTm7fd?=
 =?us-ascii?Q?rPa5fULv+xhrg9Di6clV1oJGf+5yulZ3t1xAXH1fTGK/EkYJuryzQ8mSGyv1?=
 =?us-ascii?Q?f5qIFpHQDiLt7odOt0JXmuylU7bbR8dX2OB0rDTZw3HxnwyVPZGvr8ju2M1H?=
 =?us-ascii?Q?F088jXr6cWUK8N8LTWIsGpShRzIQd3dmDx+lHAhGY0kkB5w+8W97/GJxzS6R?=
 =?us-ascii?Q?eHhjtfFOE2fwxn4qg61NSf4IO0a9lm1L0uVKzA3skNRTVTQpivgv2gk8KhP/?=
 =?us-ascii?Q?6k/S5n1QtwWwlkvvPBpi4XrpmZhFi1tOm5URFAu3LehnWFr0zu2W5EAy1eaj?=
 =?us-ascii?Q?MR9mJcs44CfdRr54LncI93uydYxVOvuS/DpJBNfn5/JXckXWB/IJaIcCR5Gu?=
 =?us-ascii?Q?OvK4GTGDiiy7ikUxb4n7OfyHCRHvm2f2W7w7V5On69U4fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(366007)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ul5/+qExd20JVhzC9FU/8M63tteuJHVRSuuro4wAardI8xz/Nq2OhuCaivzu?=
 =?us-ascii?Q?hSyxPs7fTcS/OGqRLYnCnGil/VhsHtXwWRamflvGoIXSy2ikil6CRGj2XbXG?=
 =?us-ascii?Q?CCJ/XzWUlOQDnayK+oiqsgd4/AX2b/zgaEmqOxlp8ct2wqX0icD8VJiEWtuu?=
 =?us-ascii?Q?DxdcAOqc/zJDJO2TkAzaKH47liJ2fm1mBrKACYIsJ/pHu2WbQSw5mnAgG0Hz?=
 =?us-ascii?Q?PBNe+P65y4rInGzkh+fjxgZUq+78laH3FBvHLSI5q1UcgE6GSRUqGCCyRTyV?=
 =?us-ascii?Q?7CCMY2nr6b3kRhJZMeQU1dbQbN00xnaYk2bqIjesr5PTss7rNSHXvgqMhpAD?=
 =?us-ascii?Q?JDdey3Wa9Bw+B3mhEJzN54LuBhltRsmGf158VfHKQWVArU+JCqEUEnpk3FK2?=
 =?us-ascii?Q?4z0uJod2Etf+uH9/ZGZbGrOP/obXaDGY9woOYbvVV/b5Nn9XvK0excPJdjT/?=
 =?us-ascii?Q?6gyPF6X+fqyr5HvV0Wwf0nxQq9WNDSgb4NG1hdKPDcVWzu5RByYmw1gb5w6A?=
 =?us-ascii?Q?zI6z/Hgnpfm/jRrQviEAjcLiKWDxAf+or8/oF27s4Bo9xnOmJB2bObFPAX8Z?=
 =?us-ascii?Q?uWT9cWRmAHu3y3avX4jzfgzhSZOfWF4EI7tdKmx1kh3T29Br85nPxisJFN0D?=
 =?us-ascii?Q?VzNNYGwwpNob1B1/MAIwsLOgeVrBJJLvtopRpQBqGtCkakHIG9ZsXnMKZpN0?=
 =?us-ascii?Q?Eu+j3vWmW3j/x0r6uuD4SlmbceNm7QizmhmitqEVWajJIVrCc2+QQmosszQP?=
 =?us-ascii?Q?tvckbAiXXC8D2RdWGIuOmuUkFLSvspjNlZ8vTVXDEiqe6OrrdTgTaEU/ojJw?=
 =?us-ascii?Q?59POFVGH1rz6Zdg6k5t8qCd/c3sTLOs41pp1+qrELTuQl90MrcLiIBbY8v74?=
 =?us-ascii?Q?RD/Zoy4qwc4JVY0i416DignhUDNRtuNw8ve33Gt+iZoUBIa+R0+WIF1UtT5h?=
 =?us-ascii?Q?fns+ksCZx7zEQDsXY1gPlPAIngN9wjBOHaeCKdDeTyEPhh2eGu+foHwzUadu?=
 =?us-ascii?Q?h/8JHwN6cW3qpEgHuEBAlYShA6zYtpCNrZaHhb7M/lvROYxAz09D/Z8F05Kj?=
 =?us-ascii?Q?qXqmy+Wlfbg5YdqwAD+c1nJX/I6IUuhU7do6+94+Z0fVp6CciG8xEIrZ+GNP?=
 =?us-ascii?Q?054qYCA3/Fy1rNUr10aHwh6j5CzcmlYfosq8EDHwWHTvxTrc0hb50WXflbIS?=
 =?us-ascii?Q?7l46FewTK0PLBRsi87HKCgjyhGHYApqKSLScFaWZRAOpWDVktoxCw3QV7lKd?=
 =?us-ascii?Q?u7xiW8B01t5reYEhIw8ccJnERin6+O1i1OaJ4WowWsLfPElGz+2/QZdvSVj5?=
 =?us-ascii?Q?kwUAtXAfe1pa52TUzEyOT5I1yxSYx5PiSXZn+L9VTQyFQi22qTlVVLDU7K5Y?=
 =?us-ascii?Q?sRXSS/jo/mDasj7daBkpItPH/L0ceOLyhCjvR8tHoKQJ6gjEOyvUZL6B87Fd?=
 =?us-ascii?Q?eitlTYTmTon9hNRIx7/DhzieGSWWo7Pu3ouDPWoAzk/WpOaSmWEyd3HbQQHi?=
 =?us-ascii?Q?U/Z8EjoN2SnEOBriUpWtB/6IybBpUXYhoQleOXmqQlIkRmagmtCcomtEhuW3?=
 =?us-ascii?Q?IUgnYmEZOjh1fd0yavAW8jUPcZuiC3DByVrLlcexQeZFZRcDI6zsz4DX6i7O?=
 =?us-ascii?Q?OJkr+4EULvbmohnCiL8nejY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662768c2-0b69-44b1-6f0f-08dc72e415de
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 00:31:52.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1U4dx8MfQ7tg62QFFBRb9+9t02SMg8s+cH5wzDIJiYKvqYbEngFyfCTKTagKEPXrzPlEn8Lk63UFb98NLWsiYNKMym2Z3Q9RkikbywyjpZ4YKdY3dTpailaWGLBMqQCV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7383

Current DCPM is checking CPU side availability only, but it should also
check Codec availability. But because of long DPCM operation history,
it is possible that the some Codec driver check have been bypassed.

It should be error, but let's add grace time to update driver.

This patch indicates warning in above case. Each applicable driver need
to update during this grace time.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c4d80cad5982..5729912ceff9 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
@@ -2806,15 +2807,25 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
+		int has_playback_both = 0;
+		int has_capture_both = 0;
 
 		for_each_rtd_ch_maps(rtd, i, ch_maps) {
 			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
 				has_playback = 1;
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
 				has_capture = 1;
+
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback_both = 1;
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+				has_capture_both = 1;
 		}
 
 		/*
@@ -2850,9 +2861,39 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_playback = 0;
 			}
 		}
-	} else {
-		struct snd_soc_dai *codec_dai;
 
+		/*
+		 * REMOVE ME
+		 *
+		 * Current DPCM is checking CPU side only, but both CPU and Codec should be
+		 * checked. Indicate warning if there was CPU / Codec mismatch.
+		 * To keep compatibility, warning only for now.
+		 */
+		if ((dai_link->dpcm_playback || dai_link->playback_only) &&
+		    !has_playback_both)
+			dev_warn(rtd->card->dev,
+				 "System reuqsts playback, but not available (%s)."
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
+		     !has_capture_both)
+			dev_warn(rtd->card->dev,
+				 "System reuqsts capture, but not available (%s)."
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+
+		/*
+		 * REMOVE ME
+		 *
+		 * In case of there was no dpcm_xxx flag, and CPU / Codec mismatch,
+		 * follow new style
+		 */
+		if (!dai_link->dpcm_playback && has_playback)
+			has_playback = has_playback_both;
+		if (!dai_link->dpcm_capture && has_capture)
+			has_capture = has_capture_both;
+
+	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
-- 
2.25.1


