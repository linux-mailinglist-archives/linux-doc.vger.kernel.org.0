Return-Path: <linux-doc+bounces-17628-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B88FB2D6
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 14:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A382833AE
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E8D1465B3;
	Tue,  4 Jun 2024 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dQgEgFsR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B171465B5
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505311; cv=none; b=E+0+J1VmkpzU22vKFenKRE0NFyFZd1LIsbisfPjAw+BgYdB2phTUZVrFuWL7u99PIifYEdi6wESOszMjeMU54QHMZAWpphW2aSIVa0NSUn5qUcZbjbLyz7zXH3chbQinyz0BL6qFDtcliQovNBqBuYHnq2QmKoBIF5HPhmpfigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505311; c=relaxed/simple;
	bh=hPCvL3jrxL+J63gGE2MNNBK2heJoTkGMVLZcXBK5Z44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCnonI/b4waqMHPrMaipPXHcna59cQHdKcT81VROGEWTEqtEkV8pe9gOklcMA2dQRTsvYvAaVu3Yoh1VEucpbrDBDcca1yejKMFmQYcCN0Ku/hB/7q464wvVkLQoGnhyFqUv1N8xdx9RtoPOHLqersEGz+Y7x4lNBNCINhBH/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dQgEgFsR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-64ecc2f111dso648829a12.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505309; x=1718110109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9khxHJjeUp7ScoJAIwKVgLlPlLRtKzhDoxFrt0oOXSQ=;
        b=dQgEgFsRr4GeysHKSjv9KZLu28hxlWUk2uh88gwIHkDPoqpwg65Ibwa5iEGWcWHIze
         AdBFvrIjBoa+8ZbLiHj0MTQAevSY0Z8okO1CDsm+9lzbAgmFtpIwkAcedUtHfrEsQJ9g
         +BQTLVSDe7D2S6VyTI5uJ7m/kU/YyKLbUZX+PBvX+X/xz7LnFXllK1qmkFXLc5pt9LN/
         VE3/TLQliL0OZCeFDKr8LHgB0/MYMAdUOx8VlFgOTUwP2WOaKjPehqjRR0uRXfqHUAJj
         ZsUdFZKWq1514PVA4LfUBueFQbeTDjG17Zzzt2MfyuXcRESx199VN4EnUi8BQCCME7GD
         PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505309; x=1718110109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9khxHJjeUp7ScoJAIwKVgLlPlLRtKzhDoxFrt0oOXSQ=;
        b=RN8fO5Gj1gKijl3WFf0ZKbd4XfyiMk/WM5wW8SJQm1PbMzvIcylvC80226iuLjv6+E
         3UTUR/Fg084YuFzWWCJevnULX+aCNtnembl55Dg5zCP0eguD9VXZW/NeN22MCaHoF1pf
         rIrD8BaoYrbtanWt3+n4ldn5UgZDMPfXdbeGBRhq+xgxp5hjkhu8o7EbKIkCzoPNI1v7
         perxYa2+IUqzVk+ObQ86gSzOlKH0XFRoOtcEBy/MeKebTUK8B03k5R0p0mqzEu0wgtkO
         9c0etoXVQ88QRJpx9uX67Q+HOaWMRZBldHD6mNaDSemfTjjNWSOAK4Nk1A+eIis41ZLi
         gbtg==
X-Forwarded-Encrypted: i=1; AJvYcCU2hkl0C4y9ZcI3QaUCowT0O3hemM9/eFry26XYqyBWQaTrQ4akRrSNJWUmJJWM+TeWiTX/epSu7p5CK2CjvFZj9f8HFuM8auc8
X-Gm-Message-State: AOJu0YyFd8vC240qt01T51qglnuX+NdRkwBDwDth1tUTmvqyGbsFkeNm
	Bk7aVhgWp0TLLKvbqghwDdF0WMr7HQWjtwFIn4MrBCWIg3CCrtCnwO2xaWKNJyg=
X-Google-Smtp-Source: AGHT+IF51TDxFJuuXTneP6toFhIUeHG25cd2Wj/tvfzjNoZSiWv7LIVIBSZsIbu/lBStuW2IKttk4w==
X-Received: by 2002:a17:902:ea0e:b0:1f2:fbc8:643c with SMTP id d9443c01a7336-1f6370f2847mr137386785ad.3.1717505309207;
        Tue, 04 Jun 2024 05:48:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:28 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 12/16] dt-bindings: riscv: add Zcmop ISA extension description
Date: Tue,  4 Jun 2024 14:45:44 +0200
Message-ID: <20240604124550.3214710-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for the Zcmop (Compressed May-Be-Operations) ISA
extension which was ratified in commit c732a4f39a4c ("Zcmop is
ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 81bce4fa2424..1952d20b8996 100644
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
@@ -549,6 +554,13 @@ properties:
                 const: zca
             - contains:
                 const: f
+      # Zcmop depends on Zca
+      - if:
+          contains:
+            const: zcmop
+        then:
+          contains:
+            const: zca
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.45.1


