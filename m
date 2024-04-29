Return-Path: <linux-doc+bounces-15389-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4AA8B623D
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 21:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7901C214F3
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 19:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6D313C8EA;
	Mon, 29 Apr 2024 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muMTMhtf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5213C813;
	Mon, 29 Apr 2024 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714419141; cv=none; b=AQWTyrnVFkZ/xQXlFou8YQGG8ND+kQ0AVMOCOMCXIcLr3Ak3PSyNURQnuYw4m7biZCLXDNMDObXEPe4FHE+HIxUwEoI5YH9BdpObKyPNj/19gx2E8mDKkI99g0GdNx32rtPrT/6tEVx1xGgsPy+7G3LAEbUUX508HmLt/cYQfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714419141; c=relaxed/simple;
	bh=HILElGy3dX6ViGqysP17OsH7059275+UI6KzYtcuDas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fn6jJz3RgJdj5lAHU+4RIkVGCAKGu63URIb66eTPbE3XjQqWV1E0pUALoMVYOFG9+ME6GQXFFMUBR1pJzMyuH8XCYkzt2y1LhsnUrKMs0aEpNW+uQVsOOCLAXohjkcP/JWh7S9Yap9Ls7XDGbBMru4I0RCXEh5F6sF2Cnmrx3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muMTMhtf; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7decd9851dfso75298039f.3;
        Mon, 29 Apr 2024 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714419139; x=1715023939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5erFtirukIPS7+/t99RsC/o5NEAtx20M1EMAagy+Jqc=;
        b=muMTMhtf+MptRyDfq25G2GQaaoTilsxx15P/sGc5vxhh4v/WOfzxukmriuyzjp/8+1
         QEQEsGH366Hcc/VxhsSklnsZx14S+bFilL0nxLBUcI1Y4HGl1fKitlJ/V2jIEDY+Uksw
         X43nrWMNv0FerpqBrqPYfO/4lYYmNyOFd+JB4rF71hDtW+0a9m9GGvx95kliNcTXAmEL
         gTifEUQrQr2warVpuvK62+OGxicf9Qr5DRmm8QKbLMFTI0EoDT3URyYsSwgpwPO5+zQ+
         +KnQa/trKYW9E76NoQEe/W8pHa7JMXn2m6UZKoV8XvrW+UKk8N4TGgqCfJsVjA7Mva5i
         GPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714419139; x=1715023939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5erFtirukIPS7+/t99RsC/o5NEAtx20M1EMAagy+Jqc=;
        b=CQFzreogT39GDXSLRADeJx0dr8X7jWa3T+udn9czKS2XzDpDEFTROGaIef10PlE+6q
         bPyfBqRYZFETKjn6J9ebZu5AqIoC5vWjl+OQ5l6ARmVzCCLF8ijYmg5hv8UGyARGTmkn
         ebVPbSMBs+uImcmgova3O/B7Z4M0oMAZG1kLDNXhG6ippcoCAtt7JprUMxrM3JGCGDKN
         Wdu8S3Pq0VHP49C7oE6eVyIoFz+cm6Yp7lsrjQdR+Ps0Bs3CME9vGizwO4xeSIicnLfo
         hfOjjw8/AJ0Q1ONS8893lHO+xyFMuEueNDwuMS7BMwj4SDssqtyAApB5zlYfF5eAnunW
         6+KA==
X-Forwarded-Encrypted: i=1; AJvYcCXH4RwUw0EenqPNWptFJEY9fimq1unekyqvISVquTpJ+aYmWUAQ6J9dyFPmsYbq7A+tD7Izcgj84Uin+UMi1Vsl+82+3VPmsi6JX48Q1lMJUiDoeej/jS9LyuNqGkD6Lx2txdzAq9IR
X-Gm-Message-State: AOJu0YwlBBGpnA6tpliZd81xOR7EQW6Lgclrim3G+4AZDgYo+Y9bDV9O
	W7bpxuAt+qIsqd7nL73EBe0pf0GRCBU+D9Lkpe1pg1C0T4CJpFmp4K6/G/Tl
X-Google-Smtp-Source: AGHT+IE1hJs6/UMqwqBgZk9MYdYeJRUGVcL1rEGzqSP6T+l7YpeIIvc6JR8VsErUMtkXKbO6iqFGyQ==
X-Received: by 2002:a05:6602:1cd0:b0:7de:6439:ede4 with SMTP id hg16-20020a0566021cd000b007de6439ede4mr11935591iob.9.1714419139031;
        Mon, 29 Apr 2024 12:32:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 12:32:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org,
	linux-doc@vger.kernel.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 06/35] dyndbg: replace classmap list with a vector
Date: Mon, 29 Apr 2024 13:31:16 -0600
Message-ID: <20240429193145.66543-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classmaps are stored in an elf section/array, but are individually
list-linked onto dyndbg's per-module ddebug_table for operation.

This is unnecessary; even when ddebug_attach_classmap() is handling
the builtin section (with classmaps for multiple builtin modules), its
contents are ordered, so a module's possibly multiple classmaps will
be consecutive in the section, and could be treated as a vector/block,
since both start-addy and subrange length are in the ddebug_info arg.

IOW, this treats classmaps similarly to _ddebugs, which are already
kept as vector-refs (address+len).

So this changes:

struct ddebug_class_map drops list-head link.

struct ddebug_table drops the list-head maps, and gets: classes &
num_classes for the start-addy and num_classes, placed to improve
struct packing.

The loading: in ddebug_attach_module_classes(), replace the
for-the-modname list-add loop, with a forloop that finds the module's
subrange (start,length) of matching classmaps within the possibly
builtin classmaps vector, and saves those to the ddebug_table.

The reading/using: change list-foreach loops in ddebug_class_name() &
ddebug_find_valid_class() to walk the array from start to length.

Also:
Move #define __outvar up, above an added use in a fn-prototype.
Simplify ddebug_attach_module_classes args, ref has both addy,len.

no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 61 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 5231aaf361c4..b53217e4b711 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 152b04c05981..46e4cdd8e6be 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -147,13 +148,15 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+#define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							__outvar int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -1114,9 +1116,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1200,30 +1203,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1256,10 +1260,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1372,8 +1375,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.44.0


