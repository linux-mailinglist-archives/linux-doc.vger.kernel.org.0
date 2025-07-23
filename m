Return-Path: <linux-doc+bounces-53964-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB4B0F5D9
	for <lists+linux-doc@lfdr.de>; Wed, 23 Jul 2025 16:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E861E7B71E9
	for <lists+linux-doc@lfdr.de>; Wed, 23 Jul 2025 14:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F612FA634;
	Wed, 23 Jul 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="YYcyprev"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD22FA63F
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282036; cv=none; b=WmKhvGdVFoVent1jlHJjT4+oa14rBYzdVI5/syT4lpz5+/KAy1DWrUvFYbPU9xpCdkjr12Wmh8IGt8U6UpeDAa05U3EiYUA4iJaUdDrrjBfH05AJpWu6d5veXV3MlwotOMBGKw5ErSaf7wTe7nCcQjfw6ClIW7lxKYdZA8Id6kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282036; c=relaxed/simple;
	bh=bjMsn0d+DdHq5tKORAnt+APd2ow312ZieXyXxxJ1EAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjalcmRrCvqmRNst48kDbUQYfb79lB7H2ZBYCwZFNz5knuzNKWkYVenn7nWgNW+7aOQJIlAmT3afOky1at8ojs40YcjcXxMYDqqUZHSwa4nBTcxz6A1o7VJZyXU79jjg1jgn19+rMi+hsUtgd8sBHcNPbtkTNdKLjyY0rYY4xL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=YYcyprev; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e818a572828so4629960276.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282031; x=1753886831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrgbtdA3RdwzYLcpgmSOZtyyO0wlzXdBbkaeyV0ZrEA=;
        b=YYcyprevxnCTmOixqqXr0d0w+E5s0nacz+jBpdJYKq5vD8DBF+iD0jDNrxvUK4GBdj
         E9hFw2AL/N97+sHtKgmWbxH+I9LEXxcPRvqGJ/qBFUW9qJr1SgC6hep1fRvLNyPoWH4e
         q0HEm/CLU48eT6ECu2ZFjj30PQvcd5tBiuImceL7YnQ16Bwkpyo+nQ2uAHSt5lJKddKg
         XIJurFPyNr+LZOLswiqxm4/6KTEnXXHnjzPSJST94ihrIGjAolTTysgZDjDEIvXCDYC+
         ge5Ar/LhWdLH7dU7rBGZT8vlR5sce3mgZNeFB4GFr70I+c59+HPtI85u+gL6aPmJEd/a
         W3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282031; x=1753886831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrgbtdA3RdwzYLcpgmSOZtyyO0wlzXdBbkaeyV0ZrEA=;
        b=xD4u7eSAJswlqXY145+RDGHOSvtqHFG9TwEJTmM5scQJWZuc8afZL3vz++/sRDVWpK
         L0fjUVEnSG2XuuRt8z/BV2C+N0wmz6B28c5ZBuvo2F3cRDvGbesXT3Uby/vdZSoCN5y9
         RLYQSBKnvYuL8v1nt+vu/7IrtuYbD4MZ4FBFPA0UjUhtyN1+n/ItIzXTSSud2hpFmmNQ
         t0D+WfiVmtKcNUIAVgMay2DAexQIJhPjmpFfhYQQSDycCIqWQgFUsFm3VYeyqgSKnx1x
         /ZVqQIDgNiVBdZmRDFh3qfqMi153n4D5CCQDWDTDVI5re6jqALsoF0iwPIFDIR0KFQD9
         7yZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWxbBzYkoChdlSXN7LrhreuP/YO053vVh1htvNBr4OUa1HD1C66B1qtA2fmrO848wULPAOVDdhgfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sSQonskXN/QOz+RhszMXI916C7ZAp2ncuAUKbcxO/kxufAgC
	bedUJwBWw22X/72+xyzYMy8BpaeMfV6ubZPgIEzdZ6cK/4TI8bKJwZpyZnWwAptNeUU=
X-Gm-Gg: ASbGncuJvlWR3MATBu3bDU0YPHhxIMvBa3n588Ir8Sy7jNQlgWDOcR79D1BYhlrLCNy
	Dsjoycs48T3WRY9PfLMEjPpMNHCt5ISS4KlR4gWZnd37Tj42wNYDtnR62PP00rSjXfoo7u3/39Z
	9dlk0i6tq2fCjHh30sABy6L117B7eoK/M4rFgVZa1nyPc3KwiUdGZ9F3/rKJUx9qobX6c6jbnwy
	VZ+Z6Vo3qnY1UMw8s4b65i39LiWxyXJfyjssqWtcEqt5nepvWvkaMFZnd0PgY6xbnbXotmdUxZy
	OnWpwWkdStDSBlGHIQEraK2noeACRfNSXU2SETddEkjahFVnhzQ4FPmq56LkotSMFt4spwHPxlC
	UQqsZ1NOxctXybFCV652xIrQrvc0ep68GAwkWOmXPE1c9aHc3julVKPni8Oe8XOBcdjR650pHp5
	P+Skb0cQAjXS8xfw==
X-Google-Smtp-Source: AGHT+IEtHo37LGPot/hXX3d5/RxjiZTetvWjVt3dWuTs4pORFq/5bZ2tCgRCgkPbneoKEGKAmSRK9g==
X-Received: by 2002:a05:690c:f8e:b0:718:3b9f:f1f0 with SMTP id 00721157ae682-719b42e0146mr44064387b3.26.1753282030545;
        Wed, 23 Jul 2025 07:47:10 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:09 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v2 08/32] kho: don't unpreserve memory during abort
Date: Wed, 23 Jul 2025 14:46:21 +0000
Message-ID: <20250723144649.1696299-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO allows clients to preserve memory regions at any point before the
KHO state is finalized. The finalization process itself involves KHO
performing its own actions, such as serializing the overall
preserved memory map.

If this finalization process is aborted, the current implementation
destroys KHO's internal memory tracking structures
(`kho_out.ser.track.orders`). This behavior effectively unpreserves
all memory from KHO's perspective, regardless of whether those
preservations were made by clients before the finalization attempt
or by KHO itself during finalization.

This premature unpreservation is incorrect. An abort of the
finalization process should only undo actions taken by KHO as part of
that specific finalization attempt. Individual memory regions
preserved by clients prior to finalization should remain preserved,
as their lifecycle is managed by the clients themselves. These
clients might still need to call kho_unpreserve_folio() or
kho_unpreserve_phys() based on their own logic, even after a KHO
finalization attempt is aborted.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 26ad926912a7..7908886170f0 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -778,31 +778,12 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
 
 static int __kho_abort(void)
 {
-	int err = 0;
-	unsigned long order;
-	struct kho_mem_phys *physxa;
-
-	xa_for_each(&kho_out.track.orders, order, physxa) {
-		struct kho_mem_phys_bits *bits;
-		unsigned long phys;
-
-		xa_for_each(&physxa->phys_bits, phys, bits)
-			kfree(bits);
-
-		xa_destroy(&physxa->phys_bits);
-		kfree(physxa);
-	}
-	xa_destroy(&kho_out.track.orders);
-
 	if (kho_out.preserved_mem_map) {
 		kho_mem_ser_free(kho_out.preserved_mem_map);
 		kho_out.preserved_mem_map = NULL;
 	}
 
-	if (err)
-		pr_err("Failed to abort KHO finalization: %d\n", err);
-
-	return err;
+	return 0;
 }
 
 int kho_abort(void)
-- 
2.50.0.727.gbf7dc18ff4-goog


