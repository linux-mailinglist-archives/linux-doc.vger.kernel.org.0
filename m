Return-Path: <linux-doc+bounces-31003-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFC9D1422
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2024 16:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3701E284166
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2024 15:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2091AF0A3;
	Mon, 18 Nov 2024 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="W9i5MBNk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CB1B2190
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 15:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942777; cv=none; b=uWmaGyarefxcsxPUlCTJf1mfG1LJaj61WQaNXgTpqvQcPSF5u3K0In9VIz86lybZdExGqs0tlLYMrDokkZY58zjQIi7fwPJsb3X971Lyh5mXXqst8Rru4kR6q5GMIjlTVd46j0/ObsB+x1F24ikQAKPssfr2iQh9UPvNfdZBdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942777; c=relaxed/simple;
	bh=EbUd2+Uk9VF6AmI7jko2szQABwjudyxSbk/plvWGwiU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qIkvE6yEx6z0IxQJXY2OHLW7ZOfdRQYl0GgdeLO8XIg6+wgG1npsdcYHRkakW0JBG7PguX5e7T9AMs4KuGzVTNaLIxaHncJ5XsDxpQJYDgBxpunjlCfZe0hCaF4UAfbMLJ6UyjEQXQFXcpkjQUDihv3/oWNL/MNBPP0UrEg3ZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=W9i5MBNk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9ed7d8c86cso658188866b.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 07:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731942773; x=1732547573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI7Buy3amAiI+3eJ7b453h1BbqT5wHqViKWf67eK67g=;
        b=W9i5MBNk4IPqFEWIY/qivpqAkCigZwJEtLgcBZrgg8VFoigEQblgQ0HAPNIRop3nxq
         6UbPxk6Qse1bvMC67ZngI95npQT2nWTxv4X8U/rlfjYi8hk1dUc5nfsSMT1dMpRw2J2i
         71oAu2UGGkJ9YTWB2ILXHVy+uysKeUh4YEzZ7p2vTyJ35MDnUp3I6YXKoutEXyost8Al
         7KiS9QBoF2pnmHlJl4hCDlyKJtk7mSoIaFmZVjyldLSBMxShiUwI8eZTUzMIHmGwgxJC
         xBFDUNgZtpMGDjcCbZ3grm1HF8dPxix2xNyq/Ts+EfWX8HQlhzysRBlZv0S3RmVHB4Qr
         dNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942773; x=1732547573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI7Buy3amAiI+3eJ7b453h1BbqT5wHqViKWf67eK67g=;
        b=nVeOzN2iwwm/S+YOLRYJkCC7YhWJG8tC2spN14aqE/vY9CmPWXwsHG+Z9o8kEDL5ft
         ONlS4q9B1I1pjmY4UcZvjWMGQOXEi+S2XMNvuwpD0AdDynyiKEZ40284MV9O6tW26PiH
         lsyfhTbhMmR58/05xCweCCthphu9UbjZxUepPTrXVwd6p7g5QO2RxY1rnFIX/ajjx0Vt
         kkb4TrIWGX/sFtECOE49vjhJNfW4wgx9L7hSymNQHg++Flcx/WoULZ8niDA432z8GChD
         gFrZINGkttRsoMDqsqEDW6aRNqNv6ILT0kbUy4kHqnd3M38WrW/OMZ2QPHxW67BEU4d4
         eUtA==
X-Forwarded-Encrypted: i=1; AJvYcCWBzOfRud2NKyqQ1i8/776/dSP19OJuxAWAftDAC5QUs75jGl3x40emslou8/1An1Vlb6Glx//RU4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHV1GsHnikoQhAe/efGIF8PxXFOTgq+FHNaFYBrsAGWDZEvnG
	e1Fi5e6GytLEepZ9sFNZkVndQTYykj+Lhs9zDznkC8CHlYQVIhlGXtxNnCbqknxUXteQNrjaTwp
	gEHqnyEt/wvm8UtKH/souRLW+unAsrG511uOGUlKJ9gd/7Fw9b/gbsbyrFgchbufAdbIJs1wQBu
	JoTRaKP2VYKDyMjiuYDfZ5ZA8=
X-Google-Smtp-Source: AGHT+IEAYf4xmFWVTTflHZgV2BGLLkT9aLVMx/4kAcNcN86TWJVZ9ONrVKNWdTzRkcgy+sJQDJ1R5A==
X-Received: by 2002:a17:907:c24:b0:a9e:dab6:aa10 with SMTP id a640c23a62f3a-aa483507feemr1183398866b.41.1731942773476;
        Mon, 18 Nov 2024 07:12:53 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd7e7sm548980366b.119.2024.11.18.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:12:53 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 1/3] Documentation:leds: Add leds-st1202.rst
Date: Mon, 18 Nov 2024 15:12:41 +0000
Message-Id: <20241118151246.7471-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118151246.7471-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241118151246.7471-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage for sysfs hw_pattern entry for leds-st1202

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 - Changes in v3: Add leds-st1202 to index.rst
 - Changes in v2: Implement review comments

 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 3ade16c18328..0ab0a2128a11 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,4 +28,5 @@ LEDs
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
+   leds-st1202.rst
    leds-qcom-lpg
diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..e647966e496c
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)


