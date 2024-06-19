Return-Path: <linux-doc+bounces-18907-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A390E98A
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 13:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452271C21005
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 11:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813A313E058;
	Wed, 19 Jun 2024 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lSbd6Ypf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB013D532
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796939; cv=none; b=jry28ZhK2wRE1mo0lHu0R5oXdiQjheOUkCD5v5ZhGCz9Pv5UBkuEVSiSE5fauJroEjNehMG5EdQ1ajY7i3ZxeuQu+GSf//1IyhYmMZurrPtaQ+XdHrMcbXZYxd3gAJ3lmM8y1zrvtsASM5Dx95kv+iD9CjigrjfnZ8woZwIwTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796939; c=relaxed/simple;
	bh=ogJzMFOU2z8MIyBsPO4WNFI+wnMHGOiUEXtKmmzBSjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SVR8L9DXU1mEewfyq8ZGb3gvyWyiFnvNoirYL3Rt9CC+JmAWNN0BTSQ5r1WzssCrLBcerhpIQ2MoLTuTUHDKOAfLJ3NLd8WhF6cEAWgm5IhdSaX03h08XLcNuYS2tuuqvAiNVweLy/mSrm7LH1PUF8yItlbznbcUGxD/1Lk6UbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lSbd6Ypf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec18643661so5915391fa.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796935; x=1719401735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R68cnnEZYSz82BBlgeePthLtn1GpI/DDwCMXiGYDPIE=;
        b=lSbd6YpfkSDjIg2OsoeY0h4+xpO9ZjXOZvYt5my574rNML/8ISWsCAHkL4YFBmYLGT
         4fj4QXtLV16fWxdRHFJZFaPb4zjBXzLXv5H4HTH9qqVbpbQZhueWfE34C9KT0iUa8ZIN
         reF3MPFMzkThJ7D5iJfXyx/Tf1ZHjd9Us8novL3vFTiFbOV/Th7X3urCh+SySLRjH5L6
         HTAtHQWVVJoZ15OMqVswNBC9+EMAyzcDOxtVkPxRYzIbw73ANpDmJWV3N497AHjQ2Yc9
         tMTh8YuWhHylHgw9qVn8GYopn5JrSA4ifTvb7yMfF6rFvr5d8sjp+x5r4NUZ+SXmD9wF
         Fpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796935; x=1719401735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R68cnnEZYSz82BBlgeePthLtn1GpI/DDwCMXiGYDPIE=;
        b=sQ2dvS9S/BoeuaQ8f+6HfLmNjxOC2ROZwCkQwVQOOVrgrW2wWweWNYxOxv6uzCpSOz
         uozRluPwpNYWo3A6PmuQRAKMPcBVztnUBstvngaTcYoVCOwxqeNiUmWZFzqfF0TOyvyO
         HNXuedig4SxpRD7P6hQToLa9C0mRU6bDJ16GQQvmbDTt4bq9oY66tlgIz1A5wzQqimA8
         dONw/GStzfh19ttjbJ2qMkzYGZr3Ak6zp2asJsY9tiRkwdOcwE8kp1z5N5fflU1lqxKh
         gKWvRNceZr9q3ZM9pZw/1WZMpgeThYvO+Tr2Vq7IHmiZuVI8O/uVs04AhbFoiLs2xfwK
         b2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOn2mkBVjYhUccYrGi6Hez+zo+ZrBqe3l96+LYqlQ6CS2KZIqixWKOl0FhzHPmOjZ+F/F+61TK+TO2JFFoGksFZehL9sgCQmx5
X-Gm-Message-State: AOJu0YwiSxb83x0+mTkG6g/zbtV/5H3NulM/oPKFEomKKudgBUIUpsRC
	/GbXFE7HTF/QeuFgppcRh/3Cx74XtPjmKyT5K1Tu/gZjIgrRAzhp5kYB+ndUNLI=
X-Google-Smtp-Source: AGHT+IFsCC87W4xVADXKP6E1LRVpjwgMonVuzzedwVb0Jp+JNzVJhthcLxSn+Xc6UH4SRMqEmwjj+g==
X-Received: by 2002:a2e:a548:0:b0:2ec:3e14:fa1c with SMTP id 38308e7fff4ca-2ec3e14faf7mr12339341fa.5.1718796934705;
        Wed, 19 Jun 2024 04:35:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:34 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 00/16] Add support for a few Zc* extensions, Zcmop and Zimop
Date: Wed, 19 Jun 2024 13:35:10 +0200
Message-ID: <20240619113529.676940-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for (yet again) more RVA23U64 missing extensions. Add
support for Zimop, Zcmop, Zca, Zcf, Zcd and Zcb extensions ISA string
parsing, hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have
been left out since they target microcontrollers/embedded CPUs and are
not needed by RVA23U64.

Since Zc* extensions states that C implies Zca, Zcf (if F and RV32), Zcd
(if D), this series modifies the way ISA string is parsed and now does
it in two phases. First one parses the string and the second one
validates it for the final ISA description.

Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger@rivosinc.com/ [1]
Link: https://lore.kernel.org/all/20240409143839.558784-1-cleger@rivosinc.com/ [2]

---

v7:
 - Rebased on riscv/for-next to fix conflicts

v6:
 - Rebased on riscv/for-next
 - Remove ternary operator to use 'if()' instead in extension checks
 - v5: https://lore.kernel.org/all/20240517145302.971019-1-cleger@rivosinc.com/

v5:
 - Merged in Zimop to avoid any uneeded series dependencies
 - Rework dependency resolution loop to loop on source isa first rather
   than on all extension.
 - Disabled extensions in source isa once set in resolved isa
 - Rename riscv_resolve_isa() parameters
 - v4: https://lore.kernel.org/all/20240429150553.625165-1-cleger@rivosinc.com/

v4:
 - Modify validate() callbacks to return 0, -EPROBEDEFER or another
   error.
 - v3: https://lore.kernel.org/all/20240423124326.2532796-1-cleger@rivosinc.com/

v3:
 - Fix typo "exists" -> "exist"
 - Remove C implies Zca, Zcd, Zcf, dt-bindings rules
 - Rework ISA string resolver to handle dependencies
 - v2: https://lore.kernel.org/all/20240418124300.1387978-1-cleger@rivosinc.com/

v2:
 - Add Zc* dependencies validation in dt-bindings
 - v1: https://lore.kernel.org/lkml/20240410091106.749233-1-cleger@rivosinc.com/

Clément Léger (16):
  dt-bindings: riscv: add Zimop ISA extension description
  riscv: add ISA extension parsing for Zimop
  riscv: hwprobe: export Zimop ISA extension
  RISC-V: KVM: Allow Zimop extension for Guest/VM
  KVM: riscv: selftests: Add Zimop extension to get-reg-list test
  dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
    description
  riscv: add ISA extensions validation callback
  riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
  riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
  RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
  KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
  dt-bindings: riscv: add Zcmop ISA extension description
  riscv: add ISA extension parsing for Zcmop
  riscv: hwprobe: export Zcmop ISA extension
  RISC-V: KVM: Allow Zcmop extension for Guest/VM
  KVM: riscv: selftests: Add Zcmop extension to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |  28 ++
 .../devicetree/bindings/riscv/extensions.yaml |  95 ++++++
 arch/riscv/include/asm/cpufeature.h           |   1 +
 arch/riscv/include/asm/hwcap.h                |   6 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
 arch/riscv/include/uapi/asm/kvm.h             |   6 +
 arch/riscv/kernel/cpufeature.c                | 277 ++++++++++++------
 arch/riscv/kernel/sys_hwprobe.c               |   6 +
 arch/riscv/kvm/vcpu_onereg.c                  |  12 +
 .../selftests/kvm/riscv/get-reg-list.c        |  24 ++
 10 files changed, 375 insertions(+), 86 deletions(-)

-- 
2.45.2


