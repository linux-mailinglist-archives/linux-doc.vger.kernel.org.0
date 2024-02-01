Return-Path: <linux-doc+bounces-8132-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5784599F
	for <lists+linux-doc@lfdr.de>; Thu,  1 Feb 2024 15:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38876293061
	for <lists+linux-doc@lfdr.de>; Thu,  1 Feb 2024 14:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9E95D473;
	Thu,  1 Feb 2024 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rSHHkAJi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB495D48E
	for <linux-doc@vger.kernel.org>; Thu,  1 Feb 2024 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796343; cv=none; b=SPqbanukURec5CThRYQkfNnCVDGhofNmIwM0IBrv2L9EirDQeAaWuVQGNoR/DBijKi2n5divpjB6Vfm2eily++1ilytRED+6KTL39C2Smy8xSAqWBYVqr8tIUWlpLh5D3ncqE29U0NA/OkUAL0xlklzELz7qnD10VjoODCYi6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796343; c=relaxed/simple;
	bh=7BvcHpGNojuMkGldGxA7daDj6oUHy4iiyQOkU+6RsWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ew0SSP3EhyKxQ8UXtmgR+fuKzoBo8URr01ZHtJDLbG3r82UH/PTqm2+gxIi1Ux+d/Y9/u8g/sBCW+olNCp/BXoMwSease/W//onxPc/ZT9XiB8kmqS3DkJ8u6s3pX6Lps8NgdP609aSmLELgfKKUD7peKbaAj+X0q6a34N7cOug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rSHHkAJi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d8b2f392b3so739885ad.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Feb 2024 06:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706796336; x=1707401136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiEpcBE0z8Q5t3JWdIgJHWEI2G0S1HPZ9ikeHZvifi4=;
        b=rSHHkAJitqpY8jYzEFpBLQbaIfCepERGoPtXmgjMFW5vaALlYQd2crm10cF+Wm+0tb
         mCjPuxfGOIEyUKZ7e7aEslz2IjEA2IqGMi1ZI4ph6EZdUc0XcgnMmjyFLOeBILj8gb3a
         st12gmXbw+EBz3Wl4/S6D7DL0FbjSFhbCmJYx3211dqsXCsOiLn0lb5QBNYP8j77VN2U
         CobBhVBpl8C8mbHloriG7lGkquvJoqJHcYpVl/IOkxz9FOwQT2U4arBW1vdUvASL1hp+
         CFdFR7rh6l3iiuS6iml4/dT2g20p5ihaErwr8W3yLgrL1biOFXPGH6WL5c+Gg+VxqN9S
         5VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796336; x=1707401136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiEpcBE0z8Q5t3JWdIgJHWEI2G0S1HPZ9ikeHZvifi4=;
        b=Ak0jmPM7iU3JaA8H56m8Z4YnXW59Y0wpNPb3wkFSwx3LJvj3MenuE0hOC3ddKzY6x2
         qp9oBgl8+JUsiK1c+vzJydsJ8Qx1vLXk9xc7w8vZubHJnAe+CVzro8xufgxyJ+lRWZOL
         3Y2nJghNIswHY5IJvA0xjX8GFcXZHAMODzzPTX6YcliCPupfB4QYnFIX6CRDgUNrK4TH
         mGdpLCrJrJygNHs80idgSqWf0CkZ/hMFgqfWH3iGe/mj6azcJ4HejhESrefXFtdIxS9h
         XfZlSZ5pZZNF8Rb7q3OpCGRcQQLWr5pzhPns7oteG8V7sKuf1yk3CnKCxUhfArIprSmd
         Vqqg==
X-Forwarded-Encrypted: i=0; AJvYcCWk+zY4Ifd99K5Y78JcbbSVUZobExmp8GZY9xuJy0WKX6EysHEq/PU9DMgg1Fracwb+ZGlzGWD3EGNXINU2XJn5JOLzHwM3xHj4
X-Gm-Message-State: AOJu0YyBUNl0nOqXFcAzOz0lf8tPQUmP9/r3V9WTYXec7EIvGt7YgC4d
	4tpoRjxtTI6+sz7jGVT7EauZI7/cLxAVCxF0sctqfxJZrbms03F0bg7oJBKBVYE=
X-Google-Smtp-Source: AGHT+IH8tWdldiYSjIIvCar+NyjyZ+8lWYi2wVCMLRjX2BxVq2M9ONUwvbyZ78JOaLsGgI8+DCI/jQ==
X-Received: by 2002:a17:902:ea08:b0:1d8:d1f5:e5d with SMTP id s8-20020a170902ea0800b001d8d1f50e5dmr2801264plg.0.1706796335668;
        Thu, 01 Feb 2024 06:05:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU25vJ3ilONQ5+/2C4Wo2EpHNVQs3nHC9z6Guhj5ymJAU6kxBvc3F//8Q+scr/hLvk8cIRUNkuurwXW45PCazS3ATmw/SnLm77EZOQ5TLzQaZxwVz9beY1BoTbofuwYSOjNSrYouvlGBRh5WS9oj0ANDmSCutNP3ZHt5m2gCwJHrnuFGlHgQ6bdn6QSPWEnbdFWb8Z4mFT50NQABIOvwob+iHVHb8iq7tM4FZPxfNIUz1GmPKdRDJ5JiWaqnVA+S6yu+q2wH3eQ2GPTLoh4+tFD4tCseVmgacj20XaeMvCa9g==
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:189:f9cd:e10f:7a3f])
        by smtp.gmail.com with ESMTPSA id kb16-20020a170903339000b001d8ec844fe7sm6914308plb.283.2024.02.01.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:05:35 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export VA_BITS
Date: Thu,  1 Feb 2024 15:02:45 +0100
Message-ID: <20240201140319.360088-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some userspace applications (OpenJDK for instance) uses the free bits
in pointers to insert additional information for their own logic.
Currently they rely on parsing /proc/cpuinfo to obtain the current value
of virtual address used bits [1]. Exporting VA_BITS through hwprobe will
allow for a more stable interface to be used.

Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux_riscv/vm_version_linux_riscv.cpp#L171 [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>

---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..6f198c6ed4f0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,6 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VA_BITS`: An unsigned long which
+  represent the number of bits used to store virtual addresses.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..2a5006cddb7b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -67,6 +67,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_VA_BITS		7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..328435836e36 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -202,6 +202,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_VA_BITS:
+		pair->value = VA_BITS;
+		break;
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
-- 
2.43.0


