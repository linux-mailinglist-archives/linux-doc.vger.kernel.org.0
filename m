Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3207820B65D
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 18:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgFZQzz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 12:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgFZQzy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 12:55:54 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF95BC03E97B
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a6so9259475wmm.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YwEfQvmcAp1OzhHgbrf29ByeeRHA8D4QLJumMWlGdMY=;
        b=D1mB/+jjoHrmpzacMbrIPZbzyNR9c53DNmMqrnXYRh1ji4kj8KMh1BFxfXv+E3S3l/
         zE1ygnczed681pTpSj45J9PmD8Kljg4O1mxIskO0RbUq66weejJ7ltMYmR61WwiazY08
         wFM9S5AJtQmmX3cgoyCS5mk01HGvXtAlSB1At87hGWdmWEBT/FGfSwiAD5yEEqZswC+5
         5A3mqUXdDvGnF2J/fsdf28xc5qrA5VgQO3vidHdEI87VseGQOSxVGI0Yo9FQ7noYzqag
         OYyLeTHsfWbZhsnSVUbaXbBJRC/ConjEmK2/ZLLVgVu+YQFgALAkXSk/OkbYgWJu3Ovn
         UBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YwEfQvmcAp1OzhHgbrf29ByeeRHA8D4QLJumMWlGdMY=;
        b=KWmabsyaqiW+kUQBRZs87GEXjlQ0ya6N4Px/bFW1R46UlgISq3ndOsCmApimLLv3xM
         ybpBm2Czez5QW8trdhDh/BUUN9kTQIcNQlfQoaYO9lw8TuBFeMK1SvNACnTMrWV3XEdS
         zsQ73n9myp0dytO+Tw4rgxEpb04wrMQjHRnO1sOg6A2ZPhrGb0LjC/92suO4y8wlxTzf
         Z7Sj0H2whbCZjKKvOKM19Se0k5C4T7XpA/OrAEIF5WlcjOYYJ4DJGctjDYiG5LX/c2V4
         ABZxwuzjT68x63uSiXLLIc9De9NotFRM7VZ9A24i5WZJuUi4KZX+RPUdF0uU2KdBz8es
         PrFA==
X-Gm-Message-State: AOAM533gk4h0jJQIPGVEocu8zMK9nJ48zBZ6cjMocQ2c7h4w8/w0RAx5
        fCSez0OMCXU0CRZYcICdyjSEqCXL3XY=
X-Google-Smtp-Source: ABdhPJy08XREFDSmhdAEr3SYzJ2t9HnXgtq5h0IAaCZA65lnqgXMhF90VUJGb0CaBUmmjn+39KSZWg==
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr4457933wmi.85.1593190552393;
        Fri, 26 Jun 2020 09:55:52 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x5sm18654706wmg.2.2020.06.26.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 09:55:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/5] devres: provide and use devm_krealloc()
Date:   Fri, 26 Jun 2020 18:55:30 +0200
Message-Id: <20200626165535.7662-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Regular krealloc() obviously can't work with managed memory. This series
implements devm_krealloc() and adds the first user with hope that this
helper will be adopted by other drivers currently using non-managed
krealloc().

Some cosmetic changes to the code modified by main patches are included.

Bartosz Golaszewski (5):
  devres: remove stray space from devm_kmalloc() definition
  devres: move the size check from alloc_dr() into a separate function
  device: remove 'extern' attribute from function prototypes in device.h
  devres: provide devm_krealloc()
  hwmon: pmbus: use more devres helpers

 .../driver-api/driver-model/devres.rst        |   1 +
 drivers/base/devres.c                         |  58 ++++-
 drivers/hwmon/pmbus/pmbus_core.c              |  27 +--
 include/linux/device.h                        | 225 +++++++++---------
 4 files changed, 173 insertions(+), 138 deletions(-)

-- 
2.26.1

