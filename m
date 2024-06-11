Return-Path: <linux-doc+bounces-18177-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5784E902BF5
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 00:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5CE1C214FD
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234ED152E0A;
	Mon, 10 Jun 2024 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XEyUxKO/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BB152798
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060214; cv=none; b=jh3HYaUZuHw41eeYwsi9kIGcJBE1B3O1MqGYTkw22DapqhNA2JPVNs3cBFH4BQTflvX11C4FzUMGOD3MnBRB+jEO5ZgjpBmzj92Rdo0JWn5FwacKMnL1n1JfNkcPvdW8HOdK8T49No7GUFfKAR9pOr1BetZ2dQo0glkmNTOvCg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060214; c=relaxed/simple;
	bh=ca9316m2q7KsJpXKaUYuMTEdVfJhCps1VG/+w2MDk+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSez9W9VJ4V7R/oi1wqlR7ipFH/iAoM7EOYbTjeoSs9LGhaZy05d+TTdJ92wzjThLVJlToeYKPs6sGejXvp/EmaclDdb16I7i/Y+b6DZ4IKfAX79d8PNq8w+NeXSDW6+7YNTGzYNXgLndKkkCGu6WhCfjsCZ2yI6eZcOa4GHA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XEyUxKO/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f7274a453bso3742405ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060212; x=1718665012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLK9thpeAz/050Te/UpgqMxOgYJJfX2L6p0aPfIuJ0g=;
        b=XEyUxKO/CA+p8TahhN+T3M72CWwaZ+RJTGKl8n1M5BxSKlHFiVo1fKTfiDnq79bm8X
         /3dYC+AY4WV5Pt9HJt8ylE6P6iXPARtLjhcHBv3yxx6jPiH/kbg3SONOXG9ujr3CF/Xl
         /TfjagS69pScbMcojTw4cwGMjXDkOoxxXcvq8isDqAJ2sjNNU8ZVO6PLsaFdKPT/6UAG
         ZZDEE9oeK6xI0pUHVu+hzwqjC+IveU+4vGhjWn/lUZwUYXyje4XSoYSMw4ZIM3i9ScZT
         sdDRVBwMAbrJMnrJ834fxx2edOuxYMAjzMMypKKazVfKkP4x8FZdJqw7c5LHJ3ysvoti
         6i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060212; x=1718665012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLK9thpeAz/050Te/UpgqMxOgYJJfX2L6p0aPfIuJ0g=;
        b=pSB8D+7mSNKYbUmu2yC3nSx0qm+ohxnkr334ySMXPBkL9iHnCTQ3GhNvy+RKtLpvMh
         rE5idfNCiTwTLOgL+W7kb6IJoAOVFJdqNaTNTpKIShjIJwgDnQneItd/8Ir9zrdOPzEE
         2cOvH1f0+9+WiguCHPHcTtcbE2gixc3MgCZTttquXjXAVmKs2TQszj1914PGmBFKyFV4
         VhrnS96URAuFteIE7C23ZC+aQF8MpHYdyaBp2wHBhmI1sDE+6ptcXwtqBB36YIIwxhn0
         HWOLJfnjEFrKAzeWGR4b1mCHJHy7VkILbC6bc2wGe2q7D+MJ6M9GgKSR4ITjXXLn+VT7
         gMYg==
X-Forwarded-Encrypted: i=1; AJvYcCVzkAFevCviHhBsoIc0jOqZMBOWPYeTfoWX+6jxLHrHyclpkv9XGqfPCLloTN1w7o5x1RWfYi/hiItHKYjsFyEXKhiEQ0VJKdFG
X-Gm-Message-State: AOJu0YyPfY4ihttORb2J++UfRZn2ZW8BjmAI+Sxeb2su5HTDHBgqm+VU
	ajXtPy4YorQ+OG0Pyhu97iDZGs40IEfIzJG+v/OgDr5PXZjw2MllSOEztdGhiis=
X-Google-Smtp-Source: AGHT+IEXlPdDC/cm3XWTMWZsSI+KISGfbRWYYRB+hu0C2M34wJmaILJ0Oapoz9vjpacbJKVuMQtTag==
X-Received: by 2002:a17:902:ec8d:b0:1f6:138e:59e8 with SMTP id d9443c01a7336-1f6d02e08f8mr123826495ad.22.1718060212108;
        Mon, 10 Jun 2024 15:56:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:40 -0700
Subject: [PATCH v2 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-xtheadvector-v2-3-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ca9316m2q7KsJpXKaUYuMTEdVfJhCps1VG/+w2MDk+w=;
 b=Rd1RqXyTjzNZ0C4JTbHLRL+/rb2toKlfKsgxM0n+m70IZEjfnVh7+2UZReMpFZCIoGWFDgLBO
 f1XeHlkh/ZqA4+v4M5bCfih8O8eBXibdkflJyyCKnWo6RjK1HHDZMVd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


