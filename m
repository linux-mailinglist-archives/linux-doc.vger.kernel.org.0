Return-Path: <linux-doc+bounces-20534-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A370F92EF6B
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CFF7B2117F
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 19:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4886116E88D;
	Thu, 11 Jul 2024 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v6opzFaS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAD13CFA6
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725358; cv=none; b=JL9NahwBgDHaqfngYuiTORQXym80QbQZ9s5aIVkFuapzAqy6Ft4HKl+qNo2j9L+20dRmSjU3fMf0k8I8PVaRvH7cLr9lY4RcHoGZMoiaUDxLW3+jtiXstD8ie42Lzjknl2aXmsBdtqsIVwo2Zxr7GzngKjq0XeNWD6W1vX/XGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725358; c=relaxed/simple;
	bh=iuCVad2848Jv/Km4IpfeyQWeavoq/8mGfyxqEScqk+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HCa2lnJhtP7eWvbnzLxCOzDOoz1FJIPFwqEElhgBaSsl+XPiBS+KzT95CQRh7mSKv01NnhNnSBMJOGO+p42SSDuo5IKrTKCC5gj+u8259M8lzuYKF7kFIWFOk5++0ZcWcPxf+CFt7h/KJhqoouIhnRLOs9eIYdQauMrjaL8vVF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v6opzFaS; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d92df7e83cso1009520b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720725355; x=1721330155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/tX9lV8rjzYpYKuTiTA033E7YCg3xzMQgQWZkMLTCRg=;
        b=v6opzFaS59l3lbu46/iYmNCPbOS6Zd3MkPXaj1WhwzzEthId44GySo+/K71qPzSh+c
         2oLNS/IrvWeGVIPIPAX3LOLY/vBx1Iv9PXANz9moCApQM6swIML2WO/nZLG1+rhwdjo1
         f7VPd/Yl2CpAAeSoEfE/9wWmqBvqaVnaSZmFEC0RkIVW0sU3Fh4usJcTYnJfpMTcLhpw
         keL3yiAaHslgs/4hO/s7Wf19TWWjZ0TaZ8uFNahvX17ASdgPdROAyBgo6gBkUSXDu5fq
         dG21+/GyxbDIuFJl/PTtzlb9XK/K/TwQsJ4zhfgcrR2RYuRChnyW0GtQdRtQL+tZgUra
         vCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725355; x=1721330155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tX9lV8rjzYpYKuTiTA033E7YCg3xzMQgQWZkMLTCRg=;
        b=kOKlNVYtoWxWJoLRUwhYgS5ZQFL5wzNZVyJCBBz2Zl7q+5o4RR4ifMLD0dVLQqbq35
         p/yYa010X2zO33hygkLk2Eg9A0Kv7TOquKd7qzEi1D6e2QZr/hd1LKKnaHYOZbdTvXKg
         lNYXNEhE2Gx02QmLxxWo5uMxCGgGBdXOeA1WmTsbzy1/HoJvZ4+LF48Mjf4wCSpvf3ji
         Ky5k8gd/Xf2+aqbTfdMrWcZYlA9R3FMXRV8MA246vRuwZ8/GdmkFM8KdKSv2A29dSVEK
         B6c5ns1+Pirf9HfBpQ2HykGqKR1MOPsMN/ZK7tFgl88Df3rLgjneeIV/vK23ieCbBPyt
         whxA==
X-Forwarded-Encrypted: i=1; AJvYcCVREYkLRbVMFHApJZBomOZXw9RK4CGkR86i3FSxj4jdQXuQhO+1LCUxFaRc3r9x6+gNHqo7zoUB/vvUNSsRHzzNEuzvK5KFzloS
X-Gm-Message-State: AOJu0YxCbsYjgbqRh9lbTFwjFlOdRB37abwOE1t71wyp2nk9xqBCLE4j
	9U7e0YJEdmzmqbypMQWvzU9cs0GOesA0ykMNp+DoIjEgTvkUgRK+oZmcMU4RoKw9b9Ndr5xGPgx
	c
X-Google-Smtp-Source: AGHT+IGj+UE8G0HVTDHdCUbl29prb4ONTWaT9uo/5Qz8erSSEfpsmGILgj09Cxg2uVRGJmFetd2qXw==
X-Received: by 2002:a05:6871:ca07:b0:25e:b8ca:4b5 with SMTP id 586e51a60fabf-2605273479fmr252200fac.4.1720725354974;
        Thu, 11 Jul 2024 12:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa083bbcsm1826670fac.26.2024.07.11.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:15:54 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>
Subject: [PATCH v4 0/3] iio: adc: ad4695: new driver for AD4695 and similar ADCs
Date: Thu, 11 Jul 2024 14:15:40 -0500
Message-ID: <20240711-iio-adc-ad4695-v4-0-c31621113b57@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.0
Content-Transfer-Encoding: 8bit

This is adding DT bindings and a new driver for the AD4695 and similar
devices. The plan is to implement quite a few more features, but this
is a complex chip so we're spreading out the work. To start with, we
have a reasonably complete DT binding and a very basic driver.

This work is being done in collaboration with Analog Devices Inc.,
hence they listed as maintainers rather than me. The code has been
tested on a ZedBoard with an EVAL-AD4696FMCZ using the internal LDO,
an external reference and a variety of input channel configurations.

---
Changes in v4:
* Link to v3: https://lore.kernel.org/r/20240624-iio-adc-ad4695-v3-0-a22c302f06bf@baylibre.com

  [PATCH 1/3]
  * Picked up Conor's reviewed-by tag.

  [PATCH 2/3]
  * moved dt-bindings #include
  * don't initialize mask/val to 0
  * remove xfer[0].bits_per_word = 8;
  * reduce duplicate code in ad4695_read_one_sample()
  * pass st instead of indio_dev to ad4695_parse_channel_cfg()

  [PATCH 3/3]
  * none

Changes in v3:
* Dropped "dt-bindings: iio: adc: add common-mode-channel dependency"
  patch.
* Link to v2: https://lore.kernel.org/r/20240617-iio-adc-ad4695-v2-0-63ef6583f25d@baylibre.com

  [PATCH 1/3]
  * Change interrupts to be per pin instead of per signal.
  * Drop diff-channels and single-channel properties.
  * Odd numbered pins added to common-mode-channel property enum.
  * REFGND and COM values changed to avoid confusion with pin numbers.
  * Add inX-supply properties for odd numbed input pins.

  [PATCH 2/3]
  * always include all channels, not just ones customized in DT
  * rework channel fwnode parsing for DT changes

  [PATCH 3/3]
  * Rework DT examples for DT bindings changes

Changes in v2:
* Link to v1: https://lore.kernel.org/r/20240612-iio-adc-ad4695-v1-0-6a4ed251fc86@baylibre.com

  [PATCH 1/4]
  * New patch
  * Depends on recently applied patch
    https://lore.kernel.org/linux-iio/20240607-ad4111-v7-1-97e3855900a0@analog.com/

  [PATCH 2/4]
  * Drop *-wlcsp compatible strings
  * Don't use fallback compatible strings
  * Reword supply descriptions
  * Use standard channel properties instead of adi,pin-pairing
  * Fix unnecessary | character
  * Fix missing blank line
  * Add header file with common mode channel macros

  [PATCH 3/4]
  * rework register definition macros
  * remove code structure comments at top level
  * remove simple wrapper functions around regmap functions
  * rework channel fwnode parsing for DT changes
  * fix missing return value check

  [PATCH 4/4]
  * Rework DT examples for DT bindings changes
  * Fix wrong MAINTAINERS update

---
David Lechner (3):
      dt-bindings: iio: adc: add AD4695 and similar ADCs
      iio: adc: ad4695: Add driver for AD4695 and similar ADCs
      Documentation: iio: Document ad4695 driver

 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    | 256 ++++++++
 Documentation/iio/ad4695.rst                       | 155 +++++
 Documentation/iio/index.rst                        |   1 +
 MAINTAINERS                                        |  12 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ad4695.c                           | 719 +++++++++++++++++++++
 include/dt-bindings/iio/adi,ad4695.h               |   9 +
 8 files changed, 1164 insertions(+)
---
base-commit: 986da024b99a72e64f6bdb3f3f0e52af024b1f50
change-id: 20240517-iio-adc-ad4695-ef72b2a2cf88

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


