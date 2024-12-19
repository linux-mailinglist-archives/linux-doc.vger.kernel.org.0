Return-Path: <linux-doc+bounces-33333-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C59F7EF7
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 17:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5A01188F12D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71C4226864;
	Thu, 19 Dec 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s+iYf4Ht"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F767226173
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624682; cv=none; b=lcpvwqapvN06wtoUNi5EVdcdXqxA8MMPsH4xI7Jjw7q2wRbVvjf37m2GjCpc6ywnsIwXjRjbpGehLafzaCbPvof4am2Hy5XSRbXEQy4hLiGsrWA6HX2gQlxbS1BqVGEBTT0JRSQwrdVbEZ8kX5dJXRok2DE8rg/2cMdKnAij/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624682; c=relaxed/simple;
	bh=TuSLnfytoiZKQrGa0aVZTwnSTT1o3V/5YIhyblbFV+E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G6y5tD8bgdxyL5W02ypLPe3XG1Pc0wgzwkze+IaTHaVo7+P7ssOx28SotvUAkDG5NRvVRX3K1m6gl0hQBlmOD5HM6XVNR/WqL/ZHOZKfwDMTGug84OPj8Nzj6SALWLxLoYX9IhtgzOE3gON4TIw4CPAWu+jKD49VRGdksX1YRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s+iYf4Ht; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso7206555e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734624679; x=1735229479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idL1KayfOK5+HUGE3XGnDILC4Z4s3dG5NEY4/7eehpE=;
        b=s+iYf4HtfIFZRxbUAzy1IsssG8adv5E40uKHmXj7Hh2ehrNUZsYfUyYCQU9DetlGF2
         JYrC8xgn6kx7B27aKEwmcACEXAlnUSbmoB3VGtz/wEGnSr6ZAUZsmAz1TlBJx9ptNmtS
         7BnpmyYMTXfIJzPJ+GUXhbItPdE2w2b6MRODnCKrbt6ECTuvGxJKbiBicBtvoyouL0oM
         Gu4VT1AVZWFw/0w5mKEUUDHpsmmt03AL7VMTIcUG2JQx82gbbxx1SsfebNQCyzzpjRu4
         xG9PH1XD6VJO+HcapbJpzyc+p1UTJRhI0MNJwHEUIiw75s+evBkghuAxBErCcP5riGil
         MoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624679; x=1735229479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idL1KayfOK5+HUGE3XGnDILC4Z4s3dG5NEY4/7eehpE=;
        b=REjqDUwM/l4u8ZRLVhmMceV5HFNA3TWb4M+A0YgIQXN4brgUMMz9IsJ8JjOFmCpRwk
         GHPIZqtZrrTeZl5EJ50bkkF5jzuSx3EZige3cLgJ6qOhy8xBNXxKGZckSYsVhlauAv0D
         AgkwjVrHBI6hcIZ0UiNtHR5W9/lvCwAoFKr+tSU450RwhFvSHN4OFnCQlIp1Wh3S00zd
         boUWlM+KEB+dII/Z3VS6XXUeVeG6LRgDNNxDxfi+7b+1NqAM6A287/IrLjGtvIp11mIw
         78RMx4QsbXy3TfRlC4FRKTIzdA5lFNOf0/Gpd3V5CRaXhM5jnbpNw9GIfSaEoHD67+gy
         8SFw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUcgBqxR/XZqWmiHNvfCEP4yXvXfMVdoeTshuAJQJbroROxdppao3aMItbcmhE77rcS3cmacD+qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAFNT4UqSEJI00Ph+N9ym/emkBarW/YHMFt2ogwPWK9NOQoKup
	M0xDM24nNLbmyiHER/GfRlr1DxNuiSWD43IIuiaudiAnDk/2ZMcBOLJEtzKmcJ4=
X-Gm-Gg: ASbGncs7Bk498j0XQv3Q0h96J9il3eHssYO+a0GvpMOUILeY9CFZL54tb+89rX2L+2B
	2ekr60qlaNxcUTenE6fA2tImx4MMc/2yj9WihFGeFVXPcGGMC76hJLcIKuMbFE5iIyar7Gh4Cxs
	Qp+571Pi9SYtzrg5F4loEGN7yl+Dh3xzo4oFm0ABqK3FqEf00sZ6Ikmzd4XmBg7RKKlF6fY90Cd
	ZjoVG/rLhEG8g5BiUgSKjXXJFb436dM88159jlph0bb82tF9N50Ds5E/TE8pS8gWR8h3Is9mc5s
	nDZ3x7oiskQLmSzXWPifcbA3z6r+Msyp3GsiEg==
X-Google-Smtp-Source: AGHT+IGw3sHfdibR6Vlt2PKJZSRjrXSSMm2zF9L0IzRyvk5Mt96c+3CNucl27O4rMyt0yOWSoTsQ5w==
X-Received: by 2002:a05:600c:3c97:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-4365c793e01mr36946255e9.18.1734624678467;
        Thu, 19 Dec 2024 08:11:18 -0800 (PST)
Received: from [127.0.0.1] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm57526225e9.33.2024.12.19.08.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 08:11:18 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Subject: [PATCH v2 0/6] iio: adc: ad4030: new driver for AD4030 and similar
 ADCs
Date: Thu, 19 Dec 2024 17:10:35 +0100
Message-Id: <20241219-eblanc-ad4630_v1-v2-0-f36e55907bf5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtFZGcC/32NywrCMBBFf0WyNjJ5mLSu/A8pksfUBmoriRRL6
 b+bFjeCFWZzLpwzE0kYAyZy2k0k4hBS6LsMfL8jrjHdDWnwmQkHLkFxSdG2pnPUeKkEXAdGmQE
 todRoS0ay9ohYh9eavFSZm5CefRzXDwNb1j+xfECVN0pLx4SVeLZmbIONeHD9fcl/XL3h1t6BY
 uC4sPDbLTjfcI9OFbUQXNfef7vVPM9vY5bosisBAAA=
X-Change-ID: 20240624-eblanc-ad4630_v1-1a074097eb91
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

This is adding DT bindings and a new driver for AD4030, AD4630 and
AD4632 ADCs.

This work is being done in collaboration with Analog Devices Inc.,
hence they are listed as maintainers rather than me.

The code has been tested on a Zedboard with an EVAL-AD4030-24FMCZ,
an EVAL-AD4630-24FMCZ and an EVAL-AD4630-16FMCZ. As there is no eval
board for AD4632 the support can't be tested at the moment. The main
difference is the reduced throughput.

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
Changes since RFC:
- Reorder IIO channels to have the common byte channel next to its differential
  channel.
- Extended names for IIO channels.
- Diffrential data channels are marked as differential channels on IIO
  side.
- Use get/put_unaligned_be24 for offset and sign extend it.
- Common byte channel now has 32 realbits. This will be the same as what the
  FPGA will return, avoiding different channel layouts.
- Fix missing newline in some error messages.
- Add comment for the use of spi_sync_transfer instead of
  spi_write_then_read in ad4030_spi_read.
- Use DMA safe buffers for regmap operations.
- Clarify calculation for number of bytes to read from the device during
  conversion.
- Formating fixes.
- Add documentation page.
- Link to RFC: https://lore.kernel.org/r/20240627-eblanc-ad4630_v1-v1-0-fdc0610c23b0@baylibre.com

Changes since V1:

The most important change is the use of the RFC's IIO channel layout as it's
the most space efficient compared to the V1. In the event of a future DMA
enabled version using the ADI's SPI Engine, the IIO channel layout would be
different anyway. The V1 layout had a more logical ordering of the IIO
channels but since we are using labels in this version, there is no reason
to keep it.

- Use REGMAP instead of REGMAP_SPI in Kconfig
- Select IIO_TRIGGERED_BUFFER in Kconfig
- Use layout with the differential channels first then the common byte channels.
- Flatten rx_data union/struct layout
- Use get/put_unaligned_beXX
- Scale read is done without requiring direct mode
- Grade check is just a warning now
- Use label instead of extend names
- Use IIO_VAL_INT_PLUS_NANO for gain values
- Discard out of bounds values when setting oversampling ratio
- Merge AD4030_OUT_DATA_MD_(16|24)_DIFF together
- Use iio_chan_spec channel field to avoid maths in several places
- Fix typos and formating
- Link to v1: https://lore.kernel.org/r/20240822-eblanc-ad4630_v1-v1-0-5c68f3327fdd@baylibre.com

---
Esteban Blanc (6):
      dt-bindings: iio: adc: add ADI ad4030, ad4630 and ad4632
      iio: adc: ad4030: add driver for ad4030-24
      iio: adc: ad4030: add averaging support
      iio: adc: ad4030: add support for ad4630-24 and ad4630-16
      iio: adc: ad4030: add support for ad4632-16 and ad4632-24
      docs: iio: ad4030: add documentation

 .../devicetree/bindings/iio/adc/adi,ad4030.yaml    |  111 ++
 Documentation/iio/ad4030.rst                       |  181 +++
 Documentation/iio/index.rst                        |    1 +
 MAINTAINERS                                        |   11 +
 drivers/iio/adc/Kconfig                            |   14 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/ad4030.c                           | 1233 ++++++++++++++++++++
 7 files changed, 1552 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20240624-eblanc-ad4630_v1-1a074097eb91

Best regards,
-- 
Esteban Blanc <eblanc@baylibre.com>


