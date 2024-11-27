Return-Path: <linux-doc+bounces-31627-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608D9DA0D0
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 03:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F2228355D
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 02:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8E413B2A2;
	Wed, 27 Nov 2024 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f9gVc5sq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA483A17
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 02:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732676270; cv=none; b=JVYloHUx8uUJGX5F94AWAYEFFTrPzpMjqvpjIJZZAqfqUKO1DnJdRd9BlWS6WXYXe1l3QtgirWXvnlV1H7g/g2dByXwiYJjnCJC8UraaSdENbSJ9McDD/5fZK6tEbjLxP9jl/W2ewHLdCt80w7KHWdXR/aqcsYYgJytLAilA0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732676270; c=relaxed/simple;
	bh=pbmlAw5d8Q76I+IH5titDbf93REWo1/52ltjkxYYe3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HWcDNJWGt1Ug2UisM/mNdbx6WOOCOmNE3sW6RaDclXcfZ92MPVzLKMKegC/9Ugf06n+RoTWPyCv9qVJDBwWdJwNKKqCkoXHfG7AGGzC8L6wvc1FqqQ7vt9ArQXaBirWvx4ZL8ktDxHdiIZ+BCCXX5/epkj7qoKHdNKp26k6HeZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuanchu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f9gVc5sq; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuanchu.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-297066ae069so6878986fac.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732676266; x=1733281066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lhbaogLbZu3E/Vkjc13k2hWVq6P2Y+49H1lvwk45sc=;
        b=f9gVc5sqUEreqguxX3ksnzwfYvtaK9pE+xp9qNW2fGIz2GeB7Ppy8ztBHCdqbj/Bax
         EIImt7picS6AM6Omt7auWhydDE3UqDf4t41Wem3VUQLXDVx64UcROd1gxZXG4CYEV+g/
         f1FBBGqqBuXzDmQL+CQDs1NjEK1For6waavZ6kQ9wkvvUBg2aWrsVWG7v/CpqS7D9x1i
         17OObvbc8uVG+vqnE/2PRZ+IYZAXXOVkhWpD3mp8k60ul+FHljkK51Q8DySBtmHIZtmZ
         0tgA1Uyeo9TLcOLMVkKAGz9YHqt9fg7Jby7R3x1diIB3qnEmK7GedtX8sxORYRQx081N
         v8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676267; x=1733281067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lhbaogLbZu3E/Vkjc13k2hWVq6P2Y+49H1lvwk45sc=;
        b=VECBSYi+HTJ6NMW1X7oHxeXBMspNmIMw0KgmJRhZQSCtDWyz5gplVp+hNQxFA8SXyH
         l2Xu9MHmarQ80N8SSBf586xGU6zJVquI91V2QHlIS/1M40bg7EeAdXt9hFcVyNJUuFa6
         h1TBgoiqNKh0uTYdLxWFbzvaXMOTVstwvRDojo2MXz/02LygGad98y5IsJ6DyqHn51GO
         M1ZjI+eFbeskIE5bC41OeMgXf6HbYqG664fJonBxVpRnei73qS7xQuynFAS7XeigLeRz
         QCzLjw8Ppb5Z9lzMCjIX69AMwDqR3Bg3HlDjzewuDfqtCUEY575ns4bzIgeZRI4wf7TM
         NZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXxIweXltwFCikdX7m7oFqSsxZn+MCkNFRNPtu8pfDcqgSoqt3m5MOw9/x2ls8aD9RHCyWfs5H2D2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ilu/lU80yPYTV5UOOBJnkGmqipaG8H6wH8ZjyCsnQ1xvdVE2
	62hoh16bZ6KkVFusLf6Zu84n3dRTJPHQSEPtHOPP5qabx/+YTu79vRB82bnMcK6Hg3f49L/hO8w
	L+mQdVg==
X-Google-Smtp-Source: AGHT+IEx9U6wR1hCMpTboiP7q8J5ECqe/TnGoNjy6O4ISdQoe4PI0qJfC/k0oduc+Ab8ibmO8UdzD0uyW92D
X-Received: from oabqq6.prod.google.com ([2002:a05:6870:ef06:b0:296:e2da:79c8])
 (user=yuanchu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:a002:b0:296:a7c7:6a08
 with SMTP id 586e51a60fabf-29dc4012ca6mr1026883fac.15.1732676266733; Tue, 26
 Nov 2024 18:57:46 -0800 (PST)
Date: Tue, 26 Nov 2024 18:57:21 -0800
In-Reply-To: <20241127025728.3689245-1-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241127025728.3689245-1-yuanchu@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241127025728.3689245-3-yuanchu@google.com>
Subject: [PATCH v4 2/9] mm: use refresh interval to rate-limit workingset
 report aggregation
From: Yuanchu Xie <yuanchu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Khalid Aziz <khalid.aziz@oracle.com>, 
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Gregory Price <gregory.price@memverge.com>, 
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, Yuanchu Xie <yuanchu@google.com>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The refresh interval is a rate limiting factor to workingset page age
histogram reads. When a workingset report is generated, the oldest
timestamp of all the lruvecs is stored as the timestamp of the report.
The same report will be read until the report expires beyond the refresh
interval, at which point a new report is generated.

Sysfs interface
/sys/devices/system/node/nodeX/workingset_report/refresh_interval
	time in milliseconds specifying how long the report is valid for

Signed-off-by: Yuanchu Xie <yuanchu@google.com>
---
 include/linux/workingset_report.h |   1 +
 mm/workingset_report.c            | 101 ++++++++++++++++++++++++------
 2 files changed, 83 insertions(+), 19 deletions(-)

diff --git a/include/linux/workingset_report.h b/include/linux/workingset_report.h
index d7c2ee14ec87..8bae6a600410 100644
--- a/include/linux/workingset_report.h
+++ b/include/linux/workingset_report.h
@@ -37,6 +37,7 @@ struct wsr_page_age_histo {
 };
 
 struct wsr_state {
+	unsigned long refresh_interval;
 	/* breakdown of workingset by page age */
 	struct mutex page_age_lock;
 	struct wsr_page_age_histo *page_age;
diff --git a/mm/workingset_report.c b/mm/workingset_report.c
index a4dcf62fcd96..8678536ccfc7 100644
--- a/mm/workingset_report.c
+++ b/mm/workingset_report.c
@@ -174,9 +174,11 @@ static void collect_page_age_type(const struct lru_gen_folio *lrugen,
  * Assume the heuristic that pages are in the MGLRU generation
  * through uniform accesses, so we can aggregate them
  * proportionally into bins.
+ *
+ * Returns the timestamp of the youngest gen in this lruvec.
  */
-static void collect_page_age(struct wsr_page_age_histo *page_age,
-			     const struct lruvec *lruvec)
+static unsigned long collect_page_age(struct wsr_page_age_histo *page_age,
+				      const struct lruvec *lruvec)
 {
 	int type;
 	const struct lru_gen_folio *lrugen = &lruvec->lrugen;
@@ -191,11 +193,14 @@ static void collect_page_age(struct wsr_page_age_histo *page_age,
 	for (type = 0; type < ANON_AND_FILE; type++)
 		collect_page_age_type(lrugen, bin, max_seq, min_seq[type],
 				      curr_timestamp, type);
+
+	return READ_ONCE(lruvec->lrugen.timestamps[lru_gen_from_seq(max_seq)]);
 }
 
 /* First step: hierarchically scan child memcgs. */
 static void refresh_scan(struct wsr_state *wsr, struct mem_cgroup *root,
-			 struct pglist_data *pgdat)
+			 struct pglist_data *pgdat,
+			 unsigned long refresh_interval)
 {
 	struct mem_cgroup *memcg;
 	unsigned int flags;
@@ -208,12 +213,15 @@ static void refresh_scan(struct wsr_state *wsr, struct mem_cgroup *root,
 	do {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
+		int gen = lru_gen_from_seq(max_seq);
+		unsigned long birth = READ_ONCE(lruvec->lrugen.timestamps[gen]);
 
 		/*
 		 * setting can_swap=true and force_scan=true ensures
 		 * proper workingset stats when the system cannot swap.
 		 */
-		try_to_inc_max_seq(lruvec, max_seq, true, true);
+		if (time_is_before_jiffies(birth + refresh_interval))
+			try_to_inc_max_seq(lruvec, max_seq, true, true);
 		cond_resched();
 	} while ((memcg = mem_cgroup_iter(root, memcg, NULL)));
 
@@ -228,6 +236,7 @@ static void refresh_aggregate(struct wsr_page_age_histo *page_age,
 {
 	struct mem_cgroup *memcg;
 	struct wsr_report_bin *bin;
+	unsigned long oldest_lruvec_time = jiffies;
 
 	for (bin = page_age->bins;
 	     bin->idle_age != WORKINGSET_INTERVAL_MAX; bin++) {
@@ -241,11 +250,15 @@ static void refresh_aggregate(struct wsr_page_age_histo *page_age,
 	memcg = mem_cgroup_iter(root, NULL, NULL);
 	do {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
+		unsigned long lruvec_time =
+			collect_page_age(page_age, lruvec);
+
+		if (time_before(lruvec_time, oldest_lruvec_time))
+			oldest_lruvec_time = lruvec_time;
 
-		collect_page_age(page_age, lruvec);
 		cond_resched();
 	} while ((memcg = mem_cgroup_iter(root, memcg, NULL)));
-	WRITE_ONCE(page_age->timestamp, jiffies);
+	WRITE_ONCE(page_age->timestamp, oldest_lruvec_time);
 }
 
 static void copy_node_bins(struct pglist_data *pgdat,
@@ -270,17 +283,25 @@ bool wsr_refresh_report(struct wsr_state *wsr, struct mem_cgroup *root,
 			struct pglist_data *pgdat)
 {
 	struct wsr_page_age_histo *page_age;
+	unsigned long refresh_interval = READ_ONCE(wsr->refresh_interval);
 
 	if (!READ_ONCE(wsr->page_age))
 		return false;
 
-	refresh_scan(wsr, root, pgdat);
+	if (!refresh_interval)
+		return false;
+
 	mutex_lock(&wsr->page_age_lock);
 	page_age = READ_ONCE(wsr->page_age);
-	if (page_age) {
-		copy_node_bins(pgdat, page_age);
-		refresh_aggregate(page_age, root, pgdat);
-	}
+	if (!page_age)
+		goto unlock;
+	if (page_age->timestamp &&
+	    time_is_after_jiffies(page_age->timestamp + refresh_interval))
+		goto unlock;
+	refresh_scan(wsr, root, pgdat, refresh_interval);
+	copy_node_bins(pgdat, page_age);
+	refresh_aggregate(page_age, root, pgdat);
+unlock:
 	mutex_unlock(&wsr->page_age_lock);
 	return !!page_age;
 }
@@ -299,6 +320,52 @@ static struct wsr_state *kobj_to_wsr(struct kobject *kobj)
 	return &mem_cgroup_lruvec(NULL, kobj_to_pgdat(kobj))->wsr;
 }
 
+static ssize_t refresh_interval_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct wsr_state *wsr = kobj_to_wsr(kobj);
+	unsigned int interval = READ_ONCE(wsr->refresh_interval);
+
+	return sysfs_emit(buf, "%u\n", jiffies_to_msecs(interval));
+}
+
+static ssize_t refresh_interval_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t len)
+{
+	unsigned int interval;
+	int err;
+	struct wsr_state *wsr = kobj_to_wsr(kobj);
+
+	err = kstrtouint(buf, 0, &interval);
+	if (err)
+		return err;
+
+	mutex_lock(&wsr->page_age_lock);
+	if (interval && !wsr->page_age) {
+		struct wsr_page_age_histo *page_age =
+			kzalloc(sizeof(struct wsr_page_age_histo), GFP_KERNEL);
+
+		if (!page_age) {
+			err = -ENOMEM;
+			goto unlock;
+		}
+		wsr->page_age = page_age;
+	}
+	if (!interval && wsr->page_age) {
+		kfree(wsr->page_age);
+		wsr->page_age = NULL;
+	}
+
+	WRITE_ONCE(wsr->refresh_interval, msecs_to_jiffies(interval));
+unlock:
+	mutex_unlock(&wsr->page_age_lock);
+	return err ?: len;
+}
+
+static struct kobj_attribute refresh_interval_attr =
+	__ATTR_RW(refresh_interval);
+
 static ssize_t page_age_intervals_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -382,13 +449,6 @@ static ssize_t page_age_show(struct kobject *kobj, struct kobj_attribute *attr,
 	int ret = 0;
 	struct wsr_state *wsr = kobj_to_wsr(kobj);
 
-
-	mutex_lock(&wsr->page_age_lock);
-	if (!wsr->page_age)
-		wsr->page_age =
-			kzalloc(sizeof(struct wsr_page_age_histo), GFP_KERNEL);
-	mutex_unlock(&wsr->page_age_lock);
-
 	wsr_refresh_report(wsr, NULL, kobj_to_pgdat(kobj));
 
 	mutex_lock(&wsr->page_age_lock);
@@ -414,7 +474,10 @@ static ssize_t page_age_show(struct kobject *kobj, struct kobj_attribute *attr,
 static struct kobj_attribute page_age_attr = __ATTR_RO(page_age);
 
 static struct attribute *workingset_report_attrs[] = {
-	&page_age_intervals_attr.attr, &page_age_attr.attr, NULL
+	&refresh_interval_attr.attr,
+	&page_age_intervals_attr.attr,
+	&page_age_attr.attr,
+	NULL
 };
 
 static const struct attribute_group workingset_report_attr_group = {
-- 
2.47.0.338.g60cca15819-goog


