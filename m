Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E8D20E0ED
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbgF2UvC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731419AbgF2TNd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BDEC08EC35
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2020 23:50:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so15322117wru.6
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2020 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0FbmkW7UOcYY7LkyFQeYD+n43SXMQXYjstj7AfGPBFY=;
        b=MFHsR5IDjPY0E1cBnmOdDmaaexsDnuGaeCom8ugM6D2bx/csHHWIKc48ZfoIzQ1WnQ
         wH2T1DsKev7yAD8X37BfHZeGwcp165BuatzBqWpk9PKAHPFguntRaNcNM+9ylDmq1Njl
         NVuN0ckQWhi9I84VLdztbSBWb2IQ1+HBDHXb622lxqQpwfrwmNWd9Mkyxhm4TdXQF1a6
         Qu7nv7GnKuaQtAdamC+YNXe2VGuqkZAdM7PXqkyxRPuNL0QCsk4OeEyOd44jJct2xsgz
         /DRypuk9B9Sua+ocxb2STpKn4HHeSpfcsjEMcVSUlGI2ghJFdvn2DzB6bgnCgXysJtma
         CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0FbmkW7UOcYY7LkyFQeYD+n43SXMQXYjstj7AfGPBFY=;
        b=sAkV+w0brdxYeZiaooEDTWSszAB2A2s3GTDQ0RRNgm/AvEyhPnV+Cb/qUG+sTN55kx
         2iRcxVzMvGouVXJwd6/NjFswEy2VlTbW7IYGL3tJItCVsjsUtDB3/bCLamOjU8/TiJBe
         nWJwrIMYBJdYpeHxxwXDY8ONAjoiR0D5gUdL6SRupgVJ+1hMFyeXLvTivSEGIDXsk00I
         bffaokQaO8SOqSONM0yIdycKIvUsEDyvGbUHRBVOrF2aKTG8l2QT+TTGELIed9S1H1s1
         Sb6ffc6l2sqg+xwW6C9HupJfrSFafWOqrBzWzaM2At6/52qW1jD/UqqkMPEHMIdz8sey
         1i6g==
X-Gm-Message-State: AOAM530pblnby5f/SMTuXT+7ViQ0l0FyVidQj3yqPGVg9NQbPhSxHXwb
        HkbOHwQMTS516kwss/Bbl1otZQ==
X-Google-Smtp-Source: ABdhPJxSUzNN1zV4gXxXOT8r64Q07nF/D8nrR8lGdd7yU4bCgcU0Q04rNUK9eOM5Le0U05BUn4D0PA==
X-Received: by 2002:a5d:4ec7:: with SMTP id s7mr15362311wrv.400.1593413413900;
        Sun, 28 Jun 2020 23:50:13 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/6] devres: provide and use devm_krealloc()
Date:   Mon, 29 Jun 2020 08:50:02 +0200
Message-Id: <20200629065008.27620-1-brgl@bgdev.pl>
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

Some additional changes to the code modified by main patches are included.

v1 -> v2:
- remove leftover call to hwmon_device_unregister() from pmbus_core.c
- add a patch extending devm_kmalloc() to handle zero size case
- use WARN_ON() instead of WARN_ONCE() in devm_krealloc() when passed
  a pointer to non-managed memory
- correctly handle the case when devm_krealloc() is passed a pointer to
  memory in .rodata (potentially returned by devm_kstrdup_const())
- correctly handle ZERO_SIZE_PTR passed as the ptr argument in devm_krealloc()

Bartosz Golaszewski (6):
  devres: remove stray space from devm_kmalloc() definition
  devres: move the size check from alloc_dr() into a separate function
  device: remove 'extern' attribute from function prototypes in device.h
  devres: handle zero size in devm_kmalloc()
  devres: provide devm_krealloc()
  hwmon: pmbus: use more devres helpers

 .../driver-api/driver-model/devres.rst        |   1 +
 drivers/base/devres.c                         |  75 +++++-
 drivers/hwmon/pmbus/pmbus_core.c              |  28 +--
 include/linux/device.h                        | 225 +++++++++---------
 4 files changed, 187 insertions(+), 142 deletions(-)

-- 
2.26.1

