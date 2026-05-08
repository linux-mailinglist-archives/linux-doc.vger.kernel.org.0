Return-Path: <linux-doc+bounces-86459-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGtrD1z9/WkdlgAAu9opvQ
	(envelope-from <linux-doc+bounces-86459-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:12:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8E4F868C
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23CAA30AE0A6
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4B740B6E0;
	Fri,  8 May 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhX1tcTX"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B47E401A11
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252628; cv=none; b=W0U308d8hEdSqpD+J2JP8LIZeZlRE5/XiktV8AWr6354SzSG8sGeBbvqzLGGQ8t4sG0NKdtrbkOW0DQ6sF1cJ9QS9UwJ7BPxIaZVYLxQFZI6UoS7pv8Zc27Ji5C5b0f64K1LxeZwBvmLbBwm4HiTblsZydeKsQkem8vSlVrygto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252628; c=relaxed/simple;
	bh=95rnVbuPoEqYoOgOEmXgRRLmt/DgdbJJ5HiCjeQHGDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEyVupjTdhC006zdrwJaU3urkaqeCzMJ2ID8pl1xejHxImMkBQM8KujseDGtrUyCGKrqRzPG5x4dov8e9P7ZicZXRqWDqbNh5CJ0wzcMbtRlAQIU29L26KT0EJhMuF054GZdaHmtGZsZPLT52Hu7m/ena9RMmy/Z6oMHYOkaYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhX1tcTX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778252625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmxOVGUrnxS/H09zubyapT22aA5Jy+w6JF95xU/Ftgg=;
	b=DhX1tcTX2soL2C97LHroz7jTdJXTzC2z6zsACNnFlvKjlg7lp/QTvmVGrInpDty8Rm2K25
	+++K9YyXI6WQ3zGGEmMCa8viS+GememUEKiKw6duZ1YJPbyb1tTJ5Y2REHZtbrgR/LZMPB
	T8BW4En969kg6z7jfDUEm0HHoOvzK4g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-iS7UFWwSOQ6ATgQIY2aB7w-1; Fri,
 08 May 2026 11:03:39 -0400
X-MC-Unique: iS7UFWwSOQ6ATgQIY2aB7w-1
X-Mimecast-MFC-AGG-ID: iS7UFWwSOQ6ATgQIY2aB7w_1778252612
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 412AD1955F56;
	Fri,  8 May 2026 15:03:32 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A3551800347;
	Fri,  8 May 2026 15:03:24 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 08 May 2026 17:02:48 +0200
Subject: [PATCH v9 4/4] kunit: Add documentation for warning backtrace
 suppression API
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-kunit_add_support-v9-4-99df7aa880f6@redhat.com>
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
In-Reply-To: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778252571; l=2728;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=YX7AMC4Z3qCvd9o2GGoQ6LMsoUJS/dulVvDsXv5Qzg4=;
 b=O8GAE+hb0obKMFu0966wbJ+cfY19Wpbym+fXH6s7bOO7dYWHfLHG5XXWIpqXGRKKa/TQnhg+q
 h6jrH8Z3iA1BMBe58q+Vr1SlKcH+06z/ZRxopUzfcImr+dmdwYcQvPe
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Queue-Id: 9BD8E4F868C
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
	TAGGED_FROM(0.00)[bounces-86459-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,roeck-us.net:email,davidgow.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Action: no action

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 46 ++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index ebd06f5ea4550..1c78dfff94e8a 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,50 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as a side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Backtraces can be suppressed with **task-scoped suppression**: while
+suppression is active on the current task, the backtrace and stack dump from
+``WARN*()``, ``WARN_ON*()``, and related macros on that task are suppressed.
+Two API forms are available.
+
+- Scoped suppression is the simplest form. Wrap the code that triggers
+  warnings in a ``kunit_warning_suppress()`` block:
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		kunit_warning_suppress(test) {
+			trigger_backtrace();
+			KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+		}
+	}
+
+.. note::
+   The warning count must be checked inside the block; the suppression handle
+   is not accessible after the block exits.
+
+- Direct functions return an explicit handle pointer. Use them when the handle
+  needs to be retained or passed across helper functions:
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		struct kunit_suppressed_warning *w;
+
+		w = kunit_start_suppress_warning(test);
+		trigger_backtrace();
+		kunit_end_suppress_warning(test, w);
+
+		KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(w), 1);
+	}
 
 Test Suites
 ~~~~~~~~~~~
@@ -1211,4 +1255,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}

-- 
2.53.0


