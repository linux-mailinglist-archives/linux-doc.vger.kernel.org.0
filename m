Return-Path: <linux-doc+bounces-15671-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D68BA629
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 06:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045FA284204
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 04:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75082139CFE;
	Fri,  3 May 2024 04:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dRLkbyXZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D1139599
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 04:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711610; cv=none; b=rFRUOdf4De0LuI4cQf0HwvnMLV9Arh+pK8GpF69/J4a7S2p2e+/M/vdeznWt3MnnMz/NwNBPZO4IZ153luy3bSWGUHF2RhVMO2Sp4pxtoy4SVlvrmM9PgcrnOrQry8eFXS2IbfQXqD8mK7H1FSgHCiHYrUVOca2jpfmAc3x6IwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711610; c=relaxed/simple;
	bh=PDP+pfWfSCvmvZn17Dj5qqvNgRLWprJakVgT4fj7WMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJZAeS5nN0mjBLhtp94MlNJT+G7k4Ymf30tEb6+7zI9UbK0J86zv2NNDz3XNplOnNYHidY2IIR0NY5fjqIhW7xGZRbGgTrvneYmSk/cveguXMF6U56aUyKXf5NoOM36NqPWUdeINuMhF4BAdL8kw7SV2oJf2MzIwOA2J++byPqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dRLkbyXZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6123726725eso4300044a12.3
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 21:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711608; x=1715316408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=dRLkbyXZ0tAXoqkBWpuTw3doyJopIpUyReaPZezuTJNS2n/czUL+l47YA6yLKa5kx2
         whSJJrnB7AB4EGzOl5ztTsygAvABvzeZMf1hZu6O05ZDN/c1ewRQbKa6HlvQMEJLzX4Y
         WBxtkXCLiGa0kfmyigI49/xpuN8FFd1U6woz3JQXzBfHRIpY9SK5GLoygV7pceRat70r
         57hDRv2S8GlBk1bdBRxsr+SHw8VoBeD0oX6hdK9EJzGiyKU1uHVhOcVh3KuYceHLfFSV
         ZCyke26lEQhV3EWoswcg1cvH+tsCuAAlTV7AYiU6aywU0lN85EknzAacmiAqO1vKOOaq
         cuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711608; x=1715316408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=Gw11xDmy8XVUmu7Yw9DbadKOits6lT8ssc73EmgNKKMxYjETFZHkfkTkfftnUkZrpH
         tJ87LABsQxpLWxqh2iZlC4rmgjGLJ2ldMK3optTPNrr9axPVipibZdkA7zjie6TzadN9
         0l/Vg1JLLuAsNNF0kN1/ZMg7CEpb8NhYX3Gd3YdOpvriUakFZgQ3CWx66IPh7j9gjMJw
         r1as/zpLu4ajyVuEf01Rh36RkB1OTA9EWxR7KslIuAme2HDYwteZN3DDb0qGdEwTeoGs
         eu46mpn3dJ9z4/Rdj3umEm3AgsKIGMCDxehEIi1q8/vV1OyFaxPThjHKZhzbY8E3Kv2M
         dtLg==
X-Forwarded-Encrypted: i=1; AJvYcCXOaSz+f35X38iNldhK054rBdNLyfXjE0QHcf7mY6l7OF8iW38KqL+W95AmR4MmHrQDtygsxyIVK0Gq+/j9RH+wJLDqLbe4fOlM
X-Gm-Message-State: AOJu0YxroNE0tPSOFs33nPJvtF0VyWTNsYwTp4oZmg7cI/4NUTfzSuvQ
	5TU3K1ZkZsCM0KYOKXadRGGQPXmr8f2IQ16V2r81SXikGoKpI1hTEmwD29urVtk=
X-Google-Smtp-Source: AGHT+IEMZ/Mstt6sFFiU0ca6U5szKwLcpC4LSoNcLngJPhJ25wEr0ZAm7TjLPos9QHN+8ULUaJiCHQ==
X-Received: by 2002:a05:6a20:8413:b0:1a7:8a02:3058 with SMTP id c19-20020a056a20841300b001a78a023058mr2053596pzd.12.1714711608331;
        Thu, 02 May 2024 21:46:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:37 -0700
Subject: [PATCH v5 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-2-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=oHDMK2MPe/lkNi4I1weAEI6zuYQ8edaqMwBunYR8EtuZeYbb3YWhKVd0K0WCUGyV8ctpL28Y/
 fK0GFGbIuFsBkiUjtXJZg2jRDSbNRJt95AMJxOSvhqumeibiNGmllJn
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Conor Dooley <conor.dooley@microchip.com>

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..edcb6a7d9319 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required in
+      systems where the vector register length is not identical on all harts.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


