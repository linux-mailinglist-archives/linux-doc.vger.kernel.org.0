Return-Path: <linux-doc+bounces-83793-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NI5EAuT5GniWwEAu9opvQ
	(envelope-from <linux-doc+bounces-83793-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 10:32:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E5423698
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 10:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D55FF300DDEC
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 08:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD167378D94;
	Sun, 19 Apr 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpDw5u+u"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C77137882B
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776587515; cv=none; b=BU6GGggvfOl9JjlIgBoDk8buqWtp+GOI7iLK+ncP5VlG9GcJwDbU0VJUml2AvvYvYON9h/TgilrBGiC6ZKDqGP3+jMYUhPeamGCTq/DibsVrsILr8yeNX3WO+Q4p5mA6BBx9Qsrh76LtubfnpMFJ8SdGJqW57F0Lf6BM7D7IZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776587515; c=relaxed/simple;
	bh=1Jgb6/GbiYn+9y/qY8drz0ojO4Ovh+iCQsfw7Ms1hyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xn2m5hsR9wlruTmkN255O0bw5fwuhf34D5YuSX8FBkn58J6RcJDdwrnFajE1VCV7L96/X/+bGLKYvnqgiZMWqPG/uxQxe8KG4r5JuCP/F3/aldgKDifDf662XKeABnyIUmcolylE1Y1uia7cNuzzHgibDic4pYhBIo4uH8gyWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpDw5u+u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso19076091fa.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587510; x=1777192310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TOenN1wWv7IAES6T4cFxNtUEJCBx2lMIL+l6+xDZLc=;
        b=XpDw5u+uX96w2pPAr/Yi8wsVCRona4gYll24j58DMOUWWWKbRsQMjHeda4BvbTRrJY
         CybB88R+M+YR2onpaYBrKycBS6p2O3RYBXeFXVBvDJmuzGP0az6ubYvz/hsSvWly4FWU
         lJJI2ZaNDdEMeMNQZZYTaoLjIX/SpF1oYDRKHDKDuqx0U6/pepXpyeYhxEuzFu3Own9G
         WEyN1FQUSKoNtvuupq5WnZ9Qxnro8FTYg/62jWKL+ejLSQmjHQUURye++3hv5i5Taanz
         di6URAnML3bb1c038d7fsSOwc/xa2rxr+UoZ8UitHTX8gGownd96UR3uCNs7IE+uJ7KA
         oVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587510; x=1777192310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TOenN1wWv7IAES6T4cFxNtUEJCBx2lMIL+l6+xDZLc=;
        b=sIk1zdh39tTGUIyGFat9GlEfyyZThMv3T4NFxqMaIYyUurIGSjw6IAnfkG+7EFVr/d
         VZdGJdx4vTS3meUfhrwqFAz9/0qzuhhbrvl3Bz9ODWHQplinrcT2oCqpF6xjfmO+m+1E
         3zhxsClcBhI9FZZ9twbGQxMK4TllxstuR6Yn+c6BFFHonu2Me0yxaDaZlRGnoAzoJqKg
         5Hm8tA1QTGFYctctY30iPFheuffp0v1BFUWwZAf/malw+RlAsIaaPyNV2fEsyY6lVDcn
         zABtUUf+oxNieuazsDMZebTWE0cc9h1OIgLKPULgAYz0jVSPLnmypf+9SP3aTm3weK5h
         obzw==
X-Forwarded-Encrypted: i=1; AFNElJ9JgB8Xi/M0Y5pnulw9WJ9slI9EXDMbWe5QTEeKxfcMTj9SPP6dqpzkH2f95mHHcQLpFOcCGGGjSeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/opLBZubcz81clBjyi++EakSOMMEaQaRRA8kjWMHqMtUw/ov
	UIdUBWkG2D8qsSnPkvqMcnXz9AvLeJdpJyvughK5USNiGHAPG18pPDe5
X-Gm-Gg: AeBDiev0iDT/iIZZLPZbn77alg5NGEKxHPhf3UgdtDdAlEBoExE8y/QG1QNbbxE00rs
	W1CpgNUHUsfGeV0iVfOh31h4pLnjDGW5NGRfGWi/n4tpRT8FWIa4ew6iPXv4H52tzxVYGea6xwQ
	e+UZ1DxqfZHLwgvQKtpaSwmiseN/pzyNi8pY/hHwGVNiVxfj/kOaBCgpweac6NyHBrBpxkjjt31
	0NJ3jsmXVkTLlKAe9zGsU8LrRFXxj27itG5Vmy/TsnTWGj+vRNulFrH/uOatRuF88a0S5Y8GA7H
	PT/aySfSV+Tka05+GYquvP4GVnUjGg945RnJoDiVF6vYhZ1gFMcCBR+x7oOSMSNaDtQeCPQTEH9
	/cgirizUiSOf6L6vGFB/yKVZzSwdxYAtUxx1cSItkX911c/EE8Ic1MJWkdDYIOAGy873iPVJ/nP
	axnLrDV62zftxGEdj7iUQEv/A=
X-Received: by 2002:a2e:2e09:0:b0:38e:94e3:206e with SMTP id 38308e7fff4ca-38ec7af74a5mr20338171fa.26.1776587509823;
        Sun, 19 Apr 2026 01:31:49 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm17852101fa.41.2026.04.19.01.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 01:31:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity sensor
Date: Sun, 19 Apr 2026 11:31:22 +0300
Message-ID: <20260419083125.35572-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419083125.35572-1-clamor95@gmail.com>
References: <20260419083125.35572-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-83793-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,lwn.net,linuxfoundation.org,arndb.de,gmail.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B35E5423698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Avago APDS-9900/9901 combined ALS/IR-LED/Proximity sensor.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/tsl2772.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
index d81229857944..9921ccaa64a0 100644
--- a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
+++ b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
@@ -26,6 +26,8 @@ properties:
       - amstaos,tmd2672
       - amstaos,tsl2772
       - amstaos,tmd2772
+      - avago,apds9900
+      - avago,apds9901
       - avago,apds9930
 
   reg:
-- 
2.51.0


