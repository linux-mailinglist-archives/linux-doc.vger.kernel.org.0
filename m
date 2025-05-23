Return-Path: <linux-doc+bounces-47285-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECADAC20D5
	for <lists+linux-doc@lfdr.de>; Fri, 23 May 2025 12:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDFBF7B2E53
	for <lists+linux-doc@lfdr.de>; Fri, 23 May 2025 10:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F7228CB0;
	Fri, 23 May 2025 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LrY0UPrw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA7227E82
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995668; cv=none; b=fdEGIqrYqvzFpVpWAnRDU8RWmPby7niOeGqjwU+gKbHE+xFvPEs4fBzZAs4MGGGCZrLxm7P6lRjjAu6yLpQeZ7DXsiYkuoy2yE9eqXxuY+4bWOFg4nzrSERXJNI0PWbjiWklnGnV6gwTXtxC7WD555tGSeHiHKJdlYYawkM0o6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995668; c=relaxed/simple;
	bh=oe9YzhrIkRFjcEpmOMMHuXd74hPefU7Jr+/Rq21d1Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZnmMGkLaU53NcHYHzFAVYk0IPMsOrv4+AJ2MZTqaX21U2xOJ1gnTCjKSVUpVsl8YgCST2ZsmYIUy4P9GbcEXElqKlbmfCTzY5RdL9VH6SkPTXG3aXUK+kJVJ+sxC1uuwvPMyNGwrXlUAXXlYmM5myylymF4agocoonTX+klm8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LrY0UPrw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73972a54919so8183121b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995666; x=1748600466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=LrY0UPrwtPLDvA/J0bNSHVUhjnjXI87L9g+VicF/2ooa8r4qxkG2rS0RtcGx3XtAjX
         arVUs5Hn34FfLre91Dzm2glIlhUF10YBfzMAWNy3/tcTHyOmtwekfZScEW6z44IxLoEP
         Y2MnpHkNaP/cZw3qfGYVkIPiRprKZV+zLBZeedx6edDOgZPSr78Paqql6Ti/KOlu5IhZ
         zebUoIkPjnDUWitowJOADZMC+3XZPDi5cR+hELnkn7x1iKV48Gwv9uiNDEipbpckx2Zm
         tZEXNRu/tys0DoWEj77XfLqUfpauQyEia14K/53F8TtSZBbjRCVENg4FmbF+0m+GbnaK
         8IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995666; x=1748600466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=NXYj9DngiJly7ItkNTHsxyMGwWzcBX/G5TY/bjikvVzWxqgFM0DsFHxpvri2Cltu7S
         IH7uui8SdvAxRIHFU9vEnN38elGdEP2aO0cmnR4mkidfMNs9nFEbxySIhyi3U3kP3QS+
         WfJwwxYx68V2JnuD67BQjjmpMTc2zs8S+T3VshAkJJsSOLk1ZKLQikfzNqTe6GnBHg93
         0TB3LBGsvCSustwE3hsbB5fu1LHvM/a5SzKEFjVfT6oL1rDFtuF4PnBjveLr6wh5vUD1
         gD74SCAGMd8XX92V0VbsPlMlwDkc2jZZ0l+H5f4JcxxZ7gRqP0NEdxF/SlhAGqC3S8x9
         tVSw==
X-Forwarded-Encrypted: i=1; AJvYcCVoRqLOJLjC+6YbKMYQO6fGvCJlkmWSsjxRdsFTbakS3GH+tKy4NfSv7IsEI9GkyAOioJsEuhjfQL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1rBsSRYhEq9U/P7e08AquKZMfSKQRVEZC5fHGrXzmcXY6kvx
	JhaP5+iuu5LSwmbhWrbYnLXfgcJAJ8KZhvFFaoTl2iaYEMhl3DeLrFNLodr3mBWhm9w=
X-Gm-Gg: ASbGnctdNWefujbWeLF2A/ZzLBmCeE8AvcbIkAfGYhtXmo/Ou65cBBLj8+apo+b3nwI
	F3EP0X40zW+FhP2Iftyaa7R8z5H5gGpUvSrLIXrrvVohl8gh0UJw8oQhAA5vWC/om3JgDtKJEc5
	C+51yTHTp80Jhgsv40YY0Tcg9u3zlvm7sTJByRKIFFjs65btdQBA7af/1K7BCjTALLxAG3fdE37
	APaTezbS7NHxvKg+7KY2pJ+FqZe85NRS21blU2cS6yTxwfXuyMJXWcMrI/MqvnKdtREQDIbql+M
	2b6I4Umfzwp4rXzOfIYHonloc/qKfJQv3fBjVnZI/Jpns6bPG9et8uhcHb5MyQE=
X-Google-Smtp-Source: AGHT+IFXhCgkcbKavnE2xTp9i4da6iauW69FEMu71goEiqhGLYMQSQQ3w6lKP9OCGbZDB/3Z0XQGgA==
X-Received: by 2002:a05:6a00:130e:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-745ed847e76mr3749012b3a.3.1747995666204;
        Fri, 23 May 2025 03:21:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 02/14] riscv: sbi: remove useless parenthesis
Date: Fri, 23 May 2025 12:19:19 +0200
Message-ID: <20250523101932.1594077-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few parenthesis in check for SBI version/extension were useless,
remove them.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1989b8cade1b..1d44c35305a9 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -609,7 +609,7 @@ void __init sbi_init(void)
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
-		if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
+		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
 			pm_power_off = sbi_srst_power_off;
@@ -617,8 +617,8 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
-		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
-		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
-- 
2.49.0


