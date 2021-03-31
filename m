Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5DE34E046
	for <lists+linux-doc@lfdr.de>; Tue, 30 Mar 2021 06:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhC3Emm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Mar 2021 00:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhC3EmT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Mar 2021 00:42:19 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AD3C0613D8
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 21:42:19 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id h17so968146pjz.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 21:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZG5QUoyChvalUArlsvwS9b7o5aZFFyWCCkEpBVXhtkU=;
        b=T1kmeXfP5qGSZ6kep4Ip7I39cg7FJgeB41AxNkyrCF1cJOe35DF0q4XjnSJgpguGuy
         MIoPDeLDnLnIJW92Cs5ZAcj34Gq5hVBp9CMY0asY9O9KXi8o7g1giMP0E+N45eZbeAcI
         r/cVavsl8GOUfUmhABHZ72n+l3pqapmOQyqs7EL31QmWDr0rbfxsXUBlbg/DmsKC/Fg6
         OmTWkIykKglteesDu67g4eIeqmQaVa+LnyNv27knRfRh97w7A4Oa43EUO/IyQESpep+m
         aHhc9lCqpU01mrSoMpZPtkljauQYWkiFbo1Zb29x3QJyFgN3T40x0t2dxtlR0+s3dlK0
         xrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZG5QUoyChvalUArlsvwS9b7o5aZFFyWCCkEpBVXhtkU=;
        b=GoHU8KNHOhoy6W9qYuRTYmS6Bcf/cq/Q2hE3PZ+xwoUgMVexvs3nLn+D0B7YgS/5br
         RbCXZljF3uFaPaMUgscu1p+OeJEKBd4vXPbVOBaCzSLT8vhMk8xHZq8s98+5T/WZb/jz
         aRmCbu188twIPzxvS4mynuzNCTfO9Bl3aSXNM2WQSSHfQKxQe7onBfIGNdnx3zfQGxd2
         42aOxaC68c6I1zsplxC+6FL7KWw1nSbxhCFnjBJ5T6VRfQJz+jw3zKt+hMc7dLT6PJn/
         ITBzlOt/j0yaivXlcrE+tLTc4sl+IjHZP22Gsvp35DqS6xCE9AUraNJ2dWzbZG6E2gS0
         q0nA==
X-Gm-Message-State: AOAM5336MmzNHfOTwiJYDXcD5/wdaPmFF87y0kIZEi57XZqgzaQg+PPL
        5+DMuAoJnHptFts0GS0dAt5oUX/yGBYt
X-Google-Smtp-Source: ABdhPJyekf3wulIGw97YjVoI8Z+G8BnfjhcUpxO8+ab5IRYZYFOwbJfdnKTZ083dq+vAlt+uvRkuF7UUfTy7
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:8048:6a12:bd4f:a453])
 (user=vipinsh job=sendgmr) by 2002:a17:90b:2304:: with SMTP id
 mt4mr2545123pjb.179.1617079338730; Mon, 29 Mar 2021 21:42:18 -0700 (PDT)
Date:   Mon, 29 Mar 2021 21:42:05 -0700
In-Reply-To: <20210330044206.2864329-1-vipinsh@google.com>
Message-Id: <20210330044206.2864329-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20210330044206.2864329-1-vipinsh@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v4 2/3] cgroup: Miscellaneous cgroup documentation.
From:   Vipin Sharma <vipinsh@google.com>
To:     tj@kernel.org, mkoutny@suse.com, jacob.jun.pan@intel.com,
        rdunlap@infradead.org, thomas.lendacky@amd.com,
        brijesh.singh@amd.com, jon.grimm@amd.com, eric.vantassell@amd.com,
        pbonzini@redhat.com, hannes@cmpxchg.org, frankja@linux.ibm.com,
        borntraeger@de.ibm.com
Cc:     corbet@lwn.net, seanjc@google.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        gingell@google.com, rientjes@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation of miscellaneous cgroup controller. This new controller is
used to track and limit the usage of scalar resources.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: David Rientjes <rientjes@google.com>
---
 Documentation/admin-guide/cgroup-v1/index.rst |  1 +
 Documentation/admin-guide/cgroup-v1/misc.rst  |  4 +
 Documentation/admin-guide/cgroup-v2.rst       | 73 ++++++++++++++++++-
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/misc.rst

diff --git a/Documentation/admin-guide/cgroup-v1/index.rst b/Documentation/admin-guide/cgroup-v1/index.rst
index 226f64473e8e..99fbc8a64ba9 100644
--- a/Documentation/admin-guide/cgroup-v1/index.rst
+++ b/Documentation/admin-guide/cgroup-v1/index.rst
@@ -17,6 +17,7 @@ Control Groups version 1
     hugetlb
     memcg_test
     memory
+    misc
     net_cls
     net_prio
     pids
diff --git a/Documentation/admin-guide/cgroup-v1/misc.rst b/Documentation/admin-guide/cgroup-v1/misc.rst
new file mode 100644
index 000000000000..661614c24df3
--- /dev/null
+++ b/Documentation/admin-guide/cgroup-v1/misc.rst
@@ -0,0 +1,4 @@
+===============
+Misc controller
+===============
+Please refer "Misc" documentation in Documentation/admin-guide/cgroup-v2.rst
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 64c62b979f2f..b1e81aa8598a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -65,8 +65,11 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
        5-7-1. RDMA Interface Files
      5-8. HugeTLB
        5.8-1. HugeTLB Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-9. Misc
+       5.9-1 Miscellaneous cgroup Interface Files
+       5.9-2 Migration and Ownership
+     5-10. Others
+       5-10-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2171,6 +2174,72 @@ HugeTLB Interface Files
 Misc
 ----
 
+The Miscellaneous cgroup provides the resource limiting and tracking
+mechanism for the scalar resources which cannot be abstracted like the other
+cgroup resources. Controller is enabled by the CONFIG_CGROUP_MISC config
+option.
+
+A resource can be added to the controller via enum misc_res_type{} in the
+include/linux/misc_cgroup.h file and the corresponding name via misc_res_name[]
+in the kernel/cgroup/misc.c file. Provider of the resource must set its
+capacity prior to using the resource by calling misc_cg_set_capacity().
+
+Once a capacity is set then the resource usage can be updated using charge and
+uncharge APIs. All of the APIs to interact with misc controller are in
+include/linux/misc_cgroup.h.
+
+Misc Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+Miscellaneous controller provides 3 interface files. If two misc resources (res_a and res_b) are registered then:
+
+  misc.capacity
+        A read-only flat-keyed file shown only in the root cgroup.  It shows
+        miscellaneous scalar resources available on the platform along with
+        their quantities::
+
+	  $ cat misc.capacity
+	  res_a 50
+	  res_b 10
+
+  misc.current
+        A read-only flat-keyed file shown in the non-root cgroups.  It shows
+        the current usage of the resources in the cgroup and its children.::
+
+	  $ cat misc.current
+	  res_a 3
+	  res_b 0
+
+  misc.max
+        A read-write flat-keyed file shown in the non root cgroups. Allowed
+        maximum usage of the resources in the cgroup and its children.::
+
+	  $ cat misc.max
+	  res_a max
+	  res_b 4
+
+	Limit can be set by::
+
+	  # echo res_a 1 > misc.max
+
+	Limit can be set to max by::
+
+	  # echo res_a max > misc.max
+
+        Limits can be set higher than the capacity value in the misc.capacity
+        file.
+
+Migration and Ownership
+~~~~~~~~~~~~~~~~~~~~~~~
+
+A miscellaneous scalar resource is charged to the cgroup in which it is used
+first, and stays charged to that cgroup until that resource is freed. Migrating
+a process to a different cgroup does not move the charge to the destination
+cgroup where the process has moved.
+
+Others
+------
+
 perf_event
 ~~~~~~~~~~
 
-- 
2.31.0.291.g576ba9dcdaf-goog

