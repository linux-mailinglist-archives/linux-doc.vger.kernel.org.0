Return-Path: <linux-doc+bounces-87296-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEEvM94pBGrfEwIAu9opvQ
	(envelope-from <linux-doc+bounces-87296-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:35:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF052EBAB
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 395EE30F8D80
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142B12F8EA2;
	Wed, 13 May 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWoRN60Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C453921C8
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657500; cv=none; b=GMqumVLRBUfvhIKIJFhb+iuhBzhvK8nQZbFhMiWPVb/7vhITEfIV7pv1yr9DFtcaLQv7nDL5vj/1JiU6nIXeW8iCwHMHeMbFfhytuNmbpCSsb2lkuLW48B5RRVjmFnntTK7ZRnOu467flA1mrfVULjjLKuxDVKYjSE8UJuPEyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657500; c=relaxed/simple;
	bh=UdDNp/rZ6vQhEQdmic3p8fT3qCRgHWAzDMWbvOTKb7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ioEZoNlVGZgpjGNdFNd9epAXLuiaEeXKV/v81weGm3qCAcyFviqW/S+CQtwOpmxXoFv7+E3nYs+6MLERaMoflicwoqBnaEVtfuH4RQOA2tUQuL0L1Um8jfVRS05zJ/OLcuvjxZOPYSbK1mQCZhJBPAxU2QQnb2Mqvs6SRQbaaaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWoRN60Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778657497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8g+T3Fd3RsAcVqlhPRxG2Gloc847TIYb6WdWrnabljA=;
	b=LWoRN60YIlqZnkkFeN07+igxtkr6BNj75VSiMjLNBCbjIHfZuPVHbn1UfXOfywMykYh8mj
	wY1HuPqJXrBH6bw1/V9yKd7KNgmOR1Si3qua/x7ve5SWm0vZj8IAEyO8WP0ApJgI37SvJj
	BgpS5XYdEHNsVQ91RDq2a8Ss47NuYwE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-RelXNKljOlelMOoUKhi5ig-1; Wed,
 13 May 2026 03:31:31 -0400
X-MC-Unique: RelXNKljOlelMOoUKhi5ig-1
X-Mimecast-MFC-AGG-ID: RelXNKljOlelMOoUKhi5ig_1778657488
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF6251956067;
	Wed, 13 May 2026 07:31:26 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88B711800357;
	Wed, 13 May 2026 07:31:18 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 May 2026 09:30:52 +0200
Subject: [PATCH v10 2/4] kunit: Add backtrace suppression self-tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-kunit_add_support-v10-2-e379d206c8cd@redhat.com>
References: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
In-Reply-To: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Dan Carpenter <error27@gmail.com>, 
 Kees Cook <kees@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778657458; l=7747;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=kqjK2MmFsTq4vYrdbc+U1KENx4eJmmI/6buw5ghWjhI=;
 b=JOvGAgyNihlsiY26cpeuq2DQU48XXr7VOFYS086OpJ1M3TLnYLfxz6Aso9aCMQrkSMhx22Luj
 ByrG2N7Sq3rD8sDE215DFSF+S8i+u4Ecou05HvyvMjiZayHrL5mChvX
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Queue-Id: 71FF052EBAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,googlegroups.com,lists.freedesktop.org,lists.infradead.org,infradead.org,roeck-us.net,linaro.org,redhat.com,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-87296-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,linux-foundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,davidgow.net:email,roeck-us.net:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Guenter Roeck <linux@roeck-us.net>

Add unit tests to verify that warning backtrace suppression works.

Tests cover both API forms:
- Scoped: kunit_warning_suppress() with in-block count verification
  and post-block inactivity check.
- Direct functions: kunit_start/end_suppress_warning() with
  sequential independent suppression blocks and per-block counts.

Furthermore, tests verify incremental warning counting, that
kunit_has_active_suppress_warning() transitions correctly around
suppression boundaries, and that suppression active in the test
kthread does not leak to a separate kthread.

If backtrace suppression does _not_ work, the unit tests will likely
trigger unsuppressed backtraces, which should actually help to get
the affected architectures / platforms fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 lib/kunit/Makefile                     |   1 +
 lib/kunit/backtrace-suppression-test.c | 196 +++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 4592f9d0aa8dd..2e8a6b71a2ab0 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -22,6 +22,7 @@ obj-$(if $(CONFIG_KUNIT),y) +=		hooks.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 obj-$(CONFIG_KUNIT_TEST) +=		platform-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		backtrace-suppression-test.o
 
 # string-stream-test compiles built-in only.
 ifeq ($(CONFIG_KUNIT_TEST),y)
diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
new file mode 100644
index 0000000000000..831a60f3521fa
--- /dev/null
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for suppressing warning tracebacks.
+ *
+ * Copyright (C) 2024, Guenter Roeck
+ * Author: Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/test.h>
+#include <linux/bug.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+
+static void backtrace_suppression_test_warn_direct(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		WARN(1, "This backtrace should be suppressed");
+		/*
+		 * Count must be checked inside the scope; the handle
+		 * is not accessible after the block exits.
+		 */
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+}
+
+static noinline void trigger_backtrace_warn(void)
+{
+	WARN(1, "This backtrace should be suppressed");
+}
+
+static void backtrace_suppression_test_warn_indirect(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		trigger_backtrace_warn();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static void backtrace_suppression_test_warn_multi(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		WARN(1, "This backtrace should be suppressed");
+		trigger_backtrace_warn();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+	}
+}
+
+static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KALLSYMS))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CONFIG_KALLSYMS");
+
+	kunit_warning_suppress(test) {
+		WARN_ON(1);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static noinline void trigger_backtrace_warn_on(void)
+{
+	WARN_ON(1);
+}
+
+static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	kunit_warning_suppress(test) {
+		trigger_backtrace_warn_on();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static void backtrace_suppression_test_count(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		WARN(1, "suppressed");
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+
+		WARN(1, "suppressed again");
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+	}
+}
+
+static void backtrace_suppression_test_active_state(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning());
+	}
+
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning());
+	}
+
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+}
+
+static void backtrace_suppression_test_multi_scope(struct kunit *test)
+{
+	struct kunit_suppressed_warning *sw1, *sw2;
+
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	sw1 = kunit_start_suppress_warning(test);
+	trigger_backtrace_warn_on();
+	WARN(1, "suppressed by sw1");
+	kunit_end_suppress_warning(test, sw1);
+
+	sw2 = kunit_start_suppress_warning(test);
+	WARN(1, "suppressed by sw2");
+	kunit_end_suppress_warning(test, sw2);
+
+	KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw1), 2);
+	KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw2), 1);
+}
+
+struct cross_kthread_data {
+	bool was_active;
+	struct completion done;
+};
+
+static int cross_kthread_fn(void *data)
+{
+	struct cross_kthread_data *d = data;
+
+	d->was_active = kunit_has_active_suppress_warning();
+	complete(&d->done);
+	return 0;
+}
+
+static void backtrace_suppression_test_cross_kthread(struct kunit *test)
+{
+	struct cross_kthread_data data;
+	struct task_struct *task;
+
+	data.was_active = false;
+	init_completion(&data.done);
+
+	kunit_warning_suppress(test) {
+		task = kthread_run(cross_kthread_fn, &data, "kunit-cross-test");
+		KUNIT_ASSERT_FALSE(test, IS_ERR(task));
+		wait_for_completion(&data.done);
+		kthread_stop(task);
+	}
+
+	KUNIT_EXPECT_FALSE(test, data.was_active);
+}
+
+static struct kunit_case backtrace_suppression_test_cases[] = {
+	KUNIT_CASE(backtrace_suppression_test_warn_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_indirect),
+	KUNIT_CASE(backtrace_suppression_test_warn_multi),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
+	KUNIT_CASE(backtrace_suppression_test_count),
+	KUNIT_CASE(backtrace_suppression_test_active_state),
+	KUNIT_CASE(backtrace_suppression_test_multi_scope),
+	KUNIT_CASE(backtrace_suppression_test_cross_kthread),
+	{}
+};
+
+static struct kunit_suite backtrace_suppression_test_suite = {
+	.name = "backtrace-suppression-test",
+	.test_cases = backtrace_suppression_test_cases,
+};
+kunit_test_suites(&backtrace_suppression_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");

-- 
2.53.0


