Return-Path: <linux-doc+bounces-63725-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A64BEB909
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 22:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49EAC4F8992
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 20:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760A2347FC3;
	Fri, 17 Oct 2025 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1KKq25H"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E46345CDF
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732001; cv=none; b=u4/v152MZ+8f1XRDRb2H5rK+X6XGH/pO4RzBKvRhJ74YZ5dRTjPwPMmZIaGewsWGsm5s5wHFPLIE7RRnurLzZiXFfDWg+YTBXIPA+naH+MDMP07SNIgra/0NsGA/W+A9r4Scn3rxTOfzhPNhYnMp6Qyoc4iFWMkimB92BFniyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732001; c=relaxed/simple;
	bh=per631JY4Gz7eV84rzXzYabz2IMo+T2NHK7hd8tMJDo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A+mT86EPGpeALqRux4YekolK2B+acc6vBDZrHCns6l2lKy87KZtZ8cuO0GrWvrAEEIxSRq0ILwL4UeQ+7AOD5EvJkKmh/n8NSHAFMtWf/IQM6tE71BoTmeXzWRBOLOyGRcUXF/tO5MHPKYHRtmoMRpQqYhwaFX/x+NpVRd+YXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1KKq25H; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33428befc5bso3162005a91.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760731992; x=1761336792; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a410UVUkGWxYqDToM9eO24m2S1wWqIP4ItBf1At6t3A=;
        b=Q1KKq25HHV66y+Pfrwsx+JwGFmUxMkMluEGIqK87iqk93CCF+WxdwJfQsoY3Karx6+
         Z2R9v9bG28VjKGZYDNblQJrwhPSz/65fR49i1eAfFs+HEBev0CnZYnYJXRYlG2yvMyvK
         443bX1+kO5lZYXC0WpkeoR64UVMV4126E+yQcY2LkGTSJDWU//98E5CPBlW4MoxBTakA
         uWCi1tJmSEOhvUPL/zmq/xLFkdazxL1GRY3eoRBDbz/jGI/2OekdS4vAS0vLiVMTH4UL
         5MeJydaISLDwA6L0vjTrmyVsc70g9N50yqFXCZ+zYm0OaPJ4kOT4rvmHhnHFLWrIWLZk
         Igmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731992; x=1761336792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a410UVUkGWxYqDToM9eO24m2S1wWqIP4ItBf1At6t3A=;
        b=AGnAYPb4wcirbxUqyvj0efslbMrehGrP3Hs1/6jkY8eRA3e/5sNZhT89tNwnrDVCq8
         DSZCyI1/AbfCPEen6XRD5JvfB8vXt8x08OwhbUT9S99bH9bxxud7E+Y1hqaZowRgxYVd
         1KaSbePmTsu4RctLQ7/IKLD+JNKHX/tAMw0JvHTUsa9J/vHVZsEIc3s7lxLlqPg6dlvU
         IHCqY4wV/PgMC9ucU4cWq0eQ27dXRH8mvODpOxGy0R15AF8iydlQjasuP7TLr5AaTW9X
         oC1GHqEVcQ5ZJTVfFk6suBI+O9qtdbq54cdfvlDxSCj3oKQDnxmWJOUByE1vmdcMQMQj
         RFSw==
X-Forwarded-Encrypted: i=1; AJvYcCUyTj4XbQKN12mrQQND7h1BZ6pjZt6ADT0Ad0pUu7m0zQhxzSB1OPK3V5mLmpFSt44oZE+FfGwJQOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfEEK3giz7PNiHoqLbAUhYSVmF+tC3ZuZKXhf4ep3Og39TuXte
	CB2XT2MADccUYxp0WOfQksN6nnj7B6xAZ48X3gjcLfiy3dNuWTICs1rfRwG1jRydHhQEwtbcxtD
	BhMqSGnUn/gFKJobiTYKeU/6d4w==
X-Google-Smtp-Source: AGHT+IHRvzzwMR4y0ztHkD4pksfFtRgb0k5+ziur45rOES6dge9lLW63A0tWR3m6aINjc/jUiO+gZmGPknwu1Q9I7g==
X-Received: from pjpx13.prod.google.com ([2002:a17:90a:a38d:b0:33b:51fe:1a93])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1dc4:b0:33b:ade7:51d3 with SMTP id 98e67ed59e1d1-33bcf8f78c4mr6385553a91.20.1760731991624;
 Fri, 17 Oct 2025 13:13:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:12:07 -0700
In-Reply-To: <cover.1760731772.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <bb336979b10ee5b9c6b3c3934ec3aff19330b3e7.1760731772.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 26/37] KVM: selftests: guest_memfd: Test that
 shared/private status is consistent across processes
From: Ackerley Tng <ackerleytng@google.com>
To: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: ackerleytng@google.com, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Add a test to verify that a guest_memfd's shared/private status is
consistent across processes.

The test forks a child process after creating the shared guest_memfd
region so that the second process exists alongside the main process for the
entire test.

The processes then take turns to access memory to check that the
shared/private status is consistent across processes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/guest_memfd_conversions_test.c        | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index 907d415d72315..e6abf2d30c62d 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -330,6 +330,80 @@ GMEM_CONVERSION_TEST_INIT_SHARED(truncate)
 	test_private(t, 0, 0, 'A');
 }
 
+/* Test that shared/private memory protections work and are seen from any process. */
+GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
+{
+	/*
+	 * No races are intended in this test, shared memory is only used to
+	 * coordinate between processes.
+	 */
+	static enum {
+		STATE_INIT,
+		STATE_CHECK_SHARED,
+		STATE_DONE_CHECKING_SHARED,
+		STATE_CHECK_PRIVATE,
+		STATE_DONE_CHECKING_PRIVATE,
+	} *test_state;
+	pid_t child_pid;
+
+	test_state = kvm_mmap(sizeof(*test_state), PROT_READ | PROT_WRITE,
+			      MAP_SHARED | MAP_ANONYMOUS, -1);
+
+#define TEST_STATE_AWAIT(__state)						\
+	while (READ_ONCE(*test_state) != __state) {				\
+		if (child_pid != 0) {						\
+			int status;						\
+			pid_t pid;						\
+			do {							\
+				pid = waitpid(child_pid, &status, WNOHANG);	\
+			} while (pid == -1 && errno == EINTR);			\
+			if (pid == -1)						\
+				TEST_FAIL("Couldn't check child status.");	\
+			else if (pid != 0)					\
+				TEST_FAIL("Child exited prematurely.");		\
+		}								\
+	}
+
+#define TEST_STATE_SET(__state) WRITE_ONCE(*test_state, __state)
+
+	child_pid = fork();
+	TEST_ASSERT(child_pid != -1, "fork failed");
+
+	if (child_pid == 0) {
+		const char inconsequential = 0xdd;
+
+		TEST_STATE_AWAIT(STATE_CHECK_SHARED);
+
+		/*
+		 * This maps the pages into the child process as well, and tests
+		 * that the conversion process will unmap the guest_memfd memory
+		 * from all processes.
+		 */
+		host_do_rmw(t->mem, 0, 0xB, 0xC);
+
+		TEST_STATE_SET(STATE_DONE_CHECKING_SHARED);
+		TEST_STATE_AWAIT(STATE_CHECK_PRIVATE);
+
+		TEST_EXPECT_SIGBUS(READ_ONCE(t->mem[0]));
+		TEST_EXPECT_SIGBUS(WRITE_ONCE(t->mem[0], inconsequential));
+
+		TEST_STATE_SET(STATE_DONE_CHECKING_PRIVATE);
+		exit(0);
+	}
+
+	test_shared(t, 0, 0, 0xA, 0xB);
+
+	TEST_STATE_SET(STATE_CHECK_SHARED);
+	TEST_STATE_AWAIT(STATE_DONE_CHECKING_SHARED);
+
+	test_convert_to_private(t, 0, 0xC, 0xD);
+
+	TEST_STATE_SET(STATE_CHECK_PRIVATE);
+	TEST_STATE_AWAIT(STATE_DONE_CHECKING_PRIVATE);
+
+	kvm_munmap(test_state, sizeof(*test_state));
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
-- 
2.51.0.858.gf9c4a03a3a-goog


