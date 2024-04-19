Return-Path: <linux-doc+bounces-14622-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CED8AA938
	for <lists+linux-doc@lfdr.de>; Fri, 19 Apr 2024 09:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56961C20EF9
	for <lists+linux-doc@lfdr.de>; Fri, 19 Apr 2024 07:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0450542ABC;
	Fri, 19 Apr 2024 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4fDgPKa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B53FBB1;
	Fri, 19 Apr 2024 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713511880; cv=none; b=hkl+HVEn8BrK6zU5TyW/YLiiFrEf8KNr+fF0SxetWE7uK0DZMElVdBWDR/y1k3qTcE3Uebj/pZ1KnuBrx211XzFkjvED1y3XbItv2CTFUxVUM6giIS+Saeg+RnHV36wd0M1Edg/qsMJZk8qHLuKVLMcFjUv3482bfcUnxKOJwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713511880; c=relaxed/simple;
	bh=1W1wKmyjgUnLlO7H58gYIoT+uueMc19QlOOhLij24FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KPdhNgEhvGcGmB8MiBIXVpf1jJipSWbhC/W0zE+U6T4Yd2u4QfHUCLlmA9oQPdRtLRorhC2foDjUPbxuBB7UqUNQxbY7Wa69RqXkAWa/XOt/Q7cKBj+XdBdnsYgJoI7rmpiuoblga5rn8ZDVWiGAx02ultEFCTcPZICKD1mrwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4fDgPKa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713511879; x=1745047879;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=1W1wKmyjgUnLlO7H58gYIoT+uueMc19QlOOhLij24FM=;
  b=m4fDgPKaVlSlGt5nt/3kxbBsXeqUCa2efoTxvDTe/RhyEcCwv4CxRcCY
   ytbSlNn48Fu+/DXVdQz9ydoD9QKYSSggLW7sLZ1i+bnYYNWsXdqqkfsKh
   MV2VstDONq8TPDcCAHhlGdcIrCjeaW89Bu2wVL94Aw7K2WUyeJYblTebl
   rssGX3stYOa2MLYIr/jCxv7eRYwbZRZQ748DybZwrcMfivOytprnLyI/q
   baIFI1UqPw8wGI8U4mM+W2grCIZBMh6jIQHiZ+GxpwJzn92D72/zvZVIT
   rqzXBrdE2atAb9CCIQD4LVXEba/xx3mfg5ckd9NzJv9aRvl3/dp1ZpynI
   Q==;
X-CSE-ConnectionGUID: 79EedCTaSjKcdhzRRsQ21g==
X-CSE-MsgGUID: qiM4vGCcQlOUY4pR1KgNtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8972448"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8972448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 00:31:19 -0700
X-CSE-ConnectionGUID: fCprXCqsQCC9GuV7KLXVkg==
X-CSE-MsgGUID: 43memXPHTduSJHre2tY33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23285237"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 00:31:10 -0700
Message-ID: <6bb27015-293d-403d-9144-b44454b6bc20@linux.intel.com>
Date: Fri, 19 Apr 2024 09:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
 <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/2024 6:26 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 4/18/24 06:19, Amadeusz Sławiński wrote:
>> On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
>>> soc_get_playback_capture() is now handling DPCM and normal
>>> comprehensively for playback/capture stream in same code.
>>> This patch converts xxx_only flag to xxx_assertion.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>    sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/intel/boards/bdw-rt5677.c
>>> b/sound/soc/intel/boards/bdw-rt5677.c
>>> index 54e3c5d3c251..9170b1d509e2 100644
>>> --- a/sound/soc/intel/boards/bdw-rt5677.c
>>> +++ b/sound/soc/intel/boards/bdw-rt5677.c
>>> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>>>        {
>>>            .name = "Codec DSP",
>>>            .stream_name = "Wake on Voice",
>>> -        .capture_only = 1,
>>> +        .capture_assertion = 1,
>>>            .ops = &bdw_rt5677_dsp_ops,
>>>            SND_SOC_DAILINK_REG(dsp),
>>>        },
>>
>> Should this have been part of patch 8?
> 
> Patch 8 deals with the following changes
> 
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1,
> +		.playback_assertion = 1,
> +		.capture_assertion = 1,
> 
> This case is about
> 
>> -        .capture_only = 1,
>> +        .capture_assertion = 1,
> 
> I think it's good to make this change separately.

Indeed, missed that.

