Return-Path: <linux-doc+bounces-42114-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E463A7A7D4
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 18:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB0BA170932
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 16:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711C62512D9;
	Thu,  3 Apr 2025 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CzSWmnh0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033C2512EA
	for <linux-doc@vger.kernel.org>; Thu,  3 Apr 2025 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697231; cv=none; b=i7GwLnVGXM87MxDGBccUdbYexGtfYJNFigx8D7tFMigRzXQNB1T3o4cEx5t7tw2IzKGeSEU7m2UPgTsU/eeD0pbeV5kYuUkJypvJEhjWBHZpfpyxA9teHGh6e0GozOCo8VgUINKV9aUJEm6M+jgupHmzv5XfuwodDpKmgkMGk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697231; c=relaxed/simple;
	bh=cfF0Kt99mMEaJk4dHE6IOh/L/Is6q2mNay7uazGqI8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oA+GfJqC3ziuhzzd8szQxBcTIgFv9cZrTVmpX4XOtG+xJtIq2RpUQRlKdxsjiUbIHJKWT1B0X2o3YgI8+22PuKASui8tyi+r2L+ZkGxAYk/NJRmSbeVd23VhTAMtpch8gH4R4uI9VPjK3HmaEk7S8GQ2VXOExlrHSFXCvGuL5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CzSWmnh0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso8042785e9.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Apr 2025 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743697227; x=1744302027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzNoxtXo4QidWtvKIfVT4LcTVZJpsOZ2PfIgE0rCqRc=;
        b=CzSWmnh0LXoi3ALux6K8Wwtgz6AA7lnDLThTOd+h05F7DYrOWUJbgSgBj7acgxMfi1
         2f7gNYAhQuQOlVtkK2ce8v7BsKxSG5L5je6bD5ZI3SdLsHgpNNQHpQWPObL54+5k7A78
         AzuM1jS7ops2FaSj+BCVsn3A/9QE68hykWW950ZwycKwJ1uEmTdVqJwW3Ga3+WZYle+x
         b04SkXL2WJ3GqFCdyjPVZVzOb1/p3mP65wRHBR5VN3wecKpqDxGeT8jqCZxx3cWWZarK
         FGnqGQXzWndvV3Ihd3B8xoxrSq8EsFhFQigSVKyhnj+tadU0BHeUkXeZbDcd1O+wqtwi
         BpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697227; x=1744302027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzNoxtXo4QidWtvKIfVT4LcTVZJpsOZ2PfIgE0rCqRc=;
        b=SLHyINXNkXtnNCYzyOip9qZ0yfWE3DaFkJfavoMh9D/89qMyMxemG3TtsEyTdylDKs
         0+2FZF1d0u2WtOzOORxjPoTQIKAQ//0ZwApnrekN08wOIwCysVghdvQERpQx4bjGwIg2
         5AXwk0+Bdb2NdYpSAlGIKNyOQLF4PgmwoSNvfN5+ToLYu5D4QB8R900R/KIn4jyQsvjE
         6DQgn2YkJCtMrkTLa1NZuCMAFLoplE4kEqhzhybHMi0mauM4JtOKuaxI7biZtb1x4DG1
         TJuvhYE72gSJwt1PLC5htM7PO6iTTpVSKmQdIFYuyM8YunU3vhYwxVI+WulUiRHl+PdK
         YO1w==
X-Forwarded-Encrypted: i=1; AJvYcCXmXmvoASXl5CNy1Sg3ICIPxLj4WmTHP5gVF7mu5Pqp9VYwGjRnQcdhBfJnfQNBmalWpl/tXqwhzNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHq8Z6byG0ikPLGnSCY5gaTD2iM96N38XAV0oK4GHxTqa+y2X9
	D/lQw50DzP9/125yRtTOQf0Ez9VN0pdAHzTmrP/zr+6mQqTCxa1yrjUnYy60vxk=
X-Gm-Gg: ASbGnctLZx1iHXXMEP1hg3oWqFuYmE6SjjlFXpsZSn3DP2TxSKdkjJrZF1LulB/ytpw
	O4Waw2kqVtBD5AlvxPk3/yNxIZP2ckwtR5lVvwFmrZtR2V7v3WMAwEVtKjPZ9gEiqLtemrmfj/1
	1wF0CjQ99ZUuekHQPPKOYTWfR3592x9kh1yHaCMaMlY+RPjZl2J1+bT1I8EPdcW/Xk14E0vfPqU
	ImOZIbUr4Z3NDsgarmtZSUrmBkdFOzBfOs1bZ/gbOn5bZqeXpgC/IdVFCtGXmQMpYv0r2XBFf5B
	4j1TCZ6CiZCETw2Vf+3bpO/E9AOCbyLSdTO+6pWVqfAdhjj0rPluzqQcj3ls692Z8/t9GnVhq1z
	Dufh/epqb1jzaEcxgZm82SQ==
X-Google-Smtp-Source: AGHT+IFt7PGvO05ze96jmWf3hCQCu5z1rtdVnHLEm06qbJ6daKoMANciVM3x3K9bSnxMRl9i6Q0Q1Q==
X-Received: by 2002:a05:600c:b89:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-43ec153677cmr37644645e9.32.1743697227084;
        Thu, 03 Apr 2025 09:20:27 -0700 (PDT)
Received: from [192.168.0.2] (host-79-30-116-65.retail.telecomitalia.it. [79.30.116.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm2197657f8f.67.2025.04.03.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:20:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 03 Apr 2025 18:19:04 +0200
Subject: [PATCH 1/3] dt-bindings: iio: adc: adi,ad7606: add SPI offload
 properties
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-wip-bl-spi-offload-ad7606-v1-1-1b00cb638b12@baylibre.com>
References: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
In-Reply-To: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 David Lechner <dlechner@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=UfpxApW5Zv/Cbo0daRMPGTL/xp0EwZ3iApNb08LgQ24=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/t5XJYdMfLlHt8GeMDAnvgv/85E47JSf+5MCv+YKaE
 9do15YKdJSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZgIQwrDf3cV0+dh+Z0dvdND
 d8msS6yTZZp0c/8pUaGUH9/mboh53cHwV6KP8ced9Z3S2TlWgsH9ftrivgWVkjMKLP/IrY6zai9
 jBgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add #trigger-source-cells property to allow the BUSY output to be
used as a SPI offload trigger source to indicate when a sample is ready
to be read.

Macros are added to adi,ad7606.h for the cell values to help with
readability since they are arbitrary values.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 8 ++++++++
 include/dt-bindings/iio/adc/adi,ad7606.h                  | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 52d3f1ce336783084d601d361779ebc766124f7a..29f12d650442b8ff2eb455306ce59a0e87867ddd 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -45,6 +45,14 @@ properties:
   "#size-cells":
     const: 0
 
+  '#trigger-source-cells':
+    description: |
+      Cell indicates the output signal: 0 = BUSY, 1 = FIRSTDATA.
+
+      For convenience, macros for these values are available in
+      dt-bindings/iio/adc/adi,ad7606.h.
+    const: 1
+
   # According to the datasheet, "Data is clocked in from SDI on the falling
   # edge of SCLK, while data is clocked out on DOUTA on the rising edge of
   # SCLK".  Also, even if not stated textually in the datasheet, it is made
diff --git a/include/dt-bindings/iio/adc/adi,ad7606.h b/include/dt-bindings/iio/adc/adi,ad7606.h
new file mode 100644
index 0000000000000000000000000000000000000000..f38a6d72b6dc2d4067c07d6a5c0377e526219e5c
--- /dev/null
+++ b/include/dt-bindings/iio/adc/adi,ad7606.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_ADI_AD7606_H
+#define _DT_BINDINGS_ADI_AD7606_H
+
+#define AD7606_TRIGGER_EVENT_BUSY	0
+#define AD7606_TRIGGER_EVENT_FRSTDATA	1
+
+#endif /* _DT_BINDINGS_ADI_AD7606_H */

-- 
2.49.0


