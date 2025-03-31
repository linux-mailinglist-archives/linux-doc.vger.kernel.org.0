Return-Path: <linux-doc+bounces-41960-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44498A76D30
	for <lists+linux-doc@lfdr.de>; Mon, 31 Mar 2025 21:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D57A168000
	for <lists+linux-doc@lfdr.de>; Mon, 31 Mar 2025 19:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4775219318;
	Mon, 31 Mar 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CKojFNJa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590721A437
	for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447849; cv=none; b=A9/64qN/2d1myGyPIMDStCz1ejFuGIFeniIHVVejzOdCyC3OiOXvTq/4eTkfcJXjOmdlSCMmCXoiM7/j2h3fPYmoDJv8rHN9/uVhJgktsou9CKdub9jvcTZgQ127EWblRnO66TmJz+4cwpWVj0J7WFpdwGHKwnbgfo4gpXEj15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447849; c=relaxed/simple;
	bh=hWSr+N4q8jPBwyhE+M9punDDVddf1n2Qdd8iVHO9YtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5B1rsk2xvAZ64sSncRhD/xDCfyQBnmimT4m6t0lkXOZXuNjdsgJnLwyE2DC/31JE2ZxfEXi0aCXVFf124iS7HV4c9fBVldQRAdZjlBCZW0//fyeD7ogrt4dhZHJLePVkNg8aZd/BX1kbnOr+R3DTW5UHNlQpif/VNFq3JLYeu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CKojFNJa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8970046a12.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447846; x=1744052646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hl8ec5RDehNYBKLIScFWmbMlzzx1NzVQIVCz8eQlZvo=;
        b=CKojFNJaP130OSkqWeDCSHVDuIKXI+ILrLlBLxP0esZbDiPqh4rw1OG5YH2tIFA9Sb
         LaMxntkcFq7CKKDjviYZwZlJzCcUfpP3M12SrYrVlJ+b5WLfLMv0zgnLDwqa0XDfzApd
         q6Eqgsc/I/0IE7x2uQMKRbDXTtqCVWIAaSesag3RKYJBDwdABersBbCifiO3V0/FA+jh
         NR5jiUqhXSlniFodC4mF5UzyENv1YJMzc+evFvxBfGUp3koI/GBqO0iber05P1SAbzso
         Bkb39MbquuHiD1BiYc4kplSp1FmI1Lnjkb35fUAPaaJYrKNB16HSWzZkuUn9LGfHTHuz
         KISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447846; x=1744052646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hl8ec5RDehNYBKLIScFWmbMlzzx1NzVQIVCz8eQlZvo=;
        b=crYyMw6KcVGIYDe5z7SlhfNlHWHBAI4psElXXAwgG3zV5I2RPvm360NpdPujZE5dt2
         GVlD4qBH3x+JZ5MnP5PEzGY+R9LSb0H+OJqj5KJd18bNsPAaYVahrlZl8/vjz+HDeCGy
         VeN+cyL9b3TAv4tZLFGNjssk6a/2DqDJo2rEa86fp4VgdyZJZuFADA540qozwmPecgde
         Gm2sbcUggo059AmWNiEN1Y6iKiWPUX45oT0ERIWEBlNZbevlJVuWqhZqerLN/+czFise
         FQ8JA4XFY+TKI30ED41FOFXGH+3eaox7+RedaolvIkATlIo50ImPLlVVVsH2dug7pFr1
         Abqg==
X-Forwarded-Encrypted: i=1; AJvYcCVT9vmft9PxII16BUNBtnqyl3GmR8bo2FoWw9coAE796CNYI8335AMmSrdEHgXLDfKqqxlF4dSvJjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUfF295WYRLsen4UFHiv+vBEFH52a2CraOmVMmhbghHn9N15a
	WOUQveufwNL6aDeYRlQY5tlOHYJCM6zF3GzUUps2/FAs1HOg5FDiayJS+jDVtcs=
X-Gm-Gg: ASbGncsX/b/s6fVYwn6xsCAJzUE4bagAi8EtkqQRuG7R5EMNyVOGkfY7IcA9vUVCVxZ
	cwg06yVybc/hIZ5uFmvwpi6QV1+xAHwHxg3h0fjq48XJqAF9QxdOnZIUeN9yOHUc4nwkIcFj7FB
	eaGjMMssHkgfd8DGhuMukMqPmq6aWSgWDKqGgj/G3Byp+oSB3XqWSpg50P1WT92kUfMNmt+03xk
	IwQf9Sj3YUslmhOXmfKm61KjgXch2sdc46U1BPnnj6O7yi6vqP+aaQLO6L6JIRmAbPfiR3n9tdR
	pHEIje0xQ/l6iD2xSdsgnDC3weMIqRZXozFeGinljM89FIsTBJYm8tuLZDCj10sBWf+0Y7fiyTh
	AM8mcLW9yXihAaf3lINHNTMiSjk5T
X-Google-Smtp-Source: AGHT+IFUxbEQNZaiCG63rBO7ylX34l7ir7rdsprXQ4WoJTKZvi2Q3tt70y30TKZLkldis7UmrRl6Mw==
X-Received: by 2002:a17:906:c40a:b0:ac7:3916:327d with SMTP id a640c23a62f3a-ac739163364mr705284866b.60.1743447845790;
        Mon, 31 Mar 2025 12:04:05 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:05 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 31 Mar 2025 21:02:46 +0200
Subject: [PATCH v2 3/5] iio: backend: add support for data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-3-cdedb430497e@baylibre.com>
References: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
In-Reply-To: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=/X5T/C4urb1TZY56QZlmQtSfqpUWNyuJBZpY7qU/VIg=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9exWLO9NLtcUtVlM7qU17WfY1ixYwFxg52M2r2TbR
 8mzMQsFO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExkzWdGhi7zfmOtmhAbnjXH
 7jG9MvHIzUzuOSTifXPbiVy+7ye35jH84ThVW5VqeMwoRj7w7dtJZ//e8q3KMfVaHpi26/YOjtk
 qTAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add backend support for getting the data source used.

The ad3552r HDL implements an internal ramp generator, so adding the
getter to allow data source get/set by debugfs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-backend.c | 28 ++++++++++++++++++++++++++++
 include/linux/iio/backend.h        |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index a43c8d1bb3d0f4dda4277cac94b0ea9232c071e4..c1eb9ef9db08aec8437d0d00cf77914ad6611b72 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -380,6 +380,34 @@ int iio_backend_data_source_set(struct iio_backend *back, unsigned int chan,
 }
 EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_set, "IIO_BACKEND");
 
+/**
+ * iio_backend_data_source_get - Get current data source
+ * @back: Backend device
+ * @chan: Channel number
+ * @data: Pointer to receive the current source value
+ *
+ * A given backend may have different sources to stream/sync data. This allows
+ * to know what source is in use.
+ *
+ * RETURNS:
+ * 0 on success, negative error number on failure.
+ */
+int iio_backend_data_source_get(struct iio_backend *back, unsigned int chan,
+				enum iio_backend_data_source *data)
+{
+	int ret;
+
+	ret = iio_backend_op_call(back, data_source_get, chan, data);
+	if (ret)
+		return ret;
+
+	if (*data >= IIO_BACKEND_DATA_SOURCE_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_get, "IIO_BACKEND");
+
 /**
  * iio_backend_set_sampling_freq - Set channel sampling rate
  * @back: Backend device
diff --git a/include/linux/iio/backend.h b/include/linux/iio/backend.h
index e45b7dfbec35c094942a3034fc6057a7960b9772..e59d909cb65924b4872cadd4b7e5e894c13c189f 100644
--- a/include/linux/iio/backend.h
+++ b/include/linux/iio/backend.h
@@ -84,6 +84,7 @@ enum iio_backend_interface_type {
  * @chan_disable: Disable one channel.
  * @data_format_set: Configure the data format for a specific channel.
  * @data_source_set: Configure the data source for a specific channel.
+ * @data_source_get: Data source getter for a specific channel.
  * @set_sample_rate: Configure the sampling rate for a specific channel.
  * @test_pattern_set: Configure a test pattern.
  * @chan_status: Get the channel status.
@@ -115,6 +116,8 @@ struct iio_backend_ops {
 			       const struct iio_backend_data_fmt *data);
 	int (*data_source_set)(struct iio_backend *back, unsigned int chan,
 			       enum iio_backend_data_source data);
+	int (*data_source_get)(struct iio_backend *back, unsigned int chan,
+			       enum iio_backend_data_source *data);
 	int (*set_sample_rate)(struct iio_backend *back, unsigned int chan,
 			       u64 sample_rate_hz);
 	int (*test_pattern_set)(struct iio_backend *back,
@@ -176,6 +179,8 @@ int iio_backend_data_format_set(struct iio_backend *back, unsigned int chan,
 				const struct iio_backend_data_fmt *data);
 int iio_backend_data_source_set(struct iio_backend *back, unsigned int chan,
 				enum iio_backend_data_source data);
+int iio_backend_data_source_get(struct iio_backend *back, unsigned int chan,
+				enum iio_backend_data_source *data);
 int iio_backend_set_sampling_freq(struct iio_backend *back, unsigned int chan,
 				  u64 sample_rate_hz);
 int iio_backend_test_pattern_set(struct iio_backend *back,

-- 
2.49.0


