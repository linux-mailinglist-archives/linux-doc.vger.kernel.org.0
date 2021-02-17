Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6F331E1EA
	for <lists+linux-doc@lfdr.de>; Wed, 17 Feb 2021 23:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbhBQWQk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Feb 2021 17:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhBQWQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Feb 2021 17:16:36 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1CEC06178C
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 14:15:17 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id fa16so135938pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 14:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mYrs5q+oZ0V8NFKgrQvhQijPLQDbqQrnbdDwL86thTE=;
        b=v7itPVT/J8mcy/0YO0mjmXVgBZzDH0nevKAgtlM/qRxHJSQn89poN+TW42IJvBeaKS
         GK+lk5HR45pihNvKh1tmaQnt58AbBOfsj8PYqYlNWoSuggCj6qIdI9QycWQ+LyQEoGrw
         QpkcRXDPg5Iq2Ymc8iOTh5h59sNHVXO35khqgqxzzf4fLjZbeMLKSy7f8MF1vhMcsNjL
         ixROEJYs4/3Ua316RElrE1p1HnsdxjQHb48Egt2h9w0wHPB5jKijKw9fVHXje5UDJ4Yn
         IJAx9SBwAEScAH4jJ1ykrhKzzkJo6XlbJglc4kOMcszgD/GieKDuY9bzaEtfWgBjSfX9
         FYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mYrs5q+oZ0V8NFKgrQvhQijPLQDbqQrnbdDwL86thTE=;
        b=lcOpimHBYkHy6FLSQbvWNgGGi5fEQy8uuVk/cMjw6FA98XkIlXmCJFSYzzDvPH27BM
         HDZHCDcU0pCqXLwsw9FEN1tb9i3h+RBLwH8lpwHR/k+Bg7GwdkNl4y89y/w3j8sscGHu
         9SKBhEPKMa/h6VyMB57okNieAf8llkCR6NmbAh5LnSxIVCVb37UzHK4va0Ii0pMb2aYI
         tVGN+xV34JErqPeTg2kL3yDBJr6n2j5lpV6aZuvjjBztxd6Gl6BQUONhVZ7GL5YJNNcN
         T7tejkrIJM1VWFR9SfRvKeb9Ko+4Tsq1MGtByBz3RT1bEL9VH8nLFiWdtKOJcLzh2E6Q
         X9Sw==
X-Gm-Message-State: AOAM532cPjCKxNna4gcyUXljIhEcjdhVEUysIeaJr+17+KleSyTE/XCm
        vb3yttE/IVh2DJpOZop5MV8cYQ==
X-Google-Smtp-Source: ABdhPJy2/Tf3ok1xGYPk1DmYcXvIRcZR/fpzrZbZrSxVAJdxLDhAX8flR3kKxBH3+EH1+uJJD+ThVA==
X-Received: by 2002:a17:90a:67ca:: with SMTP id g10mr957292pjm.28.1613600117391;
        Wed, 17 Feb 2021 14:15:17 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:c31f:9bea:96ec:ef07])
        by smtp.gmail.com with ESMTPSA id q43sm3142591pjq.25.2021.02.17.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:15:16 -0800 (PST)
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
Subject: [PATCH v7 2/3] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Wed, 17 Feb 2021 14:14:57 -0800
Message-Id: <20210217221457.1827266-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217221457.1827266-1-drew@beagleboard.org>
References: <20210217221457.1827266-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add "pinmux-select" to debugfs which will activate a function and group:

  echo "<function-name group-name>" > pinmux-select

The write operation pinmux_select() handles this by checking that the
names map to valid selectors and then calling ops->set_mux().

The existing "pinmux-functions" debugfs file lists the pin functions
registered for the pin controller. For example:

  function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
  function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
  function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
  function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
  function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
  function: pinmux-spi1, groups = [ pinmux-spi1-pins ]

To activate function pinmux-i2c1 and group pinmux-i2c1-pins:

  echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinmux.c | 102 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c651b2db0925..39770af56562 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -12,6 +12,7 @@
  */
 #define pr_fmt(fmt) "pinmux core: " fmt
 
+#include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -673,6 +674,105 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+#define PINMUX_SELECT_MAX 50
+static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
+				   size_t len, loff_t *ppos)
+{
+	struct seq_file *sfile = file->private_data;
+	struct pinctrl_dev *pctldev = sfile->private;
+	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
+	const char *const *groups;
+	char *buf, *fname, *gname;
+	unsigned int num_groups;
+	int fsel, gsel, ret;
+
+	if (len > PINMUX_SELECT_MAX)
+		return -ENOMEM;
+
+	buf = kzalloc(PINMUX_SELECT_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = strncpy_from_user(buf, user_buf, PINMUX_SELECT_MAX);
+	if (ret < 0)
+		goto exit_free_buf;
+	buf[len-1] = '\0';
+
+	/* remove leading and trailing spaces of input buffer */
+	fname = strstrip(buf);
+	if (*fname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	/* find a separator which is a spacelike character */
+	for (gname = fname; !isspace(*gname); gname++) {
+		if (*gname == '\0') {
+			ret = -EINVAL;
+			goto exit_free_buf;
+		}
+	}
+	*gname = '\0';
+
+	/* drop extra spaces between function and group names */
+	gname = skip_spaces(gname + 1);
+	if (*gname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	ret = pinmux_func_name_to_selector(pctldev, fname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
+		goto exit_free_buf;
+	}
+	fsel = ret;
+
+	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
+	if (ret) {
+		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
+		goto exit_free_buf;
+	}
+
+	ret = match_string(groups, num_groups, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "invalid group %s", gname);
+		goto exit_free_buf;
+	}
+
+	ret = pinctrl_get_group_selector(pctldev, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "failed to get group selector for %s", gname);
+		goto exit_free_buf;
+	}
+	gsel = ret;
+
+	ret = pmxops->set_mux(pctldev, fsel, gsel);
+	if (ret) {
+		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
+		goto exit_free_buf;
+	}
+	ret = len;
+
+exit_free_buf:
+	kfree(buf);
+
+	return ret;
+}
+
+static int pinmux_select_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations pinmux_select_ops = {
+	.owner = THIS_MODULE,
+	.open = pinmux_select_open,
+	.write = pinmux_select,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
@@ -680,6 +780,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", 0444,
 			    devroot, pctldev, &pinmux_pins_fops);
+	debugfs_create_file("pinmux-select", 0200,
+			    devroot, pctldev, &pinmux_select_ops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

