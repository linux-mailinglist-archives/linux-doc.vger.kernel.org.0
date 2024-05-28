Return-Path: <linux-doc+bounces-17122-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A238D1FDF
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 17:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2341F24413
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2024 15:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A61171640;
	Tue, 28 May 2024 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m7/NlM3S"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416417084D
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909058; cv=none; b=bZbqVyp1Givm0smBs3IJ6+m1iOhTKu0/iUsF5e8RYraq72HG5TrggSeSxQ6STB5TT/pJgnt2oHG58ihBQq67QnF37z3b/Z68e1PLQO6ZLRNT54hauK54vo9YkZOMBEVRyb2QWY67TW8i/H5Ly9Kdmnj6FF006LJsqI6IUOKt6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909058; c=relaxed/simple;
	bh=CJR5ijuAPP0OxGC2o3LndPnStx7BgQTf9sVBO3oNvzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ke0jrh5/IUdKxzDYZ4qIxFW6TPUV0Q669yEqOU6qDfCCD2atmORC7Lp2lyGeCmbspwdgKPOPr4w+Gd9ouB6s7HI7CNqHyewfQrKoo+3usrlzar/uJGPmX2Txo54u4u5vv2S8E+2797TFQL6axu+en3wwAOUNo+7TchyjjGreB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m7/NlM3S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso4112855e9.2
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909055; x=1717513855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0AGpQFir7bYkY6Hm/qOL+w8L3+MGNDSpFH+GMgURdQ=;
        b=m7/NlM3SphncbkbnwVkDjnP9JpIRjqVX89ff5dRcH0RkRw7lXcjxigQcCZa7prbWje
         almcX48vDmdlcWGaA1L6APIwY6fXRs+p/oUpW6MHwRz2N8v52uAh7e1zwAHu8LnjaLWE
         F5j13D/UKuVIeTnPYGG370f78BrGISkWKjQ31ZF26YvN88IkIIoMiJ+I35JOL8zJbIPh
         z07WreENbZHzt3Vd8KEkKhYKO3h5TTfQ0woJyalKc7+di4j/JYUh/9gY5v7nqsug+UNa
         zvAXPjwqBoxac8zpbuD0oKvhoLa9BD8Hf79FmfgvIaBA+1hObTptoaAOsVR6JGSZD++f
         RPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909055; x=1717513855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0AGpQFir7bYkY6Hm/qOL+w8L3+MGNDSpFH+GMgURdQ=;
        b=udVTb3MP9jAPLSFdhU7B56H7MM6c7H92mEaWV6lLHeoW82qAbjjZ/aRBeBGhMUQwoZ
         2GnZ17lP+uq+fvjubHzzFgjTYGFJVwUK2qQNTO+uzdHXbFJJ5mnF54cJyqxFmRM9uumO
         95gmgEqfB9okcQ/w4+Vd8ypnTFltVeuRemW+wJmsmBNnVPkL11x4YgpKnGWQhZO6iEO0
         pLNz+isZKb81NeeZXaPzbfkIcfzWBGAmqXPzELIEXIoEtC2qUkNFssCQVJEF+MAdRPpA
         D/Uh2KOEP1Kg9oVmQE5mOQ+7pfYHnLweqc+5T7nJz+PkagpncG4ErtHJxSmXGJSwOztH
         rxiA==
X-Forwarded-Encrypted: i=1; AJvYcCVTm2xjMxzyEh52n7QDmUQhhAhOMOPdo8v1lr1CGdGz6rg7XbaRVc31Ts6xFtumwSs4/XlGjzWRHQ9S4nFRFLXbCjBgNfiOZByC
X-Gm-Message-State: AOJu0YxJwC1Lft/B9KJOY+cBCh1iBXwv24YoVCfJMeyTqYDSGGw7Ra2Q
	e/rUT1hxsVIzvlqq70AZtJIKRu3H5iLFHMNgpfz0BDuFq/1SKQEZg7D+Flda6vs=
X-Google-Smtp-Source: AGHT+IHwEZnGvgBLJ+odBijV5gGLQhEjsnEBuwZ3zDPr0k4TFSH0yVpvuN/r5/6VstbLixDjb6DW3w==
X-Received: by 2002:a05:600c:4703:b0:420:1fab:1798 with SMTP id 5b1f17b1804b1-421089fe2c2mr95474985e9.29.1716909054785;
        Tue, 28 May 2024 08:10:54 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7da64sm12293475f8f.4.2024.05.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:10:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/7] Zacas/Zabha support and qspinlocks
Date: Tue, 28 May 2024 17:10:45 +0200
Message-Id: <20240528151052.313031-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements [cmp]xchgXX() macros using Zacas and Zabha extensions
and finally uses those newly introduced macros to add support for
qspinlocks: note that this implementation of qspinlocks satisfies the
forward progress guarantee.

Thanks to Guo and Leonardo for their work!

Alexandre Ghiti (5):
  riscv: Implement cmpxchg32/64() using Zacas
  riscv: Implement cmpxchg8/16() using Zabha
  riscv: Implement arch_cmpxchg128() using Zacas
  riscv: Implement xchg8/16() using Zabha
  riscv: Add qspinlock support based on Zabha extension

Guo Ren (2):
  asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
  asm-generic: ticket-lock: Add separate ticket-lock.h

 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  35 ++++++
 arch/riscv/Makefile                           |  21 ++++
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 114 ++++++++++++++++--
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/spinlock.h             |  39 ++++++
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/setup.c                     |  18 +++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +------------
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 ++++++++++++++++
 13 files changed, 336 insertions(+), 105 deletions(-)
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


