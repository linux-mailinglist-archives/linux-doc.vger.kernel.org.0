Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189293F5E51
	for <lists+linux-doc@lfdr.de>; Tue, 24 Aug 2021 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbhHXMrn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Aug 2021 08:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237418AbhHXMrj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 08:47:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9B7C0613A3
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 05:46:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1781647wmc.5
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+jIDIEPGUtwtN5J2uvflNRJK63YXRHWuv3BgcHNxva8=;
        b=RgocWkgV6oNUTc6g8DAGPi8BVvHL+2Rn4ytJK6kWqkt6OVd0nd4Pw0xPYOLQiHlFMX
         OtV5mx1teKUYOBoqtXtMfWzziQgRt8LL/Y0lW06o7eJc3AW9oPwU3H54xnl1mpBPzStk
         xfmSriS7h/cWQ9pyJJJDd85BNltoeQgqHAFbKVsn8Dn5TxZ2rLhL8XpdptJFXq8S/NRO
         N943NGW1Kr3zL0osclrJj2vT7ZDV+iC4S7eOIJcUuBQkAzYInSjFJa55D8g8i38HbX3d
         lDcl2jM0g870QLuhMltjcwV/feVYhi5OS9ITVlZPE8utfhAgiewVnAbmbyaZHw+xhH7C
         F6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+jIDIEPGUtwtN5J2uvflNRJK63YXRHWuv3BgcHNxva8=;
        b=MlSTXyJ4+M5fwJQBsLXBKgOzKDJYv7w3VPO6Wmkhe34luYgsXB8TzvDrvTkKqqN5o6
         PVgHd+fV5FCwCyi/Ut/0Fvqx4cNQw/5Lo3ead8IfL6pfl+D4S2LLoUV8wjj4ZEPK6sPb
         LzSVlA8KXRU4+g+b50sloUJrphnYIc97q9A/qKBqhvGfprwzQbhrQNDuGLMP9fTg+F+R
         gntqKYo1ZFLceiXMuEA8ik5gcutEQFP3YRTVTRLN9uptt6aw9RnvTyjNmvsiQajIu1FW
         ztaBvrADCxifbOuKFP6dYIJXkKOEi8JSYow7jxRXbsacIts9fTcE3kVyVrvfslw2P0Wd
         8g2Q==
X-Gm-Message-State: AOAM531BPEZviX0wmXL8PtijqlzHlYYLpQ+fID0QHVE+uIzMsHUqjxIv
        /6eF0DndzlfB3frqR2irOr6YfUSqBMm/1+yuniZ69D6S1ZvSvYNzLzX8czouSzOKnDgHZtJU1QJ
        gp/0PMiyX41t96w9ymnlbVQN93429vMUAH/P5KBnnrtp85VI0E99B0BnCxM2vlHSpYZUR9cSEAn
        QpU1U=
X-Google-Smtp-Source: ABdhPJzqcG7L8tY5Ok3wh6qGkQq3AZ/iXN4weZPo9JxWaa0OJLRGlGwMIiSpjsDShx710OJPmIM6kQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr3973991wmj.126.1629809213048;
        Tue, 24 Aug 2021 05:46:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:52 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 6/7] Documentation/hwmon: Add iei-wt61p803-puzzle hwmon driver documentation
Date:   Tue, 24 Aug 2021 14:44:37 +0200
Message-Id: <20210824124438.14519-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the iei-wt61p803-puzzle driver hwmon driver interface documentation.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../hwmon/iei-wt61p803-puzzle-hwmon.rst       | 43 +++++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst

diff --git a/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
new file mode 100644
index 000000000000..bbbe97645965
--- /dev/null
+++ b/Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver iei-wt61p803-puzzle-hwmon
+=======================================
+
+Supported chips:
+ * IEI WT61P803 PUZZLE for IEI Puzzle M801
+
+   Prefix: 'iei-wt61p803-puzzle-hwmon'
+
+Author: Luka Kovacic <luka.kovacic@sartura.hr>
+
+
+Description
+-----------
+
+This driver adds fan and temperature sensor reading for some IEI Puzzle
+series boards.
+
+Sysfs attributes
+----------------
+
+The following attributes are supported:
+
+- IEI WT61P803 PUZZLE for IEI Puzzle M801
+
+/sys files in hwmon subsystem
+-----------------------------
+
+================= == =====================================================
+fan[1-5]_input    RO files for fan speed (in RPM)
+pwm[1-2]          RW files for fan[1-2] target duty cycle (0..255)
+temp[1-2]_input   RO files for temperature sensors, in millidegree Celsius
+================= == =====================================================
+
+/sys files in thermal subsystem
+-------------------------------
+
+================= == =====================================================
+cur_state         RW file for current cooling state of the cooling device
+                     (0..max_state)
+max_state         RO file for maximum cooling state of the cooling device
+================= == =====================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..4a050a5bc1f8 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -73,6 +73,7 @@ Hardware Monitoring Kernel Drivers
    ibmaem
    ibm-cffps
    ibmpowernv
+   iei-wt61p803-puzzle-hwmon
    ina209
    ina2xx
    ina3221
-- 
2.31.1

