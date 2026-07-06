Return-Path: <linux-doc+bounces-95092-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6SOOUBxS2oKRgEAu9opvQ
	(envelope-from <linux-doc+bounces-95092-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 11:11:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDF70E77F
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 11:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shutemov.name header.s=fm3 header.b="q AoW93O";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=L9ldnKnc;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95092-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95092-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55A6333979DE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 08:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD2642B726;
	Mon,  6 Jul 2026 08:48:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CEF3F44F6;
	Mon,  6 Jul 2026 08:48:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327713; cv=none; b=OurPbN3Vu8AVsZ/J6jhLQoUSViNahzNuOORFl+Zh4rgfvlXda7gXv75IYTqdPF+c9RcItFNQr0u+z11SgIDBl38yrh6NqjnzdWfoHXo9XUDNwQfdyLUnj4BABNcLXVj8KP79fBY+Lf87R/HByicpLHK/cv5WjODKbb8k84Pg3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327713; c=relaxed/simple;
	bh=D5blKixSKUjIZNvba/4Oy8tOCO45xeMNpOCPKdg62lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbQJGgY6VMp4hXe2GV7INCPEVlSGBveXzOpT3jmS6tevnxgTdOQvgjeP8nDCuBzIgRA+8Pl1PXFMWSJG7OzYohVoqIfHzP5kaTBDlwWQHkYi5jzhZQGStOPRzX9vSSR/l/+353IzIw8X9nK8cmeRhdxUjcjVKkGoyTRILVgo4VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=qAoW93Ob; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L9ldnKnc; arc=none smtp.client-ip=202.12.124.144
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 758181D00112;
	Mon,  6 Jul 2026 04:48:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 06 Jul 2026 04:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783327697; x=
	1783414097; bh=KHWPH1BueoLrKJ2AnlWZbvIzikefHXu8fHT5GFP5/Qw=; b=q
	AoW93Ob61ZDMeWv3+veGAfnpE6MRSoflezRdz5KMJDU1e24LHC12UTP1q5WESvDi
	n7uHF5Ct29DnEAXskC5/j5tthjKW/5gzEtUm3W56SEyekcGsxLzOH8PtNvfobdPY
	bOx5sYC9qkS/eiCNTaz/CEiHwySqUfjNWsFrMCj4HhUhKb2aTueX+Boz/+ynwMi5
	fwv4lbDSLxY3oLIClMzvusll4/dPZVv6GDz7jpf2gdnNEfKe4n7jWYn9mJmvEEzm
	Lm6CUpVCBytXoF66bGSCUE7xn0qz3zVSNVJfO0pxqE1XQPdlkUKTQUrum5eMDDDP
	2VSSCSZEibhI3ZFREx+hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783327697; x=1783414097; bh=K
	HWPH1BueoLrKJ2AnlWZbvIzikefHXu8fHT5GFP5/Qw=; b=L9ldnKncfgP0WMEX9
	RZ+jAHliQgtbm+bPNi6Rn9I5AXEhbhKWQq8rNzgTpC3lI3Dcj2P20HpEAtH0goRj
	+Tu+jCegb2AqXEmZ2/AGF8HLLGSWJj026KGeIsNI0dAJmXFwCjM72npT2maVbtwc
	LrcSpSr55NeRqFuttt7j8VKmXeJ5jk8oPdFRq01ejems+0HnAjlLDpvwLncNVGJQ
	+Wsi0o6x67orBsr0uqi2nSbOMwH77SKauIOdm7FEpJlR6wVd5zK3VBjN6d7VCUjs
	cCc5jxQoEHg2AEHB73sbceAFi3rMDI4rbjymKli1Kxp/WDiTsbT7ahyuusVqin22
	1c6cA==
X-ME-Sender: <xms:0WtLase6eky5k9yFBGsY6pUnhqeLVkwCiPQYv4RZ_VTOYB-RgsFj3Q>
    <xme:0WtLaqGQQd6UZTiPFXCLGMUviZjWnclrvDcPlruIvFEMB4eXxzI229rTU1tdqvLnt
    dxoelEdNuTMeI7c6LhO4_GwuDXBmGIgh0a6QUV_Z4Z8-zMexfr27OH->
X-ME-Received: <xmr:0WtLamVLI-58J2unkBAtQFq0vLG_82CoMGv_ffnr9xStsbFqc2VFX_HOqO-t0w>
X-ME-Proxy-Cause: dmFkZTET0Fy/mQ5GxzVkQ3gF7+kMhlrCFV8qSTPNB/FMzugyamnQzrMucqNMsaFIbnsWDS
    3jROHvtXXewIALBwtzeLi4ehIRfdxkunZt5jjRrCRxJei7s8CxoLlASfjBq8RK3uewm/Rq
    uRAT8JnF94hU7TjV6P6upYkUbh1epL0j5kGSBOBVhQdyB5AsitnuuDzqvdW5SWYeMkpb/z
    4GJwYftRBV5s9rVqMXoOBF864Rdc0C3wjYZZxm5WCWO7+uAnZDT04L14GFTXm8KkHgw5DW
    CWb7yXPC/MOZEYPY5k1KGuVSi5ef/GhpKzsuc6EC7FHA/OXjfZC6Mku40qXEIBFc1PlPm5
    B+ozC1p/6+plR6xDn5CuYDWSsFmr7/ZJ+0codrF7awO/tzpw1O9Auhug7XnMl9JZcQDJpE
    kZmISsSjzI+wCjhH8VDP3PDU6sLbUtp4P6LY8bjSH63yg2On/aOiiGHb57yGaP5vEQE16D
    j+a2fRh7SW0QuPEyMUTTLQcUir5zDo+HFFONGOzj03IkUvk13dmEIcr60YPstp/iqUbAZk
    ebsswMENplkpecZ/Sv10qiRPycd66JjTolj8EkJFo0J36NOoacihRxUOpAzXgBukEkfvJ1
    NcBThyrNIpCZ0oIh6GDgRTGifwVtRBL8XqGW/W0yOlXZgDPjPn4EpsWgb/ZA
X-ME-Proxy: <xmx:0WtLaqwqqACmmuvsVrBhYeRwbgy7Wo4yKybYKFlm3dXh3bFOaIu2QQ>
    <xmx:0WtLahvFydun9q5BcMBFjZWuOGoBEXC0nE1EADExuL-0iCQEaaXhSg>
    <xmx:0WtLarBU1EpAyZ7M4CcBBrkyQO8NVwjKrNDAy7LDlhvQdaSmUW9ujw>
    <xmx:0WtLatpdYKtPauJhfwMov5U48bCLFYVFtproV3c0OWZuY9A4WwAK_Q>
    <xmx:0WtLaqeQglSoaL-RZC2oWApOKhEiOcLGdfRMGARWsfe0In_c7D9HJXfX>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jul 2026 04:48:16 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	david@kernel.org
Cc: ljs@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	ziy@nvidia.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	jthoughton@google.com,
	aarcange@redhat.com,
	sj@kernel.org,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kernel-team@meta.com,
	kas@kernel.org
Subject: [PATCH v9 04/15] userfaultfd: test uffd VMA flags through the vma_flags_t API
Date: Mon,  6 Jul 2026 09:47:53 +0100
Message-ID: <20260706084805.8400-5-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706084805.8400-1-kirill@shutemov.name>
References: <20260706084805.8400-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[shutemov.name:s=fm3,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:rppt@kernel.org,m:peterx@redhat.com,m:david@kernel.org,m:ljs@kernel.org,m:surenb@google.com,m:vbabka@kernel.org,m:Liam.Howlett@oracle.com,m:ziy@nvidia.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:jthoughton@google.com,m:aarcange@redhat.com,m:sj@kernel.org,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kvm@vger.kernel.org,m:kernel-team@meta.com,m:kas@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95092-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[shutemov.name];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[kirill@shutemov.name,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[shutemov.name:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[kirill@shutemov.name,linux-doc@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shutemov.name:from_mime,shutemov.name:dkim,shutemov.name:mid,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ADDF70E77F

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The uffd VMA-flag helpers read vma->vm_flags directly. Now that
config-gated per-mode masks exist, switch them to the vma_flags_t
accessor vma_test_any_mask(), which is the going-forward API and keeps a
single place (the VMA_UFFD_* masks) that knows which modes are available
on the current build.

No functional change: vma_flags_t is in union with vm_flags, so the same
bits are read, and the masks fold to the same code the open-coded
vm_flags tests produced -- verified identical on gcc and clang, 32- and
64-bit.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Assisted-by: Claude:claude-opus-4-8
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/userfaultfd_k.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 658740df2978..c4f2cc6dfcf0 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -178,7 +178,8 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
  */
 static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR);
+	return vma_test_any_mask(vma,
+		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_MINOR));
 }
 
 /*
@@ -190,22 +191,23 @@ static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
  */
 static inline bool uffd_disable_fault_around(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & (VM_UFFD_WP | VM_UFFD_MINOR);
+	return vma_test_any_mask(vma,
+		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_MINOR));
 }
 
 static inline bool userfaultfd_missing(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & VM_UFFD_MISSING;
+	return vma_test_any_mask(vma, VMA_UFFD_MISSING);
 }
 
 static inline bool userfaultfd_wp(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & VM_UFFD_WP;
+	return vma_test_any_mask(vma, VMA_UFFD_WP);
 }
 
 static inline bool userfaultfd_minor(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & VM_UFFD_MINOR;
+	return vma_test_any_mask(vma, VMA_UFFD_MINOR);
 }
 
 static inline bool userfaultfd_pte_wp(struct vm_area_struct *vma,
@@ -222,7 +224,7 @@ static inline bool userfaultfd_huge_pmd_wp(struct vm_area_struct *vma,
 
 static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 {
-	return vma->vm_flags & __VM_UFFD_FLAGS;
+	return vma_test_any_mask(vma, __VMA_UFFD_FLAGS);
 }
 
 static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
-- 
2.54.0


