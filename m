Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DED25DE2A
	for <lists+linux-doc@lfdr.de>; Fri,  4 Sep 2020 17:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgIDPri (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Sep 2020 11:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgIDPrR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:47:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EE5C0619D3
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so7242793wrn.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RT9K0p4g9wsam9mtLvU8jWCbdg1QlHE5npCSk6GRJVM=;
        b=Pph0ChKqHgqs9PaK7532rJDYq8CCuzL49IHbUNNh8wkzPBANz7SFZRVpe8XZ6089Dv
         w6hesKYtcpQT4Xn0LXDDkAAwnHY8SkZfl97hmrjQg1ejNa/IDYgWLvxD72t0bCCu1ihU
         Kia91DKj1cbhCQ054PEtqNZgjWU4xEvuzZbzThXH6fhadPW3xJHoOT4GOeXDsdpt4B6Q
         w8yhwq243s79jSf7dIZgRnGMtn09vLqHQF/2Gw1s+Xxbhg4FS7Q6bC3r5oFPgFrePT8H
         Rkc0q0bYUHSe+Yf2WE7b+liCRpH0L24hIZ43cjEjsbBKorpi1qb4JDcLyq2SkhHPkXug
         aKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RT9K0p4g9wsam9mtLvU8jWCbdg1QlHE5npCSk6GRJVM=;
        b=R7hHLR2FY+dj+CvvrhukhTenvxGYjl1cGJiQDOVsoq/jaMYRMIjx0lOquZefuoygXh
         A2Yin/y/ZDohXUuSUDe9hcbOAiG5QFRFjlkVXqVP+YIewTHg0SLuWAJP9svvoVu1ONmR
         S1OTb01KMDB+59SG/n3KMui4iY+BthnNHxz24jnD0uVKyZ1FjmDz/VB5G/JGxzIPtZS2
         Au5WrQegficMAyawWv6JFfmL3wdaMG0bMeIqJYdKroh17P0RfiMn1r1OZ+NUx9WoDqh5
         vbyM1px2RdGXMp7lTgJI7HyHnuxmCDjHT8G5TE92yYXfWKyfbLZIxrhC45nDMReKVWq5
         9bSw==
X-Gm-Message-State: AOAM533D+hWJv6VysdO6w7bWNF3vUVAPryl8+wBXokxasiBgkFp/NDij
        Tj0asvowPGTRPwq6phr4yhRqUg==
X-Google-Smtp-Source: ABdhPJzwm1LPWjidY+W2eWt031GEhqfqEZ4XCSVhfjqUt9KC+wqwPvwzW1Xvz1lIpyZuwTS8CeLJLw==
X-Received: by 2002:adf:9d44:: with SMTP id o4mr8315397wre.361.1599234413434;
        Fri, 04 Sep 2020 08:46:53 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 19/23] gpio: mockup: add a symlink for the per-chip debugfs directory
Date:   Fri,  4 Sep 2020 17:45:43 +0200
Message-Id: <20200904154547.3836-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We used to have a symlink named after the chip's label linking to the
per-chip directory named after the chip's name. This was removed by
commit d51ee07a8de7 ("gpio: mockup: don't create the debugfs link named
after the label") because there were no users of it.

This changeset proposes to reintroduce debugfs symlinks but inverted:
the link named after the device name points to the directory named after
the label. This way user-space can dynamically create a chip (once that
functionality is available), detect its creation over uevent and match
the device name to the label by resolving the link.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 7df990662c17..bc4609e047ef 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -52,6 +52,7 @@ struct gpio_mockup_chip {
 	struct gpio_mockup_line_status *lines;
 	struct irq_domain *irq_sim_domain;
 	struct dentry *dbg_dir;
+	struct dentry *dbg_link;
 	struct mutex lock;
 };
 
@@ -355,6 +356,13 @@ static void gpio_mockup_remove_chip_debugfs_entry(void *data)
 	debugfs_remove_recursive(entry);
 }
 
+static void gpio_mockup_remove_chip_debugfs_link(void *data)
+{
+	struct dentry *link = data;
+
+	debugfs_remove(link);
+}
+
 static int gpio_mockup_debugfs_setup(struct device *dev,
 				     struct gpio_mockup_chip *chip)
 {
@@ -368,7 +376,7 @@ static int gpio_mockup_debugfs_setup(struct device *dev,
 	gc = &chip->gc;
 	devname = dev_name(&gc->gpiodev->dev);
 
-	chip->dbg_dir = debugfs_create_dir(devname, gpio_mockup_dbg_dir);
+	chip->dbg_dir = debugfs_create_dir(gc->label, gpio_mockup_dbg_dir);
 	if (IS_ERR(chip->dbg_dir))
 		return PTR_ERR(chip->dbg_dir);
 
@@ -377,6 +385,16 @@ static int gpio_mockup_debugfs_setup(struct device *dev,
 	if (ret)
 		return ret;
 
+	chip->dbg_link = debugfs_create_symlink(devname, gpio_mockup_dbg_dir,
+						gc->label);
+	if (IS_ERR(chip->dbg_link))
+		return PTR_ERR(chip->dbg_link);
+
+	ret = devm_add_action_or_reset(dev,
+			gpio_mockup_remove_chip_debugfs_link, chip->dbg_link);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < gc->ngpio; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
 		if (!name)
-- 
2.26.1

