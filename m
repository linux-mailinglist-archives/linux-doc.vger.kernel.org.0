Return-Path: <linux-doc+bounces-19312-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 309EF915979
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jun 2024 00:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A598A1F23233
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 22:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940171A0B15;
	Mon, 24 Jun 2024 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bRFVVky6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CE13C901
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719266523; cv=none; b=J/Le/25EpVo+yJhkoTg9Bvo+E5RAZcmmdxGNklHFRT9WymgwffNG085k/N38kgyjhiRU5Fw6jQWQ3D2qSu3+XExivY8b5nQjppUHgrPfH1M4yqEUzoiIYd6kZ6FCvMBZq69Epeqwm8EN2g0rFS9Tb1/KpiyYMIeMFmCDVkQQ3d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719266523; c=relaxed/simple;
	bh=n5FQXk1WB5JJ6pZZskH6WlcxMaIUttY4BopCnZKimzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S2pYkkSZmKdRQ3R1RCW75WGpZcrPqyBUEKw7XleWr2cs8j0RAxFuUFX9nX6eaH8w0AtLblN0UfsvFHUKnd4Yj856Cy6F7ZUX3n7OnTiJQZFuA1Wvojo4WwUzumOWBeXNNk5Yk6Fehx0IrAfzS66RIXyzD9530jcxLgp1Joce4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bRFVVky6; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6f9c1902459so2312880a34.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719266520; x=1719871320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7S2Xt5WtGNhUlxhZw+4YWcLwk4AB1VXmLcJ0MqwWdI=;
        b=bRFVVky6DwQmrLpGUbSFSXy3ZKTOSncHzicYZgIhwMs2lzet/a6MywUWFHIaSgno9F
         QbO5JJGnn/0tfRfA0Ua6eMnLLwAfpIJuZIdaPb80NMCoYN/OU1MBgY197YE7nZpht1n3
         SNrhsN9Elh4sPjmx/sG4KzdPpKNQ8+V6y3qBQ6MG2f1cwGMc0aBw72xIdJ5MSwx+XOu4
         krLdNAmMC0ShXWiGVChaaI4vAsCCjlU+x2jSZsk8knxT+ID4QaVD0gUwuh8NNmmYstm6
         jYs99/kXuZ8jNAMqgTeaiDh1xUIxEYi7TK2ZCD+ZuShqttDUYx/FJxkhzuZpMSGboYdx
         S3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719266520; x=1719871320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7S2Xt5WtGNhUlxhZw+4YWcLwk4AB1VXmLcJ0MqwWdI=;
        b=ZT0hPpDkVmoZ6lXufhkYFxykZQ1kzZYvm0oS0NyvMWBhNxinKnXp9PFfINIVVmmy7F
         biWq3ODFS5/sVT8q1KmodRlvTh4UmT/X/R4dao38VPlCPlFAF2hk5e5ADq66+Wowl83x
         muD7N6Ou5MocC8qIdBe/Xs/ySRizKret7ry3o1HNdmLbtdjWPWwWY/ym0yoGJKyy+cK8
         SKSt4QO54qfDCWJf7jZDfbbBrUECFw5wXsFhDEljhjOjAwx7Rr39DbUtpO5lwdXFwICy
         EOw7crbGaudrpqOih2iURITr3gcZzZ9cDzZdgUsL4X0pMmb6NOituWu9tqFhtomaEelf
         Ia4A==
X-Forwarded-Encrypted: i=1; AJvYcCWKzZ4u/XJV9mkz/Z0QQya+CmDbcsg9qJKLAr97Pe6SbT1cQUi7bAhWRHcVW2RIiugXr6fii0Lb/H74utZ5XsCKABSs5vRgYUbk
X-Gm-Message-State: AOJu0YzwNpsEFYUgZCNOdx7CUf3hMt6ihb5UT1VKPlqCji42wJLYooeE
	CUC/8GaBcbYpxqhlGBv6DUxrXvuYrOpBbtFakOWlQ751s6ydTftkgN3V3AKlsW8=
X-Google-Smtp-Source: AGHT+IHjPxAxW+HZeNBChWdpJqMvtLR+lzuhdUadb1ahs0oYK6bKcvdQnrAWe4MvQSEvluRyVvF57A==
X-Received: by 2002:a05:6871:587:b0:254:b91b:ad52 with SMTP id 586e51a60fabf-25d06e57b70mr6405531fac.45.1719266519966;
        Mon, 24 Jun 2024 15:01:59 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4941c9esm2116921fac.4.2024.06.24.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 15:01:59 -0700 (PDT)
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
	Ramona Gradinariu <ramona.gradinariu@analog.com>
Subject: [PATCH v3 0/3] iio: adc: ad4695: new driver for AD4695 and similar ADCs
Date: Mon, 24 Jun 2024 17:01:52 -0500
Message-ID: <20240624-iio-adc-ad4695-v3-0-a22c302f06bf@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
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

* Link to v1: https://lore.kernel.org/r/20240612-iio-adc-ad4695-v1-0-6a4ed251fc86@baylibre.com

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
 drivers/iio/adc/ad4695.c                           | 730 +++++++++++++++++++++
 include/dt-bindings/iio/adi,ad4695.h               |   9 +
 8 files changed, 1175 insertions(+)
---
base-commit: 2dfa1b7bfc07e58acb9f9eaa8c871f37189dbfee
change-id: 20240517-iio-adc-ad4695-ef72b2a2cf88

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


