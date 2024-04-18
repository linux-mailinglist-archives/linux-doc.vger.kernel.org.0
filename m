Return-Path: <linux-doc+bounces-14584-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7878AA003
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 18:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3254A2854C4
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 16:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E0916F91F;
	Thu, 18 Apr 2024 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoH46lTi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E416C858;
	Thu, 18 Apr 2024 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713457774; cv=none; b=BHA/eddxoTuON7OM/BNpX7kRIf6c0dZYdrOk9FV+jyiW1IU4vMYd8VpiY1/KE6tBuErHI6PO91WLeDfjoA1UapZi9bpI0Nj4Nwl5ypnWKkBFiZW5xxIQT4PMwUWm7y2PCYgDkJXTBGhWN5wVej7XchGDuBxWRcq2LWeKFNbjmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713457774; c=relaxed/simple;
	bh=n5UTBwm9LwxWCwUD5WYTPdP8hKDjMr22biXL1uuugRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S2t8+NpLO79tu7WqACQg8BKJufLAbSwSZWTP5ZF7WDHLk7UmBuN1rc/tp0M35oGAavpjn+HqlCCgYdP9spVcwsJvSWrPvgm0a4wiRbguBHYTYM4oFw8yiYxKKqy/jkwu3Pc0fQhcBpxFDoUwhE/gUh3P6Lhy2/D1PkGwlgDlOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoH46lTi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713457772; x=1744993772;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=n5UTBwm9LwxWCwUD5WYTPdP8hKDjMr22biXL1uuugRA=;
  b=XoH46lTiQN7Z809wteNUddzuTyacce/RFSWOwA0nm/9wpm6xsq9kaSFF
   JyWxNo89D46lxLr/zSOnffqEv8E5UWPxQ934m+iwZ8NPA009poSiL2XBD
   zLMYWMuLS4yaej12DhT1tlXGgJYDRk/JhTaWqmZj7RNl6vI+eFfDkLS9r
   RZKrX/Tzr1wZXHX7mUdoEYu9gnkgonA6fuPFkJg6rQ95DJlNLVGQS2Ocv
   DRuodz1AtrCyd+FQkk1FUw9SiyirNNP6AwfaQQzW/2S4YBv5od1pI8zfb
   EAHZvAPVD5Fyc/Oy4Tm2/c37zz3YqmVfIwBMs9fWlvSTlHWGadV7PCmhA
   Q==;
X-CSE-ConnectionGUID: UUdFCRE6Q+OeSIROFp0XrA==
X-CSE-MsgGUID: sSneA3k0S2WqwsoN7AZrTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8882359"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8882359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:27:57 -0700
X-CSE-ConnectionGUID: QL+FsKavRtigEK3tKkR75g==
X-CSE-MsgGUID: ZaFP6k8bT0OPD8LxfPhFXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="23105114"
Received: from rswoodsx-mobl.amr.corp.intel.com (HELO [10.213.167.100]) ([10.213.167.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:27:53 -0700
Message-ID: <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
Date: Thu, 18 Apr 2024 11:26:06 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
 <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/18/24 06:19, Amadeusz Sławiński wrote:
> On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
>> soc_get_playback_capture() is now handling DPCM and normal
>> comprehensively for playback/capture stream in same code.
>> This patch converts xxx_only flag to xxx_assertion.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>   sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/bdw-rt5677.c
>> b/sound/soc/intel/boards/bdw-rt5677.c
>> index 54e3c5d3c251..9170b1d509e2 100644
>> --- a/sound/soc/intel/boards/bdw-rt5677.c
>> +++ b/sound/soc/intel/boards/bdw-rt5677.c
>> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>>       {
>>           .name = "Codec DSP",
>>           .stream_name = "Wake on Voice",
>> -        .capture_only = 1,
>> +        .capture_assertion = 1,
>>           .ops = &bdw_rt5677_dsp_ops,
>>           SND_SOC_DAILINK_REG(dsp),
>>       },
> 
> Should this have been part of patch 8?

Patch 8 deals with the following changes

-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,

This case is about

> -        .capture_only = 1,
> +        .capture_assertion = 1,

I think it's good to make this change separately.

