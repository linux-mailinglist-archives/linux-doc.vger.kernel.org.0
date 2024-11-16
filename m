Return-Path: <linux-doc+bounces-30946-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFD9D0029
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2024 18:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A4FB24CE0
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2024 17:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDB8198841;
	Sat, 16 Nov 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="xSLgKRvq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B97193419
	for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731779970; cv=none; b=ihnSltqiYJIVLKgXjlZ/Lu/clw8Xg84kZqi/u62TmTvyH4F7JeTgCmNPR4LNmWRK4ybb+a7HS09vryjGFQHxR7nfl+u/P93YlchphdqcKlKm09rpAPYyX3WyI0qk+9sagWVyKppMuMmnImnBDNgXRSFJOc1f7rEhu2EMvFR4/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731779970; c=relaxed/simple;
	bh=lfJrkQU7kDKAcbgAg+MX5GusICFlw92JF3DwO3UuDT0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVy4HuJl1VAU+rwMd+IZ8SPYDiUqXnF4is7WqDiJMsVDid2kZnnvzet6eOXutyBdpg0Wj/9ud4+F99k2iPbLukqvGIkoGfF7AM9YrzODnk5rq8hKtGa1xGhCH4Trg6To82X68Va475N/ead7Mm71TpLvaljY0tT/tCsLe2l4Udg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=xSLgKRvq; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b15eadee87so132185585a.2
        for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 09:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1731779968; x=1732384768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+AdtzJV8StRb0yy8pEXghurQ0eEZGVtS6O69RbdSyA=;
        b=xSLgKRvq2J3aFK5p2JVdxbkHbQzrBADD+qUNuUzCr9f7Ryktdoi1aafaEp7jaaG1Ny
         uwFOpin86TL9/Yd052RzVYfnaJZ/IScJPIhV91qJ89ErkdcuoIiqjIYZSIzg6+jQ3DaN
         tD0QpS6Kq8l3ocpuZ/aid4OQ59jdZ0QNxCqXL91+gL9z8VvUVcccmvucwmqpYBqKsbrl
         qka94THxQJyK4RmOAULJ9vSPrSxgOF4XeFlSGU0/6Dnv8UVGYxHb9KVpRq2sjSP4fb/x
         ScN7lNwuBRug+LnMECmSD1M6HgOnrZIL327Vm9HdbBUuZrp+gn6soQvjPXZiSm2PmOnD
         Y69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731779968; x=1732384768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+AdtzJV8StRb0yy8pEXghurQ0eEZGVtS6O69RbdSyA=;
        b=aXdOOn+SK+JPQinUfKv9XsE0cgZ+9AUFwemy3VJD38P3A+Tx59fHGhSDEZpiJ/a/py
         IekRMKU5pjPrsPBLjPDD4USkG330IB0TrkcPLZaRlCy9xLz7uIiS0lQQDRu7mU4I0aF4
         Kkq9I449w2uwyVh0hkz1A/22jqGg2G+tUPR3+KDQC6OYHCe+VxHww3mdBek5cItu+kIV
         qORm4fIAOgmlJhjV+sypQ0RVozPUufZOt/YtKIG+FYujp9PbHR0jQYCwnEOzSgJTnS0N
         p6lUQIb3N8jNLihDv4b7JfZDD8SBB+cn1/ceWA1L94W7L4hSytNrWezw5XkflJJN6lgB
         J0aA==
X-Forwarded-Encrypted: i=1; AJvYcCWOUudDXL7vYJUL8NsunxXt1OPXmVhRhv5h0JmkLUcHvvzio+EKpRtsElcX8b4NwpSbcmSz5f6VG8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdOccjHuyWNX2PgdgoCih5zTVx9LShxyviZ1zXd8UQO/g1a+5
	Y2QM8jEjLep15JwIsf5gylI3PZPj30hBGVLP+BMYuQS+0SZbRVG8Akrtubm57CM=
X-Google-Smtp-Source: AGHT+IHID5UaFDu345/iXR65Tjm/g4UasFabizEe9rsgDtnAMppuhhS2EDxuUbmo+8naXZvVw6Ss7Q==
X-Received: by 2002:a05:620a:468d:b0:7b1:5504:2772 with SMTP id af79cd13be357-7b362378df6mr1035738885a.55.1731779967540;
        Sat, 16 Nov 2024 09:59:27 -0800 (PST)
Received: from soleen.c.googlers.com.com (51.57.86.34.bc.googleusercontent.com. [34.86.57.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35ca309d6sm280530085a.94.2024.11.16.09.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 09:59:26 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	derek.kiernan@amd.com,
	dragan.cvetic@amd.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	shuah@kernel.org,
	vegard.nossum@oracle.com,
	vattunuru@marvell.com,
	schalla@marvell.com,
	david@redhat.com,
	willy@infradead.org,
	osalvador@suse.de,
	usama.anjum@collabora.com,
	andrii@kernel.org,
	ryan.roberts@arm.com,
	peterx@redhat.com,
	oleg@redhat.com,
	tandersen@netflix.com,
	rientjes@google.com,
	gthelen@google.com
Subject: [RFCv1 1/6] mm: Make get_vma_name() function public
Date: Sat, 16 Nov 2024 17:59:17 +0000
Message-ID: <20241116175922.3265872-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
References: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Page Detective will be using get_vma_name() that is currently used by
fs/proc to show names of VMAs in /proc/<pid>/smaps for example.

Move this function to mm/vma.c, and make it accessible by modules.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 fs/proc/task_mmu.c | 61 ----------------------------------------------
 include/linux/fs.h |  3 +++
 mm/vma.c           | 60 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 61 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e52bd96137a6..b28c42b7a591 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -240,67 +240,6 @@ static int do_maps_open(struct inode *inode, struct file *file,
 				sizeof(struct proc_maps_private));
 }
 
-static void get_vma_name(struct vm_area_struct *vma,
-			 const struct path **path,
-			 const char **name,
-			 const char **name_fmt)
-{
-	struct anon_vma_name *anon_name = vma->vm_mm ? anon_vma_name(vma) : NULL;
-
-	*name = NULL;
-	*path = NULL;
-	*name_fmt = NULL;
-
-	/*
-	 * Print the dentry name for named mappings, and a
-	 * special [heap] marker for the heap:
-	 */
-	if (vma->vm_file) {
-		/*
-		 * If user named this anon shared memory via
-		 * prctl(PR_SET_VMA ..., use the provided name.
-		 */
-		if (anon_name) {
-			*name_fmt = "[anon_shmem:%s]";
-			*name = anon_name->name;
-		} else {
-			*path = file_user_path(vma->vm_file);
-		}
-		return;
-	}
-
-	if (vma->vm_ops && vma->vm_ops->name) {
-		*name = vma->vm_ops->name(vma);
-		if (*name)
-			return;
-	}
-
-	*name = arch_vma_name(vma);
-	if (*name)
-		return;
-
-	if (!vma->vm_mm) {
-		*name = "[vdso]";
-		return;
-	}
-
-	if (vma_is_initial_heap(vma)) {
-		*name = "[heap]";
-		return;
-	}
-
-	if (vma_is_initial_stack(vma)) {
-		*name = "[stack]";
-		return;
-	}
-
-	if (anon_name) {
-		*name_fmt = "[anon:%s]";
-		*name = anon_name->name;
-		return;
-	}
-}
-
 static void show_vma_header_prefix(struct seq_file *m,
 				   unsigned long start, unsigned long end,
 				   vm_flags_t flags, unsigned long long pgoff,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3559446279c1..a25b72397af5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3474,6 +3474,9 @@ void setattr_copy(struct mnt_idmap *, struct inode *inode,
 
 extern int file_update_time(struct file *file);
 
+void get_vma_name(struct vm_area_struct *vma, const struct path **path,
+		  const char **name, const char **name_fmt);
+
 static inline bool vma_is_dax(const struct vm_area_struct *vma)
 {
 	return vma->vm_file && IS_DAX(vma->vm_file->f_mapping->host);
diff --git a/mm/vma.c b/mm/vma.c
index 7621384d64cf..1bd589fbc3c7 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2069,3 +2069,63 @@ void mm_drop_all_locks(struct mm_struct *mm)
 
 	mutex_unlock(&mm_all_locks_mutex);
 }
+
+void get_vma_name(struct vm_area_struct *vma, const struct path **path,
+		  const char **name, const char **name_fmt)
+{
+	struct anon_vma_name *anon_name = vma->vm_mm ? anon_vma_name(vma) : NULL;
+
+	*name = NULL;
+	*path = NULL;
+	*name_fmt = NULL;
+
+	/*
+	 * Print the dentry name for named mappings, and a
+	 * special [heap] marker for the heap:
+	 */
+	if (vma->vm_file) {
+		/*
+		 * If user named this anon shared memory via
+		 * prctl(PR_SET_VMA ..., use the provided name.
+		 */
+		if (anon_name) {
+			*name_fmt = "[anon_shmem:%s]";
+			*name = anon_name->name;
+		} else {
+			*path = file_user_path(vma->vm_file);
+		}
+		return;
+	}
+
+	if (vma->vm_ops && vma->vm_ops->name) {
+		*name = vma->vm_ops->name(vma);
+		if (*name)
+			return;
+	}
+
+	*name = arch_vma_name(vma);
+	if (*name)
+		return;
+
+	if (!vma->vm_mm) {
+		*name = "[vdso]";
+		return;
+	}
+
+	if (vma_is_initial_heap(vma)) {
+		*name = "[heap]";
+		return;
+	}
+
+	if (vma_is_initial_stack(vma)) {
+		*name = "[stack]";
+		return;
+	}
+
+	if (anon_name) {
+		*name_fmt = "[anon:%s]";
+		*name = anon_name->name;
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(get_vma_name);
-- 
2.47.0.338.g60cca15819-goog


