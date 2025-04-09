Return-Path: <linux-doc+bounces-42751-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A199A82EEC
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 20:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B22658A1385
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 18:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00922279324;
	Wed,  9 Apr 2025 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ho8IeVwn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7E227780F
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223873; cv=none; b=T4nTS2WwIDqfcyGeR0fT24Hvxk3inUxoVmWBiieFBF7D+GfQuMbR6dHdqFExcHvSfDBDpSG18LNHkunsfLkCHVQGbbi1LwHkS561/pHCmKe3WjREqgFBOUKpLmkoEE8B3wEjaJuS0V11xDvGadQHuFrwhOSXpAJMta95CDVh/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223873; c=relaxed/simple;
	bh=op+FNBneI6h3+sV2ZZlwMqV5lcQPl5VA3Pzvyo21FgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmEPVykC0R1vfynwp66qCGub4wob2ksFq8COYcBUXh0XUBgFFLkEYd7yaiKMf6AqT9tzJ7E5MrTJMxH/CsKttt/tBcBsPqdLFcrjHyfmRfc855BYKNpdGSEkJP9C+bbUTbc9E4toGK+8oh1GieGfpL0O2Yu3iIbPDv+EWvxH9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ho8IeVwn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39129fc51f8so5957559f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223870; x=1744828670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7RQvOK6fXK41dO5HhHuRssJ1eoHSZj31eOEcLWUU5k=;
        b=ho8IeVwnAUCM0Ul+b1oOSQfoEDx58zPkEwM2Sfdy/nkJJFuydesxXqlbPwQQ1nT5fo
         h2BaJcusTFDcI54slJFAQ0SH4zVBgQFKAxGldx7yjn/OxKgs061iR2/jrm8j1P9s6sDn
         Jgqjty6sZ13WA87wwVYuquW/RN7GKVF9AeSRM7fjxaj50n4K7mrxgNvjGtBKG6/SF3fl
         22X0cBdwv1vB+5xk9aQDcvhZX8G8nam2Vk+Gug3eg79VHNsj1QPTsgnQIaa7h/sNVQTb
         5fl3eI5wT01chWO38kD1XWLUKd9Z0IxT4tbfra5+NjNu/vYfmbApClXVq8zdnCVrSp2U
         VS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223870; x=1744828670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7RQvOK6fXK41dO5HhHuRssJ1eoHSZj31eOEcLWUU5k=;
        b=ODomEHxB26jEakT49GZ11GWA1BSZ5wuLgllqeTUQ/EUfedoWe6YSHMNte1D2ZH2Tkk
         WmH0qtYCZ9+85AtYHtsDIgFZiFNKw0AIXjnjcCON8HD//fhP5+cx4YBEBU3AqhtuXQQc
         o+70+B/rn+72yrans/Fy0tRbxOgxf6pXCrkkVQzeFdMZ8K3vphkIYb76Np6X4T5l499C
         9bfEY393XpgP3RfiIJquwQSVBxnlCDshkyyVmsWZ19sT0XwB+lQ+JgukO1Ble4WvvNDX
         JmKmOrQL785Xk2Dvu/jCWhWyCpiERsP3BD3chqNC7ed0/xo1rZ9AsJPH4yFd31xD2kPz
         b/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXovTdTn8GwxUymCN/zMYTnFJRskkMlB/b3VTiEDAXHdPGqq6pm2Fkc07esTg+FsTXzVZLEKhhQxFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRPi/E6grVRC5oQPJbA9QdpZbU0rqRndEIlotCP1TwPUPT0Zr
	YwYW0TL//WfO1OCDvaHnbYNhAJBHKYvELSgPKJHgZAPUD6fHRt2jfrZZu8PEd6E=
X-Gm-Gg: ASbGnctL7T625uKH1QVWfJJQYSUQJkYac7GRmey/3BnwlZ26/4/H2+6nU8vpNGoWB/1
	Ynizs8eMfq8wIfyDy7mgDSc5bil4+GclsTgGlkf2+xUvNxwfILjf4RWlFGe/u8tfjR1k9BoEDiL
	Ea21KYcwUycg7E6M45LNmFMmJfo5Q5LO9382MqmtbEFIUkR//rLsg3ehimLaNQv8skjYgTTkwgd
	wNXPsXpn6OA8ueRxZ293ujzzo9q+SpCKGKdVFSokqKMzFvhTkLouDsiyN1ZS9q1aFrmq4zGtIP+
	2yyfl9P8211xpbOb632NbMZ9VghqIyah5ctNUQ89RU6s/O/vx4fEHWiK7CfuHm+JeLQoiXv/Vo3
	ogRoVNjBn2WPBGNcY4Q==
X-Google-Smtp-Source: AGHT+IEDHPm4LxkKIHaWsV3VkEh4vV7MWqjrpEXZp3f0HFZRY0uLOfZ60I6tOqq7efsrIH+dDqaIww==
X-Received: by 2002:a5d:64e6:0:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39d87cde0b9mr3769040f8f.55.1744223869782;
        Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:49 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:29 +0200
Subject: [PATCH v5 2/5] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-2-fb429c3a6515@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=8WrNMaaQ2xgbRizjN22pSBO+RAVh+prIiloygvq6/kQ=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk+X+8602+/US/O41hwzOpblEdNTWrf8rUAg3wf2T
 X9r91fN6ChlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCR0gSGfxpLGL2vmAQJ9eQF
 P5/wJrH5he3m0OoM6ffcd1WXM3NKT2T4n1C6kj92s4W67I6+ramztt2f8OAmc+jrkx95ivrjJ/5
 qYAcA
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
index 0000000000000000000000000000000000000000..1539c2096ed9f9344da2e5d018e77a0524792270
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
+| data_source           | The used data source, as                             |
+|                       | ``normal``, ``ramp-16bit``, etc.                        |
++-----------------------+------------------------------------------------------+
+| data_source_available | The available data sources.                          |
++-----------------------+------------------------------------------------------+
+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	normal
+	root:/sys/bus/iio/devices/iio:device0# echo -n ramp-16bit > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	ramp-16bit
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
index 030d90d383411bbfe949cfff4f5bce27e3dd37c4..52d73ba42d8600632d00b7a25df9ed5bea84fa3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0


