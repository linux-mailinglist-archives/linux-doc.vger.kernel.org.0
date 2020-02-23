Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C534616959C
	for <lists+linux-doc@lfdr.de>; Sun, 23 Feb 2020 04:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgBWDph (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Feb 2020 22:45:37 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33323 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726965AbgBWDpg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Feb 2020 22:45:36 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id C4F966A1E;
        Sat, 22 Feb 2020 22:45:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 22 Feb 2020 22:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=xEUgRs6Eo7JPj
        +m5PuuwJ2k+XGQGKRuM1/o6sSyplzM=; b=Nnk7ZUObs/FREDBnMBIGIQlbk9/hB
        OHnQtloJwUPBSezuEntlSgCdrcuj49sBrzn+52lag/e10aT0skZWeUSN6C27672D
        s+yhPhKqHrV/p22xuXd4/fo0hD4cnmW3L5ECeeevPICnHmI7x0R8j7T7Yy/2xhQN
        XGoKxbZ+jL6aufYTesxziewgZ548tXriI2XjIvfEKXsuFlwk2PnQO5qPNd62wv1g
        c2dz16JrReSTHVrZSou953WnzKst8pDfS+1LTLJefpRznjPrl4XOdwGnKM3E0Agi
        sixVwXvy9Z/fb62b2zFZEfCzJebb2fd/53lm+kg5YslT3G1CBN0L5GkTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=xEUgRs6Eo7JPj+m5PuuwJ2k+XGQGKRuM1/o6sSyplzM=; b=nDYUDI5q
        8FR8xwUv4oxtygL7IpTmLDh/3bqPDsly1+AlprNxpKvRMKIxvU0XG7OJOUxllv+6
        5fjXtsYbM00wkW3dEKY2gGomFaY2Pcbtr/a8CDd9yotmgmJhrfhtvoV3ggU0Yxdz
        L8JIKZe9e0dwNEYy+zaN1lE6bUpNRyeIm8x63kyrNUAQt3W4V1ABwHQDpPaqKQXk
        w/O6VKlYGkHWEkit1/IRWGHLcb4s0ZsQTc9uPj5Z9NUsKz+ieV3qg4lRxRZPtgVM
        AxNWbhNcBZh5Hp9L6NtSiw16Jh43z0H9bURtPOz9zqNjqZNfpnIDr7YHPROl/isB
        YaerEMfAw4iAYg==
X-ME-Sender: <xms:XvVRXsGPhieLJ9ydI2nOrn5F2bTAYDPC2uNGwuU9Pjby6-2gR3AxiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
    ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:XvVRXg5FlqsUU1rgAW3-fYS5k3_LfJ4BW7rihWdkjvCZCM3he3aumw>
    <xmx:XvVRXtZEvRLeZ2-FlV6LSk-2uOz01uxpN3iIRJoRXzSVoPfH8Xq1dg>
    <xmx:XvVRXmfWil9w341ftIJdPZIthQJPbbvyXQoCgVKuispyKio3Gvg6iQ>
    <xmx:X_VRXkYXIkMNm3jW85dIxNcE7kl3MiOt4yI7aMamSjIfOhofnNdWzw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7105C3060F9B;
        Sat, 22 Feb 2020 22:45:34 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 1/3] ALSA: pcm: Add a standalone version of snd_pcm_limit_hw_rates
Date:   Sat, 22 Feb 2020 21:45:31 -0600
Message-Id: <20200223034533.1035-2-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200223034533.1035-1-samuel@sholland.org>
References: <20200223034533.1035-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It can be useful to derive min/max rates of a snd_pcm_hardware without
having a snd_pcm_runtime, such as before constructing an ASoC DAI link.

Create a new helper that takes a pointer to a snd_pcm_hardware directly,
and refactor the original function as a wrapper around it, to avoid
needing to update any call sites.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 include/sound/pcm.h   |  9 ++++++++-
 sound/core/pcm_misc.c | 18 +++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f657ff08f317..89529dfffaac 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1122,7 +1122,14 @@ snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
 	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
 }
 
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime);
+int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw);
+
+static inline int
+snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
+{
+	return snd_pcm_hw_limit_rates(&runtime->hw);
+}
+
 unsigned int snd_pcm_rate_to_rate_bit(unsigned int rate);
 unsigned int snd_pcm_rate_bit_to_rate(unsigned int rate_bit);
 unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index a6a541511534..5dd2e5335900 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -474,32 +474,32 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
 /**
- * snd_pcm_limit_hw_rates - determine rate_min/rate_max fields
- * @runtime: the runtime instance
+ * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
+ * @hw: the pcm hw instance
  *
  * Determines the rate_min and rate_max fields from the rates bits of
- * the given runtime->hw.
+ * the given hw.
  *
  * Return: Zero if successful.
  */
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
+int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
 {
 	int i;
 	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_min = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_min = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
 	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_max = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_max = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
 	return 0;
 }
-EXPORT_SYMBOL(snd_pcm_limit_hw_rates);
+EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
 
 /**
  * snd_pcm_rate_to_rate_bit - converts sample rate to SNDRV_PCM_RATE_xxx bit
-- 
2.24.1

