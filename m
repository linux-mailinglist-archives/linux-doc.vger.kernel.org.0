Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE8B60AF72
	for <lists+linux-doc@lfdr.de>; Mon, 24 Oct 2022 17:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbiJXPuG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Oct 2022 11:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbiJXPtl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 11:49:41 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588806CF5A
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 07:43:50 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id d187so8070523vsd.6
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHmQPHH9zZ+33MZuRep7mHnwYbLIC54t+fSNOg5Y268=;
        b=RqE7F5MvPhA2qPYcGDMg2WC36c/ya8S0CaGTkCLFCoNSy0LYw2pEJBOB/IKoaCEWaV
         b6+79fB4tTanoZBjY7Fo2X/0NYabUzhBlMuelQGTz957EVppUy7uLHG6QaZSla3B9yXQ
         6OXhn032XHxg5QRkvk/FCqxh1nFf72KOtez39VVtVU2ZobrTkzAarpAdLc1MHIUicZ7x
         9IrA8KyX2n1Wc8SGkUaFWVryKzby7j8MCVQOn4hgQjEY8G1/JwHmHTRLpbfS7RTYinzr
         NNc6x9W1fERMFC/C80tkaVI7MUT/2fXwRFpEdbUrqzdctaRtNeCvR6lKd2fKNhihIYhG
         3RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHmQPHH9zZ+33MZuRep7mHnwYbLIC54t+fSNOg5Y268=;
        b=kqbqzn7LIjz7k3WeM9fVszM/JHdPnwWzoX8kvOZmqCgginMeoH5BJhnX1uEng3KYXN
         7+iDMgdh9P76f43M6SCx4Xj08DvX7KVasCjWlpeqe53KjXlyzXcLFBrv3Y42XKUviEjD
         O1ouVDwzyzkcAZgphoA0XHbgmdxfN/e5hBN68FkBNw74ql+Ubi0U6/L43g71aquTH2TH
         c7KyyI0WvZD817QE+I6SdPzmze/ESIbAXZZ6OgRDR8vpw9VwucgTVxI5OezSEZuCJ/Z2
         tTIfW4EopdKTeKoG7GClauA6us37yD02tOZ7hPIprXMrsXla3wr0bwgs5LeAEJLVtRJT
         fi6w==
X-Gm-Message-State: ACrzQf1FsmS+gCP61IjSsrfj7Em128t4cf27J5z+01Z4/zf/XJljF/ta
        mwMDZX8AxFMBeCK41J2CRoveD3ZPv27z1pbp
X-Google-Smtp-Source: AMsMyM6IswFjqEAoVVX0inb+Y9m4C23pNohtdcPX0MoJFcRCefFyK5dlJjEhoQdRFZzuZeVMFsM+Yw==
X-Received: by 2002:a17:902:7c8c:b0:17f:7565:4a2d with SMTP id y12-20020a1709027c8c00b0017f75654a2dmr33857671pll.65.1666611374702;
        Mon, 24 Oct 2022 04:36:14 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:14 -0700 (PDT)
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
Subject: [PATCH 04/22] platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:55 +0900
Message-Id: <20221024113513.5205-5-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/acer-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 18224f9a5bc0..10d0819e48ff 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2421,7 +2421,7 @@ static int __init acer_wmi_init(void)
 
 	set_quirks();
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
 	if (wmi_has_guid(WMID_GUID3))
-- 
2.37.3

