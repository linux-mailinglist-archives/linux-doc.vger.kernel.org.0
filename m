Return-Path: <linux-doc+bounces-14504-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2A8A91DD
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 06:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5061DB20FF7
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 04:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09BE54743;
	Thu, 18 Apr 2024 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e/+rK8vB"
X-Original-To: linux-doc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2067.outbound.protection.outlook.com [40.107.113.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7F39850;
	Thu, 18 Apr 2024 04:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413709; cv=fail; b=fzonIIlyDKjymPesVXhq0Vr1hqZK7fYf02GMUUZnP4HAP7Y2oPirRKy8vyZxeWV8FflbxbqKgah5Cx+pMKgZgH0amIAdyO5z/wYH7nv/P2C8cpullujv78mzMQUSKAU5Ry2CLrlw0hrO9vQ1F696bUKJbjAkxDM+j+TVDSlTFX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413709; c=relaxed/simple;
	bh=wNERBcOaEDhUjVApjqfWTWSk0UTezlpWynxXl9cv/ro=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=VhiyifrLBOu1h7Hppns6XEra+nD773JvyxPmh+F4tX7tKNy28C/bGzb1cHP3HK7wcL/1TAuF/eeRkgLQDzzBiWEoacVCH7cN0WoIVzvuU35klzl2maaY1dMsFZasv09Cy6qkUMSIFxQ4bzRaWFwj14hFpY7JpPTb5knoCmSwgxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e/+rK8vB; arc=fail smtp.client-ip=40.107.113.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV6OdjoxEaTfJg+IWQMUxGFa+Soe3bk2rGr1uvWMwaZfGE4DxJDgX5Kdun3cvlMSv55Wh3VTkzkgQfQgNXyLD9ptCKdpCr6HbxS9VCwGTC5JW3+2SRQowQaHbnQ27CN9XsebT62qAG2T74Ui3QTAlNTymwmt6nmmTuHqkdN2oHHegml9rtrqfoHaAJWRqTcXD0La7PJXveNuJW22fhyruDqg++HHCa3bb6bxhv5ATMVFkGXhr89gbLImWYWXv7bCtoa3CwqOYgXeU2gFaBNEdHfEBTC+DXGdLaxALKDY42DQRXCJTDgJp0lcl8x7mNsc0EjcYJSE+uFywXDrJzXWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTX2LEMs64/EALtb8tRbGa69mv/ttNFlE+0JeVztGPA=;
 b=BvQZM3212v3WWkv0VmOvFFmcHXxybNMDg+QB08bgcb4W/WL87pbgRW1a//2JSrCYOh5XpV/7aKfr9OLH5bp35nPpPeOJ7ZV0PZ3/lk/Cr06gnPaq8fE2cdkeZwN3cihk5f6Uc7zLGXAe6JrZKV9ttoZEbQE6FSpNGb1VKEoSqxVnrsf0WgXzvMYfariJ+/JWP9RW2VggqZsFazQFZInjgt7p2bmEef2UOhv9lJUhlkeh97awxDu+OjW+JZSsv5OKQ+jK4B910RVqbwXyfqufedvXBrCqJzmXUbtILAMwvVec0TVP+1sUw+BWlabarMlUHZ8Od+YBQEGL0KYFznGlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTX2LEMs64/EALtb8tRbGa69mv/ttNFlE+0JeVztGPA=;
 b=e/+rK8vB92r5s5Ff3N0QrboChahAmdZo3O/zgzfs3D+73uqbbuwHE9SjxR2upb0RHBZ6rUjmpkzC1QsoSMWJyD1yIRA0AuRHyF1ryMkLIjyrkLv2EwiElTKbT8C2QgZ8F5qyx5VaiWgZ0hHvjwPcJ/rADFAFHM2GetufE8IopnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:05 +0000
Message-ID: <87r0f371di.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 18/23] ASoC: atmel: Replace playback/capture_only to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:05 +0000
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aafda6c-fa8a-47b8-02d9-08dc5f5e2081
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	38oHpDr14uehyPpfchvdaLV5EaE2NXNZESTJVPclrEIdE9XiDzvGPJrTGUTAx+C5T/ARwlg552eN99kMTxh2nv7ujmz78njHnhJ015gc2KsA/8GQx3jbJCKn/65skqrJVqGNcizxcOIfVNRAYh5/l22qsSmKZlC4uN5jzPtMfHa4kEHh7EDEh8CVf0T0YrdUZEBIHfpikigysF2MjH2kycPgu1gox74BT9HOIZ6jsywLVLv46/GUhidOzczTnVchYn8/MAy3GcWICmVmBuWP5wFjixD5H4BYlbdCsvcXspKP9TeAoYNcwwRQzjgMpcxwqEJ8U8/7Zy/DYQ0Ls/YqQ1AO5IsDG5ACSypmFCntUD9S0JSnNEjjK+TZ93J16kHTX/YhA8hXaeaqeU+QPNsuDomLXev/XF7FRA1R8j5lon/QKj7yS6EnoUrdXnG8N9yx2HthK06eDYmGa0wW426vbCYUG8IIaKWSOVxw6llrOy1veLvT6nMwcGMYZNH2JK2PzLHOUczMwpu+77KhZzcXxlBDVMxa54+l5kxsk8FvIxjrw9DdvAJegRxMkz4RrJQCbxnV1ot+tXZxtTx/RH156uMAKWuCwSxz/KknV57D6Zye5hkezN9IXEyw0W7F/TniXctFAaAZxRXP/ZBqi0JWOU8e48qsmVPNp1b0X944Ukrvw3v0tIbGCXyrCLvaIw26m6DC5ji7XFwF5l2xjhnRt+7UzFmq52m1dmGAx1hMNMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tyAS7Gkki1273+vLvrMhKYqhCQcPKRmlzaaEW2gfaPERQgJTSZzfhxXNv2jp?=
 =?us-ascii?Q?Vzq3uTet0Cyw07V/KPXof8JJyW9H0odiXjiBSGqZ7uFsFnFUJ/KzyZCV2Y8v?=
 =?us-ascii?Q?RarVAwXCAI302KMuV3FD1g3fTf5IPibAaWVKIiZXKYsaNGvuDu9XULXVL3IE?=
 =?us-ascii?Q?b0erGGKnEys98RwMExXceHSb8taNveV+zYlG/9w1OI6J3U8IImEWEAw+4A1q?=
 =?us-ascii?Q?o1am8D1lCE4I330D78WthMGFPJv1x+8lsZwqcl3Sd8Jvyts07skT6a2z6Hlh?=
 =?us-ascii?Q?lm6MWlpbqVEvqi6DBn0ZJyk+n3THZSdWojxRi9YEr5nKkNuO2x4SWSzOnrrc?=
 =?us-ascii?Q?RO484IgnZWxHqkfvzH/HjPI4TkeFQqibZ5j8vmg7QQLFZZls5fE1iLaisxV8?=
 =?us-ascii?Q?Eb08AKnlsBUOqGw9z6KIQlQUApgzjQ6SDT/SHjsBF6y/Rsp0SNe2cNe80k6q?=
 =?us-ascii?Q?OH8laIlbl5Nrs1pYi+Djv72MlTtvgxzLDVD9cr1n8a4MgJLluuYm4wJUwXU4?=
 =?us-ascii?Q?RGV8LNQJvk5GkfngA8F9zgHzn/CZmN/y+51S8OVzSNWzcTbL9vDHJiMVcaAt?=
 =?us-ascii?Q?wI2fthOYj3IZMAfl8K9aa8Ets4fnkYJu9qjbVsksQjoC2XSBYK0gJ3bMRQ27?=
 =?us-ascii?Q?rtDvqLBr9PIwB9zG/fy1Lo6S+cwKkkJNipjw8GNdimnDo6TclJO3mo1M+evn?=
 =?us-ascii?Q?eb1pwIpMRWTs3+vNP8Ov9jiftPx+0In1/Yfq6m0zIB7YWmWp9CrLLywy5bFL?=
 =?us-ascii?Q?sSsDdJpSTrZbmggDGNo5ogjYbGFWkcU+x/AHWs9VgYEQj4Snlp32G0YKs58c?=
 =?us-ascii?Q?LsF+kA8QWlET+OSd6jwDo7C+McA7dxBnJzWYBV8cX7W0uapagrTEyb2BZdAR?=
 =?us-ascii?Q?zIYdbr5q1lQHRm/IBzMTOI9LDat2x1hwQuCa6ExRLcmi9n4/b4jpQNFAoT0M?=
 =?us-ascii?Q?+RAf7WO6jnmtqvUViwPCYeNqlH88UbKXhjkRJ+pJUph607CFiwkM7U7WqmYb?=
 =?us-ascii?Q?zxmpmYdJnAtPeFwmc+scAWmW3f/dBKlzuAQeQ5Ox3vRFkizkaU9xWHfaO61z?=
 =?us-ascii?Q?W/wsiaEQylR2AEqj9OrLRDsW6f6iZ+u6s48IUbZXAeZVGJKlm8TaO2KWzW+A?=
 =?us-ascii?Q?vSsgDIFHWNZ7S0uZTvCHnGbLqBrVO+CvKJzI144W/ODZlzvPcfj0M1c7HgJr?=
 =?us-ascii?Q?DFAlyCo3Iu916XaPY+67n1OvjiPbImxgGGOfziQOCx+7v/6VcDWvA/7/1jJd?=
 =?us-ascii?Q?DlefD3D9Aa1A2hGNC6j9CF5uasvM9x1JF78GhGJgCifNOUSFpptgj4D3TTPL?=
 =?us-ascii?Q?E3o7Rp0Yn/jUMyYoTSj4sVDgxXDo6MoH81CozYPIo4E5KJxomwb4AsrcB0Uu?=
 =?us-ascii?Q?r0kMkK+BYRW15AC/GDDLWlfGlp+IYAoN8g58MQ4OrgEW7P53HbgyIgnpshsX?=
 =?us-ascii?Q?a8Wm2n1HRxa3glua72B9cs8h+ch+5+xSn2868Xp4/dRpHesTebCDqnhD+Zom?=
 =?us-ascii?Q?XqyBk2k6OJM5LWS2sbIEYSQH1wgl+mzR058rLvqWSDIwue17UWCDmEpyK4ys?=
 =?us-ascii?Q?nevs+T25MgCns/7xQgP4NISYMjYGCaPVkxDoXLWnO7M0JVbR4dTxfSrgqSBu?=
 =?us-ascii?Q?ntrka2UZz5chSDuiKbtp6d4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aafda6c-fa8a-47b8-02d9-08dc5f5e2081
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:05.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqzoinWZi1vPWwmXJTz9+8A0qaEPhcUU4q0utKSzlTqnnd8sopuRUleit3auSV+75Hh9jGml4WE5s5N0N2tAXeLCv66ak3AmIoWZeHJIfGZwKxsoOaVJVAUIHI36DaiQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/sam9g20_wm8731.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index d3ec9826d505..264017d3cf7c 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -98,7 +98,7 @@ static struct snd_soc_dai_link at91sam9g20ek_dai = {
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBP_CFP,
 #ifndef ENABLE_MIC_INPUT
-	.playback_only = true,
+	.playback_assertion = true,
 #endif
 	SND_SOC_DAILINK_REG(pcm),
 };
-- 
2.25.1


