Return-Path: <linux-doc+bounces-42564-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E964CA7FBC4
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70D216BAAA
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 10:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2AD2690CB;
	Tue,  8 Apr 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xF44p1Kp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13C268C5F
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107624; cv=none; b=S0njy4zlUEBBP0dO2RjIi9q9/UZWauRgLOhYBpqONnePJP0WZFfVnu0lobaSLMEknwFGUIrsxWYUY5FTzxsV5JnVrL7woXrXszBZ3hjqHMe7PWka2hxHkNBYh+B5nWBNw4gDoLl81oMIxSSjBGgJVNuXiKKYovF0C3NqbBqpYNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107624; c=relaxed/simple;
	bh=vvWq4Dz82xJD2sorErUACcDZI4fJMciMqS6/2CqU+gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPVZJrhEsjKl4KaAyuUYmSqjYuJyW6nMpSOEY2RBEA5pT2SwNF0MsY6l+B2kDK7+VbiUtCq7u2MCr0DGCEyqBWFLDaxuqHgQe9O2lhNGkgg1yKaTgRxI1cla6M3wdvt1xEeSbW9Qpr7FRvK2WD0bJytmk+77r5mb/KZfs3jAEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xF44p1Kp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so309984f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 03:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107620; x=1744712420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9eheXrMshD0J5XzJ2mOaNomxGQPlMHtmpHgpZQ0nvc=;
        b=xF44p1Kp1zpqOd6AsWoksh6+pvdU6KnFL3dcg1nMea7EVTy56JXgyJv7uFYkuEiJ2U
         ybiauoUEMpsF0mlIWPanxiM8gyVpQwTQpnQZIkgUuMr3DJlT5qg7zWOvGjVCFfTrZ9Oy
         gWASP7qX6g6z7BzUdQIXf6K4BnHkHeB4ue4Mnm9pJAGtL03BI3Rnl2lh6YNbp7kMoseG
         acCqE+Xhsu0wSUjnajqi+Fe6ivrBCaFnbQMJc874/ZEkvp6VxLpZUTwrKPrXFiKeYyqK
         FJr1CI294yb4sUbC7CDr8WkXw+smGow+IFe9wOC5yqD4XGwzaCJIEHzhdPj2VsQlBrZn
         u2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107620; x=1744712420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9eheXrMshD0J5XzJ2mOaNomxGQPlMHtmpHgpZQ0nvc=;
        b=bvmC02BYXyIyQm5By565LsZBkDBaybz56oP49//Omm/jzg5ydnxwX4x/C4nX/UXEZx
         FS9W+TXCFDXUytBCzU48Pr3rV8uLm5DnRffi5a6ArmbMrh2oeIABxuXtuVWJdiOH4K7q
         r+ztIxjZEvOMBYHSJ5WyJXwlU0p+L5TBlDJuov6Z/vtIOH7/kP1/Qa8WWqYL6g9PNX5Y
         7H//670o3gpOdcKg+87YQzjXkP4oBzgmlpG65pCsQOV34QNyyd9k3EqhbGQQKgQTwz46
         4haidEF3v1jIwehey20esWIOdIucDkc71XV1r4O572i5i5+ZhG1eH3j2/ZavAwxzT1oV
         Wlzg==
X-Forwarded-Encrypted: i=1; AJvYcCURM0SnAwOG5w9y6Ku+qvLcNVH4k2zJ0Nmx2IoJXnHE3I1f8h/zJ6HLkxtCUQYCltsEN9JzOdoC1DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1Rcqe7N9Y9BE9uT4xIH+DKPJd72V0haD3kUxB23rYZXvCybh
	hTtjL+4pAXB0tmr7JfX3tA/0QnhJ+FC+Ggz2EOY2cMTVcAWiGcd4+sIgx1BxYOZaSb6xLYbdqoH
	c
X-Gm-Gg: ASbGncui1rkhnzutPvzohAvF7AG0nxU+MSAmYEpzs7pP6lZon8lUIf7DYtD82M3Zj59
	Fh7So+JAMSnnWjejlAghVh8TAH9xZtLx6fg1SpHCiTJ6kqJFxIPpfjn8NSAUVo/DCxBUkpoBVZF
	Y3IPYddIb6jZLH4YOAXXqI3ymjmzbO3ndA9UnWRpy3XZijGdanZHA56r1N+z6NANI5j9VzgGAqo
	uLfBN34TlLkmohsShnUPbp5k29N5i1glDohYmggP2KJW8WzK5E+TwChlgAYeaRHU4hWFzwGufOh
	JY8WRMGuu19XtVYOp6mMOaLnkBSITT5sFF9M7NJiPJDuv5VCsUI5NAbJLtk96HTcFop/2AKyvFe
	Aw7/hG9zEew9irxRXKN8L7w==
X-Google-Smtp-Source: AGHT+IH1dn/lIQfI3/RR+xyibwTynK6fakDPZSh/3lkCbbOZVJhtIhqx23aIAqsLFWaMCdqOV7Lz+A==
X-Received: by 2002:a5d:6d87:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-39d820d2859mr2254662f8f.22.1744107620018;
        Tue, 08 Apr 2025 03:20:20 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 12:18:55 +0200
Subject: [PATCH v4 5/5] iio: dac: ad3552r-hs: add support for internal ramp
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-5-b33c0264bd78@baylibre.com>
References: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
In-Reply-To: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6386;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=E2cwLHSNnDDaFAnFhmELZVQmtS+a6XU+agiX8UTiSa4=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kPo9f0ska+2gR+7Dc7br3vUdEOnovhiyNEa5amHn
 kkXpCUld5SyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZjIxVMM/90uSS8K+1Cd++CM
 tgn/86si3iW/MtLe1y4rCn6+7DDbTieG/0WeDvf/+XAWOl9+K/5ncTrrr2Onj8j28kr/lQsr+rL
 SkxUA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

The ad3552r can be feeded from the HDL controller by an internally
generated 16bit ramp, useful for debug pourposes. Add debugfs a file
to enable or disable it.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/ad3552r-hs.c | 166 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 160 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
index 37397e188f225a8099745ec03f7c604da76960b1..9a8eed7a06e4f2e7b23d59764b8f2fc21e2c4537 100644
--- a/drivers/iio/dac/ad3552r-hs.c
+++ b/drivers/iio/dac/ad3552r-hs.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iio/backend.h>
@@ -54,6 +55,18 @@ struct ad3552r_hs_state {
 	struct ad3552r_hs_platform_data *data;
 	/* INTERFACE_CONFIG_D register cache, in DDR we cannot read values. */
 	u32 config_d;
+	/* Protects backend I/O operations from concurrent accesses. */
+	struct mutex lock;
+};
+
+enum ad3552r_sources {
+	AD3552R_SRC_IIO_BUFFER,
+	AD3552R_SRC_BACKEND_RAMP_GEN,
+};
+
+static const char * const dbgfs_attr_source[] = {
+	[AD3552R_SRC_IIO_BUFFER] = "iio-buffer",
+	[AD3552R_SRC_BACKEND_RAMP_GEN] = "backend-ramp-generator",
 };
 
 static int ad3552r_hs_reg_read(struct ad3552r_hs_state *st, u32 reg, u32 *val,
@@ -65,6 +78,20 @@ static int ad3552r_hs_reg_read(struct ad3552r_hs_state *st, u32 reg, u32 *val,
 	return st->data->bus_reg_read(st->back, reg, val, xfer_size);
 }
 
+static int ad3552r_hs_set_data_source(struct ad3552r_hs_state *st,
+				      enum iio_backend_data_source type)
+{
+	int i, ret;
+
+	for (i = 0; i < st->model_data->num_hw_channels; ++i) {
+		ret = iio_backend_data_source_set(st->back, i, type);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ad3552r_hs_update_reg_bits(struct ad3552r_hs_state *st, u32 reg,
 				      u32 mask, u32 val, size_t xfer_size)
 {
@@ -483,6 +510,107 @@ static int ad3552r_hs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
 	return st->data->bus_reg_write(st->back, reg, writeval, 1);
 }
 
+static ssize_t ad3552r_hs_show_data_source(struct file *f, char __user *userbuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ad3552r_hs_state *st = file_inode(f)->i_private;
+	enum iio_backend_data_source type;
+	int idx, ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = iio_backend_data_source_get(st->back, 0, &type);
+	if (ret)
+		return ret;
+
+	switch (type) {
+	case IIO_BACKEND_INTERNAL_RAMP_16BIT:
+		idx = AD3552R_SRC_BACKEND_RAMP_GEN;
+		break;
+	case IIO_BACKEND_EXTERNAL:
+		idx = AD3552R_SRC_IIO_BUFFER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return simple_read_from_buffer(userbuf, count, ppos,
+				       dbgfs_attr_source[idx],
+				       strlen(dbgfs_attr_source[idx]));
+}
+
+static ssize_t ad3552r_hs_write_data_source(struct file *f,
+					    const char __user *userbuf,
+					    size_t count, loff_t *ppos)
+{
+	struct ad3552r_hs_state *st = file_inode(f)->i_private;
+	char buf[64];
+	int ret, source;
+
+	guard(mutex)(&st->lock);
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
+				     count);
+	if (ret < 0)
+		return ret;
+
+	buf[count] = '\0';
+
+	ret = match_string(dbgfs_attr_source, ARRAY_SIZE(dbgfs_attr_source),
+			   buf);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case AD3552R_SRC_BACKEND_RAMP_GEN:
+		source = IIO_BACKEND_INTERNAL_RAMP_16BIT;
+		break;
+	case AD3552R_SRC_IIO_BUFFER:
+		source = IIO_BACKEND_EXTERNAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = ad3552r_hs_set_data_source(st, source);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ad3552r_hs_show_data_source_avail(struct file *f,
+						 char __user *userbuf,
+						 size_t count, loff_t *ppos)
+{
+	ssize_t len = 0;
+	char *buf;
+	int i;
+
+	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dbgfs_attr_source); i++) {
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s ",
+				 dbgfs_attr_source[i]);
+	}
+	buf[len - 1] = '\n';
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
+}
+
+static const struct file_operations ad3552r_hs_data_source_fops = {
+	.owner = THIS_MODULE,
+	.write = ad3552r_hs_write_data_source,
+	.read = ad3552r_hs_show_data_source,
+};
+
+static const struct file_operations ad3552r_hs_data_source_avail_fops = {
+	.owner = THIS_MODULE,
+	.read = ad3552r_hs_show_data_source_avail,
+};
+
 static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
 {
 	u16 id;
@@ -550,11 +678,7 @@ static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
 	if (ret)
 		return ret;
 
-	ret = iio_backend_data_source_set(st->back, 0, IIO_BACKEND_EXTERNAL);
-	if (ret)
-		return ret;
-
-	ret = iio_backend_data_source_set(st->back, 1, IIO_BACKEND_EXTERNAL);
+	ret = ad3552r_hs_set_data_source(st, IIO_BACKEND_EXTERNAL);
 	if (ret)
 		return ret;
 
@@ -661,6 +785,26 @@ static const struct iio_info ad3552r_hs_info = {
 	.debugfs_reg_access = &ad3552r_hs_reg_access,
 };
 
+static void ad3552r_hs_debugfs_init(struct iio_dev *indio_dev)
+{
+	struct ad3552r_hs_state *st = iio_priv(indio_dev);
+	struct dentry *d = iio_get_debugfs_dentry(indio_dev);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return;
+
+	d = iio_get_debugfs_dentry(indio_dev);
+	if (!d) {
+		dev_warn(st->dev, "can't set debugfs in driver dir\n");
+		return;
+	}
+
+	debugfs_create_file("data_source", 0600, d, st,
+			    &ad3552r_hs_data_source_fops);
+	debugfs_create_file("data_source_available", 0600, d, st,
+			    &ad3552r_hs_data_source_avail_fops);
+}
+
 static int ad3552r_hs_probe(struct platform_device *pdev)
 {
 	struct ad3552r_hs_state *st;
@@ -705,7 +849,17 @@ static int ad3552r_hs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_iio_device_register(&pdev->dev, indio_dev);
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &st->lock);
+	if (ret)
+		return ret;
+
+	ad3552r_hs_debugfs_init(indio_dev);
+
+	return ret;
 }
 
 static const struct of_device_id ad3552r_hs_of_id[] = {

-- 
2.49.0


