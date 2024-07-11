Return-Path: <linux-doc+bounces-20556-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E392F174
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 23:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED32F1C21E10
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC11A00ED;
	Thu, 11 Jul 2024 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Hig+S9dP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651DC1A00C1
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720735177; cv=none; b=D8H3kxBlDeOn8LkKStCBTIej7WCApSIVy5G4tsZcWYjeh/JM3+8aIC1rxDJ9SznbTWw9ZOWjxFHp3MDSrO1EBBSY+ImTbepRWf3ny+n1wdxiuVwhT6bl1CTwzWmOEFNxfcUwiEJgMSSlHkLzE7gVdehUJnyuvG2J/kA6Vkc351U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720735177; c=relaxed/simple;
	bh=ca1jKAECIV6Byh3TBFvq7NkUZMlXPCPQLpDdPf7SACY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGgGyPXCNseKL3o7HXIVQcc+agdxxukC2yaifa2p3Vu0PHwt8ME6zGNOs+uoaH/3OTtWsaLGbVXgkeIjliP6mEqrDZSO0udwzopDCmATdoXpijowoRDBJS9NaSXhstuMUMauqfffhQYtwup5LtBhWGADZR9MoCwGfOMclr00yAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Hig+S9dP; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c66de0c24bso777777eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735175; x=1721339975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCuLk9WlsPMixoO1aEt9S0RZ/RHTTquN74ekSzN2Uos=;
        b=Hig+S9dPNO0afH9kH4Y8iGZfrcgKfNE6XdGa9hueYV+0uvytDSsfo7P+cLG6UFYQK9
         igU2ytf/20BBZmvO2spWpDE7MdKmS7c7W3rFwZzg9K22QXy9xrzC4xbi6sAFlXePCGY/
         BvyEQpMb1JRCA0MgOGdH6qHDfBalvzudIcaX8rbt416FvdVhAs9Agn+IAXn0LSqvkBpN
         OwSjOkqGF5lmbFcuvMvP2aTHPK7BgosxLNvEn4TQYzGq38gZiZrIHNACmUj04NQbU00E
         e5IPT/gqFM/4aYWWJsf5g4GcdLVc3XmiQCI7TzAlLZpc5+TiuEyXpT4cxIdPffkobsvp
         OeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735175; x=1721339975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCuLk9WlsPMixoO1aEt9S0RZ/RHTTquN74ekSzN2Uos=;
        b=k8hQoJsLmD8svLer2WcDtxPkLSkewaIvXxfRVonLFoLZ/FRd2TbD1PGmiCy94e7vTZ
         qKWuevc0f6maZZZPBTm5zDfm3HYbzB03QzwHDIQmKqAs0YWDz5LtIHpJ5BsYuXDJDfOR
         lt07IENtunMkS43FLcG784Mzv0b2kNsjRrLLCzRwRFmNiH6eeGUf2enSoe12O/rhVL69
         shS+Iw+3W9cHkK7bbwYaSS7qxewsxdaH3lTDFr/hVNdvoviepV6MEPpws9qMuQ9ITGfh
         qtSLSaGP5PJjduY93H/AIGrxTn48qta3/1MfWMvAXQuAlqDF12zVbIVPWSAdHfHQuKBU
         yWxw==
X-Forwarded-Encrypted: i=1; AJvYcCXNu1oZTLhB7dBJDSc+8t+dDGRqY0vEfXq4BLZgH3FdPiuPhEXSIV3S//BD5ydxX9v4KhG4AzsZXLEoHj3EOad8TteUQD2pGAj8
X-Gm-Message-State: AOJu0Yz7QZ7sdRVXUzErAQZmv60Y1MCFzr00fgYIlagUletMiXth05yZ
	WoYsUvrbzjIGKoKI8RjlWlXa7iiWaoqli3UrTctPsR1vqIA3tOve9l34yrV4Vsk=
X-Google-Smtp-Source: AGHT+IGQzKvzyOpT3WBbfYdePwka94nZlful/AlQ4IvVGo33wfS/hf3/5q08XSlYkvfuRY3zO/SpoA==
X-Received: by 2002:a05:6870:d8ce:b0:254:6e4e:23d7 with SMTP id 586e51a60fabf-25eaec3cf82mr8869452fac.50.1720735175401;
        Thu, 11 Jul 2024 14:59:35 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:35 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/7] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Thu, 11 Jul 2024 17:58:41 -0400
Message-ID: <20240711215846.834365-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.45.2


