Return-Path: <linux-doc+bounces-14583-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B08AA002
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 18:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55E51C20E01
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BB716F919;
	Thu, 18 Apr 2024 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbZFVEpA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62616C858;
	Thu, 18 Apr 2024 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713457772; cv=none; b=rM3YGhqhax8wlit8tgjnG+1lD9fp2hZj2Ef6/+sbcOAyVCgPaYp+fgUO02+8tjnkmLhgD02kvzM6EH552iWW7G7VNLIQfu/tBLrS2wVEnncgTNt2QPyMQtPFiDFTnpkznNw1y03wmq9p7ifuthOg6+gRnOwypSBw9/VeCYQrDUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713457772; c=relaxed/simple;
	bh=0kP32U7Suy6uQoOJjorW965cKQphIdVvkl6Lvh1uZ0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=McddF+sbSByjIgZyl0iJDf8tnSGU+y1OaqW3sJQClMI+hZ7DK37gyNxNOCCYr++LvAo86WIrR2j/SQ50PLxyww/0eg1H/xtZrBGgbK90GQfaDccFHIZd8rAr5kZpLtIu3ewUw9JtZiDy5jEZhPOO2CDnldkD6SHQX/A1WYw+c+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbZFVEpA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713457769; x=1744993769;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=0kP32U7Suy6uQoOJjorW965cKQphIdVvkl6Lvh1uZ0g=;
  b=TbZFVEpAPaSDTNkyGKasqfrhzZZfFrHVRgE7wRoMYBEVLeyxv6M03Iyi
   Ovw9AWqxW1wXBHsKBoO+EUHDm0qgizFW3UkDSUU9wYqafi70ApXjEs+S5
   8+YHfW1Eqlqdwso8K5utwckqylybPSpd+gVdR9k/btH8O/hTZM4ifqQJb
   sWzrldU4iv/sbq07DpyA6fFaQ1Xz6NcjASSSjV3w9vXqTP+VlMz/xISa2
   ohF3HAaD5e/UzqG53jreY2fShy+46nDhVnlwBk3I9qgQzKikiKirs6v+n
   xfUDUOOUoP+62Px5/2A9aUhrp+fwpRmybq8hzon8T23jpdh0qcih8ZtEh
   A==;
X-CSE-ConnectionGUID: sfv2omDmS0edDm7n2Yp5pg==
X-CSE-MsgGUID: k74A/NDZTX2TCn+0BPxakA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8882333"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8882333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:27:57 -0700
X-CSE-ConnectionGUID: 0j6z5O/LTrGXaM4mMcGzeQ==
X-CSE-MsgGUID: 6pcNHd1SRuG8qoQ9W8Rdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="23105110"
Received: from rswoodsx-mobl.amr.corp.intel.com (HELO [10.213.167.100]) ([10.213.167.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:27:50 -0700
Message-ID: <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
Date: Thu, 18 Apr 2024 11:20:23 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> (X) part is for DPCM, and it checks playback/capture availability
> if dai_link has dpcm_playback/capture flag (a)(b).
> This availability check should be available not only for DPCM, but for
> all connections. But it is not mandatory option. Let's name it as
> assertion.

I don't follow the 'not mandatory option'. Why not make these
'assertions' mandatory? What happens in case the the option is not present?

> In case of having assertion flag, non specific side will be disabled.

Not following the wording, multiple negatives and not clear on what
'side' refers to (direction or DPCM/non-DPCM).

> For example if it has playback_assertion but not have capture_assertion,
> capture will be force disabled.
> 
> 	dpcm_playback -> playabck_assertion = 1
> 
> 	dpcm_capture  -> capture_assertion  = 1
> 
> 	playback_only -> playback_assertion = 1
> 	                 capture_assertion  = 0
> 
> 	capture_only  -> playback_assertion = 0
> 	                 capture_assertion  = 1
> 
> By expanding this assertion to all connections, we can use same code
> for all connections, this means code can be more cleanup.

I see a contradiction between "expanding the assertion to all
connections" and "not mandatory".

> Current validation check on DPCM ignores Codec DAI, but there is no
> reason to do it.  We should check both CPU/Codec in all connection.

"there's no reason to do so" ?

> This patch expands validation check to all cases.
> 
> 	[CPU/xxxx]-[yyyy/Codec]
> 	                 *****
> 
> In many case (not all case), above [xxxx][yyyy] part are "dummy" DAI
> which is always valid for both playback/capture.
> But unfortunately DPCM BE Codec (**** part) had been no validation
> check before, and some Codec driver doesn't have necessary settings for
> it. This means all cases validation check breaks compatibility on some
> vender's drivers. Thus this patch temporary uses dummy DAI at BPCM BE

vendor

> Codec part, and avoid compatibility error. But it should be removed in
> the future.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h |   9 +++
>  sound/soc/soc-pcm.c | 143 +++++++++++++++++++++++++-------------------
>  2 files changed, 92 insertions(+), 60 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 0376f7e4c15d..e604d74f6e33 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -809,6 +809,15 @@ struct snd_soc_dai_link {
>  	unsigned int dpcm_capture:1;
>  	unsigned int dpcm_playback:1;
>  
> +	/*
> +	 * Capture / Playback support assertion. Having assertion flag is not mandatory.
> +	 * In case of having assertion flag, non specific side will be disabled.

again the 'not mandatory' and 'non specific side will be disabled' are
confusing.


> +	/*
> +	 * Assertion check
> +	 *
> +	 * playback_assertion = 0	No assertion check.
> +	 * capture_assertion  = 0	ASoC will use detected playback/capture as-is.
> +	 *				No playback, No capture will be error.

did you mean "this combination will be handled as an error" ?

It's probably best to have a different presentation, to avoid
confusions. Using multiple lines without a separator isn't great.

Suggested example:

playback_assertion = 0 capture_assertion  = 0
this combination will be handled as an error

playback_assertion = 1 capture_assertion  = 0
the DAIs in this dailink must support playback.
ASoC will disable capture.
In other words "playback_only"


> +	 *
> +	 * playback_assertion = 1	DAI must playback available. ASoC will disable capture.
> +	 * capture_assertion  = 0	In other words "playback_only"
> +	 *
> +	 * playback_assertion = 0	DAI must capture available. ASoC will disable playback.
> +	 * capture_assertion  = 1	In other words "capture_only"
> +	 *
> +	 * playback_assertion = 1	DAI must both playback/capture available.
> +	 * capture_assertion  = 1

nit-pick: the 'must X available' does not read well, 'must support X' is
probably what you meant.

> +	 */
> +	if (dai_link->playback_assertion) {
> +		if (!has_playback) {
> +			dev_err(rtd->dev, "%s playback assertion check error\n", dai_link->stream_name);

"invalid playback_assertion" ?

> +			return -EINVAL;
> +		}
> +		/* makes it plyaback only */

typo: playback

> +		if (!dai_link->capture_assertion)
> +			has_capture = 0;
> +	}
> +	if (dai_link->capture_assertion) {
> +		if (!has_capture) {
> +			dev_err(rtd->dev, "%s capture assertion check error\n", dai_link->stream_name);
> +			return -EINVAL;
> +		}
> +		/* makes it capture only */
> +		if (!dai_link->playback_assertion)
> +			has_playback = 0;
> +	}

we probably want a dev_ log when the has_playback/capture is overridden?

>  
> +	/*
> +	 * Detect Mismatch
> +	 */
>  	if (!has_playback && !has_capture) {
>  		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
>  			dai_link->stream_name);
> -
>  		return -EINVAL;
>  	}
>  

