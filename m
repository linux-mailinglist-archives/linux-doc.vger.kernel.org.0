Return-Path: <linux-doc+bounces-22568-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D894D876
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 23:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877B3B228A9
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 21:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6609516A36E;
	Fri,  9 Aug 2024 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="whnoLfNd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCD16B725
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 21:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723239899; cv=none; b=lqKUnocGNVrnQVsr9G0/xmo6QqMCvmkoPX3/bjzoDxiDBwspqrAhpRTv4Nse6Oi1kZC+ThtM8iMDLI5DgGZpZnE2bF55oFZyaZe47i2+q09WoPxCepQWkNCjwDp9/WHuS3nLvJDZZT0k3bmPjqA1BsqBYcbVVEk5l9Hpk+FfbU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723239899; c=relaxed/simple;
	bh=x1i23xzFRjId2AwNDtliEXnY0Fr91ZSzNcX5rM1MJwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e7wpLQ0UdV0VP+7BE89d4cEwINaNKl62LDMoVnu/NJn1nRPViEQNFWl4LqQeLpjvagtNfNfdNnfbv6rQT97Q74QWqSs0AVYhVt59tVVx0ESXYTv9NXvNruodV3RUaWh/1/TJcJcteMwEx/DPbwfS+/zlFCkIfgLBQHfVShV9dlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=whnoLfNd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70eae5896bcso2323080b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723239897; x=1723844697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAMfKx1oQo8YE2iR6NozF/j3f+Ura3BBtPQS5J8as2Q=;
        b=whnoLfNdcNMKAcbI0R7SkUQpaSHn/wOq0U3yxXNuKERJyiaemjgx0OWI9b24+4VH1v
         gpHKI7sZwKpcYh3AT7QGa1Oxz3puz8MyffEhks+z11cfwgZAMagZma7XC1l/IBjCLcvZ
         hha/Ojrj23keuLeMUUXa9NIgaO5BYaik0z5lBBbTv63QDFiWDY9GtXqh9K5BJxSBcZOG
         0VXTGYAdI5bqyTmiA3/Gp0sGoFPwtgTymfknPqA496DDXjvR8gflLdcD6uP8Uw/hfmfo
         SddDjagM2hDCtv9pz67/E4DwBm4vYIbT0LEY5imaIekOXGc1kkCAW5fKK4CVsgbnqnSJ
         CXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239897; x=1723844697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAMfKx1oQo8YE2iR6NozF/j3f+Ura3BBtPQS5J8as2Q=;
        b=N4L3+QpqV0T21tqUlNRB9ROSi4OwgW/iapYKyW01M5LE8D5XR6jURffGIRfI8WtqDS
         PFYIrCAVMWpGaXt1NLAzUN4jcVydZGKkW9TgwGBebKqQRcmpNCFxt8M0R8+GeX9cHZRT
         E1dTvW8n0JetmCd726rSB8NfdAv3fMZpy9T5b1/V1omhzySJypup89m7fMWsX+p1IGYT
         fqLFWtyNCG11l0m5QoU8jdQQRM9afvUNtFZG5obPasLZE1UDAE9G8DkXpFey1gAPileG
         Qf5FmYTYpZLqOeW9SCm+YLylByRX58iFzwRVEF3WzQ0EZNU6a1VEb5IdY+GUhoFFrBsT
         3kfw==
X-Forwarded-Encrypted: i=1; AJvYcCVD6PK50pHRrawqYkhQyzrUG1teXxcqF1xNZ1tiLAVUFG+SL8Znt+3fBiCPs4DNfkLiZCINziaNK9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJ0xX4wdeN6GB4TgF8/79fQjo8VE5yifQE2Bj2QjjkwD9myjZ
	FrGo25/4fI4/ScV25jd2Ftfow+a2QuTGMgyYwfq7wehWUTJMgbsRuqaBJPQhYfA=
X-Google-Smtp-Source: AGHT+IETL5ADV1/Vr6Ds8AZje2vtkmmfFXXh7EZ78E33vbBCrTLO+WnE2if/EUwAUCYEUfaHJXsEXw==
X-Received: by 2002:a17:902:e5c1:b0:1fd:acd1:b642 with SMTP id d9443c01a7336-200ae633590mr41893135ad.64.1723239896920;
        Fri, 09 Aug 2024 14:44:56 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7e93fesm2073905ad.43.2024.08.09.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:44:56 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Fri,  9 Aug 2024 14:44:43 -0700
Message-Id: <20240809214444.3257596-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809214444.3257596-1-evan@rivosinc.com>
References: <20240809214444.3257596-1-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
hwprobe_key_is_bitmask(), when in reality it was an enum value. This
causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
since SLOW, FAST, and EMULATED have values whose bits overlap with
each other. If the caller asked for the set of CPUs that was SLOW or
EMULATED, the returned set would also include CPUs that were FAST.

Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
returns the same values in response to a direct query (with no flags),
but is properly handled as an enumerated value. As a result, SLOW,
FAST, and EMULATED are all correctly treated as distinct values under
the new key when queried with the WHICH_CPUS flag.

Leave the old key in place to avoid disturbing applications which may
have already come to rely on the key, with or without its broken
behavior with respect to the WHICH_CPUS flag.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v4:
 - Rebased

Changes in v3:
 - Further documentation wordsmithing (Conor)

Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)

 Documentation/arch/riscv/hwprobe.rst  | 20 +++++++++++++-------
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..a994eed75bde 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,8 +239,13 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+     mistakenly classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
+  the performance of misaligned scalar native word accesses on the selected set
+  of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
@@ -249,12 +254,13 @@ The following keys are defined:
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
-    directly in hardware, or trapped and emulated by software.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
+    sized accesses are slower than the equivalent quantity of byte accesses.
+    Misaligned accesses may be supported directly in hardware, or trapped and
+    emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
+    sized accesses are faster than the equivalent quantity of byte accesses.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index ef01c182af2b..ffb9484531af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 8
+#define RISCV_HWPROBE_MAX_KEY 9
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..635753084275 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
 #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
+#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	9
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8d1b5c35d2a7..2d0f4f6a32c3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -225,6 +225,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
-- 
2.34.1


