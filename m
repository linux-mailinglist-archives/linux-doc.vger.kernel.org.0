Return-Path: <linux-doc+bounces-53629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B162B0C4CC
	for <lists+linux-doc@lfdr.de>; Mon, 21 Jul 2025 15:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986F318931E1
	for <lists+linux-doc@lfdr.de>; Mon, 21 Jul 2025 13:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6CA2DA767;
	Mon, 21 Jul 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/IorPbN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF82D9EE5
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103120; cv=none; b=Tg1k8lkWnNzjeXF0cmFB4tMc8RriBcG2wN++QUwqDEDcXuCF2uYzFrVGoJ5eRd7zdOdQxcr5LXjE61ZrfrUilPjhyzd98f9/Lx97HQIfMcXRefaFp3pB4F64akU1Mhe07Lo5RNpXsfM3VnuKQQ4F6Ml1BrQkWLJpNIlIdgGHZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103120; c=relaxed/simple;
	bh=YxvmYpOV+737fyfcSQi4SIm2ZMFnBONYtUfp6vtMhrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raPU0PR560qq8O2RYGF5+ztHnqgM8hwgvGY8FdGQYowypyO1gPTL5eQ6dE05/gidXhKF0noXTJJ+FLl65jNhp1TkziMH1H0aBvU2pBgP2t2p4SJqPlAmGccmdZEXNATwmgeQ5qHMKy72XStrlgGy4YWiTqmL2KsFUOm5Tx899xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/IorPbN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45629703011so29439995e9.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103116; x=1753707916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=A/IorPbNX8kTl1c4DpmsoK9rRYrmMSZ8EV2v3ewO+aNIeb9QBtDnmx6M6oxQKKqm5b
         QKK9RPLmPzO17CQaszDKXacWXEZr0O9L4eYNlBGvwRDEufcW4B8gUNAVh7c1d4bs2Gfg
         ekKtriJUB2B5jojUXDicYqG8kmJcAJtGZFmuNYcjAhl3rWqchIfmfwiVzlz0EKdL2GVP
         APrt5KlglYYC7ZNU3yM3UJakqqRaxfUZ4Hy71GzHmreZJ2ZSt8Mo69XwCXtRT1DY08WK
         CgWrmlpCUAVeYzKH2AnpS1aazJvdfN9/CsSBG82nb8Bih3mIL549ozBfpq+USHNWIB57
         //Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103116; x=1753707916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=ekRQTx4aJBLw3nzTtqTgpBfHEGX3AnvVv4h80QBQ/yqpiO9qzO//CLmxY7ez1cuSLO
         2vyEwHnd5jqzegl14Z9gcqg8FHtPIYGnAGTrrPwgkv+zCdqodwU57LgX8FWzeGSV53MI
         bcYq8cP6o2BeTS73bTqiUQUbG0yHDMi1nb1TfHBrFB7GK2YoKcMwJ/n0U+iCAKYQ4sbf
         Ki4yyp0A5QHQupCNWzbOEa7eJj3MQECnyvNtSl3ksSDl//vtP/oQUDfbrF4YIUU6yuL4
         d3noNquEohhMgg8k3GQiiGzYyGXhrWp35+NEq2NjknEjYkoeyVm4gjAZelWbqvhKwBkW
         FQPw==
X-Forwarded-Encrypted: i=1; AJvYcCUGC66sWFUJlWVfpCMEV1ozoUac0gKajfzBpABWBv2Zk/ACB7Iu4xLVs1GA3cn8e8l5H/ngD8FcLv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7l3R70JMO05ZFJeMQyR1HO5f+axwHqxrAjPuI63i2wx+acwtm
	Y4M8zwp9VHbyfvRMdNwrYjMxWZID1IpLwnqI/1nN5QKGh+bhApkF3Qo003ol+ROxSZ4=
X-Gm-Gg: ASbGncu+Apxic3Un5X4ao9ToQFbrfq1vrk73xAH2E0rZl55+i3r/1/xNy4URLk1bREQ
	GxMlHVACy90TsRWXAeIxV72JwYnhjevi5lQ0u2dSwhDTkeW0TZvowz0/Ibav5eGGaAth+Ywt5kZ
	zDGEiaGRXk4q2qdN/XO/JK9PZTR8Zd03ynez4TVMqTf4giiVhkUEd6sihHZIlrFdfHGlfkM33zf
	pzOxajiinFtuT5gdh0ULCBl7SSduDHuVxQyowrJgqllBIHopHD3ebt+xapf5155FmEh1IYUryHz
	jUTZVHAxmPhvv/0h80gAifZFlLmYKwHf4q2oSuSWGoN4lEw6QMn4HYOghTxSnXGaRXUcbuaoH0i
	AxgE8hFPInzFceMV4epGOQXm+OjWEXe6w1Pe/s6eX3w==
X-Google-Smtp-Source: AGHT+IH/BaFdm6qjB9ghQzr4BZgdXtPtkOCmYQc/NNyMmIYlQPK76Vqi5YsqsCJo4ftIcTCJzUtW6A==
X-Received: by 2002:a5d:64e8:0:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3b60dd651d2mr15563166f8f.2.1753103115987;
        Mon, 21 Jul 2025 06:05:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:04:59 +0100
Subject: [PATCH v5 05/12] arm64/boot: Factor out a macro to check SPE
 version
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-5-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 9f38340d24c2..2bb0d28952e4 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -103,8 +103,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -189,6 +188,14 @@
 .Lskip_set_cptr_\@:
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
@@ -196,10 +203,8 @@
 	cbz	x1, .Lskip_fgt_\@
 
 	mov	x0, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #(1 << 62)
 

-- 
2.34.1


