Return-Path: <linux-doc+bounces-20411-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A5392D833
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 20:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561621C21066
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 18:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4FC19755E;
	Wed, 10 Jul 2024 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUPGm9CO"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4939196D98
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 18:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720635868; cv=none; b=rDyDYSElkUZi98p5QO7yfv2lyrFWtmB/c2i65oq6Q+sAHs1/RCgvwV6WHbV9kPO4u1AOfAQcikFmzkH3yjHqdPTpb35JYQZOppc/sGAaWqWFWOrpd4FKUl1cpTBwrgbaVZenZUjZ20z3fGHXnR7VP0mmc9TbsNrTVHkfT4Td8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720635868; c=relaxed/simple;
	bh=AETsSnDpHW0rvrdsfVW1TbQUcAttwVMIlwJoMTZSyhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvGBb5MTx3Pm+xRbvnP8uKw9JtHZqnPkiqi/TfxLY4uQGw6BXFaxsqjAHF8XXDv2FwJ5lkgexTggjz8HpugoUaBsNpwyWzHyZ8byUU9iD9xBoGZhxWdzNuDvNk2rat0YxP0r1GGh049mmPTU37bDoE1PizXhTtDzwh0zF+Kr6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUPGm9CO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720635865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NLGoGphSBAILQzYvM/Tq8pyV9mpMtgWBXJd0JQBEpY=;
	b=MUPGm9CO0sJKS70rBTWDFCQyjyw6yGgAN/JcgC6JUaF0dGcsxJlWcJTybZWCASCHLFU8aq
	sVELEKOHacfGpEPQSoxFK/7com5yBa3pCZtleHWu6hUqj5faE+c2TT/aED26rjtMSw/9HL
	RCmp3CAj30zUp1WMQpYUrpH6oW+/mOE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-AMtS6vVYMsSi2MDTB748_A-1; Wed,
 10 Jul 2024 14:24:19 -0400
X-MC-Unique: AMtS6vVYMsSi2MDTB748_A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9AD3B1955E9A;
	Wed, 10 Jul 2024 18:24:17 +0000 (UTC)
Received: from llong.com (unknown [10.22.48.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD49C1955F40;
	Wed, 10 Jul 2024 18:24:14 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamalesh Babulal <kamalesh.babulal@oracle.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 2/2] cgroup: Limit frequency of reading cgroup.stat for unprivileged users
Date: Wed, 10 Jul 2024 14:23:53 -0400
Message-Id: <20240710182353.2312025-2-longman@redhat.com>
In-Reply-To: <20240710182353.2312025-1-longman@redhat.com>
References: <20240710182353.2312025-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Since cgroup_mutex is being acquired when reading from a world readable
cgroup.stat control file, it is possible that repeated reading of
cgroup.stat may be used as a denial of service (DoS) attack vector
by unprivileged users to greatly hinder cgroup related operations in
a system.

To prevent this, we are limiting the reading of cgroup.stat file from
unprivileged users to at most 8 times per second.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cgroup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 18c982a06446..56ac9f14d100 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3668,12 +3668,22 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
 
 static int cgroup_stat_show(struct seq_file *seq, void *v)
 {
+	static unsigned long unpriv_timestamp;
 	struct cgroup *cgroup = seq_css(seq)->cgroup;
 	struct cgroup_subsys_state *css;
 	int ssid;
 
+	/*
+	 * Unprivileged users can only read cgroup.stat up to 8 times
+	 * per second to avoid potential DoS attack.
+	 */
+	if (!capable(CAP_SYS_ADMIN) &&
+	    time_before(jiffies, unpriv_timestamp + (HZ >> 3)))
+		msleep(HZ >> 3);
+
 	/* cgroup_mutex required for for_each_css() */
 	cgroup_lock();
+	unpriv_timestamp = jiffies;
 	seq_printf(seq, "nr_descendants %d\n",
 		   cgroup->nr_descendants);
 	seq_printf(seq, "nr_dying_descendants %d\n",
-- 
2.39.3


