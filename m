Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB7C6937B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2019 16:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404447AbfGOOoa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jul 2019 10:44:30 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35044 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404699AbfGOOhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jul 2019 10:37:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id w24so8402632plp.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2019 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gvD5L3W4khYlR/j02/LMhetLZkkRNPQ8EPkwaYb/Yo=;
        b=WUpb9JKsXzIHcxew1wAVQiWwZ+kaf0Ww3b9i/phqeK6eGSyIkMrGlEABg1JgP/N6a7
         XI3TNv1vdpFEoUyT+MAAdsh6eiTQV1SZjNnbyXSh4bYq6H3Gz7K8UhzDuVF/rfbp1RTm
         xNeitgRKD2kv4LjyEJgK6S9GJGZvS2JWmOhuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gvD5L3W4khYlR/j02/LMhetLZkkRNPQ8EPkwaYb/Yo=;
        b=b6B4Ge8EB8Ggcy/RhBLGQeOP5X1RcPgervvAfYb/ghMrlox0nSSzwNrTZt4p4OITql
         Q9lKcgcI76gD+T2gNMzoz/a2aYmJWmlQs+FwKrpPvR0ll8ypmZIcUbu9I8ukbB6NtvIW
         uoOTBzSUogxY8FmyFns0EFySnboqn+JODsTIY4CF9On+KP7eBETfbqleDhVsbnVAchK2
         AUrUlJ+qQXtq8tCq4S3VacjZ277WXFItJBUon8pAr5mWdOUNrXKeraSkJkCHMQOit5vh
         yT1LZ3ZvijglLYUTO4Zww0bV60o4UNtUVlc5y9GcSHc2YGq1oI/BrZP8U2JU4OPTOnx/
         +y/g==
X-Gm-Message-State: APjAAAWHaXPeBJgbdX4oW8Tt6JyDWhb+sKvZbX4hOg6TwbUCBUGQDaOK
        nsWYXvImD74p29adwWE+R+o=
X-Google-Smtp-Source: APXvYqySJr0Y1QIzNUIj9NJwd+Rw22u3LGJjXHmBidac39lx3Xu00PxoUZgolCbZ3bk0iovIh+UXIw==
X-Received: by 2002:a17:902:1003:: with SMTP id b3mr29244590pla.172.1563201450419;
        Mon, 15 Jul 2019 07:37:30 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id s66sm18381852pfs.8.2019.07.15.07.37.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 07:37:29 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Borislav Petkov <bp@alien8.de>, c0d1n61at3@gmail.com,
        "David S. Miller" <davem@davemloft.net>, edumazet@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, keescook@chromium.org,
        kernel-hardening@lists.openwall.com, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        neilb@suse.com, netdev@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Pavel Machek <pavel@ucw.cz>, peterz@infradead.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        Tejun Heo <tj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, will@kernel.org,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH 4/9] ipv4: add lockdep condition to fix for_each_entry (v1)
Date:   Mon, 15 Jul 2019 10:37:00 -0400
Message-Id: <20190715143705.117908-5-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190715143705.117908-1-joel@joelfernandes.org>
References: <20190715143705.117908-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using the previous support added, use it for adding lockdep conditions
to list usage here.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 net/ipv4/fib_frontend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 317339cd7f03..26b0fb24e2c2 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -124,7 +124,8 @@ struct fib_table *fib_get_table(struct net *net, u32 id)
 	h = id & (FIB_TABLE_HASHSZ - 1);
 
 	head = &net->ipv4.fib_table_hash[h];
-	hlist_for_each_entry_rcu(tb, head, tb_hlist) {
+	hlist_for_each_entry_rcu(tb, head, tb_hlist,
+				 lockdep_rtnl_is_held()) {
 		if (tb->tb_id == id)
 			return tb;
 	}
-- 
2.22.0.510.g264f2c817a-goog

