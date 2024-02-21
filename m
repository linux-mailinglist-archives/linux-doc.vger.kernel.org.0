Return-Path: <linux-doc+bounces-10252-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78E85E787
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 20:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163801C22030
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 19:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10108126F01;
	Wed, 21 Feb 2024 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lsy4Y1o/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0686658
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544464; cv=none; b=ax39YalfZ9R8VywQnr2TDlPfrawqMUulgNxReb2NbYl9EROBINB6jgmtErXukM0AyEXqroGAvOU9rpxOaQbNlOVEgYf/pycHo7dfwWB2rHqRHo3URYH3H2/yqR2ygI3DwhGWhI0QPlqi8/r2uMRKPWFW78IacpUR6CmaFPIDR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544464; c=relaxed/simple;
	bh=XvI76MSJf6n8ycfULIR+dpUzLDxxCd04CalcxvixqtQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XDIdNDGgDsg36FxFnL7nJ9EOyBn4L59YpTQTUB04OLF8wDRW960s4zyFqrBkJlOe+dwWVHnu4t2DgGUekm+7/pQaEIDYOfHPvMuvMQcn/z1nqgoV6ppcTm1H01DrtnlLQU+LE7SRwO2OnbJfUy4GbLQRLoYBugAYhZTglYdcUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lsy4Y1o/; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dced704f17cso3553635276.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 11:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544461; x=1709149261; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOix7cIZ9OpjtRmnOCb5oo8qhMGRBISTNpiHk2ice5Y=;
        b=Lsy4Y1o/cScEtlw+tphqx2teWGVdZTJvgOXQPbI1Y58lqPV7JelW3Z3i1qznu1dmJR
         CKcj0msql37fyX2oCVKqTQtBglvo+ePh761e2E5bkVDds+vWiyCiQ8nQKNx/0QkfpcfW
         bsO+pvW+RWBLd7z7TSagQKq+rkVY9GbiDqSXqtF1MAW9wlglo4hgc9fQ0MBdRoUDFQpC
         BgR18foC4w2y29Prp09CW6J612QcKNwE9rZDNDvsPvHgL+IQq4ktKrpW3Fv2I3ydiAHc
         kTjzs7kR1O63Ua7R5yUaJAy05OJdRDe0Fl2ylvvudFbfclVFq4fShUsZThe4OhzJvlf8
         YCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544461; x=1709149261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOix7cIZ9OpjtRmnOCb5oo8qhMGRBISTNpiHk2ice5Y=;
        b=L8gzuyN5HnfB6YE5ry7EoCZ9xaIMFE95XgQ38AJOrpicm7wmfxA2WBxWX1iChV0bPA
         p+eK/V0SRzcuu8hxq2/rzqnHbtRHDE61Buazfy6GU/hTnxfsd1n2EVu3ZwJux7un3luV
         HfUHUPLFUnWJybhlMopzr83a4Q/qIIvhQDSCQlDbkZ6/1jnPL4RCCIV1gipQK0dUL41S
         sQ9WNTkzLakGRZ6sz/Fdv6BNejKdk+IV0ztH5IyZsy9UEJFoGIaf94dqHEgWEur7ybK/
         5jeQL2bSB5ESrflDrVSvkPDumicmyBbdfa0KCdpy48EEd4ZdMdtxx21CU5LHvjstq0QX
         bOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU6VTz7pjkiUVnM9tbU/Sy5fZgpXsM++6dgRjG7oyoIgz4sO6AXXDTAfFBcxBp4h9O585ov8s9DX0+KxE3bEW4QkU8Xq9JcpaI
X-Gm-Message-State: AOJu0Yx9Mcgtv9Q8wlLvH+ZDmxttZvWkL1xA/Kli/48Mey6jJIY9w4Do
	ZvdiFY4/u3q7L+DX17YkH41AQCSTULHQSXvmkgzboSkyuOdKlh0avTJ51DVyEF4QAHHth0V0ND4
	GwQ==
X-Google-Smtp-Source: AGHT+IFQED8r11XAmHCvTPIM6osrIYpquXv216eXmkF7EFZy4gkeT8fImMy3GTq6A3JUXD3VP8Bk7+J6aLM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:6902:120b:b0:dbe:d0a9:2be8 with SMTP id
 s11-20020a056902120b00b00dbed0a92be8mr7992ybu.0.1708544460699; Wed, 21 Feb
 2024 11:41:00 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:15 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-3-surenb@google.com>
Subject: [PATCH v4 02/36] asm-generic/io.h: Kill vmalloc.h dependency
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
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
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
2.44.0.rc0.258.g7320e95886-goog


