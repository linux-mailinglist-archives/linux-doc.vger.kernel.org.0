Return-Path: <linux-doc+bounces-17629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89578FB2DB
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 14:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFD71F2346B
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D11146D6E;
	Tue,  4 Jun 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ShS4RtxD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B86146A63
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505324; cv=none; b=Y3odXCkEsC87NT4v5aEuLr2xlHJm+d3fbSdp76MecUjWEL1eWPXJSF7WG/K9E73q8cgWv0rYhJKPerZyXVXM2ll+S5vQ3R+EkzynitnN2lQOQu43Z2X3f+Q555erzp89TXdFGTOTqz2jKa0muUYoFl0cB3aNqYvpGi7+Yf5Vjbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505324; c=relaxed/simple;
	bh=HmUcZPgTX/UNRJEZ+VjOUic9enA404rzlV9xf8WcUrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwT6VAhaE+lAMfeeBTwn0YHLCpVqHoHyLYlOi5fBisJYnwEtvH9zbajvZWVbOEZcW/qEd+9+Awytwg+SiVBe3EKWBcFNjIKQcBl2e5RGOP8wlmk4B1bByef2KtDdowSWn5YnOnt6o1Oq4Id7zek3818PbBHYkO/R3wJjsjlR+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ShS4RtxD; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6d125d826f4so202914a12.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505322; x=1718110122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f8PvBYYePzU1WhfRZSwb8yDs46YibFa/aQ6ldPx3Ns=;
        b=ShS4RtxDxkYMkGEgC2co5eQnZ9iyG40S2bBQldpuAkxIVKeui8YRuPYMlbHr8mszFj
         oDFItw0axwlPYqaTA/xY7f7FCrccRer9THksGtBLzM8akmbAkaBVDFNqz3K/hdXmnkcA
         BR4pZQILwuC0bQjvvy/2IjHCJkn6yKQjcfsCGkm0IvWcXaWlGBtid/R4Q6S+vu9uhyiq
         5mCsJmkFR4lHPv+pBsuK04UHkA7Q+uL7XAqo2I5LEBaI724cmzq54QRI0CVKMiqMQt2S
         Y2esOtn8fBHd5+Y8H5JSdc5QRKP9JjG808ZXw8phVpDsiASpxJgjMyRMoWGBYWzL+07x
         lB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505322; x=1718110122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f8PvBYYePzU1WhfRZSwb8yDs46YibFa/aQ6ldPx3Ns=;
        b=WOS08cUbQNXba9sKy77Xhqvrfr3bhYVVdW01tKdoYJZAooKew0TBrVduwwT9t0Nz2Y
         K1SqwSfemCCl0DQn9g+oysN/gVZKCgSaIOlNaqJmFYh67McePz/6nB/bKUwTUda5oUQd
         Z+euJbapGU3bwf3MbvqmjE0+Dj3/oXerRIgG3saceWfQpc9kObhrDV2BhgEDMqm6n3KX
         dAMpzOzY02F54ecdvj+B50JRTz1pZWmSmfIgyZBGV5aH7KntMOJ3gn/wVjdIKHzQTdy/
         7fUw9y/rrjUn8qVxcWEA2luvjnhU8JuQU/7JNQZ894UAAtBe8vbCOB9pNHMsV1gSIKmi
         YG1A==
X-Forwarded-Encrypted: i=1; AJvYcCVeONcPX3ZZvr0wRzd9XFPJ61NlveLqM0CjoDimDijJguX4ogD+UzAyo3EckkrESGSgqN6ZhVlOByrEoGjVVxjOHl1dRvGooSb+
X-Gm-Message-State: AOJu0YxqQGizfCdtBQ9BdJLls7e+do5fsj8XPWfTMWJxpbjfpUhGv1u5
	M28CRCrZ3O1kM02WSAhVzMBhn4z5+ax53MNgnNFtbz2OwkkuwdC3RZVMfcaDK/0=
X-Google-Smtp-Source: AGHT+IHlZckxUbCS2xW6q2DtBaj93CInAhGV+KC/Lja0MHjxnG9sUtL/5KteefRmvNyH0j8QM/rGkQ==
X-Received: by 2002:a05:6a21:789b:b0:1aa:68c4:3271 with SMTP id adf61e73a8af0-1b2a46a884dmr2408655637.3.1717505322181;
        Tue, 04 Jun 2024 05:48:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:41 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 13/16] riscv: add ISA extension parsing for Zcmop
Date: Tue,  4 Jun 2024 14:45:45 +0200
Message-ID: <20240604124550.3214710-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zcmop ISA extension which was ratified in commit
c732a4f39a4c ("Zcmop is ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 3915c9cb088b..8606b164c696 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,7 @@
 #define RISCV_ISA_EXT_ZCB		77
 #define RISCV_ISA_EXT_ZCD		78
 #define RISCV_ISA_EXT_ZCF		79
+#define RISCV_ISA_EXT_ZCMOP		80
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
 #define RISCV_ISA_EXT_MAX		128
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 53c7ca590a22..ab2953245609 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -320,6 +320,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcf, RISCV_ISA_EXT_ZCF, riscv_ext_zcf_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zcmop, RISCV_ISA_EXT_ZCMOP, riscv_ext_zca_depends),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.45.1


