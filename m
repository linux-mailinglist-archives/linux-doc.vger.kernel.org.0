Return-Path: <linux-doc+bounces-42754-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE48A82EF2
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 20:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70AF8A0DD8
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 18:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F366E27BF94;
	Wed,  9 Apr 2025 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i4vpogBl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1841279346
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223877; cv=none; b=jFC5DjHEQsEfb3GyO80MrpYnzVqQRbMcGoDhiqANb/TCUh+6vZXiX0i4tDZTulYsmxOMXQqUbwVjBsDmNZmucEtu3DcdUxRCoQpPWyruYg1O1VSgdGvJ2WvC0rlT+uxA4eQIQ40K3FJYFQxwjzxwcJFF/f0dEOVMqEN1kU/UPhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223877; c=relaxed/simple;
	bh=yUszYyKId2jMHliG8dEQoAHpckhzLYeakl04OcdUtHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hie9V4DjjCKcNBDBa7PNh2/2wBw/rix0uG7k9r2nQhAxFTtx/PUFCfrD/V9LJYd7J8g3ydIXzCmkRD+bFFdN+mgF58kE3qDSPrUy0iFfi08D/IEF7JvSC1aT+7sB5a+8vpcI1AhoWV0gP/6/4KnXk+yEF+5Q7z/QFnpJQZG1Ud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i4vpogBl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so363995e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223874; x=1744828674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBY5l+PixCp4ufP2Qw107Vu8CITzsN6iXMKODMyTjH4=;
        b=i4vpogBl+KjhiJPXX49msagxiFOS1k7Z3/c2Rp4FBrIsitfnWKe7Y3rHjxOuZljdhc
         f/j8hUsu3/LVvSliJxx5iDZsFnieOyS1Iru80Lf5L1d19RvUdVGEwNPCQA2jsHeVtq3c
         Py/B+f2G1AX7ELIJDUmBkO/Y/r/zeqin+Te08epjxmccic6yReQDOAyxXyvTc/MeipkG
         ptosfmH4t/Eyno1rqY3gPD2uFartzjl99czaCupkHihloFZhh0R0SAfBSgZTMdeW/li5
         qIEQEJuPNW8xW9vSikm6e2fKL1LwumI/gBMLKxzsah3QFlO+rILMzxhtQ0WCULYGoO9Z
         eSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223874; x=1744828674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBY5l+PixCp4ufP2Qw107Vu8CITzsN6iXMKODMyTjH4=;
        b=OBUhqNY6TsmT17dnhgHiJeZ4xYZlLZK2ZKZ1ViLJLbqZHwMW3mI6Opxq7FcmrQKLtV
         W70i/eqmJ6b9xWpkn8Kb/ld8wx/khzG2gM+7gf1BbXUXQvlNYnhdNoHODe/uNO8KK7mZ
         cDap5s/ohflrhRdFSlp25/VPB8Akw0bXB359jtNaUd/KZCulJ+BfNqwMWJxId1rSz6zz
         CJbNf6KhXq4nf3cgwvteNAnikf60iwhJQmV1xVt8QabZuR1sInNdDmVPiLWTZDQxJroU
         uUMcGvv5znlixXWfxDdEp/0EbJ920cRweyDe5VFQe3inUjyH5yQVPJp7ocDq/rypDnEd
         spzA==
X-Forwarded-Encrypted: i=1; AJvYcCVesKloS1DaeBMU/Lg+1HYCcZPwquKOBk32dmX1kiyBJ4nzxjNoa6OEHnewgE9pFYWuFSBHnDZvre8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz53No+s+s44yiWuMhLRjAYnROta983DVsdzAbpiYT0Z/Uv43Xl
	yMjFahP2dY39oz1Esta+vejvLpkx7n5nZhVazJd6CB6dTID7JbKouD7JL6YHD2c=
X-Gm-Gg: ASbGncvZe6PeHLpdjbY9ZWg/LUvox9Z3efqaTwYUHgX4D9gBYdoUl8Uge5mfkm/Yryr
	MfQKydREoyyqMuC8g6V3T6H0W8pWt5pf+Pml5jp0Ww/trAWYanNzr2ecx+10LhpJACziHDQ5XYi
	yeBAhyBXg6sCplNfgc4i4BhIhh5jnrAtctYsDRSeJSWPz/K+QpqvUqeW6H5rLbA0Pk1tO9kvqTa
	QDgXktAHrNKtBODQVU+xZkOJEeKDR3nNjAD/xQhGnk0iosgWpKBi5HXYWwapUgNAY9rjrqyA/nq
	YsSQdqgA+t4FRN/wcto9Y2l9V8wcQNawr7U4Kc5+6zLsZgVUMxZHHpZ9czS4mi8EvuARJhTg6WJ
	Xwd1s7A3c0j7Fm6eIBw==
X-Google-Smtp-Source: AGHT+IFAKC1xQ+SvFIBAdWECoN8vWGtjTzlgIUSPfh1SZkL4Rn9KgapuDRcRLhk3lTM3F4qh4/7TRA==
X-Received: by 2002:a05:600c:1d15:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43f2d95298emr706915e9.26.1744223874070;
        Wed, 09 Apr 2025 11:37:54 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:53 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:32 +0200
Subject: [PATCH v5 5/5] iio: dac: ad3552r-hs: add support for internal ramp
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-5-fb429c3a6515@baylibre.com>
References: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
In-Reply-To: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6257;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=T5gEGbn9x5iyN8FJ+4Cc7jt+UgcnAHYwk2vPwTx/Tms=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk+P+ZJCb7rSPJ8PDz1++XIKz0/crbhZWywt9npGU
 XT5zeagjlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABMJ3MvwP3Fa6/zdG9/93m9i
 ++qQ9msvjWVTEhZs5J12eM2uv7f6Z05m+MMb/vDQhs8nDp/lti645DvZPPpunOTzfREvXNpn3kt
 uOM8GAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

The ad3552r can be feeded from the HDL controller by an internally
generated 16bit ramp, useful for debug pourposes. Add debugfs a file
to enable or disable it.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/ad3552r-hs.c | 162 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 156 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
index 37397e188f225a8099745ec03f7c604da76960b1..41b96b48ba98b6009723c6a7c0c39071083852f8 100644
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
+	AD3552R_SRC_NORMAL,
+	AD3552R_SRC_RAMP_16BIT,
+};
+
+static const char * const dbgfs_attr_source[] = {
+	[AD3552R_SRC_NORMAL] = "normal",
+	[AD3552R_SRC_RAMP_16BIT] = "ramp-16bit",
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
@@ -483,6 +510,103 @@ static int ad3552r_hs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
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
+		idx = AD3552R_SRC_RAMP_16BIT;
+		break;
+	case IIO_BACKEND_EXTERNAL:
+		idx = AD3552R_SRC_NORMAL;
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
+	case AD3552R_SRC_RAMP_16BIT:
+		source = IIO_BACKEND_INTERNAL_RAMP_16BIT;
+		break;
+	case AD3552R_SRC_NORMAL:
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
+	char buf[128];
+	int i;
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
@@ -550,11 +674,7 @@ static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
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
 
@@ -661,6 +781,26 @@ static const struct iio_info ad3552r_hs_info = {
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
@@ -705,7 +845,17 @@ static int ad3552r_hs_probe(struct platform_device *pdev)
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


