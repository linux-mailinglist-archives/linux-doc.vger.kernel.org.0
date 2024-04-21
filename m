Return-Path: <linux-doc+bounces-14702-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B838ABDEF
	for <lists+linux-doc@lfdr.de>; Sun, 21 Apr 2024 03:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8A62816B9
	for <lists+linux-doc@lfdr.de>; Sun, 21 Apr 2024 01:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0379779FD;
	Sun, 21 Apr 2024 01:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O+n0Nxwb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6734C70
	for <linux-doc@vger.kernel.org>; Sun, 21 Apr 2024 01:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661490; cv=none; b=LOjqT1ncDFke2kiRUmL6G2M+vBV4BrX/t5kOQy7Fz2IDsrIw6mRc/mF7WznhoJgG61hsrvEL/vG9tRJu50SUah4IJYSwqdoACuWex2tYcEhwhb6wN4/iIiGxWgCYdc4TosUjD9G7tQWa2eeD962s9btKsYmCz50+co8FZsYdUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661490; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZTdYLqwzIXYwvteze0YY9YiqdiDys+A+AypZa0YCp+sIkBsupIuqx0A4j5MSpBoWv7sAJhsgx761MZn4mIH8ug/qfllRO+QiNTotT6xEoZmsnzI8yND3mMkLRYqYPgK3JVxanNxSINr6Vo8PAGhOpViJ6fLQD+H//e9fiimPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O+n0Nxwb; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c74ff209f6so751019b6e.0
        for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 18:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661488; x=1714266288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=O+n0NxwbI2lfrLzCGxcWXMlTcOSjN45uKYuipd0JG1tIWiOTpOwvrZ2aKFk1s1/YeU
         qLwiSYfQSBJsDh4npgDhPWZyKnopEMmIVNc0f0l2NEXSS/RS3c7ZJpaJDiN8QUxcpwHF
         okRhL6pXh0m7O7/tFA6NT80Fl0YC9/7ScSHAJo9d/lPXKJpSYyyKK/AurDNk57tJL2nV
         y8eamULx4JcqxOSsFfXucEPMwNN95RUmRToEQCvp3zve2ZNPO4WOMZ4k/vZfBz5qB0Hz
         UwTcOwYZUYu3GJ72u4DWBMdEYJQG75VUgX6BIHJ526IGEQbfqaEE+mJxW6xyGHereXbl
         O2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661488; x=1714266288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=tCGC5/P4yG+SvbS1otZ8Ic+1iwDOyjGtKtC4w2Sc37G+UKini5seU3zwd8SPfmYtIf
         fujL+7evWZvxkUpv6COQXhygNhWi6zm61LHWiEZMDU1s1wjeJwPMX7FIFPfQ9WRYZRxB
         mCk3/OnWHOHCEGjnhyNEmImVEZ6GD7s2F2rDjL0xWvzYtKiOrKY0Y5DBoV+KwTzCXrb4
         CIBtyt+uOlIoxpjqYX003GXyUY2gqI9e28cTNyiG3TrHkAq/7vEPwqMkVj5z+gILH/5W
         jM6adzTJ648BolaDPPMNUWjNI4YXfD3d4QupRJZ68yCFN/UhLcXo/BOSQM5ofubCchjt
         V+XA==
X-Forwarded-Encrypted: i=1; AJvYcCWGliUPhl4ipaSiQeBaum/HCpH9dkIkfy/J6YYnjRuUBAfsPEptaT7NrcxhJvxChXCCJKaBayyFdnE22XRf6cKtGC4ez6BeNuj2
X-Gm-Message-State: AOJu0YwqzxRr8ayuOGuLE4Evyu0m3BIGKG+Cm58LFyAmPTYg2vlqHJ5M
	xXQnphM5DCbVxzSgOY/K/A34inCcmlxuXNTJrhQwar+9YTfLI+CZpfaCUL0EiOE=
X-Google-Smtp-Source: AGHT+IFq/Adya3X5OsyBfgam4Py8iCCXOM0I3DHx7Tj1w0OCBjG5XiXen2SuCIRXr0J4ExNrUaelmQ==
X-Received: by 2002:a05:6808:57:b0:3c7:498c:fcf7 with SMTP id v23-20020a056808005700b003c7498cfcf7mr6687183oic.14.1713661488526;
        Sat, 20 Apr 2024 18:04:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:34 -0700
Subject: [PATCH v3 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-2-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=hyulu9icMTNXwLbjflf7C0Xl5YeTMltbQ2XLA8QN51kHOlvp6FCWy/LJXmE38OxRPEc+aM8R1
 YR6kgYopZ1+CPQKnzpkvwUuYvw2Yq/0HsKWNdYaDF2yitkGCndYdvnc
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
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


