Return-Path: <linux-doc+bounces-15375-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA98B5D30
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 17:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94281C21432
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 15:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85100131195;
	Mon, 29 Apr 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IphIGX5T"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60584130AF1
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403210; cv=none; b=Q9EubWCAa5J/t3OTDhb761MnmyggMwtyUXAmGHlHM8Xl7Kxf0QMJgsVOXGFnkLSdkGjECidlCMIGZcgfTAWKXJxicWdz7J5kUr84R8SXCCxrr+HnTg+geOuaDTe6KwT3GJMd03JckjH7rUy8wfPIraGog745VV7GF9ZnU+ev4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403210; c=relaxed/simple;
	bh=VBYIkTZIleyOsUo3Vs7GTW09WzwtONhQK0/AstEMTYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R01JnrAIvzPe99sMWnup+98Ok260+jrOGIqHRkLJEW52qNVMUvj+n7sYgRyww79HJ9RgT2WEdAYwjvcmN/LvpW5r0zbZWu5FlMNHStt0ciDiZ/tgkv0bZ5vUcit6Bbtg+MZJ56aZKAyMyX306kssOh7VkGEoLAytEuu4W6flcdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IphIGX5T; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d874b89081so11368371fa.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403205; x=1715008005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=IphIGX5TTrUC/uFJ8BaxG7n8/RFvEhoIC1BHzQ5cRX4j563R/qMkGlkYwwjNsmKHdR
         MEL7whh8gGX7f4CAYyb3gFqCYoBemsR9mv4s+pbvSCixsCbnCzSkT6t+s782xWmGdyNt
         ggPSWugYJvgoMGISPiGycCiCAEeqk+/dtTVwSoV0OCF4l/jAY5znMGxfAwz/CNKGUky+
         0nC/VgZokiA26hgMhtnccWfHW7gCakVCErZqFKOE55adMQshJrJnHvBt+QLz/XkLjHRK
         GCWde5JnzlfPUiAvxqdhvKZItGRrZCckIrtebNLP5jshkMwhmOvJ6wJU/HnF3RPFVj4t
         f8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403205; x=1715008005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=ETG2dFB0uhkGEkD1aAF3FmNR6VWi9Edk9iSKES+HPfKPamnRCBxBNI7Cn6AXicot/4
         DlLESD6SmiWrBHTBvXpnWyz8SG9/wyn/pxKWL9H1gP+fsuXs0ahpGafqN8G+OnZsX0VM
         A6nb2EK/9e4pwVv3qXoH+Urmc46TwE/0KsvauJQJL++MiCHzFbpgeqpJJ4bKXtCmdtbc
         MSygAWc4JCWk9elwekhMsX561grjS79tipx5oj1sRq67Dj6JD2dHuotOldxlIXrIxhmx
         JbO5F1yx0o2JBMMN9WaNU7mL7cOmEkQIBciI+g9fnlJ5OG0Z055yBlZP1HxagoMZ869m
         HUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSduNloa5yKpPhrn4es3ROBuh2vXApPZh2/RCbGJ98pWzUDWTlkr/UQqov9yTX+lHQD/5c8SALhBKhBBtDaDlK/kcp73OZq3Zy
X-Gm-Message-State: AOJu0YxM9JXIOuMBzUC+14gTPruWZ9UdwL2mmyNDuGeIEteB3GU2T/J+
	pK02PWYnjTkXpprC/N1P1Yl6qvajcMR/A6zJWmsrWdAL+kcsXgmmIK0enIFeO9g=
X-Google-Smtp-Source: AGHT+IGj1uRjkxG+FV5WjycG0XJI9pmWuDAlxIOwFNFoM4jSpFSFb8mNeeM7/iNLVr5rfQAB/mcNDA==
X-Received: by 2002:a2e:9f46:0:b0:2df:b336:76e6 with SMTP id v6-20020a2e9f46000000b002dfb33676e6mr4355115ljk.5.1714403203714;
        Mon, 29 Apr 2024 08:06:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 09/11] riscv: hwprobe: export Zcmop ISA extension
Date: Mon, 29 Apr 2024 17:05:02 +0200
Message-ID: <20240429150553.625165-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zcmop ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index bf96b4e8ba3b..e3187659a077 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -212,6 +212,10 @@ The following keys are defined:
        ("Zcf doesn't exist on RV64 as it contains no instructions") of
        riscv-code-size-reduction.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
+       supported as defined in the RISC-V ISA manual starting from commit
+       c732a4f39a4 ("Zcmop is ratified/1.0").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index dd4ad77faf49..d97ac5436447 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -64,6 +64,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 38)
 #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 40)
+#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 41)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 2ffa0fe5101e..9457231bd1c0 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -114,6 +114,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZIMOP);
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
+		EXT_KEY(ZCMOP);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0


