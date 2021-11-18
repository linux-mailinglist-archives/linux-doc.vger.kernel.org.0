Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B051F4556CB
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 09:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244430AbhKRISk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Nov 2021 03:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244545AbhKRIRs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:17:48 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C4FC0432C1
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:55 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id y10-20020adffa4a000000b0017eea6cb05dso876513wrr.6
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PKWjAua1xn2U34SqPEegBKZB0S4U3BBHTPl/cM5EGNo=;
        b=Qq5HBBXgLOy+uTTK9h/vtf7TEvtzH6VyvHygGU2SLhqC+8vkW9T8o1VCD208Q3w+t1
         scyhlr8UQiTtjfFMGx6Pa0MUX0OoMhFYKvk2KoXHtPYZk2TkQDvtZPU5Y9rDQbMZUZUR
         9RwXiTztJ48SUHOegy+RtYw7+odGXvL5Q5GUvFE8eBmiSh54gtVgbtOAkz51b5MDPX5i
         1WOLBP6v9HjIxhTd6gDA75bB5J1Xt6LuJM4JC+Cf+Kgs40VYQdE6uMQRdi02AAY3W43N
         R4lw8Nv4E9PvzfhsIBIrFuSuCgsIdmoM0hnoLL3HQ9JXmqLL31tOAHurGrQ8eG/xf/L0
         9YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PKWjAua1xn2U34SqPEegBKZB0S4U3BBHTPl/cM5EGNo=;
        b=qDpnqSc2DROLAovbD72eec2m1n51BOGPFU68ABAqi5B30roMPrNKFwCDgHgrha7zHa
         7CkX/Y44Bcz2Y6kLTl+Ws7x1xNpqOXTSU66PemDafrwmHZBziDRZ+fgruXhkjw2xIbr1
         FbphLj39l+YFKwFZj8mF9ZpZeDeIcDOjbwixPacZJqwrceaSwvxT13e6CA6lY+2nRq/B
         ANDTbQrpUDm0EnF4LIrXUTlp+50jHEz48SHx8DLdtyRC8Z9b0M0o6q4c+9gHKY4vawYj
         Cv3VxrTrYEfybQmT7ZJeIgGdVsR8OJtkAe1YDaHl2hzFsW8vLonUb2tBhC6AI1AgOi0P
         XdOw==
X-Gm-Message-State: AOAM53226Moq7VgXOnXqpeh3vuPlxmfwRv165Nc+g7P4KeCGA3L6/4lq
        TZmWk10pIr2emfWXDqfqFMmozkuUfw==
X-Google-Smtp-Source: ABdhPJzKthNmbOLQqgVYxXXQxUry4DYDNrfOwiEu0wK+Vcy0l56yOF9N9EJA7PtQ3+5yoKs/cwhn9cVyaQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a1c:7715:: with SMTP id t21mr7647569wmi.183.1637223114521;
 Thu, 18 Nov 2021 00:11:54 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:27 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-24-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
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

Teach objtool to turn instrumentation required for memory barrier
modeling into nops in noinstr text.

The __tsan_func_entry/exit calls are still emitted by compilers even
with the __no_sanitize_thread attribute. The memory barrier
instrumentation will be inserted explicitly (without compiler help), and
thus needs to also explicitly be removed.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Rewrite after rebase to v5.16-rc1.
---
 tools/objtool/check.c               | 37 ++++++++++++++++++++++-------
 tools/objtool/include/objtool/elf.h |  2 +-
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 61dfb66b30b6..2b2587e5ec69 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1071,12 +1071,7 @@ static void annotate_call_site(struct objtool_file *file,
 		return;
 	}
 
-	/*
-	 * Many compilers cannot disable KCOV with a function attribute
-	 * so they need a little help, NOP out any KCOV calls from noinstr
-	 * text.
-	 */
-	if (insn->sec->noinstr && sym->kcov) {
+	if (insn->sec->noinstr && sym->removable_instr) {
 		if (reloc) {
 			reloc->type = R_NONE;
 			elf_write_reloc(file->elf, reloc);
@@ -1991,6 +1986,32 @@ static int read_intra_function_calls(struct objtool_file *file)
 	return 0;
 }
 
+static bool is_removable_instr(const char *name)
+{
+	/*
+	 * Many compilers cannot disable KCOV with a function attribute so they
+	 * need a little help, NOP out any KCOV calls from noinstr text.
+	 */
+	if (!strncmp(name, "__sanitizer_cov_", 16))
+		return true;
+
+	/*
+	 * Compilers currently do not remove __tsan_func_entry/exit with the
+	 * __no_sanitize_thread attribute, remove them.
+	 *
+	 * Memory barrier instrumentation is not emitted by the compiler, but
+	 * inserted explicitly, so we need to also remove them.
+	 */
+	if (!strncmp(name, "__tsan_func_", 12) ||
+	    !strcmp(name, "__kcsan_mb") ||
+	    !strcmp(name, "__kcsan_wmb") ||
+	    !strcmp(name, "__kcsan_rmb") ||
+	    !strcmp(name, "__kcsan_release"))
+		return true;
+
+	return false;
+}
+
 static int classify_symbols(struct objtool_file *file)
 {
 	struct section *sec;
@@ -2011,8 +2032,8 @@ static int classify_symbols(struct objtool_file *file)
 			if (!strcmp(func->name, "__fentry__"))
 				func->fentry = true;
 
-			if (!strncmp(func->name, "__sanitizer_cov_", 16))
-				func->kcov = true;
+			if (is_removable_instr(func->name))
+				func->removable_instr = true;
 		}
 	}
 
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index cdc739fa9a6f..62e790a09ad2 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -58,7 +58,7 @@ struct symbol {
 	u8 static_call_tramp : 1;
 	u8 retpoline_thunk   : 1;
 	u8 fentry            : 1;
-	u8 kcov              : 1;
+	u8 removable_instr   : 1;
 	struct list_head pv_target;
 };
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

