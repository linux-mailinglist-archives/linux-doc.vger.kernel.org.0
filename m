Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7820742242B
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 13:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbhJELCA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 07:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234387AbhJELBt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:01:49 -0400
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74BCC061755
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 03:59:58 -0700 (PDT)
Received: by mail-wm1-x349.google.com with SMTP id y23-20020a05600c365700b003015b277f98so923247wmq.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8oN1Tye/sfpVxOoza0f1n5GzdtTeuegmg43uvYtdPIg=;
        b=JR+7ySSAMEpVVTM6D2YKngKa55UUG1VVZQnyRxXIyzXpzoQNrVnKws9O6c14cXxPwd
         INzUT4hbmUIZKpi/WwWkbvlBLP3f6RJ5sb4NKLOjGuW/HYy6T641SHN9h1zbgCuD7oYE
         80xrasUK/KIw88sVd48bY+UtIi0HACEexOxFhdW/QYxL0sgz51eAxG1F6rhB2duP2kS3
         AyXSGkUVQuwNUtXc6OB0F8lOBPqeTTAtqSv/bg6+JyxEHwfmQuUrZAwiS73926J4xrGP
         m/QvobQGvrhCojz9NZ4rux+arbUnUXzgp3RSeNgCjKRaFJWFGXvb0zMeuxHLqpfYZOsX
         tA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8oN1Tye/sfpVxOoza0f1n5GzdtTeuegmg43uvYtdPIg=;
        b=zLvnAbgNnknMzVvg7hlOe53v91fctutM6Pq3ybP+iEsmjfCy6Chp4j2+RJvh0/4SrW
         EzInbo9MYzPzxVsv/t+lOrAFhp2SCBkXZ6xh9vDQOPicaSZdVDhWRXjAguEeioitx7Sq
         jptrrJ4zu3ymofrs+YYl1OBWgt52CwF+XxxuJGIePV75TuyANwHuB8LPCDwxqtnZzyYM
         +odR+TxZ547IOsWs5Bu236IEEaIhBzCV6ERK3PcfF2W+ZiT7M/iEarH8tWl6Q/BtxgqA
         6e85Jr00yJCH4WUCVOtQvEd3qiN/8+Ze4Bo9TV0CSTwx7lL4y/tsqg7RcvBHKEjYMJrF
         mfLA==
X-Gm-Message-State: AOAM530AboVYhKewjR8he0um5Vv0MGg6Rn5dPTmso+8pwXBAyswjsUsr
        HDnmO5kv9bMuOYdSOwnEc1Zhp8G6oA==
X-Google-Smtp-Source: ABdhPJy7sDB39VOxOxsRAKuuX8CFXz7P4SVeWe0jzLrvHE/6h7oC9R7eAIwMkt4fHa1OL+Wfu4H07SBgjw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:600c:3b26:: with SMTP id
 m38mr553969wms.0.1633431596812; Tue, 05 Oct 2021 03:59:56 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:48 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-7-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 06/23] kcsan, kbuild: Add option for barrier
 instrumentation only
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Source files that disable KCSAN via KCSAN_SANITIZE := n, remove all
instrumentation, including explicit barrier instrumentation. With
instrumentation for memory barriers, in few places it is required to
enable just the explicit instrumentation for memory barriers to avoid
false positives.

Providing the Makefile variable KCSAN_INSTRUMENT_BARRIERS_obj.o or
KCSAN_INSTRUMENT_BARRIERS (for all files) set to 'y' only enables the
explicit barrier instrumentation.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/Makefile.lib | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 54582673fc1a..2118f63b2bc5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -182,6 +182,11 @@ ifeq ($(CONFIG_KCSAN),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCSAN_SANITIZE_$(basetarget).o)$(KCSAN_SANITIZE)y), \
 	$(CFLAGS_KCSAN))
+# Some uninstrumented files provide implied barriers required to avoid false
+# positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
+_c_flags += $(if $(patsubst n%,, \
+	$(KCSAN_INSTRUMENT_BARRIERS_$(basetarget).o)$(KCSAN_INSTRUMENT_BARRIERS)n), \
+	-D__KCSAN_INSTRUMENT_BARRIERS__)
 endif
 
 # $(srctree)/$(src) for including checkin headers from generated source files
-- 
2.33.0.800.g4c38ced690-goog

