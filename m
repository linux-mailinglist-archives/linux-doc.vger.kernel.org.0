Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AB060A3FE
	for <lists+linux-doc@lfdr.de>; Mon, 24 Oct 2022 14:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbiJXMDt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Oct 2022 08:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbiJXMCF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 08:02:05 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9157C1658D
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:49:36 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-12c8312131fso11525750fac.4
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9DD2Qn9ukDVbti7MaHb2ytvRgr63Gh+pODc8Oxcvp0=;
        b=mRQRZRI1N0fXR6ZhdjhBkiy9z0C8EnLK6gYwGYjqDkMwRaxlGNaP5gg/S/OvakJsTG
         j3MIV/2byA9qIHOxO3TCYFuxurjFmMwHfitpAimtA/68MM/VooXLqLsYsaKwrvgYMTyB
         6Z4pVEOBs5IqlX0BIZsa0XK+RYo2qG4L7wS6XkghOIRzy97bYyCuS6T2RVuWBkoNAZsp
         5OAXJzzDB82KI6oAxhG3ADEUNMHcMWzihVTgmK2hw0ruNAkoMfJvZ4SJ61OJTiGkE4ET
         XCl94Jv3FdldMl8SzpJhvBf/CL22EaB8WxpQl53oozj1okCtaLCSvY5Rm5InOnDmci1D
         XpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9DD2Qn9ukDVbti7MaHb2ytvRgr63Gh+pODc8Oxcvp0=;
        b=bwfq2Sq4f74ZmKI4Td9CF53HBu0jZBPLCAFVB4L0y+vXvCk68mosh9LKNXiqlqILXh
         CE6oO0HkOrdsLXcezjXnOn18quDdRXttwo26i1KqGriUBC1d9DUwgvMe8Dztv+aP3n2+
         TEfA18Wds4cqBD8Ci/rb90d3JCHMVnHk17jhuSo+Wrw3/Z6cUa1vi7eCLKbz/7jtKxuA
         nVYBxS1HKK0BHNpix9O1MRN2MGEG9SmtqEhfR2HwX/9ho/Sn1RNJjWLCnnlGO/pRqXfM
         0thg1o4/0TSJfeYe3IlnVxXgEQGW66o2FGuoKOt582rohtezraQmEjU+nVFPVVmchYBI
         /nyg==
X-Gm-Message-State: ACrzQf3j3QrOvCY4aWYbtXX1d4yqcSENGQqrATmdBVImdUvS5WjBerIG
        miybI2oS6qiBGriDuhGSlQY/QWm9ykZlw7o5
X-Google-Smtp-Source: AMsMyM4qEtYfk/brrspCDfsAk/ohN0i2+YSG3igNC8b1bqKv4WrKEdbaz330QILDZfX2MHi6JDfWfw==
X-Received: by 2002:a17:90b:3912:b0:20d:4151:1b65 with SMTP id ob18-20020a17090b391200b0020d41511b65mr74871319pjb.233.1666611458874;
        Mon, 24 Oct 2022 04:37:38 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:37:38 -0700 (PDT)
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
Subject: [PATCH 14/22] platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:05 +0900
Message-Id: <20221024113513.5205-15-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index ad3083f9946d..eaf9469fabb3 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -999,7 +999,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 		goto out_input;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		/* initialize backlight */
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
-- 
2.37.3

