Return-Path: <linux-doc+bounces-23841-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A161295F6B1
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 18:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B4D1F228CE
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 16:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA85E194AF4;
	Mon, 26 Aug 2024 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A7tZUWbZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A141865E7
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690215; cv=none; b=MJtlggLD78D58rukcdeWkyuVS8kncU2+2EG091tmB5pg0KNIWza+1ateOXXqTBtu0PPSAmc2nYqpuNISIbAWxEG9cPQ6cfCPaqTBaCSGMMnuNu32jYhkOw59IbWlcSEnnyIb4NxI6TCOvpyfvPBdK7bYaixs+uTZ/JiSgRuWP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690215; c=relaxed/simple;
	bh=Ggjt/PK8ZO1KdyZKks/DPga8mkjKTc2hpGQom8saAb4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3GP8VQFpXtdbnkmi6EaeNQEUEWg5owlzReKPsJ2u3LcSa7g33xBpBSgzl3OyH2UnLV1xt/CgOhUCVv1Cym+J7ZdxmRrgrj0wPuQZBF95f4BBiFQ6/h0lnzWR2i8pXbaOUJNTJD8COkace9D+Sf0lZmPtFqRrMk3D8kIzhRdg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A7tZUWbZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-714186ce2f2so3432694b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690214; x=1725295014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzJj8pzBdC/SjkNgCg+eFusMGgeO5OB+75LPuxAheKY=;
        b=A7tZUWbZUnyjaIU4EGAohTjqDSdXGZVqKX6eb1n0SF5vo/5SLp2kWBx8FW7aNTgGxY
         3X9P7EXto7FkdocL4L/aRxdNnrVxMToU94+cKwmDkhwQli1lWNRGzfOANAAk+mYJjuED
         1Nyw4sk4NSnS7sU/kxTtR3QeMVSlcDzKi+THNsWN9zidsr3ZAIig3DN/bjf37kYRBFrY
         PD4+10qVFUsyHJr8iljLRMYx00id/iKEeb1dyhbi3esRZISZ9dOgTbOuY9ZnyL3wBRbO
         PfXUIxG63n4xuCjK6KdeVUYFB6CeaOs+1qlz9FFS2RD0F/yMv9cRoYx9Lrr+Z3s7qpcB
         Zl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690214; x=1725295014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzJj8pzBdC/SjkNgCg+eFusMGgeO5OB+75LPuxAheKY=;
        b=frNIUEz/ACvy9NJBUFliC3zXHCYwBoF6Od5C1+8uBOJTw8uIQhOsKsGwtUn4eJ/ruZ
         RUzEFuB2Yq42Qowm9BR1GvzJoVEIixC1dgpTAKzDGk10Lr7zClHfaI3mkjnhvzHJ42YV
         C1FFsz1cwhc8zDXC1Wq1JFxBw46QDQYF8VAXbHvxol9s7Df/ucdGg2yMhAC2s5VfgEbF
         06crnRRGnMO2K/e1TkIz5SEA1O1E/aK+oi5VG2nAzqsRx7yzKstKti55N+BKG8oP2bi5
         nUoy99RPenHKytJnGQ2lIYy3x3BvaifqDImzRqX0emyPfNbI8aGRYCF2YdvaMrACqVAq
         NgDw==
X-Gm-Message-State: AOJu0YyazL2cp+Km+3t2QYaex3KHoQR3CYcTxncZgcw5BhCJe1L8dgwg
	k6OkAe3wMOFFLwTqpg4tDvcBK5KvjOYlrtHa8FAijJhlgl4ZFBYfMX/adwTs4zE=
X-Google-Smtp-Source: AGHT+IEhhlwfKu+qrTkve0/BmPBWlOtzw1R6AUtvBmtz1f6WqoPjaogV9GfYZT3VAsdVTB8oqC9zcA==
X-Received: by 2002:a05:6a21:1584:b0:1c6:fc4e:e4ca with SMTP id adf61e73a8af0-1cc8a268142mr10196588637.47.1724690213501;
        Mon, 26 Aug 2024 09:36:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/3] riscv: mm: Do not restrict mmap address based on hint
Date: Mon, 26 Aug 2024 09:36:44 -0700
Message-Id: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByvzGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMD3aLM4uSy+NzcxAJdA1PT1LQUI+M0Q8tkJaCGgqLUtMwKsGHRsbW
 1ACMCc6hcAAAA
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Ggjt/PK8ZO1KdyZKks/DPga8mkjKTc2hpGQom8saAb4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9bJn1kYurJt9sPFIkVbf8aYlF/gv+z8qKVxUu/jzd
 55zGU0lHaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEykKZzhf8qODI2UOd4br+q6
 KG81cMv9HxRemBLzcrrfzp5uJ5WcZob/ldOX7r8f4GB2olQ9arpc/sQ6tp6gpnXpU9fu9NlXbPi
 AEwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

There have been a couple of reports that using the hint address to
restrict the address returned by mmap hint address has caused issues in
applications. A different solution for restricting addresses returned by
mmap is necessary to avoid breakages.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (3):
      Revert "RISC-V: mm: Document mmap changes"
      riscv: selftests: Remove mmap hint address checks
      riscv: mm: Do not restrict mmap address based on hint

 Documentation/arch/riscv/vm-layout.rst           | 16 ------
 arch/riscv/include/asm/processor.h               | 26 +--------
 tools/testing/selftests/riscv/mm/mmap_bottomup.c |  2 -
 tools/testing/selftests/riscv/mm/mmap_default.c  |  2 -
 tools/testing/selftests/riscv/mm/mmap_test.h     | 67 ------------------------
 5 files changed, 2 insertions(+), 111 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240820-riscv_mmap-055efd23f19c
-- 
- Charlie


