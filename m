Return-Path: <linux-doc+bounces-42329-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221ECA7D8A1
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 10:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9AC17304C
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 08:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B4522A802;
	Mon,  7 Apr 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2O4wOAlN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7022A1CF
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016013; cv=none; b=BUycFrIBirw77wzCMmd8GDjzIVb9napTIBWN60a82vPdhuDqUguS3+PJrROj/iu/ZzikDXGiBNmUc9jaSmGLoPWE0+35+TuzMqOnr7Tm34ciZ7ZIy580nNHM1lh/YFkqgwMWnDZlzohGIk2c2v8tAg/U2E3wEGidsLGeTmf/5cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016013; c=relaxed/simple;
	bh=hWSr+N4q8jPBwyhE+M9punDDVddf1n2Qdd8iVHO9YtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxQ/JCK2N4cV/Sl514JBBBtwFyDGYTW6GY0hqmla1NO09b5KVR4ONgcPoE6N7Gawdp9SLmI7eBysqwBhMg1jJ4ZwPCEu0J5sMtU0S+ncKcwlH6z11XkMf3tIR+a6z4rwbyeAtzjCXcu45N58AyaUXn6YGXV0F58O4HgPM50PhZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2O4wOAlN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so27408415e9.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744016010; x=1744620810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hl8ec5RDehNYBKLIScFWmbMlzzx1NzVQIVCz8eQlZvo=;
        b=2O4wOAlNGCiq2nxlgwd1CsF5NbTgt9kPZZifV12aJtl2XZUF+QioxxQ+Rf/DOFDyFS
         h4ztn60U8xR2AGkAh3vbptL/yOExaF6AZ9hAEAsuL+rfRmmw7c+qoKUlXkWjVpvavVvw
         gXTjMWWj8rZ3ndrDLSl4NC0pFNwq4Pu8Sz7TB5KzILykjkEGnueY7EpwwjrT43vtUZth
         nddioDKEqUIWaQcyK4hm3cMeMjss1CLkBxNKeKNiGxOHWwhhP9+PUCQVSJueukcsfdIx
         CrdRghWvZ+GIy3M24jC4sI2T1/FBKEVcMb6SBH95XvcrxaZGKKzoRlyEQNYS7Z53l8+o
         dk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016010; x=1744620810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hl8ec5RDehNYBKLIScFWmbMlzzx1NzVQIVCz8eQlZvo=;
        b=D4o251tOInFtSRFwFKu+gJS2IjcR8W6bKwzbxMf8AhJMyVuLqteOvvR4BqblZpDyr+
         cALd80/zh8qho+zbkNpg4joCCmYvfZVsJn7siLjhEg66pLc1BpLzKs4L9RdxEKuTJajr
         /0lKO+/v5HmGOW14N5EmSmUehyFpTqbmtzORxKChb/0UbxKid98Y8KOus6nPhD5alJKe
         zR7jaZAqhpIA6q3WSxAC2lHpwlNRzipT+KNHU1wQJOhcXqU8D3XXraMdFyypSfSVRTvH
         oFvSRHZp5u86AoOgeNjetoQRALQvJ8/L3nYtaZq/4YRDDvLvDbFBUrIwJsKuR2Wwl8hh
         l1iA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRAG4gH4cyyKhO5eUh7yV4b1JA67UdP7K784d7lkRBkU1AM7eEZ8kWB3kwUk0ad2g9z8+2x5LDyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1C3qOp5lqBKOdk10t+FcrUCz1e45IYpd1gqMUfbV4P2EnmYG
	I8QZxVQQbQ4b+Cm1cZqBtHTXpyElYZ/SP4QtElROX9JaXzcrpMSXQmdnzLGgbvhDR8p2DPxKFLw
	5
X-Gm-Gg: ASbGnct5E2IFFPHxnKO8s753XyGBtsZmJigT+mCGRG4BeLGjAVory6yTeriD2RFgxg9
	DrPvAh3asEJeB8+AjSBZWQ8vGZ9xhowj1JS/IsVZ0FUyTwwVh5EZYs2sXO0GNqr1orujQZYp3Jq
	+NeWUL7gpJ+YJxoaLL8pDo8ELIzP1vfdbfG0R0FSWsJPQnxMDNz7JPfUz7lAbm0yy6/KMoZ/m82
	/laVTIU9WfKVxh4x9bBleFn5s7C0N4zWEWr0UxlaGyQfC3gq95s1EkEAUhCN3i88ZPL4N36b1+r
	xUaj6I3Dy2aIS53pVpEMW9vlBxg4P9nVmF2ON8ZK/qNi4ic1COwN1fDshSxxqsFTqmjueRlSFoh
	Eh0ZluYh3Wk23EM9gGj52rQ==
X-Google-Smtp-Source: AGHT+IEoRKYzi4XTLVyzGQCHVUJlc2/nLNfGyDANP2bSxKBD7Syi4BAXA2v3/anNoWltCaKQJP3DQQ==
X-Received: by 2002:a05:600c:4712:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43ecf8cfb3cmr114706865e9.16.1744016010047;
        Mon, 07 Apr 2025 01:53:30 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm126966995e9.0.2025.04.07.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:53:29 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 07 Apr 2025 10:52:05 +0200
Subject: [PATCH v3 3/5] iio: backend: add support for data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-wip-bl-ad3552r-fixes-v3-3-61874065b60f@baylibre.com>
References: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
In-Reply-To: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/PMkmoczqgCDDtUeWqZsvtzIYMG2xXml75fUX/nNJO
 ZOfKHl86ihlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCRt5WMDJ/DNovujT/9T1X0
 zI4NNbbCwVH/cuz26P+b4342dC2zzASG/7GWJQxyt2Z0iukHG93h/PaibU8lT4s6k0LLV7es6ER
 RDgA=
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


