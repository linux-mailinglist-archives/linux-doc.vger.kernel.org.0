Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8FC894A3
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2019 00:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfHKWLc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 11 Aug 2019 18:11:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42447 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfHKWLc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Aug 2019 18:11:32 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so47181190plb.9
        for <linux-doc@vger.kernel.org>; Sun, 11 Aug 2019 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qG6w/v4rW/drGrqs6yUqiBqNPa9XU08YuLl86izhqNc=;
        b=LxPn+Le8eqzU5KKEY65t0GCxNFrE9AW+SNsvBueI+tBYps6fhuqMVAQa0A/nf/JXQb
         v2qAw5F974OED/j2g4yc/OB55GwuXvT2GH/5F0WpRwK8aTnFXinwvFNzG4mxlN+cbrhT
         vqRePySZk3eRMBcu6T24hZV+fwW8rugvLaZMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qG6w/v4rW/drGrqs6yUqiBqNPa9XU08YuLl86izhqNc=;
        b=ZG+0OAZrMz4GKsHy1QW7kP51HEAdX3JLq1u4ZC0RBzyXZMF+Fc9eDuCbxwxlJpCu17
         RXo3vMsTB2aKhhmUsdZvCAVh9sn/NIaf3HEtY99jSDTNrj9kPmAGNFzgViYTm3xFAsOR
         9UtLqHPpOORCMS3gHTSLUW8Wo++2IvA/q/NuIpRMh8pRafFtSz3bSGIfiEV+bgkV6fwX
         +PwX4b0NvAHXlxHbD8H22/VInUkemwFJdXDKw5/BCSMv1NG9Le6hl3xGTiFdk+Mk7+p6
         Ysr1L9Rm/Ku7W78V/mopY12QTO0/h6aREwbwsBAvwoLN04gB0rgvDUe9aY7/wGxy/GsT
         mByw==
X-Gm-Message-State: APjAAAVt7whBV7wxA2a5C54tu6ZcXNVVgUT1DAd6qOfzl4asSwoDg/ED
        goXePVij8F7ihfXQ1MWCa7LRkJzoP2s=
X-Google-Smtp-Source: APXvYqz7AGfV2NJYXMolpML3Fs4JLGqvL7P3yYvhZ8O12EtndIT/TOTdXQUNnsEKVAL/HHKJmrNROg==
X-Received: by 2002:a17:902:5983:: with SMTP id p3mr20650916pli.232.1565561491275;
        Sun, 11 Aug 2019 15:11:31 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id n10sm31376428pgv.67.2019.08.11.15.11.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 15:11:30 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/3] doc: Update documentation about list_for_each_entry_rcu (v1)
Date:   Sun, 11 Aug 2019 18:11:10 -0400
Message-Id: <20190811221111.99401-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190811221111.99401-1-joel@joelfernandes.org>
References: <20190811221111.99401-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch updates the documentation with information about
usage of lockdep with list_for_each_entry_rcu().

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/RCU/lockdep.txt   | 15 +++++++++++----
 Documentation/RCU/whatisRCU.txt |  9 ++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.txt
index da51d3068850..3d967df3a801 100644
--- a/Documentation/RCU/lockdep.txt
+++ b/Documentation/RCU/lockdep.txt
@@ -96,7 +96,14 @@ other flavors of rcu_dereference().  On the other hand, it is illegal
 to use rcu_dereference_protected() if either the RCU-protected pointer
 or the RCU-protected data that it points to can change concurrently.
 
-There are currently only "universal" versions of the rcu_assign_pointer()
-and RCU list-/tree-traversal primitives, which do not (yet) check for
-being in an RCU read-side critical section.  In the future, separate
-versions of these primitives might be created.
+Similar to rcu_dereference_protected, The RCU list and hlist traversal
+primitives also check for whether there are called from within a reader
+section. However, an optional lockdep expression can be passed to them as
+the last argument in case they are called under other non-RCU protection.
+
+For example, the workqueue for_each_pwq() macro is implemented as follows.
+It is safe to call for_each_pwq() outside a reader section but under protection
+of wq->mutex:
+#define for_each_pwq(pwq, wq)
+	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,
+				lock_is_held(&(wq->mutex).dep_map))
diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index 17f48319ee16..cdd2a3e10e40 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -290,7 +290,7 @@ rcu_dereference()
 	at any time, including immediately after the rcu_dereference().
 	And, again like rcu_assign_pointer(), rcu_dereference() is
 	typically used indirectly, via the _rcu list-manipulation
-	primitives, such as list_for_each_entry_rcu().
+	primitives, such as list_for_each_entry_rcu() [2].
 
 	[1] The variant rcu_dereference_protected() can be used outside
 	of an RCU read-side critical section as long as the usage is
@@ -305,6 +305,13 @@ rcu_dereference()
 	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
 	and the API's code comments for more details and example usage.
 
+	[2] In case the list_for_each_entry_rcu() primitive is intended
+	to be used outside of an RCU reader section such as when
+	protected by a lock, then an additional lockdep expression can be
+	passed as the last argument to it so that RCU lockdep checking code
+	knows that the dereference of the list pointers are safe. If the
+	indicated protection is not provided, a lockdep splat is emitted.
+
 The following diagram shows how each API communicates among the
 reader, updater, and reclaimer.
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

