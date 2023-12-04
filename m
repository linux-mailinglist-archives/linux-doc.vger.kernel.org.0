Return-Path: <linux-doc+bounces-3936-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC1803744
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 15:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73AA41F21151
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 14:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207052C194;
	Mon,  4 Dec 2023 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ILW/jI73"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41F6C4;
	Mon,  4 Dec 2023 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=WWVRVO4rk5Tr7MGrSTJbAXSf75JgVNtQ8ev+YYa16zs=; b=ILW/jI73sDCLnvB6zM3B3myVqa
	xKWBvbi2/8Tl9XHA5rLDstszR188oL4V1Uy6R3yH7BfxGbz3ZYgnCdN3unoU4zjU7XlAos6Yhz5ih
	yu/73jZzwER7Xw+FLCyprgJhdDVlE+ZBcqiH5ptl9m1FLyGSUzOPywPPQaCpe7AvQ8wA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rAAAw-0003de-Va; Mon, 04 Dec 2023 14:43:58 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=REM-PW02S00X.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rAAAw-00088g-JQ; Mon, 04 Dec 2023 14:43:58 +0000
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
Subject: [PATCH v10 02/19] KVM: pfncache: remove unnecessary exports
Date: Mon,  4 Dec 2023 14:43:17 +0000
Message-Id: <20231204144334.910-3-paul@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204144334.910-1-paul@xen.org>
References: <20231204144334.910-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

There is no need for the existing kvm_gpc_XXX() functions to be exported.
Clean up now before additional functions are added in subsequent patches.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
Cc: Sean Christopherson <seanjc@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

v8:
 - New in this version.
---
 virt/kvm/pfncache.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 10842f1eeeae..f3571f44d9af 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -94,7 +94,6 @@ bool kvm_gpc_check(struct gfn_to_pfn_cache *gpc, unsigned long len)
 
 	return true;
 }
-EXPORT_SYMBOL_GPL(kvm_gpc_check);
 
 static void *gpc_map(kvm_pfn_t pfn)
 {
@@ -346,7 +345,6 @@ int kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, unsigned long len)
 {
 	return __kvm_gpc_refresh(gpc, gpc->gpa, len);
 }
-EXPORT_SYMBOL_GPL(kvm_gpc_refresh);
 
 void kvm_gpc_init(struct gfn_to_pfn_cache *gpc, struct kvm *kvm,
 		  struct kvm_vcpu *vcpu, enum pfn_cache_usage usage)
@@ -363,7 +361,6 @@ void kvm_gpc_init(struct gfn_to_pfn_cache *gpc, struct kvm *kvm,
 	gpc->pfn = KVM_PFN_ERR_FAULT;
 	gpc->uhva = KVM_HVA_ERR_BAD;
 }
-EXPORT_SYMBOL_GPL(kvm_gpc_init);
 
 int kvm_gpc_activate(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned long len)
 {
@@ -388,7 +385,6 @@ int kvm_gpc_activate(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned long len)
 	}
 	return __kvm_gpc_refresh(gpc, gpa, len);
 }
-EXPORT_SYMBOL_GPL(kvm_gpc_activate);
 
 void kvm_gpc_deactivate(struct gfn_to_pfn_cache *gpc)
 {
@@ -426,4 +422,3 @@ void kvm_gpc_deactivate(struct gfn_to_pfn_cache *gpc)
 		gpc_unmap(old_pfn, old_khva);
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_gpc_deactivate);
-- 
2.39.2


