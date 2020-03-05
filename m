Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B67B17A83F
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2020 15:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCEOyG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Mar 2020 09:54:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:44956 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgCEOx7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Mar 2020 09:53:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D73E2B2C1;
        Thu,  5 Mar 2020 14:53:56 +0000 (UTC)
Date:   Thu, 05 Mar 2020 15:53:56 +0100
Message-ID: <s5h5zfig8e3.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] ALSA: pcm: Add a standalone version of snd_pcm_limit_hw_rates
In-Reply-To: <20200305051143.60691-2-samuel@sholland.org>
References: <20200305051143.60691-1-samuel@sholland.org>
        <20200305051143.60691-2-samuel@sholland.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 05 Mar 2020 06:11:41 +0100,
Samuel Holland wrote:
> 
> It can be useful to derive min/max rates of a snd_pcm_hardware without
> having a snd_pcm_runtime, such as before constructing an ASoC DAI link.
> 
> Create a new helper that takes a pointer to a snd_pcm_hardware directly,
> and refactor the original function as a wrapper around it, to avoid
> needing to update any call sites.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

The code change looks OK to me.

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi


> ---
>  include/sound/pcm.h   |  9 ++++++++-
>  sound/core/pcm_misc.c | 18 +++++++++---------
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 2628246b76fa..f7a95b711100 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -1127,7 +1127,14 @@ snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
>  	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
>  }
>  
> -int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime);
> +int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw);
> +
> +static inline int
> +snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
> +{
> +	return snd_pcm_hw_limit_rates(&runtime->hw);
> +}
> +
>  unsigned int snd_pcm_rate_to_rate_bit(unsigned int rate);
>  unsigned int snd_pcm_rate_bit_to_rate(unsigned int rate_bit);
>  unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
> diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> index a6a541511534..5dd2e5335900 100644
> --- a/sound/core/pcm_misc.c
> +++ b/sound/core/pcm_misc.c
> @@ -474,32 +474,32 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
>  EXPORT_SYMBOL(snd_pcm_format_set_silence);
>  
>  /**
> - * snd_pcm_limit_hw_rates - determine rate_min/rate_max fields
> - * @runtime: the runtime instance
> + * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
> + * @hw: the pcm hw instance
>   *
>   * Determines the rate_min and rate_max fields from the rates bits of
> - * the given runtime->hw.
> + * the given hw.
>   *
>   * Return: Zero if successful.
>   */
> -int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
> +int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
>  {
>  	int i;
>  	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
> -		if (runtime->hw.rates & (1 << i)) {
> -			runtime->hw.rate_min = snd_pcm_known_rates.list[i];
> +		if (hw->rates & (1 << i)) {
> +			hw->rate_min = snd_pcm_known_rates.list[i];
>  			break;
>  		}
>  	}
>  	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
> -		if (runtime->hw.rates & (1 << i)) {
> -			runtime->hw.rate_max = snd_pcm_known_rates.list[i];
> +		if (hw->rates & (1 << i)) {
> +			hw->rate_max = snd_pcm_known_rates.list[i];
>  			break;
>  		}
>  	}
>  	return 0;
>  }
> -EXPORT_SYMBOL(snd_pcm_limit_hw_rates);
> +EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
>  
>  /**
>   * snd_pcm_rate_to_rate_bit - converts sample rate to SNDRV_PCM_RATE_xxx bit
> -- 
> 2.24.1
> 
