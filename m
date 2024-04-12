Return-Path: <linux-doc+bounces-13957-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57FD8A270B
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 08:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5262E1F235BE
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF474F8A1;
	Fri, 12 Apr 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZJTX6YID"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F74F5FB
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712904563; cv=none; b=T3XqSw4Nw3LqouYlVelM/vZlrNxRAjNhHhPpaViGzm0o6NsEKKQEasbUT47O5uL/GdcbuaF9lSThl9X8/ELdrPtd3f3ZODHcWMF+IaO7revQifLtTbln7WHSSuoSjq6Mx5zoQ1XbQKseJMhOSdytfWAT9trf9gZHBcF0rLGpdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712904563; c=relaxed/simple;
	bh=3S9fzgrhpr37e6u603MyEzK4ZDEnNNexKCWCZt2/GWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM1jksl+QV0nNLzs4jcO2PJc059BO1ZQFMO63nQhniEvd3lk2quRZczsIONcMgfVlN3TdR2pVC6XeYTlAf1UKN6136jj6ADU/eP87EM2o7Kqh/9UK4xW+oePvgqBlhLsDGHSARGWpsucOHc7NDYGc/YCtdUFTasjVXEf8N1JxgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ZJTX6YID; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e3dda73192so4558725ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904561; x=1713509361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=ZJTX6YIDsUIvoYWIEHgNf3u2ZCqaUCbxV5PuIoUXUlEjRpWoW+tPRYncGOyQyNw4CW
         U55Us/ijMyt9WAi5VBI9dm/9Ap7oQgJsfGsGLeDqH/prbiIXINHMOfZn6gomI24MiFMi
         rZ6qRW4Pxs9MOb+WTEOHi9KUmjYHP9BifRbXOwHcrQtqbmnOUEoiSDx2UL4Bu7EHaomZ
         xBLWWMMaeGE/d/+Rvod+lDSiuV+JlP5QmSc2H9aei8Iqf5s5lzd4NFeRmuIDejbxla/o
         sKKLBd2IEBfmwdTXD5r213SPTtiSXPPAsqWc5YQK95k+aivv/2kTtXZ6LCRwFcIRZwf2
         TycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904561; x=1713509361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=vrTELwhIEAi1EgQcoeP+wKF4FK0zVYNXAoDDeNngnuq0b810gV+LeioyHrujcroN7l
         RLDyitnvteSKD9drzK6sXMsYAcf38vtFAvS71KO2zINhIy2Fsj5fMsO6/ZjWcTn18wNH
         6RPZ9gRNupQFeJWS+AjJm6eh5mxGYocH65xtaW49WzeY4qOdObNfslvuXfydKHkXJa1g
         /v5CDwFEygaKmChjF0Y+bshhibRYwovT21gbNuuZrHFTsKnlQ7aWW7kCV8lCzTeJmz+C
         PIkx8hO5HooEUOOcN9I6rirIRf+hdEkejXZKiHj2hyOMQAIfz97EVCWZFWP3bZcyFzus
         k43A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+gK9uQ6n3mseULHBcIr5mGON0JHZlCCfRvImJOiQVAjt5r2tP0d1bZaDHzThaxfkyrKIIVlWC92pen90trc1GG7WsrZlFy3K
X-Gm-Message-State: AOJu0YzIlK4mi0i02P6s0B/7AMSqCsrEfhqOd2hwVcYcC1nA0tvPWJhQ
	mMz6EUc83c+Rj5D+M4zFdayNq3t306Kf/RFesKK5oSZM3lPy/sreNY04bKc8IQI=
X-Google-Smtp-Source: AGHT+IGm9y8I11+R6SyRv/t5G6RHmcLUsT36+9WxupmJkWY3E0gV+Me9Ik9kATEAv67/WzjE2CXInQ==
X-Received: by 2002:a17:902:f711:b0:1e0:157a:846c with SMTP id h17-20020a170902f71100b001e0157a846cmr1494556plo.55.1712904561015;
        Thu, 11 Apr 2024 23:49:21 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:20 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:01 +0800
Subject: [PATCH v4 5/9] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-zve-detection-v4-5-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c

Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v3:
 - Correct extension names and their order (Stefan)
Changelog v2:
 - new patch since v2
---
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..cfed80ad5540 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -381,6 +381,36 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zve32f
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve32x
+          description:
+            The standard Zve32x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64d
+          description:
+            The standard Zve64d extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64f
+          description:
+            The standard Zve64f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64x
+          description:
+            The standard Zve64x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision

-- 
2.44.0.rc2


