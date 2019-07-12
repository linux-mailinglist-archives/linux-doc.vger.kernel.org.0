Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 117EB673CF
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2019 19:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfGLRB1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Jul 2019 13:01:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43549 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfGLRBD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Jul 2019 13:01:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so5028516plb.10
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2019 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTBxLnGTenFE9+XP/mevxUw30LYF4J7nnGDQ6rB2fzk=;
        b=fH07jTqwL/hokqkrMKxzQmVSmNEeTNgVHxfUizZdRWuBLIdHp5EDtLX/oQGfOUzzsf
         cDeYRZzLJ7URL9QGlidpTqtiuUDkDdsc8U0Ap/nNRn7DDBs7v08P0les+ltErgSJDWbI
         nJW++gazD0MQx1M+9W1UojWsmaovMnp4hpbhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTBxLnGTenFE9+XP/mevxUw30LYF4J7nnGDQ6rB2fzk=;
        b=spqEFrVy38K/TgJZIbCiYYXHlqSpRbwc+t0hJzGg27Q2U8gvhb0axRSFoYaEiH3T/Q
         pbHcPPaIu4lwHAJiN1Yljnf1/8RKVMaOzKtG7dfCt/P+Nxzqv7saP5ZHeq5jq6fdEZ9N
         HTCEyJlW4gwkUhOt2EBEjHa2EdigIfr23bZbYMlMtyM8wZ7Wvhc6aGcLEhFRk6tAapyk
         98Rh5XwqF9pPd2B3bwbTJtEBTIUSF6pO28ufZK2Xm8XeHMxisV6yjb/+lmaKceocxw5l
         Grkk0LomzrJTtVuHgY5vsoiKpxP4B+Oz3aJUGL0JV+neb9EQdLFmU984VK9F2o8FRAjt
         6HhQ==
X-Gm-Message-State: APjAAAVPP+sbsxCdBrwCH53/inRwLeUqJFz6fpGDe4WfXV6t8vILwYac
        DHYQG1pH5JLaPL+6H7gqXRg=
X-Google-Smtp-Source: APXvYqw5wjurKNbjLpkDIEgUNPsvw0lxvJGcBLec2mqxF+Z/PtTQcYyk2askr8FOnsLa9DqxCfYLnA==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr12539402plc.2.1562950863174;
        Fri, 12 Jul 2019 10:01:03 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a15sm7127385pgw.3.2019.07.12.10.00.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 10:01:02 -0700 (PDT)
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
Subject: [PATCH v2 7/9] x86/pci: Pass lockdep condition to pcm_mmcfg_list iterator
Date:   Fri, 12 Jul 2019 13:00:22 -0400
Message-Id: <20190712170024.111093-8-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190712170024.111093-1-joel@joelfernandes.org>
References: <20190712170024.111093-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pcm_mmcfg_list is traversed with list_for_each_entry_rcu without a
reader-lock held, because the pci_mmcfg_lock is already held. Make this
known to the list macro so that it fixes new lockdep warnings that
trigger due to lockdep checks added to list_for_each_entry_rcu().

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 arch/x86/pci/mmconfig-shared.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/pci/mmconfig-shared.c b/arch/x86/pci/mmconfig-shared.c
index 7389db538c30..6fa42e9c4e6f 100644
--- a/arch/x86/pci/mmconfig-shared.c
+++ b/arch/x86/pci/mmconfig-shared.c
@@ -29,6 +29,7 @@
 static bool pci_mmcfg_running_state;
 static bool pci_mmcfg_arch_init_failed;
 static DEFINE_MUTEX(pci_mmcfg_lock);
+#define pci_mmcfg_lock_held() lock_is_held(&(pci_mmcfg_lock).dep_map)
 
 LIST_HEAD(pci_mmcfg_list);
 
@@ -54,7 +55,7 @@ static void list_add_sorted(struct pci_mmcfg_region *new)
 	struct pci_mmcfg_region *cfg;
 
 	/* keep list sorted by segment and starting bus number */
-	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list) {
+	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list, pci_mmcfg_lock_held()) {
 		if (cfg->segment > new->segment ||
 		    (cfg->segment == new->segment &&
 		     cfg->start_bus >= new->start_bus)) {
@@ -118,7 +119,7 @@ struct pci_mmcfg_region *pci_mmconfig_lookup(int segment, int bus)
 {
 	struct pci_mmcfg_region *cfg;
 
-	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list)
+	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list, pci_mmcfg_lock_held())
 		if (cfg->segment == segment &&
 		    cfg->start_bus <= bus && bus <= cfg->end_bus)
 			return cfg;
-- 
2.22.0.510.g264f2c817a-goog

