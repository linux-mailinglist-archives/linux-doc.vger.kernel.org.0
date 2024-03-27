Return-Path: <linux-doc+bounces-12890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D688F2CF
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 00:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50FEA1F2AB27
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 23:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFB3154C09;
	Wed, 27 Mar 2024 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gdYn2HNs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D94154C11
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581547; cv=none; b=DC51kA5Sdc2QJqPZ9/GgmdGP3B9rOKGGLCUr4Qky+xhh3kT6koR+LGMv/dFXqkvxqS+FVU69CyWNh2AGKXoxCZsxpUQM0HvlYFYj6wKDjcrCArHxWD1Hjcfti06Q3HeVEjgO+FxYpZIgVmbzgHK9xENC0WTOmE3TXbza7XxMY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581547; c=relaxed/simple;
	bh=ly8n7SxGz9Lf2EUP25mArGs3mqGcGcPAZGBiTMozfFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1eILeSpmkjrgwcfvrnGUsL9f/8dvCGuCIJMscDrNpsMLNn0l7oBWuTkKkXiJhdXVNZMo2jtqqXILq2kRoT+Vt3AY0YquaUWbtylNZDU8GunkCXS3sNDCVNi5N267m5Q6dvhVSiqaNfq0W5X8V+JtVKO5C6Sre9lDVc3nHHyIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gdYn2HNs; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e6b01c3dc3so210368a34.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581544; x=1712186344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE6UqUKX3G/FV5HVYmxMOtqukpZG7UeidX96eu+NYsg=;
        b=gdYn2HNs6K4qNEtXCegpSeDGvDV8ACFqhl6Vw7p9/9Zn5KL7U7CJyRzv4oEUP2PMR5
         AKCmYlJhBTSAEsxYPxJ86q1ivvhTcUFZgFSuV1IOS2YTJQbS6t4gfXZsaVYvLW/gd4V3
         +BaPLv351a9TJ3oTxqqzPeBLOMFKo/+DCu++5GtOZgLvE4O+LnX8bKtlgWbIofTNmSrR
         WFdGNJqz2nZWysZ1zrflE6XVoa8EvSoGsQmeFNaYFRevPflnCftuprK54+Sjn4WRyxG3
         p7QvTOg4/8kuwS5Y2OKt/x6LHKoBihgpkdzBouj2haJea7QiHmCDPVHWIBMJGbX7EyDr
         Jy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581544; x=1712186344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE6UqUKX3G/FV5HVYmxMOtqukpZG7UeidX96eu+NYsg=;
        b=V7NylYJuq/WC0cok/vEZLPpXsiWXN+RgHxSD7SEN8Btzv91D6zDCx81xJiBTVGzezU
         A6VL3H8pPYetTiIMHHVcCD0SnueOgqwFQy3sIrwhDudQGP+hCj4eLndCSr+c1wC7NzBx
         SCugnFCB70ByhC1Izfsay8Gs2L6m6UjRZr+zzk8WKnfEz5EA4GRt6jLl9fke3CsKMBPA
         mBBpffoiGUIwYFF6slzx+PNo6qB6nhQWHQaBvZ5kE6SmaUr4EklQys0hD/Yh0C4ivdZW
         rzD041fV4TIsJaImg8FszJzMcFA/qG8IqZixjAsHJQHJ9N9p04Pidj9JZnn02HKqhchc
         muog==
X-Forwarded-Encrypted: i=1; AJvYcCU5IUi/YyBX1ZDvcyQ7/ZkYTtBmyckUqWnbXK0E/m10tyni1Qy6vOU9IqFiVV3l39CDZ555miXbqiUhgtbqtHLJOMTJm5c/3frl
X-Gm-Message-State: AOJu0Yw6YBPxk7OB1m+EkilQbqW8TSbroD/jgEffhXnCSSJGCPwBIVC+
	vjQDmIMmo4CR4S+K5/WRZtXLjZOxIYkoPp/DtJaEs8LegcB6SlrAhS9sQ7d4nco=
X-Google-Smtp-Source: AGHT+IEoTHHATEQkuJa2BbeiTLbiTgSE1yaSMq5ULG3gGF3llvbq0XtMCg26/o3L5+Q/P6Gnym6iXw==
X-Received: by 2002:a05:6870:7d19:b0:22a:5690:f056 with SMTP id os25-20020a0568707d1900b0022a5690f056mr1316238oab.44.1711581543700;
        Wed, 27 Mar 2024 16:19:03 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:03 -0700 (PDT)
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
Subject: [PATCH RFC 1/7] regulator: devres: add APIs for reference supplies
Date: Wed, 27 Mar 2024 18:18:50 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com>
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

A common use case for regulators is to supply a reference voltage to an
analog input or output device. This adds two new devres APIs to get,
enable, and get the voltage in a single call. This allows eliminating
boilerplate code in drivers that use reference supplies in this way.

devm_regulator_get_enable_get_voltage() is intended for cases where the
supply is required to provide an external reference voltage.

devm_regulator_get_optional_enable_get_voltage() is intended for cases
where the supply is optional and device typically uses an internal
reference voltage if the supply is not available.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst |  2 +
 drivers/regulator/devres.c                       | 83 ++++++++++++++++++++++++
 include/linux/regulator/consumer.h               | 14 ++++
 3 files changed, 99 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7be8b8dd5f00..fd954d09e13c 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -433,9 +433,11 @@ REGULATOR
   devm_regulator_bulk_put()
   devm_regulator_get()
   devm_regulator_get_enable()
+  devm_regulator_get_enable_get_voltage()
   devm_regulator_get_enable_optional()
   devm_regulator_get_exclusive()
   devm_regulator_get_optional()
+  devm_regulator_get_optional_enable_get_voltage()
   devm_regulator_irq_helper()
   devm_regulator_put()
   devm_regulator_register()
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 90bb0d178885..e240926defc5 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -145,6 +145,89 @@ struct regulator *devm_regulator_get_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_get_optional);
 
+static int _devm_regulator_get_enable_get_voltage(struct device *dev,
+						  const char *id,
+						  bool silent_enodev)
+{
+	struct regulator *r;
+	int ret;
+
+	/*
+	 * Since we need a real voltage, we use devm_regulator_get_optional()
+	 * here to avoid getting a dummy regulator if the supply is not present.
+	 */
+	r = devm_regulator_get_optional(dev, id);
+	if (silent_enodev && PTR_ERR(r) == -ENODEV)
+		return -ENODEV;
+	if (IS_ERR(r))
+		return dev_err_probe(dev, PTR_ERR(r),
+				     "failed to get regulator '%s'\n", id);
+
+	ret = regulator_enable(r);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable regulator '%s'\n", id);
+
+	ret = devm_add_action_or_reset(dev, regulator_action_disable, r);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add disable action for regulator '%s'\n",
+				     id);
+
+	ret = regulator_get_voltage(r);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get voltage for regulator '%s'\n",
+				     id);
+
+	return ret;
+}
+
+/**
+ * devm_regulator_get_enable_get_voltage - Resource managed regulator get and
+ *                                         enable that returns the voltage
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * Get and enable regulator for duration of the device life-time.
+ * regulator_disable() and regulator_put() are automatically called on driver
+ * detach. See regulator_get_optional(), regulator_enable(), and
+ * regulator_get_voltage() for more information.
+ *
+ * This is a convenience function for supplies that provide a reference voltage
+ * where the consumer driver just needs to know the voltage and keep the
+ * regulator enabled. Also, as a convenience, this prints error messages on
+ * failure.
+ *
+ * Returns: voltage in microvolts on success, or an error code on failure.
+ */
+int devm_regulator_get_enable_get_voltage(struct device *dev, const char *id)
+{
+	return _devm_regulator_get_enable_get_voltage(dev, id, false);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_enable_get_voltage);
+
+/**
+ * devm_regulator_get_optional_enable_get_voltage - Resource managed regulator
+ *                                                  get and enable that returns
+ *                                                  the voltage
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * This function is identical to devm_regulator_get_enable_get_voltage() except
+ * that it does not print an error message in the case of -ENODEV. Callers are
+ * expected to handle -ENODEV as a special case instead of passing it on as an
+ * error.
+ *
+ * Returns: voltage in microvolts on success, or an error code on failure.
+ */
+int devm_regulator_get_optional_enable_get_voltage(struct device *dev,
+						   const char *id)
+{
+	return _devm_regulator_get_enable_get_voltage(dev, id, true);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_optional_enable_get_voltage);
+
 static int devm_regulator_match(struct device *dev, void *res, void *data)
 {
 	struct regulator **r = res;
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 4660582a3302..35596db521a0 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -164,6 +164,8 @@ struct regulator *__must_check devm_regulator_get_optional(struct device *dev,
 							   const char *id);
 int devm_regulator_get_enable(struct device *dev, const char *id);
 int devm_regulator_get_enable_optional(struct device *dev, const char *id);
+int devm_regulator_get_enable_get_voltage(struct device *dev, const char *id);
+int devm_regulator_get_optional_enable_get_voltage(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
@@ -329,6 +331,18 @@ static inline int devm_regulator_get_enable_optional(struct device *dev,
 	return -ENODEV;
 }
 
+static inline int devm_regulator_get_enable_get_voltage(struct device *dev,
+							const char *id)
+{
+	return -ENODEV;
+}
+
+static inline int devm_regulator_get_optional_enable_get_voltage(struct device *dev,
+								 const char *id)
+{
+	return -ENODEV;
+}
+
 static inline struct regulator *__must_check
 regulator_get_optional(struct device *dev, const char *id)
 {

-- 
2.43.2


