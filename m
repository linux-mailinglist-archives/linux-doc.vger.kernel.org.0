Return-Path: <linux-doc+bounces-62544-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8CBC1238
	for <lists+linux-doc@lfdr.de>; Tue, 07 Oct 2025 13:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C68734E463
	for <lists+linux-doc@lfdr.de>; Tue,  7 Oct 2025 11:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65DC2DC784;
	Tue,  7 Oct 2025 11:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUFUxkSq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225B2DAFAB
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835879; cv=none; b=dmbaDqLvL+XIp3YUdKoQTuLl63CHNem0gOCAaZ98yRr0+i46EglZlpKEEMwF8cHQHj17dnuKaH9AzK/w97YKhHA5j/AWrml/yeHALJz9Dlvsun8P9x34KtompSRAz2gJ+sETy6KITR2SX7A8KzP2Wg2GBLdeBQgNH52+ofTxyAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835879; c=relaxed/simple;
	bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BTXEVznxqEfAlMERyYWOPCVihiMQ0yZZuF293IeqVZs/9Tz4nGedVdyolTARaBqWP88RThE/lqQ2S8wazBUS8h9ObQZSzFyghSdT4b4wX9EjuCx+k50P8VrkzvneTfBeIDvyPUw4EcxUupAdJg9DFH7wxRWO4u+PPibeRJPX0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUFUxkSq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27d2c35c459so44305415ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835877; x=1760440677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=mUFUxkSqbSQEfXHlUsLbFkpFN8+XU8CW4GlZ37fbIHB6iLr8aVOdUYLI9SEiZu8WSd
         Y+AHyERc8kaO2WLCNKplotSNN+FhDTpsoallFUf5EY4PBQu+PRhsAWJQQoJBrt+XGhGx
         XTJAvzY2tJiVgoqUex9zRPKAeSOPdAKB1UZJaGfzm9l6PJMjFI8JORgRhBaXbUOC3PJZ
         8QqbtMVq4Wm0L24jVBf3qZjJ0dgCHuWsn8PHceYjKRsluLphzmkknXF3vzfLhlQd8yqR
         5KCNm77rTc8YhwuNuuVil1CPpzwGqH8msXiRC8lHbyM+THdujOjOYxYRMSKnlLDFvc97
         9JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835877; x=1760440677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=hDlrQaxi6GzGNU0Qxo+vRRqWtJKaYOYIHr5U1S0+BIC/oyyp2cRquCxtezu9ramj5G
         vgVs+2WikGBGXx+JMMvlB5nKha+NDf4M/WUN4SnyXMxCFPkLWlptMJ00mrZOz8XBzniZ
         kyORT4qo4chcURT1aFono28O+La8S/I963txxCXfSXGuz2BtY1QqzKzI1lMnQdryOlnA
         P3uhl++NGcjOFq7p2V6SCOm0Ig6fCLZvPJxDFiQbl19OVk8AgiGVQmlTX3f7ZpFBaDME
         m85nD5XwsWb9w98yF7tPEutrucoI763+xSdEr4y6k3QSY7g4UUyJQrQDVOA1pQ6NRJt0
         z8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWyNalra2JtAIL0UH9oh4fyTP0ggigcHV0cz9JRm8pjL8ulslRcAju+YkHpohVPM3HsBVNSkRAYuvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0AqWQZ58unU1qRBIQIjcSiCV1BZrOiv5IbiD56qECy4lzaxN
	5oayILzJobO6siMEcHNIGoK9GxUZIduaxwhO1bnzVI8+NX3CoMq+GE3aXe53aTvn
X-Gm-Gg: ASbGnctunbk7C2M7pMqFJ80jzM9mbjWDV0DdQ6d499wGUwzcbtgxONIhS/l2rsFjvZq
	mTbnnDZYp6Hv6/jL/vdh4XNvG8ywT3rUcDw4KzXtqmWs4yQFUzTNGkk5+DLBsg2E60NCCTxdYdR
	ARG2Rm8IlLNAfLCArifOaBCg1sr1llTjK39VWl3OPV2TZMFTeuD+2YenfQrzEf/04X4tnoDtv7a
	sn3tHABpWxdZ1YzvIcH78i8n4xHdwqWNVFSrmAGXrSQJ+IOAmB3whERacBRhXklbOQ4UEGutmXF
	joC677lFfGZ4osYjP/siSt6NE2VRPDuWMNKFjBCcy6zRrVjF1FZWn1kjBnHCTYWKHzLOfLW+W+5
	VjTWAQeeilsNqR63mg43afU8fu1mr8zcXiS8FedcncI/+ShsXJTCMpk6ibTIta/pC3QG35l9wZS
	plmhiE92fCCUGkzeXKzeCgER39Wo7k10sPYXR9CknK4Q==
X-Google-Smtp-Source: AGHT+IFRXYX/j0MXYIPWCiTWR10pwTbuC3G1F7eZBn2sHdq/jwsyEH4FFhVQSAeDU8eQ2ogOkSv1Jw==
X-Received: by 2002:a17:903:1103:b0:262:661d:eb1d with SMTP id d9443c01a7336-28e9a5cdcf2mr198695115ad.1.1759835876672;
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:46 +1000
Subject: [PATCH v3 05/13] mfd: macsmc: add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-5-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3tcZkTMG3aVOZXVXxrFpwS+56WuPRU0ayerHnnf
 S/v287m11HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEwl0ZGf6qs+5+wnVo5xOL
 A7YzpstdY3508FK26vvLGpci7afbLF/P8D982frPV3QKvQ49zZfh5tEvMbh03DUz4Z/8M4mWRZv
 2XOEFAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0


