Return-Path: <linux-doc+bounces-36438-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67266A22C44
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 12:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D762A3A5036
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 11:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D5A1E3796;
	Thu, 30 Jan 2025 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Eur0W0f8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129DA1DFE29
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235339; cv=none; b=uzQkV31lCar+aFYqYFlGnfzPEj2LOK7DBSiKtakDi/26zbQT8bTjJX7IiFz/0vc/B1Ka9jgG0g5+Im/7S/8TLv5ZHDfZOWpXGOnGiUyoMogMe6MWP9mYMk5+wUugfA7+TXAACujUM73SBtSLIC4ay78C+67cNTFFy9QJxj+MkF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235339; c=relaxed/simple;
	bh=Xj+cACF/4dUxnqDSM5N/rrBoBvSzBj7xPq2n0sP1X3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjoypYG/RJ3funup1HZz2H5FcXG186iSP1RoQAOpNcwen16b9Op+/c6jntCbyoB0wIOlLFJS+MivONQA085eJicB+4ElNPgtPF4H0+BeTpqWIT2aC9yorW6+4fElDfnoPuwN++X4XDSXBFmveu/UvYeOGijXYwQJtVVU9HYezTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Eur0W0f8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38632b8ae71so622181f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738235334; x=1738840134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJnfYL4y+XOtMvQuz9huV55zf7Tgs9Of5rkerqCGHxk=;
        b=Eur0W0f8vmLCi9RUTg2tCAQ1x5NjXexTVqdi8M/lOwW4JwBWh/+6O4vkAEMAXiJCZy
         TxYeoYqoeuVkNMdYG/ESCzLZEqbLtsmCxFwYd30MmeuJX0o+IOBTACPC7NF3pybxnQnU
         UulKA0TLCeJyGcDD+f4cfrITjpq8DSbvECStaYLDHDQPijz+l1Up30oMQRWemJfBEuJt
         PQM5bzqSBHM8Dv6oqHM5JtQwzCt/PMue8mKlv1KHPky5XxDTODDgtHphx5RyMKzbkTyj
         1YAOOAjnC3M/WQlW+E7UGYcisd3VUCzXkeijsFheql3J91nqpfRsVnN1RCc/RxqbNrLs
         Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235334; x=1738840134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJnfYL4y+XOtMvQuz9huV55zf7Tgs9Of5rkerqCGHxk=;
        b=LnWQzODpPsEGZcV9DA4HqbCKrCHM8AOzDxIdiuIK84On/sdt+kTC2FvzXrtkhRpxHi
         PFiBP20mC3liFG42eysoqi3DqxrQQbgcAKP/eTHu+YjPTlGSU/oVsTOs7FgKGpHZ2AjY
         LxSzyYwjocTSJbyLzOOmsWViVGbSyEmGddvJOh9I9hFFRhKiQPRRVC2NTHtxIpcrWugt
         FpNt/evdKT2b9KwOBuYgB/tLLBNdQ8EfC9juv09M7tzxBjaMzefN1zKMJFXlY7QBezTR
         0BLOzaQrEcfsEPf+h9/emDMpVxF/QzuEWQfi84mqq1hAWYGCqUpg0qbLzHhVPovrct8g
         AYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6galkDz8pgQGL1rde9B0YLABGi2W1jqqzMqEqWTmYPEj81iUpcA/PP+SfGmX+nSUVub7D4lXdjbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwixhzDQ8OM3RC983SP/BaDzQ4xSJRqFxceUpKNA257VsBi89nA
	840cxf5JG4LEG7y0tgvfh9c9LcrLE6qudzhxRSWR6wWK+eArVFv8ZuZr7adrk/0=
X-Gm-Gg: ASbGncvTTVOqXX48LTZzBiNiIyo0lso0d5BdN0FRUzDP4fSMHsrD9RhdEY0hmhG5Baa
	yXmirBxbsovWmdVGBSz2SMWyrMGuTrCOfiXM1ADXvVo1j8WoYBJQZNj1oaADgHjeC5+TuuuZtTw
	4pAoceuCJ+giGn9CzKbEOiOsBR15SVFDn+LINMR9LNiNeTwQw61EJHTqQm71uvz5W1+ybACsNpJ
	kSOsG49W0f+l2P8Hc1vunSjHk9s/awouHZjAQ9DxhQfb1Ar5JKop9ThYzjd7jeBoXhn+7hkoAdf
	LXqOftFyWKvdG3Of
X-Google-Smtp-Source: AGHT+IGe+b6f4XJnC7ueMLUIwCUw6sfTiIPVwX9AFJsaQWbx8UTnv+NvImD+vFNCDXMCTOB52vx25Q==
X-Received: by 2002:a5d:64e2:0:b0:38a:8c9f:dd61 with SMTP id ffacd0b85a97d-38c520b9c55mr5807236f8f.46.1738235333921;
        Thu, 30 Jan 2025 03:08:53 -0800 (PST)
Received: from [127.0.0.1] ([2a01:e0a:448:76e0:2c72:cd2d:79b2:82ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bb2sm1689225f8f.34.2025.01.30.03.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 03:08:53 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Thu, 30 Jan 2025 12:08:30 +0100
Subject: [PATCH v3 6/6] docs: iio: ad4030: add documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-eblanc-ad4630_v1-v3-6-052e8c2d897d@baylibre.com>
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
In-Reply-To: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>
X-Mailer: b4 0.14.2

This adds a new page to document how to use the ad4030 ADC driver

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 Documentation/iio/ad4030.rst | 181 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst  |   1 +
 MAINTAINERS                  |   1 +
 3 files changed, 183 insertions(+)

diff --git a/Documentation/iio/ad4030.rst b/Documentation/iio/ad4030.rst
new file mode 100644
index 0000000000000000000000000000000000000000..41ce5ca5c710c46a0995d1b127fa1c10fca4c1eb
--- /dev/null
+++ b/Documentation/iio/ad4030.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=============
+AD4030 driver
+=============
+
+ADC driver for Analog Devices Inc. AD4030 and similar devices. The module name
+is ``ad4030``.
+
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD4030-24 <https://www.analog.com/AD4030-24>`_
+* `AD4032-24 <https://www.analog.com/AD4032-24>`_
+* `AD4630-16 <https://www.analog.com/AD4630-16>`_
+* `AD4630-24 <https://www.analog.com/AD4630-24>`_
+* `AD4632-16 <https://www.analog.com/AD4632-16>`_
+* `AD4632-24 <https://www.analog.com/AD4632-24>`_
+
+IIO channels
+============
+
+Each "hardware" channel as described in the datasheet is split in 2 IIO
+channels:
+
+- One channel for the differential data
+- One channel for the common byte.
+
+The possible IIO channels depending on the numbers of "hardware" channel are:
+
++------------------------------------+------------------------------------+
+| 1 channel ADC                      | 2 channels ADC                     |
++====================================+====================================+
+| - voltage0-voltage1 (differential) | - voltage0-voltage1 (differential) |
+| - voltage2 (common-mode)           | - voltage2-voltage3 (differential) |
+|                                    | - voltage4 (common-mode)           |
+|                                    | - voltage5 (common-mode)           |
++------------------------------------+------------------------------------+
+
+Labels
+------
+
+For ease of use, the IIO channels provide a label. For a differential channel,
+the label is ``differentialN`` where ``N`` is the "hardware" channel id. For a
+common-mode channel, the label is ``common-modeN`` where ``N`` is the
+"hardware" channel id.
+
+The possible labels are:
+
++-----------------+-----------------+
+| 1 channel ADC   | 2 channels ADC  |
++=================+=================+
+| - differential0 | - differential0 |
+| - common-mode0  | - differential1 |
+|                 | - common-mode0  |
+|                 | - common-mode1  |
++-----------------+-----------------+
+
+Supported features
+==================
+
+SPI wiring modes
+----------------
+
+The driver currently supports the following SPI wiring configurations:
+
+One lane mode
+^^^^^^^^^^^^^
+
+In this mode, each channel has its own SDO line to send the conversion results.
+At the moment this mode can only be used on AD4030 which has one channel so only
+one SDO line is used.
+
+.. code-block::
+
+    +-------------+         +-------------+
+    |     ADC     |         |     HOST    |
+    |             |         |             |
+    |         CNV |<--------| CNV         |
+    |          CS |<--------| CS          |
+    |         SDI |<--------| SDO         |
+    |        SDO0 |-------->| SDI         |
+    |        SCLK |<--------| SCLK        |
+    +-------------+         +-------------+
+
+Interleaved mode
+^^^^^^^^^^^^^^^^
+
+In this mode, both channels conversion results are bit interleaved one SDO line.
+As such the wiring is the same as `One lane mode`_.
+
+SPI Clock mode
+--------------
+
+Only the SPI clocking mode is supported.
+
+Output modes
+------------
+
+There are more exposed IIO channels than channels as describe in the devices
+datasheet. This is due to the `Differential data + common-mode`_ encoding
+2 types of information in one conversion result. As such a "device" channel
+provides 2 IIO channels, one for the differential data and one for the common
+byte.
+
+Differential data
+^^^^^^^^^^^^^^^^^
+
+This mode is selected when:
+
+- Only differential channels are enabled in a buffered read
+- Oversampling attribute is set to 1
+
+Differential data + common-mode
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This mode is selected when:
+
+- Differential and common-mode channels are enabled in a buffered read
+- Oversampling attribute is set to 1
+
+For the 24-bits chips, this mode is also available with 16-bits differential
+data but is not selectable yet.
+
+Averaged differential data
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This mode is selected when:
+
+- Only differential channels are selected enabled in a buffered read
+- Oversampling attribute is greater than 1
+
+Digital Gain and Offset
+-----------------------
+
+Each differential data channel has a 16-bits unsigned configurable hardware
+gain applied to it. By default it's equal to 1. Note that applying gain can
+cause numerical saturation.
+
+Each differential data channel has a signed configurable hardware offset.
+For the ADCs ending in ``-24``, the gain is encoded on 24-bits.
+Likewise, the ADCs ending in ``-16`` have a gain encoded on 16-bits. Note that
+applying an offset can cause numerical saturation.
+
+The final differential data returned by the ADC is computed by first applying
+the gain, then the offset.
+
+The gain is controlled by the ``calibscale`` IIO attribute while the offset is
+controlled by the ``calibbias`` attribute.
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
+Reset
+-----
+
+Both hardware and software reset are supported. The driver looks first at the
+device tree to see if the ``reset-gpio`` is populated.
+If not present, the driver will fallback to a software reset by wiring to the
+device's registers.
+
+Unimplemented features
+----------------------
+
+- ``BUSY`` indication
+- Additional wiring modes
+- Additional clock modes
+- Differential data 16-bits + common-mode for 24-bits chips
+- Overrange events
+- Test patterns
+
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 074dbbf7ba0a087ab117efaf3d69fc559fc00fa5..982ac1bd9dfd7bfd54bfbf87d6258e6249edf799 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -19,6 +19,7 @@ Industrial I/O Kernel Drivers
    :maxdepth: 1
 
    ad4000
+   ad4030
    ad4695
    ad7380
    ad7606
diff --git a/MAINTAINERS b/MAINTAINERS
index 9571a917b0437a802190101c0a83bba9bf790ffc..2cf66e6c7635eba3942933420878a610462f127e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1281,6 +1281,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
+F:	Documentation/iio/ad4030.rst
 F:	drivers/iio/adc/ad4030.c
 
 ANALOG DEVICES INC AD4130 DRIVER

-- 
2.47.2


