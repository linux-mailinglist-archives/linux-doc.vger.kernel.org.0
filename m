Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECBE7B61D
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2019 01:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfG3XKt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Jul 2019 19:10:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45144 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfG3XKs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 19:10:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so30806355pgp.12
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 16:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7mywSbAHxVxyqmLjmbYJ/3lWcj0F5fJfkfm01klhqg=;
        b=lQcY7dUcN9sfrHeU1bFTJAHcVurLMAgvCstWvK34/8GqZXAZ6Dtv2OV/jRBD6kB1gA
         xJqdnmpdiMu2nEoc5Kj9+sWjDdS08nuLFA7jSZ1JrrwBvv72chl+gh3NyFe3lpHZ2EEJ
         wzy9O47UL/NevQVxhDQNmTaf+D/0eoEfSaflI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7mywSbAHxVxyqmLjmbYJ/3lWcj0F5fJfkfm01klhqg=;
        b=JYQe2zLboRLTq5Qy0Fc/VTNrH9wTuv7/5YmEXvgh6iKtsI9qdutuiUSXsDGuXWZq7z
         yg5OHttumw4yKTdzpFvFdgedT3W1irYaejewjrd3mhinlZidverZPMdsUIDZmY3Q4CWg
         PWRBRPTJLDFci9jlaMbSycgXIhvrTLsS7f/H7/WX3jfHMc6oOGPoSOyPkfPJBdd0IoyF
         pMnezeoZSGAwKic9ig1pNaZn2y/k3SLnR5ZeKGSQwvS8vszWN8LVlYzm/2tNXScMcw11
         ROeCXo21MH7/9E3W6S+rOSYYcvNsW7feqFo8cVNSz7Kzf3CcC4NzKVVzChD0mzDWmt3l
         KkYQ==
X-Gm-Message-State: APjAAAVzg1S55gxlihqMUkXHhVdxQq7gUkLbKFPHcobeB2SO+XHrPdr+
        ZcCsUFQNzVg6nR9Vwnv0ric=
X-Google-Smtp-Source: APXvYqw96pfFrJ1aUKvTJ2W9p2le9IzCwR1aMyKApw9iJDFRJ3SkaZLtozMlBc/rNAk+sNbig/EhwQ==
X-Received: by 2002:a65:4108:: with SMTP id w8mr12297370pgp.263.1564528247709;
        Tue, 30 Jul 2019 16:10:47 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a3sm75205576pje.3.2019.07.30.16.10.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 16:10:47 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 2/3] docs: rcu: Correct links referring to titles
Date:   Tue, 30 Jul 2019 19:10:29 -0400
Message-Id: <20190730231030.27510-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730231030.27510-1-joel@joelfernandes.org>
References: <20190730231030.27510-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro's auto conversion broken these links, fix them.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../Tree-RCU-Memory-Ordering.rst              | 17 ++--
 .../RCU/Design/Requirements/Requirements.rst  | 90 ++++++++-----------
 2 files changed, 47 insertions(+), 60 deletions(-)

diff --git a/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst b/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst
index 1011b5db1b3d..248b1222f918 100644
--- a/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst
+++ b/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst
@@ -230,15 +230,14 @@ Tree RCU Grace Period Memory Ordering Components
 Tree RCU's grace-period memory-ordering guarantee is provided by a
 number of RCU components:
 
-#. `Callback Registry <#Callback%20Registry>`__
-#. `Grace-Period Initialization <#Grace-Period%20Initialization>`__
-#. `Self-Reported Quiescent
-   States <#Self-Reported%20Quiescent%20States>`__
-#. `Dynamic Tick Interface <#Dynamic%20Tick%20Interface>`__
-#. `CPU-Hotplug Interface <#CPU-Hotplug%20Interface>`__
-#. `Forcing Quiescent States <Forcing%20Quiescent%20States>`__
-#. `Grace-Period Cleanup <Grace-Period%20Cleanup>`__
-#. `Callback Invocation <Callback%20Invocation>`__
+#. `Callback Registry`_
+#. `Grace-Period Initialization`_
+#. `Self-Reported Quiescent States`_
+#. `Dynamic Tick Interface`_
+#. `CPU-Hotplug Interface`_
+#. `Forcing Quiescent States`_
+#. `Grace-Period Cleanup`_
+#. `Callback Invocation`_
 
 Each of the following section looks at the corresponding component in
 detail.
diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 876e0038bb58..a33b5fb331b4 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -36,16 +36,14 @@ technologies in interesting new ways.
 All that aside, here are the categories of currently known RCU
 requirements:
 
-#. `Fundamental Requirements <#Fundamental%20Requirements>`__
-#. `Fundamental Non-Requirements <#Fundamental%20Non-Requirements>`__
-#. `Parallelism Facts of Life <#Parallelism%20Facts%20of%20Life>`__
-#. `Quality-of-Implementation
-   Requirements <#Quality-of-Implementation%20Requirements>`__
-#. `Linux Kernel Complications <#Linux%20Kernel%20Complications>`__
-#. `Software-Engineering
-   Requirements <#Software-Engineering%20Requirements>`__
-#. `Other RCU Flavors <#Other%20RCU%20Flavors>`__
-#. `Possible Future Changes <#Possible%20Future%20Changes>`__
+#. `Fundamental Requirements`_
+#. `Fundamental Non-Requirements`_
+#. `Parallelism Facts of Life`_
+#. `Quality-of-Implementation Requirements`_
+#. `Linux Kernel Complications`_
+#. `Software-Engineering Requirements`_
+#. `Other RCU Flavors`_
+#. `Possible Future Changes`_
 
 This is followed by a `summary <#Summary>`__, however, the answers to
 each quick quiz immediately follows the quiz. Select the big white space
@@ -57,13 +55,11 @@ Fundamental Requirements
 RCU's fundamental requirements are the closest thing RCU has to hard
 mathematical requirements. These are:
 
-#. `Grace-Period Guarantee <#Grace-Period%20Guarantee>`__
-#. `Publish-Subscribe Guarantee <#Publish-Subscribe%20Guarantee>`__
-#. `Memory-Barrier Guarantees <#Memory-Barrier%20Guarantees>`__
-#. `RCU Primitives Guaranteed to Execute
-   Unconditionally <#RCU%20Primitives%20Guaranteed%20to%20Execute%20Unconditionally>`__
-#. `Guaranteed Read-to-Write
-   Upgrade <#Guaranteed%20Read-to-Write%20Upgrade>`__
+#. `Grace-Period Guarantee`_
+#. `Publish/Subscribe Guarantee`_
+#. `Memory-Barrier Guarantees`_
+#. `RCU Primitives Guaranteed to Execute Unconditionally`_
+#. `Guaranteed Read-to-Write Upgrade`_
 
 Grace-Period Guarantee
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -689,16 +685,11 @@ infinitely long, however, the following sections list a few
 non-guarantees that have caused confusion. Except where otherwise noted,
 these non-guarantees were premeditated.
 
-#. `Readers Impose Minimal
-   Ordering <#Readers%20Impose%20Minimal%20Ordering>`__
-#. `Readers Do Not Exclude
-   Updaters <#Readers%20Do%20Not%20Exclude%20Updaters>`__
-#. `Updaters Only Wait For Old
-   Readers <#Updaters%20Only%20Wait%20For%20Old%20Readers>`__
-#. `Grace Periods Don't Partition Read-Side Critical
-   Sections <#Grace%20Periods%20Don't%20Partition%20Read-Side%20Critical%20Sections>`__
-#. `Read-Side Critical Sections Don't Partition Grace
-   Periods <#Read-Side%20Critical%20Sections%20Don't%20Partition%20Grace%20Periods>`__
+#. `Readers Impose Minimal Ordering`_
+#. `Readers Do Not Exclude Updaters`_
+#. `Updaters Only Wait For Old Readers`_
+#. `Grace Periods Don't Partition Read-Side Critical Sections`_
+#. `Read-Side Critical Sections Don't Partition Grace Periods`_
 
 Readers Impose Minimal Ordering
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -1056,11 +1047,11 @@ it would likely be subject to limitations that would make it
 inappropriate for industrial-strength production use. Classes of
 quality-of-implementation requirements are as follows:
 
-#. `Specialization <#Specialization>`__
-#. `Performance and Scalability <#Performance%20and%20Scalability>`__
-#. `Forward Progress <#Forward%20Progress>`__
-#. `Composability <#Composability>`__
-#. `Corner Cases <#Corner%20Cases>`__
+#. `Specialization`_
+#. `Performance and Scalability`_
+#. `Forward Progress`_
+#. `Composability`_
+#. `Corner Cases`_
 
 These classes is covered in the following sections.
 
@@ -1692,21 +1683,18 @@ The Linux kernel provides an interesting environment for all kinds of
 software, including RCU. Some of the relevant points of interest are as
 follows:
 
-#. `Configuration <#Configuration>`__.
-#. `Firmware Interface <#Firmware%20Interface>`__.
-#. `Early Boot <#Early%20Boot>`__.
-#. `Interrupts and non-maskable interrupts
-   (NMIs) <#Interrupts%20and%20NMIs>`__.
-#. `Loadable Modules <#Loadable%20Modules>`__.
-#. `Hotplug CPU <#Hotplug%20CPU>`__.
-#. `Scheduler and RCU <#Scheduler%20and%20RCU>`__.
-#. `Tracing and RCU <#Tracing%20and%20RCU>`__.
-#. `Energy Efficiency <#Energy%20Efficiency>`__.
-#. `Scheduling-Clock Interrupts and
-   RCU <#Scheduling-Clock%20Interrupts%20and%20RCU>`__.
-#. `Memory Efficiency <#Memory%20Efficiency>`__.
-#. `Performance, Scalability, Response Time, and
-   Reliability <#Performance,%20Scalability,%20Response%20Time,%20and%20Reliability>`__.
+#. `Configuration`_
+#. `Firmware Interface`_
+#. `Early Boot`_
+#. `Interrupts and NMIs`_
+#. `Loadable Modules`_
+#. `Hotplug CPU`_
+#. `Scheduler and RCU`_
+#. `Tracing and RCU`_
+#. `Energy Efficiency`_
+#. `Scheduling-Clock Interrupts and RCU`_
+#. `Memory Efficiency`_
+#. `Performance, Scalability, Response Time, and Reliability`_
 
 This list is probably incomplete, but it does give a feel for the most
 notable Linux-kernel complications. Each of the following sections
@@ -2344,10 +2332,10 @@ implementations, non-preemptible and preemptible. The other four flavors
 are listed below, with requirements for each described in a separate
 section.
 
-#. `Bottom-Half Flavor (Historical) <#Bottom-Half%20Flavor>`__
-#. `Sched Flavor (Historical) <#Sched%20Flavor>`__
-#. `Sleepable RCU <#Sleepable%20RCU>`__
-#. `Tasks RCU <#Tasks%20RCU>`__
+#. `Bottom-Half Flavor (Historical)`_
+#. `Sched Flavor (Historical)`_
+#. `Sleepable RCU`_
+#. `Tasks RCU`_
 
 Bottom-Half Flavor (Historical)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.22.0.709.g102302147b-goog

