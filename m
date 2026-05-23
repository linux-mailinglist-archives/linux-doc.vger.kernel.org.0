Return-Path: <linux-doc+bounces-89133-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NY7MM/yEGqxfwYAu9opvQ
	(envelope-from <linux-doc+bounces-89133-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 02:20:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D311F5BBD4C
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 02:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AC26301EAAE
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 00:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B82882B7;
	Sat, 23 May 2026 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qk9LOsei"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CF275B15;
	Sat, 23 May 2026 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779495484; cv=none; b=cOHIp64FKo274Xnu7NJ56bR5HITiDn/DOFGlztCEUUYAsiQx/W3vaODIgpDvBRuRH0gcOaNCqGsQdch5n13cVkBFGY1HJNL9yPmKd/wYnEFpvqa0PKuAAAIAa3Qc+GfcuOkaf/PTw9oep39n1GrRdJJjmmZvDe+dEzbi/TWpTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779495484; c=relaxed/simple;
	bh=qUYjNA0eco5NJ9jVeC5gu6EUkqMfeTPF0qC2cGuhEbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ww/TRX0vPL+HQ7elRCDGXtlITM/Z0YKhgctR2YzIdDBATEBdxdKl3cnYOFm38inupSHsbR9ThE85JHIrQy52qUK9V6UikTIwya97/C4UcNqLD7L25+ryK9J4DoIhfzROuliByk3ACTe87iecqw44KUFEuaA4AnxADCTJSEV/M88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qk9LOsei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77CF9C4AF54;
	Sat, 23 May 2026 00:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779495484;
	bh=qUYjNA0eco5NJ9jVeC5gu6EUkqMfeTPF0qC2cGuhEbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qk9LOsei2mu3m5JJabvICgH+P5omSMjflgrqemQKVy2tYqAsiryGmAMrPoTWHYziw
	 PGcdcL8jPvok78F4N6DyYjI4HV1DT1v0RJ2LJOYbkiWuY+sk8Y6A8UqbDxFhnd2cn2
	 DTqGmNEBB+Ietx8YwT1RNIkcF3klANheQ/vNVGScYh2H9m719AxWuDD51pLr1DM619
	 dZ1MvJxaDxvXwVIz+tWwPW2LZUnnk4Sc2FWNUvF0Cqw/h//XNSFLUya3oHtADJdfg4
	 nHtCgrTQpKB2v+IgFVeat4e3kyrLWccVWNg9bDHofH2EuWb1tK96EKbY9lfnNWPTcI
	 x05prZUAR73rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604ADCD5BBE;
	Sat, 23 May 2026 00:18:04 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Fri, 22 May 2026 17:17:57 -0700
Subject: [PATCH v7 15/42] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gmem-inplace-conversion-v7-15-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
In-Reply-To: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
 brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
 ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
 michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
 shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
 willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
 forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
 aneesh.kumar@kernel.org, liam@infradead.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779495480; l=1535;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=HETjd3B6v8GtRqbtrDZh0cSDeSq9rvnbWfv6A4pQb+k=;
 b=bxfoI43e31zSYUnX62jyjE4P7P4RIEb3sqiutPm5+T0GQNQ28QRWkAzRDB6NAynZC9lbOFasd
 H9dUOmPRfwfBZql16GfGc8C9DaNO7oqfimLH8GVZevZwQBXFMXPn5Ej
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89133-lists,linux-doc=lfdr.de,ackerleytng.google.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[ackerleytng@google.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D311F5BBD4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ackerley Tng <ackerleytng@google.com>

__kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
not specially handle -1ul. -1ul is used as a huge number, which legal
indices do not exceed, and hence the invalidation works as expected.

Since a later patch is going to make use of the exact range, calculate the
size of the guest_memfd inode and use it as the end range for invalidating
SPTEs.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 352cb8b837468..38b24f79ec223 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -370,6 +370,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = f->kvm;
 	unsigned long index;
+	pgoff_t end;
 
 	/*
 	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
@@ -396,9 +397,10 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 * Zap all SPTEs pointed at by this file.  Do not free the backing
 	 * memory, as its lifetime is associated with the inode, not the file.
 	 */
-	__kvm_gmem_invalidate_begin(f, 0, -1ul,
+	end = i_size_read(inode) >> PAGE_SHIFT;
+	__kvm_gmem_invalidate_begin(f, 0, end,
 				    kvm_gmem_get_invalidate_filter(inode));
-	__kvm_gmem_invalidate_end(f, 0, -1ul);
+	__kvm_gmem_invalidate_end(f, 0, end);
 
 	list_del(&f->entry);
 

-- 
2.54.0.794.g4f17f83d09-goog



