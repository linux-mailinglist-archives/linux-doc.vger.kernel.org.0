Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8942675B489
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jul 2023 18:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjGTQfr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Jul 2023 12:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjGTQf0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 12:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9D8210B
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689870834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B/1vdVWCM4YknPYZ5ppPG1wK5UcqdOcCaaYb4tQPZDs=;
        b=KUDGCOaxX4xatYbGfRJrE6hXAQ7r4LUc8cupDGS1HPvWG3gtm6TG9bqXDeL6GXLbaxOUug
        TIBtOZRbsu1wyQouSQwvOEyQ8LeENtMHUjOEcjePrQthaFuGdhdu+KfVFFppf2WbrPJnsX
        DxyVtO49mK7RTJ3MoJ3401AxrjfO2GE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-yTDAMrF4N--Bk_WMn9tLGw-1; Thu, 20 Jul 2023 12:33:50 -0400
X-MC-Unique: yTDAMrF4N--Bk_WMn9tLGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A2A62812951;
        Thu, 20 Jul 2023 16:33:42 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.42.28.48])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C73540C206F;
        Thu, 20 Jul 2023 16:33:34 +0000 (UTC)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Zqiang <qiang.zhang1211@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Nadav Amit <namit@vmware.com>,
        Dan Carpenter <error27@gmail.com>,
        Chuang Wang <nashuiliang@gmail.com>,
        Yang Jihong <yangjihong1@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Song Liu <song@kernel.org>,
        Julian Pidancet <julian.pidancet@oracle.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Glaze <dionnaglaze@google.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Yair Podemsky <ypodemsk@redhat.com>
Subject: [RFC PATCH v2 13/20] context_tracking: Make context_tracking_key __ro_after_init
Date:   Thu, 20 Jul 2023 17:30:49 +0100
Message-Id: <20230720163056.2564824-14-vschneid@redhat.com>
In-Reply-To: <20230720163056.2564824-1-vschneid@redhat.com>
References: <20230720163056.2564824-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

objtool now warns about it:

  vmlinux.o: warning: objtool: enter_from_user_mode+0x4e: Non __ro_after_init static key "context_tracking_key" in .noinstr section
  vmlinux.o: warning: objtool: enter_from_user_mode+0x50: Non __ro_after_init static key "context_tracking_key" in .noinstr section
  vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x60: Non __ro_after_init static key "context_tracking_key" in .noinstr section
  vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x62: Non __ro_after_init static key "context_tracking_key" in .noinstr section
  [...]

The key can only be enabled (and not disabled) in the __init function
ct_cpu_tracker_user(), so mark it as __ro_after_init.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/context_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 6ef0b35fc28c5..cc4f3a57f848c 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -432,7 +432,7 @@ static __always_inline void ct_kernel_enter(bool user, int offset) { }
 #define CREATE_TRACE_POINTS
 #include <trace/events/context_tracking.h>
 
-DEFINE_STATIC_KEY_FALSE(context_tracking_key);
+DEFINE_STATIC_KEY_FALSE_RO(context_tracking_key);
 EXPORT_SYMBOL_GPL(context_tracking_key);
 
 static noinstr bool context_tracking_recursion_enter(void)
-- 
2.31.1

