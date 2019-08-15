Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB4F18EE08
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2019 16:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732716AbfHOOTB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Aug 2019 10:19:01 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35166 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731822AbfHOOTB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 10:19:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so1371067pgv.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xHwKm8HU3q3V9jOcCOxz3QIpICO4VC7m+Bg5pvHvR/8=;
        b=n+vpNnhllYsoCBxgI8bpa+HnIzEk7ROuZfCtOCHEn9nJva0VnoGx9Gtfg5mdOvej3H
         P3kqrj4y0VHVe1Ym3LDwmtBQAoxCWpMqaucc+4GUkB1xi2ZoFDwtli84tRlUzIO5snpE
         JnElfwTl8XI85HGkouh22H8Ec+SzjUEvNpx7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xHwKm8HU3q3V9jOcCOxz3QIpICO4VC7m+Bg5pvHvR/8=;
        b=ZWHX4NIE4xxiEmVDeKva4hODAJPtFMkcPM4oe0SFTkDjA0LAWajzD4f3AjM2UzLxL8
         0PWOo48Ld9u2V5O1Y5jBI78HpxhJjMO6MjTpTDRPgTz9mpEfwvsax5d1LceR7xdkn7rD
         9jhBN3ZQ1SeUhnaYNUMj3Bz8zB9Z1vGParlUGiJ7reuRnyCx21K0+hgLbzy4hRX7Oq5Q
         5ZCH1Xi/6XgS/s6RGediQMmF+QeTrneo9X0BzrYYCJRO3jvYB63OYE+5RvqwWJcpFzz9
         cIbL7PAqsIzRoTqDfymtOvt9EyuZAAHfQbDy3P9V5+m9uxNI0MtfpXfz9EUwKBgijL/X
         MNiQ==
X-Gm-Message-State: APjAAAVpLRV6jDgPR9f/MGpJaPGhIvdnCT4gLQoRintxf8fQI/L3Hlbg
        UhKZYxLbjsZu6fAyeJhGYmEDZg==
X-Google-Smtp-Source: APXvYqyvueiXtP/1RWkJ8cKdfFAsmWmUTpLvlaIhQojpDz/MLXh4GvQ4dy4bBUgvRWSloBq2vKdMLw==
X-Received: by 2002:a65:6114:: with SMTP id z20mr3717267pgu.141.1565878740431;
        Thu, 15 Aug 2019 07:19:00 -0700 (PDT)
Received: from localhost ([172.19.216.18])
        by smtp.gmail.com with ESMTPSA id e9sm3164834pfh.155.2019.08.15.07.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 07:18:59 -0700 (PDT)
Date:   Thu, 15 Aug 2019 10:18:42 -0400
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
Subject: [PATCH v3 -rcu] workqueue: Convert for_each_wq to use built-in list
 check
Message-ID: <20190815141842.GB20599@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

list_for_each_entry_rcu now has support to check for RCU reader sections
as well as lock. Just use the support in it, instead of explicitly
checking in the caller.

Acked-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
v1->v3: Changed lock_is_held() to lockdep_is_held()

 kernel/workqueue.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 601d61150b65..e882477ebf6e 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -364,11 +364,6 @@ static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
 			 !lockdep_is_held(&wq_pool_mutex),		\
 			 "RCU or wq_pool_mutex should be held")
 
-#define assert_rcu_or_wq_mutex(wq)					\
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held() &&			\
-			 !lockdep_is_held(&wq->mutex),			\
-			 "RCU or wq->mutex should be held")
-
 #define assert_rcu_or_wq_mutex_or_pool_mutex(wq)			\
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held() &&			\
 			 !lockdep_is_held(&wq->mutex) &&		\
@@ -425,9 +420,8 @@ static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
  * ignored.
  */
 #define for_each_pwq(pwq, wq)						\
-	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node)		\
-		if (({ assert_rcu_or_wq_mutex(wq); false; })) { }	\
-		else
+	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,		\
+				 lockdep_is_held(&(wq->mutex)))
 
 #ifdef CONFIG_DEBUG_OBJECTS_WORK
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

