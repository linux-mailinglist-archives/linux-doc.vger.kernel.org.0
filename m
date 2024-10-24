Return-Path: <linux-doc+bounces-28547-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27B29AEF4B
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 20:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A171C21B25
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 18:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1CD200CAE;
	Thu, 24 Oct 2024 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wacLMw9N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B9200BBE
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793467; cv=none; b=Ihv8H89AN3MmnzNIHKxAdmw9j/XBzVj9rxbIMJwIvsLxz6I29NsIT4RyMyphK12mzL3ErIjws9E3/FtBqmE9ntpfDQ5BUusDucawyZRKkccjNbC9ms70ZRVKjAvAJEmUNi5BPrIJSRk0HR6CZUUopo57vshNhVT2bDjpZO0dO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793467; c=relaxed/simple;
	bh=wuUDrWGldoGzLKmEDKRB+N+oojKVOt07T8M5dyrnk6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ayG3CaPly6s6KkMrj9gPS50AKQ2fff/o5IBl+aNbvG6e4PQPrW7WpkusvmBJ34hjNZ4cyEW6KdITn++CkZK5D25EBHi3kEz2UmvBxpE0f084eHqnVn4BlcbKQYIl/L1bYTVUJ/mePkjdCCBUxs9eCKE9KxYft6YRaC8475AS+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wacLMw9N; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37f52925fc8so835691f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793462; x=1730398262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqU0yvR44kyPrUFOs9XxlTbM2CjS1kPGGNa549pruJ0=;
        b=wacLMw9NLwTcPf6/cMlDcibqMP48rL2Yw0wzUZDO12oQuFM3AFIZrJTRl9DUT4n5Xw
         ZIIgpkB70prKYJMA7U69FQ8irLUo5Gvy9MocCI0utufLYs5OSCYdByt5VapHouVF8PQ/
         zaVWWmyMLql7Dua8uM2sT5fDzLpa8Bnt3Y3HZySOS+IsFOw4GEyd1QlVe3M2Q00bTsko
         TvRh5kBOD6nFipU5n2evTNT9AA/IkMUDe53yO3jV65YtWSTrZsSanIAs7aZ54xndGI+I
         Gzw1l26Y/b7BK5I2hsHuhFuTvi8FmzcF2HmNOHPZqW+jztoemTmtG6cAyWKR+JaRY1Yr
         ZVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793462; x=1730398262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqU0yvR44kyPrUFOs9XxlTbM2CjS1kPGGNa549pruJ0=;
        b=lpFb5mgvR5BvCKdMJnvTP2bMnjv7Ye8Jl0Z5wfNmPiFGzQQbEC5BXA0LaxsHJrzdYW
         EppWCD8pwvwfsO+rYUStOWw0cd4h0VQhiHcU1Sdv2J01UgCcSifQ0rTtSn8xCEj4SPvA
         9wYMvO9RRCKvwU6pBPdXNiRE40NegrHeQn9/WOZtaLHq/j1/OGDr4gdH7OY7dsK1gQ4i
         Rj2GWAkn48jP7eaqIvZNRUWsXm0To4DxAF6Vn1X6WWPvX0FBFtnKoZ8E+VCMxjLji0iQ
         qSOWS1/kcKVVIhMcdfOFYjq4lLPvZM773PZD50pLTWZBSbGLdjXkhDZtVULcvu0YPL7O
         FDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdoifUNDjri01CoEowCUrxl+6rz00Fh7e3BsQi6f/Wo9rtP0qLe01Wh9NhQBe+7L8PV5PgqsZUWzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCT7q0ZcY/Ax6ju2wZRhqayiR+IARLFn7CRZzsk15HiV3rmUP3
	bvbN7sY5NyQdTtxvqFMacGePd743PpKDUX5ZDgG8/PygAwj3faWT4kgCbUl6j5U=
X-Google-Smtp-Source: AGHT+IFHTyuVsCBfNROuxNLrz1m+g63n0f5uKNpwbhVb79Q5e4mIsRTsMpKrKaJPjPSMD95PJpY3+A==
X-Received: by 2002:a5d:4f83:0:b0:37d:5046:571 with SMTP id ffacd0b85a97d-37efcf10dd8mr4687694f8f.22.1729793462147;
        Thu, 24 Oct 2024 11:11:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/6] hwmon: pmbus: add tps25990 efuse support
Date: Thu, 24 Oct 2024 20:10:34 +0200
Message-Id: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqNGmcC/22Py2rDMBBFf8VoXRVZb3nV/yhd6DFyBImdSoppC
 Pn3ThJoQ+nyCp3DmQtpUAs0Mg0XUmErrawLDvEykLjzywy0JNyEMy6ZY472Y+PKOUaFjCzmzAM
 wTfD7sUIuX3fV+wfuXWl9ree7eRtvr/9ItpGiyQVhQAowTr0Ff96XUOE1rgdy82z8ieXsieXIZ
 gGIR1CjEX/Y6yOqwucJz+qPst+rpuFHWWE+7T3W0jIva4VEk++eGgvGW6U0pk2Ygb7gG1C0H0q
 fBjXqlEKGbISOVgqrtWeBp6CUi2BdkCyCMBZTrt/xnE06aQEAAA==
X-Change-ID: 20240909-tps25990-34c0cff2be06
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Vaishnav Achath <vaishnav.a@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3011; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=wuUDrWGldoGzLKmEDKRB+N+oojKVOt07T8M5dyrnk6A=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2uqLyLH6b8a+08Lm5MTRQl2OMVrjsX1pGku
 PCvopCiPZeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNrgAKCRDm/A8cN/La
 hYJ1D/4hcgp6yuUvwxrHxbwvSEe4PKEWna4DpzjRu9DXprZcMDnPviwD2pKOrmS2H9tOOIqcwNP
 1PxdGl9FUuK6XYFzRzJcF5rg7YZjdK6Z/FHz3i9bs1DB5AdwHFk70oOK+WVtm6X1MBuYZno+Msg
 pKuOFg0qHXyeV9IOo5i84+qLXqDhWLFCNHUd/NfE1n1thnQwWAIsJ5wjn3EwoHA47T+su3HsXhe
 +0CioVEFXMYgoSgr3sU0Cr4QAk5n+ZuHAa9eETvbIUn74KCblHSRzVPd1GR0HboKXxrpDR9zrTA
 MyYpcAxYmB9DSw4NAfYbfX/vjN6kfZNoDRCNFOQF0yciPILVPLRIn1n6YdayWoVRTzARJ47uCX2
 2KWMwVZvu8LuKCfdW5ALIC1VuGVEqNKJKWXiwvQIla5o2u3cbt3YFxN8RDPV2liksxuOJM80OuB
 Nz5hBI+ApC+eK4gJw6vhaAWuYjnovGo3CpmkR9Zt7kEqW07U+3lZF3oWAzImMNoEAf0B44KPo6z
 ZdfJwgaO0abAXzY4nMzLM68AXlauujpvAoUR6EEWEy82xhbisoR9Byb9/+9w1+/q09SUK6ticuk
 ID59EcGjNxIU5v7sun+7YmZ2apL255cJjWohULxpUBQckVbaZoFXy1shivpYTbOGLareUrDfbIG
 qoA0ERK/u9/3ISQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds initial support for the Texas Instruments TPS25990
eFuse. The TPS25990 is an integrated, high-current circuit protection and
power management device. TPS25895 may be stacked on the TPS25990 for
higher currents.

This patchset provides basic telemetry support for the device.
On boot, the device is write protected. Limits can be changed in sysfs
if the write protection is removed using the introduced pmbus parameter.

Limits will be restored to the default value device on startup, unless
saved to NVM. Writing the NVM is not supported by the driver at the moment.

As part of this series, PMBus regulator support is improved to better
support write-protected devices.

This patchset depends on the regulator patchset available here [1]

[1]: https://lore.kernel.org/r/20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com

Changes in v3:
- Grouped hwmon write protect patches from:
  https://lore.kernel.org/r/20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com
- Link to v2: https://lore.kernel.org/r/20240920-tps25990-v2-0-f3e39bce5173@baylibre.com

Changes in v2:
- Drop PGOOD command support
- Use micro-ohms for rimon property and better handle range.
- Adjust read/write callbacks to let PMBus core do the job by default
- Drop history reset specific properties and remap to the generic ones
- Drop debugfs write_protect property and remap to the generic register
- Link to v1: https://lore.kernel.org/r/20240909-tps25990-v1-0-39b37e43e795@baylibre.com

---
Jerome Brunet (6):
      hwmon: (pmbus/core) allow drivers to override WRITE_PROTECT
      hwmon: (pmbus/core) improve handling of write protected regulators
      hwmon: (pmbus/core) add wp module param
      hwmon: (pmbus/core) clear faults after setting smbalert mask
      dt-bindings: hwmon: pmbus: add ti tps25990 support
      hwmon: (pmbus/tps25990): add initial support

 Documentation/admin-guide/kernel-parameters.txt    |   4 +
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |  83 ++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/tps25990.rst                   | 148 +++++++
 drivers/hwmon/pmbus/Kconfig                        |  17 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/pmbus.h                        |   4 +
 drivers/hwmon/pmbus/pmbus_core.c                   |  90 ++++-
 drivers/hwmon/pmbus/tps25990.c                     | 427 +++++++++++++++++++++
 include/linux/pmbus.h                              |  14 +
 10 files changed, 780 insertions(+), 9 deletions(-)
---
base-commit: 516ddbfef736c843866a0b2db559ce89b40ce378
change-id: 20240909-tps25990-34c0cff2be06
prerequisite-change-id: 20240920-regulator-ignored-data-78e7a855643e:v2
prerequisite-patch-id: 468882ab023813ffe8a7eeb210d05b5177a1954a
prerequisite-patch-id: 2d88eb941437003c6ba1cebb09a352a65b94f358
prerequisite-patch-id: e64c06b721cda2e3c41a670251335d8a2a66a236

Best regards,
-- 
Jerome


