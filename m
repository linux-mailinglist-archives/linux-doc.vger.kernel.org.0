Return-Path: <linux-doc+bounces-12014-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7F879C61
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 20:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66DB92830B5
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 19:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB51D14263A;
	Tue, 12 Mar 2024 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J8UBmsln"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA741E53F
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272876; cv=none; b=Z/LnneMtyRSRQX/ApU/QffG8jwhsLMtbvnYIfp3h3PC9MQX/cQcJAAO69LgDnGwEvUzQZR2a29vwM9NOCxmodLRH4/sSDjDSUPwH9g24hBU/yFaJkkhE5YSdGUJP2DJ6VTGGfgCZfH1E5YWF09pvrOWGsiilhdOxAUAp4RjobtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272876; c=relaxed/simple;
	bh=293duvTiTO7AmusJrssuEGh1xmveyH0tjDRqNUMHyLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UYFitEKp9KHfSAPpZ0Z0FOUgM05GbdqgvuHH/Fij5JQa/ar1kEknojduZ1MSVxQV89/6gG1aejRzKRDP+6/hkHqdJA46UvoewPWXDRKxaOVS+wUSjfCagb7Zlrnv98+jiVqqFgBy2Pzt/cNKql/G3Sb9qTuN1tEsshcpZ02H14c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J8UBmsln; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6adc557f3so740176b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272874; x=1710877674; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXPeuy0/BW9yxNC4xB8sCNAgbx5dW6dIXCmDi0B+vZE=;
        b=J8UBmsln5+7rGD3HdFighDE/gPZbpitGC5PF5T61jPTs8e8a1OqI0VLkVd7Q4OY/0c
         06tOdIlwUXfHPV9sfxWVRiJ4S0lXGOaV3tJnKNms02XDjJpCi9xe4BzQ5O2Jg2FNJsGu
         wp3e1OV14cxaiHnXi7scGA8rPf3+l0NTzn1xQbeekWoTeVPJls7kEV/Xr22kd0FBvwM2
         zrxTOn8IMf12V+9C/AZthjLQscr+yMBcj1/xl6YtazVLwvvj/AXkXIXeSqqxwJJqkluK
         257iWLiZy1bOpFWw0QHs5Bvl+uAM9hw/fNFSrBzhFxy8nBI7C5C+WxIUhAkUsUxWj7nj
         qmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272874; x=1710877674;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXPeuy0/BW9yxNC4xB8sCNAgbx5dW6dIXCmDi0B+vZE=;
        b=YgnSpDdKHX7VVkjoQQV219h0+JuiTCVgnYM5QwUY6OO0SM3VVxzwL/AU/NI6S6WPnt
         UMnp++sr2XsaDehVFSy4L7uCioSJJD7eHIdXVUjbHrXegK0kr440FWC+hOCpLSk8CX/3
         JAjH02SwhdiwItsviaEzcu1vObfL9GfpI7T9zT7twb69xKDc0Q8mLglstH75h3QTMLxj
         Gh3j7f9W3pInKtkHdrouNfyFnxx/UjiKyYfXaGcLx8+M/bLTDVRdfFlvbYP+4Fg2aCzf
         MQ8rYsTT8iR/3E833mm3KyQ2DuZvk2JzuecZaLFt6+XtGcwIMjT3OVP9Wg3C5mr/kZR3
         fhug==
X-Forwarded-Encrypted: i=1; AJvYcCXduywquYZBOwJe5CZeKQI+dCt1VDOk6TjCRbvm7gw6yOEdOcfxxOX0BcHPFW+zzbjLljC3312rBjfGPUPW+mlc6kLgxBE+uUWB
X-Gm-Message-State: AOJu0YzRVBg62iJk4G9z8gEzEBfjImlKDKGUqGlrMsuiRmsTOu7firF1
	kWaNUDgWBLk2j/kP9NM1SaooipJMoZCJ7K+Iu46GejsJnuG09KRht4Bnk9XnkLI=
X-Google-Smtp-Source: AGHT+IGX+D68w3x0dx2Z04bccP2/LvAA03/ZVesfCrUprbQXweWUXCgMYw858hcbQuhpxX/TUksKjg==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:98c2:aa5f with SMTP id le11-20020a056a004fcb00b006e698c2aa5fmr521086pfb.10.1710272872891;
        Tue, 12 Mar 2024 12:47:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v12 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 12 Mar 2024 12:47:50 -0700
Message-Id: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGax8GUC/23Sy07EIBQG4FeZdG3N+Q9QqCvfw7goN4eF7aQ1j
 WYy7y6dOC0xLCF8/7mEa7OEOYWleTldmzmsaUnTmA/gp1PjzsP4Edrk80XDxAKAbmMYXUht7GN
 HXhsZB2ry48scYvq+J7295/M5LV/T/HMPXrHd/kUwPyJWtNTa4MgAzjL4dU7rtKTRPbvps9lSV
 i6koF1yluxsx2KwsIgVKQ7JELsUW02toAwLE6yuSPmQkkD7wKvM0ksXOdqelBcVqUppdqmyHAY
 EBa+ZudZtV8p+l12WJIEuWymVq0hdSBy71VlqE6mDDPCWKtKUstulyVKKQeatyUiMiuwLycdu+
 60mcrs2BuN1TYJKKo+vQNuOWPUaUQqCr1kclotRsf2jAME6sooB/2e93W6/1CkogegCAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=3671;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=293duvTiTO7AmusJrssuEGh1xmveyH0tjDRqNUMHyLo=;
 b=xtuAngWCeGAUg9P52pp2yKzuuAbwPl3UJib33NKZU/1Dxerz2QYNQ7V4pB0PfDVTXyJyWLZcr
 JdYKO22UIY/BwTV0UJIuKkwFOrt/GGw9lXiuE63FO7OGqMH57tfX1XX
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

Patch sent to add PR_RISCV_SET_ICACHE_FLUSH_CTX to man-pages [2].

[1] https://github.com/riscv/riscv-j-extension
[2] https://lore.kernel.org/linux-man/20240124-fencei_prctl-v1-1-0bddafcef331@rivosinc.com

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v12:
- Use context.icache_stale_mask instead of thread.icache_stale_mask in
  PR_RISCV_CTX_SW_FENCEI_OFF (Samuel)
- Link to v11: https://lore.kernel.org/r/20240212-fencei-v11-0-e1327f25fe10@rivosinc.com

Changes in v11:
- Add back PR_RISCV_CTX_SW_FENCEI_OFF (Samuel)
- Fix under nosmp (Samuel)
- Change set_prev_cpu (Samuel)
- Fixup example testcase in docs
- Change wording of documentation slightly (Alejandor Colomar)
- Link to v10: https://lore.kernel.org/r/20240124-fencei-v10-0-a25971f4301d@rivosinc.com

Changes in v10:
- Fix fence.i condition to properly only flush on migration (Alex)
- Fix documentation wording (Alex)
- Link to v9: https://lore.kernel.org/r/20240123-fencei-v9-0-71411bfe8d71@rivosinc.com

Changes in v9:
- Remove prev_cpu from mm (Alex)
- Link to v8: https://lore.kernel.org/r/20240116-fencei-v8-0-43a42134f021@rivosinc.com

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
Charlie Jenkins (4):
      riscv: Remove unnecessary irqflags processor.h include
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
      cpumask: Add assign cpu

 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 arch/riscv/include/asm/irqflags.h  |  1 -
 arch/riscv/include/asm/mmu.h       |  2 +
 arch/riscv/include/asm/processor.h | 10 ++++
 arch/riscv/include/asm/switch_to.h | 23 +++++++++
 arch/riscv/mm/cacheflush.c         | 94 ++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            | 17 +++++--
 include/linux/cpumask.h            | 16 +++++++
 include/uapi/linux/prctl.h         |  6 +++
 kernel/sys.c                       |  6 +++
 11 files changed, 268 insertions(+), 6 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


