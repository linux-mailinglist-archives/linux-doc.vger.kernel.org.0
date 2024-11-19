Return-Path: <linux-doc+bounces-31126-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 507ED9D29DB
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 16:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 114F9282358
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34C11D0BA6;
	Tue, 19 Nov 2024 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8wm+rAF"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382631CF7D0
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030656; cv=none; b=VDrjcf5Y0a12OyAz66Wn8UyakfoWeiHd/ABqsKZz47AeftgTCTZeVEQNAe+TbzuNeL6nREGlR/Zp59nT8S0uF8MB9e2hbkxjn4jnHRi51hqgJjKYJi1oX/gurhX+lZPwsA6bxhTb7CFgd5TQFtYYXsRbt4h0OtCcSVmDOMRVb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030656; c=relaxed/simple;
	bh=g4RPCjUX2beCsOhmA+cf1EgW2WlK56h+myfKo4lgSbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8QYU68r/nze/ZNiJqCaVkY90jO8sq+jIsyX+onFmp71nHIsgSF7lrzofAxmDz58FajFFVbBBezCSLCSF/jav9KnUE7ECTH4n0NZUfe8ndcLE3BEqQa4Q+cpEGBeZU3lgiGMRgCJds/yye5ErLgxurj65IWcxFxp19cZVOMQZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8wm+rAF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732030654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuJGo/SWDYxjpRhP1lHMjQsEt0PrcPcPyU5QylcJ498=;
	b=g8wm+rAFAbEDiTIYPcCun8k8GqqQUnzzQVRmLsvs0DKx/uYI2888R+7r/SOKbGkfYY99P9
	bSGeuNddAGRtIsJ29r3got4PP+hr0sMXbLzBmii2xmtrvRIrXO5jYu/ezkStCxktaqhSzF
	FxztOjlfG4SP0Uom9BeagJeF7S/N+n0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-4V10RU0zMVukkEJohwz2Cw-1; Tue,
 19 Nov 2024 10:37:32 -0500
X-MC-Unique: 4V10RU0zMVukkEJohwz2Cw-1
X-Mimecast-MFC-AGG-ID: 4V10RU0zMVukkEJohwz2Cw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4177119773FC;
	Tue, 19 Nov 2024 15:37:27 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.194.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 859B830001A0;
	Tue, 19 Nov 2024 15:37:12 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	x86@kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Song Liu <song@kernel.org>,
	Julian Pidancet <julian.pidancet@oracle.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [RFC PATCH v3 06/15] jump_label: Add forceful jump label type
Date: Tue, 19 Nov 2024 16:34:53 +0100
Message-ID: <20241119153502.41361-7-vschneid@redhat.com>
In-Reply-To: <20241119153502.41361-1-vschneid@redhat.com>
References: <20241119153502.41361-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Later commits will cause objtool to warn about non __ro_after_init static
keys being used in .noinstr sections in order to safely defer instruction
patching IPIs targeted at NOHZ_FULL CPUs.

Two such keys currently exist: mds_idle_clear and __sched_clock_stable,
which can both be modified at runtime.

As discussed at LPC 2024 during the realtime micro-conference, modifying
these specific keys incurs additional interference (SMT hotplug) or can
even be downright incompatible with NOHZ_FULL (unstable TSC).

Suppressing the IPI associated with modifying such keys is thus a minor
concern wrt NOHZ_FULL interference, so add a jump type that will be
leveraged by both the kernel (to know not to defer the IPI) and objtool (to
know not to generate the aforementioned warning).

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/linux/jump_label.h | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
index f5a2727ca4a9a..93e729545b941 100644
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@ -200,7 +200,8 @@ struct module;
 #define JUMP_TYPE_FALSE		0UL
 #define JUMP_TYPE_TRUE		1UL
 #define JUMP_TYPE_LINKED	2UL
-#define JUMP_TYPE_MASK		3UL
+#define JUMP_TYPE_FORCEFUL      4UL
+#define JUMP_TYPE_MASK		7UL
 
 static __always_inline bool static_key_false(struct static_key *key)
 {
@@ -244,12 +245,15 @@ extern enum jump_label_type jump_label_init_type(struct jump_entry *entry);
  * raw value, but have added a BUILD_BUG_ON() to catch any issues in
  * jump_label_init() see: kernel/jump_label.c.
  */
-#define STATIC_KEY_INIT_TRUE					\
-	{ .enabled = { 1 },					\
-	  { .type = JUMP_TYPE_TRUE } }
-#define STATIC_KEY_INIT_FALSE					\
-	{ .enabled = { 0 },					\
-	  { .type = JUMP_TYPE_FALSE } }
+#define __STATIC_KEY_INIT(_true, force)					\
+	{ .enabled = { _true },						\
+	  { .type = (_true ? JUMP_TYPE_TRUE : JUMP_TYPE_FALSE) |	\
+		    (force ? JUMP_TYPE_FORCEFUL : 0UL)} }
+
+#define STATIC_KEY_INIT_TRUE  __STATIC_KEY_INIT(true, false)
+#define STATIC_KEY_INIT_FALSE __STATIC_KEY_INIT(false, false)
+#define STATIC_KEY_INIT_TRUE_FORCE  __STATIC_KEY_INIT(true, true)
+#define STATIC_KEY_INIT_FALSE_FORCE __STATIC_KEY_INIT(false, true)
 
 #else  /* !CONFIG_JUMP_LABEL */
 
@@ -369,6 +373,8 @@ struct static_key_false {
 
 #define STATIC_KEY_TRUE_INIT  (struct static_key_true) { .key = STATIC_KEY_INIT_TRUE,  }
 #define STATIC_KEY_FALSE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE, }
+#define STATIC_KEY_TRUE_FORCE_INIT  (struct static_key_true) { .key = STATIC_KEY_INIT_TRUE_FORCE,  }
+#define STATIC_KEY_FALSE_FORCE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE_FORCE, }
 
 #define DEFINE_STATIC_KEY_TRUE(name)	\
 	struct static_key_true name = STATIC_KEY_TRUE_INIT
@@ -376,6 +382,9 @@ struct static_key_false {
 #define DEFINE_STATIC_KEY_TRUE_RO(name)	\
 	struct static_key_true name __ro_after_init = STATIC_KEY_TRUE_INIT
 
+#define DEFINE_STATIC_KEY_TRUE_FORCE(name)	\
+	struct static_key_true name = STATIC_KEY_TRUE_FORCE_INIT
+
 #define DECLARE_STATIC_KEY_TRUE(name)	\
 	extern struct static_key_true name
 
@@ -385,6 +394,9 @@ struct static_key_false {
 #define DEFINE_STATIC_KEY_FALSE_RO(name)	\
 	struct static_key_false name __ro_after_init = STATIC_KEY_FALSE_INIT
 
+#define DEFINE_STATIC_KEY_FALSE_FORCE(name)	\
+	struct static_key_false name = STATIC_KEY_FALSE_FORCE_INIT
+
 #define DECLARE_STATIC_KEY_FALSE(name)	\
 	extern struct static_key_false name
 
-- 
2.43.0


