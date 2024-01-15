Return-Path: <linux-doc+bounces-6823-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DE82DA41
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 14:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E456283589
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967BF1754C;
	Mon, 15 Jan 2024 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="IMTrAe7j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428E1773D;
	Mon, 15 Jan 2024 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=iyqOFrP3aGKoiCQ7WXZlsE4e+dflFfzsWYBVMlCow44=; b=IMTrAe7jUUZ3nReNth3tWWJbgv
	RhweXiVrXxeg2hE9Qgh+9zDs6DhyUoZ6gitWhitBYcSSl1iej18Ecyjl0eXed7ryLj1aXbYuTXhiH
	hr0enhb4+o+CRoYhfp2m42cnSINd2mwHs56r2dDy0WV7wBk4R3sgKx6PaWldTtrjXQzA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rPMXE-0002jt-3i; Mon, 15 Jan 2024 12:57:48 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=REM-PW02S00X.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rPMXD-0002kM-PX; Mon, 15 Jan 2024 12:57:48 +0000
From: Paul Durrant <paul@xen.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v12 06/20] KVM: pfncache: stop open-coding offset_in_page()
Date: Mon, 15 Jan 2024 12:56:53 +0000
Message-Id: <20240115125707.1183-7-paul@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240115125707.1183-1-paul@xen.org>
References: <20240115125707.1183-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Some code in pfncache uses offset_in_page() but in other places it is open-
coded. Use offset_in_page() consistently everywhere.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>

v8:
 - New in this version.
---
 virt/kvm/pfncache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 6f4b537eb25b..0eeb034d0674 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -48,7 +48,7 @@ bool kvm_gpc_check(struct gfn_to_pfn_cache *gpc, unsigned long len)
 	if (!gpc->active)
 		return false;
 
-	if ((gpc->gpa & ~PAGE_MASK) + len > PAGE_SIZE)
+	if (offset_in_page(gpc->gpa) + len > PAGE_SIZE)
 		return false;
 
 	if (gpc->generation != slots->generation || kvm_is_error_hva(gpc->uhva))
@@ -192,7 +192,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 
 	gpc->valid = true;
 	gpc->pfn = new_pfn;
-	gpc->khva = new_khva + (gpc->gpa & ~PAGE_MASK);
+	gpc->khva = new_khva + offset_in_page(gpc->gpa);
 
 	/*
 	 * Put the reference to the _new_ pfn.  The pfn is now tracked by the
@@ -213,7 +213,7 @@ static int __kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, gpa_t gpa,
 			     unsigned long len)
 {
 	struct kvm_memslots *slots = kvm_memslots(gpc->kvm);
-	unsigned long page_offset = gpa & ~PAGE_MASK;
+	unsigned long page_offset = offset_in_page(gpa);
 	bool unmap_old = false;
 	unsigned long old_uhva;
 	kvm_pfn_t old_pfn;
-- 
2.39.2


