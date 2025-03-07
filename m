Return-Path: <linux-doc+bounces-40174-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB99A561DE
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 08:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C75417345B
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 07:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E671A8F95;
	Fri,  7 Mar 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVQh97m8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61F1A83FB
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332903; cv=none; b=j6LASkg28c7Qd+1V5yXobJH+JDqbXvG8ZR9bqWv865paGtSJftoQn0gRnN1FW0urZQHMjauqodT6k3YxOUMbmlxTsgsHUA/l/dLEsePlVgNg5ftyPdjE0zY3TS33thlfs3cvc3r2kwSm3uGLEniv75gAAbXEiz6kkNP3lVotb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332903; c=relaxed/simple;
	bh=HgoXBgjjJqKASHTbRIIZDcfut2hYj9EqpN+1BgbFbIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qFmpoiq83lJoLtldfuQWU9pvDsb9VM1eGECXt12D2wmZkkovoDT16y8zUotC0eKk3a2mN2l6AkL2UOFCubAs9AJVlZyD+HqBJ9IFizHElRaOysZcjO0sPvcs7tuu+ppICDNr486KxueTE/QQMcOA3LAWNtjmZR7SRWm/LdMmkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVQh97m8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22337bc9ac3so31476775ad.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 23:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332901; x=1741937701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvfWS9I+xxJmhfwstktJdtQ9/D4oTmVX3s+qCICHUqY=;
        b=lVQh97m8l9rv5P+mB0rM1w6iU9mTowjInsuYPdlmd+V/vGTEEdoxDo4IucAHIviviq
         YeGkdCz0xi++IFmC/mdmFA4EbzZQOKgd8vlAvULGrimChJW65KGxd+EU5ueOIBNqhkRU
         59V9dIfZe/oTZpbll4DXIdNYoB/hIu8c4vZ8ERwW6SyYQIQ4F9WaDfYPSGmJ1sOukJnk
         J0Sx/jdyaAZSlkODSaJ+fRBJTx54MKPgU2MtW30QHfeN8KBSN/ENY3b8jAnjTgODU4T+
         mMHawSS45F48hOtRZEsrY418VORr7n40DOxRrf8oZqrDD982Xeb3teLMvFLI33AucszQ
         UH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332901; x=1741937701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvfWS9I+xxJmhfwstktJdtQ9/D4oTmVX3s+qCICHUqY=;
        b=ES5X3/n/2PRc6vOEIzDUxvO4BUG6YSEJ8h8e6+tzYzZYRw+pZkuHwEP2jYMySvlaFc
         fRea8Ew3PTakw7GYTng5F1DKB9Bu7WDyXPrz40BowcXu0GPhewOdeuNRZtOXDCn4P04X
         cT1pUWs5rEXB30GVolR2pZNEBOJjcQ4eZneWE2kdQIMRMgRJzvfVOMvT+GqizbT14ZOA
         bUUcQnsK1QgkBOFwON+Vnxt2Du8VDp9Yvxch0BgI6ADtz+C76PDyXpg+QtINnHDrCSnJ
         KexggU4LsG87t3Cacd+R+pM1EWM8NgnVZW6UjngX1cmoZrqfIZMDsBmdhz6Z0pxBmTCZ
         bFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy1pfHSUcPWl4er1Qfh741/9LVku41JczYAayYFSX3xeLMG9VjvM2LXxsugqSq7NQLQFCWqqBAI3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfD9TblZgVuprtBI/hFVjFNzgLFIqQHHeIZf96alHj43ghPflb
	+oK/0aGvWtVxKnCHP2Ggh9zHuVmry0fwsY/nFicteZIkcaZlU3Xid1RreWULYio=
X-Gm-Gg: ASbGncsTC50WrSIXwS8Z4vW/B77yWVu7xv1BYCMoZqPjkkevymbWD6ASJTHisFzO0/w
	J3xD14zKd3RX8NIuif+O9H3n1e1xj1smWIE2pHySm6Jrs7577tcgQ0+xD2QJDqWhXT5txcXP0tg
	78XIOb1e994dt9tvscqgNNhw+TAmbQyaYwOgjNIUVNYl1BDv+mbCYU+WCmhbuR605LvLm7QA1hJ
	+XJQUfz/bMp05938/Cn9sOg7SzEMpFt4zOe43u72m63y8yw4spE5vMhlYGzj8vuPdNaaQlps9yz
	aUU3IQ46uC85f81aRlYUKukm0pYkLqar+u0JOE1F9bHucA==
X-Google-Smtp-Source: AGHT+IGzvISO3DHN4YfgHxUCOoE0zLM9L1UTzuGnRt9Y7NayT3b0v48rrEVTwSwz5RzxRblqAFbTfw==
X-Received: by 2002:a05:6a00:23d5:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-736aaaefe79mr4176896b3a.20.1741332900663;
        Thu, 06 Mar 2025 23:35:00 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfd8sm2584754b3a.83.2025.03.06.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:35:00 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in cpumask.h
Date: Fri,  7 Mar 2025 13:04:51 +0530
Message-Id: <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1741332579.git.viresh.kumar@linaro.org>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes various kernel-doc formatting errors in cpumask.h:

- WARNING: Inline literal start-string without end-string.
- ERROR: Unexpected indentation.
- ERROR: Unknown target name: "gfp".

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/cpumask.h | 65 +++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 36a890d0dd57..8b53e01dbd97 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -20,7 +20,7 @@
  * cpumask_pr_args - printf args to output a cpumask
  * @maskp: cpumask to be printed
  *
- * Can be used to provide arguments for '%*pb[l]' when printing a cpumask.
+ * Can be used to provide arguments for '%*pb [l]' when printing a cpumask.
  */
 #define cpumask_pr_args(maskp)		nr_cpu_ids, cpumask_bits(maskp)
 
@@ -166,7 +166,7 @@ static __always_inline unsigned int cpumask_first_zero(const struct cpumask *src
 }
 
 /**
- * cpumask_first_and - return the first cpu from *srcp1 & *srcp2
+ * cpumask_first_and - return the first cpu from *@srcp1 & *@srcp2
  * @srcp1: the first input
  * @srcp2: the second input
  *
@@ -179,7 +179,7 @@ unsigned int cpumask_first_and(const struct cpumask *srcp1, const struct cpumask
 }
 
 /**
- * cpumask_first_and_and - return the first cpu from *srcp1 & *srcp2 & *srcp3
+ * cpumask_first_and_and - return the first cpu from *@srcp1 & *@srcp2 & *@srcp3
  * @srcp1: the first input
  * @srcp2: the second input
  * @srcp3: the third input
@@ -266,7 +266,7 @@ unsigned int cpumask_any_distribute(const struct cpumask *srcp);
 #endif /* NR_CPUS */
 
 /**
- * cpumask_next_and - get the next cpu in *src1p & *src2p
+ * cpumask_next_and - get the next cpu in *@src1p & *@src2p
  * @n: the cpu prior to the place to search (i.e. return will be > @n)
  * @src1p: the first cpumask pointer
  * @src2p: the second cpumask pointer
@@ -334,7 +334,8 @@ unsigned int __pure cpumask_next_wrap(int n, const struct cpumask *mask, int sta
  * @mask1: the first cpumask pointer
  * @mask2: the second cpumask pointer
  *
- * This saves a temporary CPU mask in many places.  It is equivalent to:
+ * This saves a temporary CPU mask in many places.  It is equivalent to::
+ *
  *	struct cpumask tmp;
  *	cpumask_and(&tmp, &mask1, &mask2);
  *	for_each_cpu(cpu, &tmp)
@@ -352,7 +353,8 @@ unsigned int __pure cpumask_next_wrap(int n, const struct cpumask *mask, int sta
  * @mask1: the first cpumask pointer
  * @mask2: the second cpumask pointer
  *
- * This saves a temporary CPU mask in many places.  It is equivalent to:
+ * This saves a temporary CPU mask in many places.  It is equivalent to::
+ *
  *	struct cpumask tmp;
  *	cpumask_andnot(&tmp, &mask1, &mask2);
  *	for_each_cpu(cpu, &tmp)
@@ -369,7 +371,8 @@ unsigned int __pure cpumask_next_wrap(int n, const struct cpumask *mask, int sta
  * @mask1: the first cpumask pointer
  * @mask2: the second cpumask pointer
  *
- * This saves a temporary CPU mask in many places.  It is equivalent to:
+ * This saves a temporary CPU mask in many places.  It is equivalent to::
+ *
  *	struct cpumask tmp;
  *	cpumask_or(&tmp, &mask1, &mask2);
  *	for_each_cpu(cpu, &tmp)
@@ -411,7 +414,7 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
 }
 
 /**
- * cpumask_any_and_but - pick an arbitrary cpu from *mask1 & *mask2, but not this one.
+ * cpumask_any_and_but - pick an arbitrary cpu from *@mask1 & *@mask2, but not this one.
  * @mask1: the first input cpumask
  * @mask2: the second input cpumask
  * @cpu: the cpu to ignore
@@ -545,7 +548,7 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
  * cpumask_assign_cpu - assign a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)
  * @dstp: the cpumask pointer
- * @bool: the value to assign
+ * @value: the value to assign
  */
 static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
 {
@@ -623,7 +626,7 @@ static __always_inline void cpumask_clear(struct cpumask *dstp)
 }
 
 /**
- * cpumask_and - *dstp = *src1p & *src2p
+ * cpumask_and - *@dstp = *@src1p & *@src2p
  * @dstp: the cpumask result
  * @src1p: the first input
  * @src2p: the second input
@@ -639,7 +642,7 @@ bool cpumask_and(struct cpumask *dstp, const struct cpumask *src1p,
 }
 
 /**
- * cpumask_or - *dstp = *src1p | *src2p
+ * cpumask_or - *@dstp = *@src1p | *@src2p
  * @dstp: the cpumask result
  * @src1p: the first input
  * @src2p: the second input
@@ -653,7 +656,7 @@ void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
 }
 
 /**
- * cpumask_xor - *dstp = *src1p ^ *src2p
+ * cpumask_xor - *@dstp = *@src1p ^ *@src2p
  * @dstp: the cpumask result
  * @src1p: the first input
  * @src2p: the second input
@@ -667,7 +670,7 @@ void cpumask_xor(struct cpumask *dstp, const struct cpumask *src1p,
 }
 
 /**
- * cpumask_andnot - *dstp = *src1p & ~*src2p
+ * cpumask_andnot - *@dstp = *@src1p & ~*@src2p
  * @dstp: the cpumask result
  * @src1p: the first input
  * @src2p: the second input
@@ -683,7 +686,7 @@ bool cpumask_andnot(struct cpumask *dstp, const struct cpumask *src1p,
 }
 
 /**
- * cpumask_equal - *src1p == *src2p
+ * cpumask_equal - *@src1p == *@src2p
  * @src1p: the first input
  * @src2p: the second input
  *
@@ -697,7 +700,7 @@ bool cpumask_equal(const struct cpumask *src1p, const struct cpumask *src2p)
 }
 
 /**
- * cpumask_or_equal - *src1p | *src2p == *src3p
+ * cpumask_or_equal - *@src1p | *@src2p == *@src3p
  * @src1p: the first input
  * @src2p: the second input
  * @src3p: the third input
@@ -714,7 +717,7 @@ bool cpumask_or_equal(const struct cpumask *src1p, const struct cpumask *src2p,
 }
 
 /**
- * cpumask_intersects - (*src1p & *src2p) != 0
+ * cpumask_intersects - (*@src1p & *@src2p) != 0
  * @src1p: the first input
  * @src2p: the second input
  *
@@ -729,7 +732,7 @@ bool cpumask_intersects(const struct cpumask *src1p, const struct cpumask *src2p
 }
 
 /**
- * cpumask_subset - (*src1p & ~*src2p) == 0
+ * cpumask_subset - (*@src1p & ~*@src2p) == 0
  * @src1p: the first input
  * @src2p: the second input
  *
@@ -743,7 +746,7 @@ bool cpumask_subset(const struct cpumask *src1p, const struct cpumask *src2p)
 }
 
 /**
- * cpumask_empty - *srcp == 0
+ * cpumask_empty - *@srcp == 0
  * @srcp: the cpumask to that all cpus < nr_cpu_ids are clear.
  *
  * Return: true if srcp is empty (has no bits set), else false
@@ -754,7 +757,7 @@ static __always_inline bool cpumask_empty(const struct cpumask *srcp)
 }
 
 /**
- * cpumask_full - *srcp == 0xFFFFFFFF...
+ * cpumask_full - *@srcp == 0xFFFFFFFF...
  * @srcp: the cpumask to that all cpus < nr_cpu_ids are set.
  *
  * Return: true if srcp is full (has all bits set), else false
@@ -765,10 +768,10 @@ static __always_inline bool cpumask_full(const struct cpumask *srcp)
 }
 
 /**
- * cpumask_weight - Count of bits in *srcp
+ * cpumask_weight - Count of bits in *@srcp
  * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
  *
- * Return: count of bits set in *srcp
+ * Return: count of bits set in *@srcp
  */
 static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
 {
@@ -776,11 +779,11 @@ static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
 }
 
 /**
- * cpumask_weight_and - Count of bits in (*srcp1 & *srcp2)
+ * cpumask_weight_and - Count of bits in (*@srcp1 & *@srcp2)
  * @srcp1: the cpumask to count bits (< nr_cpu_ids) in.
  * @srcp2: the cpumask to count bits (< nr_cpu_ids) in.
  *
- * Return: count of bits set in both *srcp1 and *srcp2
+ * Return: count of bits set in both *@srcp1 and *@srcp2
  */
 static __always_inline
 unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
@@ -789,11 +792,11 @@ unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumas
 }
 
 /**
- * cpumask_weight_andnot - Count of bits in (*srcp1 & ~*srcp2)
+ * cpumask_weight_andnot - Count of bits in (*@srcp1 & ~*@srcp2)
  * @srcp1: the cpumask to count bits (< nr_cpu_ids) in.
  * @srcp2: the cpumask to count bits (< nr_cpu_ids) in.
  *
- * Return: count of bits set in both *srcp1 and *srcp2
+ * Return: count of bits set in both *@srcp1 and *@srcp2
  */
 static __always_inline
 unsigned int cpumask_weight_andnot(const struct cpumask *srcp1,
@@ -803,7 +806,7 @@ unsigned int cpumask_weight_andnot(const struct cpumask *srcp1,
 }
 
 /**
- * cpumask_shift_right - *dstp = *srcp >> n
+ * cpumask_shift_right - *@dstp = *@srcp >> n
  * @dstp: the cpumask result
  * @srcp: the input to shift
  * @n: the number of bits to shift by
@@ -816,7 +819,7 @@ void cpumask_shift_right(struct cpumask *dstp, const struct cpumask *srcp, int n
 }
 
 /**
- * cpumask_shift_left - *dstp = *srcp << n
+ * cpumask_shift_left - *@dstp = *@srcp << n
  * @dstp: the cpumask result
  * @srcp: the input to shift
  * @n: the number of bits to shift by
@@ -829,7 +832,7 @@ void cpumask_shift_left(struct cpumask *dstp, const struct cpumask *srcp, int n)
 }
 
 /**
- * cpumask_copy - *dstp = *srcp
+ * cpumask_copy - *@dstp = *@srcp
  * @dstp: the result
  * @srcp: the input cpumask
  */
@@ -840,7 +843,7 @@ void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
 }
 
 /**
- * cpumask_any - pick an arbitrary cpu from *srcp
+ * cpumask_any - pick an arbitrary cpu from *@srcp
  * @srcp: the input cpumask
  *
  * Return: >= nr_cpu_ids if no cpus set.
@@ -848,7 +851,7 @@ void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
 #define cpumask_any(srcp) cpumask_first(srcp)
 
 /**
- * cpumask_any_and - pick an arbitrary cpu from *mask1 & *mask2
+ * cpumask_any_and - pick an arbitrary cpu from *@mask1 & *@mask2
  * @mask1: the first input cpumask
  * @mask2: the second input cpumask
  *
@@ -941,7 +944,7 @@ bool zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags, int node)
 /**
  * alloc_cpumask_var - allocate a struct cpumask
  * @mask: pointer to cpumask_var_t where the cpumask is returned
- * @flags: GFP_ flags
+ * @flags: %GFP_ flags
  *
  * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
  * a nop returning a constant 1 (in <linux/cpumask.h>).
-- 
2.31.1.272.g89b43f80a514


