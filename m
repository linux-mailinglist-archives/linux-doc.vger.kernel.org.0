Return-Path: <linux-doc+bounces-42560-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B06A7FBCB
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A6018921B3
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9752686A9;
	Tue,  8 Apr 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rC9Py0Z+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237D268681
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107620; cv=none; b=t/a7Lh0qUf+5QW2IKDNbhnzMSvA+FmDGBcBmEsfe3g3lYYhb8RhACilQ+5lSbfsNAEsGvpToEQLZSQeeRnjb53RDJE1TeKNaTor+V5t4wEvPZ9MbvVuZyPGHc/mxkCfWf5+gGbwu0dD0ACcb3k7iKaJZA2OQXySNKePqFwbco6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107620; c=relaxed/simple;
	bh=fJ2QDU0edCT1i91gDbLTwkRKAOLcggRrfUQ3QN1wvvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qg13pxoXRSW7mwHCOI4MDy8rqC5hAm5OcGd1puQ9Ocpc1gEOMqLAAFbNQptuXDuJMWDB5X8cweJcsC1MlIOGM12f/Wvl8nD89PPnIK5p552BqhU/XWxmsM96RdD7eTfRHDN2+C43kdLY0zKPJBeQWTRhigP2ebF1vN5CiIvEfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rC9Py0Z+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so42027955e9.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107616; x=1744712416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N25ObTi9+VYre0Pwf0ivFwi1iTe0QqqN5sDF++TPjWQ=;
        b=rC9Py0Z+m0uUfuDFIwlBk31G1XYK80sM6+QkJNSSB1Ua6KhsObB1xv0IfDeuTOb9pf
         LeveQ7G3F8yg4dTG1Ki2mZIlgycYh7BktEJ5eZT6V8AhFllbAsEjQHQoqnl+GX3rsuuC
         KhhUSYVSr9nz0WXeHZqy+jndWn+ZemqOadWLxhPWG01laIdm6h+SvOpHwI8gJhVlBfZu
         RD8Kge7LP+UY0MjAe1M15YU39NC9IguMG0JxLBTW9WLopeuQ0bcPwFDG7FnE4ljwr0+U
         +aukPRQydKecn4ReISSKvFy8EDhgykWM0tA3hvwpVzC6+Hzz2+iVt17YBr41qFVTKO5M
         LcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107616; x=1744712416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N25ObTi9+VYre0Pwf0ivFwi1iTe0QqqN5sDF++TPjWQ=;
        b=rbxIB/jNFyzE4iGk3SonPMdOHTli02VT4n/zJn2jTLFbO4gDTcJCLotJgmg4Sjt0C0
         mkyFOuDBVuq+g96DaBGe9Er+xFjJzpWENDpGt9eKbBL6h/eCgYZRCqrJN+3j7UBC8W+c
         IrgxCwELA2IWB31mnZmc+iYgNc9rr4f1lqzxrZ4XtiJt6q1E3Zgi5szedGyaNPG7ntGG
         NeGW2jXfCB57zwdq5Dghpy77FVUIfA1e8i1ils/fRrE8DkSgjSDmO+tn8pIeuHfL3tqk
         BFlQuZ6oBI02AyeeB4oHhXjzPx81lbJnNj0v2tdCWf4I6xX7TdAhwr47HCll6+jB0z0C
         o6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWebgNzrUMNNZhFrmD3bYbtDbckFKtcsxJH12KfqOetMAHYp7Nl8xMfN2X/Xeb7/J+UTnDIDdkYs3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NP/4LE5IJy20qciSoX0jw0wHfhuhFDIsxOfAtPPmWjDtsUNT
	9yRX42BBuU93EPHlAtwbJdUh3rNr3CuVXow0PTHQJjLmb8UpyORuuNX3DmU6erkLznxcW/G+WUi
	S
X-Gm-Gg: ASbGncvCzXetZqfVZIWQzbTru5JywE9RJkSbXG6AWxteU690YGnhifTxQm1EVylxk2k
	Beb4Qlz6AkV2SPgja0xK/ebhGcprf6nGSoF8LFe8g+PLfAN3auBJWGZxVr77gK8s+5RZJhYs3Dv
	s/L2qWc9TqMhadz0mxtTqwNYAJpQVfbZIfjHFlwNiBAfcbhZn+yHJkROF13yOCKUoa5+7zfuxUF
	GAQlIzEL7HF88s2Mykg3EG57OBaBlLFvN/yEaBf2THOFQunSe7uha8U+jjhBIEp4UEwx5E4vozb
	7lGAmnG/G8MBN+3JwmpubuHlQyl0KRgVeixwIIPf5wUKMHgHJ4ZARlL7ljgRJH1AupctRppmRxK
	U+RRcew4SKKCOFeXptm9sCA==
X-Google-Smtp-Source: AGHT+IGnPzc6uTuByt/3GyKTMHMQg/lwzqCoRyC3eh5DaNDXFcSV/h/SNkUkfCihJuOscV6vPXXflA==
X-Received: by 2002:a05:6000:401f:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39d820ac9bemr2407988f8f.11.1744107615738;
        Tue, 08 Apr 2025 03:20:15 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 12:18:52 +0200
Subject: [PATCH v4 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-2-b33c0264bd78@baylibre.com>
References: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
In-Reply-To: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4342;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=6w/Ug2UM5FIVCK/04ZJVGDVSrtb3C+at0h3MVUDEs+E=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kNoK99sE8GjVXm3k6tdFvhEnvZKO7Vji2nRaXXmt
 pSyVy6nO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEwkpo7hr1Be3/Sk7/fzijYd
 Zvq2M96C7Yv15cxK3f8F3okbj77NtmNk+N5UuWJjqflJkaup6e7OX/p0JiswvGBtut18ebnCkif
 HWQA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add documentation for ad3552r driver, needed to describe the high-speed
driver debugfs attributes and shows how the user may use them.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad3552r.rst | 73 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst   |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 75 insertions(+)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
new file mode 100644
index 0000000000000000000000000000000000000000..bd63b333ca10d993230027f933cebf7054684974
--- /dev/null
+++ b/Documentation/iio/ad3552r.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============
+AD3552R driver
+==============
+
+Device driver for Analog Devices Inc. AD35XXR series of DACs. The module name
+is ``ad3552r``.
+With the same module name, two different driver variants are available, the
+``generic spi`` variant, to be used with any classic SPI controllers, and the
+``hs`` (high speed) variant, for an ADI ``axi-dac`` (IP core) based controller
+that allows to reach the maximum sample rate supported from the DACs, using the
+DMA transfer and all the SPI lines available (D/QDSPI)..
+The high speed driver variant is intended to be used with the ``adi-axi-dac``
+backend support enabled, that is enabled by default when the driver is selected.
+
+Supported devices
+=================
+
+* `AD3541R <https://www.analog.com/en/products/ad3541r.html>`_
+* `AD3542R <https://www.analog.com/en/products/ad3542r.html>`_
+* `AD3551R <https://www.analog.com/en/products/ad3551r.html>`_
+* `AD3552R <https://www.analog.com/en/products/ad3552r.html>`_
+
+Wiring connections
+==================
+
+Generic SPI
+-----------
+Use the classic SPI S_CLK/CS/SDO/SDI connection.
+
+High speed (using axi-dac backend)
+----------------------------------
+
+::
+
+    .-----------------.                .-------.
+    |                 |--- D/QSPI -----|       |
+    |   DAC IP CORE   |--- SPI S_CLK --|  DAC  |
+    |                 |--- SPI CS -----|       |
+    |                 |--- LDAC -------|       |
+    |                 |--- RESET ------|       |
+    |_________________|                |_______|
+
+
+High speed features
+===================
+
+Device attributes
+-----------------
+
+The following table shows the ad35xxr related device debug files, found in the
+specific debugfs path ``/sys/kernel/debug/iio/iio:deviceX``.
+
++-----------------------+------------------------------------------------------+
+| Debugfs device files  | Description                                          |
++-----------------------+------------------------------------------------------+
+| data_source           | The used data source, as i.e.                        |
+|                       | ``iio-buffer``, ``backend-ramp-generator``, etc.     |
++-----------------------+------------------------------------------------------+
+| data_source_available | The available data sources.                          |
++-----------------------+------------------------------------------------------+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	iio-buffer
+	root:/sys/bus/iio/devices/iio:device0# echo -n backend-ramp-generator > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	backend-ramp-generator
+
+
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index bbb2edce8272e7483acca500d1a757bbcc11c1e0..2d6afc5a8ed54a90cd8d5723f0dc5212b8593d16 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -19,6 +19,7 @@ Industrial I/O Kernel Drivers
 .. toctree::
    :maxdepth: 1
 
+   ad3552r
    ad4000
    ad4030
    ad4695
diff --git a/MAINTAINERS b/MAINTAINERS
index 57eaab00f6cb53df52a4799eb2c1afbbd1e77a1e..52bc56a9ee22c66b90555681c4757ea4399adae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1295,6 +1295,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0


