Return-Path: <linux-doc+bounces-62068-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5B0BA7AB4
	for <lists+linux-doc@lfdr.de>; Mon, 29 Sep 2025 03:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A16B3B889B
	for <lists+linux-doc@lfdr.de>; Mon, 29 Sep 2025 01:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E10A21ABD7;
	Mon, 29 Sep 2025 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gQBi0rde"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B91F5827
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107823; cv=none; b=rWw3K0UPTXyHIC+FHfTEalJh+YAWo6z6C0ohuEECqIAEFfpgEn0lQA+mrrwB+Budlwyk7OhzW6Bg8nNgD/w2jw9LELzcuMwc4NAetlmYJhbI7GSCbpil+fku1LjXIm3Ce2zUAnYHA/g4YQWSzx8Ub6noOx4iC/ky0SWXoKiQPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107823; c=relaxed/simple;
	bh=H863SX6t2g0rcimmk1vD/Y1fEaIHCkBYP8Gf6AaW1Ug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odQESn//UAlXo4g9bz1DHvzEy1cGCK3k4f9RmGfkr5rrmZfxNnsqYr6fKPrDsvK9unAHQBkZ351ToNUccWqvqt6Bl6T8I1DxH9MLMJELxT11jlL84YPe7MteTGGVhjEtV0uYlHhi6J9TyJukjofDzYL18V/GbFGcTZeMaC/Wy94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gQBi0rde; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b109c6b9fcso39354251cf.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Sep 2025 18:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759107819; x=1759712619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seHRxlr9qoYmGWxME4ah/Rh2okXUsVbz/ndLeC4LCP8=;
        b=gQBi0rdeGswziM8BkntC20uIOSiGooee+q/B2q41M6BgoZqgGeP5Bv8MuJEEWEkBUP
         +ZlZbzmEr4DRc+6zcNJezEjKAPSmoJRJzY/dRqGal2hAQjzTp+0G7hPw28GxMf9S5eiT
         kBioqI4KApASRB1+H4OudFm8ghWw4zPrbE9lHh1ZH2QSAQIJgsVriCjcp3y0rL8Sj2Gf
         p17+6MivXXOaxB8FxwvJJwHCkSWAhlVN9wcUg1cAun9FY0yON7xeTnJE2ZJxBU/raEZ/
         F0Qq0uii5j4tPPWUADLs6IyfkBjRIrTrG5WrxYxQLH5aoLutzCpUFKSpMEmxHkHKZkam
         TuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759107819; x=1759712619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seHRxlr9qoYmGWxME4ah/Rh2okXUsVbz/ndLeC4LCP8=;
        b=COXI7VacDfYvA7HGiAnwdIs2m00lKm1FBJ4+JWVWyJLX9HePjXFV57cUxADzOBXqzW
         i1Hh122tzW3BpXKhBFFAqluZUJYyGpnikX+EZ/UFJ1kVHpEsnY79vZIUoaiBRKjqvhZA
         3wKgEmeLgGiWrhv7Ig2vdr9T354SdE9ER8GqSs8YxrXhtW9nM3ddVvyLpgaLINqqoLVJ
         bNlbgfKy9/2REVx7SY89oDeK+/K3WIn4Zj/tFaOaxNnIqePRm63MWVb5qfGmTcEgnhfp
         pYoD07PRIxc14q7xFD2MyGmipHi9aaZY7zDna2ZDeaRi6s08ne95QsTv0+DG4MhiZIP4
         EKrg==
X-Forwarded-Encrypted: i=1; AJvYcCWlYj2mVbvN3UzXRAQlUUYOCeL5dgrGKJ+OLwp9sQEs3zmyvuyuggxqzrZALlnWyFtV9mhu0xuBE4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbW7HOojCfjFByM08lv/FPuIWjCJdZqJolwqFFNz0kG/s1EA7a
	pTBsc4omvcddbbfelANH0r2QelWUF/gRV87ezGevRHv5HHnWVak6M7jsk46qhCsxkGU=
X-Gm-Gg: ASbGncs6O5NYHyRQG+kN15Il7qs2hpEgZgqHgre+DbusJSJKlNBlyAElqZhmzKTB+mx
	JB3DuSBZaBbBU8/4c4CfM8vV1ZQm3ruYtwIvtS9bDuuu33mp5oOaT54zzM6ukAaCUmLXyBWVu2T
	nizgvFFaesk6jsg9evx+J/4v98FNGrxTva7sxWQR8R2Hevq4xA4W3Cz5oa50QsSVd9OKLEEsRpj
	0n9pmX5YNNYqa7axmiTQB3HCMP1N1/AdFaZuS7GbmzU+G+MG+ClOAJTrn7CtX708GV7NSvXsljf
	YG81YDWI2gpUPA/mP45lyVQXJ1YBeux+VvKkBRSW8RqPXZ+KgezK0pQX3aC2NXPDJigwqMPJA53
	D7V7G9CNnTFC1q9zKJS5J9mychHKEmYMw4xXfHhEXUnE3wndw+8IHX9Yd3rM+wVji2hhrw9N2UT
	0p4Zfx4GI=
X-Google-Smtp-Source: AGHT+IGWluQyWGzOMAK6ELVmstmCfELrwzvUE/VJRxrRrDSk2QQU4Sd30xTz+Cb2R/+uvVNJIiSTzA==
X-Received: by 2002:a05:622a:4012:b0:4b3:4f82:2b2a with SMTP id d75a77b69052e-4da4744e220mr214493921cf.4.1759107818629;
        Sun, 28 Sep 2025 18:03:38 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0c0fbe63sm64561521cf.23.2025.09.28.18.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 18:03:38 -0700 (PDT)
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
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org,
	steven.sistare@oracle.com
Subject: [PATCH v4 05/30] kho: don't unpreserve memory during abort
Date: Mon, 29 Sep 2025 01:02:56 +0000
Message-ID: <20250929010321.3462457-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
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
index 26e035eb1314..61b31cfc75f2 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -1083,31 +1083,12 @@ EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
 
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
2.51.0.536.g15c5d4f767-goog


