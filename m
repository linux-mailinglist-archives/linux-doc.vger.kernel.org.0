Return-Path: <linux-doc+bounces-43405-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2BA91037
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 02:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3560C1902B2A
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 00:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ED980C02;
	Thu, 17 Apr 2025 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6fYYt11"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FA81C831A
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849232; cv=none; b=lQtCsbM2ijiSj0uB7vSO8Czs+Iju5HaH/SX+31/Al8OUomSVRnkWwN+tqsVqXOerVG1LAuiW4l5JgC0fD8D/rSRmsNpKYWdVYVoKmW5JQw8oEq15oM6xYTIqTXii1RGYqHpC3hNx9PNr2F1538lItO1nyutREl1iQpaUffOkbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849232; c=relaxed/simple;
	bh=al6SKl71NAiNJnVYkq84dOJI0VdWszLtxLtJW6ZOVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOUSBnBMkFDPjxBV8qx38LEy3TnfwHu2B8eAIedAyo2nfnR8GiRatxN9Vsarhq2Sby85v6SsJkh4cmXcMDDJ25fCjR9DbWuhPgZTPv6dmYxnJvcy4mImArZ1vRym8TJ0r5gucAPCzrSsjohDaA7TWh0EIb3M9t6+gnK3qpP7+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6fYYt11; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744849229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n76Fvpmfa8LN30y0qvCHdYcw71Um4Eimev9X0oBxqU=;
	b=Q6fYYt116Tt9kQY3VgppBWCF0+UL19gozyUOtbSoawlczvY1zdoCd3P4LeEQunusCvEC/W
	huB0N3vbtgjGvmfrQOin8y7asi6ILGS+frHJPwxqoJ5vsRyylJhxWEEdzWHNJaNUDTZ1l3
	zSuFjhO0uwsGanm5aXXeu5JoGAM8DVc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-CvnZAHuzPYSmoVkEBRTivg-1; Wed,
 16 Apr 2025 20:20:22 -0400
X-MC-Unique: CvnZAHuzPYSmoVkEBRTivg-1
X-Mimecast-MFC-AGG-ID: CvnZAHuzPYSmoVkEBRTivg_1744849219
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A02A1800264;
	Thu, 17 Apr 2025 00:20:18 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.34])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3796119560A3;
	Thu, 17 Apr 2025 00:20:08 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	shuah@kernel.org,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	tiwai@suse.de,
	will@kernel.org,
	dave.hansen@linux.intel.com,
	jack@suse.cz,
	cl@gentwo.org,
	jglisse@google.com,
	surenb@google.com,
	zokeefe@google.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v4 4/4] selftests: mm: add defer to thp setting parser
Date: Wed, 16 Apr 2025 18:18:46 -0600
Message-ID: <20250417001846.81480-5-npache@redhat.com>
In-Reply-To: <20250417001846.81480-1-npache@redhat.com>
References: <20250417001846.81480-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

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


