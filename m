Return-Path: <linux-doc+bounces-42021-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B1A784E8
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 00:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52F8716C19D
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 22:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CD021D5BF;
	Tue,  1 Apr 2025 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UNik61EH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D321CFEA
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547844; cv=none; b=EMA1R6HU2YCgdagNzBcIhPs8mE7fD+hRpsdXNJkG+CWS+9WrBVkAFjNc5XIxuvPpSWYT/n1lEW4QFA6kdJBGozDFMz8+JJMI4bka00PpjVnHLtiJNBoRNshG8Tezn3znVsI8GJ2WD7xzcLktPawUG/yvhGCrl58wNco3tf7Ay/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547844; c=relaxed/simple;
	bh=mGgJDaH4xhv6QI9QUw9f5zQcEipBpHkkqShLk6X20A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1o0/oH+Na8d86B6ytK1r5o32QR/mzcHC0JzIP2AsUWyqLqwfON4fLMMfkWwoPc/ks7f80t0O6Wf7L7UzYWCB6LysF3JAx9vOSH4vHYhXToalluGX4sbF+AjHUFX/wJzP2l5h+yIB/0krfHclMXmCitasg3bQevFgGFMn3skLrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UNik61EH; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2c7f876b321so1771611fac.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547841; x=1744152641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4MrlSMQYXfqLNGmvXKKmQJWuhqWmoAxaLjy/tU8NSk=;
        b=UNik61EHQ5NZPdPMC8GaiVSLvMpUJRgX4SFx53zC+SXLp0IO0VG0V+IOLLFiyh1vgy
         G5cyMF2X8jgtXwQ5JFMq7MdS6fZg0ksvhiXg6m0W2jTwP9sUCb56nUnX1mNvWEtJwsgv
         WuZkleG4PxWZ2VyJG71BX7lHBJglNYzE0Idz8MZw8wzg+Z5TpQxlQVBUq8MIkV7p/Ve3
         fiblhEPhQYjYJgTmNr6YOuTjinREhX3o4xAuLpe8cuzNXhgzQqsmnB1E99pm7WGva9V6
         ExPElXzKZ7pI09E4m+ysxP7UpnYtleVMakxY2+VVv9uEwSf3EXKRepoEhj4oO2MJPpI6
         YUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547841; x=1744152641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4MrlSMQYXfqLNGmvXKKmQJWuhqWmoAxaLjy/tU8NSk=;
        b=BfgdaVYXk8aVKWTEN2K3JE535p6H5K+i38FBhfo2/YQrSb6jEkj7NFlcdJBoiPgtYO
         qEVQsEGhK+nnQ67YleLpgFPzKzC80Z5s0epUgYZ3AvhvWFF4YKFrqX7cm3JcjtvWasY2
         MYjVKwKWC58XdquvhrjxyCIcHZIx6hGJEBY9uDsu+jFe1ZMP1ibvNo+jWL6I4BDqLXp7
         6JX/eyY5iciA9ZDvCJPwwqaFtVL5KDUuxnQ0+obvlDht9SAyR6K1dhwkDUHq/ZgB49j4
         VswhBVirYU7ILtfppRr+TAYhTMmL3o2zQLsNbkc0cPO2VFgKat80g+s4WU4IJUD7JL40
         MqZw==
X-Forwarded-Encrypted: i=1; AJvYcCVxCqgirSGxNgg5PlgthDgjCFKGF8+4FxLQwd0883Lo+FwcifG+ObrHNVNm3CRq0zXAAP0p71HvJjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NZSFXuCloDFH6yFvI+7EmHIupFI26veBZZ6rYzALuq462/Zg
	DTeZ27QjUdWKkjGmBeN5Fk5rwlS7W04jRvOSQEVhmIFaexRf9gzbc7r+pOytPKo=
X-Gm-Gg: ASbGncueUF2gzdJlVy0GgZzGoZa0org9AQFbUaosOemXL39ZM9HVPbErCUkarxgjKkE
	fjEdIHX/sVHH8T7bCIJJwc9H1+6GXEpBcBSj5iDzMElInCzgzezEX0qNpTbV4U4OXRa/hjUfpHW
	RSLghllMDgAUL00RKKlm+OV7xHGmpx3zC1Fn9d+4c/sFz7kRFMH9XFMDzcD1aONToybiUSUBRCe
	CTQsBSCpeJEfjw57s7sAdtb/JaqpaDgP3B/uOMhHxfMz0/TFcFQCwIaUFesqyVwunnrh0gr5Civ
	uphDWoyyI9bynbbdKdaZaauVIoz2y+IxRMllT2q3NF+PqTvTLghdd7LthhxoHPQ/DkkdFZIDfSB
	n
X-Google-Smtp-Source: AGHT+IGu7cyaLTEX/wQeu6tMXf3DzRe/6ksAnZQYPaYIA2HH9zCquubtYJqZ/1DgDdD48WT4WnQv2Q==
X-Received: by 2002:a05:6870:611f:b0:29e:6bdb:e362 with SMTP id 586e51a60fabf-2cbcf57b801mr8067880fac.17.1743547841563;
        Tue, 01 Apr 2025 15:50:41 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:11 -0500
Subject: [PATCH 4/5] iio: adc: ad7380: add ad7389-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-4-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3143; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=mGgJDaH4xhv6QI9QUw9f5zQcEipBpHkkqShLk6X20A4=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23eD/pse4Xmm2AiNGkH52tKH/nXHQVnFNP6
 0KoQFRURyKJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAN0WhAApqAFkLTSxzZWHmc2w+iuKN1dHlGzNy6Ih2pRlAI
 KVpH4Ueb0sP4KBcwT4CSd1CJ+ljVHzg9j1HQYCUjFFslNXJrBVXm8Wkpsv9jOO1a2Al0Lwdj2oh
 GFLCNy1NJpw3A4ZO1OTFyfPZGSNYX2Er+gjVl8keu8pzJiQ6RxDMwVx6TsLlBd17CVdQB5blwL5
 taEwgMbIX1mZ5bbdXjktzqjgUnhSdCGW1hIF3RT7vfVEZihR1VyZ+lSSCmV47RfHZbd+cOCV3zC
 uAxNvArkdjQHXbw+kZ/axwluYJp0Y1hwgtY40lQOkw9qYnsONUJ8y+x96ZPM1+gaIlPCGt7JrNH
 aKjnC8NOzH0cBGS9Wf90lxqrEkG4FNBjBiOMY8oMHHNmqekoOIi2iUl0TWosze3L562VVRBa/eG
 JesB9ZDNHg6WtZJq2qWyyIB2qc92QDbkkyoF5YAHbc/423bFqiznxIrY9iidMT8j7WRw9d8y+Fl
 ToB/KfwGXA4OcDxqzyuh5ygJ6HMhKD8VXWAVYDr72bWT2rWmzHs0J/LR4d2vOj1mMi6POO4gs39
 G7ynLvBgD1IMuF9IpWyBNiMb7ajGbIM+1UUYun+6xgdFXi9aVYLlEKRYwUeQxtwWxDnKM69undt
 hyJIHbiq5PEsqpuXAjJ/BtmSTy2EiEJ7rWxlzwcUm380=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add chip info for AD7389-4 to the ad7380 driver.

This is essentially the same as ad7380-4 except that it is internal-
reference-only instead of external-reference-only.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index e5cd11fd7b1083af2082985f2c0226b1a97d600f..190ab411739feea32e189cb3ede925056ba4a87e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -13,6 +13,7 @@
  * ad7381-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7381-4.pdf
  * ad7383/4-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7383-4-ad7384-4.pdf
  * ad7386/7/8-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7386-4-7387-4-7388-4.pdf
+ * ad7389-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7389-4.pdf
  * adaq4370-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4370-4.pdf
  * adaq4380-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4380-4.pdf
  * adaq4381-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4381-4.pdf
@@ -812,6 +813,21 @@ static const struct ad7380_chip_info ad7388_4_chip_info = {
 	.max_conversion_rate_hz = 4 * MEGA,
 };
 
+static const struct ad7380_chip_info ad7389_4_chip_info = {
+	.name = "ad7389-4",
+	.channels = ad7380_4_channels,
+	.offload_channels = ad7380_4_offload_channels,
+	.num_channels = ARRAY_SIZE(ad7380_4_channels),
+	.num_simult_channels = 4,
+	.supplies = ad7380_supplies,
+	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_only = true,
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
+	.available_scan_masks = ad7380_4_channel_scan_masks,
+	.timing_specs = &ad7380_4_timing,
+	.max_conversion_rate_hz = 4 * MEGA,
+};
+
 static const struct ad7380_chip_info adaq4370_4_chip_info = {
 	.name = "adaq4370-4",
 	.channels = adaq4380_4_channels,
@@ -2051,6 +2067,7 @@ static const struct of_device_id ad7380_of_match_table[] = {
 	{ .compatible = "adi,ad7386-4", .data = &ad7386_4_chip_info },
 	{ .compatible = "adi,ad7387-4", .data = &ad7387_4_chip_info },
 	{ .compatible = "adi,ad7388-4", .data = &ad7388_4_chip_info },
+	{ .compatible = "adi,ad7389-4", .data = &ad7389_4_chip_info },
 	{ .compatible = "adi,adaq4370-4", .data = &adaq4370_4_chip_info },
 	{ .compatible = "adi,adaq4380-4", .data = &adaq4380_4_chip_info },
 	{ .compatible = "adi,adaq4381-4", .data = &adaq4381_4_chip_info },
@@ -2072,6 +2089,7 @@ static const struct spi_device_id ad7380_id_table[] = {
 	{ "ad7386-4", (kernel_ulong_t)&ad7386_4_chip_info },
 	{ "ad7387-4", (kernel_ulong_t)&ad7387_4_chip_info },
 	{ "ad7388-4", (kernel_ulong_t)&ad7388_4_chip_info },
+	{ "ad7389-4", (kernel_ulong_t)&ad7389_4_chip_info },
 	{ "adaq4370-4", (kernel_ulong_t)&adaq4370_4_chip_info },
 	{ "adaq4380-4", (kernel_ulong_t)&adaq4380_4_chip_info },
 	{ "adaq4381-4", (kernel_ulong_t)&adaq4381_4_chip_info },

-- 
2.43.0


