Return-Path: <linux-doc+bounces-86324-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOvvFTP1/GlmVgAAu9opvQ
	(envelope-from <linux-doc+bounces-86324-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 22:25:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 956964EE777
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 22:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFC1F3027275
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 20:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1624B8DD8;
	Thu,  7 May 2026 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7Xs54zP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A74ADDA5;
	Thu,  7 May 2026 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185372; cv=none; b=XIBab1+LX29YmgCA0oth9iJoCALm7YUok+gzqbGPlKd9Q+xVcQX2InKfhUrGYiFZU21fwaGI7NRCFgo4V0j8hRqQ9LtCdI497YNpTq+giGV48cWNjTesT7ywypXsOIWQh0cH7UygZK9cTovgWz7C/ZcOkTPNkqDmEWVydL98JAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185372; c=relaxed/simple;
	bh=MMPGlYreY2sU1hgM7fKLHEenW50BQ3s1uRGHdDrCvNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeHlrhV5UhwG6Y8gZU1OMZBNLL24G1Vt2j3YcqbsGPZCJnFUHjl17tz+DouiUFvkIuPyUEwbFsBpWG8NX+kQiyL/zJzxpLdsBPDuByGldzmZL5QiFoyOy0YVj06EtJ6wHzNrtGogsuNW+x20BGFWq0wBwDRfZtNGHJxBxipd3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7Xs54zP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9ADC2BCC7;
	Thu,  7 May 2026 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778185372;
	bh=MMPGlYreY2sU1hgM7fKLHEenW50BQ3s1uRGHdDrCvNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A7Xs54zPKJg8gt4AKMtGWgkbrFe695yZUeKmbg/93U14urs7QojUCMEvKblF+P9Xm
	 d8MOskrO7x0HmQUstofXyZ5qUBHvA1n7JJbB8q9W27LIMlKfcOyyuwnKq24jGfMqoP
	 E5K3vlW+rWqjlH4uVB9bUq5uD5xByWn7nu+k/jPjYx6Az7jUrg26xPZ/5xtAl4ZkkO
	 aKFvIKPsprK3Flv6+P9K1SNGvaEDidkSwPhVmqkN7jQna6Vma22XJPXrbTDR7CPPSs
	 RIJij2MOOSHPO+0BLWB7D021v9EVFRT44uHbzybtZNzX4AopSOHuT64nzsLXtWb37R
	 RbgTQBNCk891A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29A3CD3447;
	Thu,  7 May 2026 20:22:51 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Thu, 07 May 2026 13:22:48 -0700
Subject: [PATCH v6 29/43] KVM: selftests: Test conversion flow when
 INIT_SHARED
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-gmem-inplace-conversion-v6-29-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778185365; l=1651;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=3dJJVaO5CbDHEYuvBiKmCbp4LG4+cPBQBjzjK51vgD0=;
 b=T5ZAw36194pa8yvUKbqkX33Zn9CjHoCoe44GxfiKWIMI7PjSfJAIO2z5gP54gfKAkP1Hkhz08
 azus6bSU4JCDbwX+JzTdUFqAq5UYd4uKvoIfc0f1Xj8DDiJOgreK6Fv
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com
X-Rspamd-Queue-Id: 956964EE777
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86324-lists,linux-doc=lfdr.de,ackerleytng.google.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	HAS_REPLYTO(0.00)[ackerleytng@google.com]
X-Rspamd-Action: no action

From: Ackerley Tng <ackerleytng@google.com>

Add a test case to verify that conversions between private and shared
memory work correctly when the memory is initially created as shared.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/x86/guest_memfd_conversions_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
index 81cf13e399c83..c524457148706 100644
--- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
@@ -95,6 +95,12 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)		\
 #define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)					\
 	__GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
 
+#define __GMEM_CONVERSION_TEST_INIT_SHARED(test, __nr_pages)			\
+	GMEM_CONVERSION_TEST(test, __nr_pages, GUEST_MEMFD_FLAG_INIT_SHARED)
+
+#define GMEM_CONVERSION_TEST_INIT_SHARED(test)					\
+	__GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
+
 struct guest_check_data {
 	void *mem;
 	char expected_val;
@@ -186,6 +192,12 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(init_private)
 	test_convert_to_private(t, 0, 'C', 'E');
 }
 
+GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
+{
+	test_shared(t, 0, 0, 'A', 'B');
+	test_convert_to_private(t, 0, 'B', 'C');
+	test_convert_to_shared(t, 0, 'C', 'D', 'E');
+}
 
 int main(int argc, char *argv[])
 {

-- 
2.54.0.563.g4f69b47b94-goog



