Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFF1354E90
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 10:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240241AbhDFI1X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 04:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25821 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240232AbhDFI1X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 04:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617697635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i9iBaLNrNdHy5Myw5Ru7jrMYIVd0xBvqef8GrfatpKg=;
        b=I8fzGi7hznPxmfVot544ynR6WqMpz/1ul/wm1zWp+pqQ+MePKPzgSvA1dmtnznridwJk0E
        L68AYTSYatalPvP5hdF/WbOO6q5JpV9ZL2d/KIlciMgEvG4LKkgMD0irFMhxgy6SYqabw6
        kS+yJ0ekX1q6l0ISEKlLuUJlqH/0Q8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Rw1bV6WmOlKOJQfKrQ7jkA-1; Tue, 06 Apr 2021 04:27:13 -0400
X-MC-Unique: Rw1bV6WmOlKOJQfKrQ7jkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33F10190A7A0;
        Tue,  6 Apr 2021 08:27:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com [10.36.114.253])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 202195D9D0;
        Tue,  6 Apr 2021 08:26:53 +0000 (UTC)
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
Subject: [PATCH v3 2/4] Documentation: KVM: update KVM_GET_EMULATED_CPUID ioctl description
Date:   Tue,  6 Apr 2021 10:26:40 +0200
Message-Id: <20210406082642.20115-3-eesposit@redhat.com>
In-Reply-To: <20210406082642.20115-1-eesposit@redhat.com>
References: <20210406082642.20115-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KVM_GET_EMULATED_CPUID returns -E2BIG if the nent field of
struct kvm_cpuid2 is smaller than the actual entries, while
it adjusts nent if the provided amount is bigger than the
actual amount.

Update documentation accordingly. ENOMEM is just returned if the
allocation fails, like all other calls.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 Documentation/virt/kvm/api.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 307f2fcf1b02..8ba23bc2a625 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3404,12 +3404,10 @@ which features are emulated by kvm instead of being present natively.
 
 Userspace invokes KVM_GET_EMULATED_CPUID by passing a kvm_cpuid2
 structure with the 'nent' field indicating the number of entries in
-the variable-size array 'entries'. If the number of entries is too low
-to describe the cpu capabilities, an error (E2BIG) is returned. If the
-number is too high, the 'nent' field is adjusted and an error (ENOMEM)
-is returned. If the number is just right, the 'nent' field is adjusted
-to the number of valid entries in the 'entries' array, which is then
-filled.
+the variable-size array 'entries'.
+If the number of entries is too low to describe the cpu
+capabilities, an error (E2BIG) is returned.  If the number is too high,
+the 'nent' field is adjusted and the entries array is filled.
 
 The entries returned are the set CPUID bits of the respective features
 which kvm emulates, as returned by the CPUID instruction, with unknown
-- 
2.30.2

