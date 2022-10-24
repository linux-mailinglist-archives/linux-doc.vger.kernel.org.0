Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40FF760A3B7
	for <lists+linux-doc@lfdr.de>; Mon, 24 Oct 2022 14:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiJXMAG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Oct 2022 08:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbiJXL7F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 07:59:05 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C0E7C1EF
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:47:51 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id t85so3757867vkb.7
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
        b=LFNGam9y4Mzo/GmaRHBG21OM1uk0hOommk74KXR9Ca3TMfQryGTVdhVU5ltrLDq2eZ
         02Sufh/O0mf9igu5dzzr9xfFTvUVJnusR47enfl8COOjleX5fwL6eAZaOwUFpStJHUJi
         hCLqEFuFEiStB87OEfhilZId7gmp5XPzc8feF2PYyJiV+KGbmtv9V+IgrRH+2aqz3DHV
         M+0XmnIQ2XPB2CwxIkAbGWu2tAx/w1WMTphoADzrca9LYFwO0Tc5zvTS7ycemczGbZdY
         uWICIlA0YHCEjqWRpSdtI+n8c9TyFLANwWLT4ZFSjfGAycLhmE5YxuD4ntG1ulSCg1AF
         sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
        b=gVGQAS9BNHL2fa90pCtqMQpiHz6mAfzq+bRJCxYt4Mb64mj899RL6Fd9+umMvr9Br/
         swEbTnOsRETsuV2EXvsn30r8aIqREpFciiQIVL43Vnozw1YWEgUmH7tKqKvKBUKs1LNW
         KpFESTbjInzD3QuM+MK/R9ZWSEfHV1TCQQrE7nKyMC4y+d9DpgNjS1kEu9+zfPaQmgWS
         npyMZyMj3Zek7HmTfD53nz0aG/6KLjcMmq3/fzqjAV028NoGxaYqN8j7bsQmCVPp8+qD
         q6qhDPuPmc0mdKFNeoDdqD7/ZyDx7RuJY248OnPLj66sUSwTmjldwqNMnEVDbqTAoso4
         x7mg==
X-Gm-Message-State: ACrzQf3ZB1nt3nMOQewhpk60dWN03oXP+myv6Ki48IkDkYd0QmdPN5SX
        4M5dsuMt7KfrN0Pm9BAbT95dsBvbpfyANFOU
X-Google-Smtp-Source: AMsMyM5su6ApWtiy+J/kwO/a0HneChUBGcY0XEPNt6nciHQoDPKXFdF+gj0Vs4qmtnJ6gx8k4rNCKg==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id x10-20020a170902ec8a00b001855462261amr32981480plg.160.1666611509068;
        Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:38:28 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 20/22] platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:11 +0900
Message-Id: <20221024113513.5205-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/intel/oaktrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
index 7c5c623630c1..f44a51dad16a 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -330,7 +330,7 @@ static int __init oaktrail_init(void)
 		goto err_device_add;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		ret = oaktrail_backlight_init();
 		if (ret)
 			goto err_backlight;
-- 
2.37.3

