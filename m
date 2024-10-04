Return-Path: <linux-doc+bounces-26557-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE69911CB
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 23:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 826CDB23A57
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 21:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5E11D9671;
	Fri,  4 Oct 2024 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pc718Dyw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC01D959B
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 21:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078543; cv=none; b=E2CAWrc+P/ldxYTW2dhc4ENiYExr++BM5yQOZzNhThLqmFBRFC2N1oURYU7ZA4uLVzsl9VPvFaZWLiJvl6XpYSA1aoyrvAuRG1yR9h+AmtiUAS+fDcSc+bcMmWE/kvKOtkNitSn9UpFehpqxGuPuWz9tAHF7qb4D32VwJmGQvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078543; c=relaxed/simple;
	bh=KILZmuz9ow44vIq//sP6mcCwlyWKYRWENjjTm5mPzG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lX0QWy3cUuRr+VMEz386LcDcpHvR9TafKC6gPHPpU/BVTfcqeet8lL/Ny5lG9Q1VB/4ceAy8b/G6Q0DZMAp3jSNTvt9gCpP2vHB1xaEelXkBljjZuOGkj9Qv9jWG58FuvgA0UhuRS+qnv2g/0ZRwL436bxM4ArmSSTcCpJNOXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pc718Dyw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37ccd81de57so1620562f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2024 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728078539; x=1728683339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfbnsxkeeqEEncvUI/2jM+8bMu3HinvuaG19icxbGgs=;
        b=pc718DywKK1fOPwI+ys7JzBeSZ2dwVwJGEeQoU6Nz+yJqTbyPvKV5R5/k4RI6LyNe1
         BH6c7lpjgB3W3PXK26OEJyMApqzRzlDuWfMU3GIa56V0xaTzpuj0V0ypI5XeATh7nwvq
         H2M4CmmjHPiab5jLx8e4yRtOykmvvkia5phhDcbPcOPuOtEpwG7nf6jpczIiGVhoKZE5
         V93OXr+HeMa8NSyFNXTo7Ff6M3uPLTsNpIIJVqJQRNUAtpmJXHNrCT8+mjxLksGIdewN
         PAhCq/oKdV89uDrdivgkqayo3FOYR2kh9G0suuq7w9rXX10BYWUX2CYh9piF2v8xKfjA
         vt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078539; x=1728683339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfbnsxkeeqEEncvUI/2jM+8bMu3HinvuaG19icxbGgs=;
        b=LHHqb3K0Rii9CRGqPerbD4IE0xAPszob/kzdZIAm41A5GW6O+39YtwRfxp9ihz+KSI
         omxivwQeUMUJ0AU+xgCe45KivapoUnAydIyihfkEkyqAiS7Ngt2FPSszmPbpebAZiHvq
         dMEhgKCK4aMksqUaEyuzwdXBwJh4ED5xdRDMPsBLlmKIJh5w1A8KQSQ3+WDBTqOAMgX8
         rEqlnVDAKUkV2U0W7dk+mpfbt84XMa+xqTSy/CkR8xlE4/vQGe2Erd8k5xINuRr0QA+l
         fpfQbbAmgbg8BQDk8olDsKikNuw88WfkDjG0YNXqnlRDjOlzYGKdPTDfSca7CPuVALvg
         xgiA==
X-Forwarded-Encrypted: i=1; AJvYcCX3MIkDSkbHWBgfw3NUH//0kSqC5HYaPJ5VjEeqdFb+lVU4piPENDLADxQW3YPVOFpF9jvMSuHWR5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjccRqDwfke0LUxG0XZEVT5NExDDtQJH0bQT3zjft0fYMUonLw
	W2l2Qgp0/NcHfL+w3pbZ67z3bmuEcM7Ds0+QkGHDa/KAZrgnobBa5QDcFZ/INd0=
X-Google-Smtp-Source: AGHT+IETPUO4x+K1ayVzkXTAt5fy1m+nf2IbmK885d24N2g/sLQUZx6PDrGLnw75Jn056V+py2IoJA==
X-Received: by 2002:a5d:4a12:0:b0:374:bf6b:1021 with SMTP id ffacd0b85a97d-37d04a7b139mr5447913f8f.27.1728078538832;
        Fri, 04 Oct 2024 14:48:58 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4ab63sm24680375e9.40.2024.10.04.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:48:58 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Fri, 04 Oct 2024 21:48:44 +0000
Subject: [PATCH v3 10/10] iio: adc: ad7606: Disable PWM usage for non
 backend version
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241004-ad7606_add_iio_backend_support-v3-10-38757012ce82@baylibre.com>
References: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
In-Reply-To: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 aardelean@baylibre.com, dlechner@baylibre.com, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728078523; l=2322;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=KILZmuz9ow44vIq//sP6mcCwlyWKYRWENjjTm5mPzG0=;
 b=V1//BkjB3KmevEEh7iNe+Ik1D5yorX+BR9PwVTNLgBma08CQC6efmz2xTQWL70TtsmmAjdxN8
 zoDQV9i4/KCCNsoS49wGya0TBkhVp3ptAH3YD9OUUo86YOXEL5TeLem
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

Since the pwm was introduced before backend, there was a mock use, with
a GPIO emulation. Now that iio backend is introduced, the mock use can
be removed.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d86eb7c3e4f7..7d02aad45242 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -473,8 +473,6 @@ static int ad7606_pwm_set_high(struct ad7606_state *st)
 	cnvst_pwm_state.duty_cycle = cnvst_pwm_state.period;
 
 	ret = pwm_apply_might_sleep(st->cnvst_pwm, &cnvst_pwm_state);
-	/* sleep 2 µS to let finish the current pulse */
-	fleep(2)
 
 	return ret;
 }
@@ -492,8 +490,6 @@ static int ad7606_pwm_set_low(struct ad7606_state *st)
 	cnvst_pwm_state.duty_cycle = 0;
 
 	ret = pwm_apply_might_sleep(st->cnvst_pwm, &cnvst_pwm_state);
-	/* sleep 2 µS to let finish the current pulse */
-	fleep(2)
 
 	return ret;
 }
@@ -576,7 +572,6 @@ static irqreturn_t ad7606_trigger_handler(int irq, void *p)
 	iio_trigger_notify_done(indio_dev->trig);
 	/* The rising edge of the CONVST signal starts a new conversion. */
 	gpiod_set_value(st->gpio_convst, 1);
-	ad7606_pwm_set_high(st);
 
 	return IRQ_HANDLED;
 }
@@ -900,7 +895,6 @@ static int ad7606_buffer_postenable(struct iio_dev *indio_dev)
 	struct ad7606_state *st = iio_priv(indio_dev);
 
 	gpiod_set_value(st->gpio_convst, 1);
-	ad7606_pwm_set_high(st);
 
 	return 0;
 }
@@ -910,7 +904,6 @@ static int ad7606_buffer_predisable(struct iio_dev *indio_dev)
 	struct ad7606_state *st = iio_priv(indio_dev);
 
 	gpiod_set_value(st->gpio_convst, 0);
-	ad7606_pwm_set_low(st);
 
 	return 0;
 }
@@ -1204,6 +1197,12 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		indio_dev->setup_ops = &ad7606_pwm_buffer_ops;
 	} else {
 		init_completion(&st->completion);
+
+		/* Reserve the PWM use only for backend (force gpio_convst definition) */
+		if (!st->gpio_convst)
+			return dev_err_probe(dev, -EINVAL,
+					     "No backend, connect convst to a GPIO");
+
 		st->trig = devm_iio_trigger_alloc(dev, "%s-dev%d",
 						  indio_dev->name,
 						  iio_device_id(indio_dev));

-- 
2.34.1


