Return-Path: <linux-doc+bounces-34151-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18432A03A24
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 09:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD803A4F94
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 08:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6C1DE3C7;
	Tue,  7 Jan 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q7ZgbDjD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4D1E2007
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239714; cv=none; b=c4y6vp7Q5Tiy8gGGIQfGMq3pnL1JetqGYytEoM1vU6WX59pXCsiDlORG73SqhRr4BH4nFLIqwBRt19vKkUjvwRrs7WS8YaYseO0NJ7HfY+3eZ0aM9eMzHagVxSijety9FSY3iSAA8YC+hj82Dz3y1A9gu1fcMY1Eo+gxnaN0qy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239714; c=relaxed/simple;
	bh=CNZG+NpwX2frkPA3ToSHHXj+sGlFW4npeq8SUppj8a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFhQoVmXZryYJG1xtEKA1kToX2AgZv6XkJIDKiZP6tf8r5xc/qBivqIAAKoHXg0PXJfMw7Sjgqel5NP66P0xar3gGaNH7sqC1zcCpBYJkqaK56ZbZtvDOe6x5Jf3KLUJMF6T3gsgH18oKAjOQrnBy2U7oHCxqQoDNiVWcwbnMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q7ZgbDjD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38632b8ae71so10685140f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 00:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736239710; x=1736844510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nsIh5AS47gq57Ve27pvxJs0Imc3yuLJQeDrDKSKEFQ=;
        b=Q7ZgbDjDB2HzNipJgthYkkJqL4P50dv0j0p5j92MLlWNIS3c334fSikhtNSlOK4zAQ
         V78XouBoCaQvrPDRa/hbwJMMtmCiI06siKh8Uygg2Y7RTU5ZHYJJcqbb3gck+a65Iu8z
         8R1blitnbN8oU2kyw+0iroBI6WhfNaBGGq/P1JYBR4ixGcHQeksnHiQ27p/l7vaHllKa
         HA3JFqlmbDkc5u7N1BQ5jgi1xrWyqHqR+J4Mi46k/020QkN/tJVjqoCr3EzKg2EIRjYT
         rScTHYbNTULrntNUR418uiMfaP/u0Pg/l5oQeMiQN19hg3GfrnemjqcId/wfEFl7MsCR
         rdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239710; x=1736844510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nsIh5AS47gq57Ve27pvxJs0Imc3yuLJQeDrDKSKEFQ=;
        b=NbK+oIrMwLSe3Mt+ezT6tdJsjFGjPq23MH4FJz1z5s8kv8T8QKpxAtTmg18ZhRfon8
         QnqE3JQqqXGyRRZ4sAlpQRvxQf+bcEkBfbJpyjNFd7Qvgd0vXAkHaZC0sBcqcQgpe1+f
         GIOVQfD61O3+PLCQ/fa4h2MD0OaquCSHrGtbAB5uVBiV3aNAqYUw7TsIJ3rImUeJPxwQ
         bIAOTncAC4DOujnv6YBaq5uKpn9sZWK3o8+TXPTBRT1uaxL8Ohrg0dAXCVRoFatcTZ53
         B3iklt+hZ13hSm0TH2kX4wfu+xgFI69fEqbLUCH1PxAXvuV/HLYBLJh5XqRqcDNou15K
         6fTA==
X-Forwarded-Encrypted: i=1; AJvYcCXGJqMBhObC5LmIJNTXYWewfh0oKBuE7nVyG3pcOSyjwXyt70vL3RwZ9UpvcSNIcJ6iH9ya9qSTtIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9DTtJExU8IAlRIqD3TgjMDpCds6WtHv5z5ls6VLnykrItRUY
	/mDgk559WZx5W6gEIaNG3cF84YEAQUpE2vZ5ItxKkl5NuCdzD1gqRTD2Tw0scBA=
X-Gm-Gg: ASbGncuRvudsq0jRN1AVOs+M86CdBEVWzsg9UzFp+Q7qLs5nZNGdVUMMqQ6Xh6nc+6K
	XWf1YGnYyj54OFBTe99E8q+ZBRYjXr/lLuomIMOcKSHJCJhP2QnECk14J+JO6xPjfbMpkCt1Skz
	VgwmrbQ1nK/OIIOZBSrAaSFuXS/YRebs9Ujx/EVip+yd0HoK2TPojDpzEpehr5F4HLAm8dNXvD4
	YQrVIPEWx4I0BxVSBZVDQb1uPvX1Hct0LenhW9yN3msU3rhy83VyRNO5v4C+oO6eHuVJGbXwwaS
	1tx3p3tOXx9Jbjp3Uj1hiH6VqiLHsXFI545spT8ENLU/WQsQdQ==
X-Google-Smtp-Source: AGHT+IF40Th3DsJCZiUhDUmWc51b5/TVV6bpKP86SWOgVFtEzXYAHHHbf/f8wOcTTBZOGRN84y6J6w==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr54025349f8f.38.1736239710269;
        Tue, 07 Jan 2025 00:48:30 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828817sm50722280f8f.1.2025.01.07.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:48:29 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 07 Jan 2025 09:48:29 +0100
Subject: [PATCH v3 5/5] docs: iio: ad7380: add alert support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-ad7380-add-alert-support-v3-5-bce10afd656b@baylibre.com>
References: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
In-Reply-To: <20250107-ad7380-add-alert-support-v3-0-bce10afd656b@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Add a section for alert support, explaining how user can use iio events
attributes to enable alert and set thresholds.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index c46127700e14ca9ec3cac0bd5776b6702f2659e2..9b4407eeaf1d4309c06c64071ed08b4ac80944d2 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -92,6 +92,37 @@ must restart iiod using the following command:
 
 	root:~# systemctl restart iiod
 
+Alert
+-----
+
+When configured in 1 SDO line mode (see `SPI wiring modes`_), the SDOB or the
+SDOD line (respectively for the 2 or 4 channels variants) can act as an alert
+pin.
+
+At the end of a conversion the low-active alert pin gets asserted if the
+conversion result exceeds the alert high limit or falls below the alert low
+limit. It is cleared, on a falling edge of CS. The alert pin is common to all
+channels.
+
+User can enable alert using the regular iio events attribute:
+
+.. code-block:: bash
+
+	events/thresh_either_en
+
+The high and low thresholds are common to all channels and can also be set using
+regular iio events attributes:
+
+.. code-block:: bash
+
+	events/in_thresh_falling_value
+	events/in_thresh_rising_value
+
+If debugfs is enabled anc configured, user can read the ALERT register to
+determine the faulty channel and direction.
+
+In most use cases, user will hardwire the alert pin to trigger a shutdown.
+
 Channel selection and sequencer (single-end chips only)
 -------------------------------------------------------
 
@@ -144,7 +175,6 @@ Unimplemented features
 - Rolling average oversampling
 - Power down mode
 - CRC indication
-- Alert
 
 
 Device buffers

-- 
2.47.1


