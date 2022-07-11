Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D81455EA90
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jun 2022 19:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiF1Q7D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jun 2022 12:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237021AbiF1Q62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 12:58:28 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E467095B2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 09:58:14 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B546F83A31;
        Tue, 28 Jun 2022 18:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656435492;
        bh=pemWDkXYJYJHkIG427oBju+wORRrZ34sfzIWKrIjjq8=;
        h=From:To:Cc:Subject:Date:From;
        b=IvzCxh1aReSffScbyU7MPcoT71j/kqAsBwNudSXLIxDXxgV8fXjkKrQQK2GsZIqRV
         9jNEtx2DBahdLghW0yWnQbxgBdr+shycnXKVjDbMpZ0HOt3T0qGYxWMkGSzHwvmT60
         G3Xg0zt/SlOFP700Ow9+tUX8Ql4soSSs2ZTpDRQ0CwGssI+1mWPcOOv9JTyootYoVm
         fQGuQi/DmVTHzaMNieXdkBMoLBGUZ4LB9xDUG26v0/BE1thRcFTCFI2GLtUVXOHuj+
         E3A8nqpnSQsysF/M6U+sP2dlEjr2jQZqGhHJmH+UaQu0lM0LpCEkRXGsRlBik1EM2N
         RZTn9Ww3LSubA==
From:   Marek Vasut <marex@denx.de>
To:     alsa-devel@alsa-project.org
Cc:     perex@perex.cz, linux-doc@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ASoC: doc: Update dead links
Date:   Tue, 28 Jun 2022 18:58:07 +0200
Message-Id: <20220628165807.152191-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The alsa-project documentation is now part of the kernel docs,
the original links are long dead, update links.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
---
 Documentation/process/kernel-docs.rst | 2 +-
 Documentation/sound/soc/codec.rst     | 2 +-
 Documentation/sound/soc/platform.rst  | 2 +-
 sound/pci/ens1370.c                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
index da9527502ef0e..644f9200fd919 100644
--- a/Documentation/process/kernel-docs.rst
+++ b/Documentation/process/kernel-docs.rst
@@ -108,7 +108,7 @@ On-line docs
     * Title: **Writing an ALSA Driver**
 
       :Author: Takashi Iwai <tiwai@suse.de>
-      :URL: http://www.alsa-project.org/~iwai/writing-an-alsa-driver/index.html
+      :URL: https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
       :Date: 2005
       :Keywords: ALSA, sound, soundcard, driver, lowlevel, hardware.
       :Description: Advanced Linux Sound Architecture for developers,
diff --git a/Documentation/sound/soc/codec.rst b/Documentation/sound/soc/codec.rst
index 57df149acafc5..af973c4cac930 100644
--- a/Documentation/sound/soc/codec.rst
+++ b/Documentation/sound/soc/codec.rst
@@ -132,7 +132,7 @@ The codec driver also supports the following ALSA PCM operations:-
   };
 
 Please refer to the ALSA driver PCM documentation for details.
-http://www.alsa-project.org/~iwai/writing-an-alsa-driver/
+https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
 
 
 DAPM description
diff --git a/Documentation/sound/soc/platform.rst b/Documentation/sound/soc/platform.rst
index c1badea53d3d3..7036630eaf016 100644
--- a/Documentation/sound/soc/platform.rst
+++ b/Documentation/sound/soc/platform.rst
@@ -46,7 +46,7 @@ snd_soc_component_driver:-
   };
 
 Please refer to the ALSA driver documentation for details of audio DMA.
-http://www.alsa-project.org/~iwai/writing-an-alsa-driver/
+https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
 
 An example DMA driver is soc/pxa/pxa2xx-pcm.c
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 94efe347a97a9..89210b2c73424 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -8,7 +8,7 @@
 /* Power-Management-Code ( CONFIG_PM )
  * for ens1371 only ( FIXME )
  * derived from cs4281.c, atiixp.c and via82xx.c
- * using http://www.alsa-project.org/~tiwai/writing-an-alsa-driver/ 
+ * using https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
  * by Kurt J. Bosch
  */
 
-- 
2.35.1

