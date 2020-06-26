Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FA420BB12
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 23:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgFZVKB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 17:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgFZVJq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 17:09:46 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A784C08C5E2
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:45 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a205so853952ybg.8
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
        b=hXaHccpsp6kZobMdGnxlDV/X7Kry+BeRbEJjo6PSv+TzhSxzNCAbiEQxcpvIu0jQ8L
         aIB48XrQDZ+QiNiXbv0Tr0hmWU0EQYlwTua6pAg7QhnNvNSxDK0ocJXkRunQ2sD015bM
         oWId+r5Af1n9pl4fkKr5IibcQmAmR4apAJ4uZIU8WR1sYqDviwkes3rwyCeWthb9zehf
         XV/5kHzyY6hTubQkZzHttS+P5N1PNpPDj/TZK4Qtvt0SowvIJbhPF2AgJuVdUA0ZlY6e
         4wzcP9dl+iDa2j5rL0VHxTcew55IqQf2LoFk8FR/CBkw5YHjzH7caV82jF3Q9TVQuEgb
         +SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
        b=cjEEHRIO2obWEnoQQeOMbUEKeAe1uEEbR22HHRWV1hoLnRoMd+6RO9bFvBCHbYz78A
         DbTckYdRizmGeMjuWnkNsbhTT919xSLd8fL9mU1pw9m1prijBgbOIG4yjXWYjPYrxLbc
         K19YNIiIBa58cWagPajYy1R6vMDPul/k/vW0WjLQQIdy7A010a59zQ4/a6FOIx+YY4J1
         7YNT3XCreTHTL1b0+TTcdAD00US99EAnnCeBjfKnGtHXnaZvfmVKipC7UchhCrehCySH
         XSq1OZJdij9L9eq+HyJizxvCohLDqQywqkxSRszsb3eTdGaHUN7dnLYHjar/jeFa2i27
         BK9w==
X-Gm-Message-State: AOAM531cHgSQ9WGmQfFg1+UZAgavN0GjXwWhXU0o9Ad48REljg9cJrhK
        m3R44TBhh1o6g0b8J1CUC7J1Ib40/l/0niPrkee/hg==
X-Google-Smtp-Source: ABdhPJzEx7RjdPZqzXf9CzhVsQsR591I98jh+msGVdJdnK9Tt6s9k9B5//bn8b4L1M37+n0TvUsc2u0v5Nr7S59GV+16hQ==
X-Received: by 2002:a25:c5c3:: with SMTP id v186mr7751497ybe.233.1593205784533;
 Fri, 26 Jun 2020 14:09:44 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:09:16 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-12-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 11/12] Documentation: Add kunit_shutdown to kernel-parameters.txt
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        monstr@monstr.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kunit_shutdown, an option to specify that the kernel shutsdown after
running KUnit tests, to the kernel-parameters.txt documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79a..e7d5eb7249e7f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2183,6 +2183,14 @@
 			0: force disabled
 			1: force enabled
 
+	kunit_shutdown=[KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
+			running built-in tests. Tests configured as modules will
+			not be run.
+			Default:	(flag not present) don't shutdown
+			poweroff:	poweroff the kernel after running tests
+			halt:		halt the kernel after running tests
+			reboot:		reboot the kernel after running tests
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
-- 
2.27.0.212.ge8ba1cc988-goog

