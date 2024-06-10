Return-Path: <linux-doc+bounces-18089-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 408209019E3
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 06:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7931F213C9
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 04:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B321C1862C;
	Mon, 10 Jun 2024 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wxn5caCs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069A11711
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994742; cv=none; b=Nq9Gihg3Bedn7zp5EDS3kJL+cT+Q8ml0s7W8uElCA2tEDq+guoxBm9fVEF7qsWyChBs4aJkCvFE6/+I44QjxEAv+C+Xzn23hPbGPKhADmtxiSLYQQkkqYJGj8aq8H+Op5jNnubf+Zxtt6L9GC0BxfVpgls2h5jrIu+iYA4dUj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994742; c=relaxed/simple;
	bh=kilTkVt6+s7AVwl0Le2KXls/6mRYwW97PnRFwTEsmd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVjsGqbNheZQZ2HOpMLI15PSnT+ZADdI+e5NVG4NUPP8jZgkT03TNBSds7h827IcLG8LAcjTtBgSxobol0HoJv6sLOJ+YQpJaC5Jb2ohl6J+rsa+8PkK6VcnaS40dAYGkHgbLPjQRBtDTbjGd3ctQE0cP8H0EH7RVcmZZzVFvKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wxn5caCs; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7043102dcc1so990925b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Jun 2024 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994739; x=1718599539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=wxn5caCsXC0vV09n0dBHjR4UfkxtlzU/kGayio/R1su7uFEk/HX3Iu3Qx26RI62lCf
         vXfs00y18NrU/M8wfXB6eOxjBq6suSglVwJRxxVFGRC1S63D+j4MFAMJrxVeHwFeIAl1
         ElsNb2FBpV4tkfnaGdB0ivSwvJ3eXzAPgrl0klFK/B9HQbm5lkSOOtq37i8NSTH6vZcQ
         U5XTsbnkLkAJBZ7HZMV95APaVouicb0mhmkrKnwCwk9jJ2ktirW28m0q6ZNVv1HJJP9m
         LMNU7oXVLTeeQEeAN49GbE8zbatX69Idg8uCPnIYs0nYaiXskqRq6//fxMHhIQRPD0qV
         JgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994739; x=1718599539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=cCuVpAx8KXGx2CaASzH6Bc56+hyItG98dAZzTueq1qcejKt8HeBzKf0+Zk1Kvm5c7J
         u/qTwZ6HbCucV+CZZaBVkXwQ/hVIIJN8n9xbYdNv4D5fl8mtbibA0lGD1SxuWTtyrtK7
         Dv01SXrvAv/JvsTB7gHNukf1pLzK3queXPiYuyKWzSESEueubX1L2TL+1wr1y4ap7YF9
         tJ4oYLBl44FE9264ksbJDdSdcdjd/8fNqNg0dDcgVXeYJiWF6x/VgtJ7A2czCF8ANCVV
         owqk9AUHQbdv/0mzlKgVnJuKa0JfGlue1ZcOpVa/ZpOwr2/kwjhiMJVYMrNNX9BZSpKT
         NhlA==
X-Forwarded-Encrypted: i=1; AJvYcCVtivh0TDvt31MTvMIS8x/88ae8YQ9EraQEo+gHbhXzd7H722DdycJrgB2+3uZQTnZFTAqYPz2DXvEdn6JSwdU3rQ0KSIVc7d7p
X-Gm-Message-State: AOJu0YxdYLgG/hww4Hba575aTNlf9TYZPoGTuSK9wFq321cCe+uURBr/
	/+a3T5mrxOR+kZoaej9I3Eg9rQ6xg5ZXUuaJfXxbt3XGwlsIcD8rB6ZEgYSxyM4=
X-Google-Smtp-Source: AGHT+IGAB+vWm0sGCNa81cmJyCujrQf8On8Y+GxMGYRiKcexYZGA6hr44N3kBkh31p7uFMVCcWAQvA==
X-Received: by 2002:a05:6a20:3c88:b0:1b6:4151:6158 with SMTP id adf61e73a8af0-1b641516226mr4498267637.47.1717994739324;
        Sun, 09 Jun 2024 21:45:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:07 -0700
Subject: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1303;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kilTkVt6+s7AVwl0Le2KXls/6mRYwW97PnRFwTEsmd0=;
 b=4RRz7xmpcb7CA1ZMWQZlS9J8l2HdlB2OzfAfqDm1wbd8Q0dPdolWk/sqmZ90bsZ3IlYTtYYew
 po+8/cap559D5Bi2X+IDlt6JHWqySfqydxCXpaM/iRpkxwpTP5F3ksW
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index 301912dcd290..5e578df36ac5 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -28,6 +28,13 @@ properties:
           - const: sipeed,lichee-module-4a
           - const: thead,th1520
 
+thead,vlenb:
+  $ref: /schemas/types.yaml#/definitions/uint32
+  description:
+    VLEN/8, the vector register length in bytes. This property is required in
+    systems where the vector register length is not identical on all harts, or
+    the vlenb CSR is not available.
+
 additionalProperties: true
 
 ...

-- 
2.44.0


