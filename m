Return-Path: <linux-doc+bounces-26831-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F7995A56
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 00:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558201F21415
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 22:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D9021B434;
	Tue,  8 Oct 2024 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="e39AwVES"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C19219CB4
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427089; cv=none; b=sgju4uDDUvBfHKp4/+cR67UwrHvZc/vPBk9oIua4pll5fQCnVm1GgAeIsqRPsr+gJBQJKqzOGsicRwsSM4U8MdDXGXjWz1UvSQ8t6tkJPfQJHPYzoRjY9BcukGYdNTjuUzKfS/PkfG81ICC/68S/v0fKTPU4PXHis9S0ctIwmVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427089; c=relaxed/simple;
	bh=9D3t/x5ldu0vCmZ6SpOxBl6mFpP5YEsCpnxU+0fCsAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozo9IEH5rqWe4m3ldNUD3Bjwyh5FDY0a2NDSM93/C7wUhLgH3moVdGm7gKHpKc9QAuztjaIQVytSKvIOf3nW5TApbn5HpH81k+4LUqGTDkQDtiIEF6zwd0jXEbih6BPxAh6eVMh7TfX0qw18N7GLoJl6jvh94v8OWsNF/zL6m/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=e39AwVES; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e029efecdso2302026b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427087; x=1729031887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=e39AwVESK0nRXmKo7dseflU1P267DtFRKx6DIl5E/bzTt+EjaLEomyAAv6uiJR/dr5
         1TOW5QmUNAbukdAY6oDjYBJ40hzZePYr/iAMrh125IinLdb5XuiD1T2Lkpa4qjY8BWLH
         3wcvKjEP/0pTJXAkrCamChLYqxrfyvJnn4m6+daEMb6t3ecRCqUqiQjinrkBi/6zfkA4
         LOs2ytmnrgszlWjXoJOT/5IvLT54LppbKFcWZ9knv7oFtQLmbcOEMi4aZs1Lqdg5uKmB
         JsXb/tb+1dVVHAPznMM4PUj5Dmu9XRwcS8KzwwLaLf9nq+oFlJsvloGZpcuExY7uaeR2
         zq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427087; x=1729031887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=XEBFxT6IKiBxDQRN8Z/nK66kTA1TcV00EcGFePT7POn9UkPrZVerrQ7mhZ+z1n8Sre
         513OhmOHFdx2NiSMWgY23b5B/1IeJEth8Ep1FHDtsHjRsnEyMWOPl5VXi6ypJBbhiSw/
         Yh9UtS3sluqkiGlw9meXPOp5fOCP9ym4+J4k1g1DV7O5mAja6B3YqraPFi46c/I5JUCW
         a08fSQ70i+lr6asxj1hWRw5E8raw0DjHBdXJ3G64a0LSPH5bHpEOcj+Abl5Jn12K+RD1
         tE+F3I5QWerrzS1LsQoBJuSr3SF4iJNh55egSSvHGZGBFuRtUY0hm7gQJUVQCOBp7iTT
         Jn7A==
X-Forwarded-Encrypted: i=1; AJvYcCVN5B2w6gLSaBjFQiJn0NQ49QYVZWR/EQDmEYgjVebRn7Hdt5iuctV2yOa9twtFrEUJHe+eONYTGmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXB98CMIv36mN1WZuTAHMaSvQiuJU8b1UjJSa205g361hw1/L
	SPu4LDbgDMLQZLnNGaPj6LN7MPdWjOneW0NmV/GJRm6FOkzT79YTRhf0U/v024E=
X-Google-Smtp-Source: AGHT+IFTRRphTHkXxNtHYde9BX+luSQbkm62edHJi19X7C1fs0jGU+IiZUI2T3klTsFQ7+LS2WdKDA==
X-Received: by 2002:a05:6a00:3d51:b0:71e:f7d:5c64 with SMTP id d2e1a72fcca58-71e1db648bamr555718b3a.6.1728427086877;
        Tue, 08 Oct 2024 15:38:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:49 -0700
Subject: [PATCH v6 07/33] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-v5_user_cfi_series-v6-7-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..356c60fd6cc8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -368,6 +368,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.45.0


