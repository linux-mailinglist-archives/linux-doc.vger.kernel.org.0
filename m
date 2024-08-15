Return-Path: <linux-doc+bounces-22828-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C266F952DEA
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 14:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A7F1C21FFF
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B01E17BED1;
	Thu, 15 Aug 2024 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2rJq4wM5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597917A597
	for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723930; cv=none; b=Zna9GPNKoDyFNAD47SdNb7FAVTx3sfTRcvUjHs6VVQVh0yDX7cZHJZCW2AsFXUwatuRtrsayzcCzf2BPmuPFV/uSqRVSn6iw0fU8RxwFRlNUBfroIP1fOtvymf6ftw2y2MN1ChDt2Fp/ynHR0JZm01xOVsDWpyQm9pHQcfr9yEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723930; c=relaxed/simple;
	bh=cwZh/t6PTsAHn+9WQxZBnLBvMyUdjRRDOwKT+TpDcdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pteFBFKLclwN46XF3BexZ2UmIsNA9IaJYCFh2yUUTAMxR3OuBAQBk+1Q+/+Bqqz+CMDz+/wJv5TaLcCvJuo5DbI/NAWHSvOeQ8mWKiLKuixfJFn6blJNTYCfhDcGJwwnlVIdD6VgkTRHq+bmGmUTO3TjlRY5if/Dd5TxhnDsBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2rJq4wM5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281faefea9so5149515e9.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723723925; x=1724328725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmzCGQhj8OJq5H6Rk1aaVdY9d2NxnBFrZh6OEVj8AIA=;
        b=2rJq4wM5sM5B8z5GCUyW0ho3HWC+XbhkZZ4DtvA3++cKCcpzz1Y3LMMgUarP2o5IrB
         uDeX/WTJNMPW9wLA7qL7VG0pEtu7mCvGtdqW7w99xu3wk1ngU+Cyem5wge7KEvreaEE7
         6N8knl+x5Lfx0r1sXJNovK3n1d7iKk6UuoiNOaRBh5kkzR5goBxUn00Q0J62ElnEcczw
         cnR7K11cl+sHSrCwT1pXav2XUpgk2LN17UXk7oKeJYSoKlAeq9sgbtqyFLcFJ6tjBrgp
         NheaRB3S2jxEvZoom+roNn5Dh2orVeynAw4xxX5JI+7jBra197LbaODieeg507VRYGnz
         lAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723723925; x=1724328725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmzCGQhj8OJq5H6Rk1aaVdY9d2NxnBFrZh6OEVj8AIA=;
        b=gjuzmwmzhipcDyYeUs9Qj0XxOJpGUU9njTLIhqyskdIYYgfVS1rXXSUhLkPioODJs8
         uQpqt4wmrtpAYE4lULmsoZOFfv2VG64gYbG07TxviPShbSlhmvzf4uHf/rw7ajuiHZsJ
         e7IugBD1EmgTwUjiSMDqO76EEqyO/CkDA87d0xoWa6C3Hpda/8hlFvBr4DxHenGsy+hl
         gybQqUsriw2a3hMQP9LIRFNAtGjHyw7C4WysgqugjhHmE8/NJv9gqtuaNTK80EC2xC22
         716wZSCCeO2KT8aMItTvvLrnm6LV4rMSCEDiJiBNKHuzM1SXFqm43nXViDcY+eLjjSkC
         T6eg==
X-Forwarded-Encrypted: i=1; AJvYcCW4bvQaca26xEp8mT3bDXAh5zsbaqFc2RpKIWjYwIGUiYuqE7RAEMu2sFZq514diyf0IFSP8JOcRFfiGV0Zj5ss8deh+ofKigMM
X-Gm-Message-State: AOJu0YwzTirSEHUeXd9nHAMVSM2UPA8BhO9y6GthzGCQX9CmUMVMS/OR
	0UUDuOWgv961qdacQ3+4MV770Bxu4f25f97+ljlCaC8jU9iE0K9HQgBubhcNnZk=
X-Google-Smtp-Source: AGHT+IEbGIOFR16Gu1KgKoWgRq+sOlXFPXD2d0oLOy3ZdnJRcNKoYTkm5RRFB1N8wm740uDm1DeA3A==
X-Received: by 2002:a05:6000:10f:b0:368:d0d:a5d6 with SMTP id ffacd0b85a97d-371777e47edmr3608074f8f.50.1723723924673;
        Thu, 15 Aug 2024 05:12:04 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897926sm1365082f8f.87.2024.08.15.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 05:12:04 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Thu, 15 Aug 2024 12:11:55 +0000
Subject: [PATCH 1/8] dt-bindings: iio: adc: ad7606: Make corrections on spi
 conditions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-ad7606_add_iio_backend_support-v1-1-cea3e11b1aa4@baylibre.com>
References: <20240815-ad7606_add_iio_backend_support-v1-0-cea3e11b1aa4@baylibre.com>
In-Reply-To: <20240815-ad7606_add_iio_backend_support-v1-0-cea3e11b1aa4@baylibre.com>
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
 Guillaume Stols <gstols@baylibre.com>, 
 20240705211452.1157967-2-u.kleine-koenig@baylibre.com, 
 20240712171821.1470833-2-u.kleine-koenig@baylibre.com, 
 cover.1721040875.git.u.kleine-koenig@baylibre.com, aardelean@baylibre.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723723923; l=1468;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=cwZh/t6PTsAHn+9WQxZBnLBvMyUdjRRDOwKT+TpDcdY=;
 b=yeCoKWpDjHevYEwDjsK5Y8EdnkRjt/hXioQekXkONYv+DWh369A26wYcTT/cqxJ6KW3yqxkhx
 mnpuXzTpNJ4CWLNMlSg8mhrnwJpOGn1sr0vHvJbQj85Pyqe/Hu/EFEo
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

The SPI conditions are not always required, because there is also a
parallel interface. The way used to detect that the SPI interface is
used is to check if the reg value is between 0 and 256.
There is also a correction on the spi-cpha that is not required when SPI
interface is selected, while spi-cpol is.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml         | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 69408cae3db9..c0008d36320f 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -117,15 +117,26 @@ properties:
 required:
   - compatible
   - reg
-  - spi-cpha
   - avcc-supply
   - vdrive-supply
   - interrupts
   - adi,conversion-start-gpios
 
-allOf:
-  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+# This checks if reg is a chipselect so the device is on an SPI
+# bus, the if-clause will fail if reg is a tuple such as for a
+# platform device.
+if:
+  properties:
+    reg:
+      minimum: 0
+      maximum: 256
+then:
+  allOf:
+    - $ref: /schemas/spi/spi-peripheral-props.yaml#
+    - required:
+        - spi-cpol
 
+allOf:
   - if:
       properties:
         compatible:

-- 
2.34.1


