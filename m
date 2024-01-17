Return-Path: <linux-doc+bounces-6914-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87C82FF03
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 03:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E361C23D07
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 02:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84207494;
	Wed, 17 Jan 2024 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yKvYnJ8a"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1712EBE
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 02:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705460076; cv=none; b=UbAsyMbBJgYSO+EE+AwIGb7j7AbrbzBgDU3TJimXu2aZcsgC5b+a0JDF+Fg4n4wkqZ215Po7o5sRt3+X2sVVSAVDotF7p8zUXD0xBlNsyVIZ2443fsGPwrQ1GZZ6inq/0/Uo9zSbt392ybJiN36BCPFbLP2eNz8gX2xn/GbE4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705460076; c=relaxed/simple;
	bh=Pat7RCigSa5r0JFjA0wxBgqZn7nz7o/oQLmsEgnHH2c=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=EgP9dxF1zD7kOhZ8Qwh/17IcrT11xTdx7Yru0QLg82pxkK8ekpRM3q7gn5WqeK15cCFK1Jx1U8hzK6UrroYw7LptHVHx7q+AbOUeXBXvsdIK91dJEGt2tFnAtb8/sFTAu5w6QjUKIxXxLuiZbbGzB3Ii1wu4flpfDS05BpQHUDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yKvYnJ8a; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cf87cdc4c5so1188054a12.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 18:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705460073; x=1706064873; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WW6+IaUJP6Uf9B7rnL7Xu6F/dmlNlrgMHD5+y/WRt7o=;
        b=yKvYnJ8aI609cZCreVFkhEQu0vBFx6utv9z3d232owe9qK5Rz175M+WbI3O3N+hiw5
         ncHJkNuK7kW7a86WkwrjHu516lhX1CNN+fo73rsmCEIf1rUDOCMHbazdlQIXhmB24kJO
         aQJSjKT9CkOg0hz/XInJFoC4T+TDKNPz1Wis8UrKvmVuLAyfdLo+MyNVPBHs9Dn2T+zw
         63STa772b2gELCat20kgZxykzOPQ6zvMcQT7NT/kb1NsB6DuBkMI/IEkV59zPcYjkpFV
         QIWv/gXXLbD16D3PdMr3Ymc0FvUj+ZE19vfo8iDZh50GGNuYgVT6xlRYycZQLge1fRfM
         JdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705460073; x=1706064873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WW6+IaUJP6Uf9B7rnL7Xu6F/dmlNlrgMHD5+y/WRt7o=;
        b=I4oyUM6SJHyLMyb6M1U6+weBns7uDDrPJf4MeJOfYBi+W4yypnRMlNA/LoTl0TVs9z
         3E4PSjmVJoMH2C3SAlwJWIm8GSX3PjJVGqHw9pz7vDcFWBMLZSAZB9nxilH8+C5jQXd2
         nvVionZ9VJn9w8zXFfw6/MrH9s2qkKXJB8cboLBvPYr+GqLY3EFVmDnSoxL87Si/ShiE
         FcrkPGJl/rAnEhXlSA7WsYF+unhab5lekM7XUjZz+H5VaTmzfg3JS0fOgL73A0B+oGKR
         Arp5JqwdP2KER04U1IkfOxUs+z4IsDyTz3kecFjaHqT2+oE7b/dFvyWYHdGJPe0HrDq3
         vOMA==
X-Gm-Message-State: AOJu0Yy9JgotOkD9l46P7pdl1pElhIC41so8PtCm2/Pv1Der62g1CD4n
	U0EkdQO3HDrPER0S4OW6H0ZhZMCSIiPbAw==
X-Google-Smtp-Source: AGHT+IG2975QL4XvS61VVnkh+DY0sUA6kjqqd1RbHkJA8u5avvluT1b66g4NZGqLNlnulLdSXj2jng==
X-Received: by 2002:a17:90a:7087:b0:28f:fbf7:c3f8 with SMTP id g7-20020a17090a708700b0028ffbf7c3f8mr99106pjk.80.1705460073270;
        Tue, 16 Jan 2024 18:54:33 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rs3-20020a17090b2b8300b0028ceafb9124sm12553531pjb.51.2024.01.16.18.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 18:54:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 16 Jan 2024 18:54:27 -0800
Message-Id: <20240116-fencei-v8-0-43a42134f021@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGNBp2UC/23QTU7DMBAF4KtUXhM0M/4NK+6BWMT2mHpBUjnIA
 lW5O05F0whl+Sx/bzy+iplL5lm8nK6icM1znsYW3NNJhPMwfnCXY8uCgCQi2i7xGDh3qU8GonU
 qDSDa5UvhlL9vRW/vLZ/z/DWVn1tvxfX0r4LoXlGxg85zAIcYPCG9llynOY/hOUyfYm2ptJMSN
 klNUvCG5ODRYzqQ8iEJ5SblOtNq1I6kY28PpLpLBQjbwlU1GVVIlHwPOsoDqffSbVI3OQzIGqM
 loqPXmr3sN2maBIVomlVKhwNpdxIff2ubtC6BQcUYPfyTy7L8AiWfKZ37AQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705460071; l=2486;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Pat7RCigSa5r0JFjA0wxBgqZn7nz7o/oQLmsEgnHH2c=;
 b=j+zlsJvLP6gWKyP33srwPabTq27bJGfwwrXSeGvgu7PyZtodOZyZclbdcb5Xf0rPgpm+Ku3Fd
 e3QfmvR1XObDnJcLkrWu3JZD090iqBz1sSMQcYDA6RcR13e0Wu+Jq5v
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

[1] https://github.com/riscv/riscv-j-extension

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v8:
- Only flush icache if migrated to different cpu (Alex)
- Move flushing to switch_to to catch per-thread flushing properly
- Link to v7: https://lore.kernel.org/r/20240112-fencei-v7-0-78f0614e1db0@rivosinc.com

Changes in v7:
- Change "per_thread" parameter to "scope" and provide constants for the
  parameter.
- Link to v6: https://lore.kernel.org/r/20240109-fencei-v6-0-04116e51445c@rivosinc.com

Changes in v6:
- Fixup documentation formatting
- Link to v5: https://lore.kernel.org/r/20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com

Changes in v5:
- Minor documentation changes (Randy)
- Link to v4: https://lore.kernel.org/r/20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com

Changes in v4:
- Add OFF flag to disallow fence.i in userspace (Atish)
- Fix documentation issues (Atish)
- Link to v3: https://lore.kernel.org/r/20231213-fencei-v3-0-b75158238eb7@rivosinc.com

Changes in v3:
- Check if value force_icache_flush set on thread, rather than in mm
  twice (Clément)
- Link to v2: https://lore.kernel.org/r/20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com

Changes in v2:
- Fix kernel-doc comment (Conor)
- Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl

 Documentation/arch/riscv/cmodx.rst   | 96 ++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst   |  1 +
 arch/riscv/include/asm/mmu.h         |  4 ++
 arch/riscv/include/asm/mmu_context.h |  3 ++
 arch/riscv/include/asm/processor.h   |  7 +++
 arch/riscv/include/asm/switch_to.h   | 17 +++++++
 arch/riscv/mm/cacheflush.c           | 67 +++++++++++++++++++++++++
 arch/riscv/mm/context.c              | 14 ++++--
 include/uapi/linux/prctl.h           |  6 +++
 kernel/sys.c                         |  6 +++
 10 files changed, 218 insertions(+), 3 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


