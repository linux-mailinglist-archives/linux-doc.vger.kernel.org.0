Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17A26DA350
	for <lists+linux-doc@lfdr.de>; Thu,  6 Apr 2023 22:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240221AbjDFUfW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Apr 2023 16:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240158AbjDFUeu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:34:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832FACA24
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j22so4229151ejv.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhwGvdUF+7fwd5PhumtiSc1TmIcW9E51JLUOeBF/1GY=;
        b=b9hQWvBcTnT1CUox4p9xbf1lbIXxG+RcvFWZwo2pgara5YORXkPLb4bfBDlokb2BIx
         hZhHAKykuzPaPpfC7buTpoVB/PLte4iZ6zHzYuapEjD2RmuvnC+v3fpPc23ZA9tUG8dc
         UIfJ0ex6pVJ6IzIaABBmX48wcvbnLstESzKnIm+4wCvLvUO/dbh8pAUzkIeU14fR4uPg
         vi2swW+1RI4Gr1xmu7z3k7iq0UUqugnDJ/4HQD/29BTFtD/te1wziIcY7eUiMrJQjmXT
         HihL1r7FuCTTouAufUEhJPOUlUNET9+gaWESIsAub9bGEvpwAikPbdjoVpgZEVoJaaVs
         VOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhwGvdUF+7fwd5PhumtiSc1TmIcW9E51JLUOeBF/1GY=;
        b=VrMWAFLiVHHRiON1bxXzKsx9T5MlJr8L7JW+sfhcWbCBwtKowWqxcXHVgzt2IEqmI1
         No9pzDFW2WNhk35JR0gneFeCnFmyupVu5ShfeMDMbOq+SVWsCl6JdThSpYSEMtMRlKlV
         C6jCO+9AP0qo1u8gRZsfrPbfeACKKoSVHbgkZ5AzvESV4DXE/v8ljlF0aC3E1ddE3/cQ
         +6kBSiMcZKJQplA1sPI8RuJMBe1PsLmiA1AtF1UtwypgIsr0h/ZpZbR5KkRRvycgxx+x
         i/TvUHV+G1pPNjk4YQ33ca5ENKw6+uvkCLeKlYEvmd/1G8cSAT1PJ+O+5r8SsOwPGcyX
         cIGQ==
X-Gm-Message-State: AAQBX9eg0d04oa8cbgTGysxtiGP4oC0mYCRQWd9psFVjvsRtZtGBSvIQ
        nCTtvENQf/l0D4fJC7VlonoydQ==
X-Google-Smtp-Source: AKy350YxlEKCAkb5JxJK97l9oFq9lZAvm34QPhLiTrraT2zzuotNJJY0LVHdegiqyqoXFm+OMtm2Vw==
X-Received: by 2002:a17:906:d787:b0:920:388c:5c60 with SMTP id pj7-20020a170906d78700b00920388c5c60mr119377ejb.41.1680813168917;
        Thu, 06 Apr 2023 13:32:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 40/68] hwmon: max6621: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:35 +0200
Message-Id: <20230406203103.3011503-41-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/max6621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 7821132e17fa..0656eb1e7959 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -449,7 +449,7 @@ static const struct regmap_config max6621_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(max6621_regmap_default),
 };
 
-static const struct hwmon_channel_info *max6621_info[] = {
+static const struct hwmon_channel_info * const max6621_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

