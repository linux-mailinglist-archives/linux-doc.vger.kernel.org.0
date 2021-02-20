Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7EC320717
	for <lists+linux-doc@lfdr.de>; Sat, 20 Feb 2021 21:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBTU32 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 20 Feb 2021 15:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhBTU3Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Feb 2021 15:29:24 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5099C0617AB
        for <linux-doc@vger.kernel.org>; Sat, 20 Feb 2021 12:28:08 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id ba1so5309312plb.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Feb 2021 12:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U8ZmjrxOmELViwc9AyVYtXHixP3nj10dIfkqJbLS8aE=;
        b=eS7yPJljQGWjuJMMxqbZwkHUTVYl8v4kzt6L95XPmHT6mNdd8L7EaXY4iAkPDjM5iW
         z+5XNCHpWrcbNlpBbNraNhCuaQ+3hQv3jgevykJ5FMqKP2ZsKEyvKqf8np8PAa5Y/7AR
         8lqnoCvV0Ks1HmYSvnWNx0/kuU2IATjVE+6MT0RQqrZ1gj65DejTZIMOczvo99q4SVcW
         lYLwPPIbu8w0gsDy+qggj9n0U85msawLcY3GpuIDn5pN/DAu2CO3z9X1EdswlNQnoZJ5
         6ixCY9P69uieFPE7eYa+Q/zK7LWbR8rVeU76nKbfbxRjUN5A+GwDzjAVG71chHNckLnG
         NzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U8ZmjrxOmELViwc9AyVYtXHixP3nj10dIfkqJbLS8aE=;
        b=NuMD1s5o0CQC1bqCSR719mlma36omay2lS6xNfWgdaYvoobbTFshSKwLxZ7UGg1tT3
         7JW3LdrDsDM4VxxVef0ugVx5S+JACDpxFAirrwaHDH86Dz8rGnY2vU8shdeyxmxgvqSu
         SjJWbGiRvNFqczU3ij7VMeIyjieog4dj0uaVjzjbXYa+MpqmUXl5WU+yA3yMmQiuAhyW
         J3XsSXqrulrE6IowP+0yFXVd3W3NSbNUjuVuJ26ByqgEzKrBWLQZOqTkGEGzAdO+ZYZ9
         hGnSDXY0mbgGM/FmfNYSdoqSJK1zgbDLvCopv8oZyicUyfNuneAlqgqlPSJz9m0ODxox
         vczQ==
X-Gm-Message-State: AOAM533rxjU9TD62s79lk8ycmiBL//lZnYcElgdNHowjpEamARha7AXo
        KPtibbh/ps3BsvEfxZGUPw6hbA==
X-Google-Smtp-Source: ABdhPJy1BoNkNQb5ifXpVxXSpZP6sFp3o18og3WLYV/ouirrPldF6GXEIN4rJXT9vHeDDLl9Ny5ZiQ==
X-Received: by 2002:a17:90a:6405:: with SMTP id g5mr15104193pjj.137.1613852888379;
        Sat, 20 Feb 2021 12:28:08 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:3902:ca9d:7b75:1d0c])
        by smtp.gmail.com with ESMTPSA id 125sm13497871pfu.7.2021.02.20.12.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 12:28:07 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v8 3/3] docs/pinctrl: document debugfs files
Date:   Sat, 20 Feb 2021 12:27:50 -0800
Message-Id: <20210220202750.117421-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220202750.117421-1-drew@beagleboard.org>
References: <20210220202750.117421-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document debugfs directories and files created for pinctrl subsystem.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 Documentation/driver-api/pinctl.rst | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
index 3d2deaf48841..c905b273e833 100644
--- a/Documentation/driver-api/pinctl.rst
+++ b/Documentation/driver-api/pinctl.rst
@@ -1428,3 +1428,40 @@ on the pins defined by group B::
 The above has to be done from process context. The reservation of the pins
 will be done when the state is activated, so in effect one specific pin
 can be used by different functions at different times on a running system.
+
+
+Debugfs files
+=============
+These files are created in ``/sys/kernel/debug/pinctrl``:
+
+- ``pinctrl-devices``: prints each pin controller device along with columns to
+  indicate support for pinmux and pinconf
+
+- ``pinctrl-handles``: prints each configured pin controller handle and the
+  corresponding pinmux maps
+
+- ``pinctrl-maps``: print all pinctrl maps
+
+A sub-directory is created inside of ``/sys/kernel/debug/pinctrl`` for each pin
+controller device containing these files:
+
+- ``pins``: prints a line for each pin registered on the pin controller. The
+  pinctrl driver may add additional information such as register contents.
+
+- ``gpio-ranges``: print ranges that map gpio lines to pins on the controller
+
+- ``pingroups``: print all pin groups registered on the pin controller
+
+- ``pinconf-pins``: print pin config settings for each pin
+
+- ``pinconf-groups``: print pin config settings per pin group
+
+- ``pinmux-functions``: print each pin function along with the pin groups that
+  map to the pin function
+
+- ``pinmux-pins``: iterate through all pins and print mux owner, gpio owner
+  and if the pin is a hog
+
+- ``pinmux-select``: write to this file to activate a pin function for a group::
+
+        echo "<group-name function-name>" > pinmux-select
-- 
2.25.1

