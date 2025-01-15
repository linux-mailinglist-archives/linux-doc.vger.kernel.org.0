Return-Path: <linux-doc+bounces-35283-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5164A11760
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2025 03:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61E8168494
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2025 02:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1A222E3F8;
	Wed, 15 Jan 2025 02:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JENB1jox"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8ED22E3F0
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908853; cv=none; b=akElo90Y8l9zNu4wh6suwnZOm06Cwp9G5u27AH0xGreJVheSaPVJnIBsMZwks8Fpa8DIQ2CM1ynmcxUagIbxVmfc+fP0Sv0zqENZ/viROjrdAbuu6Qei6sL4Fiuk4y8R0x2hEskAMCevyNNX/xNT+JAwltwzzsw1+7dIAXuhxg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908853; c=relaxed/simple;
	bh=ov+Jovl5slUh9ZOeOd2AFWuWkumQhEGSazSuEBrqpfY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Q6OyqOsjFgNNS2lCpBGq3kpXQFpc3i7NzKPkPrBcmwQLcTGu50WCY94GU2O716aBXtsusRRLuMBo7oZmyJLf3VUO9OAwlOoQlmSiV86h4ukffcorx7dNmz/rpTcuB0be/U+oOG5vNStY29CPJ/HP/ZZJVFqJ2DkOmMIS5Av3OPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JENB1jox; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so145817295ad.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908851; x=1737513651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiILRyRfHo+NUtJXMbpq128gxB2UW/YGfDj3MyZiOVE=;
        b=JENB1joxvhUEl/YjMQArb4q0EEyvFNIyKdm1go+k4Lxa/tsr7j7DuAwW+eU03y1+ks
         N5HaDHHMSEDYTLV8jqzTv8kDSf6BZbpFfLP5VsdwFJf47Y4SNOLK/rGnYMZiFr4nOx9K
         I64sXtwi4aVKm9AFm4rsA1kndxxYiYZYnvfe86ydGbjqyhJYTrGvXCTlfSI9eOIB1Gst
         wjH0V8kziQgg4Ub1STgoBCnektyHcwPy5zMrFyUwFfip0cCpIIM/DJ28PGfgm764at2A
         3+o05eSW+nPMRzu5eIxoiuA/6iET4KC79lzPm5YDXJWXalQfBgISqT//BjH8OEwatqV2
         ZfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908851; x=1737513651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiILRyRfHo+NUtJXMbpq128gxB2UW/YGfDj3MyZiOVE=;
        b=O+Zt/WO/TrV5OjgfJqXtQV6Onl+p7buwbwkJyIdm5BeFGHPY2vJgNNtv8Z4Hb7yr6t
         Z8BEstKEkaOvzm5EhMRh1W68BXuMYJXxOroho/EVGbl4Z5KiiFYG3/Hi/op4IjSBIoxj
         5FAf4ZqHJ8rDdngA30M/kbVtUtCm7UR69ZTe0k2/1w2Ag7SPHFbb0qYEPXtPYjeCrH3S
         mDaTcArMjKIRrRSg++AmUphsaPc8vxklhRaYXESvVneVZwzArk+epsxqQlbIDSbwEi0R
         xxyqmHgCKOSjrxqp2DiLa1412oDpm9QDc4aM1chv6cKwoMWJw2HF30XZDr8Joyuw4fmo
         Pf7w==
X-Forwarded-Encrypted: i=1; AJvYcCVMAqUGklTqXBkZyPxNqs1gf5bmHjRXE2jyGVs4S6yuK3MpV+iEZUYroDTGKHd6v1N/C1QD6FrWdjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4TWpotH5CpalATExswmAYELPhRZqV43tEsw83Qri2KQOgMAuz
	JB4PNahT30z7v5W5aTgcPSrFhy8IjbDbUk46BgcNa14V9ykeZc0wgpCo7QtofXo=
X-Gm-Gg: ASbGncsEEr3AQ2UkNts7Q3Gffv3nNRdPuJLcu61n0hMErZyLqkUEQSOqczZ20mjrpMU
	X1eoHA/QCQAhE8pqrfwDLQK7sfl+HGzyX9HqePztFx+cQD58zay/8qCCuNRdrsieg/GUJP9pi+F
	FAhS7oPcr4XxmW/ujRUzc1ZVT2EhVlGRWn9wWP3GkSJVHqX7NayOxsu01WOLNB8vWmQGIJgji4h
	KlpAPk1M2/12M8Ji1Q9U+Xoieu4Ky+P4taAVGQfCyW9RdnAkXfBUrepEsTz5j3qTYBa0biSkYwP
	agqMOl47xS66tKs=
X-Google-Smtp-Source: AGHT+IFAimWtf2lTBvrnqOrM8muizhicRypBcekevc3BNNeuhbcAjrIt4O9niFCSSQRXVpLXyqpbPg==
X-Received: by 2002:a05:6a00:6f4a:b0:72d:3861:895c with SMTP id d2e1a72fcca58-72d38618af0mr34186945b3a.8.1736908850691;
        Tue, 14 Jan 2025 18:40:50 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.40.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:40:50 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v5 0/3] Enable Zicbom in usermode
Date: Wed, 15 Jan 2025 10:40:21 +0800
Message-Id: <20250115024024.84365-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  6 ++
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 78 insertions(+), 12 deletions(-)

-- 
2.39.2


