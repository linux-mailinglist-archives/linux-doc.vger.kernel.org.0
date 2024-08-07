Return-Path: <linux-doc+bounces-22352-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E229949CCC
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 02:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F6D1C22117
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 00:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C3B1E502;
	Wed,  7 Aug 2024 00:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ypIPFMcU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605717756
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990708; cv=none; b=pKv1d03kMLI3b7/H+IaXsyf0R7VDFPof+rI+GFgF5EAbOoj/T4h+eR/b6lJjRspdM83iwkKO1bJGZ9tLo04tkx+QXNrBPe3hirFz8mtD+ROeDnlF3qfO3Jc/SJj98q8ojrLkwJ1DA/rGi5qNkFtTxl/1abhcxagWlzoaClsWnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990708; c=relaxed/simple;
	bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6luMlBQsgFX5B+yCW9uWLVGwlCL6vSPDhOMZbvFHKDLVoFsY7l2tQLoc8QFGwMCSSRUj4PwDZK33CRBXvJl1MM5fdKLRxhbhRJXl20bMesrTw+KrAKWysf4Wk8045H3hEI8N9/l+J8kii/MVtXXDqTENtyBw1Qk+MThCAKBh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ypIPFMcU; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-81f94ce2272so44992039f.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990706; x=1723595506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=ypIPFMcU3OHL0qJDZ3y0caYBKvHI962PrVAt1GWoc81kSuKXCMFs1PWDlLVnXmx5Pe
         eNn0fyJkfcKP509IIFoSfLpH7HA67E0GZbDwH9p2gp0x/v2kQMU0EDr8IRIE/NJWjdsZ
         mm+S9R8HfQBdMybkGqoSa8IkRukgnA3p7A5zJqNzOENxiUKqszgdtmV3XhjGsdPCCKEW
         pi0bszNcW2fgqaCnNNh/VbCji+q6H3BiwKNyi6+QwHIT6AF9Ecpzwn2qlT52dg8CYQwi
         PI+L+riMeIogJP7SZw7p0GSBwsgBWg/OrRsGCbjv2I5OGpBJMojBXiNWVGphyTx0cJkj
         Yscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990706; x=1723595506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=Fd4qpveCO2eTZUe7cNwKwNcbEXSXT7HT/WP749DF6sNN7ekik1PpWs28lB5Voqn8Wo
         ySxSENTAqYHVEBaYw9TOfQb48gBm7qinKdw1lMB2CBJPWy1HV6m0rvjQCpzTXndTx19S
         Z4Uwz5bekLKgX1eIdURFoK4LBQoNnNz8QCxpYTCT9ligs8vfSDTJT6WJ24lkb0ZyqR3Z
         SWt8yu/sW31ixZOU+n9vU9lVWze5YZZk4WZKx/0RUAzu+zz2z4pASL18jqV6VwHKpEYg
         ut50a7NmzJ7LL9YqbgnSW2WQ3Z2Nzlt0UTmXxaP3aEubxWLvJFno1aChs6T/Q8S0kL8S
         MRrg==
X-Forwarded-Encrypted: i=1; AJvYcCVR+6MucvnQdENgLHVFmQ89g6tYBL1zKZqr8g6NQA4dpJH+L3PW7Ee714cWGg8OFqmxrJOgj9ssclF38rhrIrmuauXXe0zgPeXR
X-Gm-Message-State: AOJu0YyeYgtvDPF9mDDDESauHxHgICL1OaWq4gQN4wswx6T8eWpO4ElI
	LYC5sHjDNmYMr1EYeaLj1L1buTTFBH+JKnkvXSu9mQsq7xtq2h0vVFrdtzWMTrOijnE4AOm49Es
	/
X-Google-Smtp-Source: AGHT+IGt3XlJs5WA24THRxvIb9/ANnk9itE8gX2KWFij4dZh7cIbInKOO2OSONSuPSefGVoo/Wv5/A==
X-Received: by 2002:a92:c003:0:b0:39a:eb26:45f8 with SMTP id e9e14a558f8ab-39b1fc1caf9mr159350705ab.20.1722990705710;
        Tue, 06 Aug 2024 17:31:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:37 -0700
Subject: [PATCH v9 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-1-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
 b=6O6Y/O7ilQvMwXHjXH5ncVCTt0keW9yY1oW1bUdxC8xpCAYGnrYGKuz4ml0Ca6Y2H6csZpNHV
 TvVxuODA9RcAT4JN9cvY6+06cznH6+IJFj8SS27BN5w4qhDRIrivNt7
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.45.0


