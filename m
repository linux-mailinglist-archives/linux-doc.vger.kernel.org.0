Return-Path: <linux-doc+bounces-19346-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F9915B3C
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jun 2024 02:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2A2281882
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jun 2024 00:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EED43B782;
	Tue, 25 Jun 2024 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xB3SJYS3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34283A1B6
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719276737; cv=none; b=RIxdpC9tHWXWtSezGOpge8TKMPBbE6lVqXYia6zNB32pjpDwvgKQ1Pn+FAg3MlkpsrCJg7P72tM3tJrQCDyzW05JGF7/4cPv1cIoqNZ5nt69kvFQcrH20KiNJtkt1zVeTZ0CLZpCJywt1kju7BcLT6U+h2R7u+t4KQEiAOt7r3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719276737; c=relaxed/simple;
	bh=VwerV7my9tD+Ybd80jCAHL+Lp6Y9EYafkoI4KG/Bsko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFSX0ouzgi2ep/+hQOlOo0XuRpaa0qqn6zajHetshaTyS2b31oTx4qXK2YW1dwCHFPEYKIRcjlPo1kZr0q4oeFTe4CYTiuKMA8c97cPNx7XDvVUfK/k7zO+ub4i98NM59FYqLBg5Q3L1OwRXhF7r3td17UsCqsv0WvVZ9ZtEIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xB3SJYS3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-706680d3a25so1775116b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 17:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719276735; x=1719881535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPS8Htynt5YVDBSwFV34iezZtSuGdE5NHFiA6AMckwQ=;
        b=xB3SJYS3xk6/Qx0e62uz9Vy+QZlC1WS62/d7nyCT2XNzowDATbXyppsF2Wl8bDlP++
         ikDVVmhK/mS5Ym+iMPM1EaCEIRqTV7H+Hzag+0cH0oOqdEDsV/zBAPd2GU4qioAiyQ49
         pK3yztZ4lVAQROYCjQjUbfoFhL0LiG1Z3Yl0nbGIxiW6ipNhdn3hOu9TS+DsBS9gSDh5
         oGKq7ot3q/JKrl7Ax7NavBy74IRfbFYeuGJoM3LUDype0/kzUeFNL5eMb6GkJCqN0JpK
         lH1r/apexh87vw0Fbct92eQnEHikr3x6jvQpJ5E4TFKUG2Cw4XLDdH+4r/enIG6x7Rbk
         Hihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719276735; x=1719881535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPS8Htynt5YVDBSwFV34iezZtSuGdE5NHFiA6AMckwQ=;
        b=BtQtCgM+spTz1azi8umCZTVDuYKoE18P5cYE/IqZfixuXrbGqn3iluyLMJvntL3xus
         TzNNuHZbuD6uxFgYVA3r+QtPJR0Vp0ajMD2xq1im70Kd1t0+iohkpRv4fB1LnwW/9eUf
         F59X5a66iQeJdPH5YR/mQAvZTsE5y5uVZ9uZcimIkJZX1VbGfiwOSA2VnQhU1seHCaju
         rbPV4xmtlfAfhNd1hqEYdeiItnOvngURPKdYxFlILIWTyy50rSPhdHfVvTlEbl5JSTt0
         AFATwAzH8CUKmr+96AKcgBd3jIkhL4lvCDVrhXniCvhPLHoWd1MCvdBIs23xMbWOu0Lf
         30aw==
X-Forwarded-Encrypted: i=1; AJvYcCWZBpXc5tE6rI8ps6VkHo7fQnc3k8knrnBJGQIWrT7vKKbP3y/CwhhY8BE7aT0H39r/wXmB0NXYa1KFsiyRruGT4MSJGdDNN7Pz
X-Gm-Message-State: AOJu0Yx/TboU77JqVv6nibGpsiZ+qwWjA1hagI7N71aZs8XCik3apaR8
	cb/MJ5cOswb4shYrHGgqjfzc9yds+fYzpFoI95H46T1uXok7AGlWGskhJ+MalaA=
X-Google-Smtp-Source: AGHT+IFXUAdJamg8ygnbLMv1f2WUsJYF7iboeHyAr7Z6Y+bevFXHoxCdZstz+th6Yy52wYFD6MOksg==
X-Received: by 2002:a05:6a20:da96:b0:1bc:fd7f:4545 with SMTP id adf61e73a8af0-1bcfd7f49femr6118715637.8.1719276735396;
        Mon, 24 Jun 2024 17:52:15 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a7csm68150235ad.256.2024.06.24.17.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 17:52:15 -0700 (PDT)
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
Subject: [PATCH v3 8/8] RISC-V: hwprobe: Document unaligned vector perf key
Date: Mon, 24 Jun 2024 20:50:01 -0400
Message-ID: <20240625005001.37901-9-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625005001.37901-1-jesse@rivosinc.com>
References: <20240625005001.37901-1-jesse@rivosinc.com>
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
---
V1 -> V2:
  - New patch
V2 -> V3:
 - Specify access width
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7085a694b801..d102b4a16d55 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -236,3 +236,19 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF`: An enum value describing the
+  performance of misaligned vector accesses on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN`: The performance of misaligned
+    accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_SLOW`: 32bit misaligned accesses are slower
+    than equivalent byte accesses.  Misaligned accesses may be supported
+    directly in hardware, or trapped and emulated by software.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_FAST`: 32bit misaligned accesses are faster
+    than equivalent byte accesses.
+
+  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
+    not supported at all and will generate a misaligned address fault.
-- 
2.45.2


