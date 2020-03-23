Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6F218EDC2
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2020 02:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCWB5n (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 22 Mar 2020 21:57:43 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38142 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCWB5n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Mar 2020 21:57:43 -0400
Received: by mail-qt1-f195.google.com with SMTP id z12so10464499qtq.5
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2020 18:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh3ZQXA8/fcOyDAMpc+/YELK5mbWwAuzgrwXdRovqek=;
        b=gs956uThpOltmLqXIt+nbE6Rhd0UEn0Ql4aR97Sadj6fmyYgxDFKl5q0OnMA0As6Y2
         om2Ms+zMVB53ikwKASnQLtWL8thktq+a43aCcCVn63aCzaGCoW/Ldc8384u/p7fGFpHm
         tdo13KND88UkOwMF33F8znWrk3CgJ+gxz9C/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh3ZQXA8/fcOyDAMpc+/YELK5mbWwAuzgrwXdRovqek=;
        b=SUZvAseNVK5lbmL9FWdHs1jdjjN4fbFH+hvR+b7UBBI2IGe3xyRDqW7yUOZWB8DPvO
         8he+IeYkH0eQ9VHEDzy9K/sRqCdltYe+gXk3iTjfk6CT1zKd0RQyC8LpElPafahHONlv
         Fk1RgHupPvS3NOI02bpZIMBUkn9vGP4aLg3bTpVY9Fr71ZeQpiqLMK7S4Ids5i892DYl
         2scZisWngjqNnsrPL7bICzdkX3DMGsOOr9E4FNCON355GPZ+7m1g2+IVlVyuBb3DVYlC
         SbylIdHTxC2OmRMhN0MOiX1iJ30S8z7m/s+sHWg5D3BqH2NIZ4jp96sUYglKZnww7IMP
         +m0Q==
X-Gm-Message-State: ANhLgQ3AOCszvmX0fEB1vUvt8uaXUA24/yroC2w0swi9Yplu/BVtUff4
        VCwi9Ao0oRJkqw07yMwUdsiLzg==
X-Google-Smtp-Source: ADFU+vttwBXstjGSt67NWuAcSW4ytpix/Zaxhp/bLD8Z3vcH09O+jTp5grPQNOP1R2gYu15wDLhhrg==
X-Received: by 2002:ac8:5159:: with SMTP id h25mr19800618qtn.165.1584928661954;
        Sun, 22 Mar 2020 18:57:41 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id e66sm10146233qkd.129.2020.03.22.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 18:57:41 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        vpillai@digitalocean.com, Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/4] Documentation: LKMM: Move MP+onceassign+derefonce to new litmus-tests/rcu/
Date:   Sun, 22 Mar 2020 21:57:32 -0400
Message-Id: <20200323015735.236279-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move MP+onceassign+derefonce to the new Documentation/litmus-tests/rcu/
directory.

More RCU-related litmus tests would be added here.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

---
Cc: vpillai@digitalocean.com

 Documentation/litmus-tests/README                        | 9 +++++++++
 .../litmus-tests/rcu}/MP+onceassign+derefonce.litmus     | 0
 tools/memory-model/litmus-tests/README                   | 3 ---
 3 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/litmus-tests/README
 rename {tools/memory-model/litmus-tests => Documentation/litmus-tests/rcu}/MP+onceassign+derefonce.litmus (100%)

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
new file mode 100644
index 0000000000000..84208bc197f2e
--- /dev/null
+++ b/Documentation/litmus-tests/README
@@ -0,0 +1,9 @@
+============
+LITMUS TESTS
+============
+
+RCU (/rcu directory)
+--------------------
+MP+onceassign+derefonce.litmus
+    Demonstrates that rcu_assign_pointer() and rcu_dereference() to
+    ensure that an RCU reader will not see pre-initialization garbage.
diff --git a/tools/memory-model/litmus-tests/MP+onceassign+derefonce.litmus b/Documentation/litmus-tests/rcu/MP+onceassign+derefonce.litmus
similarity index 100%
rename from tools/memory-model/litmus-tests/MP+onceassign+derefonce.litmus
rename to Documentation/litmus-tests/rcu/MP+onceassign+derefonce.litmus
diff --git a/tools/memory-model/litmus-tests/README b/tools/memory-model/litmus-tests/README
index 681f9067fa9ed..79e1b1ed4929a 100644
--- a/tools/memory-model/litmus-tests/README
+++ b/tools/memory-model/litmus-tests/README
@@ -63,9 +63,6 @@ LB+poonceonces.litmus
 	As above, but with store-release replaced with WRITE_ONCE()
 	and load-acquire replaced with READ_ONCE().
 
-MP+onceassign+derefonce.litmus
-	As below, but with rcu_assign_pointer() and an rcu_dereference().
-
 MP+polockmbonce+poacquiresilsil.litmus
 	Protect the access with a lock and an smp_mb__after_spinlock()
 	in one process, and use an acquire load followed by a pair of
-- 
2.25.1.696.g5e7596f4ac-goog
