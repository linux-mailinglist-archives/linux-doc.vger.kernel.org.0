Return-Path: <linux-doc+bounces-42753-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E9A82EF0
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 20:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67DE23BB47A
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 18:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C3627BF71;
	Wed,  9 Apr 2025 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KEax1Vtj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B78278140
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223876; cv=none; b=oVv043Vt6ti5+SgCS1A4SGtcHxuKbWsK5K/wY2zzPc/Rr98Yh6blPcVpRgPZK8gIaMJxFgFhg1cMRPoYmHiDy62gPgG0PtqbMJE61CK3bkvktI1CPOC9sTchkaL/P+Eo6V5f0EGdis8a59I3GyEHw2rE5J+0RDuHkZaQe3oRhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223876; c=relaxed/simple;
	bh=4KSeXmCw6z9Bh/u/zmCWqVRpCXcjpLPI9k+ZizbF7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Usq+LnfNOOPJFCZce3u/I8mvWtlPMiuNNfZLpvvDN4wYwlgoeTnM1j4LMzTFeuITuh1quPmfnqBmLbu1KC1dynRw6lex8lDK7Wy23XNDxUE0MiPyRWZxADeu4J0fQAjkjd5W18ZZBWtWc+x+jWOliN9P1bNTZ+9wH6R7KfZDG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KEax1Vtj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so305285e9.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223873; x=1744828673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgEWndJtLeto4lW/nFUn4b5LOfScisxB+yrfREee8i4=;
        b=KEax1Vtj+O82sy4sLlKZeSmrfxtwjSF2mkERa1E8p4m4Oq97OEYCEgCqfWTR9hglCI
         v8sfyowHdNyz2rwBA9/z3P6QHRIdW4iPrqVxjkZzbsp3/WkVJd957l2mziZd8Xom84/d
         T6XZgSQQg+i6MX1e9n/XeKu71qSdd1gGv6zqFzkJS7c4Jef0UTknNFE7BB+TL3QUqp2g
         NVS0p1fFTISNkqyPRjihs3ECxvfwpBTLKLnjTsezMRRfsbbl5SfhonkIjkTPF7eoLEmL
         KJCWq2D06szItJm9A6CA0g9u+vyNaJ1d2bvmo5ByUE9VR49Y5atHF5JmVnycBKBlBBu7
         /n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223873; x=1744828673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgEWndJtLeto4lW/nFUn4b5LOfScisxB+yrfREee8i4=;
        b=WFYxjS7E9RLYAuLVh7efdbn+KG1mBHfESjpU1FHLbd3za22ygXVv1aHu5FDkIxPaHc
         Y8LOpsGC/fWF3jUPLCROT7Jl4zCrjJOkSt9iQZXM2qrC3eqcsq1GPasAt6uxknEqxi2u
         woyAQ2g77Cnb92gpbeCD3tD9lUIZRgeE9P8vMqSRWsmjxI8PjhFTC/vVXDZJFanklYyL
         8IjPYrLSWfCgHNGaQH6BRgaJ6wgmATP8M5KbCtoNULr7b4HU36k/rLdc9ZdZDiChaU6j
         IrZeTAhbrrvTWpLi7r7lwlg7ndsAhmr9qGNOk4wFq0BIHopTNXnGMWtJt82O24fesymK
         fFxg==
X-Forwarded-Encrypted: i=1; AJvYcCX83VtZaSnvhrEpCW0CFjqs4HBuum+2XbtH02CJrDcAWL4xMCTQbv549TULDSwPqPClWBdTHQkHN/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAElkPCPmh2kTFAdcUW+FLNBmw0tRfM2KtetjzYnXNiwFEByF
	bXmEzdYWCwFJiCpCUq+arztydWYs+L39+YfYQSIKtnq+ZObLlMVounCe2QmPiVo=
X-Gm-Gg: ASbGncv2Qktrba9FgBsXnCjHFpnx8haVxQPKFBtKVldW2y0JXQHo7RBwFdId6Mji00F
	8GGgVaD00ut2ufJfO8appeFFd2bZQWsV9mDRlhdoToLFuHHjUEE5gtYDjiRAdYrPWYlC7EWNG0t
	iW7Hev/I9fJo3KLorvQse2uppF/3nCB6fK9yDaFmNxGysF3AaAJoBCILmOruuBARIveESznoS4U
	r2dBVjqjIFK0y3bzeSZhfDMeMQP3J/qBxqWffTHvl5lANlmrbIhk8c3S6Jn5mLlRnGomCQvnNW4
	fP5Rp7Qd18dGToGCyjyPogL91ysXjK0VQGBC8X/2n70XEGnD9HG9MRj8x/TBgoWowew5Z9fjjTp
	WOpHftG6e7LWN6GV3KQ==
X-Google-Smtp-Source: AGHT+IGhnjsUYIKak18vf2AjiqrVr6PTz+TdAb+bfMFgpDd2yhja/tIUWo0cL35H9SHSSBFxnRJAzQ==
X-Received: by 2002:a05:600c:1388:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43f2d7aef33mr1285935e9.2.1744223872642;
        Wed, 09 Apr 2025 11:37:52 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:52 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:31 +0200
Subject: [PATCH v5 4/5] iio: dac: adi-axi-dac: add data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-4-fb429c3a6515@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=FaVSbpu5wfHy4/JtVk4ww5/ACGVgPb27AkggQGWKjsw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk/3/TTjX4oeLMf3P5ylUecaw+L66o758/xnZiKX7
 CTTntxj7yhlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCR5ewM/x0Lbt54fu90np9E
 QMjB+qCmtXf6fB7mHigweBx+9ZHMgvmMDD8lq265S5v33cq3Pbrh95neud4CWmJ22s9PH5qxIWr
 qQV4A
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add data source getter.

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index f86acb98b0cffb09bf4d4626f932bf1edc911e2b..8ed5ad1fa24cef649056bc5f4ca80abbf28b9323 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -536,6 +536,35 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 	}
 }
 
+static int axi_dac_data_source_get(struct iio_backend *back, unsigned int chan,
+				   enum iio_backend_data_source *data)
+{
+	struct axi_dac_state *st = iio_backend_get_priv(back);
+	int ret;
+	u32 val;
+
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
+	ret = regmap_read(st->regmap, AXI_DAC_CHAN_CNTRL_7_REG(chan), &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case AXI_DAC_DATA_INTERNAL_TONE:
+		*data = IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE;
+		return 0;
+	case AXI_DAC_DATA_DMA:
+		*data = IIO_BACKEND_EXTERNAL;
+		return 0;
+	case AXI_DAC_DATA_INTERNAL_RAMP_16BIT:
+		*data = IIO_BACKEND_INTERNAL_RAMP_16BIT;
+		return 0;
+	default:
+		return -EIO;
+	}
+}
+
 static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 				   u64 sample_rate)
 {
@@ -818,6 +847,7 @@ static const struct iio_backend_ops axi_ad3552r_ops = {
 	.request_buffer = axi_dac_request_buffer,
 	.free_buffer = axi_dac_free_buffer,
 	.data_source_set = axi_dac_data_source_set,
+	.data_source_get = axi_dac_data_source_get,
 	.ddr_enable = axi_dac_ddr_enable,
 	.ddr_disable = axi_dac_ddr_disable,
 	.data_stream_enable = axi_dac_data_stream_enable,

-- 
2.49.0


