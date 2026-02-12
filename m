Return-Path: <linux-doc+bounces-75914-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D/wJQrNjWn87AAAu9opvQ
	(envelope-from <linux-doc+bounces-75914-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 13:52:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA312D94D
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 13:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4323B304BC09
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 12:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1168A35B136;
	Thu, 12 Feb 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyMH74qq"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86435B151
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900609; cv=none; b=Jdua6VW+f0IMQyrj7qSx9sCzs98PTtT9xy76eXHVEpiVBL5NffgFWvajDu1cU6EsB74VK4eqgzWgKMuqm16kVgsgVE+uISBD59NDABCCGPgv4NMDpVckU1wz4O3NFJG+f22dMmGA9t8f9Ppvf4y0OTowLL72EB/rZaKG12HnZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900609; c=relaxed/simple;
	bh=p6RXvl63SnjGqsNUIm9C1xnI/K8jfZRq3K9vUMKjQRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2Em36MiaEfWaVbhk3wRe5jaW+/VR+BqkFb1YYgmp/WfzCEvEm6flsEhw7ptRnUBZwSh46iGA7khZVKdIslp+KgoAGD6KCoKRFUkTV9JCpFq4/LS03cYIXqwDB0tMPrwbWYAowGg4AXl5UBPKexhylggD5R0w03kUQhpX8zFHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyMH74qq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nit8m3oaYzPkr/DHNj61xP6u3VIDPL4n4HKttTvb6ow=;
	b=KyMH74qqSTb5FIrV8/kT3I+mDceK46T1f0i80R+eFaSh5HsHb3iFNtRQ+f6LzPjN6xI4i3
	i1UTByfSo28izPHR5DwUn5+SAa3w3YtQ1fZlJdA3VkevPTTmiFFzLi/9UKjC1GmKxhrrf8
	FaWxmClT8j5/46t7OcH2ahIGj8RJGBY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-jdHh-XruOWCeD0ao3BwDRQ-1; Thu,
 12 Feb 2026 07:50:03 -0500
X-MC-Unique: jdHh-XruOWCeD0ao3BwDRQ-1
X-Mimecast-MFC-AGG-ID: jdHh-XruOWCeD0ao3BwDRQ_1770900601
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A624195605B;
	Thu, 12 Feb 2026 12:50:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0EA130001B9;
	Thu, 12 Feb 2026 12:49:55 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [RFC PATCH v3 4/6] char: mem: expose devmem helpers for KUnit testing
Date: Thu, 12 Feb 2026 13:49:21 +0100
Message-ID: <20260212124923.222484-5-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75914-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,lists.elisa.tech,linuxfoundation.org,gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arndb.de,linux.dev,gmail.com,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59BA312D94D
X-Rspamd-Action: no action

From: Alessandro Carminati <acarmina@redhat.com>

Refactor selected /dev/mem helpers to allow access from KUnit tests.

This change:
  - makes page_is_allowed(), read_mem(), and write_mem() visible when
    KUnit is enabled
  - moves shared declarations into a new internal header
  - preserves existing behavior for non-KUnit builds

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/char/mem.c | 15 +++++++++++----
 drivers/char/mem.h | 17 +++++++++++++++++
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 drivers/char/mem.h

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 9aa589ea2ef5..f1d0a2c11819 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -31,6 +31,10 @@
 #include <linux/uaccess.h>
 #include <linux/security.h>
 
+#include <kunit/visibility.h>
+
+#include "mem.h"
+
 #define DEVMEM_MINOR	1
 #define DEVPORT_MINOR	4
 
@@ -57,16 +61,17 @@ static inline int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 #endif
 
 #ifdef CONFIG_STRICT_DEVMEM
-static inline int page_is_allowed(unsigned long pfn)
+INLINE_VISIBLE_IF_KUNIT int page_is_allowed(unsigned long pfn)
 {
 	return devmem_is_allowed(pfn);
 }
 #else
-static inline int page_is_allowed(unsigned long pfn)
+INLINE_VISIBLE_IF_KUNIT int page_is_allowed(unsigned long pfn)
 {
 	return 1;
 }
 #endif
+EXPORT_SYMBOL_IF_KUNIT(page_is_allowed);
 
 static inline bool should_stop_iteration(void)
 {
@@ -104,7 +109,7 @@ static inline bool should_stop_iteration(void)
  * * %-ENOMEM - out of memory error for auxiliary kernel buffers supporting
  *   the operation of copying content from the physical pages
  */
-static ssize_t read_mem(struct file *file, char __user *buf,
+VISIBLE_IF_KUNIT ssize_t read_mem(struct file *file, char __user *buf,
 			size_t count, loff_t *ppos)
 {
 	phys_addr_t p = *ppos;
@@ -190,6 +195,7 @@ static ssize_t read_mem(struct file *file, char __user *buf,
 	kfree(bounce);
 	return err;
 }
+EXPORT_SYMBOL_IF_KUNIT(read_mem);
 
 /**
  * write_mem - write to physical memory (/dev/mem).
@@ -234,7 +240,7 @@ static ssize_t read_mem(struct file *file, char __user *buf,
  *   be copied from user-space
  * * %-EPERM - access to any of the required pages is not allowed
  */
-static ssize_t write_mem(struct file *file, const char __user *buf,
+VISIBLE_IF_KUNIT ssize_t write_mem(struct file *file, const char __user *buf,
 			 size_t count, loff_t *ppos)
 {
 	phys_addr_t p = *ppos;
@@ -306,6 +312,7 @@ static ssize_t write_mem(struct file *file, const char __user *buf,
 	*ppos += written;
 	return written;
 }
+EXPORT_SYMBOL_IF_KUNIT(write_mem);
 
 int __weak phys_mem_access_prot_allowed(struct file *file,
 	unsigned long pfn, unsigned long size, pgprot_t *vma_prot)
diff --git a/drivers/char/mem.h b/drivers/char/mem.h
new file mode 100644
index 000000000000..dfeb5f1d5ec8
--- /dev/null
+++ b/drivers/char/mem.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Red Hat inc Alessandro Carminati <acarmina@redhat.com>
+ */
+
+#ifndef _LINUX_CHAR_MEM_H
+#define _LINUX_CHAR_MEM_H
+
+#if IS_ENABLED(CONFIG_KUNIT)
+ssize_t read_mem(struct file *file, char __user *buf,
+			size_t count, loff_t *ppos);
+ssize_t write_mem(struct file *file, const char __user *buf,
+			 size_t count, loff_t *ppos);
+int page_is_allowed(unsigned long pfn);
+#endif
+
+#endif /* _LINUX_CHAR_MEM_H */
-- 
2.48.1


