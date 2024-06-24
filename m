Return-Path: <linux-doc+bounces-19315-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B82915985
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jun 2024 00:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D07541F235E5
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 22:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143881A01CE;
	Mon, 24 Jun 2024 22:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n+4jrgc9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990941A0B19
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719266526; cv=none; b=afgZqRnyiCIuxDJaWlUWrIcWWB1lnt7EySn7lOKUo0I1WXwKXZQCz7rrVdRWDnFgCK6spMzi8qfdQaqWy3FKH53Y8/6xqMWwWmZrktMuwvwRTVrv0B1CdjbHDmy8pxNITv+yjX4g3ZAkIYoLSybdJDP0PHV6jF10dI3AldGh0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719266526; c=relaxed/simple;
	bh=u1KuGH1/HXyrW0AP/WJGsUdwrTDtNhlap/i+z4xBS/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bO2gFEvoNI92pdv7amkhuHnEApZsV76LHrn0IFe4ApZRShnOD+Vc3a1dSOMvazYuOXw37Upl+fh9oLvE+5f3rylDmC282ZzUttGVSA7SB9JzJgUKs+gJyjOP/p/9pYi/MZo3VgVXH4duyP1Z4sbgsddlSexYQ+l9GU4YSOvxfE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n+4jrgc9; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25c9af0102cso2563977fac.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 15:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719266523; x=1719871323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMe5t/odttELQKJJDIZN4VN+rE88QoR22ZwoVBWULiY=;
        b=n+4jrgc9YigLoT4EtUFhX+b2cHZ+JgNLpC4imIiKS6JR8DRBUBY/2OvzMuYeD2Gy67
         2YPOuzc6Zx18NzyGpOcZHlE9tFcCYM6lEK6OskYOGvbM3WIr/4aYxV9DbO1tBrXFB2E1
         BnfGmqgXYXVyvD1QcsxVFSXDNZl6zGQAB9HIjHQgSm3MDmjaLADSsUoz6WE2w/3t1oM6
         Ea3EwmeNkeHYeTuWH3VX7I+wDpGYZuRMaeY3p1Ft7/D7cbdkw/I0DYrBS/SMTpMmc+4N
         izkBgSJ1yL315hybEWRabVoL5bCr9wmPd8hHpwhNRSzBHTZMDwlMin3JUhHGtmtmiEDV
         /a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719266523; x=1719871323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMe5t/odttELQKJJDIZN4VN+rE88QoR22ZwoVBWULiY=;
        b=fv7gAoYAAG0KARZlTPnlVbzrAEXy1C0d5r3X3Oh4vZNVsupwBnPtLt+z1x/ZlvMOcm
         jbiy017+jB1fiJdBkyr80VlaO3efYjO9Fs3CteUBamimJBM/ZYAZe/Q7WxuiwK4kml7r
         8FG9NDII4gMxfEn+jDlrQMddUuw9UlKHGFNk8FTuo0RhOVkFFne67Xx0bbJXbDVS/ans
         VCa7dOOL0mktcUZx5WQO1ymVLU840DKhzIcmlaBDjVwAgC5bE5JHVXSH3BOw90YxMQ8Y
         GbO2pcHJJZLQnLpWtFdnZ5rzvxhxD9nBjYQQXh35Z2RZHmvFqDPuf+mgCxJxFqwZNe8I
         qbng==
X-Forwarded-Encrypted: i=1; AJvYcCXSKQUAuul9qrROppt5zXVhYypzH+Bom93GvhoYmSRgi8JOM1cFfTXRXrtBrcNF7aKFUqP4yH7AKryRgGz6U/nA53hZP5U6lhG5
X-Gm-Message-State: AOJu0YyXROiN8CyEjQpXi6cvTWsDeFgtfoEeYHIYblaZM8dX9fCoKA8e
	mXPTdplcHS5KFPrG0lZZ9LXtJJTDw8w+0jZbOosvssGKjR4xesrkdnQqZGESUSE=
X-Google-Smtp-Source: AGHT+IFtxg/rN1nfbz6EfZu2ga2NlXar9/u79gvG7cePiuiPCelYoq5/19pC2dyZMbAHB6bN0PGQow==
X-Received: by 2002:a05:6870:fb9f:b0:23e:6d9a:8f45 with SMTP id 586e51a60fabf-25d017f709fmr6251371fac.48.1719266522599;
        Mon, 24 Jun 2024 15:02:02 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4941c9esm2116921fac.4.2024.06.24.15.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 15:02:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 3/3] Documentation: iio: Document ad4695 driver
Date: Mon, 24 Jun 2024 17:01:55 -0500
Message-ID: <20240624-iio-adc-ad4695-v3-3-a22c302f06bf@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-iio-adc-ad4695-v3-0-a22c302f06bf@baylibre.com>
References: <20240624-iio-adc-ad4695-v3-0-a22c302f06bf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

The Analog Devices Inc. AD4695 (and similar chips) are complex ADCs that
will benefit from a detailed driver documentation.

This documents the current features supported by the driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* Rework DT examples for DT bindings changes

v2 changes:
* Rework DT examples for DT bindings changes
* Fix wrong MAINTAINERS update
---
 Documentation/iio/ad4695.rst | 155 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst  |   1 +
 MAINTAINERS                  |   1 +
 3 files changed, 157 insertions(+)

diff --git a/Documentation/iio/ad4695.rst b/Documentation/iio/ad4695.rst
new file mode 100644
index 000000000000..a33e573d61d6
--- /dev/null
+++ b/Documentation/iio/ad4695.rst
@@ -0,0 +1,155 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=============
+AD4695 driver
+=============
+
+ADC driver for Analog Devices Inc. AD4695 and similar devices. The module name
+is ``ad4695``.
+
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD4695 <https://www.analog.com/AD4695>`_
+* `AD4696 <https://www.analog.com/AD4696>`_
+* `AD4697 <https://www.analog.com/AD4697>`_
+* `AD4698 <https://www.analog.com/AD4698>`_
+
+
+Supported features
+==================
+
+SPI wiring modes
+----------------
+
+The driver currently supports the following SPI wiring configuration:
+
+4-wire mode
+^^^^^^^^^^^
+
+In this mode, CNV and CS are tied together and there is a single SDO line.
+
+.. code-block::
+
+    +-------------+         +-------------+
+    |          CS |<-+------| CS          |
+    |         CNV |<-+      |             |
+    |     ADC     |         |     HOST    |
+    |             |         |             |
+    |         SDI |<--------| SDO         |
+    |         SDO |-------->| SDI         |
+    |        SCLK |<--------| SCLK        |
+    +-------------+         +-------------+
+
+To use this mode, in the device tree, omit the ``cnv-gpios`` and
+``spi-rx-bus-width`` properties.
+
+Channel configuration
+---------------------
+
+Since the chip supports multiple ways to configure each channel, this must be
+described in the device tree based on what is actually wired up to the inputs.
+
+There are three typical configurations:
+
+An ``INx`` pin is used as the positive input with the ``REFGND``, ``COM`` or
+the next ``INx`` pin as the negative input.
+
+Pairing with REFGND
+^^^^^^^^^^^^^^^^^^^
+
+Each ``INx`` pin can be used as a pseudo-differential input in conjunction with
+the ``REFGND`` pin. The device tree will look like this:
+
+.. code-block::
+
+    channel@0 {
+        reg = <0>; /* IN0 */
+    };
+
+If no other channel properties are needed (e.g. ``adi,no-high-z``), the channel
+node can be omitted entirely.
+
+This will appear on the IIO bus as the ``voltage0`` channel. The processed value
+(*raw × scale*) will be the voltage present on the ``IN0`` pin relative to
+``REFGND``. (Offset is always 0 when pairing with ``REFGND``.)
+
+Pairing with COM
+^^^^^^^^^^^^^^^^
+
+Each ``INx`` pin can be used as a pseudo-differential input in conjunction with
+the ``COM`` pin. The device tree will look like this:
+
+.. code-block::
+
+    com-supply = <&vref_div_2>;
+
+    channel@1 {
+        reg = <1>; /* IN1 */
+        common-mode-channel = <AD4695_COMMON_MODE_COM>;
+        bipolar;
+    };
+
+This will appear on the IIO bus as the ``voltage1`` channel. The processed value
+(*(raw + offset) × scale*) will be the voltage measured on the ``IN1`` pin
+relative to ``REFGND``. (The offset is determined by the ``com-supply`` voltage.)
+
+The macro comes from:
+
+.. code-block::
+
+    #include <dt-bindings/iio/adi,ad4695.h>
+
+Pairing two INx pins
+^^^^^^^^^^^^^^^^^^^^
+
+An even-numbered ``INx`` pin and the following odd-numbered ``INx`` pin can be
+used as a pseudo-differential input. The device tree for using ``IN2`` as the
+positive input and ``IN3`` as the negative input will look like this:
+
+.. code-block::
+
+    in3-supply = <&vref_div_2>;
+
+    channel@2 {
+        reg = <2>; /* IN2 */
+        common-mode-channel = <3>; /* IN3 */
+        bipolar;
+    };
+
+This will appear on the IIO bus as the ``voltage2`` channel. The processed value
+(*(raw + offset) × scale*) will be the voltage measured on the ``IN1`` pin
+relative to ``REFGND``. (Offset is determined by the ``in3-supply`` voltage.)
+
+VCC supply
+----------
+
+The chip supports being powered by an external LDO via the ``VCC`` input or an
+internal LDO via the ``LDO_IN`` input. The driver looks at the device tree to
+determine which is being used. If ``ldo-supply`` is present, then the internal
+LDO is used. If ``vcc-supply`` is present, then the external LDO is used and
+the internal LDO is disabled.
+
+Reference voltage
+-----------------
+
+The chip supports an external reference voltage via the ``REF`` input or an
+internal buffered reference voltage via the ``REFIN`` input. The driver looks
+at the device tree to determine which is being used. If ``ref-supply`` is
+present, then the external reference voltage is used and the internal buffer is
+disabled. If ``refin-supply`` is present, then the internal buffered reference
+voltage is used.
+
+Unimplemented features
+----------------------
+
+- Additional wiring modes
+- Buffered reads
+- Threshold events
+- Oversampling
+- Gain/offset calibration
+- GPIO support
+- CRC support
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 4c13bfa2865c..df69a76bf583 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -17,6 +17,7 @@ Industrial I/O Kernel Drivers
 .. toctree::
    :maxdepth: 1
 
+   ad4695
    ad7944
    adis16475
    adis16480
diff --git a/MAINTAINERS b/MAINTAINERS
index c52c4b0e69a8..9b6eaccb34f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1216,6 +1216,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
+F:	Documentation/iio/ad4695.rst
 F:	drivers/iio/adc/ad4695.c
 F:	include/dt-bindings/iio/adi,ad4695.h
 

-- 
2.45.2


