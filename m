Return-Path: <linux-doc+bounces-24820-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF400971CA0
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 16:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9748F1F22B10
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 14:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ACE1BAEFF;
	Mon,  9 Sep 2024 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zu4Y9joY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00CD1BA28B
	for <linux-doc@vger.kernel.org>; Mon,  9 Sep 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892261; cv=none; b=FzJwH0nFLMrtVj+eSh2eoB5A1qyv33HLTpWsLTwLvu+VCRjdUVvXUyCwC4eWevV1sHUrlV+rH3Y6zcqZvEkf6mNvh5doXTW3xLgonwS+kEXKo09ZyTjy2HZnUGCNPI0At2c4R6h9n4iQRN0ugHvYbiZr0eTCeV6ZUqohdmvgr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892261; c=relaxed/simple;
	bh=CGZ9TfH82xYtf2SZDvwZlx08DxnCJf+sySQ8GbSU7/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDo/ULjE49r8kQPCkOsNmh3eoYRGKZD3ZzE8fOGBDNLYdEs+vvNwzLI4zNgaz+7vLACTzQeBBslT7vsFTnc9wdejELczycI6lj/SPmXlbfB0krj6PH5xf+V2wbNl1pz0QtYOmQU82ca+zXeIwVDW7H/nEoNEeGEx28fOLR2kzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zu4Y9joY; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45765a0811aso25548811cf.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725892258; x=1726497058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSvZYoHybDPnZClgnrcppHDQUUEDcvsxsQCuR8Zqm6s=;
        b=zu4Y9joYkzRKzbuKVmefHn3O4DAFciU3F3WsUfkfS10QtIZaLRWyXkHO/bkP8ZyW+V
         lreH187mhNf2qjgrw3V35ma0ziMYVxeDJMgv+u4BLVFljqGG4giVD1LJpVqlI4tC/eDQ
         wleX2on14ZcPTD2AUipisYQG/TBnrXhUkRGsQrq1InsBXkvGt4V6df+bcpJ0MPI33H3o
         fFv5ahZmPw2jToUnY4pL+0C+ASi1dDGVBlL7yTG1mbvwSd6/eH2fGj292Ysec5c/J1lc
         k2XNvLmv6idSL68O0hUyzfxYytk5U7owficf168hz7Brrc0sdZ44ztTCS+7EpV5dYW9Y
         NmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892258; x=1726497058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSvZYoHybDPnZClgnrcppHDQUUEDcvsxsQCuR8Zqm6s=;
        b=wVsEuYkNtqwWCCW79Cln4iI6LvS+1s5L2tD2dwVvTuxB/VbVT+vvU+OcUMiNJ5+cOI
         /37vI6tmTjenQcpEcVfy+O7Sfwas99MDZJjWhYmwX/lUQClbAK6OQNlo5xJ6bTX7Uj3j
         NSoNffHaofmrtP97NB0Ymrz4dMfdY3vOetwWkuU3YxobGSotivBfYj0wINolQxnzXI6j
         rXSnslVZwmjIVDpJkZyOxif0EcUJLCavWk/6PEcjhG97Ea300NRhB7Pasj0OW8D0v6j1
         O44l0c2f+NchnexoaT2RfLO6NZo6722xQwnslO+TrABQ+s6GBY4LWUi/S8X+Vjqc7W5/
         3lyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXch2Y4+jW5D6IWJrhKA68ioC47hxYz8Okn/VfRv+94/YAR/wDN/HP1lvGpHkpqJz8/prVGSUryoS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQwsaVNCtGCZC0XIxC0RAS7cSlbsaGaOfEPQTQgweYoWvMhTo3
	3bCehNgBjCflkTsk6xo8JH5TthSOAZQU6YVcVin1DQW4+gD4IPRNN/OiIAI43Kk=
X-Google-Smtp-Source: AGHT+IE9s+h7eQ73OlzDaUPfjnMJSs4SCkCUbkX9mCxshmoQMht4TxOAQYngSL2nMfbSjb0fHZeUQw==
X-Received: by 2002:a05:6214:3a89:b0:6c3:8362:796f with SMTP id 6a1803df08f44-6c5285113f5mr202022116d6.37.1725892257631;
        Mon, 09 Sep 2024 07:30:57 -0700 (PDT)
Received: from [127.0.1.1] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c534339987sm21385406d6.33.2024.09.09.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:30:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 09 Sep 2024 10:30:49 -0400
Subject: [PATCH v5 3/3] docs: iio: new docs for ad7625 driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-ad7625_r1-v5-3-60a397768b25@baylibre.com>
References: <20240909-ad7625_r1-v5-0-60a397768b25@baylibre.com>
In-Reply-To: <20240909-ad7625_r1-v5-0-60a397768b25@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 David Lechner <dlechner@baylibre.com>, 
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.1

Add documentation for the AD7625/AD7626/AD7960/AD7961 ADCs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 Documentation/iio/ad7625.rst | 91 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  1 +
 2 files changed, 92 insertions(+)

diff --git a/Documentation/iio/ad7625.rst b/Documentation/iio/ad7625.rst
new file mode 100644
index 000000000000..61761e3b75c3
--- /dev/null
+++ b/Documentation/iio/ad7625.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================
+AD7625 driver
+====================
+
+ADC driver for Analog Devices Inc. AD7625, AD7626, AD7960, and AD7961
+devices. The module name is ``ad7625``.
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD7625 <https://www.analog.com/AD7625>`_
+* `AD7626 <https://www.analog.com/AD7626>`_
+* `AD7960 <https://www.analog.com/AD7960>`_
+* `AD7961 <https://www.analog.com/AD7961>`_
+
+The driver requires use of the Pulsar LVDS HDL project:
+
+* `Pulsar LVDS HDL <http://analogdevicesinc.github.io/hdl/projects/pulsar_lvds/index.html>`_
+
+To trigger conversions and enable subsequent data transfer, the devices
+require coupled PWM signals with a phase offset.
+
+Supported features
+==================
+
+Conversion control modes
+------------------------
+
+The driver currently supports one of two possible LVDS conversion control methods.
+
+Echoed-Clock interface mode
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+.. code-block::
+
+                                                +----------------+
+                     +xxxxxxxxxxxxxxxxxxxxxxxxxx| CNV            |
+                     X                          |                |
+                     v                          |    HOST        |
+          +----------------------------+        |                |
+          |      CNV+/CNV-   DCO+/DCO- |xxxxxxx>| CLK_IN         |
+          |                            |        |                |
+          |                            |        |                |
+          |       AD7625         D+/D- |xxxxxxx>| DATA_IN        |
+          |                            |        |                |
+          |                            |        |                |
+          |                  CLK+/CLK- |<xxxxxxx| CLK & CLK_GATE |
+          +----------------------------+        |                |
+                                                +----------------+
+
+Reference voltage
+-----------------
+
+Three possible reference voltage sources are supported:
+
+- Internal reference (only available on AD7625 and AD7626)
+- External reference and internal buffer
+- External reference
+
+The source is determined by the device tree. If ``ref-supply`` is present, then
+the external reference is used. If ``refin-supply`` is present, then the internal
+buffer is used. If neither is present, then the internal reference is used.
+
+Unimplemented features
+----------------------
+
+- Self-clocked mode
+
+
+Device attributes
+=================
+
+The AD762x is a fully-differential ADC and has the following attributes:
+
++---------------------------------------+--------------------------------------------------------------+
+| Attribute                             | Description                                                  |
++=======================================+==============================================================+
+| ``scale``                             | Scale factor to convert raw value from buffered reads to mV. |
++---------------------------------------+--------------------------------------------------------------+
+
+
+Device buffers
+==============
+
+This driver supports IIO triggered buffers.
+
+See :doc:`iio_devbuf` for more information.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7f77a1c1110b..cd5a18bf5e3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1279,6 +1279,7 @@ S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 W:	http://analogdevicesinc.github.io/hdl/projects/pulsar_lvds/index.html
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml
+F:	Documentation/iio/ad7625.rst
 F:	drivers/iio/adc/ad7625.c
 
 ANALOG DEVICES INC AD7768-1 DRIVER

-- 
2.39.2


