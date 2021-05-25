Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C539023A
	for <lists+linux-doc@lfdr.de>; Tue, 25 May 2021 15:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhEYN0j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 May 2021 09:26:39 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36521 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233237AbhEYNZ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 May 2021 09:25:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CDA8F58070F;
        Tue, 25 May 2021 09:24:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 25 May 2021 09:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=+MtcwzdZGf0DI
        cSin4kah4fVsy649ehlVTzONf9i0AA=; b=tQvlytVIAXQpsVa3ZA4lxwtcfHlt2
        ffl8eU9hax/13TN+E3A68UTb45YlQIlGtyYhsYSp+N2r+31793vpkK4zggGaOBOm
        xxNR4o5uHA32QKWhmRY0nU3hnDBMy9WneMrEEFva/im/iKqS0xqdGrvKWcxg63aA
        W72pIkT76CnselR5X8h5ighg8HI6ETm3iFwzDkxYAHVp4y9voQxQSMNofGGgMeWR
        8sxGobcSJERFymAsPufRNvgvKew0ssK9MdaxPfjL6wcWXaNPdlDt7phbY4VG7HuK
        vJMFFYiNGLxbiK7aD6BV2BvaUUQgkm52d+70D6tRjN5Q9NTcNId/8HSkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=+MtcwzdZGf0DIcSin4kah4fVsy649ehlVTzONf9i0AA=; b=EENYoesd
        i7YrhZGkjzfq4ZoF3jeROBgwt8zDbgj0sW9PfbXwuzpEkrP25wHIMThu+K3P/ES0
        qlPsy/c6iwBjuJj+QdsVlcgXohptrgDtDtahMq7tml5RfM6bU3fb61TwBu1RGDq+
        T5ksX/8Z+CokNX3QPiedR51R+XYxC5CL4mtNmup7ko4MTQpixCN2610P87cA1xEJ
        pgNvNvzws3tFUAclMrsq7eT4qE8Vb9RhuLR4j6P2Hq8ipoXILbKcUuzY9Kozf2M4
        Tylb0oFRMnxzQ502kWuLiNWbPXMKhDaAMn7/MDC8Te61H+daz6vfupIBHPEB2BuJ
        lgBXCw55b3nGJQ==
X-ME-Sender: <xms:evqsYPtSMgP-4egp8V37Ht4Vi8-jBC83bkQraT-TDpBdGEhOxx4Lkw>
    <xme:evqsYAfzVASxKa469gimuAca3o2lJ9p5kOEAbLs8vDVxlzPnZrDiMjV9M1M9TVTeb
    1XSjt9lpJv_8UJVXy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepfeffhfevfeeghfekleehieelledvieelgeduffeivdffvedtheejuedvjedu
    gfeinecuffhomhgrihhnpegtvggrrdgthhgrnhhnvghlnecukfhppeeltddrkeelrdeike
    drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:evqsYCwcWD5nYmGoClsFvi1GgzzDDUHMGvON-K2icidIIvbWbilG7Q>
    <xmx:evqsYOPyRhqxje9Y7byPjn2JUFPNtYrtpoOxoyDe94Wo1pnMW70TkA>
    <xmx:evqsYP8g9e1cl6pMFVdgeVwgNg-2SitHyAsSravAiWZpgSTIeG1mJg>
    <xmx:evqsYFGmQPGWSwHAXnpdOILCVXe536pKioESyVdBHfb3kTZqOfz25Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 25 May 2021 09:24:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, linux-doc@vger.kernel.org,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Maxime Ripard <mripard@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-rpi-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Date:   Tue, 25 May 2021 15:23:47 +0200
Message-Id: <20210525132354.297468-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The IEC958 status bit is usually set by the userspace after hw_params
has been called, so in order to use whatever is set by the userspace, we
need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
and mandate that either prepare or hw_params is implemented.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/sound/hdmi-codec.h    |  12 +++-
 sound/soc/codecs/hdmi-codec.c | 112 ++++++++++++++++++++++++++--------
 2 files changed, 99 insertions(+), 25 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 4b3a1d374b90..4fc733c8c570 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -65,12 +65,22 @@ struct hdmi_codec_ops {
 
 	/*
 	 * Configures HDMI-encoder for audio stream.
-	 * Mandatory
+	 * Having either prepare or hw_params is mandatory.
 	 */
 	int (*hw_params)(struct device *dev, void *data,
 			 struct hdmi_codec_daifmt *fmt,
 			 struct hdmi_codec_params *hparms);
 
+	/*
+	 * Configures HDMI-encoder for audio stream. Can be called
+	 * multiple times for each setup.
+	 *
+	 * Having either prepare or hw_params is mandatory.
+	 */
+	int (*prepare)(struct device *dev, void *data,
+		       struct hdmi_codec_daifmt *fmt,
+		       struct hdmi_codec_params *hparms);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 5d6324585a31..a67c92032e11 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -481,6 +481,42 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	mutex_unlock(&hcp->lock);
 }
 
+static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
+					unsigned int sample_width,
+					unsigned int sample_rate,
+					unsigned int channels,
+					struct hdmi_codec_params *hp)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	int idx;
+
+	/* Select a channel allocation that matches with ELD and pcm channels */
+	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, channels);
+	if (idx < 0) {
+		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
+			idx);
+		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
+		return idx;
+	}
+
+	memset(hp, 0, sizeof(*hp));
+
+	hdmi_audio_infoframe_init(&hp->cea);
+	hp->cea.channels = channels;
+	hp->cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	hp->cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	hp->cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	hp->cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
+
+	hp->sample_width = sample_width;
+	hp->sample_rate = sample_rate;
+	hp->channels = channels;
+
+	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
+
+	return 0;
+}
+
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -495,13 +531,24 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 			.dig_subframe = { 0 },
 		}
 	};
-	int ret, idx;
+	int ret;
+
+	if (!hcp->hcd.ops->hw_params)
+		return 0;
 
 	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
 		params_width(params), params_rate(params),
 		params_channels(params));
 
-	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
+	ret = hdmi_codec_fill_codec_params(dai,
+					   params_width(params),
+					   params_rate(params),
+					   params_channels(params),
+					   &hp);
+	if (ret < 0)
+		return ret;
+
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
 	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
 						     sizeof(hp.iec.status));
 	if (ret < 0) {
@@ -510,32 +557,47 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	hdmi_audio_infoframe_init(&hp.cea);
-	hp.cea.channels = params_channels(params);
-	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
-	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
-	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
-
-	/* Select a channel allocation that matches with ELD and pcm channels */
-	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
-	if (idx < 0) {
-		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
-			idx);
-		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
-		return idx;
-	}
-	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
-	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
-
-	hp.sample_width = params_width(params);
-	hp.sample_rate = params_rate(params);
-	hp.channels = params_channels(params);
-
 	cf->bit_fmt = params_format(params);
 	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
 				       cf, &hp);
 }
 
+static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int channels = runtime->channels;
+	unsigned int width = snd_pcm_format_width(runtime->format);
+	unsigned int rate = runtime->rate;
+	struct hdmi_codec_params hp;
+	int ret;
+
+	if (!hcp->hcd.ops->prepare)
+		return 0;
+
+	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
+		width, rate, channels);
+
+	ret = hdmi_codec_fill_codec_params(dai, width, rate, channels, &hp);
+	if (ret < 0)
+		return ret;
+
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
+	ret = snd_pcm_fill_iec958_consumer(runtime, hp.iec.status,
+					   sizeof(hp.iec.status));
+	if (ret < 0) {
+		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
+			ret);
+		return ret;
+	}
+
+	cf->bit_fmt = runtime->format;
+	return hcp->hcd.ops->prepare(dai->dev->parent, hcp->hcd.data,
+				     cf, &hp);
+}
+
 static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
 				  unsigned int fmt)
 {
@@ -627,6 +689,7 @@ static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.set_fmt	= hdmi_codec_i2s_set_fmt,
 	.mute_stream	= hdmi_codec_mute,
 };
@@ -917,7 +980,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	}
 
 	dai_count = hcd->i2s + hcd->spdif;
-	if (dai_count < 1 || !hcd->ops || !hcd->ops->hw_params ||
+	if (dai_count < 1 || !hcd->ops ||
+	    (!hcd->ops->hw_params && !hcd->ops->prepare) ||
 	    !hcd->ops->audio_shutdown) {
 		dev_err(dev, "%s: Invalid parameters\n", __func__);
 		return -EINVAL;
-- 
2.31.1

