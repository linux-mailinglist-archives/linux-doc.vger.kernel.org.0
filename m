Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF9F32D0AF
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 11:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238490AbhCDKaz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 05:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238484AbhCDKas (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 05:30:48 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA33EC061756
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 02:30:07 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d11so27023211wrj.7
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 02:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aM63+RDhluwqJBuGnmIJvTjjyukvVqWvoYfMxyCIVWg=;
        b=fp2CjAV/qoUqzdjpxUFgkrPiH/9HfdFVSvUHOrDSSdogHc27E7v/dCx47R/Ilw40ay
         WnDilZ1zYT5SbzV7V0q/liwsJvdsqqbutH9XCf1ouMzS/ibt2VGdRtZ957jl5p+2N3xo
         a2KkMckpwcgbHB7eoA4dRba9eV7FqOOBT8zlnalOfDU8iZgRIwCcUlBDRLDJkJeC2bNu
         rwiOmQzxlGsQkkpn+bXxXvp/xjQMhkdLYayVYTD6V7BUFQYR/AuODGoCfxhLRLv5sv0+
         UD6yyvHo7nlyDXKiDOQmksFpf7W33nl/FHPNXiqqwkb1bNwbKmTA7FF9o0IAlerHp036
         GGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aM63+RDhluwqJBuGnmIJvTjjyukvVqWvoYfMxyCIVWg=;
        b=Z28JT0LdnBLgY9dot6Ltcqw4QeeVBJdFOikk3WvkzcVi9IoV1Rv0jkqDSfOMUw66ZV
         wtcXdMabgKJHEP9OT05MfmjSbMASu/rpFV/EJQQHwv1KHxP43JKaup0ctjWhYPmKcXqs
         GiGIYaNRZw8dsy5BB4rgJjQZwDn/zcqN7NLYbE64X8dK3nyJVtQZBjEXDQWM4yDzeGF6
         y3Zhmb78S7BLg3+XKUkhM+6gWKqAUMppoj5/iayTP0zsG1mCj1u/TlS06Q/tYKBYJLfe
         UboR7qOaiV+fwZRJuo8m+mTlm6DVZXNHufwbNBOa7ArHOHOYw9nI6tWNfmO0IWL3/ldb
         0IYA==
X-Gm-Message-State: AOAM5337sTWmiZeSwh0uleied1LILXrENyKyHMMs2ATmMXgIKpyH4sYm
        jdo4+qD+9TgwoCA+VKmnnMusKg==
X-Google-Smtp-Source: ABdhPJxYKbyuYK6j0RpKfM0aApHGWIPxdId+ivpJNXTWOiixdB6hzMSJ+h4ihOcsRiNEz2Gh6nnldA==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr3236992wro.206.1614853806438;
        Thu, 04 Mar 2021 02:30:06 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 00/12] gpio: implement the configfs testing module
Date:   Thu,  4 Mar 2021 11:24:40 +0100
Message-Id: <20210304102452.21726-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series adds a new GPIO testing module based on configfs committable items
and sysfs. The goal is to provide a testing driver that will be configurable
at runtime (won't need module reload) and easily extensible. The control over
the attributes is also much more fine-grained than in gpio-mockup.

This series also contains a respin of the patches I sent separately to the
configfs maintainers - these patches implement the concept of committable
items that was well defined for a long time but never actually completed.

Apart from the new driver itself, its selftests and the configfs patches, this
series contains some changes to the bitmap API - most importantly: it adds
devres managed variants of bitmap_alloc() and bitmap_zalloc().

v1 -> v2:
- add selftests for gpio-sim
- add helper programs for selftests
- update the configfs rename callback to work with the new API introduced in
  v5.11
- fix a missing quote in the documentation
- use !! whenever using bits operation that are required to return 0 or 1
- use provided bitmap API instead of reimplementing copy or fill operations
- fix a deadlock in gpio_sim_direction_output()
- add new read-only configfs attributes for mapping of configfs items to GPIO
  device names
- and address other minor issues pointed out in reviews of v1

Bartosz Golaszewski (12):
  configfs: increase the item name length
  configfs: use (1UL << bit) for internal flags
  configfs: implement committable items
  samples: configfs: add a committable group
  lib: bitmap: remove the 'extern' keyword from function declarations
  lib: bitmap: order includes alphabetically
  lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
  drivers: export device_is_bound()
  gpio: sim: new testing module
  selftests: gpio: provide a helper for reading chip info
  selftests: gpio: add a helper for reading GPIO line names
  selftests: gpio: add test cases for gpio-sim

 Documentation/admin-guide/gpio/gpio-sim.rst   |  72 ++
 Documentation/filesystems/configfs.rst        |   6 +-
 drivers/base/dd.c                             |   1 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sim.c                       | 878 ++++++++++++++++++
 fs/configfs/configfs_internal.h               |  22 +-
 fs/configfs/dir.c                             | 245 ++++-
 include/linux/bitmap.h                        | 129 +--
 include/linux/configfs.h                      |   3 +-
 lib/bitmap.c                                  |  42 +-
 samples/configfs/configfs_sample.c            | 153 +++
 tools/testing/selftests/gpio/.gitignore       |   2 +
 tools/testing/selftests/gpio/Makefile         |   4 +-
 tools/testing/selftests/gpio/config           |   1 +
 tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
 tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
 tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++
 18 files changed, 1822 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh

-- 
2.29.1

