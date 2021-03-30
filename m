Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CA934F14F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Mar 2021 20:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbhC3S7J (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Mar 2021 14:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20466 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232970AbhC3S67 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Mar 2021 14:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617130739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aPc+rabAZpzxBvkEBQsdws4dCgLq8Pb5mtjSkAQD3So=;
        b=gUrBrfYvd1cofowOGL/fRh3EKT3BI4ir/1MPFLFREKSt/Xw21UF+Wc807aHJ0XXWw+fFlE
        o4rcE90Q6eXXhP3W1+MaFSyEbbU5qsEXdgLog7aLkxeL3LH5rnVe+7fb4sl6fJzIIjZ1m1
        gwXibSWct4gl8s832WScT6eM722b5ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-gAWCBbpRMLS2c762orwA8w-1; Tue, 30 Mar 2021 14:58:57 -0400
X-MC-Unique: gAWCBbpRMLS2c762orwA8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD2B8030A1;
        Tue, 30 Mar 2021 18:58:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CEF819C44;
        Tue, 30 Mar 2021 18:58:50 +0000 (UTC)
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
To:     kvm@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH 1/4] kvm: cpuid: adjust the returned nent field of kvm_cpuid2 for KVM_GET_SUPPORTED_CPUID and KVM_GET_EMULATED_CPUID
Date:   Tue, 30 Mar 2021 20:58:38 +0200
Message-Id: <20210330185841.44792-2-eesposit@redhat.com>
In-Reply-To: <20210330185841.44792-1-eesposit@redhat.com>
References: <20210330185841.44792-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Calling the kvm KVM_GET_[SUPPORTED/EMULATED]_CPUID ioctl requires
a nent field inside the kvm_cpuid2 struct to be big enough to contain
all entries that will be set by kvm.
Therefore if the nent field is too high, kvm will adjust it to the
right value. If too low, -E2BIG is returned.

However, when filling the entries do_cpuid_func() requires an
additional entry, so if the right nent is known in advance,
giving the exact number of entries won't work because it has to be increased
by one.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 arch/x86/kvm/cpuid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 6bd2f8b830e4..5412b48b9103 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -975,6 +975,12 @@ int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
 
 	if (cpuid->nent < 1)
 		return -E2BIG;
+
+	/* if there are X entries, we need to allocate at least X+1
+	 * entries but return the actual number of entries
+	 */
+	cpuid->nent++;
+
 	if (cpuid->nent > KVM_MAX_CPUID_ENTRIES)
 		cpuid->nent = KVM_MAX_CPUID_ENTRIES;
 
-- 
2.30.2

