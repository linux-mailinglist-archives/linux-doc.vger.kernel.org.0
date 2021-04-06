Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BBD354E8C
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 10:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240191AbhDFI1H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 04:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58347 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240207AbhDFI1F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 04:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617697617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5pS0wh7N3KpBX2QM5qANzzkJZX1lhQrm39b/3Z7eSz4=;
        b=fgb+omxUpbXSgrdU0FrpKFiBhp2DoKMFtyv8Xn69Tw/JuPZsayTU4L/JLYYV/YkkVdFRy+
        aAOLoIEc+VKeZs2KYuL83PrQBSxKMFqJbh50Sd5ZmkcA5wIeBs0Mj5HZmMhNkPpbKK8jfc
        gnttGAPg4kjGbrb8VcFQUQFNICCtBjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-5s6b4nFBMl-osbL7yVzetw-1; Tue, 06 Apr 2021 04:26:55 -0400
X-MC-Unique: 5s6b4nFBMl-osbL7yVzetw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA0C18C8C05;
        Tue,  6 Apr 2021 08:26:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com [10.36.114.253])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA9A25D9D0;
        Tue,  6 Apr 2021 08:26:49 +0000 (UTC)
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
Subject: [PATCH v3 1/4] KVM: x86: Fix a spurious -E2BIG in KVM_GET_EMULATED_CPUID
Date:   Tue,  6 Apr 2021 10:26:39 +0200
Message-Id: <20210406082642.20115-2-eesposit@redhat.com>
In-Reply-To: <20210406082642.20115-1-eesposit@redhat.com>
References: <20210406082642.20115-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When retrieving emulated CPUID entries, check for an insufficient array
size if and only if KVM is actually inserting an entry.
If userspace has a priori knowledge of the exact array size,
KVM_GET_EMULATED_CPUID will incorrectly fail due to effectively requiring
an extra, unused entry.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 arch/x86/kvm/cpuid.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 6bd2f8b830e4..27059ddf9f0a 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -567,34 +567,33 @@ static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
 
 static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
 {
-	struct kvm_cpuid_entry2 *entry;
-
-	if (array->nent >= array->maxnent)
-		return -E2BIG;
+	struct kvm_cpuid_entry2 entry;
 
-	entry = &array->entries[array->nent];
-	entry->function = func;
-	entry->index = 0;
-	entry->flags = 0;
+	memset(&entry, 0, sizeof(entry));
+	entry.function = func;
 
 	switch (func) {
 	case 0:
-		entry->eax = 7;
-		++array->nent;
+		entry.eax = 7;
 		break;
 	case 1:
-		entry->ecx = F(MOVBE);
-		++array->nent;
+		entry.ecx = F(MOVBE);
 		break;
 	case 7:
-		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
-		entry->eax = 0;
-		entry->ecx = F(RDPID);
-		++array->nent;
-	default:
+		entry.flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+		entry.eax = 0;
+		entry.ecx = F(RDPID);
 		break;
+	default:
+		goto out;
 	}
 
+	if (array->nent >= array->maxnent)
+		return -E2BIG;
+
+	memcpy(&array->entries[array->nent++], &entry, sizeof(entry));
+
+out:
 	return 0;
 }
 
-- 
2.30.2

