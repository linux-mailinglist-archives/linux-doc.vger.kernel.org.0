Return-Path: <linux-doc+bounces-18090-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED99019E5
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 06:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5E31C20DDE
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 04:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889B61946F;
	Mon, 10 Jun 2024 04:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mPWIPv5M"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169717C64
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994743; cv=none; b=YdUPv7HmoN6s8vKILaImLUi4Nc6QhiHSh/PskvrX10KOUK4Le8/nDoixOuURvQXl1UnIZJH+am/b6UIJZ4NsWzjzXjImdXzPwL/9LDx/KF7Kn5DKjtzEWoGGcTVyEJLZtuCF+AvEFhiFh2vKG4d6UbnFoOpS5p3AL3ftExuqYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994743; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFyg15RioV0drJKzFhnk3j1bDP295kVgvYi0V7GaBU+JN5ji6eFstL9jpzfvVk82sL6tuzneJATS5i5qVw1EtfDEkv9RWS895ww4E1RuJ80bZ3DbBFXY8ZTJUFfNkqDkuxvnxcM9B4O6c48Ec36Lb4XDoo+nuDSMrsdlmuDEtR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mPWIPv5M; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7041f4553ccso1867786b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Jun 2024 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994741; x=1718599541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=mPWIPv5MH8Ifz8Z8RiCAcsrujOg/6fzKNI/Af82cqBDnni5WNc06z1CVaTbTClKZjg
         G74uPW40vl4ZANDEibynMdnNg2PCCR2NlSSbT/LG2bsEyDesZwOaorsaf8bUON5dlXOQ
         7nkEKkEopqXyM5FtUGHqfW/9cT0g/vUBMuOqWXYitAetPbo0y13MHP3i3HkkxPbtFVaZ
         9ZMu/genyOkAq8lPe3g+wfMTs/MT2fpWIiZMyyUDKO2ASBLz9m/IkNRFv6J3Wfb6yGEE
         eOjOPFnN8mWQm/3BqxQ1JZQ4Yv9Qp9YVDo44sX4ARR3/clWosq7lXYoxjXt6dK8ntVs3
         6NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994741; x=1718599541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=helOKiFuKIhAmWi8NKn1Udn9lcfOGfIu4bvjFGudIYsZPZT2bv/I1QW3HT2At4SUoL
         9/8hVr+ihwtO0+W5aA35bWp+ueFMM5h3COOBoup76UTl7K6zr1R6ICDAkhNi2bNUJAm2
         AC9VsYhlZpBVVqQp5TZdC4APyeyBMwub3ZTNX6qfkH0R/rhpsT7C8D0yFurwTRGKqsz2
         Cp3baGlG9eiFug0yzBgXCZ3YiN1C06MoIpCkSvu/da0zwqL761XkNRn4sUjo4l4oz0Pp
         FT7afZDOobulogwIXEZRZFqIQRjMWkl65wM25pqT70Lh1bp+UYTehHi7fnY91OkXHKUe
         6Tow==
X-Forwarded-Encrypted: i=1; AJvYcCWBOI1d0lIQt/JPS4lFd215xiMDWripez4V1IlS9vqdWqzKlS97L9KDPjdwXayrbYeeOjyJ+dK8Vg/rT+ScKoaNeZxkIYul4E9+
X-Gm-Message-State: AOJu0YzhRSRBygYmtrqf67slGBKTUI2JehdUnSsVLqTGrKf3PNaIJ3aC
	vnMtPicLkTHHzEc0a5cSZWhygp29sq02InklsaKmH+B9sFCbnNdaXheZYlRcC0k=
X-Google-Smtp-Source: AGHT+IHfXz/eqcApvPQDnA4xGEwd2uFPXgoMy/TBwiOmRs/TV62bMg4pq81xPe0jQyHMWsO+kgdruQ==
X-Received: by 2002:a05:6a20:3d81:b0:1b7:77ef:b125 with SMTP id adf61e73a8af0-1b777efc43amr2187647637.21.1717994741443;
        Sun, 09 Jun 2024 21:45:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:08 -0700
Subject: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=qMU9GEMHv/svOPJ5zghxy0bhqG/AbgzxOZ0AfXJrmBOvTNW3UuMX841ytI7NfGDiJh0BQgx9K
 BRhD0FN3VpWCnzzynK4/FI3j/f0VwYqtduoZBXh2eanJAoZrFHFaZvg
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


