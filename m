Return-Path: <linux-doc+bounces-15736-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EA8BB2E7
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 20:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8663AB239F2
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 18:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB36D15AD8C;
	Fri,  3 May 2024 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XNypQBxw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798415B13C
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760350; cv=none; b=bXusWqo0ZnhhusuFXn5E/GUSPYbgIvz+ZLY2eA6mgpPS1ilvgGHN6DFmvyg0YVtTSJSfqgt0Q+Z3LdbBLa5CEqajZC6kTokWisH40Vp1/74axMHmS+pd78OOKqoau+jfcBtg5Ccxwlffnv3tbl609uketid4jX4XQHmhlhGnyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760350; c=relaxed/simple;
	bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ0ivjQimjWnKwhS2VbBXZHpg5jLpbz+qNyYfnlaEni8BPXWv/AkXsVz9JpsEn0CjiKDUdvGxMDzHRl3f9Sl1oNNtrdfypMmTHDV8dcShwbxkCaU4+4ewyaQwTsxMdZOto10TQeK44q+oOIxJbbwZoM3zrf77ncZrTdMqPF5w6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XNypQBxw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so2568b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760348; x=1715365148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=XNypQBxwAjt1JQAyrYHb6fr1InxLSxJEzQnFFcrdICmoxXIVwvjMEqdcx87Dxb5LD8
         JqgMdHf0Ag4vH6LkKj63zDq+uBsxVqJTRBuX/TcWpI32CWok/kIRi4P9IXZ6MhiYipTB
         ikGpiMWof8IBWqEzoVoyUz1ZW4aGmc4z3skhxvpbBDaXoYV2jPQQ0zi73llygBDq5ITB
         S8aPNajRPf+fvuQQz342WMRiXKd0KrvkUO0ETaQPGk5M2s4vf+dRMejV7+ct1Cmr4+NJ
         I9bqvCXwulOR5pmBI2Y2ZOxgKal+c2iW3ZCZWKJ9/rG3LAFwvbVciqlHYA3fA/Vbxjqc
         +6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760348; x=1715365148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=nbGe4Pk//4542v/QenkEoSYkzw0h6MQWVm8KDGJup6ijjoa8apuk3Y+AzTbdy/snT/
         1COT/AH0GMQ6uZ9q8dsneYV9S6BYXNyYD4hYQFG5pu0CNxGITbcUI9ORbUuJBrfKr5ek
         vyBs0JJIRtUVeKZ8TC8iIaVns13rp7Hx941SJ1nHRoChuql5kfQCgVGhQSGVk6g2JVe5
         Kjo09rdUAk5vfkoG0Nj2nHKPNUneDuRSwy+OE9lYXjJ3VNbpe/Q9B+n6CMLRFKrzARmH
         VAP1p+22GFo1NISfYSpsNKOJGlywWkp0jZWDsAhY2aqUVMOx8+4ha/eQLRPSMrZ0ilBQ
         lwRg==
X-Forwarded-Encrypted: i=1; AJvYcCXwjosJH4pNYdy0RzIcGlffwtLikXx3kro97W769uTA/QYMenYH8lyehl32RQdVq/8aOWgLTCabfbTCstTNqPqXPyHAL6RGAATZ
X-Gm-Message-State: AOJu0YwO3mapbhLWXqXXICSuwWy6T9QAur1x8P6NaHHgYuSL7VNbrB4W
	vM7Mpr42Zj9gmXf0sNMCTDqsuNtS/kmzz56YE1rUYmw6Rm3f8CLpMbaHl1HLW4I=
X-Google-Smtp-Source: AGHT+IFpd0GjwjtDFrGFdOgb28GX7E5A84WrU9nww/Fc6oikSNFplYSG78IpCN90Vvy5bJGvfi7P+Q==
X-Received: by 2002:a05:6a00:8c4:b0:6e6:89ad:1233 with SMTP id s4-20020a056a0008c400b006e689ad1233mr4026532pfu.2.1714760347890;
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:27 -0700
Subject: [PATCH v6 12/17] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-12-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=Onr8XJTzFkGHOux99DIgUZXs1b9d+YcK226SmnBPnkCifc4zEA/CelPcAWTyhcOig7svSCUUI
 loL72CiVW4xBpDmLkunPNu4gWtqd89zT8YDIgri2Nv/sOqXqJzDCf47
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0


