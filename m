Return-Path: <linux-doc+bounces-18944-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705A90F278
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 17:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E19C1C217A9
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E6C15821D;
	Wed, 19 Jun 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BDKiOAjQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0891581EB
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811673; cv=none; b=P4iECfMnDyjmxiBl6z9T5n9ttN5IEzo4SWAZknDmtYkB/uLsp9CyvvWHZWyd1w0l588xkJjOXzMM9/IfnQsLg+9gIdjoAp1YaSNlDlKbQM0XqluoficK+ExujnQZM7LCbfu1x30b3zoeF8bwTqJNor+lvwZp5od3SlK0y9CqHS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811673; c=relaxed/simple;
	bh=ImYuYL+MTKJa/2J5xW9/DgP7trO3Lsm5QYHKt+vupEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TfMFHN386jvaksfEZB0zdqBfP1oZloPvkRNbkYwF/DbRof98+kMdGxREhxq/hlGtCBQHWXgU6n9uCppCFXRJDJUrOH8eks/A1rM3HsmV7OVWynX58YPWuLxPl8Vt7ds8ZN3humUVcFPItWXsA53NiJV6ceN5fVWRVFwWNQATTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BDKiOAjQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42479dece93so336065e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811670; x=1719416470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sG05QgwdQ7sARDUt4CTUt6qfEG9g0T59arCJfjRkJ9s=;
        b=BDKiOAjQqdupNqKFVBZqIW6SnnpuvYPoSsJjyCNjZtMCHNXQpQ4+/SZCkTkChZKYbV
         I4bRZLUjhS69J2boZEXM3TNRrw5TCQu4OiXRsAxusmuQiNsWzxEzEfJ4Lkm/ASeSV7QH
         YCdiDebKxnf2swtxBkfLXCjHGhTPc0+OAgFSrxdDmAvMTGSrO4piVzt1eMeXh/4zWou1
         7bfR9DBv1V0A86Wsy4lGEAg19U2lZNdVw+IECgA01rw89ObwF4+izkWZ5Yiao3HLN66G
         WqL8DlzRB6Agtj6qhuPwkmsoM3+X6Y1E9fe9cKzbdjPzCtOjd+o8BihJdIADPDPLYDms
         Nnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811670; x=1719416470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG05QgwdQ7sARDUt4CTUt6qfEG9g0T59arCJfjRkJ9s=;
        b=YJi6WOyiw7VyWrqVraCxREYBXDhUAJjegEajN/lp4P2cS0MhPIsueXHNvatlLAsxk2
         xy0h4Nu+0i+G/7nBH9sK3a+z7Wmn2F3ZkqQcPK6UxAUGaghVe0pMn0fVeu7jj3eknJX2
         sJLK3Aal0uENr6aslnPJyH/Lcjpd8JepGGMDAsqZrRJCxVEc2C9LpNa/+qXMlS8pxn7X
         J7x0qO/yIJjyen/Q2mpnPuZURKuVb5fwFXiM6kPgT7Wct7dJ2nQyP/7SMg24HIVs2tfv
         CKmLOya04CmPPwdDYm8+z8RkD9sbgnc8VXNiBncdk9CcAeLT1rTXBFhV8FUd+Qi/YO+3
         jMMg==
X-Forwarded-Encrypted: i=1; AJvYcCW52Spw/etxXli2X+ACnxRSDcT6K74EJfNBh3dPPvI9Jm/7o7C0W31UoIo1HvTUTOKK1t+Hbgp5vUjA/FRzJvVx6vdWkq9XJ4Vm
X-Gm-Message-State: AOJu0YzvKnnba4A4MefhilMgC4Nv+oVGgxAwf0t5EzgISjbIQW7WjlHM
	RZQGMgIImAGY9EKGHBNIFrpsOFuumX8BF55NUueCecs2dxXTfZd+gFrEa/kbZ38=
X-Google-Smtp-Source: AGHT+IHjJ/ELMaLTWKWeAU/HVEqGrqCHBr+fjB+4qaex+w80Yfl6w29FYw+Q9TIgjrzlZcWwZpq3WA==
X-Received: by 2002:a5d:5f93:0:b0:35f:2929:846e with SMTP id ffacd0b85a97d-363171e28demr2732074f8f.1.1718811669978;
        Wed, 19 Jun 2024 08:41:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/5] riscv: add support for Zaamo and Zalrsc extensions
Date: Wed, 19 Jun 2024 17:39:07 +0200
Message-ID: <20240619153913.867263-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit e87412e621f1 ("integrate Zaamo and Zalrsc text (#1304)"),
the A extension has been described as a set of instructions provided by
Zaamo and Zalrsc. Add these two extensions.

This series is based on the Zc one [1].

Link: https://lore.kernel.org/linux-riscv/20240619113529.676940-1-cleger@rivosinc.com/

---

Clément Léger (5):
  dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
  riscv: add parsing for Zaamo and Zalrsc extensions
  riscv: hwprobe: export Zaamo and Zalrsc extensions
  RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
  KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list
    test

 Documentation/arch/riscv/hwprobe.rst          |  8 ++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/include/uapi/asm/kvm.h             |  2 ++
 arch/riscv/kernel/cpufeature.c                |  9 ++++++++-
 arch/riscv/kernel/sys_hwprobe.c               |  2 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  4 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  8 ++++++++
 9 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.45.2


