Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6ACC55EA79
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jun 2022 19:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbiF1Q7E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jun 2022 12:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237346AbiF1Q6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 12:58:45 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3B81007
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 09:58:45 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F307F8407A;
        Tue, 28 Jun 2022 18:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656435524;
        bh=Hwup3A+MAo/IIHDWPJcJuA/ZrTCj+SJh32Gz9ZwYe6g=;
        h=From:To:Cc:Subject:Date:From;
        b=BQG+K9V8ApzpqQAaJ4fC8V+TIy6dMCZu2y4/wGUR5RtMBFWX7fNyCxjiv/5bjWH0j
         wlCJ6PHKEc8qmTj2T65tYXhsEAdEaNxoepgcoHcS1j+V0HPyD1vSbazexEeJ3/5/pI
         XJgmTpns8xOmtnqmV7ob4yKG8M4suuCOsho1GO/4oWWAgiMEHDLWZzR9To/OZIyG7X
         O25i3VEGR6D9DUp82DI1aSq1zPU7lP2+CAbnrvyw29hP3G2MqIp7G8Hfa0IL9XYFco
         y8pPrSz12+ilXcN8EGr0bL7+oU7DgxMg0ll9WaCBtiIJPTxe6Nkr/FR1W8VcLmnaRJ
         v+1+6z1ipPKLw==
From:   Marek Vasut <marex@denx.de>
To:     alsa-devel@alsa-project.org
Cc:     perex@perex.cz, linux-doc@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ASoC: doc: Capitalize RESET line name
Date:   Tue, 28 Jun 2022 18:58:40 +0200
Message-Id: <20220628165840.152235-1-marex@denx.de>
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

Make sure all AC97 interface lines are spelled in capitals,
to avoid confusing readers about where the 5th line is.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/soc/dai.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/soc/dai.rst b/Documentation/sound/soc/dai.rst
index 009b07e5a0f38..bf8431386d269 100644
--- a/Documentation/sound/soc/dai.rst
+++ b/Documentation/sound/soc/dai.rst
@@ -10,7 +10,7 @@ AC97
 ====
 
 AC97 is a five wire interface commonly found on many PC sound cards. It is
-now also popular in many portable devices. This DAI has a reset line and time
+now also popular in many portable devices. This DAI has a RESET line and time
 multiplexes its data on its SDATA_OUT (playback) and SDATA_IN (capture) lines.
 The bit clock (BCLK) is always driven by the CODEC (usually 12.288MHz) and the
 frame (FRAME) (usually 48kHz) is always driven by the controller. Each AC97
-- 
2.35.1

