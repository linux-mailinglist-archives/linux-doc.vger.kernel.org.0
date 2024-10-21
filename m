Return-Path: <linux-doc+bounces-28095-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D29A60E8
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 12:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59787B27910
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 10:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9CB1E47C9;
	Mon, 21 Oct 2024 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uG4HMIYH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E411E285E
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504817; cv=none; b=dkSZzcIdDSjysEsDKuBQgIixKZYB9BvHQpgFp5aQuOuHLcWCKFv8fM5PRPwL8LhHHCFROPcatun2/2vqxDjW/3u2pEplkz4aBn8JnGnQ6/KV+71GPU9xTr5GodoHK4f15OUu7zrjM4PGKQXpl7puigbcbL9eW7sMuvcBdBKhfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504817; c=relaxed/simple;
	bh=lSphsV781DEEO5eZXZe+5WCVeSRk48zEv06wI90qIyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NW92QCYOv6kC177PmDF2wHxXFlh56Q4WH2KBE7xErmNengQx3HeDSiV2BPU57Rnb3/xhfjq9SA++nHSl1NbEHaOPEB5TKX/0d62XMEFEWw+9wgwFFFOveTdzCBwXkF54AoTiI7QuIMU5z9xyOrXkT1WhVUHuVop3qodju7Nquz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uG4HMIYH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43161c0068bso28620075e9.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729504813; x=1730109613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKrQZwpLn/eCRDsZpuyk3NH+ActJifA9aPIUH7Z4gH0=;
        b=uG4HMIYHnTaU2/0N85QSfn20l2Kbb8LfTtb+VONpXzJR5YIZwjD/AbNEKhloEtZGui
         gBYhAhVtXqw2dqxs/P5ll9lMGi2DtRgQGG6oZsmvENBHMbef3PWeuM8QyYJ6eUfGAf50
         E+TvQDHFz3I1IFKloHPTc1CyGIx4QbrWXB7eo44NTuCTi6YU7c2luYRF05FcmVpdvvQf
         6BydyInKuX9/1bLNjcjCfW/YJ3t1pJZ/0R8n30ddbQ5KPbNR0l8VjCRALKdY556TajSE
         Fcplm9HSL+dggg+IueBHuFG0UaWf5S+9POMB7XyaJxLKmer1fzGBlxRNJUcayLYZg7b9
         qB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504813; x=1730109613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKrQZwpLn/eCRDsZpuyk3NH+ActJifA9aPIUH7Z4gH0=;
        b=LgRwSuoYH5WKd1Xnr5EEMWYm36bmzo92p7k2jRrNfggIcPS8wm7xgO/Ylbg+ANpFVU
         6MAYfHmePgwYun3fWVjw4Ug5sZ0S8jOTrtmU9bJcpz7p9BtXdodCuQxKqI7qeaitgRzv
         ZE93PqG7pGgnhac8ItClaAoM3IqBMOBHFvSQ/rW67I+78c/mC14PEYP/Wu4H00rJB5Kw
         vsOPXt7j5jU2Ek7BVq8095ej8rK3BJ2gyiv7Hhv1yBxXloHBY5hoxVLkO4HcMhzNNFTq
         uY7rogZ9ykVCFNSJ98DHxi6gskswd0tOJZ1oPcvhL4ZpTqIs0P4ffYodey34Mxuu72tb
         +QHg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5OufMf2HtFt3qUHV921dY2D00yI2YCMrSAeZ1tZWcYHIgURsXALrYQfZnCBzO+VwrOIkgW5w37w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fVzb3NpbMrvdSsfYRjhP7ehyTfkx/O6zfsVfo3q4ZCLhLH+k
	3jvva/8NEHTFj5QmuA+nX2bFOo1mhy5Js6N1+w4jtiWX6QPLL303kQbBtoE5JTM/s8YOU8/w5NE
	VXwQ=
X-Google-Smtp-Source: AGHT+IH1e5STM6w/t/+OThujXJlwLR1a0UQlVFBhiPO3a/AoXIdCcxa112WnOGMIDZef+UCO5tSY2g==
X-Received: by 2002:a05:600c:1c0d:b0:42f:7ed4:4c25 with SMTP id 5b1f17b1804b1-4316164d809mr90175855e9.14.1729504813198;
        Mon, 21 Oct 2024 03:00:13 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58bbaasm52375995e9.23.2024.10.21.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:00:12 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 21 Oct 2024 12:00:09 +0200
Subject: [PATCH v2 1/5] dt-bindings: iio: adc: ad7380: fix ad7380-4
 reference supply
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-ad7380-fix-supplies-v2-1-2ca551b3352a@baylibre.com>
References: <20241021-ad7380-fix-supplies-v2-0-2ca551b3352a@baylibre.com>
In-Reply-To: <20241021-ad7380-fix-supplies-v2-0-2ca551b3352a@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

ad7380-4 is the only device from ad738x family that doesn't have an
internal reference. Moreover its external reference is called REFIN in
the datasheet while all other use REFIO as an optional external
reference. If refio-supply is omitted the internal reference is
used.

Fix the binding by adding refin-supply and makes it required for
ad7380-4 only.

Fixes: 1a291cc8ee17 ("dt-bindings: iio: adc: ad7380: add support for ad738x-4 4 channels variants")
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index bd19abb867d98d46bdd1c9e0c197e10f06979204..0065d650882489e21b952bb9fb25f1e3a070ee68 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -67,6 +67,10 @@ properties:
       A 2.5V to 3.3V supply for the external reference voltage. When omitted,
       the internal 2.5V reference is used.
 
+  refin-supply:
+    description:
+      A 2.5V to 3.3V supply for external reference voltage, for ad7380-4 only.
+
   aina-supply:
     description:
       The common mode voltage supply for the AINA- pin on pseudo-differential
@@ -135,6 +139,23 @@ allOf:
         ainc-supply: false
         aind-supply: false
 
+  # ad7380-4 uses refin-supply as external reference.
+  # All other chips from ad738x family use refio as optional external reference.
+  # When refio-supply is omitted, internal reference is used.
+  - if:
+      properties:
+        compatible:
+          enum:
+            - adi,ad7380-4
+    then:
+      properties:
+        refio-supply: false
+      required:
+        - refin-supply
+    else:
+      properties:
+        refin-supply: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.47.0


