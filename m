Return-Path: <linux-doc+bounces-24817-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB3971C94
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 16:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD3011F22A5F
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 14:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B811BA28F;
	Mon,  9 Sep 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eAI6SxVu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF81BA892
	for <linux-doc@vger.kernel.org>; Mon,  9 Sep 2024 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892257; cv=none; b=S27f1bjC0cELJDZtRY+6uPwZvQS/b9Fx/GJq/WrolXJcGeNRy2jcpOuEUQYycjktqrejXGbLJhQPLjP+hI6Y9Q49rWcOglrHKxeMiVeixfEVTyvcWyFnQTzV9x3C7QOrdLwWZswfCUA/+e4iiIh4RStYXRxo46o/WiuwqpQCTF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892257; c=relaxed/simple;
	bh=DW04yH0XU139TSLbJbJ4pR8NkfNv08nuuKOMX7q12VI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oSKGRnPjsKoZqphknJFZi1LnSCZuo1FaAVH2yAdhPwyDRfa0nDHCDesTMmAj2OYgsQqKtA23LCLJUIOxNv9jDGyaxbtLZtwLNPDWxZrw2bZy71Y42Ws2gV+Sk4QuAAVziMdH0YWUpilXYbNo4pzH+dSKSBpMEpE9DiVAs1XUt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eAI6SxVu; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6c3551ce5c9so47920946d6.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725892254; x=1726497054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKIrdqEGuviqafDylOOcfJwZmeUjt0cKiabCw9KBNZQ=;
        b=eAI6SxVuNZWd6KuOqKdcIeLiP4WsL7SUcckZnIb+mN5XI5ZP/Pqdeiv991MiyILnfU
         +GMajQmAD33pux8itUQO8hJXqvptkXBZwmMgo78e5v78q8YpXrUciLta+3zFhi2NLxQs
         L+XYELGteT60RyUBitXzropqzPjuxgQLtPKK1+01T1TJex8/9ZiO3u4j6wvPBP1mLWVz
         nmUS2wUHQPGVmF0v/08BobYhtcYrAk/ATX+G49V5TPv7In6q19fq6G9A5rJW4h3RlaxQ
         n9cpBXFuvRV7W4K3A/+zqWM+wtMPkLIgkrw/J6y2tkoECvxuQ1ZBLx7kjo4WIVIsKWUg
         M3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892254; x=1726497054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKIrdqEGuviqafDylOOcfJwZmeUjt0cKiabCw9KBNZQ=;
        b=bCEoYV7chIFdB2emIdTG9M9TcZ2PejS8z8Vtm2GHzGVbNohEKAREXZbGMpk6Eue44T
         GLM9tkRIzEqth6h8DacrcoggDW8t5Grv+Yi3eDNfYDNx8VJ6YUUPBjzBlL2ZWWtkamyI
         U5QvM7wc1Iln4oklcn9geOk7773rbbdsXprnZXyhpB3H4qdwIdTWUTS5JFy7UoOJ2BZm
         1uf40Pg0E1ru8SQD5u2vnA4pgBC4ZjA5ZV+pecGAw3nfwHFYnOs7mZI2R7EdgYPwOPTL
         Ps+InimUHUl1tTaAX9MHDwWEZ4n6FKTBAQUhXZK5D5g2AKfAidV97qKdi9tsIVnyx7lk
         Nz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiyhP8+nPaOY2D4NlXoVUUv7avUrfCrVW6vY3tAMlgXsrc8eX0bH+zZ8BrD0YakC7mRfhx/Oy12YY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8e3Bf0npENQgUO15Uafmws91vOldb2XPIadv4ImYLs3lFvRIV
	gT2YI0ewCznmSgaiix2poUd+yE0T/W3aCJ/otds5zRw3tQwAnrfPaRlavNdI1zE=
X-Google-Smtp-Source: AGHT+IF+g9jRLqDZGgb760Cz9sXF4yDHvHfvuizV4gwK1fPzXWtkTWlteY/AmZp8QG9S7mSbFWaf1A==
X-Received: by 2002:a05:6214:d05:b0:6b0:8ac1:26bc with SMTP id 6a1803df08f44-6c518efc45emr311335196d6.14.1725892253587;
        Mon, 09 Sep 2024 07:30:53 -0700 (PDT)
Received: from [127.0.1.1] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c534339987sm21385406d6.33.2024.09.09.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:30:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v5 0/3] iio: adc: add new ad7625 driver
Date: Mon, 09 Sep 2024 10:30:46 -0400
Message-Id: <20240909-ad7625_r1-v5-0-60a397768b25@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcG32YC/23MTWrDMBCG4asEreuiGXksOavcI5Sin1EiSO0gB
 1NjfPfKgRInZPkN87yzGDgnHsR+N4vMYxpS35VBHzvhz7Y7cZVC2QIl1lIrWdmgG6TvDFUjA2i
 2aFoyovxfM8f0e28dv8o+p+HW5+meHmG9/ldgUxmhKlHgyJEsWtcenJ0uyWX+9P2PWEMjPrCR7
 RZjwdEQa+uNApJvsNpgeMKqYE2BELTXjaM3uH7gVtZbXK/YOK9DdOjUK16W5Q8N2IxfXAEAAA=
 =
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
 Trevor Gamblin <tgamblin@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1

This series adds a new driver for the Analog Devices Inc. AD7625,
AD7626, AD7960, and AD7961. These chips are part of a family of
LVDS-based SAR ADCs. The initial driver implementation does not support
the devices' self-clocked mode, although that can be added later.

The devices make use of two offset PWM signals, one to trigger
conversions and the other as a burst signal for transferring data to the
host. These rely on the new PWM waveform functionality being
reviewed in [1] and also available at [2].

This work is being done by BayLibre and on behalf of Analog Devices
Inc., hence the maintainers are @analog.com.

Special thanks to David Lechner for his guidance and reviews.

[1]: https://lore.kernel.org/linux-pwm/cover.1722261050.git.u.kleine-koenig@baylibre.com
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/log/?h=pwm/chardev

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Changes in v5:
- Link to v4: https://lore.kernel.org/r/20240904-ad7625_r1-v4-0-78bc7dfb2b35@baylibre.com

  [PATCH 1/3]
  - Picked up Reviewed-by tag from Conor, missed in v4

  [PATCH 2/3]
  - Make frequency values in ad7625_set_sampling_freq() u32 and make
    struct members match. Also do the same for 'target' variable
  - Use DIV_ROUND_CLOSEST() and DIV_ROUND_UP() instead of ULL variants
  - Change occurrences of sample_rate to sample_freq to be more
    consistent throughout driver
  - Picked up Nuno's Reviewed-by tag

  [PATCH 3/3]
  - No change

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20240819-ad7625_r1-v3-0-75d5217c76b5@baylibre.com
- Rebase on top of latest pwm/chardev branch at:
  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/log/?h=pwm/chardev

  [PATCH 1/3]
  - No change

  [PATCH 2/3]
  - Add 'depends on PWM' under 'CONFIG AD7625' in
    drivers/iio/adc/Kconfig, based on v3 discussions
  - Cleanup whitespace usage in Kconfig, bandwidth logic to match
    Jonathan's suggestions

  [PATCH 3/3]
  - No change

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20240809-ad7625_r1-v2-0-f85e7ac83150@baylibre.com
  
  [PATCH 1/3]
  - Add gpio bindings header, en0-gpios and en1-gpios to binding example
  - Remove unnecessary comments

  [PATCH 2/3]
  - No change

  [PATCH 3/3]
  - No change

Changes in v2:
- Link to v1 (marked as RFC): https://lore.kernel.org/r/20240731-ad7625_r1-v1-0-a1efef5a2ab9@baylibre.com
- Include link to required PWM patch series in cover letter (missing before)
- Include new link to the pwm/chardev branch of Uwe's kernel tree
  
  [PATCH 1/3]
  - Rework dt bindings to be compliant using make dt_binding_check
  - Add "adi,no-dco" flag to address indication of how DCO lines are
    configured
  - Fix binding patch message
  - Remove chip packaging info from binding description
  - Move comments around to be clearer

  [PATCH 2/3]
  - Remove ad7625_pwm_disable(), call pwm_disable() directly
  - Add ad7625_buffer_preenable() and ad7625_buffer_postdisable()
    functions
  - Add devm_ad7625_regulator_setup() function, move all regulator logic
    to it, consolidate the comment blocks related to it above
  - Add have_refin flag in ad7625_state struct
  - Add pwm_waveform structs to ad7625_state struct for storing
    requested waveform characteristics
  - Refactor ad7625_set_sampling_freq() to set the pwm_waveform struct
    values in ad7625_state, limiting PWM enable/disable to
    preenable/postdisable functions
  - Remove redundant dev_err_probe() after devm_ad7625_pwm_get()
  - Use device_property_read_bool() instead of device_property_present()
  - General alignment and line wrapping fixes

  [PATCH 3/3]
  - No change

---
Trevor Gamblin (3):
      dt-bindings: iio: adc: add AD762x/AD796x ADCs
      iio: adc: ad7625: add driver
      docs: iio: new docs for ad7625 driver

 .../devicetree/bindings/iio/adc/adi,ad7625.yaml    | 176 ++++++
 Documentation/iio/ad7625.rst                       |  91 +++
 MAINTAINERS                                        |  11 +
 drivers/iio/adc/Kconfig                            |  16 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ad7625.c                           | 684 +++++++++++++++++++++
 6 files changed, 979 insertions(+)
---
base-commit: 1ebd3850421749eb44bd040b249bd4db88d35b33
change-id: 20240730-ad7625_r1-60d17ea28958

Best regards,
-- 
Trevor Gamblin <tgamblin@baylibre.com>


