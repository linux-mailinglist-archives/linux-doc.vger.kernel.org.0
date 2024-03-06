Return-Path: <linux-doc+bounces-11592-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F6873EF9
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 19:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0641F23156
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 18:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D1F149389;
	Wed,  6 Mar 2024 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpEpjEJg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2813F444
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749522; cv=none; b=D+vHayqPR3wbnma2LPqDIkygBdIYQEnZ+XgY/A1Vi1hfnAQgtBWZzRAv7nvRN34DEQfL+t65AXoRR4ru7/oKwsRFEBvI8fmE56+isUvvtruHly3+iKVbDAjlYpI+MVITlGdgpIKKsqVrw37FzxeaX4/bffAxhktzr3HqF/cXv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749522; c=relaxed/simple;
	bh=LlSWfVWs0H6gxkcBojSTETeqB1brvmDhPGR9FQrCvgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MB69hHEbT/UPYqI6H/x1q9n3uqeY7taPlT+OIIASDEX0L957ZKPQysH9OeXy2H2f0UGAXTM9uxWBCu2VurCMe13ihGHUdyktYF1RoxKsHa1nGIPATonNJJf5/gHJx9pkibbuI8qipMMm/9r5D+8+Aj81edA2MvVkZ4qI5h756HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TpEpjEJg; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607e56f7200so90137b3.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 10:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709749519; x=1710354319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEAYBW3Z4VXc6aDoxC6XGC2RO1GGkHEsC5P6UG5rRTs=;
        b=TpEpjEJgD3Fjfes9JtJ3a2p8sFEtpaSIYenTSxP8VicTHiripTgX7PTwb3Z9TQ52fC
         oO/h84WCoqkYOASjuFEZKQJ7NXr9DNIOHzoyjONuv94K0Vz8Ce8EhUQnkd8Af6RfvzMy
         13+FlN8FhPl2nU92uCTiSiRCfe53ppPOr1UM1gOEaFF5ndmjRjTxhfKie/eIVy0uxAT0
         WkW79bPHfDOcWs3FvDvKJza3KeX9JU3O4xyZ2Y9+FWOI6x/rdIoRb+RVho5Z5Zyh9K7O
         jy30HbTSq5auoUK3WxNq17VZtPxPU+NZx2EJpMCnsnP62KCO3zlLun7nAHk/h0dnLXeL
         zXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749519; x=1710354319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEAYBW3Z4VXc6aDoxC6XGC2RO1GGkHEsC5P6UG5rRTs=;
        b=swQ6rA1bEEZKZjnEdzuOQyOvIaQxjl5SZa9OBtDBkgNHvnFJoZ8VY4LdIBu4nM1hhi
         mJfAKOjQPJpoBHCjqhCdtiHncwBS4jBTaAq/CtpEH3qIl+86Vc2zs4LMgeqEg2nAzD7x
         gv23rw7phKiCfM15p5CvVqjy2AZNiCZXYA9grnH0NBY+0de3ZPcy/now+45qdy9AJgPE
         GM3qDABUa1wgc0NM6GqheKTECf1Jqz9eerIMybMtRI2zt1gVjZq3e5B1C7F7tYCZMqRb
         fa4Ab2IZYl0pD3/1JzooiKqczU4yXwmzk8x072rwt4BNnlYUAd4zfwn27tsMphv8t/AI
         cEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNxp7iQBOWNZVdUPHKiI/hC51sMNd4mOQCLl7+0BaKFt24W9LJlvt4/+6cx0D7Ka4iCmrWvmJhAPOIFjFLB+i1LrRwsRuPn4+L
X-Gm-Message-State: AOJu0Yw5y4Kp2FjOKe0dIAhgKS/jCQ029RNMopslO9IXNpBnpVKW4rKT
	5DfguGgmKT9HsJRRX0BG1oVpO27om9lvKYvzzpkueff2e5CRijDr8CIqSC6QuJ2GahLoyTRGO71
	PPA==
X-Google-Smtp-Source: AGHT+IGRA5aw0Cx2t1JPgn1w/V3cVE9EShRxIkrJJQcyCjV/1XkZdkPnLkct9rPYqab5CU3NhvDSCALRADo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:85f0:e3db:db05:85e2])
 (user=surenb job=sendgmr) by 2002:a81:9950:0:b0:609:4d6f:7c0b with SMTP id
 q77-20020a819950000000b006094d6f7c0bmr3566046ywg.4.1709749519078; Wed, 06 Mar
 2024 10:25:19 -0800 (PST)
Date: Wed,  6 Mar 2024 10:24:14 -0800
In-Reply-To: <20240306182440.2003814-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240306182440.2003814-17-surenb@google.com>
Subject: [PATCH v5 16/37] mm: percpu: increase PERCPU_MODULE_RESERVE to
 accommodate allocation tags
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
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As each allocation tag generates a per-cpu variable, more space is required
to store them. Increase PERCPU_MODULE_RESERVE to provide enough area. A
better long-term solution would be to allocate this memory dynamically.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>
---
 include/linux/percpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 8c677f185901..62b5eb45bd89 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -14,7 +14,11 @@
 
 /* enough to cover all DEFINE_PER_CPUs in modules */
 #ifdef CONFIG_MODULES
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+#define PERCPU_MODULE_RESERVE		(8 << 12)
+#else
 #define PERCPU_MODULE_RESERVE		(8 << 10)
+#endif
 #else
 #define PERCPU_MODULE_RESERVE		0
 #endif
-- 
2.44.0.278.ge034bb2e1d-goog


