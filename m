Return-Path: <linux-doc+bounces-20950-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D175D9341EA
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 20:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E52283C0E
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 18:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69319183079;
	Wed, 17 Jul 2024 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J/DxneL+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308618307D
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721239686; cv=none; b=PEnw2syax7hDfIWRwoEaBL+s2XaE+QV9EOUytvixtZB/u5tkhJesMlEl3Kh3eED3Zf2qae9pCOXlOVQPIG5gahf9SUL99oDzm9/VGARi65oND3aVJOVmLP0UmO6i08QwSTWbPZ2h/n2pxmbKHy7s2xFoe7V8gneT39JPFt1zknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721239686; c=relaxed/simple;
	bh=VZ+ptb5/iIkiutVZvH3vWk7tuQJuxm9TUz3Eu4jYdEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y61YD2vzUUG0vKvMW50ni6K2YFMkOuxwwnKUZiNG0JjH7wqDxHGfsYutcP/vEvsZhK6T3ufl3bDq73qdKEgy8iOtyWFQ8g5l04PrlkGLfOL8mobOVTuBPcsWEdWyvXM1COS1JkkOugrPn3rk+WcR6cFRnI7GEw22puF0RmWQfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J/DxneL+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b4267ccfcso5304447b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721239684; x=1721844484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUFp3GnkpqVp/y6KcOE20AdjWwwd1sTEzLAAE9pe+/o=;
        b=J/DxneL+AWZBXt9pvAngklLNoyUt8m0y6IMgwA0eZlPNehSGM+ECfu4lJihUW4GK8z
         SOj3Khd3ZoTmxtAnMYy9EWyPtvn2FpWi8vueFtcm1ychET/UOU80Ah8q1N4lQcGYPphd
         qJXkogTlXwIJbtvexslf7NHIQcKYXxFnok+IaxHYMJWE5GfnOtneQMxcnVplz2kE4NFG
         XEKGScBa0HkLWxNv9WyeEJWmq02KoW4Bd4mPBkY2ipjMdXWvP+YE14yaNU7W9PgPHsrV
         9KyBW6JoaXBQW3ej50fcki9ST7FUeH3++44Ot/6d0ojoDMUriMVKsnmxgS1IVy2Evsvz
         mvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239684; x=1721844484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUFp3GnkpqVp/y6KcOE20AdjWwwd1sTEzLAAE9pe+/o=;
        b=cL0a1Ht0QSe3wbbl9EJjRPH47Z7HTbm1DeH89y/tS3Bv/cGZ5IAfDO1e2X0BZLn/7C
         tGHVfSp2+avVuJbiJ/+/iHL/NmpvbK3xg520Am8zF9eklKRlzdr5Ky0MAlnOPH89nOMM
         RQfx+2XtzwjBugyr7QJp9EALrjbPe0Kia6D/GLB7vKZllodk/E8dLpY9//TdDlw9aO+p
         KaPq+8+69VNpMyVkFhtWidEh76ySvAWSj6iGMsmkYRCQzd8tBkoQAK8rEUKSWm/zYZaW
         mpZICb+kKFo5UYb6fJHaDCDOLRCUyaxIPXwkjPxQb1pNs5wcupA8zL9J2hEQE0yrqgum
         7Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCUAFUGp0Ge3vdAseMrZWdXJSiK2aSobLceoiEC8rrKKuHOxP1dCIIPmZWcD0rA3Pqb/tCdpp5HcLwhxdPNmbSXNAFgfxAJ4chcl
X-Gm-Message-State: AOJu0Yza5nxhNFF0tGqONU95WysNdluk6TR45dxpEkHC/PifY9NBgRZl
	R1XNb7QQjwrjL7aWFCCuBilLwdCfHwCNDUdd0Laz3VJW1wUJ1R7XFKQVG+L5RhM=
X-Google-Smtp-Source: AGHT+IGCzRN+87H7T+nEsW8BP2x3vf5mkxVhWhX6d+Y7pZAT7Zv1gHYjbeC67sduc1psIthsVRakkQ==
X-Received: by 2002:a05:6a00:4fc3:b0:70b:14b4:b5de with SMTP id d2e1a72fcca58-70ce4f1ffa9mr2888731b3a.23.1721239684195;
        Wed, 17 Jul 2024 11:08:04 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c969sm8432332b3a.35.2024.07.17.11.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:08:03 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v5 7/7] RISC-V: hwprobe: Document unaligned vector perf key
Date: Wed, 17 Jul 2024 14:07:27 -0400
Message-ID: <20240717180727.4180475-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717180727.4180475-1-jesse@rivosinc.com>
References: <20240717180727.4180475-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document key for reporting the speed of unaligned vector accesses.
The descriptions are the same as the scalar equivalent values.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
V3 -> V4:
 - Clarify we're talking about byte accesses using vector registers
 - Spell out _VECTOR_ in macros
V4 -> V5:
 - No changes
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 78acd37b6477..f83a13dc4cbc 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -238,3 +238,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
+     performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
+    vector accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
+    registers are slower than the equivalent quantity of byte accesses via vector registers.
+    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
+    registers are faster than the equivalent quantity of byte accesses via vector registers.
+
+  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2


