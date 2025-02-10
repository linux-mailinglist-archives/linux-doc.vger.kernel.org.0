Return-Path: <linux-doc+bounces-37690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80176A2FC4C
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 22:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7A03A26D6
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEF3254AFC;
	Mon, 10 Feb 2025 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="c2xebSJ3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B47253F02
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223379; cv=none; b=n4hGT9iu/0c2+2UC+Xxrgw5wJE/Qt8OmQMC/1hhR96eHmCiK//F/kapmhpxmm2+/uFQANYmuYtTkk+LN7C89p+9+8+PQ/GD8UFe3fMPIjktMj91zyCFD4kOJbBhej/XFnryIFjpnnp7ns3PQdO4Q9VrNEtbWNblyYa+bbMWOVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223379; c=relaxed/simple;
	bh=/j+ybqZeARPGCTJZl7exA3+V1IjrXZaSqccG31t9K7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUq8l8cCeoDpVTF/I2vebJmyaEMO+aYPOkILF91PKhouZj/U8YhdSObKhdWI34Gf1u71TcJM1yWmklw2As/UxZcEO+jidGTtawtLCBBXwK7/shaNgncDecx//NAIwCTxRVLgHYyydNHoMCUHdItIc34bmS/Iy3ntgOkb4JxWNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=c2xebSJ3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1442430f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223375; x=1739828175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19zTUPAue8uF+l31WbsHm7jesitbh6CalqtCN/NDhL4=;
        b=c2xebSJ3LPiHXsGsSjuRfbMFxZxgU8LpqFgZqy0nvxgKR/gnvOAzSE+gHUULgsWAQQ
         2b1QVMZmDY3xhs7aZuNjCmXS+0eTbsC9RirfpCpY8+xOi/3oljycbnbjSVQNHq5SImVJ
         H5T3vlT9bVxrMNhoSbKwk86zOxLYGyDfH/CgMbU7RB1KJGrZYOpf2XEjLJ24GkfMQYnN
         dkZ9A6XqYFM/EqZWF7i01+Jm0OfgxDWblLaUe2OMVx3sMjcgUEhEbADzsDte5OMzpMbr
         Wa+UHEpkAQFwNVsAbYk0C7+7Mra+qHdS8pJSvlKyKzqLQZKqVPkflGAwASmuWRJQnOYY
         KJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223375; x=1739828175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19zTUPAue8uF+l31WbsHm7jesitbh6CalqtCN/NDhL4=;
        b=pal+StcTRTwtNDkn06uXRhLpoHJJCXdWJEgl6NeiwO3x1DD4Dyua16hCXVJ3ZAr146
         Fy2z2I/mk0o69QCp1eV0+qcE30d6C0DQF5RP2UGRZtJQsrYWr6YVwGqSVRRPTVQrssKg
         2BDRGtR3NqgW7r4t9gDQmHwbPm1PiU3dL0B6ZReZi7CjLSOIWfjsb0Wsm6ZPOgtlK6nF
         74STrPzQNHLcYjQ6j/J2HVs/s9YjlgKiJKZXt1loCeYZdgS7Y7qCdlnhQJKHkdKzq49b
         LPV3tjrb5dPY59NkyQUAZT0G5Ow/E+S4fNY6FVhZNt7KqKgZE3ll/S/6w8epoaNNYHEU
         q+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJK3xXAHQ0nMa72nvCHWPyfrTeY42QEqu7XVI714foQhFoEfaAJivpcEFbv3cQKdaqhVFJPoU5twg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3RbG4o+AEdMgalgfBo6vQB/6GBDLbE1As6bU1jOxBXUtUdHT
	H8aF7bcSKOXV7rX+ZNTzQWkM4DQoHICikw0k4KESVtDQOZqLQV5isV32R6Y03bU=
X-Gm-Gg: ASbGnctjN5fDdmhp7Nj8WJBrcZ2ehOGv8GwnbuuhG7LVeAKESC4DKrEk1N1csa7T9pR
	lXOxewE1507wC55qQTo9D8FxjXazSxhVCTiKznBmJNHpCsS0A4cWcdyZDRkdrSgYDebFB2Dz8Qn
	ss7M2N49aAX2I/lLhpWZtTx9LuVMQBi4Mw1OodjQf9na2EORQFydw2nYkhRxqB7VUFAXfI+NaEG
	9OsEWjKqT2x1KYhvdCjZyK+UWEafdLWxWvYhTG/bLM/w25W8CYKuSqyBdeUR8bd85R/wiJGG7D7
	QWwROzoNVtNRdnSI
X-Google-Smtp-Source: AGHT+IH8mk3UTikqJq637e5ac58oAB2cwKutxDJwkgs3YdoxbObjCQef1GMenNM8qJokTGgudOE/eQ==
X-Received: by 2002:a5d:648d:0:b0:38d:d969:39b0 with SMTP id ffacd0b85a97d-38dd9693afbmr6558028f8f.2.1739223375424;
        Mon, 10 Feb 2025 13:36:15 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:14 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 09/15] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 10 Feb 2025 22:35:42 +0100
Message-ID: <20250210213549.1867704-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can safely handle user memory accesses while in the
misaligned access handlers, use get_user() instead of __get_user() to
have user memory access checks.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 1d523cf96ff0..e6685db58bd1 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -269,7 +269,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.47.2


