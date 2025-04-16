Return-Path: <linux-doc+bounces-43100-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B878EA88F0E
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 00:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E3517C253
	for <lists+linux-doc@lfdr.de>; Mon, 14 Apr 2025 22:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150451F4E39;
	Mon, 14 Apr 2025 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5MhssM9"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B21F3BB4
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669577; cv=none; b=AzepPQMs2XDd6p8SDIHIneLxILO1UfE404G58uFqkSFq6M1wFLwy9+Z7108uKwUHxzAPyi26be08EyqInSk+uCfRf/K/euJ0AcNtzGSkKosn1yTitAkVdWTEqkiXvvzuZB/uLaNBiDWQM2jxMpGUFnO/guv9IEFo5v85c8cR2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669577; c=relaxed/simple;
	bh=al6SKl71NAiNJnVYkq84dOJI0VdWszLtxLtJW6ZOVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/RaHt1ZOzC/6nnzrPDz88vJ1G7D4crB1JOKIa6K2hzcw83NdFXN7vh10McUWUsx4i96kFF+0uhvHG4zoLjuqraG3H5HIUhnbEkqL0BRVgWYGtW+/g2rbnboXmlSm0Wo/InCFq2vYaOQY926eNKrC8MImqh8TNcIUT25jXIQDA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5MhssM9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744669574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n76Fvpmfa8LN30y0qvCHdYcw71Um4Eimev9X0oBxqU=;
	b=R5MhssM9dNe7VRqvPvxGPRgBDylIagF+0fAwB+xv9zmBcj+rK2x0zIg89gmBlz6hV29b5o
	qsi1ZCY+BabV1vBzYVHsemMqY2Gm3V0DPkuV9ROVN4cZETnFQ9WkwjXNKFkyzM27FAMemC
	FAnA9SJ1mxV7ROLtwNPcrGuriJT8GQQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-XdkNGvy2OZa1MtxhAwhYsA-1; Mon,
 14 Apr 2025 18:26:11 -0400
X-MC-Unique: XdkNGvy2OZa1MtxhAwhYsA-1
X-Mimecast-MFC-AGG-ID: XdkNGvy2OZa1MtxhAwhYsA_1744669567
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D0AE1800262;
	Mon, 14 Apr 2025 22:26:07 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.64.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6EB1B180B486;
	Mon, 14 Apr 2025 22:25:58 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	shuah@kernel.org,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	ioworker0@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	dev.jain@arm.com,
	mhocko@suse.com,
	rientjes@google.com,
	hannes@cmpxchg.org,
	zokeefe@google.com,
	surenb@google.com,
	jglisse@google.com,
	cl@gentwo.org,
	jack@suse.cz,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	tiwai@suse.de,
	catalin.marinas@arm.com,
	anshuman.khandual@arm.com,
	raquini@redhat.com,
	aarcange@redhat.com,
	kirill.shutemov@linux.intel.com,
	yang@os.amperecomputing.com,
	thomas.hellstrom@linux.intel.com,
	vishal.moola@gmail.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	rostedt@goodmis.org
Subject: [PATCH v3 4/4] selftests: mm: add defer to thp setting parser
Date: Mon, 14 Apr 2025 16:24:56 -0600
Message-ID: <20250414222456.43212-5-npache@redhat.com>
In-Reply-To: <20250414222456.43212-1-npache@redhat.com>
References: <20250414222456.43212-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

add the defer setting to the selftests library for reading thp settings.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 tools/testing/selftests/mm/thp_settings.c | 1 +
 tools/testing/selftests/mm/thp_settings.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/thp_settings.c b/tools/testing/selftests/mm/thp_settings.c
index ad872af1c81a..b2f9f62b302a 100644
--- a/tools/testing/selftests/mm/thp_settings.c
+++ b/tools/testing/selftests/mm/thp_settings.c
@@ -20,6 +20,7 @@ static const char * const thp_enabled_strings[] = {
 	"always",
 	"inherit",
 	"madvise",
+	"defer",
 	NULL
 };
 
diff --git a/tools/testing/selftests/mm/thp_settings.h b/tools/testing/selftests/mm/thp_settings.h
index fc131d23d593..0d52e6d4f754 100644
--- a/tools/testing/selftests/mm/thp_settings.h
+++ b/tools/testing/selftests/mm/thp_settings.h
@@ -11,6 +11,7 @@ enum thp_enabled {
 	THP_ALWAYS,
 	THP_INHERIT,
 	THP_MADVISE,
+	THP_DEFER,
 };
 
 enum thp_defrag {
-- 
2.48.1


