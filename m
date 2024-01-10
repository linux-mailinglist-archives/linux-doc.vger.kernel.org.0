Return-Path: <linux-doc+bounces-6300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963778267EA
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 07:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D0181C2159D
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65D679EE;
	Mon,  8 Jan 2024 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2DN7ekIG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AA79DF
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc0edf014cso1024832a34.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jan 2024 22:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704694910; x=1705299710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IgN1RtSHS+JihbyfrF8H+rWapyEwSGcmrp8GqdU1aGQ=;
        b=2DN7ekIGK1/yLPY1pxIflUzigmiH8i56/hivs7ATSg9Rj7YB4rOQOGV6N63042ryQk
         v7vTvibrGwafN5khBakC3nytLO+qBJ0mIkvNEsAbIWhhG1u/sImHGbH/jkgdEeQN1ccp
         KKA3+rMfbwRqMWUCfqLdupX88ahs4laXFQZe3SXcupyfb1s9wJ7pvCCY7i9xLRPESqkk
         QbYFxi55kYFxuKXxAqrWK8Ri0BvbhKw/v43VdKOzJMAxt00VltsCuvMKyYC3YONejfGF
         ncRGChFwuWh7KpVJnBBwxpSmj1oB7q+reBVOlzX2hJQ2ONjnTNvPLTvCrOkAjS9rIQ42
         I6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704694910; x=1705299710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgN1RtSHS+JihbyfrF8H+rWapyEwSGcmrp8GqdU1aGQ=;
        b=jQmNkaLFdFiDk0TgaXy1fpy9SQg1dBOBhNfusNwGTMond40Dd4lTD1vpelRD2sARmy
         jN7PtHHzDP65FZ2tuk1pu1hYSiRM39ug6hJjIs20+EP1HSQJmJhKk8MRqEgAkkS3LKy3
         GJwZyiTGkXJ3WIhQOR2fgRk1SA3Uj32KHxYQVvHcg5PEl0yT0GkR4axnTyjzsIupYkhm
         2EuQI9QtT2T4OAVvel+SpHz2yGpNuTXzpOTY64Kr1SApZ22ZQaouhocJ9KBNuAJ5di4l
         J+llfia/VsS8Z9YnQWMFiq2ugqOLPmmvTU3zssP4Bz8TrsY/ocSOOxnMU1G/SJu/5Y5o
         jvlw==
X-Gm-Message-State: AOJu0YxnR9GzOmnWLRdbjVHTCDh+OHcVuw/p9TrClNhly3aZxWgaso8R
	HG4mWfkY78I974dCvoLdxXpWRSJR3Et8+Q==
X-Google-Smtp-Source: AGHT+IHHLM64yXuAJqutSrCtJH9wFIuHVngJMBfn7wJwWMQrh6npPEnqoNbWGGHxcbsCZuTJ7MSZxQ==
X-Received: by 2002:a9d:6558:0:b0:6dc:c4:c97 with SMTP id q24-20020a9d6558000000b006dc00c40c97mr1594886otl.11.1704694910008;
        Sun, 07 Jan 2024 22:21:50 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i12-20020a9d53cc000000b006dba99e1835sm1274322oth.4.2024.01.07.22.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:21:49 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Sun, 07 Jan 2024 22:21:44 -0800
Message-Id: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHiUm2UC/23NTQ7CIBCG4as0rMUwQ/905T2Mi0IHOwtbA4Zom
 t5d2mg1xuU34XkZRSDPFMQ+G4WnyIGHPo18kwnbNf2ZJLdpC1SoAaCSjnpLLN3Olaqt6tw1SqT
 HV0+O70voeEq743Ab/GPpRpivrwTiOxFBKmnIqhrAGgQ8eI5D4N5u7XARcyXil9RqlZgkWlOib
 gwYcH+k/kgEvUo9/1kVUNSoazLVj5ym6QletJnOEwEAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704694908; l=1657;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kIreaapBsnIOgafnWutqHg5bxWxo+ONImq2ZU3lLm5E=;
 b=ei81+ovlZsn5ye8bHDG1IeVHaGGTtLEg4XHJVKc6XwI/8Hr00OB2m23YatRSjeq1jM5jcTeS4
 8vIYF4k9/t2DQEpEQw+fNFyeJBf43MRFboveLsDiG4vGL6Z22QJo4pd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

[1] https://github.com/riscv/riscv-j-extension

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v4:
- Add OFF flag to disallow fence.i in userspace (Atish)
- Fix documentation issues (Atish)
- Link to v3: https://lore.kernel.org/r/20231213-fencei-v3-0-b75158238eb7@rivosinc.com

Changes in v3:
- Check if value force_icache_flush set on thread, rather than in mm
  twice (Clément)
- Link to v2: https://lore.kernel.org/r/20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com

Changes in v2:
- Fix kernel-doc comment (Conor)
- Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl

 Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 arch/riscv/include/asm/mmu.h       |  2 +
 arch/riscv/include/asm/processor.h |  6 +++
 arch/riscv/mm/cacheflush.c         | 56 ++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  8 ++--
 include/uapi/linux/prctl.h         |  4 ++
 kernel/sys.c                       |  6 +++
 8 files changed, 168 insertions(+), 3 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


