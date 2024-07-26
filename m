Return-Path: <linux-doc+bounces-21427-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31993D5EE
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 17:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D910B284195
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6CB17CA08;
	Fri, 26 Jul 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fJvHhSyy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CAB17C7AD
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007226; cv=none; b=ti5Ka2/HJcc28LMuCoI1mqGcsUbKqvUFp608JwAkPvrr8/nyUPR1oI80836E6YmLaEqpaHmes32B6e1izIEs9N1NNv30usQTxR/sK/NUEZmn7biEuM2SKRC9IfAk7g/evJG25OCxPN2TfQsyNJxwSr2hJxfP0esTJ+MOzfPDs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007226; c=relaxed/simple;
	bh=vwmvKtPfH1OZGf0desLUiv2Tu0n4XwyP9Scpfrh8bP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Da+AI8iw2RcIaF6a4q1ZrHK53lUmCmp3dcwA5sPgHWyv6ueEJBZhZzlmbPDeSakaHKM8OmRAhm0g3d3fu7hHpJVuXI7lT7zM36NHvffmiUzvivI+LAAg4DXuq9aUgcD6ky+BYIjtfqKg5gDT6VmVsJEU/dpWpSQI7VzVajmeIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fJvHhSyy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368313809a4so2021949f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722007221; x=1722612021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dzsJ9iB0hH5md8Nzs0G0tuxRWMTqVPegq3Gul+A4rA=;
        b=fJvHhSyymokX4kVMfIGNAmqSx15eTTPRgSjtF1pXSYKepKgNu5W6NLPK7WpO97p+nH
         dWAMRn3Su148I2A0GdkcOxlLfYQIis6cTdMOhyRi8KtDqXUaPGHGh8J0bULClmxN2VPb
         tqWAfUR+IjaSEdmK0HLVwepQ2uUMqk9WV2fIvR0zEaJHIW34xxwQkE64L5lasQwOh8Xu
         nTg+iQ5bpvACDIdxDJKCjv7eRK5orrZnzFWG6xgA2KtuWU4rS2Om62eW0cKw4bRquEi+
         EQyC33kUpm1kkNZZcUVkjaEtAikrduJOdaVegs41o8ems79KnZ+7yIj/alBVPqSyC/iM
         CvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007221; x=1722612021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dzsJ9iB0hH5md8Nzs0G0tuxRWMTqVPegq3Gul+A4rA=;
        b=ddmqJzW4qUp0eMf5DhYmsxDn9ZUwVe/FoDKhnJIOf+nGVervjTgfOjxtY57YGTVLgK
         Vvn5oQeQ8Ar8EHcAFr11P2JK+ruw6QgOHmNP/v3Ubw0KX1pSucQyKHUatje3qsGggok1
         HBleayFzy5CwURyW6MkNzm54urInn/7awBO6UrnM5lywwdTnpRSTpAROZGTuqbN3EOYj
         z1yeYJilTBv8wUI+a9YtZri1tocEEpzQcBMD/lJSmJMTbtpPl8yT0Ze7g4nnUjswr5av
         kz0Ubh2fuPdASnbw5lfvHX+5cypKnNF76/PxNyausxMD/EnmGqKslE1rqg8gS1dPP7BX
         lU9g==
X-Forwarded-Encrypted: i=1; AJvYcCUU/FvD8xyZqN2e13KGH9eVqupIOLf8WCbEQw3r0xG1hNmJeWR1uQSMYIVok05OYaWK03XGM7c0+n41QL2kWCNEo4V5Ejip5/O2
X-Gm-Message-State: AOJu0Ywrx0R/nsFxiLuDqnqBgAPOhrKkrkrT53B5kUYtZ0BAeQQzRcmr
	QGt7zKsIxgCCiIF1i8lbf1G/r4N506db/VZ/v1kSV3xKHiHp37I2aEuekmoreW0=
X-Google-Smtp-Source: AGHT+IGlXziwV/XhtFvsHXBEHTPeo4ceiW87/bQtyJS1ukSEqXFHxPmP8jH1Bt4CUR1+RaWMFGuD7Q==
X-Received: by 2002:adf:fc02:0:b0:366:dee6:a9ea with SMTP id ffacd0b85a97d-369f6706b4fmr6564593f8f.26.1722007221560;
        Fri, 26 Jul 2024 08:20:21 -0700 (PDT)
Received: from [192.168.1.61] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0338sm5500985f8f.1.2024.07.26.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:20:21 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 26 Jul 2024 17:20:10 +0200
Subject: [PATCH 5/5] docs: iio: ad7380: add support for single-ended parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-ad7380-add-single-ended-chips-v1-5-2d628b60ccd1@baylibre.com>
References: <20240726-ad7380-add-single-ended-chips-v1-0-2d628b60ccd1@baylibre.com>
In-Reply-To: <20240726-ad7380-add-single-ended-chips-v1-0-2d628b60ccd1@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.13.0

The AD7380 family has some compatible single-ended chips: AD7386/7/8(-4).
These single-ended chips have a  2:1 multiplexer in front of each ADC.
They also include additional configuration registers that allow for either
manual selection or automatic switching (sequencer mode), of the
multiplexer inputs. Add a section to describe this.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index 061cd632b5df..81dfa39519fb 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -17,10 +17,16 @@ The following chips are supported by this driver:
 * `AD7381 <https://www.analog.com/en/products/ad7381.html>`_
 * `AD7383 <https://www.analog.com/en/products/ad7383.html>`_
 * `AD7384 <https://www.analog.com/en/products/ad7384.html>`_
+* `AD7386 <https://www.analog.com/en/products/ad7386.html>`_
+* `AD7387 <https://www.analog.com/en/products/ad7387.html>`_
+* `AD7388 <https://www.analog.com/en/products/ad7388.html>`_
 * `AD7380-4 <https://www.analog.com/en/products/ad7380-4.html>`_
 * `AD7381-4 <https://www.analog.com/en/products/ad7381-4.html>`_
 * `AD7383-4 <https://www.analog.com/en/products/ad7383-4.html>`_
 * `AD7384-4 <https://www.analog.com/en/products/ad7384-4.html>`_
+* `AD7386-4 <https://www.analog.com/en/products/ad7386-4.html>`_
+* `AD7387-4 <https://www.analog.com/en/products/ad7387-4.html>`_
+* `AD7388-4 <https://www.analog.com/en/products/ad7388-4.html>`_
 
 
 Supported features
@@ -69,6 +75,42 @@ must restart iiod using the following command:
 
 	root:~# systemctl restart iiod
 
+Channel selection and sequencer (single-end chips only)
+-------------------------------------------------------
+
+Single-ended chips of this family (ad7386/7/8(-4)) have a 2:1 multiplexer in
+front of each ADC. They also include additional configuration registers that
+allow for either manual selection or automatic switching (sequencer mode),of the
+multiplexer inputs.
+
+From an IIO point of view, all inputs are exported, i.e ad7386/7/8
+export 4 channels and ad7386-4/7-4/8-4 export 8 channels.
+
+Inputs ``AinX0`` of multiplexers correspond to the first half of IIO channels (i.e
+0-1 or 0-3) and inputs ``AinX1`` correspond to second half (i.e 2-3 or 4-7).
+Example for AD7386/7/8 (2 channels parts):
+
+.. code-block::
+
+	   IIO   | AD7386/7/8
+	         |         +----------------------------
+	         |         |     _____        ______
+	         |         |    |     |      |      |
+	voltage0 | AinA0 --|--->|     |      |      |
+	         |         |    | mux |----->| ADCA |---
+	voltage2 | AinA1 --|--->|     |      |      |
+	         |         |    |_____|      |_____ |
+	         |         |     _____        ______
+	         |         |    |     |      |      |
+	voltage1 | AinB0 --|--->|     |      |      |
+	         |         |    | mux |----->| ADCB |---
+	voltage3 | AinB1 --|--->|     |      |      |
+	         |         |    |_____|      |______|
+	         |         |
+	         |         +----------------------------
+
+
+When enabling sequencer mode, the effective sampling rate is divided by two.
 
 Unimplemented features
 ----------------------

-- 
2.45.1


