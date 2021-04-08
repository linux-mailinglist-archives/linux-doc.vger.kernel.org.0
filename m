Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73178358261
	for <lists+linux-doc@lfdr.de>; Thu,  8 Apr 2021 13:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhDHLoc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Apr 2021 07:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30533 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231528AbhDHLoa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 07:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617882259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=huJU/7eTGA9L+HVGecfG2Pp+AIuWsVkRoZrlV5LSukk=;
        b=V3EfR85R0luhSxZPoqF7kN7kE798zt0ssIMVjr5pp29BFWljvT+Zwpe1lLb4bIccMsKT69
        TbhD/LL5fr2ZABQ403ZqDP4E3PyseVHCeh1vLvB9k/sGOct2U3k7Yjiv9c/el+3Lcw8KMV
        FX0REUG5VYHdSmrs7FE/CheRVCelB+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-0b_Rs50mOt6XjvqH1P6FWQ-1; Thu, 08 Apr 2021 07:44:17 -0400
X-MC-Unique: 0b_Rs50mOt6XjvqH1P6FWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A0DF10054F6;
        Thu,  8 Apr 2021 11:44:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-155.ams2.redhat.com [10.36.113.155])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC9F5B4A8;
        Thu,  8 Apr 2021 11:44:07 +0000 (UTC)
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 4/4] selftests: KVM: extend get_cpuid_test to include KVM_GET_EMULATED_CPUID
Date:   Thu,  8 Apr 2021 13:43:03 +0200
Message-Id: <20210408114303.30310-5-eesposit@redhat.com>
In-Reply-To: <20210408114303.30310-1-eesposit@redhat.com>
References: <20210408114303.30310-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Extend the get_cpuid_test.c selftest to include the KVM_GET_EMULATED_CPUID
ioctl. Since the behavior and functionality is similar to
KVM_GET_SUPPORTED_CPUID, we only check additionally:

1) checks for corner case in the nent field of the struct kvm_cpuid2.
2) sets and gets it as cpuid from the guest VM

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 .../selftests/kvm/x86_64/get_cpuid_test.c     | 90 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/get_cpuid_test.c b/tools/testing/selftests/kvm/x86_64/get_cpuid_test.c
index 9b78e8889638..b9f0fba1b0ea 100644
--- a/tools/testing/selftests/kvm/x86_64/get_cpuid_test.c
+++ b/tools/testing/selftests/kvm/x86_64/get_cpuid_test.c
@@ -13,6 +13,7 @@
 #include "processor.h"
 
 #define VCPU_ID 0
+#define MAX_NENT 1000
 
 /* CPUIDs known to differ */
 struct {
@@ -137,7 +138,8 @@ static void run_vcpu(struct kvm_vm *vm, uint32_t vcpuid, int stage)
 	}
 }
 
-struct kvm_cpuid2 *vcpu_alloc_cpuid(struct kvm_vm *vm, vm_vaddr_t *p_gva, struct kvm_cpuid2 *cpuid)
+static struct kvm_cpuid2 *vcpu_alloc_cpuid(struct kvm_vm *vm, vm_vaddr_t *p_gva,
+					struct kvm_cpuid2 *cpuid)
 {
 	int size = sizeof(*cpuid) + cpuid->nent * sizeof(cpuid->entries[0]);
 	vm_vaddr_t gva = vm_vaddr_alloc(vm, size,
@@ -150,9 +152,84 @@ struct kvm_cpuid2 *vcpu_alloc_cpuid(struct kvm_vm *vm, vm_vaddr_t *p_gva, struct
 	return guest_cpuids;
 }
 
+static struct kvm_cpuid2 *alloc_custom_kvm_cpuid2(int nent)
+{
+	struct kvm_cpuid2 *cpuid;
+	size_t size;
+
+	size = sizeof(*cpuid);
+	size += nent * sizeof(struct kvm_cpuid_entry2);
+	cpuid = calloc(1, size);
+	if (!cpuid) {
+		perror("malloc");
+		abort();
+	}
+
+	cpuid->nent = nent;
+
+	return cpuid;
+}
+
+static void clean_entries_kvm_cpuid2(struct kvm_cpuid2 *cpuid)
+{
+	size_t size;
+	int old_nent = cpuid->nent;
+
+	size = sizeof(*cpuid);
+	size += MAX_NENT * sizeof(struct kvm_cpuid_entry2);
+	memset(cpuid, 0, size);
+	cpuid->nent = old_nent;
+}
+
+static void test_emulated_entries(struct kvm_vm *vm)
+{
+	int res, right_nent;
+	struct kvm_cpuid2 *cpuid;
+
+	cpuid = alloc_custom_kvm_cpuid2(MAX_NENT);
+
+	/* 0 nent, return E2BIG */
+	cpuid->nent = 0;
+	res = _kvm_ioctl(vm, KVM_GET_EMULATED_CPUID, cpuid);
+	TEST_ASSERT(res == -1 && errno == E2BIG, "nent=0 should fail as E2BIG");
+	clean_entries_kvm_cpuid2(cpuid);
+
+	/* high nent, set the entries and adjust */
+	cpuid->nent = MAX_NENT;
+	res = _kvm_ioctl(vm, KVM_GET_EMULATED_CPUID, cpuid);
+	TEST_ASSERT(res == 0, "nent > actual nent should not fail");
+	right_nent = cpuid->nent;
+	clean_entries_kvm_cpuid2(cpuid);
+
+	/* high nent, set the entries and adjust */
+	cpuid->nent++;
+	res = _kvm_ioctl(vm, KVM_GET_EMULATED_CPUID, cpuid);
+	TEST_ASSERT(res == 0, "nent > actual nent should not fail");
+	TEST_ASSERT(right_nent == cpuid->nent, "nent should be always the same");
+	clean_entries_kvm_cpuid2(cpuid);
+
+	/* low nent, return E2BIG */
+	if (right_nent > 1) {
+		cpuid->nent = 1;
+		res = _kvm_ioctl(vm, KVM_GET_EMULATED_CPUID, cpuid);
+		TEST_ASSERT(res == -1 && errno == E2BIG, "nent=1 should fail");
+		clean_entries_kvm_cpuid2(cpuid);
+	}
+
+	/* exact nent */
+	cpuid->nent = right_nent;
+	res = _kvm_ioctl(vm, KVM_GET_EMULATED_CPUID, cpuid);
+	TEST_ASSERT(res == 0, "nent == actual nent should not fail");
+	TEST_ASSERT(cpuid->nent == right_nent,
+		"KVM_GET_EMULATED_CPUID should be invaried when nent is exact");
+	clean_entries_kvm_cpuid2(cpuid);
+
+	free(cpuid);
+}
+
 int main(void)
 {
-	struct kvm_cpuid2 *supp_cpuid, *cpuid2;
+	struct kvm_cpuid2 *supp_cpuid, *emul_cpuid, *cpuid2;
 	vm_vaddr_t cpuid_gva;
 	struct kvm_vm *vm;
 	int stage;
@@ -171,5 +248,14 @@ int main(void)
 	for (stage = 0; stage < 3; stage++)
 		run_vcpu(vm, VCPU_ID, stage);
 
+	if (kvm_check_cap(KVM_CAP_EXT_EMUL_CPUID)) {
+		emul_cpuid = kvm_get_emulated_cpuid();
+		vcpu_set_cpuid(vm, VCPU_ID, emul_cpuid);
+		cpuid2 = vcpu_get_cpuid(vm, VCPU_ID);
+
+		test_emulated_entries(vm);
+		compare_cpuids(emul_cpuid, cpuid2);
+	}
+
 	kvm_vm_free(vm);
 }
-- 
2.30.2

