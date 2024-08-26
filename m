Return-Path: <linux-doc+bounces-23844-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A30A95F6BA
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 18:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C93C1C21D2C
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 16:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCCF19884C;
	Mon, 26 Aug 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vnVa717q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604FE197A9B
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690220; cv=none; b=bwKU4kN2PXiWzQd+Vl2QDlR66PNd+TwnRhSI2qLuVRzL4du+NUE89D5m4J7bsWffoPkR0uzhWYY4uLHIRy5lVV1Dh0kL+uOjjGju8YvF3nKPvAo8fVSskjr5NAxeMfKAxeIISKCBQqpEGo2VAtRhtv3m13gfNlA435+/5iZbBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690220; c=relaxed/simple;
	bh=/8JFLNWM/SAveIiHQ+Qz3OxCPpwk7H3LTUQkZXSioLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ywcg4SgCE5RscIqiiaw3jTq/d3gfutYdG1hAefdd4gk0JK+uQ6q2lyecm4wgdA7n1d7B7nhdxghbA+eCXOI7ASeU8u24UVapSRfyVmWJqGyYn/lpJlhMxt7Mp0z4IBVuhlsOOjll8UEC+LoLOIPrtk/3kLPr6IgtBQte9drmi4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vnVa717q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7148912a1ebso850400b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690219; x=1725295019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9IZbphD4s+T0TTG0K3sRw/t0vq8ENy625o4Izgt1nw=;
        b=vnVa717q8+7IlLaqcRnVj/kaP72TlXKu6cz/Z/kxi3XQxw+w6QLvNYO12VFzargeLJ
         21Fi/fzHdUH6L+OgntCTmjvDIiDYWlZyuKoDAEeVjZtJNX++LmPqiKjpstoIIgewaBOL
         A0aJAMnY25FG0Cdp9ah1/w3gEbR5M0Fzo+GjNOmSi8JVsu7tCz4DmlAeQFr6R8bpe3ss
         ybuDArzpn6pG2WBukPaf2WY3tIgM/U83yMnOluNCQ4r/9WlfACvrhgb85OOep/iTCC8a
         eEBxRD8dZT87qFC9SJH45D5kDgQ/7Vk55u6guUelxnvrZNgna8RVBrjhUPPE3lzU6lI7
         ljHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690219; x=1725295019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9IZbphD4s+T0TTG0K3sRw/t0vq8ENy625o4Izgt1nw=;
        b=AKL3OWSsIm1uDCWg1awqWMLGs69U1/oQXpNDSzMumw5vceiQdpPpkb+32WYGLZD3TW
         CyvNqmibpeXr8fbJoJ8huk7Dzqf20yTXROfVVW5hthNVJg/RQMFV0JdxLW477q2wS8fY
         KrFIoCVh5PtNGcW97U1yTw2qrpufS4dJ5Wg0Hn/EHAWmTtYs+RhwCkHbOibdZmYR0Zg0
         kRUz74brZD47vPy+xY8XuG5El7lTUGAa+5g8+4+Wh3W/D8pGOoCK5iesTNX/TEDB2hVw
         z44CAFqNLGwJvRswboqfsNKDjWAfKdbC/0WEhG5g+dbYxpX/b1cI5bAWjUqlzsfLiZiE
         YNEw==
X-Gm-Message-State: AOJu0Yy5FKmXGdUg7neFYslg8SENapnziBhHQfKnhE8fhdrfNizfWFb+
	5tRb2mGBcCzKqL5CS7eNaRKiXoMiHrDGGlpTHEp6+QI2qoYMZf+JQBdjfVw0VzA=
X-Google-Smtp-Source: AGHT+IG9S6oOIHruoTcjy62dAwScwy++NKf5ocrr2BTJ3qmhr+nv5kpfhPnFgduK13TqKhl9HxaO5Q==
X-Received: by 2002:a05:6a00:928f:b0:70d:2a4d:2edc with SMTP id d2e1a72fcca58-715c0093c51mr270187b3a.20.1724690218578;
        Mon, 26 Aug 2024 09:36:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 26 Aug 2024 09:36:47 -0700
Subject: [PATCH 3/3] riscv: mm: Do not restrict mmap address based on hint
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-riscv_mmap-v1-3-cd8962afe47f@rivosinc.com>
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
In-Reply-To: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/8JFLNWM/SAveIiHQ+Qz3OxCPpwk7H3LTUQkZXSioLI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9coObJpTnjRVFj/xm7Xmcv6zBqnVkoL5zVbvk2tmR
 B4+/FSjo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlsP8jw3+fF7qYfrbr93FJN
 Uz64q878fDCj/xlbXeq3iT8LLv4PrmL4Z2WSvmDLzd6Q4hUNgkc+LszzemO1XEnr3Mr4eRsDYrT
 6uQE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The hint address should not forcefully restrict the addresses returned
by mmap as this causes mmap to report ENOMEM when there is memory still
available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
---
 arch/riscv/include/asm/processor.h | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..efa1b3519b23 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,36 +14,14 @@
 
 #include <asm/ptrace.h>
 
-/*
- * addr is a hint to the maximum userspace address that mmap should provide, so
- * this macro needs to return the largest address space available so that
- * mmap_end < addr, being mmap_end the top of that address space.
- * See Documentation/arch/riscv/vm-layout.rst for more details.
- */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end = STACK_TOP_MAX;			\
-	else							\
-		mmap_end = (_addr + len);			\
-	mmap_end;						\
+	STACK_TOP_MAX;						\
 })
 
 #define arch_get_mmap_base(addr, base)				\
 ({								\
-	unsigned long mmap_base;				\
-	typeof(addr) _addr = (addr);				\
-	typeof(base) _base = (base);				\
-	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || is_compat_task() || 		\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
-	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
-	mmap_base;						\
+	base;							\
 })
 
 #ifdef CONFIG_64BIT

-- 
2.45.0


