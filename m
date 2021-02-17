Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADD231E1E9
	for <lists+linux-doc@lfdr.de>; Wed, 17 Feb 2021 23:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhBQWQk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Feb 2021 17:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbhBQWQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Feb 2021 17:16:36 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB50C061794
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 14:15:19 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id r2so84133plr.10
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 14:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9rWQpGXIz66daXxWsY1gOWjvlN/z304wIufJTlMDGo=;
        b=KxHon1W8x3c1Lf5e3+SIMFIcGK+3MYlyYBNOs1EzakzAbVFcOgAV5T3A/GQBBEPNxC
         Won0BbFPxtwnDFkP1UoxPsTL0sK7uaqqo+bmvNsjyEireyD22g6THwD7ERhjlNs+ALb4
         G77Z21EVUT2GFaXXWI3yDY2FDU9gky60rC2cMyPpc9HmsdzDaE0gEgNRlLe2+5LxrOHX
         bLMq8+G+B4cqtz6Wrf7ecyHKBjCrehDo26vSBYvIBGRQuUK/0cGYEE08en+/Df0HoH4y
         ANJS1myo0PyvHEbb4WQX7DhYRnO+Pe0FHz3HTpFV7gQVW1GbTO7QqqhL2bTFHhbuBfgp
         OV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9rWQpGXIz66daXxWsY1gOWjvlN/z304wIufJTlMDGo=;
        b=N579509HmCQ0VYp4JB8rwfyZNsnjAj1gfqDk6JH8ek6GUTU8YV/ZkZiulzgqRjp5IG
         nARSfaebK3hWP050HzFK5vcxxxFDV/ACDTAzeEgLx5v462HQqUOPdUoNX9C7zsvmpcmw
         CoQHGS9UaAuNKu4aXmcoGp6Pg1D+iNrmO/4aneZq1C+732LIchbMhm0hpibm5MJLzsTd
         Lo4xwqR0A+HDEyQH0Xig1RErDYjyNKAv8dni9SjE8wp1llgZWhAx7KOgTOs2yXwEwg1N
         FIG3F7YZabogaM9pCWgghSGCMuaDGU97JSxIxyScziJK/sDqfsD9gQvQVBawqJB7A5AD
         BB6g==
X-Gm-Message-State: AOAM532V8rghXJHolKTUrZVYtRGQibEoQiUbPBwLeTfZ5XLzyRRvhfbu
        hdQ+aHDpCPOkoR0DRtzVGrj36g==
X-Google-Smtp-Source: ABdhPJx7a2TKoUOvKWFwYDqvHzZTQEJxsPaU8z/ZcnkpVNh44lma3zVa8OXhOGi1PvaG0JWX7SVdtw==
X-Received: by 2002:a17:90b:618:: with SMTP id gb24mr874830pjb.163.1613600118771;
        Wed, 17 Feb 2021 14:15:18 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:c31f:9bea:96ec:ef07])
        by smtp.gmail.com with ESMTPSA id q43sm3142591pjq.25.2021.02.17.14.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:15:18 -0800 (PST)
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
Subject: [PATCH v7 3/3] docs/pinctrl: document debugfs files
Date:   Wed, 17 Feb 2021 14:14:58 -0800
Message-Id: <20210217221457.1827266-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217221457.1827266-1-drew@beagleboard.org>
References: <20210217221457.1827266-1-drew@beagleboard.org>
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

