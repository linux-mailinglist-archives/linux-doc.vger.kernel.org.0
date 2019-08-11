Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6950D894A5
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2019 00:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfHKWLf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 11 Aug 2019 18:11:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42065 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfHKWLe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Aug 2019 18:11:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id i30so43300pfk.9
        for <linux-doc@vger.kernel.org>; Sun, 11 Aug 2019 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kegUaQhH1NdMe3t6o5OANPxzXkbHQxn9BuZ0TfmzAU=;
        b=t0+nutC8qLWyX4diz234fSW3j0q8DJ2Ojb/HLeuzs6/vjy/hNCFm1uuGD1gee/xvTY
         FO0sGQJn9LxIqqYmrx4XspDRTzNPyiug6M3xGM37LHQ6JzDiBibqGi6BHPVGg1edZqj1
         6wel7OcLXZlGKZIdQhNYXcNprjq27yOLrgFyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kegUaQhH1NdMe3t6o5OANPxzXkbHQxn9BuZ0TfmzAU=;
        b=HISYVRDC/slOg6DhAhUUtWU9XIEkuWlm95zft8/eJq9b2oit7QOh5ilE7FOm5MqPl2
         Ufc12xz3uukEnjXx9082PKBEowBBO1NKgfVcqxGXxFaDvEcjFo5IgPdgtYleIfOjgxzv
         Hn7ww0FSADJ+pPg1irnWkm1a6f2+Y+RGw8WbhqChGzqGBHdPrb84K94YCHRS5qdGv3PO
         w+nra2Q/S+HHt44SYclDOXeTistxQ3Q4Ttut7IHV+5cpeqSxB+OdkGF1Q2PQHBTxsy2X
         blqhaAVCrJlvrhWyj84BIsh/zvz6j69KtcIY9HqydFZTFFJyHPp0xlMKx+ohzDUO4fn1
         Z3lg==
X-Gm-Message-State: APjAAAXf4RgeMIwII3ANoy0OgYVM3KJPTsDcuIQn95BABZK9GsTvw7Xq
        5HCdvXLy5H8ielmmZPTnxS0VTQ==
X-Google-Smtp-Source: APXvYqzxOGU+kMZtej1bkrVYNiZUGwRmFwlMB28pTDrFdj62NfG83GLxpsdqNbhzSFv5Skcae4h3/w==
X-Received: by 2002:a65:6401:: with SMTP id a1mr27650830pgv.42.1565561493573;
        Sun, 11 Aug 2019 15:11:33 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id n10sm31376428pgv.67.2019.08.11.15.11.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 15:11:32 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        kbuild test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/3] driver/core: Fix build error when SRCU and lockdep disabled
Date:   Sun, 11 Aug 2019 18:11:11 -0400
Message-Id: <20190811221111.99401-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190811221111.99401-1-joel@joelfernandes.org>
References: <20190811221111.99401-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Properly check if lockdep lock checking is disabled at config time. If
so, then lock_is_held() is undefined so don't do any checking.

This fix is similar to the pattern used in srcu_read_lock_held().

Link: https://lore.kernel.org/lkml/201908080026.WSAFx14k%25lkp@intel.com/
Fixes: c9e4d3a2fee8 ("acpi: Use built-in RCU list checking for acpi_ioremaps list")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
This patch is based on the -rcu dev branch.

 drivers/base/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 32cf83d1c744..fe25cf690562 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -99,7 +99,11 @@ void device_links_read_unlock(int not_used)
 
 int device_links_read_lock_held(void)
 {
-	return lock_is_held(&device_links_lock);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	return lock_is_held(&(device_links_lock.dep_map));
+#else
+	return 1;
+#endif
 }
 #endif /* !CONFIG_SRCU */
 
-- 
2.23.0.rc1.153.gdeed80330f-goog
