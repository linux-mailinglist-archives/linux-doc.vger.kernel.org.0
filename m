Return-Path: <linux-doc+bounces-14548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1949A8A9A2C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 14:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4A832833FA
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 12:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7966B168AE1;
	Thu, 18 Apr 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="glD/VJY3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9010163A80
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444247; cv=none; b=QXfpaxRQsbner0zdZw1YdqDLiyNg3f/fymqGalRpIiIMmFgDmkwti2HV+pUMTdquGWG2xrNo4+bsNn6szwxuaY8MSLJC2d7GYpQltI4i2oWvWPzpADBQszQRO/C4Isg4Mqh03ZYRoYWAjw3WnUqzIzkJ2E4xzvrjUqKnWKOFlBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444247; c=relaxed/simple;
	bh=J+bCEvF4XFdAFPpf0c/hVBuXUmoAvTnoas5SbNaML1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIVG3OLTqW4XNYNjXD5yohVz/TeFDGNFhfZ/mG1UnpeqBLZBPess7mkrM7pjQ9knIG8mV6a4nxIWexUu/6xDdWEVDR3mjh7Vd4Xuo1mAdVEzIPKnJt/OmKvk4RnQLLq8wqDCVg1dZrDrQCp0KzmpDbqJ3jM6dPmgZZ+oWwaC6Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=glD/VJY3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34a0cc29757so75326f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444244; x=1714049044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCF5E0lf403bRxRvK1+a63xMUHlXis3iiu/dcBPgPms=;
        b=glD/VJY34TARB8xfgGOO4Hip5ayivSYist1quqST1mUcOAZe4Id1KlxtlOYwcgvzE2
         svwdA3b74QA8mac7yCTYzIrJ6DMUgKaxPybrz6JIMJeRHszzh/QhBiap58pYTCNtd+nu
         0J6VZFWa3jQ3dxvVI2bwYqDSweHI3tvkawAg9uFg5XSJz8MF53EX901ZrV7uq6bcMPWx
         g7VHbkVakpmoqXUoQi5f5RvQfEfTCpYVdjNkE08HTqJG9PtQ48hmLfWLOkJuQyqpbKzD
         sE3/jPDX8ZAyl7Ag1EKCmL3Bdeoqv4Vyy2Kly62a63DC+GMF3p74WLoQhcqXoEz041Xd
         w3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444244; x=1714049044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCF5E0lf403bRxRvK1+a63xMUHlXis3iiu/dcBPgPms=;
        b=VSTHYEZHTGNRntoRPq6sWZ3czUguCQJE8eYL4+SBBQzPWzjqmllZo+4gkEA5XlvIwk
         qrLsoTpglyvBlZIRlzACq7hknfCGrwLxdtEo2ks2jdXZamBKNxOb07KZY5yoJbSJPDEt
         hojuVLoNX0ORhhM3/f+Fhxq5ZvvPzJQfFgvaMzwi7SDRm8/vEwlX+dIlPw8ldYERzG97
         T8ZTYaLRjlubbUFA8Q5+9drHoTfZ5E8uD00rpicBVuUg2XDl8Dxad323Kh5RMzJQg/E6
         rxct0Lm61RpApr1BOHtwQMvom+cu/pgOKCWElT4QPj66bArqu+MHFq4wEqYhd2d00p1g
         +R5w==
X-Forwarded-Encrypted: i=1; AJvYcCXfOGMD9GVXk5C8MEF3bCKdZRnz8KECwhsPiR+d1ReSa1NT5pFVCev7raqIo7GR4h9wnVN4jzfqLu44ydy44tY8bDIy8NouEVb4
X-Gm-Message-State: AOJu0YyctJjr0cVXmOZeXETh/p1726LmZteilHHmeOCYzsix7AbS+GK3
	o++MM27Kpzu+zrs/wHrc64YkAZ6Kyj5uY6w0xJbaUSfK4WHqkDdCGxPzZVn8OPI=
X-Google-Smtp-Source: AGHT+IHf5iuv0LIJwrYLLs/M29+a7bnqtqrULSppwC9XA+JzBmE6As/f1Ah2mDNqzxt/R7Bqm6p1VA==
X-Received: by 2002:a5d:5046:0:b0:349:eb59:c185 with SMTP id h6-20020a5d5046000000b00349eb59c185mr1524481wrt.1.1713444244182;
        Thu, 18 Apr 2024 05:44:04 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 08/12] dt-bindings: riscv: add Zcmop ISA extension description
Date: Thu, 18 Apr 2024 14:42:31 +0200
Message-ID: <20240418124300.1387978-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zcmop (Compressed May-Be-Operations) ISA
extension which was ratified in commit c732a4f39a4 ("Zcmop is
ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0172cbaa13ca..a0113cb46893 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -252,6 +252,11 @@ properties:
             merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
             of zc.adoc to src tree.").
 
+        - const: zcmop
+          description:
+            The standard Zcmop extension version 1.0, as ratified in commit
+            c732a4f39a4 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
+
         - const: zfa
           description:
             The standard Zfa extension for additional floating point
@@ -566,6 +571,13 @@ properties:
         then:
           contains:
             const: zcd
+      # Zcmop depends on Zca
+      - if:
+          contains:
+            const: zcmop
+        then:
+          contains:
+            const: zca
 
 allOf:
   # Zcf extension does not exists on rv64
-- 
2.43.0


