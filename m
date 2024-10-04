Return-Path: <linux-doc+bounces-26548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995A991192
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 23:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12F9284D04
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 21:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E301494B2;
	Fri,  4 Oct 2024 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GlYEXU9S"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94F1482ED
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078529; cv=none; b=FLHAxlPE0T31JLLTIqLvIXzZi8PB0afT5NCMBJg0u2Y0xM1yhTRYH13ZEIbGvkOSMHJcdVcFWQCLZiOmYXyiUBs4kTbTn44dHUZ5m1LclMvXLqCAO39fcB6YKnO5QUEUS137N/HpW/I9Ik4HEP/I4IHOTivcFj06a24yysQzS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078529; c=relaxed/simple;
	bh=zFpgcIuqoenyNlQE/aHsCbGiVbTdVhcBJPWAbhMG3SU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vDtkgE9Pc+0RocCORSvzvtDyhzA7oRsHE/ruhwq/7oghNS8W422gfw5IO5OMXvYVNyI+QhhB7Of8geq8J4xjYxMUWKhO/3QbH7SqLd4/J6sI0jk2Yg2rItymZbkcJbbGvNJLLmhi+MimCMqn3KTetwSFyZDFnxXgaaJhKtDX3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GlYEXU9S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cc8782869so25280395e9.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2024 14:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728078525; x=1728683325; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y4aWX4UAS+QJNvia9LPa4Lp44elas/J+HLIUy4MVC8=;
        b=GlYEXU9SUJFORgka6pbjA94FEoy3MOyE3Wep7XiDoSdVrPYC4V6RHhrizodrnku030
         dbpbTFhvoozIPemVI2moNr17qSgf6Z0OaxwwfKdt5bm1bQl+wdn5oJ2OMDPrPWWZMSDW
         XDtkosENnhLvVmAZIN6vNjnJA4s+5OFE9L4zeYGmfn3kwbDu6fgCsZ0I/3cNfuW5E/Wa
         rZ4bynAsJzzTL36jCnOTwKXebdOX0c5Uz9zfCKD26PpkhF2N+fPzEatdg/ag6LhXtrnA
         uPsqu08S/wuldAWdAklb1uPzrBcB0CsW7T3oKei5tCJy3E5TDOaXnX8t6Wqe660AeVRJ
         +tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078525; x=1728683325;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y4aWX4UAS+QJNvia9LPa4Lp44elas/J+HLIUy4MVC8=;
        b=U8kFWBwv+qKXkNCF4SLikn1kqKLskYPA8cbUAL1GANCZejldHkC3fxH2KM68zkO8G+
         38CijGDyUJ3kOeWmuG7V3J7csUngFp+pokEN9doueyKUShyYl7hB9kkPxul06hPY8vRq
         xtRDEGGB4xUIb5yl+zNqcSIJNlKYuLqYgQ/m3xRhUcZKJtp7gRAdA7cvxMCfrIItoU+Z
         E5qGShFPrr+ADgGV5v8piQ4u4wAAo5/WoBmf3cAO59qGguDeC8SdYsYx1nQll9QwtyiU
         IaFQs1qEhuOxoQ7cb2DcWg8XNcupEszxe/zBJfCUC138P6p1LsYDvcoVDtzpfBkJNH6q
         jFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs5mAry0umGDKgT1333dpHr+iiYWufcxWPPay2mJijEq6hJmaFaq71C0vA6iP7fjyE9V2XaIKLEnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8YXLsnN+I5wkGm3QLcOvvEnrpZzvasu7WMFBZBym3K1Us8qJF
	JSuDPdz3Kwx3oWvqxGugr7DzWOIcp3WNWrQa6FjkFRs52VUrfEEhKlq+kEFp7U4=
X-Google-Smtp-Source: AGHT+IH79aFugt4x/zgrahv1rI3QL8UINcFz53Bt3xgDaVehp40xSvLlbsbRBY9UntBlYurRa0HrTA==
X-Received: by 2002:a05:600c:6048:b0:42c:df54:1908 with SMTP id 5b1f17b1804b1-42f85ab7dffmr31315505e9.18.1728078524982;
        Fri, 04 Oct 2024 14:48:44 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4ab63sm24680375e9.40.2024.10.04.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:48:43 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Subject: [PATCH v3 00/10] Add iio backend compatibility for ad7606
Date: Fri, 04 Oct 2024 21:48:34 +0000
Message-Id: <20241004-ad7606_add_iio_backend_support-v3-0-38757012ce82@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJiAGcC/4XOwW7DIBAE0F+JOJdqWbCxc+p/VJW1mKVBbYwLj
 tUo8r+XOodKveQ4c3gzN1E4Ry7ieLiJzGssMU016KeDGE80vbOMvmaBgAYsNpK8baEdyPshxjQ
 4Gj948kO5zHPKixwNKA0NtT0aUZE5c4jf+8Dr2z1n/rrUneVeCkeF5ZjO57jU3UaDDdr4NnDoQ
 u+NIsVdMKHRyMYBWWaDKH6tUyxLytf9+6p2bL/ZqYc3VyVBjkyalXKKyLw4un5Gl/m5Xtn1Ff/
 EHuGhiFUEtp3tkNh6+Cdu2/YDU7VU8m0BAAA=
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 aardelean@baylibre.com, dlechner@baylibre.com, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728078523; l=4710;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=zFpgcIuqoenyNlQE/aHsCbGiVbTdVhcBJPWAbhMG3SU=;
 b=HRzjEBEjnxHZUYdTZ8EEN+AGrc1nr6DyAfSFPwL8OuMDAd6/rsY9fcAnX77lg4AV+Svq5eyiO
 aMvuAY7a3xBDHq+lSPwMYFpZA8vMR63VFjuSkKekmSvINf78NwOWZUu
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

This series aims to add iio backend support for AD7606X ADCs.

In a nutshell, iio backend is a paradigm to shift the logic establishing
the connexion between iio buffers and backend buffers into the backend's
driver.  This provides a more stable programming interface to the driver
developers, and give more flexibility in the way the hardware communicates.

The support will be first added on AD7606B, and on next patches AD7606C16
and AD7606C18 will be added.  The series have been tested on a Zedboard,
using the latest HDL available, i.e
https://github.com/analogdevicesinc/hdl/commit/7d0a4cee1b5fa403f175af513d7eb804c3bd75d0
and an AD7606B FMCZ EKV.  This HDL handles both the conversion trigger
(through a PWM), and the end of conversion interruption, and is compatible
with axi-adc, which is "iio-backendable".

More information about this HDL design can be found at:
https://wiki.analog.com/resources/eval/user-guides/ad7606x-fmc/hdl

The support is thus separated in two parts:

- PWM support was first added.  My first intention was to make it available
  for any version of the driver, but the time required to handle the
  interruption is not neglectable, and I saw drifts that would eventually
  cause an overlapping SPI read with a new conversion trigger, whith
  catastrphic consequences. To mitigate this, CRC check must be
  implemented, but indeed increasing the samplerate causes more sample to
  be lost.  Therefore, I decided to only allow PWM for iio-backend
  powered device as a first intention, leaving open the possibility to
  add the general compatibility afterwards.

- IIO backend support was added: Once the PWM support was ready, the driver
  can be extended to iio-backend. The iio-backend powered version of the
  driver is a platform driver, and an exemple devicetree node is available
  in the bindings.

The following features will be added in subsequent patch series:
 - software mode for iio backend
 - 18 bits mode (AD7606C18)
 - single read (IIO_CHAN_READ_RAW)

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
Changes in v3:
- Rebase on top of the series adding ad7606C16 and AD7606C18 support.
- Addition of pwm-names actual values and improvement in the
  description.
- Introduction of .num_adc_channels field in ad7606_chip_info that
  defines the number of hardware inputs.
- Introduction of ad7606_bus_info which couples hardware and wiring
  informations.
- Addition of a delay in the scan_direct function for the backend.
- Link to v2: https://lore.kernel.org/r/20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com

Changes in v2:
- Logical change in dt-bindings, using a flag for the interface instead of
  infering it from the value of the "reg" property.
- Removal of get_platform_match_data addition, instead the logic is
  directly used in the file.
- Removal of use and export of pwm_get_state_hw, returning the configured
  frequency instead of the running one.
- Correction on various typos, whitespaces, bad order of includes.
- Separation of SPI conditions and PWM disabling for no backend in other
  commits.
- Link to v1: https://lore.kernel.org/r/20240815-ad7606_add_iio_backend_support-v1-0-cea3e11b1aa4@baylibre.com

---
Guillaume Stols (10):
      iio: adc: ad7606: Fix typo in the driver name
      dt-bindings: iio: adc: ad7606: Remove spi-cpha from required
      dt-bindings: iio: adc: ad7606: Add iio backend bindings
      Documentation: iio: Document ad7606 driver
      iio: adc: ad7606: Sort includes in alphabetical order
      iio: adc: ad7606: Add PWM support for conversion trigger
      iio: adc: ad7606: Add compatibility to fw_nodes
      iio: adc: ad7606: Introduce num_adc_channels
      iio: adc: ad7606: Add iio-backend support
      iio: adc: ad7606: Disable PWM usage for non backend version

 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  72 ++-
 Documentation/iio/ad7606.rst                       | 145 ++++++
 Documentation/iio/index.rst                        |   1 +
 MAINTAINERS                                        |   1 +
 drivers/iio/adc/Kconfig                            |   4 +-
 drivers/iio/adc/ad7606.c                           | 576 +++++++++++++++------
 drivers/iio/adc/ad7606.h                           |  51 +-
 drivers/iio/adc/ad7606_par.c                       | 130 ++++-
 drivers/iio/adc/ad7606_spi.c                       | 104 ++--
 9 files changed, 847 insertions(+), 237 deletions(-)
---
base-commit: 35307f34d6fef8f9d41a1e8f4f532e4b0a7ee422
change-id: 20240725-ad7606_add_iio_backend_support-c401305a6924

Best regards,
--
Guillaume Stols <gstols@baylibre.com>


