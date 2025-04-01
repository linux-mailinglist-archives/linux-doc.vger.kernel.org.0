Return-Path: <linux-doc+bounces-42020-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA368A784E2
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 00:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15C916C08B
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 22:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708F321CC52;
	Tue,  1 Apr 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="elJQnYEb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CBF219EA5
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547842; cv=none; b=Rr8rE5RZuSbYlPgHTIFUz2q1l5G2QXRdPe5E8fpfx9475JEriZUONWLLs52QHb+cIbTaXDOEdMvrAu6xrpLudP1L3h/P2uPKjtRTTJsjxCVyhJmxYSHcypJKIpyUfQV6lO9frYMh2a1Sk3KFbhS4xtybi7jDGbF5+U7AvTbPmnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547842; c=relaxed/simple;
	bh=26skPYTIDO2AQWdbdEvqSLF0n/pqCouBi1jNjiWw2BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCD3Ky6YcWnHhctciVNTTWf8aa24MGGpxkEWXAHgrwidX4yUm5UyL0lxlysMHbmMelxUAngKhdk56AdDm0n0RjGDNnb31kFYzGsK8okfqYlVE3srt/crHeRyBOBD7oRT3HvJTFBzSnAw8HuqFapB71BztJ0arq7Z47PX1BhnhHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=elJQnYEb; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2cc44c72959so622597fac.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547839; x=1744152639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAPUfVaYgqcTtf3Fw3hrd4uLShjdjkQ4JNJiBPq4EBU=;
        b=elJQnYEbcJIcB6janS9iukEO4PEItaxaIKgyoFLbhDoXx4RdmBbSiy4elS3DmmIPxj
         i0j+YEuHYUPRjBbaCaubFtTa+h383wmvA1UIyHPQOrmXSgmlHA/WiqSIRaUduZi7eRiB
         1ADi5ISuUdLbfFS65q3qL9y/IABtqI5tB1kNvmiw4TUeAHZYeSsBexT4LzBBOxPTEFlm
         NEe4mc+JaRaNRjMq0RUiIVfiweokf8Zl6V9o651EsRsVOq5Uvnyq0jOv9FbaHdGrxYzz
         9XxE1rLipuVOfAb3ld9zAWsyUhLYxc0XJJSyFyWZk9upetRxMhaNz1holDXSQSomS0D+
         6wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547839; x=1744152639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAPUfVaYgqcTtf3Fw3hrd4uLShjdjkQ4JNJiBPq4EBU=;
        b=iPwf9goyjH2/5NUJoVkhtrsZP1rDZmjNTUUhrmqEDY07ZTyKryqDqkt3JiL/fCCaD+
         ZWPC2pW+FSiQjmIaRVlprOCmeVkRGThcsE9svv85juaEmtuQqYky9i2NTsmT1/BeGilR
         anOdpGC+j/kY6OhEqa3l6q51VcR3bf6o/+x4yxHDjDX7Ui1/8QUzkJ12zRT1UJku9gZ7
         itv9l6rO0/SYvochyqfDkpKcnor0ZtklH+CONnyh8POKVqTr8OdBej29Oi1GB8zob444
         dbWsZG3bHEoPucwIIBDFnOIlF3BiWVDl/6C/U1vhqb7ZxB6okR7GCFb98HfihFU3hadm
         dEUg==
X-Forwarded-Encrypted: i=1; AJvYcCUHSIVp9At2iQTGRAhb4hAcbtjMGkXOwq7byOZGOGyjzQxs5KubCfHiZBWNpHWc+mAON8704/7QMUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbyM9nAQ0BscrW+A+Hq6OZEuo15izWHClyuhVN+qHd/ZJTN98
	gzzI7HTsdsznWv4qSp+Bwbnzyb6aZolQXZlbIOaN5Sn4Nr6KpLdVJRGOLmVMIrw=
X-Gm-Gg: ASbGnctRqlVXwmU89S/EHHngKgFv8cKvSQ+i760cDAtQkBkPTQujS5dFgQ8sjYNF+qn
	mX5tz/4l2ku9Kua5rXZ7t9YK4l6et+SfzOIr6PcKUjH0mmCSUbSD8qT7BglMhZ2SII4sgdghXqZ
	p3iZ+qy2YIE5RpgDiJXeX696Mv2ouD0FqQWhyokyYBGQ7oARJgcLdlNJawFm1++qyr4M6cAmc9e
	IxZPwVqqKnH1/7PLEcAKQmQjD+Hqrik19oRQ5vnLHPJTI1tkDVyKMemvkWiizqwxzLoF3LO0Z60
	4h/BFnAQ66IEv/vZNlO8yOxD28qHaZGknEsG+aarzLnKstDf5bCtTM8X6clpQZmoS4LMUcQ49oR
	y
X-Google-Smtp-Source: AGHT+IEbRTcR6d9BWAkBdExOHFkXhbJTtPmUZ+c2U6r/s6m1E9zP8Pf27ssjD7x64/JheCnxNqzuYA==
X-Received: by 2002:a05:6871:8917:b0:2b8:f595:2374 with SMTP id 586e51a60fabf-2cbcf743672mr9486417fac.36.1743547839561;
        Tue, 01 Apr 2025 15:50:39 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:10 -0500
Subject: [PATCH 3/5] iio: adc: ad7380: move internal reference voltage to
 chip_info
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-3-23d2568aa24f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7559; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=26skPYTIDO2AQWdbdEvqSLF0n/pqCouBi1jNjiWw2BM=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23+fpllnvajujdFYWvihcUAddd6/sJprX3a
 hDEvB4GJLeJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAPB/xAAvjJQJSDg8do1V8biJzFcaoLs611q+7CHgCWI+Bu
 o+IR8mqnMRF35zOr+w8a89tZOg59o2Oe228AwiwFIcmLZoAAfAWEaa0dqkWza+EoX+LUDqdJ9sb
 T4SOdWLGX/h1g2srZvS3s0Nlth8tPhVVzTar+iyKoLJY/mShvrkltfbrvtVsEltaoe+Js0JwLx6
 sUEta0istBivS0sZAqZms+ObzZkSseCCMrPrGFbe/4PuzwH9No0JWssd4+SpBmW8L1lsJUzcw4N
 JeDa/X63uf3LO5X6BDxu1B9vRNiw+woLvGqN2048kCn8InEBBNqb21gYvYu5fcf9DR6hVqtQ2mF
 9w95KR/iXrgTD7zbSdHDxJG3WPk/IYZjYzGpp4iKwdnj7nwJD51aecmyCx3/Gbd9HZESVDn1y58
 ZckRDDcwv+80JhWglv2FKAqdPOEYxlN+OQFD7awf8iiEsUSfUtb1UEl07+9jNTukKibKlOvEp9b
 CyfAJj1NpHj9j7gK85FHkx6CHOz0r1m97ts0xpJ9iszoyw+fqsJWTTqVyFfuKzrcbncA5NhwRzj
 kOp/+bb51fRRzlfJLZG17t/KHIF0x6Mw1eOcD2wiuMBOxlU1xoyjH4U1kOmT0t3knwwCnM+2u3F
 fKmGciKkClYuBVcRUlj7SYQ0rER8KtUrNC0ViMVtgJHw=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Move the internal reference voltage value to the chip_info structure.

Before this change, only ADAQ chips could be internal_ref_only and only
non-ADAQ chips could be external_ref_only. Now, this restriction is
removed.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 18ed07275be8e031e54f3595f70afe47514084cd..e5cd11fd7b1083af2082985f2c0226b1a97d600f 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -120,6 +120,7 @@ struct ad7380_chip_info {
 	unsigned int num_supplies;
 	bool external_ref_only;
 	bool internal_ref_only;
+	unsigned int internal_ref_mv;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -609,6 +610,7 @@ static const struct ad7380_chip_info ad7380_chip_info = {
 	.num_simult_channels = 2,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 	.max_conversion_rate_hz = 4 * MEGA,
@@ -622,6 +624,7 @@ static const struct ad7380_chip_info ad7381_chip_info = {
 	.num_simult_channels = 2,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 	.max_conversion_rate_hz = 4 * MEGA,
@@ -637,6 +640,7 @@ static const struct ad7380_chip_info ad7383_chip_info = {
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
 	.vcm_supplies = ad7380_2_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_2_channel_vcm_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 	.max_conversion_rate_hz = 4 * MEGA,
@@ -652,6 +656,7 @@ static const struct ad7380_chip_info ad7384_chip_info = {
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
 	.vcm_supplies = ad7380_2_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_2_channel_vcm_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 	.max_conversion_rate_hz = 4 * MEGA,
@@ -665,6 +670,7 @@ static const struct ad7380_chip_info ad7386_chip_info = {
 	.num_simult_channels = 2,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
@@ -679,6 +685,7 @@ static const struct ad7380_chip_info ad7387_chip_info = {
 	.num_simult_channels = 2,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
@@ -693,6 +700,7 @@ static const struct ad7380_chip_info ad7388_chip_info = {
 	.num_simult_channels = 2,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
@@ -721,6 +729,7 @@ static const struct ad7380_chip_info ad7381_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
 	.max_conversion_rate_hz = 4 * MEGA,
@@ -734,6 +743,7 @@ static const struct ad7380_chip_info ad7383_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.vcm_supplies = ad7380_4_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_4_channel_vcm_supplies),
 	.available_scan_masks = ad7380_4_channel_scan_masks,
@@ -749,6 +759,7 @@ static const struct ad7380_chip_info ad7384_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.vcm_supplies = ad7380_4_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_4_channel_vcm_supplies),
 	.available_scan_masks = ad7380_4_channel_scan_masks,
@@ -764,6 +775,7 @@ static const struct ad7380_chip_info ad7386_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -778,6 +790,7 @@ static const struct ad7380_chip_info ad7387_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -792,6 +805,7 @@ static const struct ad7380_chip_info ad7388_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.internal_ref_mv = AD7380_INTERNAL_REF_MV,
 	.has_mux = true,
 	.available_scan_masks = ad7380_2x4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -807,6 +821,7 @@ static const struct ad7380_chip_info adaq4370_4_chip_info = {
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
 	.internal_ref_only = true,
+	.internal_ref_mv = ADAQ4380_INTERNAL_REF_MV,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -822,6 +837,7 @@ static const struct ad7380_chip_info adaq4380_4_chip_info = {
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
 	.internal_ref_only = true,
+	.internal_ref_mv = ADAQ4380_INTERNAL_REF_MV,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -837,6 +853,7 @@ static const struct ad7380_chip_info adaq4381_4_chip_info = {
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
 	.internal_ref_only = true,
+	.internal_ref_mv = ADAQ4380_INTERNAL_REF_MV,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -1855,7 +1872,7 @@ static int ad7380_probe(struct spi_device *spi)
 		 * in bulk_get_enable().
 		 */
 
-		st->vref_mv = ADAQ4380_INTERNAL_REF_MV;
+		st->vref_mv = st->chip_info->internal_ref_mv;
 
 		/* these chips don't have a register bit for this */
 		external_ref_en = false;
@@ -1880,7 +1897,8 @@ static int ad7380_probe(struct spi_device *spi)
 					     "Failed to get refio regulator\n");
 
 		external_ref_en = ret != -ENODEV;
-		st->vref_mv = external_ref_en ? ret / 1000 : AD7380_INTERNAL_REF_MV;
+		st->vref_mv = external_ref_en ? ret / 1000
+					      : st->chip_info->internal_ref_mv;
 	}
 
 	if (st->chip_info->num_vcm_supplies > ARRAY_SIZE(st->vcm_mv))

-- 
2.43.0


