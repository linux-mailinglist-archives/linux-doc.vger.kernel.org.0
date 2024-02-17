Return-Path: <linux-doc+bounces-9934-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88192858C6D
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 02:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC33A1C20F5B
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 01:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7ED3C062;
	Sat, 17 Feb 2024 00:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zRcBWut3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34563838F
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 00:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131547; cv=none; b=VP2wL3RSztPtb8QiNcDdXc+qAnIFiFjH0ojYasrj+t/kxocqVE6iyoKpda2Or70sd4RIeasV98mFFPUhQhexIsNE0KbF2pgPdT+wn8dKp+JqAbQ3eGX+LeRzHNgGqOocCrMKo2NNkjv2OH+HFZJ5ns/RcKh5sGzmtq992axDDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131547; c=relaxed/simple;
	bh=Ya/XJ2BT1y/8netb6r38TrbSiZPgoHRnwGgVEj7mjLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tbZBF4KKpMDg5xw9Xg6WHDflYAAekNwg5JCWzx6j+/X0wuJldGjk8gG6Nhjed08y1OtsEXHK67idEK+UUEl44hmESzwOE6UUu5S2S2GhdTSoQ20MxoRUx6N4Bsw2ytmoY8qAQtlPzSnGiN7VhS6EU9Lt+qm/fLYwaDv5sX+Xs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zRcBWut3; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-21e3c16880fso1312127fac.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 16:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131544; x=1708736344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vDBckQYWb4Du0H7yzxJq6wilfl8k4fp2vqlUJD6o0E=;
        b=zRcBWut3qUJoRlhpLenL/xuQkn+Otm0lxoDneVn8x+LMh07BjbeAjVhfxRNJcMI9rz
         RV+jICeQq3nXoKGvqWX4kzQnv990v5r6FjOI3b++PkVzYlOuqd7KVWFXSzOCZeAFTc2r
         GVRBVXwv0bcYIqHbcWgF6wwAB97bW7944wPAx6Ass+57ffTQVWV2OFmyLlDp5A7rRdwK
         VyG8qNZavf4f5HsAoFB6NYKuBzIf3J9TiTZ5oHYmWFDKCwiCgToGMUiV1aFG9XMpqd2I
         1706Whong9dVsYQtugESgecqqgUIN6BIoH6EK6pnBuoevnmFSmhGTYK/Qp7tR8zRPKgo
         ClKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131544; x=1708736344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vDBckQYWb4Du0H7yzxJq6wilfl8k4fp2vqlUJD6o0E=;
        b=XLhUAKOQROmI8n/i5imAwen5GRmyyu+NCzhskIlF93/aELofa7lFdPUINaU5OyqDS5
         AucDLuhr3tQ5BGtyc7vh+C2t5R2q91shOQHIF85rvtQDtVCSIwo/mt2Kv5qJ6tIp1PmC
         eg9pxP9rhjZcBgtF71yZ2n53E+lsem8us3GINPWkT0x3LX6uixvMKJl4slWJj6Ay/MkO
         p/53mGb5fDgffveAoLjajETmjf0+o2V5d0mD3iV0NXdfdMroZm1wfoWMaeCVOeyUKPhh
         N5QClyeWVcLd7t9bjsgUgrFWu/nUdWFDxY2XN61ZWsAD+MTj6b+bKMrk/NeDwqNZ/33T
         xQfg==
X-Forwarded-Encrypted: i=1; AJvYcCXx3kqcwN0AiquVIwrSdBMIJctgAm4xqlLAl4CyIJpuR96SpdYswlN+lec0yeY6L8PigumkuAqI3Abzap2/Gq9mopym6cFsPeuh
X-Gm-Message-State: AOJu0YzVj8T+jzo589NU+e/VqWZw8cM31PYMSR0O3k3oKV+NGT1qv8Iz
	RNDCRphE83dknlqaP6/+y99bdQ34ovYfQY1JyU/ThZ2UTDzrWICl6uxwXOFbXvE=
X-Google-Smtp-Source: AGHT+IHqkQqjQYTImWOgjE8Z+USH8QzipcCkOvNcsVcXAj1JgydRRCEivR2TUgJmzC2SDHg1vvWlZA==
X-Received: by 2002:a05:6870:478a:b0:21e:698f:5c91 with SMTP id c10-20020a056870478a00b0021e698f5c91mr3327913oaq.41.1708131544105;
        Fri, 16 Feb 2024 16:59:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:59:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 19/20] RISC-V: Add hwprobe support for Counter delegation extensions
Date: Fri, 16 Feb 2024 16:57:37 -0800
Message-Id: <20240217005738.3744121-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though the counter delegation extensions are all S-mode extension,
perf tool can use it decide whether it wants to map standard events
or not. Remapping is not required for if SBI PMU is being used
for hardware events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 10 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c       |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..77fa0ed09366 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,16 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SMCDELEG`: The Smcdeleg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCCFG`: The Ssccfg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCSRIND`: The Sscsrind extension is supported as
+       defined in the RISC-V Indirect CSR extension manual starting from
+       commit a28625c ("mark spec as frozen")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..fb7c6bd6822a 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,10 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_SSCSRIND	(1ULL << 36)
+#define		RISCV_HWPROBE_EXT_SMCDELEG	(1ULL << 37)
+#define		RISCV_HWPROBE_EXT_SSCCFG	(1ULL << 38)
+
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..befb6582b1ce 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(SSCSRIND);
+		EXT_KEY(SMCDELEG);
+		EXT_KEY(SSCCFG);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.34.1


