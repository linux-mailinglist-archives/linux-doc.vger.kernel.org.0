Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC5DFFD8
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2019 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388517AbfJVIn1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Oct 2019 04:43:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38438 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbfJVIn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 04:43:26 -0400
Received: by mail-wr1-f65.google.com with SMTP id v9so5767948wrq.5
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vhZ1SfzcYNiDdElZtSQt3l3Cz+Qu9oLpAHMunMVCdo=;
        b=AAJh7JIjFp1Z9dxop/8X5n37zrU/890hVyGA2W4WC8M7YCO7WkH08lzDQhWmn18y9T
         ETxsbV1XFfLtE1uQnmi3HG8TJaG2dfoQQ1ylH0ymif8JcK5NZvn1SpgWfh6cRL8AKJQw
         GjJLae1xkOr6ue76TAPicbRLgQthO++1f2uuj4GaUGn1Od26Gw6OZUKVDPH4UBVK04Je
         f8tX8T84KlQU1nQAd3gBAzDM0L95VzDwYsSmdz/VQmClFR8F5CcjRVQVS3rkxhqRxAQo
         b5d3pdXsOWZ1sJczh0U6tvOMPutwqwU9Yuk1UYP/puD39XTfAqD0UK5UZV1Rxnhj/WWS
         5Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vhZ1SfzcYNiDdElZtSQt3l3Cz+Qu9oLpAHMunMVCdo=;
        b=Ln4+OuPgXQobO3k6FKGyta88aBNWM+h0qHt95W31S4oSBo4d5dbJdoDUjXyACQ+r6D
         AaWliVi3DQODPQPmi9tAryxAoitcUKvK+Ksb5Pp9b8qItVYuTGKJhmd30E6RVvBub5gy
         E8jm0GsO6ZmH56cpYJcjTEjiN3iMdW/kyw4mmUGiYrGw9oWx7ZAarK1LBCvBe3hrSUwk
         IdRURpcy1NKa6sJng9Q1w3h1g/azoLu1ypZk/koP0u1DjCw7cWeC78IOdPqgaPHV1wPh
         q888+qUeHiLANXNK2yneGW/UFjOc+LHoJaANQ+e2u8D6omrlgWE8J+EC+xh8w2XPVfS9
         zscQ==
X-Gm-Message-State: APjAAAWOLDN9fLB87Y1wrijzRc1QFVFfyLvcnU/DN+FeW9Rtal+Q9PKn
        U7/+6ZWv1NayzOfUKsJQSdlk6g==
X-Google-Smtp-Source: APXvYqzsCMDE+YFvmJRJslx0T60zeeblL7s7qMRBkyLbMjANM+hKlWzwOyzWUbrtdzcICjCqUStwIQ==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr2463395wrw.206.1571733803424;
        Tue, 22 Oct 2019 01:43:23 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
Date:   Tue, 22 Oct 2019 10:43:10 +0200
Message-Id: <20191022084318.22256-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Note: resending with Arnd's review tags and rebased on top of char-misc-next

The new devm_platform_ioremap_resource() helper has now been widely
adopted and used in many drivers. Users of the write-combined ioremap()
variants could benefit from the same code shrinkage. This series provides
a write-combined version of devm_platform_ioremap_resource() and uses it in a
relevant driver with the assumption that - just like was the case
previously - a coccinelle script will be developed to ease the transition
for others.

There are also users of platform_get_resource_byname() who call
devm_ioremap_resource() next, so provide another variant that they can use
together with two examples.

v1 -> v2:
- dropped everything related to nocache ioremap as this is going away

v2 -> v3:
- don't call platform_get_resource() as an argument of devm_ioremap_resource(),
  it actually decreases readability
- add devm_platform_ioremap_resource_byname() as another variant

Bartosz Golaszewski (8):
  Documentation: devres: add missing entry for
    devm_platform_ioremap_resource()
  lib: devres: prepare devm_ioremap_resource() for more variants
  lib: devres: provide devm_ioremap_resource_wc()
  drivers: platform: provide devm_platform_ioremap_resource_wc()
  misc: sram: use devm_platform_ioremap_resource_wc()
  drivers: provide devm_platform_ioremap_resource_byname()
  gpio: mvebu: use devm_platform_ioremap_resource_byname()
  gpio: tegra186: use devm_platform_ioremap_resource_byname()

 .../driver-api/driver-model/devres.rst        |  4 ++
 drivers/base/platform.c                       | 39 +++++++++++-
 drivers/gpio/gpio-mvebu.c                     | 19 +++---
 drivers/gpio/gpio-tegra186.c                  |  4 +-
 drivers/misc/sram.c                           | 28 +++------
 include/linux/device.h                        |  2 +
 include/linux/platform_device.h               |  6 ++
 lib/devres.c                                  | 62 +++++++++++++------
 8 files changed, 108 insertions(+), 56 deletions(-)

-- 
2.23.0

