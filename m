Return-Path: <linux-doc+bounces-12896-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D588F2F0
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 00:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB65229D125
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 23:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8C315688A;
	Wed, 27 Mar 2024 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eAqfAphT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1191F154C1A
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581554; cv=none; b=A7GF1LnMzpvGHbDeAupWCaOrVnEDuvrGFaoLX6FJzVhRwGJn1bblJM8JcDbdYxOeCpBfRrVkwfFlVYnNY1szuQHch9LsOEp4kzQZP6tZPXhYhvDxyYrm3kJf3IiRPnwyv1weGEQAaOfVz7vP8UrmbrNficJIB9XV48SIh2rpJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581554; c=relaxed/simple;
	bh=h9SozZx07F/ieSA3Tkw6/3vSYWM+YqSBRP3PPQIUB78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHN1+cir6c4J+HK7F+4KAhsBta4arsF4ldmVRJ36BM3bJYt0EQy4pJeGHCM6tG3iagFMaKxWuSxodfpkdODVTvfdI7hBUEEi3gaSR0wZexQdwDtJFVzTnVFTFcu0t7vpELGSSGlarFhZBMzErWg5ze+/+wVIpTJH0ks5OM36Q9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eAqfAphT; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-222c0572eedso234003fac.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581550; x=1712186350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJZsj0mH5Na8/6xZVfDNraoADX8hsL14D7DbLT7TMPI=;
        b=eAqfAphTCe5xMLO7IDsfaBpiCj4b/x+7v8ccb8ODULuM2G7hkEN25kFJncN2sx/fvG
         QqUtlTjU4y695H2BTg3WTXcN767DuqbeSF6kh71SM1I0HU3UoyK8Q8jlsJwuNGAUdaqX
         v3y9v/LDcuEfFDJ4KrGbQzJPSwxGrC0/1sCznd7hZFChgt5v4WDZzdU2UoIMUeDGcrs/
         PvpmycHNdqEKepsxWgg5WbEUrtho04hZf5xJ9rtPoZYW5V2jgvQTNy3hKTKqqAXl9uw2
         AZCTB49zFOmtYTVDnDYwbARUFzNRGtTcij9x4iAXUwJ5fZatOfL/jouVCMKin9BmsZnq
         WBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581550; x=1712186350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJZsj0mH5Na8/6xZVfDNraoADX8hsL14D7DbLT7TMPI=;
        b=KD1fqguRXn+69csuSexsLb6pnX6jC2zPZt+Urkq3kY2w4Gbh+FQeEj29u2M/hYwihW
         2mYT+ORUXspHT4Xo8/I9SFFpQNB6L+kzxHzpF+2bkR49KsKKoOIMq7NgWq9HlIm+bGpS
         UQg3t+e1fQubfV911YoIDGF0yJdINGskLAqp8s0xZ9emevUHTURitkYPVODsLSzHeOvG
         b7Ksh186zenosLnNYolROShoDjej9VQsLHe6G38frd/wBwIHZMO+xX7RRTkX83yyYpoJ
         IrIFXE4SbJUHHJxdWZwgm8x/1OlPnaEWbE5xf4Jz+D40XBPbkcSATInVYRhi8yW/JOJW
         1CoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuJ1v1oOKS6mNoXSDDaqthpn1OpqdWPrFACReQd5Dj+oM4aYD7U5EiVfli2UIilTaR6gMlGd8XLV4QAgDPZLwQY1rSFv1xEB7H
X-Gm-Message-State: AOJu0YwprGG7GsYKtND/rr8xSiAolUXFGaJphiWQgF8cM4glUU44nb1D
	+NQgn2Dvk60X39HETWH1T+3lFNT3qlsR+8x2h2oLzNgOBs+uwIOOk7H91fPZtJI=
X-Google-Smtp-Source: AGHT+IFF6sA3ju+9mCH35rHh1zhgVOle14esmb64OwmiwIjcccCZ+Gff/k0HvFE6jlRCad9wpwZTGw==
X-Received: by 2002:a05:6871:3a14:b0:221:9013:d783 with SMTP id pu20-20020a0568713a1400b002219013d783mr1213589oac.34.1711581550253;
        Wed, 27 Mar 2024 16:19:10 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:09 -0700 (PDT)
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
Subject: [PATCH RFC 7/7] Input: mpr121: Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:56 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-7-5f4517faa059@baylibre.com>
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
 drivers/input/keyboard/mpr121_touchkey.c | 45 +++-----------------------------
 1 file changed, 3 insertions(+), 42 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index d434753afab1..c59e7451f3cd 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -82,42 +82,6 @@ static const struct mpr121_init_register init_reg_table[] = {
 	{ AUTO_CONFIG_CTRL_ADDR, 0x0b },
 };
 
-static void mpr121_vdd_supply_disable(void *data)
-{
-	struct regulator *vdd_supply = data;
-
-	regulator_disable(vdd_supply);
-}
-
-static struct regulator *mpr121_vdd_supply_init(struct device *dev)
-{
-	struct regulator *vdd_supply;
-	int err;
-
-	vdd_supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(vdd_supply)) {
-		dev_err(dev, "failed to get vdd regulator: %ld\n",
-			PTR_ERR(vdd_supply));
-		return vdd_supply;
-	}
-
-	err = regulator_enable(vdd_supply);
-	if (err) {
-		dev_err(dev, "failed to enable vdd regulator: %d\n", err);
-		return ERR_PTR(err);
-	}
-
-	err = devm_add_action_or_reset(dev, mpr121_vdd_supply_disable,
-				       vdd_supply);
-	if (err) {
-		dev_err(dev, "failed to add disable regulator action: %d\n",
-			err);
-		return ERR_PTR(err);
-	}
-
-	return vdd_supply;
-}
-
 static void mpr_touchkey_report(struct input_dev *dev)
 {
 	struct mpr121_touchkey *mpr121 = input_get_drvdata(dev);
@@ -233,7 +197,6 @@ static int mpr121_phys_init(struct mpr121_touchkey *mpr121,
 static int mpr_touchkey_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct regulator *vdd_supply;
 	int vdd_uv;
 	struct mpr121_touchkey *mpr121;
 	struct input_dev *input_dev;
@@ -241,11 +204,9 @@ static int mpr_touchkey_probe(struct i2c_client *client)
 	int error;
 	int i;
 
-	vdd_supply = mpr121_vdd_supply_init(dev);
-	if (IS_ERR(vdd_supply))
-		return PTR_ERR(vdd_supply);
-
-	vdd_uv = regulator_get_voltage(vdd_supply);
+	vdd_uv = devm_regulator_get_enable_get_voltage(dev, "vdd");
+	if (vdd_uv < 0)
+		return vdd_uv;
 
 	mpr121 = devm_kzalloc(dev, sizeof(*mpr121), GFP_KERNEL);
 	if (!mpr121)

-- 
2.43.2


