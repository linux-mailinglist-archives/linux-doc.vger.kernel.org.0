Return-Path: <linux-doc+bounces-73142-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CAD3BB52
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 00:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BB7304D84E
	for <lists+linux-doc@lfdr.de>; Mon, 19 Jan 2026 23:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C846E2C21F6;
	Mon, 19 Jan 2026 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br5khT2B"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F9329BDAD;
	Mon, 19 Jan 2026 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768863780; cv=none; b=n9T98ILd8oReq2kjz+SWm8oQIkr3GaYrCOhUUcjdyTfLfJBc4BZtHK+zewXuYS0GY4HEbIlKEQAE6vpcJ6gDzT/h/bbejXT19BLYaBXGu86p5lB6Bfk05mSB36B38odjyGZ4og/AxJcAsrVPojOnjtaeSJ4d6O0mmZHastn+gWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768863780; c=relaxed/simple;
	bh=QtradRf0GStbdIUHbJa+QxsYtSkr1ee15tID6//kWAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPGMSXAkHf2SDXUROECGj8K88wOXEgLZTfqoc8gZxSRmDzyoyZdsrX911FoD1jsDkCKV4OLwag59mQlpz7Br0U8W135gkxqQ0my2tPgTObPWA+NmklN8WNDRKuFDhEnjN6Y7MdtNx0/G8QkAd5lW2YfAYL1cGF8Es8Liuqlzp2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br5khT2B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F01C116C6;
	Mon, 19 Jan 2026 23:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863778;
	bh=QtradRf0GStbdIUHbJa+QxsYtSkr1ee15tID6//kWAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Br5khT2BqgdVGETSbAaQu5YrjdjqXAvfXqQO1VMxW81Py8o5g7cf/09LcteyZ+CjP
	 VMkGGAnJ8GPsE1LyANcYOnXfeiSRbDgg7MhrSmwtzPuqS4MgxJRjqVToYtAkXTPVJA
	 80NtDQhI3xgllJk3hAdxv2JszAzpIuLWMNjNgYDsHPyM1gnGqRaq8jiISVtc3DSKb1
	 4XUufNGKEG13eLM3e8HEUHsOs6WdQVrPLBpmRGZZS+cPouXUJUplA+4tg7GZ+4ZUma
	 BO4JhKXQUjH3JcydqiW4udhJysaXEMdd7XxhQCej1whSbJaHBvADBiVb/EtAMzsa2t
	 rnfM2VyKYEtZw==
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v3 11/24] mm/balloon_compaction: drop fs.h include from balloon_compaction.h
Date: Tue, 20 Jan 2026 00:01:19 +0100
Message-ID: <20260119230133.3551867-12-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119230133.3551867-1-david@kernel.org>
References: <20260119230133.3551867-1-david@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit 68f2736a8583 ("mm: Convert all PageMovable users to
movable_operations") we no longer store an inode in balloon_dev_info,
so we can stop including "fs.h".

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 7db66c2c86cdc..1452ea0635245 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -42,7 +42,6 @@
 #include <linux/migrate.h>
 #include <linux/gfp.h>
 #include <linux/err.h>
-#include <linux/fs.h>
 #include <linux/list.h>
 
 /*
-- 
2.52.0


