Return-Path: <linux-doc+bounces-39529-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C24A463AA
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 15:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0663B7AAE27
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 14:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8095322424E;
	Wed, 26 Feb 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mMKkrk1U"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C52222CF
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581429; cv=none; b=BQrBwIU3cIj6v8S8+yxZorA7jEfNRpwrPZfGbY47kXdAbl/JaUIQ9HL3L+62/xfbEiZ2Bg0ffKH9rUBciAxnngpf7bM0IcBQVvwIl/hctuYaMaNTuBBtTYHitz2bbvNat24HLY5Kdislb0rG7OBiQxp4xToSuhFPgeCLtGDWD3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581429; c=relaxed/simple;
	bh=AiBtlkpcTdJmU62MyZVlruSSe6cY2MOj4UoJW00/I1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBpHFROp1Bv4AAiZ6WConlsx1C41yvza3E2ioDB+34Jert8vexaZiZqCV80vRmNr9v3OWmMCfIZq6I+gtjsisEtPAmPRsAALe0jX9Jajj3VDVnQury072CN721cwRLYeKApk9N/ObEHM8ZTXxIercjh+b2KAmf6YAEBL9pIUIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mMKkrk1U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso43364185e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740581425; x=1741186225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0B5DTNgvnwka6JhdG1RxKRZQdylIuRKT1s0mr36XMI=;
        b=mMKkrk1U4oAhvNgDUXYB7mPOhiLokBNta9dqDUjYUUB7apPrvr5pJLEGFpXHP+eRYx
         qQrXSYLKGoz1HEHE82a/WLNRAefDTAp2VJHeagpuswD/LRMdHq+zvX1RPJMmSL6WHePO
         ptYLh6xM9IBB1Y2ADb5wASqH/mnJnd1DjwoHkRBZdHXZjDc85Uxskgws9vjLnCUj9RsK
         D1rNDJHtaiLgdCGeCQV/LdmkWWRR3dQ1FwMIiHMJ85H4PuioXu27clsdu5ZWAl+/UGQ4
         9p8pNMUmZlnQJLGhMDOHRVdaYHbztPMwRPMjZW3jGMad2Q40Pq9zP8+5xFu5jlPzU7ZK
         5Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581425; x=1741186225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0B5DTNgvnwka6JhdG1RxKRZQdylIuRKT1s0mr36XMI=;
        b=F5wCNk6BF7n1IpY70TGuJ936D8qnIg4jwl46oyDhQRbdoJaGpNiY++B9rZzhQytHg8
         C8v2FK3UAP/kXorMJFyoabe3NFzcGKBQT97kdsJ9DCjL1gRIOp+eoNFp+70WZUKU9gIW
         xFHe9VLwyk+vdWbWHpTBj889+1+tovO7IYl1eYMyGbrFiAjd1Tf3cr3c0ZzZHuEdm8fc
         tK5TwqmzvcNKqzS4odQ2sO0+joSQUdOCiTVaTqE6mCP++Xnmxac5T0U2DrYZpB1H5Mlf
         kZ/K61p3NB0gSiEtowv1dU5FP9bF+lfgN+mf5IzQMT24MHJlwQh6rkXV9uoUddGm2ekL
         odvw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmjVXY+M+JFEE2eE/WHQhYNGgQ4KBAuGR/Y6hI2sT8s+3frfFq5vWIBl7IytyJJJTNhqQ6xvG5Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWiEb6/UjOwP/2ne867MCJuHoPcEr778wn8LPQRXYmdFQW4Gj
	h0jlz5rRuv7YS5eRJGL63Pf2q65gkJT9qd1VYqFP9h27FJ920ayLKcgyVmsSMd4=
X-Gm-Gg: ASbGncuUMbvWRy9ZwyuAkZzl4gLQ+7qYo3L+YyPyvVVe5m840wJzjZw+bqvnf29S9dU
	9oXRhTYwdLpC4eclQzsR5FRuoyAWBXvn0jUpkbZCcxtkG9wPbO9b2STad25yw+8ttylbQEZ3CwW
	T/v3uDgVjkfsXfa85ItYHezmUm/9ae1YztVtnLygZAjgAAGx1ZT8/RC4c4eerSVUYWoKKIiuM/6
	gbUBD7GALd/D2GMTXFf+ZZsPqWggsAVSCJcSmWpR8Mxvs9M/z6xfKN5IjKeZ78dzQnEjCsRIH6q
	Uw9vf0INpTlONbE8ILu2AreuWCxM/hkDLG2bVo3xQEqWHjtDJ04pSb9LUAo8QXCTMchVzaaueGM
	8qz7r3LKm2d1GQx2TsGi3h54=
X-Google-Smtp-Source: AGHT+IF606LkuiMsDjoxoFUsY5Gw5UF42U3bEMG+pWqETROOOXt9np0boII9VXCYLUynJeWaadJIDg==
X-Received: by 2002:a05:600c:5123:b0:439:88bb:d035 with SMTP id 5b1f17b1804b1-43ab0f2887dmr73970795e9.5.1740581425531;
        Wed, 26 Feb 2025 06:50:25 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba549d6asm23747965e9.36.2025.02.26.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:50:24 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 26 Feb 2025 15:50:05 +0100
Subject: [PATCH 3/3] docs: iio: ad7380: add adaq4381-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-ad7380-add-adaq4381-4-support-v1-3-f350ab872d37@baylibre.com>
References: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
In-Reply-To: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

adaq4381-4 is the 14 bits version of adaq4380-1 chip. Add it to the
documentation.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index cff688bcc2d9601a9faf42d5e9c217486639ca66..35232a0e3ad730c19b5201b74280bdb6deaa9667 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -29,6 +29,7 @@ The following chips are supported by this driver:
 * `AD7388-4 <https://www.analog.com/en/products/ad7388-4.html>`_
 * `ADAQ4370-4 <https://www.analog.com/en/products/adaq4370-4.html>`_
 * `ADAQ4380-4 <https://www.analog.com/en/products/adaq4380-4.html>`_
+* `ADAQ4381-4 <https://www.analog.com/en/products/adaq4381-4.html>`_
 
 
 Supported features
@@ -52,8 +53,8 @@ declared in the device tree as ``refin-supply``.
 ADAQ devices
 ~~~~~~~~~~~~
 
-adaq4370-4 and adaq4380-4 don't have an external reference, but use a 3.3V
-internal reference derived from one of its supplies (``refin-supply``)
+ADAQ devices don't have an external reference, but use a 3.3V internal reference
+derived from one of its supplies (``refin-supply``)
 
 All other devices from ad738x family
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.47.1


