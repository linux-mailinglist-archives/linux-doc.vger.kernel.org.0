Return-Path: <linux-doc+bounces-32975-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8A9F4404
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 07:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 846BC7A01DD
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 06:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18E41DEFDC;
	Tue, 17 Dec 2024 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yqjMiHyl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422EC1DE883
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417567; cv=none; b=P8TP1e8Tn6CTPsSxY8KCXhQNMedmGsX5pb/e7+ESOJ3xksJgZVTsAzqDqAHrWA1zuqGepvkwQxyvCS9R0fk4UQ8aqZmZoXOq389Pbjz2jyF8r0j4L4VDS4H438emszGKcM7s1mNrQYrxqpf4YJV5PXXFaNEMcwYpG83wVKtgUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417567; c=relaxed/simple;
	bh=aj6KhD87JndqJTmCbrJmfbqawzLsCSF87gVbexImUU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHY5TwCI7cWjV+g31hxPSfxjH4mHxcYExNxkllhoaBzmwN3tMhJeJd4ZfumvPAhTj6xzUvaxUZdRqRlXDZBVgQlcxkwplGZOIBm4a33LTZGkG1jyKyPtcmE7MFl7HW8QUglLw2AJ1M+LV+qp59wItp0JTKjYSefFekC7ggQXgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yqjMiHyl; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee6dd1dd5eso3778215a91.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417565; x=1735022365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=yqjMiHylRVg6Q1ADoexQymJJw5Zo5bH3e4INm/CKAaBitFmyiwMXT+ZXwFDIoXacZj
         x7jEiUatNUlAmlvr1bZxxplMvJ3SKGtTIlPUAW/DknbdAt7m5CxkG0Unb0M7eRV9chhl
         H6jFCstAfVTL03kbealwfXXHxvXu224EpuE8Ohix1IwaqXTxaq5JU6CnSadrq1xg3xNj
         9feOaahEXFSVyD86KOFmi++rqI2jFVOwCXGp/Wl087Jak1c4QiIc0U+3JTUVtkhVY9kL
         v/ScGs52cFcr0VmUUjBEVKYDGLmBkxs99X2lTuZxXYt29j+h3SlSONTTGEE4mF+fwKIR
         Ifbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417565; x=1735022365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=gAcLAWk0vM5qZ3QpfGZchNotfCDNaC0wX0p2F7LiIrWhmutmzOun3vboDnT83X4Oaj
         7bHXhvgQp4yGBus5SxqUYmNKUlBtvmekzW9h3LCL5UnhMaA8avRx1wSTqUzYnwmyjkmo
         k4iB7rb8dfE0LNsclM5EW6dPOlMZHxl4Mjsh1hGFCv+7iRkR51UNMH8QSVPW3uLOPwuC
         NzhF/rWTvODMmiCnYbLSS2BfY89WL5uiK3DEAaCHy5N/zehwQ5ncP9KFAazrQmRcChjs
         E8AAOJxZwkmcsiMeUcZ/4AZA96StpoX14A9JlvPFO9N8fLp69J3KZDdcORMMbsBHncXl
         csdA==
X-Forwarded-Encrypted: i=1; AJvYcCWnY2jh1l9cRjBwS2s4iHq/x7I4uPMclvCnZlVOYrdhk/kCwfdz+P93QCTUac3yogEaJq7d43RJi8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/WWUTI23/gZ9i1WcZBy4Buq1ou7+SD3XgZMn94+ebZXZyRHeo
	hrBpGasZn7pbFyVUEfBadR8iY8Ozk8q557nfcVhXA5Ssf8oXn/kC7euCRc6gk38=
X-Gm-Gg: ASbGncsWXZ0E//c2ZS1fgSOf7CmYEFdyOP9QoGDIpRlWzmAoCG8zhUnAxhw22lAOImu
	LCmytoR8UZXw+YW9tioSusnMMNAZzD0qB5lVyzaALf6WsXXpJQqfRIXy0U0/syoPaxOY7u39iDL
	WiD0OoJemFf+5dly5k6ldqS6jjuETqc6b75M7U3obFfyf+ajfz7feyBABCYK/vHOLLuDxjX21vE
	wfJw2otQUV0hMjrENj4CKKTrVECVQlwF824FyrEvIs4PZ0Hx9GqhnhKrUTpAE7pwKnwddhU
X-Google-Smtp-Source: AGHT+IGUd4gH7BE0kdkomPlujnx2e5+f9LC+XgSew50DyNj1to7GARJn9sGir0f0VS3f2JBCRB8eHA==
X-Received: by 2002:a17:90b:53d0:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2f28fb5fd68mr23504844a91.10.1734417564810;
        Mon, 16 Dec 2024 22:39:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:32:48 -0800
Subject: [PATCH v3 03/16] perf tools: csky: Support generic syscall headers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-3-239f032481d5@rivosinc.com>
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=aj6KhD87JndqJTmCbrJmfbqawzLsCSF87gVbexImUU4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qiTC/nK6erkybH3NrWECwgfVPwiuDsS6e8mBZf0a3s6
 /zMIbC5o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgImIHmH471mzgum0s/DxZc/W
 R2uta3gg2jq76fSrOK/nf1x/X40J8GBkaP/tI/tf562q7WH+bRKnXUXW5Cpkc36obHnwXnROtN9
 MDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

csky uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f717e4628d9e4632f53fed16524a659a3e4feea5..b20daf3769771a7c23cc0f7dd46f562510bc3199 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc
+generic_syscall_table_archs := riscv arc csky
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c0232ada0ac1f79a3f
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/csky/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


