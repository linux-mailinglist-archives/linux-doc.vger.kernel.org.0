Return-Path: <linux-doc+bounces-43542-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08467A93198
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 07:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B15511B64F4E
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 05:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF94F26A1B8;
	Fri, 18 Apr 2025 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mg+puudG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C626A1AA
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954484; cv=none; b=U+K5x6v7dRncxWufzod2qrjz/6F0m4xIGMd8QnqYxtj6SH9S8KpsB29nOWX46qtwKt4DTjO6RwgK/d4w6tMcQtuxAoTUwzyKvtiGEdN/p9YCW0P/U9+rVvyjCVsiH+lLFdPqZ0BqE2oBpx7pJ8+3dEl5lFbYsJBo+c/p88mlB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954484; c=relaxed/simple;
	bh=rf7VTAibhA1rsd++vGyUgsQGxAKMW4BWzucsOsuCqgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FxMuwLBGe7zf2QGiwhP4wdxqWSH8Unk1bLcW0/aQ7/2GlpmUqE1ORuVy4hManwE8s/qG7vBD5XujDQs/yTIEoJhQCByVyuCn7EVNkLbFFoC98dFMeNTPPIk1MC5LByn8UJtx09+0iTEWnfNc0Beg8Wzz8rFWi8k6jthWJ8tnyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mg+puudG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399838db7fso1602988b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954483; x=1745559283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=mg+puudGqP9gb8norwO7n6fmFMcDMyBUzYUBl59uqxm48tUKaZpL6yuQJSdWWy/bq1
         stbi1O6irdsdaPhbHHwKByjAmy1EK3KG0pLm5JIthG/QLdYwKm6we4pGB8uiiRSPE0d3
         whYHfFF9vhj9jFoo8LU+bidCnDCoBuCQteQXD5JcqGnJoZgTcKBb7mCIluS1rkfNvGgV
         PLnmq1VEUNTvRd2q95WByHcu7NPVyOTVVTm9PLJWXJigfG9t+iMHlmTWvzVdGtNotY7u
         bZSDnfCx9etagvozMEWDxeATHX61ZKVUO2S79S0aFk5q58yx4Zv3oAgYXR7FgsdFgasG
         9BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954483; x=1745559283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=NTQU3LnHZwdef8H5ArppsR5iHZBidqw42E/rfJDhpVBtGLRsSjRMwkaYNjktjdw+87
         HcfxU+VnAXtNvC7rLCJ4RLt6oBxPVO1vh7NXyWNY1JJT5rIDbrvgw2x7q0FkiFydKup5
         8lhM7O/uh2WZKymcD+lG/MyQCstU5USdzdTahmVScOGvRmJ74wX78dhLg4WC8OnQ8Qf8
         YAvfhkTpbyK/zfsd/4y6yas1986I9+VyO2r6KaeZnI1gnFBOXmnHEL0s5er1YpkFjwyV
         +Sypb7vZfVPSgrqByCOeSjvxsa4fHGvNM2o6xYWJzrjtWtxjhqf/6X3lycYFFqLrMfC9
         TUeg==
X-Gm-Message-State: AOJu0YwxwDxo1xJziSZanvTg428a7Fpj5uoekmUubecnsSvxSeFbfN1r
	SXpBnBnCj8tVLNtnm2JM9rnwt9GyN6vvBPERqt4TOgsPhOR8+t8Ee69lMXkbki8=
X-Gm-Gg: ASbGncsJOzk5wjzBAOIZuSLOQr/sZDlOlqxBsZbHY/Hslh0PeGvqoY6PDKfE4t3wSIz
	bTq8CS/t9f7LRfCMcmoTUpyaJt9fxsBWU1QXTWPQiEKIlr6ON3Fc73NDaXCDgfappgySy2vXztT
	lBeJaHIz4tmvZp00nAw0saykO9BmR5qggVROJ9BAERlOUIYWNcJ+/f35D1b4ENU8DkxV5DqTyk1
	VzpUd/ahv40HvYXLW3rGNIhh9mp7V4R4AThMsQCGgYwcwXKTQuJ9AzjW1ygifXPUrrMiNx1zAbf
	Cd2HP3KZLa+92VNypVtjCR+378PHo3t8E26VOhWBDj0XLnbEXdLRSDHLkxX+mDbMMkKBEgJ+IIv
	c
X-Google-Smtp-Source: AGHT+IHQM1ft6hjpNMobm2/YoeNnotmxkTudlzgz2ZgJSZr49UA1a3+mNT2Kn2UrRzZ6aASVjmqjaA==
X-Received: by 2002:a05:6a00:1788:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73dc17f7db4mr2280418b3a.2.1744954482861;
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:38 +0800
Message-Id: <20250418053239.4351-12-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the support for matrix multiply accumulate instruction
from SiFive using RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index e15405e12239..7c11351b1383 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -353,3 +353,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
 	Clip Instructions Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
+        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+	Instruction Extensions Specification.
\ No newline at end of file
-- 
2.39.5 (Apple Git-154)


