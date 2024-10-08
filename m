Return-Path: <linux-doc+bounces-26836-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDD995A78
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 00:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABB90B23E98
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 22:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DB521D19F;
	Tue,  8 Oct 2024 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iWcgFe+P"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33021D189
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427103; cv=none; b=L/sgdsgHWhvNj8zNtKJby8/XhHjuMdbS4AZC7uP0V9hY4qFHuv4ED+aVr665VqzrEhK0cJGVgDHDbbGNSiHyFzRBwH8/txRH/nfZSdQIswjpKmlCiLHOa/q3m1EzRv6xB+1xgRoRAY+XzD5bZJSzTvVbVd74RYMRc3yUVOL38uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427103; c=relaxed/simple;
	bh=0P0H7tyzucv3KISYxlKm6qbY67oBbop+zQ8AHryx3GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4pOthceRCg11T1qYiJIBt+KZiUs1ApsmBTPXqOaJyF7AzeiNFsnsmqvM4WB6MEgDWB9lOWSzV2S1d0LeCywDmeQtahJaNNygRxriy6pXsz4UuM75vLY+w2xiyk/5WvdjYjMDkxRcBh9OAsKUp3jf7VRQieGDXRuUIXJOjzi1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iWcgFe+P; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db54269325so5062754a12.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427101; x=1729031901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=iWcgFe+PFuQUaYTwFFmlQXJIKom/Qzi8mxyZ9Ika4HvFywQw0287w1Zn1rDCedw+/u
         t/WLfd/l2wFeyFrytpPMOptmWn93Ue13X1Em+iVyhJGU03Mc8hMq/hUgdJhW/jQ0e2dF
         rUvoPbPh0bB1gUAy6yNhz7suDQ4wv1y9lbKWferDFRvhnv+bzX6KXHI0gUiXRWvkF0zd
         hqsoQvbZnpQ0gw0OcWpTxmSVWi/nX/DjPnp4SgTmHSi76GPrkWFQ7QgdbCJJHBBPhYTW
         z+WvSJdl8DxMgFIW4+tB6mNDQLMHsz2xhRDmEuQVyK2FunegtcsWk19P3keB/l8bmZ2D
         AoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427101; x=1729031901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=A4JooBhg+UVw0uRJzftO9mAv+pNbTU0arwWf5TPZNZkx7PWb2K4H3eQgGFi8maEtBN
         +kJPB1XEUrUNTcb/SZgRhQ7JTY25eySwiqAx9BRaT6lTiyP3KKVH78UzKsbq6he8GPSB
         YDn2JPFxucl8b6mAGL5z7hob4Kz1TUUy2AiyBXCJF+dxo6db177kyNwV+BE2TEdPGpOE
         ivZ6viXKypAHTfQSNVAv3hZ3hToKSkPE5qI0pXDmmqJwCMZ6yXfLMayxhTiiNb34+Tay
         rPdmV78lUfiFyS3eVz2fwQo7zT7xtd2wtKMr6ZmVb/UjWIASdy3rNDc3ZQLiIjaXupMS
         XihQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzxoV6leWK4OlD/hn5QMDdp+W4DX9coRERwwse3NSK5jfd6V36OJG/q2AQSsUpAdor91fA7LBVqLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtmNdnn019YEQc9XPPs9Ls//Q5/Zov9qa1gKFrx+mUAz9+609
	muKdzD2/Hmite825913gB6p0Gutdxpn3eWZdzo2WmrRk7CTptM7IhUzMfcpMcZI=
X-Google-Smtp-Source: AGHT+IHvesfHqSkO6ZkkqxS8iUZFbPtASty24Hzhh3e/eaCzge7K6ZuvofdLUxv7u/b5HvamsjHRPQ==
X-Received: by 2002:a05:6a21:6f83:b0:1d0:7df8:2484 with SMTP id adf61e73a8af0-1d8a3cd928amr676575637.43.1728427101109;
        Tue, 08 Oct 2024 15:38:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:54 -0700
Subject: [PATCH v6 12/33] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-v5_user_cfi_series-v6-12-60d9fe073f37@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4948a1f18ae8..2c6edc8d04a3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -738,6 +743,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.45.0


