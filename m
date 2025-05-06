Return-Path: <linux-doc+bounces-45406-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9BAAC2EB
	for <lists+linux-doc@lfdr.de>; Tue,  6 May 2025 13:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 180847B99C9
	for <lists+linux-doc@lfdr.de>; Tue,  6 May 2025 11:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AA927B518;
	Tue,  6 May 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um/8Z1k5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA227A936
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531757; cv=none; b=blzNPwG3CaNM3f5Uop7uAOyzGvHBWSCpaGSrlQWDnONYzaO/cX7Z5AyVVxIRX2QgztEMX174B39xs3Bi2diZ3oS6zP1+pxltDs8zfRuWy4xBfKwz/JIHp8bxO5wYGz9XD1ipS5xTtL9nlBbmmjHR9vBa65hqp4ZiAXPcdmblKfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531757; c=relaxed/simple;
	bh=gsVA8ADxmNU5sFAxcN6FUauD6AhKeHsJ1+2Sh2Sunl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZntxLjsFzpyNTeZenUJJ2yrLF4WUAap8wGTKvTlYX0UPQXETr3peO+2E2hhcxDGeMxhrQD1fPjtjcyLfv79xusMSqBGYzct5zAtA06N1FL96Eshv9sxK32YSI+XKSTvEsWQifI89uaPl1B2tAgSHvjgHzupSWfMYj5NDL8WhqCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=um/8Z1k5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so324784f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531753; x=1747136553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Iqgtu46/FNdhFy61CVblGgsvlOmM6sXXaQm3S4mzk=;
        b=um/8Z1k5zhv3S5SsgCKXeDuZI5btuRH9N1jWhKqGv7T0FnukE6DLR3Qjftr1I8ydXP
         WTEdXp2kzRrZeTAenwTRgw5We8PtKfIDJWV+B760tpsXEMNfYtDytPIgbO3jS+8+kLrI
         E4jDWKH4R8gMj609scv45fwoyM+CqgOcfahM+bLcCopnCoe4gkKUg4AudCEu35y5rjRI
         fXuoRH6sB4MCknnnuGlP3E1zG6wc6Gf6juLh2nkDSyuQgNGMWZsdKkqqa+U6g6vuafYd
         +DqVqEYqHRzMmSg6JFc2Kqcm6d8oRq+fRIHl9XqNAgXTmLsQitS1tR3+GHLJyaGfpf/l
         9CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531753; x=1747136553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61Iqgtu46/FNdhFy61CVblGgsvlOmM6sXXaQm3S4mzk=;
        b=jRTDxP6TkbJZ8Nq22gL23npdgT4tiJYK33vAEcWmYAB+Hqma3Rwfciq4ZuZqECeyB6
         TeTP6kKMUqJFMDFSmrJE5+HkqEyDqpazNLqDqJ+xxKNjIX4up49oBHxWymbim046FRA3
         4oDitrdG78x6FLgR1ADYjeKQNqqiZpJGl4K6dTts+T2DZuX3uW/BhiG53yX0bs8HskLW
         yJ/zH1IRrYhfWhdaQXeKOm6NLl6N9nabp5QW4K1Y3vOWWpyk9iAp8EAtWn1gnAfO+bPe
         10RLpxtVBrtAaq2ftdY5p/U+Tb+Ovgd9wooDFIQf7kHQQUZkik9itvADGbZx3Qq5EOlW
         f2KA==
X-Forwarded-Encrypted: i=1; AJvYcCVIMyC8zX+mLGMN7XQDzXVCEeem9d/vzLMpc8Pf8R5Wp3EpOdaUgeHTnZgeYw/NcrK+h4RijrRqdt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7IFl2Fzre8ht0tkE35LhKV59BjpuqNWvrp/X4d/qZX0OZ4+r
	r/fxK8/kbFvx/BYthfzLltuCB6hFNAbGN+0IfgZwjeKuqedCXVGwZlpTiVyN3Og=
X-Gm-Gg: ASbGncukzFuIlQZuC9CGdB/hn10WQ23tIFjVCW7eIz1sSRv3BSob3P6O05rYx9uaTjH
	Q01CIq+tE51uM7uO77IC6MItQ/dSevzNc4eVJWTu9ITpH3H+NHb26I/UU0fhhnTdnGBbE+xQ3if
	79O6z4cSfC7H4RjnX1YRjVAVnSEFrplmoyGie4OxB7AibCMWoBFE5vFm6xJk0ehfkVdw+qv1xoe
	MzPmuQ3ediQFvmjZNFA9lWz53Urw83amBZQ8D6jbMJRPeYe+17hJRLG2FJ5FJpgtcAYkql+pDD+
	JjgnLC3ckcyl5XOHrGHb4fUtaHHs7itsN9qYUZHObHco4+w=
X-Google-Smtp-Source: AGHT+IGOdg/E7hDqzaYj4d5eAC+LYCA9Y7Nh4kV6qn5WCG2sjJC4tu8qT06CrXeaclDgMwZbgMGuJw==
X-Received: by 2002:a05:6000:402b:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-3a09fd7a2d5mr9000895f8f.21.1746531753539;
        Tue, 06 May 2025 04:42:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:33 +0100
Subject: [PATCH 01/10] arm64: sysreg: Add new PMSIDR_EL1 and PMSFCR_EL1
 fields
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-1-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

Add new fields and registers that are introduced for the features
FEAT_SPE_CRR (call return records), FEAT_SPE_EFT (extended filtering),
FEAT_SPE_FPF (floating point flag), FEAT_SPE_FDS (data source
filtering), FEAT_SPE_ALTCLK and FEAT_SPE_SME.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b..80d57c83a5f5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2205,11 +2205,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT
@@ -2226,7 +2235,12 @@ Field	15:0	MINLAT
 EndSysreg
 
 Sysreg	PMSIDR_EL1	3	0	9	9	7
-Res0	63:25
+Res0	63:33
+Field	32	SME
+Field	31:28	ALTCLK
+Field	27	FPF
+Field	26	EFT
+Field	25	CRR
 Field	24	PBT
 Field	23:20	FORMAT
 Enum	19:16	COUNTSIZE
@@ -2244,7 +2258,7 @@ Enum	11:8	INTERVAL
 	0b0111	3072
 	0b1000	4096
 EndEnum
-Res0	7
+Field	7	FDS
 Field	6	FnE
 Field	5	ERND
 Field	4	LDS
@@ -2287,6 +2301,10 @@ Field	16	COLL
 Field	15:0	MSS
 EndSysreg
 
+Sysreg	PMSDSFR_EL1	3	0	9	10	4
+Field	63:0	S
+EndSysreg
+
 Sysreg	PMBIDR_EL1	3	0	9	10	7
 Res0	63:12
 Enum	11:8	EA

-- 
2.34.1


