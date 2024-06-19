Return-Path: <linux-doc+bounces-18945-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600690F27D
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 17:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C7AE1C2175B
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D3815884F;
	Wed, 19 Jun 2024 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ulDRhjz4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08841581FC
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811674; cv=none; b=EoLpSwN7oeNyhg3xjJT27BMcMl+Ihq9CvxSsiK25no4mmodlT28Ip6yraiOFv2Hi6lWnyhUQSg5AX835UiX74lXY8modBUdtSmU48/kzjM11pPGSTfBgwADfSZK38LPUKWwqpyR6YtLY0K/6vmAH+qUPJfIuklZ0dX23kvyc8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811674; c=relaxed/simple;
	bh=MtdyS9F32T8syUwPzDDAtHDNGMrSN/nPkN4Vw39HShI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YmfhkRE+qIV34mxB8eK3CEjN6f53mxXexdJAVBjsiVJGD4inTMmiI6bsANlkVDswuLjg+vp04NcpYW/gGkMzKHyJ5Cg2cZADG2+iAqzYTlSPrWGsDIBW8XPyIrFcE6a6OBg1F+1CnYBN4FWLOMrdOtC0A2Ri3x7UlZLc0uINl6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ulDRhjz4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4247102da30so1164525e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811671; x=1719416471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SiklklSKLnUGvj1C6ENo1sDkOQpn+QWruzZ6zUta1c=;
        b=ulDRhjz4vHLkJmPNoctzpz/ZWyH3WP/KpP+5MEIudjAwINhUDylyoczkN/s4JLAb+y
         gsuU8yXEDfJSinTGed9X7BZ67GKIYJvzmiugwHNsYiNpoL7wV8SQOuS0NYuKUSsO0FV8
         PntKQ0B1nPSAeHFx/tNVbfTUgrtMc1tY3wHmDUHJqzPt/KzqukitFdPceUWMiDK86e4o
         jVXzHulVeW1d1ifXHxdH2dig0U8upA3qlFAnD4Z6eG27d68t6PVFmFPzIYPEI3xMkLDW
         8aEYGz+oUUFWUA4kM3iEyWmXvFCckKtg3sOO6x3yDZHNxCo9HPGlmmbo69dBweRsT6wO
         hL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811671; x=1719416471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SiklklSKLnUGvj1C6ENo1sDkOQpn+QWruzZ6zUta1c=;
        b=VkwI3rkyPeZ3L735j22rd7RzyD/IWQvYA90XdQwBc5EwIH5j6IGM4YKwhzdOvZu0Si
         S2hqh2+3HHuQSv5DU23WxQ/7EqrWn7yo1D0eH7rAhbsatCH2S759cIV4AFnE6OMsDkYT
         gMJNvOUU1LupPwT5dlfZE3FOLReTQrF2ID+vaL+iGJZHF+PlbYLCe8v0jCgkt3JFZYcI
         wl6FSvCl8Faeq2RzGyuA9w9K+FkGsv1qZ/S3/1CmP77i9Y/akTqVgLW7+4bgW2vDqn07
         0ETTKRSB+bw7OfsdrR/0H0ksCG5BbnDt8a0nsOwHRXAYtY8g90n/wOx+hPNylk2pwDDr
         EIxw==
X-Forwarded-Encrypted: i=1; AJvYcCXKvzejpP3axzcSqZfNlhtKoUjXpZoqurJMB3YCZBZph9fKFb7rAduF9nz6zF85KGLPZQjk2Iw0QsVxh1EDRrCKmJxZUFXa9BvU
X-Gm-Message-State: AOJu0Yynvq2UJn44xV/OldHh52IzWiAX3xZ6c43Xyqye/FE9jv9/cR9I
	soUsN8+5teWkIkj8poRHFS7oh2mnkj1+JQdSszKxYbhejqn4myrTtS6bU2tM1lo=
X-Google-Smtp-Source: AGHT+IFM9BO+cRboDOZItswqfJhKnEJlq+pT+xsqwOnHXCasZo7t145rk+2pPxABjV30c0ZiYjwFGQ==
X-Received: by 2002:a05:6000:1787:b0:35f:247e:fbce with SMTP id ffacd0b85a97d-363170ed4c8mr2179347f8f.1.1718811671025;
        Wed, 19 Jun 2024 08:41:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
Date: Wed, 19 Jun 2024 17:39:08 +0200
Message-ID: <20240619153913.867263-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zaamo and Zalrsc ISA extension[1].

Link: https://github.com/riscv/riscv-zaamo-zalrsc [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 33f1a86efed8..982684e4daa1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,12 +171,24 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zaamo
+          description: |
+            The standard Zaamo extension for atomic memory operations as
+            ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
+            (#1304)") of the unprivileged ISA specification.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalrsc
+          description: |
+            The standard Zalrsc extension for load-reserved/store-conditional as
+            ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
+            (#1304)") of the unprivileged ISA specification.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
@@ -591,6 +603,13 @@ properties:
         then:
           contains:
             const: zca
+      # Zacas depends on Zaamo
+      - if:
+          contains:
+            const: zacas
+        then:
+          contains:
+            const: zaamo
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.45.2


