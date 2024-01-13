Return-Path: <linux-doc+bounces-6757-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8E82CE21
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jan 2024 19:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7066C1C211EA
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jan 2024 18:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767B610D;
	Sat, 13 Jan 2024 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="IzGvbPi1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA05681
	for <linux-doc@vger.kernel.org>; Sat, 13 Jan 2024 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78350871784so48944385a.1
        for <linux-doc@vger.kernel.org>; Sat, 13 Jan 2024 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1705170791; x=1705775591; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnP28VcYD/21XzdJbx62O5g05BDoOAcvEfgwp7lTOBc=;
        b=IzGvbPi1utn5Zy9w3LfEQ3RZShgZW3ssGrGG6bjjGsdGO8SFcPgBqssB/NXomO9Gd0
         NMsJEBUbUY/r7mO7X79QiTrgB5nFXxIF25WNlXxgwpgM4GXkhYa2PNzZHe18Lm8nGmW3
         3xEGhFmFrK4BtuD+gqmxh8pK3L1qBtNXWZZao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705170791; x=1705775591;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnP28VcYD/21XzdJbx62O5g05BDoOAcvEfgwp7lTOBc=;
        b=CUPmK5Z1W+DLDBaRpQsz3IOlt25Ld9wXJole/xYrGLhNjC8qAA9FrZx7Axtp3BqQOb
         k8PNMI/0bsA8diEekwtrOeLv/M4A85Kk+n3d9BYgG/vr3H9+a7U6E8dv1idFVGkkdHfA
         V2xxs2d6MUCJ5oldX/4PRugqaeu7bbK5WTuy3s6C9lqaZIh9U1m9uvPKyMoxcr7m6Uy9
         FkxkKeMyB2jtJdXi34Ahpk4cB2XHGPmeazCgMyUzsaBK8HVGYqHnbGnRJ1vsaGXqLTc4
         p2A1aW4BBqXQWQMvpG0zNWZ9OXX4oK8m7fYrttVdzfD827juuujkND+t4gcAlebcHJpM
         MAyA==
X-Gm-Message-State: AOJu0YwQT6CPpsevIBw/ZM9R25ZiLAzWdyhl9vWMPOlBCFu1+EnWfhXs
	/ObU5dX8ENTWySYXbNRyHaiR49VjbBRHQA==
X-Google-Smtp-Source: AGHT+IGDIrUbMYSBIjbUHBWwUv7c9ei09luPbXHQLYP4DbBAiGgie9mpkenb7Ddg3RqcCURbhzRNIQ==
X-Received: by 2002:a05:620a:136f:b0:783:54b4:7763 with SMTP id d15-20020a05620a136f00b0078354b47763mr923327qkl.87.1705170791562;
        Sat, 13 Jan 2024 10:33:11 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z4-20020ae9e604000000b0078162695b73sm1855853qkf.104.2024.01.13.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 10:33:11 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] Surface fan monitoring driver
Date: Sat, 13 Jan 2024 13:33:04 -0500
Message-Id: <20240113183306.9566-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Third version of a hwmon driver to monitor the fan's rpm on Microsoft 
Surface devices, originally submitted in [1], v2 at [2]. All changes since
v2 are incorporating feedback, cleaning up and simplifying the module.

Changes in v3:
  - Removed type and attr checks in read and is_visible.
  - Removed assigning sdev to ssam_device drvdata.
  - Propagate return from __ssam_fan_rpm_get.
  - Renamed hwmon chip name from 'fan' to 'surface_fan'.
  - Removed unnecessary platform_device header.
Changes in v2:
  - Removed all unsupported sysfs attributes from the hwmon driver, leaving
    the fan input as the only supported attribute.

[1] https://lore.kernel.org/linux-hwmon/20231220234415.5219-1-ivor@iwanders.net/T/
[2] https://lore.kernel.org/linux-hwmon/20231228003444.5580-1-ivor@iwanders.net/T/

Ivor Wanders (2):
  platform/surface: aggregator_registry: add entry for fan speed
  hwmon: add fan speed monitoring driver for Surface devices

 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/surface_fan.rst           | 25 +++++
 MAINTAINERS                                   |  8 ++
 drivers/hwmon/Kconfig                         | 13 +++
 drivers/hwmon/Makefile                        |  1 +
 drivers/hwmon/surface_fan.c                   | 93 +++++++++++++++++++
 .../surface/surface_aggregator_registry.c     |  7 ++
 7 files changed, 148 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

-- 
2.17.1


