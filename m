Return-Path: <linux-doc+bounces-20894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E763933713
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 08:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4915E1F2101E
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 06:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B62912B6C;
	Wed, 17 Jul 2024 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="T4TxoWBi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94F125DE
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197815; cv=none; b=q0f37DuZoC3TdQVZK6fD17Ni2fB+MrwmCmnGI4aWGOivlpE45NiOiOvYUiyYiZcBUZQu0yJB2Rs/5E+L8BeW3IszyuWj29fBJkeeLOyh/7S12mRFHhEpCatBtHoTZPjunLgGtDbK9trN2jBplgevR98xoSkCiK5ocKE70Dctc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197815; c=relaxed/simple;
	bh=V9Jzk4N2zS36v1WQ5gEhoUIZc3Ly89MBgolvymqDsAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=htviW02DyM5nzL3goVmLjJ2MAYq745FyQfyXokpN9unX47t3G1RiXqaTvI0PjyubXV9JPlAREimPZJAWxjBMxbZZoZfYr2TeVknpmJNtCS5wEImN9EFMLjm49N9AjX4EKsAWKzJEst8+2GyC7PJIsUDr6Ws3yg4Gz2nOzX1wljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=T4TxoWBi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4267300145eso51278465e9.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197813; x=1721802613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/a3I9RG+3lbcPTW2WISOokc8gewDy3fkMsPDZhy/D4=;
        b=T4TxoWBiQ7J7z3doxhHqMilZccLpeo/vCwAtUpKuuP+myV49KcZikkAfThhiqEsZgU
         6gfHD+PDyo1GRWtzVi/bDJjcfvGSPrsdcaNYgZI7URcw+9eBmXWcuQ0q7om8jO9IHNwR
         /AhsNZ3pwphzKrvWMD0YA/v4i+YuUQJNlbdnXg/xeIJnri1LCj0e+70b0JefrLhz+hkF
         F3yhc9wWcpbB1VcL9I8XLKJLCnDzqEwaVibgXBQjMTGLbgPbgT7/8dc2vKwGVlBAAnAm
         B1myDcVgh3Cn38o4vXgcMZgWGIVTjKNizRWXJu5cvIUGpSnv7OKDdupQ0sAJTGahp3ZO
         rdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197813; x=1721802613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/a3I9RG+3lbcPTW2WISOokc8gewDy3fkMsPDZhy/D4=;
        b=VyswfNuc5vE0Skbc7Y18V0/15rTr4RVr4/75/fALUo8G0NTzW//A1b/rpO0s+iy39z
         1Ih5NbsYEack9dB48jGjX3wCUL41sNWPUeZhvJKFkwYjveQUG6EbWO9CTzsspczVl8cW
         WZMxLCueYiFRTNblDwmvEXmrHRCC71qkViEo8lrqNPVKi8z7KsNfchwcd7g9voLxrPG+
         Yy3ccNF1Q+hecT5m5fPUlze3Xx+6PC9QU2kqdoXkT4nLf2qjrsHB2r78LLJ7Ngmbb5qA
         y2AuqECEYGtmUlSuLJWuoyQWa9TxGRuPdzgulF7NkqgaxVU87ra4luoqBzZs0IhkuHAm
         jvOA==
X-Forwarded-Encrypted: i=1; AJvYcCVk5GS7fAnxR9qnkTnLoJzG9hvmG8kY2IQwPI6Wz/4Xt3wyJ+L5xinTyahkQYw0i47eGT1SCzL8x354iggvtJW5i7bPeelwJxfx
X-Gm-Message-State: AOJu0YxfvsDczcwYzjNPiZj4LO4k9tfE6cqTMKyB/TZDBELmY9FtbxZL
	pylZwv/N9kk4sTHI7FwFAXcjrZNRj1S4YR5Ag4e5JL6AHPuwQCqh8dqFfl+8os8=
X-Google-Smtp-Source: AGHT+IHes7c6JkEf7yEOk72RnIcqQqTVYNuy3gJbWA9je9hHeJGPheqNOo3gwFeqz1xI+QDtIGxtPA==
X-Received: by 2002:a05:600c:4ec9:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-427c2d01cafmr5720315e9.29.1721197812676;
        Tue, 16 Jul 2024 23:30:12 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef460csm158127685e9.44.2024.07.16.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:30:12 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 10/11] dt-bindings: riscv: Add Ziccrse ISA extension description
Date: Wed, 17 Jul 2024 08:19:56 +0200
Message-Id: <20240717061957.140712-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for the Ziccrse ISA extension which was introduced in
the riscv profiles specification v0.9.2.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index e6436260bdeb..b08bf1a8d8f8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -245,6 +245,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccrse
+          description:
+            The standard Ziccrse extension which provides forward progress
+            guarantee on LR/SC sequences, as introduced in the riscv profiles
+            specification v0.9.2.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.39.2


