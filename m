Return-Path: <linux-doc+bounces-34623-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34820A08019
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 19:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C96C167B2B
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 18:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA31B0402;
	Thu,  9 Jan 2025 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LlkJ8fE1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9461A9B4A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448455; cv=none; b=jmyhA1KUxKWlHSkszCxuY87J73BtRR95pepVo5Ot4yrotEoSaEyhjlyJJ1IRTAZ5yzkXnEQimk53ZXt376Oz/QvOrgaEzr9B0+o2Elxo/pHDGj1xd1JxY0R0YcfsXdYMo5yX0OcyLjfw+w9HSDl3nDNzqlxO3bsS0PFgXUogUZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448455; c=relaxed/simple;
	bh=Ma8HaBPEK9LBfvT3QeN1X7ugzAmaSGzcmCUpk/9AAyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZpn/TgTbyXsm0hQjoUFtKk+aye8uCbUzpLt1WGYQiMV01PHLLT7s/N1fMNak6Gx2BtVq2b1QbEcght/Ipr6pVzqpYHTrlbdt6FMe0Qc2X9zcyoYwZFWsl8cG9bOaztybTbqCibeB7eAYmTuYHYt6wCFyh2qGteGpIv/pv6O2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LlkJ8fE1; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f95d2eafso124820885a.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 10:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736448452; x=1737053252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2jerrcD1nGClFF+pwwbUr/tdkat4xQ5wJ8skGDMH+c=;
        b=LlkJ8fE1zrlltokdVNr5foQV0Ck7gsEGj7hcGkEC+vbDdpIc+sSoOteXFWubmVm/2m
         Nlj3CXnaRIaUzuorQLS1TwGXF0p7tSSwlqeG1BTijqe8+EO3vB/PW6rdHIa7+hKHUSte
         nUpSgRT4ZLncIVLHM3tf9om6hlvhYjcCI9CohNhfUVio9JSLQCLyjBd+HlQfEpcKU2YO
         cH2tvDZi+Pm8daKuF9bQ0jrBMK0OQUNAX0A5KjWhX6I2Rcywo5Lc4IK+WM4M2cnIiiE5
         xxaQ70DWmCIBn6syOnMipxRwA7i2TXNgCwbK8F+/ERSRbrXKgHXh/OkkBvI1FcubywqU
         5Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736448452; x=1737053252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2jerrcD1nGClFF+pwwbUr/tdkat4xQ5wJ8skGDMH+c=;
        b=WOdmclgZpiAoymRmGlEBoLUWfMxhvop+UiNeos7WD9eAPjkVqt6gYOroRPMsNdakLz
         h4p2bdntFKc5gYvwxmQBneeYs/mIcLOO5H5bOqT9a9XclDYEZ7YJHw1B7RVy0WH+kkQF
         3xfNgbbSUGnUfBuD/7i9EaT4b2xv69eEt3J20LS1dc0wHS/aShwZXcMcSrWlpjH0o1bh
         rzOM9XLlre0yithDwgHd5gzNkP9Mt/eUopm8Z1KQ/VUDx9tGXGtQl8H2kweBVL8YF29U
         brbqMTMc5a6DITaiZDkjbBOEq98YMmONDMI8SztVe4j9fNrrKqxaYHFpYMmJt1F06goS
         p95A==
X-Forwarded-Encrypted: i=1; AJvYcCVNccK1yQeDIiWKGIx08M/XgE26h/xgcgbjUEvk+QYVuewR3+wKB5Amq9fnm69WpjvjsyPylWrwxu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB552e0XOEbrWdke0LFESqz9BIREk7AEz+iJgjjxjAV3akkHWt
	zjsQZe42Bkyyqd5hguv38zXBqvLCoo8HnRQpaEKP/NsL6Jpnq80oFfrZ1QhP3CA=
X-Gm-Gg: ASbGncs7OLk+V01M1E/A9SM8Gra0o5UImzvDjARHD+blbm6M6AsvFL3pRORGbF+7Wkz
	Krvzv/8DUotuo153vhI+90OXCtRbIDGbX/DrFuWJ7OR8FZWXiYaRFtRpVX7blPYiUf0TvlPJnQy
	XiC3TCbfbq56YNU9m2vXmFtsXDfvZlUh0mpgHOBiaKSnSpI2GZJIzg8x9HKiIeSjacdMzOx+Agz
	6Q1QfZEqzMHt6B6rOdeO2LDNoEetzqYxjNbCX1teEuqEmuT2fDmVv1DM+kwFQN9Ov+rpnJBc7PN
	/MFD3Kyw7GLjbTW7
X-Google-Smtp-Source: AGHT+IGSh0OJ2ICJcgUrCCwD1CmO6Yk4iQVFhsuyeLSR7nuNJe3mJA1AXgnAS5hrWhV6frPSVt2d0w==
X-Received: by 2002:a05:620a:4102:b0:7b6:d383:3cca with SMTP id af79cd13be357-7bcd9716e59mr1230536985a.35.1736448452291;
        Thu, 09 Jan 2025 10:47:32 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3248945sm94309785a.42.2025.01.09.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 10:47:31 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Thu, 09 Jan 2025 13:47:24 -0500
Subject: [PATCH v2 2/2] doc: iio: ad4695: describe oversampling support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-ad4695-oversampling-v2-2-a46ac487082c@baylibre.com>
References: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
In-Reply-To: <20250109-ad4695-oversampling-v2-0-a46ac487082c@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.1

Add a section to the ad4695 documentation describing how to use the
oversampling feature. Also add some clarification on how the
oversampling ratio influences effective sample rate in the offload
section.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 Documentation/iio/ad4695.rst | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/iio/ad4695.rst b/Documentation/iio/ad4695.rst
index ead0faadff4b..f40593bcc37d 100644
--- a/Documentation/iio/ad4695.rst
+++ b/Documentation/iio/ad4695.rst
@@ -179,12 +179,38 @@ Gain/offset calibration
 System calibration is supported using the channel gain and offset registers via
 the ``calibscale`` and ``calibbias`` attributes respectively.
 
+Oversampling
+------------
+
+The chip supports per-channel oversampling when SPI offload is being used, with
+available oversampling ratios (OSR) of 1 (default), 4, 16, and 64.  Enabling
+oversampling on a channel raises the effective number of bits of sampled data to
+17 (OSR == 4), 18 (16), or 19 (64), respectively. This can be set via the
+``oversampling_ratio`` attribute.
+
+Setting the oversampling ratio for a channel also changes the sample rate for
+that channel, since it requires multiple conversions per 1 sample. Specifically,
+the new sampling frequency is the PWM sampling frequency divided by the
+particular OSR. This is set automatically by the driver when setting the
+``oversampling_ratio`` attribute. For example, if the device's current
+``sampling_frequency`` is 10000 and an OSR of 4 is set on channel ``voltage0``,
+the new reported sampling rate for that channel will be 2500 (ignoring PWM API
+rounding), while all others will remain at 10000.  Subsequently setting the
+sampling frequency to a higher value on that channel will adjust the CNV trigger
+period for all channels, e.g. if ``voltage0``'s sampling frequency is adjusted
+from 2500 (with an OSR of 4) to 10000, the value reported by
+``in_voltage0_sampling_frequency`` will be 10000, but all other channels will
+now report 40000.
+
+For simplicity, the sampling frequency of the device should be set (considering
+the highest desired OSR value to be used) first, before configuring oversampling
+for specific channels.
+
 Unimplemented features
 ----------------------
 
 - Additional wiring modes
 - Threshold events
-- Oversampling
 - GPIO support
 - CRC support
 
@@ -233,3 +259,11 @@ words, it is the value of the ``in_voltageY_sampling_frequency`` attribute
 divided by the number of enabled channels. So if 4 channels are enabled, with
 the ``in_voltageY_sampling_frequency`` attributes set to 1 MHz, the effective
 sample rate is 250 kHz.
+
+With oversampling enabled, the effective sample rate also depends on the OSR
+assigned to each channel. For example, if one of the 4 channels mentioned in the
+previous case is configured with an OSR of 4, the effective sample rate for that
+channel becomes (1 MHz / 4 ) = 250 kHz. The effective sample rate for all
+four channels is then 1 / ( (3 / 1 MHz) + ( 1 / 250 kHz) ) ~= 142.9 kHz. Note
+that in this case "sample" refers to one read of all enabled channels (i.e. one
+full cycle through the auto-sequencer).

-- 
2.39.5


