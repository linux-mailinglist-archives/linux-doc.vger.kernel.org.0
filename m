Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D7A31D2D0
	for <lists+linux-doc@lfdr.de>; Tue, 16 Feb 2021 23:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhBPWrG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Feb 2021 17:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhBPWrD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 17:47:03 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF60BC061794
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 14:45:45 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id m6so7133741pfk.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 14:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yUCiqkksgcwS9O+xvzvVuH6FNIKF3LonMA8pWP2Dk/o=;
        b=orlgr292I9vem0IDvmJOpJs6SBNLVNfrpFzhwaN1Gkot/mbrA68mrOr76RlJD6X9rw
         5CqZPChR0zwTTBx/vpMPbn4/f6lq8bxpyY2UMMH7WPJr2j8UxfVyY0ww6B2ahz4fSbHR
         wMz7FmgNKHq0VaFF0jJCcXLf8YOZYKg21gtort5jToK5tZTQ6tOGFIslhtckpbuToegs
         vCsThY19AXW//27XCpknMpLkkaHo15WtKFRtJ2MUcbtHLrs1ETOoKqfMYBoZqRo0FrXs
         IJc9z/Tp2oc6F9xAJXFnly2OZMjtrtXdKtzzZcPXRrxRlJtxVUvOuLEUUOppeoosWepj
         THNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yUCiqkksgcwS9O+xvzvVuH6FNIKF3LonMA8pWP2Dk/o=;
        b=XiY3gU/9FZDKTJ4L0NyAnJNxSJ8Q4IB12hQCxLKoFShM67iA3unuEJAOaRXCH5hiui
         HZhUCtuAwUafrKbgViV1q90wuA/la0OLN429rO/TVZqddBaqO4QmcP3uilLqhXLiuu9M
         oS8xOBjZsXnQIebbAoUPiUnSel7aM7ejSmCn56U7ZPc2U+3mDc67dZPNOjnBvfDasgo3
         v94sUgkysX0u8mPHlDWfsDGYhLoHTLh2vukVOkGtoQ2+OIPAd94b95mtTklDzkzDSA8S
         L/kxkUiu+6a2LjMBqcXhNXXZrOJXcwScG/bPknhkQoIsDepdJg1OYl5xeVdnSvjBFAR1
         3e7g==
X-Gm-Message-State: AOAM531SXvZqVuNghL043yJGoY5u1F9ZAg5zdUsuV2QlQwUQTj8XLpV3
        XzSW4jS8i8z5VI2avMM/VX6kLQ==
X-Google-Smtp-Source: ABdhPJxkZYpUoubKxTZgPxZ4EIED2k5HlzFMqFCMgsFtAnQQwQYeNdRkChmrAm3rE3oif4IqhdFC4A==
X-Received: by 2002:a63:f74f:: with SMTP id f15mr21089308pgk.413.1613515545548;
        Tue, 16 Feb 2021 14:45:45 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:4e06:8d2c:6f9:5b31])
        by smtp.gmail.com with ESMTPSA id 184sm1922465pfc.176.2021.02.16.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 14:45:45 -0800 (PST)
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
Subject: [PATCH v6 3/3] docs/pinctrl: document debugfs files
Date:   Tue, 16 Feb 2021 14:44:55 -0800
Message-Id: <20210216224455.1504008-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216224455.1504008-1-drew@beagleboard.org>
References: <20210216224455.1504008-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document debugfs directories and files created for pinctrl subsystem.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 Documentation/driver-api/pinctl.rst | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
index 3d2deaf48841..37bc3bd64cd8 100644
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
+- ``pinctrl-handles``: iterate through the list of pin controller handles and
+  print the corresponding pinmux maps
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
+- ``pinmux-select``: write to this file to activate a pin function and group::
+
+        echo "<function-name group-name>" > pinmux-select
-- 
2.25.1

