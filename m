Return-Path: <linux-doc+bounces-12895-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C631988F2EE
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 00:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037C11C2C0B1
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 23:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFEE156877;
	Wed, 27 Mar 2024 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AZe/5H+P"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC518EA5
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581554; cv=none; b=MFrV2gou1HwrXK7Ba292xw6FZqg08OqKjzn1xPVnr/cymFxXTNpuHvCY8jmDuLuv+Nj1bsDIt+If2AwI9CD0tKLEgZ5nFIjkvWl5MCoO8IUplNInXKsgyCHhwN+Npg/55ScCYSQE4cmpfKeF43vrHbFGktlMS7jlprmV60ujBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581554; c=relaxed/simple;
	bh=xlOFHnY+VUAHimj0/6CI3uzJ6CONg5CROD3tFFJ2TF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1mEnnfpzGggDzveQuRMcIg5dzCe1DnYRn4rkssios1b5+KWpaYQAYMn8fNRLXh85qAHMeOActQTkBau4L+10cFK3LeCMzBKejZ796fCR6JnAL3/tayX9Tenn47IgptryZ1loebppZtttwMyWWcSTHXxu4JDU3I4tsOMMCRI9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AZe/5H+P; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-22a8df1df8fso232191fac.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581549; x=1712186349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBx5yqCcIG/deXybWASqoKrfUt47GVVbdT7E/yXEMkE=;
        b=AZe/5H+Pjy5tCOeoAALOzNVLm6n1Q05iv9SH37MheVT1+g0TMz85zs6kL0vLUX5hRI
         gkaVoES9vc1z7jptM736If8A1nvpdcEZJb3ylbLRrEBcGud7KoJoDk6rPvt61ysRhnKb
         bKczNZLbrIb07MnkGyjqTJB7Q5+iT+PAxDnNA/AYFSNU8P8CR7Kkkwnn7y3eG9VoyJbZ
         Z1FzV9DRwmCFD+ccxbCVFv6cxwpJz6Cvl5PqQLZS3ch5H7fQm2jzuTTS1ylPJXX9BKTH
         qCwFjwoPgkRFzZS23CN9bn5BfO5lXQrGT0gyO94Lll+G1k3THkzdh0dGAFF6QxnGMKTz
         Og/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581549; x=1712186349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBx5yqCcIG/deXybWASqoKrfUt47GVVbdT7E/yXEMkE=;
        b=v+nMqSRvmSCDEtEd9Fhw9lgzuSPJvk99puV9WrgZJNIFbfqxBqoklyQ29uHDOvzzdh
         FjgaHIiSWPSfY0tpzjky75CV9u18g2UeiN3MFRebZiafmHpYBeLnvUm6DXMrPo2TMES1
         D+Iqw7Nko88Kt70ZyXSPPlOmFVahl8FNFUzjSN99+LfDEWba5rXTZipfk5HDCAvwL9+h
         p9vUnvtlCPf91bHpDYusM7TempS5c9ylXPkNc9j37bFgek0+H8NFdA5GOix6iZfcfm4M
         vrDZiWmkRE/oNcW0NTJ1MavQ6V8on8Iff88S2ktz601dNcudI17ZJgGCofzB0c++MnfI
         +viA==
X-Forwarded-Encrypted: i=1; AJvYcCUsXBkNYTFwn5f57PX9raF2PqScSFICmJPGAchci+kpoNXHeg1OiD/9EOVA+10zOd4YrJTYCuFGvKogvy1AvOyVBWF0nfo+cHvA
X-Gm-Message-State: AOJu0YyvJf4IKhp7lddb5o/8TSN06Am5LLjDjuvVulRunhu+lHWXCvBD
	ydZzXwJzPd/Xz2RyWVR83GFEtpzVvHDnKFrfwhaGGjewkLuIt+x0Nz+7hSfghVs=
X-Google-Smtp-Source: AGHT+IFXU8zmzWmrbkxOxvW7wtT9Hq/b5rbtfGnHI6ZuQs2D4otmJCIrbq7hVTyLaL9P54g4uvOwbQ==
X-Received: by 2002:a05:6870:b14b:b0:229:fa5a:2fec with SMTP id a11-20020a056870b14b00b00229fa5a2fecmr1265617oal.54.1711581549199;
        Wed, 27 Mar 2024 16:19:09 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH RFC 6/7] staging: iio: impedance-analyzer: admv1013: Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:55 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-6-5f4517faa059@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

We can reduce boilerplate code by using
devm_regulator_get_enable_get_voltage().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 9149d41fe65b..e4942833b793 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -84,7 +84,6 @@
 
 struct ad5933_state {
 	struct i2c_client		*client;
-	struct regulator		*reg;
 	struct clk			*mclk;
 	struct delayed_work		work;
 	struct mutex			lock; /* Protect sensor state */
@@ -660,13 +659,6 @@ static void ad5933_work(struct work_struct *work)
 	}
 }
 
-static void ad5933_reg_disable(void *data)
-{
-	struct ad5933_state *st = data;
-
-	regulator_disable(st->reg);
-}
-
 static int ad5933_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -685,21 +677,7 @@ static int ad5933_probe(struct i2c_client *client)
 
 	mutex_init(&st->lock);
 
-	st->reg = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(st->reg))
-		return PTR_ERR(st->reg);
-
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&client->dev, "Failed to enable specified VDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&client->dev, ad5933_reg_disable, st);
-	if (ret)
-		return ret;
-
-	ret = regulator_get_voltage(st->reg);
+	ret = devm_regulator_get_enable_get_voltage(&client->dev, "vdd");
 	if (ret < 0)
 		return ret;
 

-- 
2.43.2


