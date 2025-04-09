Return-Path: <linux-doc+bounces-42750-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91AA82EE2
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 20:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4761744818B
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 18:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194227817A;
	Wed,  9 Apr 2025 18:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KirKT0OS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650F27780B
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 18:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223873; cv=none; b=EwhGG1+nXeYjj+fKolcwcPDohTePRBEtS0A5g6t0Sv9oDDutbvIlD8mgnEmte6ryPGxJdMqEhp1Ejl4BtXYaM8oa0HImYtKsWf6TsKGPY4y6u52q42MVOrrmuQHSBUbP/OUkBO43ZjD4XTkWzwK+8fvUTmrFE1e0IpGLYCKcOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223873; c=relaxed/simple;
	bh=uaSn6MwlcUjmKtZsVLaWOQsSsxy2zH+ZMA/NJ+Ecw1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZXlfRO/Fft4k9XKlFB6YzPXnqX8+fZ+hOQvUK3WMSE0uRqR+064MUhPzpX6zoypDHN9cNvWDt6QLRAjjTfVBZUu0AKwESSeuBsflbIeD+TuOT++OOBQjKke3kAf7BM9xWz2wwF/cdci7zaMHXf+WPTTvAHCtNzxGaSBhuQNXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KirKT0OS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3955498f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223868; x=1744828668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TWjREkBL8GjTju5ZPe7ZnjIycMK9O4uTTIH3dx3mcg=;
        b=KirKT0OSs6BzC8KRfTi+9CJxcLlGB6wlpXhYoPmmIgbdJn1ItQR6d0MTUaxP20SLoG
         ATye1h3NI1PUrxPvqaJFSbvTt2aeDeW5r9ircgRQzkKIeiUrUiM4oSlV7Ee8afgzZsig
         4WAP1tkgTBQT51OLlUVr091OEYgkGSAIoq1fLTapCSVIq84fAkk3dI6RDF/AfCs7oInN
         BPfeWUvodTA5UG0wWwLdztiu0RPQ3PO7tvD84by4HIExKX2YP/TMe1ztjXvSSiUrfDva
         1JsS1ASC4RVFeWqSiBb9reUGn1TWoPklVmaPhlUIA6WPWQaB0uyQCuCC8otMs0W6EKQ9
         TwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223868; x=1744828668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TWjREkBL8GjTju5ZPe7ZnjIycMK9O4uTTIH3dx3mcg=;
        b=gexcyFpmJDdMZY6DUF3s2B6Y+SxQqbwXRzdsxdEdV3c+gajeptTqg0N+IhW1E8GlOS
         sYj0up5JZM9wRWgeR6MU6Pk//f5KkypKacqJNiJmZr4Af4SzBIwZ4Z086NsLrllYUR5W
         +iOgRkUNbenaQovBCgIcwkyDktQnpcB2q3FSdz46+xX/tQbemeG9QGsVRINEDUQ2Zer1
         GSU9OOiRP0eihKMltuQjB9nJEwEbraZh6hzkgPsKguAOiBxORi8RwcqakYDgPJ9NAvcS
         Y/+AM3Y1YhOh/HiQlCTXLyumdWOfArUvaVUrRiprVRMgUE9tHJ/9SlQsssiMxG7IEmGj
         V2mA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ke2MiLE9Njz8qOVSQSx8XBOcx877cLa54LUuT4P4YJgb8da5zfs8Jwv8dht2BJZ6gHdAs87KRbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLflsvkqQKeqDyaj41zgFqKCFhHH/H80MwqT/NyHiPeLtR8S7
	+hni4y9Opqf/JYVUCgsYVVyv/j/Rz356qlSLC55AuUeD3/GjmkULFxvTuT2v1g4=
X-Gm-Gg: ASbGnctEav2jMmOzYBPW3piOY/Zu0GUlBwB0NNvfYm4Katw/HUgCrxahsZCDZfcneVm
	69sAjI3pokiq5tVmmG+iIc4b298uIZZjaRKsJgw3cY1mL3WZoUwEfohje8L/qChS3kSemL/No8A
	kPYcxRKZE7gzHpgTB3nZ4H5vvNBNYZKcgUGsnytciyJqUdSCtSmwpAb+VOhGETnDUHnJh5WC/m+
	+blXuPikf8AYc6QZ1fglbYXNOkdAUWsxwYEX2gno8Y+QGel2erAjER5DHdmU8gX+yejJ3OCmRao
	Ok3o1NdSOumBiPqXVX6hUNmk8aMikqTzOhyxAFL7Py8kZW1lN/P+sBpVrW4HHA8DmrOuDTRzyLX
	+KpcwN9k44TmYWLknCA==
X-Google-Smtp-Source: AGHT+IHiD6DpDsPdWzofgt2e9mV3mId0ez7Jbo755xSenrxr4s0bEDbqHojT24paLUJ9xvA562w07g==
X-Received: by 2002:a05:6000:381:b0:397:3900:ef8c with SMTP id ffacd0b85a97d-39d87adcb11mr4182487f8f.35.1744223868292;
        Wed, 09 Apr 2025 11:37:48 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:47 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:28 +0200
Subject: [PATCH v5 1/5] iio: dac: adi-axi-dac: add cntrl chan check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-1-fb429c3a6515@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=UoS9PVUrR5VQ2Mqe4V6ZiAxOY0YtQJ30vm21lXMXNAw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk+3t3nK51dS9hPe71q8REPG88i90ug5DPnLHCdO2
 JnXrG6/oaOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBE3s1nZPj2lefg1JNLai5O
 OfSB98DdyAXpwnyNrAYT5veFXmdtUjJn+O8gLu3NmuQWc3e2y+vIraWV8fMkOaoE+VTXaVg9YMq
 U4AMA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add validity check on CNTRL_X channels (valid as 0 to 15).

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 892d770aec69c4259de777058801c9ab33c79923..f86acb98b0cffb09bf4d4626f932bf1edc911e2b 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -84,6 +84,7 @@
 #define AXI_DAC_CHAN_CNTRL_7_REG(c)		(0x0418 + (c) * 0x40)
 #define   AXI_DAC_CHAN_CNTRL_7_DATA_SEL		GENMASK(3, 0)
 
+#define AXI_DAC_CHAN_CNTRL_MAX			15
 #define AXI_DAC_RD_ADDR(x)			(BIT(7) | (x))
 
 /* 360 degrees in rad */
@@ -186,6 +187,9 @@ static int __axi_dac_frequency_get(struct axi_dac_state *st, unsigned int chan,
 	u32 reg, raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!st->dac_clk) {
 		dev_err(st->dev, "Sampling rate is 0...\n");
 		return -EINVAL;
@@ -230,6 +234,9 @@ static int axi_dac_scale_get(struct axi_dac_state *st,
 	int ret, vals[2];
 	u32 reg, raw;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_3_REG(chan->channel);
 	else
@@ -264,6 +271,9 @@ static int axi_dac_phase_get(struct axi_dac_state *st,
 	u32 reg, raw, phase;
 	int ret, vals[2];
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (tone_2)
 		reg = AXI_DAC_CHAN_CNTRL_4_REG(chan->channel);
 	else
@@ -291,6 +301,9 @@ static int __axi_dac_frequency_set(struct axi_dac_state *st, unsigned int chan,
 	u16 raw;
 	int ret;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	if (!sample_rate || freq > sample_rate / 2) {
 		dev_err(st->dev, "Invalid frequency(%u) dac_clk(%llu)\n",
 			freq, sample_rate);
@@ -342,6 +355,9 @@ static int axi_dac_scale_set(struct axi_dac_state *st,
 	u32 raw = 0, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -385,6 +401,9 @@ static int axi_dac_phase_set(struct axi_dac_state *st,
 	u32 raw, reg;
 	int ret;
 
+	if (chan->channel > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	ret = iio_str_to_fixpoint(buf, 100000, &integer, &frac);
 	if (ret)
 		return ret;
@@ -493,6 +512,9 @@ static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
+
 	switch (data) {
 	case IIO_BACKEND_INTERNAL_CONTINUOUS_WAVE:
 		return regmap_update_bits(st->regmap,
@@ -521,6 +543,8 @@ static int axi_dac_set_sample_rate(struct iio_backend *back, unsigned int chan,
 	unsigned int freq;
 	int ret, tone;
 
+	if (chan > AXI_DAC_CHAN_CNTRL_MAX)
+		return -EINVAL;
 	if (!sample_rate)
 		return -EINVAL;
 	if (st->reg_config & AXI_DAC_CONFIG_DDS_DISABLE)

-- 
2.49.0


