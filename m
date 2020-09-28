Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3200427ABFF
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 12:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI1KmB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 06:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1KmB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:42:01 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAC0C0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v12so634435wmh.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQMvlLYzShRCjCuL+yV81657EukM33lCWc0jTd+wtqA=;
        b=Q71rF1t2bmcMfRwytJBuynwNN15/ByLljGm4hKcReMfRR3aUAyDnZfL46xPJrM5reY
         261DLQFLCHGTe6lH7wxM4tXKkkSWtiPukBCugp85jIdF2XZwCTk0ebKmQ0EGgUhV7NIX
         NZcl1Yp9qKCFM+lQ1uoHwG4JXjNGpK47v7SmFKWlcGTAHOgnCdm5khI9IsIRygT8PWeM
         Ihqw7dQhY6PnKnxRUuVowQRqopazgpt+QVAqTI7EiCdXPngzR3EaFUfl6IaHlugtQluw
         SewPjypPYg/hpYLabx0j+uyAm1+cmc+8RNc20hkwql5hnN3TLagYaeZBnCPGPi3RI9EI
         XLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQMvlLYzShRCjCuL+yV81657EukM33lCWc0jTd+wtqA=;
        b=qjRA+Jahp3cSYjEUvOkwuO1JpnvD3uso6KaNcW05GkyBuJMV7tMuAIXT+FXBVnDAbA
         Jorscnle/mVBp/4uFiZgLe7bUT79J+gwAuYQUeIEW2z/OlmVZklHE/9oeq9rRqfeZkIP
         +N2tJ7tFdpzQx1k2l+JHEaa5by5j8Z1yFXmcRSpF6qizlOhXa8hcrSIY4AJD2CFGZYjo
         +gKTA/DA3gD861vxcbwSyXNAUBiIOgUbBo0vcSMUTE2fjRtq2CO32ffqpVygTs9oarIz
         4v4zGcENO+mG4yk1qhb9XzIg2Y/gPnU+P8f4O0yxfWHmX97L5b/Sa5F0cgucuwGy7Nuj
         gocQ==
X-Gm-Message-State: AOAM5319I6znHpdyFYz6C7R1ycuGg/lvrE39pStLQSCUfLUhR48HrmiG
        K8B8YXihJs2tVV6T+xCnLU4Y1g==
X-Google-Smtp-Source: ABdhPJwPGd//WWr9Jhlhc+3bFfRSgHhG5wSnpNrwbziZfU4fkhd4NnKXwaZD+EP8L+s2F9KTS1JYgQ==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr933441wmo.23.1601289719294;
        Mon, 28 Sep 2020 03:41:59 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:41:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/9] gpio: mockup: refactoring + documentation
Date:   Mon, 28 Sep 2020 12:41:46 +0200
Message-Id: <20200928104155.7385-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

These patches were part of the bigger overhaul of gpio-mockup but since
the initial idea was dropped in favor of using configfs + sysfs in the
future I thought I'd resent just the refactoring of the existing code
+ documentation patches. I think it's good to apply them since we don't
really know when the new interface will be ready (configfs needs a new
functionality - commitable items - to support mockup chip instantiation).

v1 -> v2:
- check for NULL pointer in kfree_strarray() to avoid having to always pass
  a zeroed string count when the array pointer is NULL
- collect review tags from Andy

Bartosz Golaszewski (9):
  lib: string_helpers: provide kfree_strarray()
  Documentation: gpio: add documentation for gpio-mockup
  gpio: mockup: drop unneeded includes
  gpio: mockup: use KBUILD_MODNAME
  gpio: mockup: use pr_fmt()
  gpio: mockup: remove unneeded return statement
  gpio: mockup: pass the chip label as device property
  gpio: mockup: use the generic 'gpio-line-names' property
  gpio: mockup: refactor the module init function

 .../admin-guide/gpio/gpio-mockup.rst          |  50 ++++++
 drivers/gpio/gpio-mockup.c                    | 154 +++++++++---------
 include/linux/string_helpers.h                |   2 +
 lib/string_helpers.c                          |  25 +++
 4 files changed, 155 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst

-- 
2.26.1

