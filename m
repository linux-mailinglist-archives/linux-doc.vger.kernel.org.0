Return-Path: <linux-doc+bounces-16825-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD88CDDB3
	for <lists+linux-doc@lfdr.de>; Fri, 24 May 2024 01:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF96B220F2
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 23:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8B6128812;
	Thu, 23 May 2024 23:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mxZ3xKEC"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2056.outbound.protection.outlook.com [40.107.114.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD368127E38;
	Thu, 23 May 2024 23:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716506673; cv=fail; b=FNsuLb1PcpAexoEmVPQ4kYOD4xSFtewZPPwvYYXKClrPDe+K00MBbZn+/FILZ/OdbN19leKcAIrMeRE6twud5bbWa4vTauqKN1tc5Kmm/gYRQr8rgfp1dzwcOrf1aaNvdewZKPuBHP01ZliNe+UewJ//ZT35RZH9AV1lB8d8BK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716506673; c=relaxed/simple;
	bh=67OQLR008/PHDbG27J9YnN1E6XXCmWUt63atUUBY5C8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fK1eetnVa1MBlSTnFfE3ase3PPwAFySeT5giT5pCBNZEefNVY2Av9vLTzRtLWhVVODmJajjkYyd+qXS+HmA2TmUQsSAug342GTLJVtok7Hf+sEGRIuE3ru0ycAVgNF4+2pN2SRzrynkIJMDeSxf7zULjq7tNaC2XF1MhXU4+/oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mxZ3xKEC; arc=fail smtp.client-ip=40.107.114.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32FtW0G+OujYw+WytFYBqgitBAvu7fOnYYe0cZV89cotpZpntpWXsxC07jkwzwKl6yYE32R1PZKdp1xZPWVuHKMDuM57jC4k4ltbbJTRRIDkvefOkKaAeCsmtqzMLe3v0oSRRqwVaX4iOtA4Qknibg/8T3Ej6n344nOXXLcMW4Nlp3En3+HmOqeSPBTspiVfvHej4AFMm/7XYgfiWdC3Q2e39yv68yS7zbV4NstofEWBT5bPyLKzU+2pqgBkgFCz/7ahCJXYUhxCvOMno6vk6xFgcJTL24/pW1ilBbWZE9+uss5eKw/SvifkHZrh7XNiCt2fsspyfg2dlcdlK6kow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jcc8c1u3b7e25qflWIdPZykKg9cvPMtdAattXKGolws=;
 b=U7p+F2GFI24rOmHfMGzFtwP+gET0kE+mj+gHrFXOfdtpxmEF0SIJpijfZjp8iBmLV9ozzrU04vwqubCOMMr5Rf/c+u/Zqwt3KlRxkIutDfg/Iy+uGpm+EAwTAgPL6bZiLCkmNgdIXrqG3G6JyXJtB5XoSk0U2IWSGCsgDJSTouRyeYkCtqaUPwk13rB7xi6486wl6EMqis9xUm3ZT4njoubNlYfHXX67WqJORXsqV436Hcmk4VJ7KDTd+j4CRYpGOs33QHfcCx/477qJL91be4x20JQDGsPR3l+KGyJ21PdD0b318s0WvzvvwEMcLhfSHvJaUYmpHqGHJ3/fWXfu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jcc8c1u3b7e25qflWIdPZykKg9cvPMtdAattXKGolws=;
 b=mxZ3xKEC1HGDpER734Zn+ZlbZknaAHGzbTY6Su7r/ULdf37FMxGVKkEHCdFfbBq5EghVVdJajVbHZ228G5cSwtQDQKlSH/hwBnFqCLvrm6FVk1BN2vIHyuC1aBmoUOebBoC8E31zYqPj47AigbJhvrQqaZq8/asSQj46fPyd9/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7054.jpnprd01.prod.outlook.com
 (2603:1096:400:da::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 23:24:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 23:24:26 +0000
Message-ID: <87h6eocdsl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <179eb2b1-0103-4105-ae66-fd0a86bd9fd1@linux.intel.com>
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
	<179eb2b1-0103-4105-ae66-fd0a86bd9fd1@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 23:24:26 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: e239a5da-0c38-4faa-0979-08dc7b7f7cd5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|366007|52116005|7416005|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?54jCVlXzZutFKZR4RFUY8G01XBa2N5w1849UFMBYWwzW0/GHyRvHqc/5o3SB?=
 =?us-ascii?Q?Dg2tRmsLveFjwWB+aEi0x+Wf84OmjF7Vx84RXJPUZBfS7bQlCTsaYt2VHFnO?=
 =?us-ascii?Q?OaBS3iUynLCDH4zvR04wpLuJQPSMlcCmrhJNpQMtuIIJRGMRAZ84+Qumlobo?=
 =?us-ascii?Q?mBW38Uo522zVvtMh8+4AI7oOJiQTayUm9ITEd6aLMJmmPOoBGYRsVlspw5eD?=
 =?us-ascii?Q?jtkpPuJQg/ETxqkji/TUEw46HE5Hrijrzw9P6zUfrGnEa6Djgzj0txF75+YW?=
 =?us-ascii?Q?GXZbHE/DAh0BNc5wh2JL27Pxq6KDUiEc5TmJKHPY6eEZ8t9bMOA6zMYZYlOu?=
 =?us-ascii?Q?qfOyls4rXzWgryK9f87B8RC4RpWv2HNhlz5dw09m67OES/RGiS/DdSVuSmUu?=
 =?us-ascii?Q?m3hd5PPFiiuVs8598Qy4B0dsXpP8+Ysdppn7Sn2QB7B3Kw6KfRVWMyiuBTAb?=
 =?us-ascii?Q?9xNSDiIeHrRLEjlsJdo3guZGRPC2wu7Fntj9xzHoGU0og/n9TWT0eztrYw3M?=
 =?us-ascii?Q?I04u0n0ESNAFNhxUEhU1xOP4wV1p8SgUZMyY9AuHm9yJZsJR4M9dLMZAur3d?=
 =?us-ascii?Q?aoNmq5Yhe+iRWbxUzZGr6rdvH8FCL30cgf5vBpOMFwRbWgsOMcjGpsMbuPCb?=
 =?us-ascii?Q?sU1Y88+nun9djPqRVgvtApHlyTVLzb9ZQs2FjV6WxxNnWccNQU0SIX2PWhf+?=
 =?us-ascii?Q?iZAjE3uPni+15w56chU4i0Swsqq2pIBuTjikSWySIsBShhRJlAozhrO20OhE?=
 =?us-ascii?Q?M1wAmUdR/Y83jp5jLswRoetO9+SSvOB50j9uMc7mQNYkvHkrl+C1Vl1Ih2+R?=
 =?us-ascii?Q?OkQ2FDdQQdCknD43BcPVfK0rcuWjr/NkFKI8ZOjJ1/ZL0baSq8roQfr3s2ie?=
 =?us-ascii?Q?tRi9EzFiMXcTs4hcmFFOM3WleeZ0bggjL2POvMAS5UfVptRddsj0rjzXQTdO?=
 =?us-ascii?Q?eMwl+9TEb9VNsl8wJhEbx56QI7ETCGOs7oRefOdR0tIwn5764uGQikOyjJe/?=
 =?us-ascii?Q?lkaaHaDFl88jnCbqK7rWC3bLaMAc63f1IF4Dyibgv6jHDs00SCHSU7Yaapgi?=
 =?us-ascii?Q?u1j9U8B+PjgBCIW+nKB01Pz08RVcZq08zHm9vHhoobvAUnIxUiNJBNlFDbxa?=
 =?us-ascii?Q?N0rZUMa49DDlZPkePLv3bLXNuPPqVLtCX/wpYwRoW5xX3188tfcTbk0cTO0V?=
 =?us-ascii?Q?lERVuLvcIyjELYrShlDa+QyJWiqwE74gKl5uclZGS/X+3CSLcMw6qwqWYq+s?=
 =?us-ascii?Q?X41uoB7JnPqZwWcSidE2AAULuQ+e7n1t6fVbqbl3GQl1JI0UGn7wAoZRRGXH?=
 =?us-ascii?Q?7hxErtHzF4KcPuOZlBPzv3L+uNPniJC5cgmuDX7DpNa/cA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(7416005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8D8ZtQgyzjq4RpDIXUbnp1YkyUu+4WmCnPs1MIUQbGjPdGgmuTR3MMZ/9+Cd?=
 =?us-ascii?Q?LhJa0MB7YcyJyWUZ0ChUamHXTDi4ru+CS+37sGTsfbm9bn8Je90deDjTEcXV?=
 =?us-ascii?Q?fr0wbV8UKrjynrOJZgUnRoaWChDXIBD+Iw79xKJpt8ULsNCYQOnx7x54Mvil?=
 =?us-ascii?Q?yNE0eaRyp6K/4M1QPgaFh5gOT8xAMLr/MWFsWfZMhVPWQ5EaZTgG6t4E6GRv?=
 =?us-ascii?Q?4YJcGbCbFqsD+wA8XtyEKEQlq5yhPzQ1HoZTPMePORTm1ZfP58A5yYascqtV?=
 =?us-ascii?Q?NhWB1NxT0WFYjsMzxzB0gdBRw04Xx3sdpq0c+hfQFcM1OY7Gzq2iaVmniwrq?=
 =?us-ascii?Q?5o2xgO8FnJl1qyaRyG/Flu3pkgyBhyQd0TucRnxli8YmpZCFPtliWBSDWZLj?=
 =?us-ascii?Q?8Uc2bRtPUUGGXcjdZG3FdAxBTTEniB3vo6o2ULQgcvtwVfpM4kz6194i6+Ne?=
 =?us-ascii?Q?V9MV1F3JvJqxlS8PlIpQwGJx2mnxg1WC7dvuuPRQzUit1XUzBGefT+mXagHd?=
 =?us-ascii?Q?YOSlm44T7JbbdsMnm9Lwc6GinNQZMGqWV8nG5a6y12jtgFiPtqEBCF+M+NuQ?=
 =?us-ascii?Q?Ut0DNJaVz8qbUeb4yKU7nrVwtuzLlz/dhpKpmGC4VPbHs7Hs7Gj8O4Qea8CU?=
 =?us-ascii?Q?I6C+bbtGu9Hp36N7xfh5vcqD21OaZHnvKVeM5v5H8E6rJQz3pUpHzBJcPS70?=
 =?us-ascii?Q?FmjR31libn0yK18pDOlC+lZeRKkPV9NsF06AihwhxY2oy8dikS7Hu/ebqv1q?=
 =?us-ascii?Q?waAWtk4QzrOerc2KFNVbf52zluyLH0zD7wE2fZjY8Cnw47o5UKwBfFsRkbgS?=
 =?us-ascii?Q?kJS0K2baftanJno8ImvlThjAtrUaTylBIbHsIQoSDWnaH6iErWEYC7jDlMcs?=
 =?us-ascii?Q?REKptMqtxli4hbGsb7J6KGeRBZo5ZwZLLWGjjihGdR+cIf/laXpL5C+ikOVH?=
 =?us-ascii?Q?hFXDL6A3ajvfhNWVeWPHTUMnoPg+pI9fNS+Zpm3q1dAGZBZ3W5rZ+gHW+Bvw?=
 =?us-ascii?Q?yr0CYQELLNB3fifYVBuf756+ZYTmc3ACEqUPstaRpvoOJuPmgqs1TJL1GX1z?=
 =?us-ascii?Q?YRmwuA2sSJqJu3xLCY8TC20cGJYFvMlYZb83/rnUkgBlFmrV62SvnO2eI1eB?=
 =?us-ascii?Q?PCEyRn308wR5CP2hoI/u5XBgQpPmyW7DyABumbrKTMA5FTTgWcZUf+FyLDOB?=
 =?us-ascii?Q?whHxLMBYBfnyM2Cp4sUT2MVd+SRyBEUVpHeaJxh+ZekbJG3iPX+NTlGXhAJw?=
 =?us-ascii?Q?EOgEol8pJ8Q36uhvYUeEAaftlfJlrEkMCRhJ22v+MTZYfYkLjjo3TJgeqcEi?=
 =?us-ascii?Q?HpGrwr6jtvupbBLh48DSAdkZrXXWooOpfaGmUu/XtYyM+AW+9/nOe+NDzhWa?=
 =?us-ascii?Q?pxQBn26Ftlo3XO3TvRj5f96hw9RANdta/Ca4XtcioviYTMDBtZCFpwXM1Z6I?=
 =?us-ascii?Q?LPB3BVkmTKvo4fGdgrsDRVFxIo3FOhgrcU4pO/juMnYwQqTR8T2Pqsw12rap?=
 =?us-ascii?Q?jr6o5dzNmA2eWc1/rQ5+NOx0Ne5wqOVIfjpGDvVFrqA+XL4CPGO44oWeAXpZ?=
 =?us-ascii?Q?ZJWgWj4HFYzy38mv0NihRTKwvJiu16uqrlcP3n4Fvc5CLw5VY2NE6pa30XwD?=
 =?us-ascii?Q?LQzjczmcHvfuWbz0T8SIZtQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e239a5da-0c38-4faa-0979-08dc7b7f7cd5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 23:24:26.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGGVqQ8nvUHM+/ACcsAs8fvem1h4D3MMK+G66k9Ni+6HU4PMwYQtOzUc1iQmmejWarBDnUsfwASExK9g49LFxOfEV6/Bb5LsJHWTp7zItvCjSaUG9cXVF8HWoRYnmZQ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7054


Hi Pierre-Louis

> We're already finding warnings on all Intel SoundWire platforms:
> 
> The DAIs are declared as supporting playback AND capture, but in
> practice they can only support one direction at a time.
> 
> The direction is defined by the dailink when it includes specific DAIs.
> 
> So if you don't mind I'd prefer it if we shared a patch with you to be
> included in a v5, to make sure at least the Intel platforms tested in CI
> are all ok from Day1, otherwise we're going to get lots of noise
> reported for no good reason.
> Shouldn't take long.

Thank you for reporting. OK, no problem.
I will fixup pointed typo, and merge your patches into v5.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

