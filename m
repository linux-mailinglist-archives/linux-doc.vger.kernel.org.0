Return-Path: <linux-doc+bounces-12459-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8C885DBA
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 17:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D181C21CED
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 16:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AF113175A;
	Thu, 21 Mar 2024 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d0bY2HKR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9379D2
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039038; cv=none; b=iPEYoA0+Trwlb3QWMa6dIexW37ISQX+OteoTxUoY63+EN9CtejvlptZtxkA1khcNgqOY/0Xssn+GNoCblNVrUGW7hULGTtEIjDFX8LnTK9TDIEcpIFqlmqImCow+2c210Y7NllxkIncCbX5+yXojxtQSj5jCfH8IoXem+Ahtc4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039038; c=relaxed/simple;
	bh=ujv687cLORDitvw7vHh+8KR/OEd7UGM3fYQWSn6DLm0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EcI7QN3lTqdx5iM8W1m4Dh9RuQTyZSovk/d2DJGNh+VBWVOP2I5ERtZe96otU/1WZgVAtSOoaz6bFbrmuSJiCShdjk0oZ9xKEO0AooSNxHUSRqq3ciw+srLr5bQvoI2du5nU9rRgoLvq8NWAhxg9KmVaS6fFaMSGCcXK3icnf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d0bY2HKR; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dd169dd4183so1349664276.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039035; x=1711643835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfR76FD4Au5CxbM75qQNdquNFQiSYxURTySBYiFO3v0=;
        b=d0bY2HKRwMQ6iOOraByItj4i3HpiobctbBSidyp//ZkmEq7Ow7CThy8DYJ/zTMBf0N
         pMzoetg5bmIHHVSepQ1o8g5epKmeqZkZKhGmqm7nOESGkRsSH7ZwxrlUkEtAhz421FpV
         lIpmCEIgmmK8BPeBg+sni6JZaIBOTjTf6qHJ7hmFpnuLQej/xqUyNOMD2skDonLafaSU
         wuvBs+z3GO8gpGh/39Y+BDAxt4r5oPe051BR4gqfKtMotjy0v6dTsJ+Lbru6QEyUFSqH
         lhrejiHaOSHcRNd0LlP4MGzh7JzKEx+kWDcli5NitFw5HyRzuo6LszcwfFa1CKpGS8Nv
         c7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039035; x=1711643835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfR76FD4Au5CxbM75qQNdquNFQiSYxURTySBYiFO3v0=;
        b=Al7fKZcfpNVnum1x9r1O/w/T7lhOuEkNhY7xb8MNADrEFfz/gT1LoLCeZSd/fIoXPA
         zRTo9tpYnoJSqw9fKVkzbH/s2DZutZyEq2tBJoW8HkYOR40it377PqmWZL2wrvDqHytx
         9epOZnQhiygv3NExKlniWi5QEcLkfXzbSwFkGnV4wkuHjvwa5+dK7Y50qPJsFnfMzMnO
         I3qfxZzrzeoyqE3NHqNWwWTk0CJKS0+m776DE72hsXZLJC4wNG3Hatrwy5xpM3cnKRD0
         QtMYZJEwAjIHPD9+Z0dKiJLTR6nxLOI43DZDMC6W5EwFHtu5XW/hoUgUY6QeqLK7PTwp
         d8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+3XwkCRajk7198bkHTam0YZEKxsA1OezbGKnrXTmXEENLVlxwwDvZjHjtrz+ky7AP033BiBD1zH2oxATjREMPuar07T9oby6
X-Gm-Message-State: AOJu0Yz7akpQQKaBO/lwnHlPGdBKjhf18p9T/9u82GH9H00NKQ+bvyAP
	TfryDKicTd+AG3bd6FeNlftWfES0PVfTf6HUhgPB0TE4t8aYWT6XOOg5iyKcTiMRIFIEIwVJd+U
	dLQ==
X-Google-Smtp-Source: AGHT+IFhiFlsQoZCLjLg/oNv4a6rqVLDOqKxMR6InuX/fTP6XDr/Ywkc4XNBxFj0+HwVU6WiRQiaVUB3f4E=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:6902:102a:b0:dc7:4af0:8c6c with SMTP id
 x10-20020a056902102a00b00dc74af08c6cmr1219995ybt.6.1711039034585; Thu, 21 Mar
 2024 09:37:14 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:24 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-3-surenb@google.com>
Subject: [PATCH v6 02/37] asm-generic/io.h: Kill vmalloc.h dependency
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

Needed to avoid a new circular dependency with the memory allocation
profiling series.

Naturally, a whole bunch of files needed to include vmalloc.h that were
previously getting it implicitly.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/asm-generic/io.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index bac63e874c7b..c27313414a82 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -991,7 +991,6 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
 
 #ifdef __KERNEL__
 
-#include <linux/vmalloc.h>
 #define __io_virt(x) ((void __force *)(x))
 
 /*
-- 
2.44.0.291.gc1ea87d7ee-goog


