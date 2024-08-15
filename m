Return-Path: <linux-doc+bounces-22832-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350B952E03
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96DB71C21F08
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FC01993A3;
	Thu, 15 Aug 2024 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o/wKZo/t"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803D17C7DD
	for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 12:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723933; cv=none; b=V0GW8C8afGdP/0GT1cGKXxgG3HhBOOOsTmJHBrpyW8ddgU3McxTT4uAaff/jSPLVI2R+urM7ZEqHDHn6X1qRu32MIcWR8HY7WGAfMMO7SIrl4e8jMQUhGGcnVU4iDpwtoM9uV7yuHh1siMQzpVghqV8GFntE3TF85Av8gAd17aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723933; c=relaxed/simple;
	bh=NbKx0MzTSy4AkOnvlPHkNNwV65/pkwG9IF0PJXDZUNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCHHpx+unP7BsFp1JfEzE3en21EMK4VoEj5vp2/k1QZcXYn5v4LrneYL7FwX6+5e/B20wo9g8NXQ0OTNmCwqui1rfEqKFH+1mcYaL3GaSG9pZfS9GuwAeTAfn/KPdRcCQdhIsTqKrMFvD/1y0E3bLnVR8DSvPZX+XqeMPMc1Kaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o/wKZo/t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3684bea9728so408387f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723723928; x=1724328728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nlruai3BQqsm2YC4dPuHFKVGpCYgCvlc+hshYkB6H2k=;
        b=o/wKZo/tDnKqm0doODysO8m8dYXNXqCSMbezw+IhBudRcpzNE3+m6W3OnhxG3BW9b2
         4iIZ7CjifrOGx+AWR3vXAP58Le2OAMhaEGv4tMQWJ76R++erQz1Qw6tNkxbEyZv9LWbI
         Ss0uP57a0UQwoM847ZAt3OcnrFzewDypuhEvzTKMWJZTkiXTLuVQLYV0AdQ22pYQEdOD
         Cf8Odsr/SRGlaGL/ZU5z/EAVXl/sU9bvkNPkMVmMyHulUVT8zCzKUiot2eSXXx68QTcu
         SxbJv9fXHdWjznC/h2JjdLvr55GDpC5bPw0v5LtPDX54YtogaVnA4Tu5kw2Vnvc4T+2O
         MS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723723928; x=1724328728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlruai3BQqsm2YC4dPuHFKVGpCYgCvlc+hshYkB6H2k=;
        b=C27OZDdVRMcsF8kOZjaUvozI66YponhLvTczT/84YXXsHI7G9TSky02DWG4vXxS4Hi
         IvAtyNPOjoDWeAtvEwm9tJ5vFKiyIZRszOorKfzlEgQqiI5Y9Bt95BltduKLhEFqpIN7
         Vtzell/U57vLBj1wsRH9IC5C90TsWZWtiOBuLKJj0qOgBMyr1GhsflOGPan+SqtqX0IA
         0kk2bTrlbQNkZyr8dcVwTw2G7bF/sfkmXP3WP48J3I8C7kvNJd4QqTsicRSmyUjpWuBI
         IWl1+aeJWW0P4HTnSGeJ/48gao1czsEsKGnwXPwJOBJrBvYuOLnT084KBKFKhMYKPr7b
         lS6w==
X-Forwarded-Encrypted: i=1; AJvYcCUBxs45W8BdYuhu6JCirOrm46sQL5KgPG+3zY+/uGLumsjnw0Oe/3nxYEYkV+fSS3S4e9qu9D8FYujyva0MkondwvZlNJGvhKDl
X-Gm-Message-State: AOJu0Ywi+KwUG4qTZKfYpIIKlO6Dnv2V477J4llYlBUnQKetB6Mhfx0L
	jYYoKEENp6qeCKHTAQSvzndmM5DN2xerpkNF2+txEye+IvDD4NEfkQV6k+ltlrA=
X-Google-Smtp-Source: AGHT+IFqE0M2OmpEvxD4duj5kGOQWRtd+obMKR2lPW9I+CeIS+oRNhsQvPM4dCQIxcqphRcbR+qxkQ==
X-Received: by 2002:a5d:59a5:0:b0:371:728e:d000 with SMTP id ffacd0b85a97d-3717775c9b2mr4340274f8f.1.1723723927819;
        Thu, 15 Aug 2024 05:12:07 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897926sm1365082f8f.87.2024.08.15.05.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 05:12:07 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Thu, 15 Aug 2024 12:11:59 +0000
Subject: [PATCH 5/8] platform: add platform_get_device_match_data() helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-ad7606_add_iio_backend_support-v1-5-cea3e11b1aa4@baylibre.com>
References: <20240815-ad7606_add_iio_backend_support-v1-0-cea3e11b1aa4@baylibre.com>
In-Reply-To: <20240815-ad7606_add_iio_backend_support-v1-0-cea3e11b1aa4@baylibre.com>
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
 Guillaume Stols <gstols@baylibre.com>, 
 20240705211452.1157967-2-u.kleine-koenig@baylibre.com, 
 20240712171821.1470833-2-u.kleine-koenig@baylibre.com, 
 cover.1721040875.git.u.kleine-koenig@baylibre.com, aardelean@baylibre.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723723923; l=1781;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=NbKx0MzTSy4AkOnvlPHkNNwV65/pkwG9IF0PJXDZUNw=;
 b=VOYJGuD/1ccizW8foihyuYIcvcsufWDfHQhMJgly8oXiPmQELygHZcqqg/NPsa767PekcfJOM
 vx/cis54SwFDlOLGtkc07Yo/YSNxVhQeNHA7o9alToZqiRWmpOqxr9/
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

Inspired from spi_get_device_match_data() helper: if OF or ACPI driver
data is available, platform_get_device_id will return NULL because
platform_match_id is not called, and pdev->id_entry is never populated.
This helper function checks if match data is available, and otherwise
returns the ID table data.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 drivers/base/platform.c         | 12 ++++++++++++
 include/linux/platform_device.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4c3ee6521ba5..26e9a026eb05 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1090,6 +1090,18 @@ static const struct platform_device_id *platform_match_id(
 	return NULL;
 }
 
+const void *platform_get_device_match_data(const struct platform_device *pdev)
+{
+	const struct platform_device_id *match;
+
+	match = device_get_match_data(&pdev->dev);
+	if (match)
+		return match;
+
+	return (const void *)platform_get_device_id(pdev)->driver_data;
+}
+EXPORT_SYMBOL_GPL(platform_get_device_match_data);
+
 #ifdef CONFIG_PM_SLEEP
 
 static int platform_legacy_suspend(struct device *dev, pm_message_t mesg)
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index d422db6eec63..e2cc09ecc447 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -45,6 +45,7 @@ struct platform_device {
 };
 
 #define platform_get_device_id(pdev)	((pdev)->id_entry)
+extern const void *platform_get_device_match_data(const struct platform_device *pdev);
 
 #define dev_is_platform(dev) ((dev)->bus == &platform_bus_type)
 #define to_platform_device(x) container_of((x), struct platform_device, dev)

-- 
2.34.1


