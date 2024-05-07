Return-Path: <linux-doc+bounces-15874-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553218BDD81
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 10:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34401F23A62
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67B514D43E;
	Tue,  7 May 2024 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I7y8VNSd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496614D2B1
	for <linux-doc@vger.kernel.org>; Tue,  7 May 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072004; cv=none; b=pF+hDlfvsHJplPeyz3IcVBGPxs8zRzklRVGZviuu7a3RoD5alYVxZsYA3YQIMKty059XtXne8MKDGy2YrcHcYiL239AGwnwID39zPykIq3UgYKEIFWtBZ/RCA5JlP0u+taAeiAoaJ87Hjdwzp4Q5XNHOpPCDcP0PJwSRBzdZpmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072004; c=relaxed/simple;
	bh=U8OQatDW4FjtbvC5rTx+PuIOqv56NEu7e4PvA5d1ACs=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=OqhCuufiMvEso/N9jp3Bji5JM6PIq0Y/qZM+0zBiFgM0znHSf4VfExuxo7HBc5hSuoLT9in1MZaxPOL6cZu5NNHcHaAvalHeuoxm7AJ3lw8YC1z25NsQbz2pH/jqbhhFABABWSVplC6KfV13Pe/ntIst0MqsIv+ZOobhy0vsi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I7y8VNSd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so3395616e87.2
        for <linux-doc@vger.kernel.org>; Tue, 07 May 2024 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715072000; x=1715676800; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xCxOzDLdEh75jB6y9qUsYnk1sa4ucuKaEHLhrAj+2nA=;
        b=I7y8VNSdnwTnVtWftc8vZKkb56WWpt4WMj10bSIJlpcs+ajO8rleyMIytXyJ4sL9te
         wvrBhmodZNpbFU5a5i55cISLo8A/8RascHZOkGUFXBQiVxgmZWWhL32iduE+qEPG1JiI
         rqYWTkYdISKUhEBmK68hrHutUm5FwLspkKrhh7o35x3LJXrvY3Wc9i6W2y2NeAHzFNae
         46BM5RrQs4Jtz/aM0djL9Tv2Ic4FDKd/VMC2ipJgGkJLJWs6n0NVkKMQVLpyZnyso+J9
         ngX/1JnYxqa2RPGfZ0/mSt4Vb0rxeBj5Lon81o5AInsVRWBj4V6gJA7HrvcCZ/7chEm2
         31/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715072000; x=1715676800;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCxOzDLdEh75jB6y9qUsYnk1sa4ucuKaEHLhrAj+2nA=;
        b=YhQ4iQdMkflWk1v7GP98PdcpNOaSmHIo1z8oRmWfTWe6TrjQgXz1loJmwii2azT56w
         IsVCmZocLNOvQI/MPN+wd1CpPuQjTAYlOPk4MfmDflXaONtE9+YeR8qitTIi1qS4Sq5I
         8EFR8eIYPPg1jKKPqsOckttd0CVuy8b6wRc6k7E9cjye5G9HaECGxypfXOW9hfVhxlt2
         ym67Fv5UxOEU+Q0eUThYIFooEidoawPS3HXK3uspOeKQerMh1yPko3b/jm9WS+T8tAjd
         cw9678PfHzo6Hn8aNNT8r/KN29U9BwXRQ6yNOgKvcwW5QZuUAURHqrIFkPDlwMCrtaRU
         6ZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6gUViViZjeJR8HqgnCQs1u4xwg8BcvfJC/4Y+IdQs/9I+U9UBXqlpuoh9r+bgIHeZckEQGsRqrBvz3UgQVnssWcUYp0E/yyd
X-Gm-Message-State: AOJu0YyrAELNus1z2mZa+aTyMAie8JF/NJ4FrU/bIWfOQIwlkVGrMxbY
	SB/ZdCRI0zmfOazJEaLvrgBzCl0YwSU5tbN0voa028EDm23u7jYvrhsgf5/Vlpw=
X-Google-Smtp-Source: AGHT+IHowCcLFFaLyyT16y8DxcMAyDiK7IAn6wJm9zlWi1Dnoyl03rPbptGdEMLcTqFhlY4mJAuSmg==
X-Received: by 2002:ac2:58fb:0:b0:519:2d60:d71b with SMTP id v27-20020ac258fb000000b005192d60d71bmr7323830lfo.22.1715072000389;
        Tue, 07 May 2024 01:53:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:970:8464:9c54:e891])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b0041c542636bcsm22453098wmq.44.2024.05.07.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:53:19 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
 Jonathan  Corbet <corbet@lwn.net>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
Date: Tue, 07 May 2024 10:47:22 +0200
In-reply-to: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 07 May 2024 at 04:32, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark, Pierre-Louis
> Cc each ASoC driver maintainer
>
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
>
> And because of its history, DPCM has been checking CPU side only. But it should
> check Codec side too same as non-DPCM. Some device/driver has been bypassed
> this check. It should be error. [2/3] patch indicates warning in such case.
>
> Because dpcm_xxx flag is no longer used by [1/3] patch, 
> snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.
>
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
> but maybe v6.11 or v6.12 ?
> Please check each driver by that time.

Hi Kuninori-san,

I have tested this series on an Amlogic device (vim3l)
This brings warnings for cases which are perfectly fine.

For example, one of the DPCM backends is the TDM interface. This
interface is capable of both playback and capture. It can be associated
with any i2s/TDM codec.

The codec may do playback and capture too, but it
may also do a single direction. Then usual example is the hdmi codec
which does playback only.

In this case I get:
 axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver

I don't think this is right.

>
> [1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
>
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
>   ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
>   ASoC: remove snd_soc_dai_link_set_capabilities()
>
>  include/sound/soc-dai.h               |  1 -
>  include/sound/soc.h                   |  1 +
>  sound/soc/fsl/imx-card.c              |  3 -
>  sound/soc/generic/audio-graph-card.c  |  2 -
>  sound/soc/generic/audio-graph-card2.c |  2 -
>  sound/soc/generic/simple-card.c       |  2 -
>  sound/soc/meson/axg-card.c            |  1 -
>  sound/soc/meson/gx-card.c             |  1 -
>  sound/soc/qcom/common.c               |  1 -
>  sound/soc/soc-dai.c                   | 38 -----------
>  sound/soc/soc-pcm.c                   | 96 ++++++++++++++++++---------
>  11 files changed, 67 insertions(+), 81 deletions(-)


-- 
Jerome

