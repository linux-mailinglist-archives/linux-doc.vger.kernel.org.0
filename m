Return-Path: <linux-doc+bounces-16569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E14E8C975C
	for <lists+linux-doc@lfdr.de>; Mon, 20 May 2024 01:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0D91F210AB
	for <lists+linux-doc@lfdr.de>; Sun, 19 May 2024 23:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CA56A332;
	Sun, 19 May 2024 23:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HXlkFbag"
X-Original-To: linux-doc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121518EB1;
	Sun, 19 May 2024 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716160293; cv=fail; b=Wte0GIjlkGDOSUsIbvwwVDh8Pe6mrtmhI5u/9iXIHkoupqfsMgqq8HtwrfSLpP8Wll5M+XfQi3ytZTitj52tntzEfK8eUFLuGFRShYp/sWhY/aAsGUqE1sm9ZzMIMM491rHrQCm0No24r4ii0CPDBVRQx9f6qYYvCu7aa5dHCQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716160293; c=relaxed/simple;
	bh=btNve7Yl6KpKMmai+KKO24QFVfRWph5/verbPh2EOR4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j4XJ3wYHr9P/MRvz5vcwIGXrhQ7pmbFde/nu6MR+vSNammYjQhqlf89/R8s8eL+LB2qwqQYmyIFAqrnAQWDbeeHxHT9yGuSUIUNpQfQ9mnPDQ7iOYcm5iaw/Cur8eLxwB/EpT9Zp4oY4OHh2cwctjOQ/scEE5LUNC1fI+MrdVJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HXlkFbag; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcSyTCeo/lJ+kYZAviPDO3UwOeyplaIXo5rGlfsXYHUDZY6GKfXUrJd4w05VUQn6M2KUMLaa9FwbiUz0qsDUJvVuheQM35PoDMm3uGzRxWebl181QVgG6PmwQExSP8OGVHyWgDNKU+5UKYT1QCR9GBh28PerY+EfzuSoo4yHGze6DVkbymfWobjPXGJ4KltAzodArfWcrgx4CcCI+BFS8dkp8O0Xc39M1zG0KksiugwTX5fLY1TkruGQG0m3oNsqVCh8itdkYJ4Pi9Csn6GObFgZeidOnoOa+/uBkiLc+/1I+dwLVJf4Mm04Rwf6i6KqHijV6jhHcbSJZCLwLm2UDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHkIZSvnCbUc3fvnf+O3me9rbfE3Dcmhi15E5damm24=;
 b=OQBO4tgoqdN9hohiHZoOI17YGDvM4l11/mMlbnhI7MUtbk7x+XVMWSzX5HZwrbGRGnqg0fRQCVlik7Rkss9H6hHzF+r+UVMV/c7R5ffgJ0Hh8GHjvN7g6Bf6YNnvdai9KbL/RQNdwariF6uG/fUt8E0XkvxkzntORg1kyxO/NgqZeiyL957sLVX8ado5pIQMdHc6Mk8vcDUq79aPE5t0yS4mGQDIKP44fvemqerSvRUNY8RchC0axLPZPzkQtnm0DVzOldA1L0XZOf6vysYPCgroSNcopbqvV+AGTjZyFf3HJcPQZ4EAaP3X5fWZ1M2OD4Zsa7zP38Mi6WofrThF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHkIZSvnCbUc3fvnf+O3me9rbfE3Dcmhi15E5damm24=;
 b=HXlkFbagO6pMcRMNFTfm/bcP4j83BsKA3y9mArbJ6dToQy4u15JRJSNxb7elz8Q5EvyA7AxPIoB62a9AQPP24L2mLkE6/eecERb1Tuel6a7Vrqo9rrNA0gSVshOYbXNGthioYpeSc92x3CSebbzHii1ndQiQNkpaHi+a9The6c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5679.jpnprd01.prod.outlook.com
 (2603:1096:400:40::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 23:11:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 23:11:26 +0000
Message-ID: <87o791e6si.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jiawei Wang <me@jwang.link>,
	Jonathan Corbet <corbet@lwn.net>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
In-Reply-To: <b9cc6106-4f5e-4fd5-b5f4-bc3ed6fbe300@linux.intel.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
	<87le4ezh53.wl-kuninori.morimoto.gx@renesas.com>
	<b9cc6106-4f5e-4fd5-b5f4-bc3ed6fbe300@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 19 May 2024 23:11:25 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee8988c-fd46-483a-e6df-08dc785901f2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CE9BoeoJ1sr4ChA7UIj8eAv8qSRP/zaY8GTccZ3x/D9heHjagCFsZB6TJtx4?=
 =?us-ascii?Q?3fa9Jx1p70xHw/S2kgu8rzrqz6ori+ggXrrcURG/Uj7kCk0x56iZh8VQmpjZ?=
 =?us-ascii?Q?PTA3fkcuqp6hZNDeE8tG/g3Z3UonDMsWSUFv+oDcKFv+L9VSrXtVTTJxSUR6?=
 =?us-ascii?Q?VEggQuohGih2HckxKkC36iiZkDj5kU0Uc+Exj/IB1Qrto6hUKD3LGUAbogCZ?=
 =?us-ascii?Q?4UubPJzUpjqoMyCgJI/KKyQZUTpenCUY+wVkrBDULJ/icP3PU5ds8aqpRrh+?=
 =?us-ascii?Q?rboUFXu8EcVH5hBAZQlPwjPIC/D0Bh2bg1NKwGfRR6Dk39mAyTTZ5yPwrAA+?=
 =?us-ascii?Q?YZQMEvoXnzKTakxP3R0dBry51DvJZbNGJ2BptKth/w2ZqT40Sb9AeT2ygkfP?=
 =?us-ascii?Q?1X10LtJONnpYGconDAok1+3ugtTrFXg9IJZYcBq9kfoBUtd3EWXmJdfYtGb8?=
 =?us-ascii?Q?4Sap3a9v+jBJsH1B7JvepGRoS/hP0sM4LivTEc6PjYn3p5IjXlg4QV9CjuNm?=
 =?us-ascii?Q?g4nygwSOnF19mp8IUI5MOe0vS92k+bPXnZCoDhgJnGWHVEagxmwfQ4VY1+oY?=
 =?us-ascii?Q?YPzftMxPhvSAC0s7g83G4PFxNDYkSxIkwseiObtPExBjFtwPtr2tQgPHPMct?=
 =?us-ascii?Q?R8wbCSYdg28c7wPqKAIzAf9x3UHqBxNauRnRzRYHFORF+Ed4tA2NIoEyEXsE?=
 =?us-ascii?Q?T+aN+AHVpAN1J1Djq+BGbmqrePnqQYIx73bt1pe1mAlmz+21WKVLCWXClaHI?=
 =?us-ascii?Q?SSNFFCJM2PODImXp8pktj33HI+YfapMSYipjALGh9M9+Ws++mmlU6v39BTLp?=
 =?us-ascii?Q?BOqbCO4P5C6FKkcsaD5nPNFyggyYVrC3BHXTEwnPZqG5E1zbiaCo6XLOvZKm?=
 =?us-ascii?Q?aoTw7VF+aSpLLw5ZhsCsaygQn9QvwuA8sRg8i/lWcNf+XHkAmFvOn6lhjob3?=
 =?us-ascii?Q?o+/GiAN4FaPwW+l12GQZWneQGIe6KQyitVTCFOzp4XA5H4Flf0rEzLRF3hKM?=
 =?us-ascii?Q?Q++s16mtTnqIZ331LOII7qyTJzdKCgMMILu09ZYxvuulzLXFyiWnbQQI/57S?=
 =?us-ascii?Q?8cejxeVFAG4RbtxO7t3LX8TvPlQ6K8dY0nLYSJFBmdqXp2mWak756643Be/w?=
 =?us-ascii?Q?imlOIk2nwVKThEybuKECydFh3bY4eShm8RzXLpGeiXfkwWFPanrufyVaYS/I?=
 =?us-ascii?Q?szY2bJ5Mni63IhfXMQGcCYEtYN32DsweZBzMrpumFDPI8dXtPN2GGXVb9BZ9?=
 =?us-ascii?Q?Ip73uN0QiTLeH9MKPaRgSiBCLZ0mMJAE1qGS6SabMPq6qGnqUL8vwusyCKtY?=
 =?us-ascii?Q?U0MQoWMRHtPznkxXy7TqAyq7e8NntEQ3Bx9DlCCcCPsBZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dslYXatbpri53B68RAlOkkgwsVB0W9N3xpsxsqtSx9ZnWMEV2/lMaanaFjS/?=
 =?us-ascii?Q?H48iN3O8V3pi7tc90ndbYSRBSEDDDlua4MjXXoxKd4bBgAYBafjKEMGEHqV/?=
 =?us-ascii?Q?dq8nxcIkn31xDw2FHxqbCch6MYVjb4a6GZeHo6Zcnjm/bG8rOZsxpn7e95nx?=
 =?us-ascii?Q?4epvc5H3rXEtJoEtGWrxJvIPDJOcxLlyipBsRVOUmHht5NPoQVbulwoGXLhL?=
 =?us-ascii?Q?OcUvqxHZ1toJ8k54VzusD9DxbzHHxQ9ktvpaAEUk2bdueVFyNY9j+V5O3WSN?=
 =?us-ascii?Q?MpUK8PUAa1dJm7sGBaRzhtEWMe51GOr4lyzV2hFGpNTtx1w/YEM6vyLJ6OtD?=
 =?us-ascii?Q?5dzLnmWrLuK8a4xF0ePWfWYUZhTClWr/LIYMGtXLlBM7GKkaQ4uShqdHvGsa?=
 =?us-ascii?Q?kaBiTaIw8EX+HN4ynONvOvH8KJ+0bYj2QqKwWqLrzvCwAOWwqjJwvls/+IvK?=
 =?us-ascii?Q?aHnExO/vWJ7YXjrdePR/hGJOkizHfwJrKrJ3OzcyaI+zM3DGO2kGnB7lRQtU?=
 =?us-ascii?Q?mmfccH/9tTWBpPlx6SeWSIQ8rduXgctutotOfV37a+N8kc45lXtJIAfPOUMJ?=
 =?us-ascii?Q?s3Le+icmS2v3nDnb3lkxKZJeB5dc7DKp/9q+9JNIOi5VCi5dG3GjIA046cxM?=
 =?us-ascii?Q?AdlTsLkCBi+G1eYsBB5xqPGL01eKN+G+NTfK56Nf8tC2UZUm7HjzZ0vHSR4t?=
 =?us-ascii?Q?q+KIJO1fmA9EwsfaaXKzajGpE46m+eBM02+nIN/+cLA/ajM27Vf6m5Al5Pph?=
 =?us-ascii?Q?5T7PJZt0Mo+IzFU8Xs+9cM7TWJme/8jaEmDgyGUb/yOD2iLCx0LHFv0d3kBd?=
 =?us-ascii?Q?6ov/VHa3Kyov3Xh8QyJ9UlBxZQ392oVQrH2bAFJW8zvsPoHWkiZy777LO4LG?=
 =?us-ascii?Q?ypnAoxHbFfNzsjuEU6FFPbWDxORTQ//3HrTkbePwW/uzB82ichhQlgiVFKfu?=
 =?us-ascii?Q?k+riQlLnIr+4nEbHZCft09MZCdJgrWRCow/stZzcyMzaCL49x8eOuPUAdBGN?=
 =?us-ascii?Q?bNMOGcm91cIajG6w0xAR6JkmmnqT8gqL/rYiIqnS/rz/AD6k0lIChDMVUSup?=
 =?us-ascii?Q?lLeXEhnOQN9q5Hj0S/+1zW47qROvWJ7AKepJ89IrEgQcnuB7goSXv1cjKKdM?=
 =?us-ascii?Q?EcFZL4yEkqsUkvQ3pP8GBSAdFxQxtMKrVtZlhrnBUupi2RjZRSm057+3TaDR?=
 =?us-ascii?Q?jld/Vd37SFBys4AOytPquBholXzvIWLwKgQxbquHXQEMSgJxbHEVYR/4dB7A?=
 =?us-ascii?Q?0iBogK7CCj25Dz6P7deSEg4D9lwN94aOHdK1SEY/VT9+6T1FqNl7bdgqH0Yp?=
 =?us-ascii?Q?f+fU2YD6cK8L4zD7ihxbpf4CiVk4vP0yzfFlAOc613LJuzmD085F36qC7whH?=
 =?us-ascii?Q?NdcQtm2twMOYuvKxaNsBb2hA/WuzN7fnzE0jc92zF4zvBuAdPYVG3e3DnPCN?=
 =?us-ascii?Q?1OWdkE4uMHHkcQpZVTrt8/5IfrwHRiu3hwR65nHaRgFhdKb1YD5vJOcVQbDw?=
 =?us-ascii?Q?eU32vcNNx+YXPLqLzPHT47m/18VLJ11wewWVs/RhcD7q9HVFHcyUN01hTQAy?=
 =?us-ascii?Q?VC2qp9ol893cyMKx7hhAAWHzCFunC4KQTGEvnSKSxSRrwMsS4wGMEJYHNpCT?=
 =?us-ascii?Q?rl6UUiJZblGUXD4CG1RiXEY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee8988c-fd46-483a-e6df-08dc785901f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 23:11:26.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn3EGIfXh+3N0NYdIxHOTg7CotJioypF2+x7Rmg3IIxbRuVz9wqTwAAjxbO4ZMOL3yQcijvozujVltqQ+rLtfpfvubqZnyNqStWHYQEIG0xKmEzg8z4LEJMAnpTrkPYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5679


Hi Amadeusz

> > +		if ((dai_link->dpcm_playback || dai_link->playback_only) &&
> > +		    !has_playback_both)
> > +			dev_warn(rtd->card->dev,
> > +				 "System reuqsts playback, but not available (%s)."
> 
> Typo: reuqsts -> requests
> 
> > +				 " Please update Codec driver\n",
> > +				 dai_link->stream_name);
> > +		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
> > +		     !has_capture_both)
> > +			dev_warn(rtd->card->dev,
> > +				 "System reuqsts capture, but not available (%s)."
> 
> Same here.

Grr, thank you pointing it.
Will fix in v3.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

