Return-Path: <linux-doc+bounces-2998-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BB7F6CD0
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 08:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2401C20952
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 07:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7505239;
	Fri, 24 Nov 2023 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.b="Yew/O0nZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EA7D71
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 23:22:10 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a02d12a2444so225704466b.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810529; x=1701415329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVy1jdSL9+WHb2B8ZDIGvqsG60+7Fk4VQGEPcFy9390=;
        b=Yew/O0nZQu1+ENYZupynxv33c1867rS6fNsRVVDzeVZPSKafHxCnE0vdmJulRQe170
         n6XMoSDzqDBCn49k2M3GQYAOQpQTa7SxID8U5LF6R1pcmnX5bwkNmP6NkG/GZ3KYtU9V
         JlRZ/0pzAdeeDhGzOYNJMYTwaxVcufsfT3Hrh8MvBFbe2vmoKgxzwT86qlL23YVcvDdh
         jthS0Sm9FZd+I/fjD0O1QMdmPT5Mx3fMJRlxXmWjuLFUfwQf024PUDYxYHcNyL8IL319
         CU+Gd+oo9IwszBozidFOloxNwIpP2jBUtwN16gwoBOdknnNFqRupZj50Ua5LYOP+nEAn
         IZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810529; x=1701415329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVy1jdSL9+WHb2B8ZDIGvqsG60+7Fk4VQGEPcFy9390=;
        b=Jfe2ITNyyKENAgHQMNJtpRSh2ESktJBHZs//kSeu404TlCY+Qv9wskmj4i87IwyGq1
         eFHStAf1Q9p4nyDQRN5Ny26YascprgEBOwOd3peH+QcPaWkffFfD0Erh9HfWj1PaquUG
         Vp+tPChDR0Ks7546MaBRXGZM8n1UhH0oS8v/Nk2jLWqdx1cm601f9crmNLJ9IqFbciZW
         d7Rj3EZYAhnTjWkY79r2TIvyGk8c7+vWj2GE/arDcTHnaSBMtfpEM7TxlL7RX6e/4WUR
         JS/OgiPeDr5JhZ2wvx/fVphd2sDYhG+Z9pF2UZ7tI+u9dCm2o8I48naeqlYZiClzjLuK
         slCw==
X-Gm-Message-State: AOJu0YwmL9XIiLSF6WmlsLmcdoOgPH3B0goJEpo3lz435wJA0QfJhllb
	kTpgg8EXGzQ5fwfqQBCKGdEWXg==
X-Google-Smtp-Source: AGHT+IEBJIwqDHkFD4oZPvK9TF0KkUAPOFtohVZ/l5fTiA2CidjiZcnxjtG0jzodZ6Xfjt7CfSnlmA==
X-Received: by 2002:a17:906:20d7:b0:9be:40ba:5f1 with SMTP id c23-20020a17090620d700b009be40ba05f1mr1349531ejc.60.1700810528651;
        Thu, 23 Nov 2023 23:22:08 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:07 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 2/5] RISC-V: Expose Ssdtso via hwprobe API
Date: Fri, 24 Nov 2023 08:21:39 +0100
Message-ID: <20231124072142.2786653-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds Ssdtso to the list of extensions which
are announced to user-space using te hwprobe API.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7b2384de471f..8de3349e0ca2 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -80,6 +80,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Ssdtso extension is supported, as
+       in version v1.0-draft2 of the corresponding extension.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b659ffcfcdb4..ed450c64e6b2 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -30,6 +30,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
 #define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
+#define		RISCV_HWPROBE_EXT_SSDTSO	(1 << 7)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index c712037dbe10..c654f43b9699 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -162,6 +162,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZBB);
 		EXT_KEY(ZBS);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(SSDTSO);
 #undef EXT_KEY
 	}
 
-- 
2.41.0


