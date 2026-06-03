Return-Path: <linux-doc+bounces-90784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hducAulNIGrm0gAAu9opvQ
	(envelope-from <linux-doc+bounces-90784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 17:53:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEE6639722
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 17:53:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=UfnMU9x4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90784-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90784-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC4EC307C6DD
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 15:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB0F3D9DB9;
	Wed,  3 Jun 2026 15:46:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D83DD502
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:46:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501603; cv=none; b=gsnOh2PwTu7t8SJzMSHZPZEP9j874bVZY2Ip/1y19bB8cVCaDFPXnKHCexrIe9p1rtTvZVOagSb7mmNERmUvwNSPl+xlgZdhSBP3DvEM4dEsdBwZr/Emje5L0i65tsqpnNiaFttgLbZebk4ALBih8rAq49iZqt3riudSfa1aMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501603; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mp0egUy4gkvN62MssEp9AIVCZq/SQHqladD3FwOlfbEAB/ZrMP67hFfCAfZXqZt+/5+ABZNQ4TbL58L89XPXMOCvTouIkR70AACvKPi336RNUPbWyq/LZeBpBEWmrzYdyd0J93dmofWqEeMoFhTfvDZ+zq/Ywuceg2/y4+xWwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UfnMU9x4; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8cbe69b122bso124198606d6.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501598; x=1781106398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=UfnMU9x4HQ5qiHtFUE0lTFss8h/kLwIwM83j9GbTZhGvGXszQl8tr6XSAJY1tNAKlw
         Qj1G0CU3SJrnxCoUmRu6p7idE7BGqb7YKlchkUMwVRnw22z0d3QESJuxbP2ypf/u77vu
         RBvxBD8885JZf9GhT7X8H8WnQ9637cQIUNDlKvfzngK72pRBy4fryDXVv2hyEAWtFRU1
         IAtQfDrX0YGSZr2BHgW1t9gddbSUofKjyl1DfIKKugoWQKu+u5q1PH+I5USpNtniWECr
         oF7XJ71VAo2DubK9lgqpW4u2pNUm2egb5BUI4CgGO0oiKgUzKBv2WZ/HRQowF0u0snfs
         EnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501598; x=1781106398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=O265Xx5qEGI5WugC2o83XuZFVpjAZNRxEv3T3xHolAsfllVMZJZvQdwLAGm+LedsR6
         wTxNL6LfNxlkebCeJu/BFfPyCWXrPOn+FRZV/qHZYdVgWU9tg4NnbwYF4Ayj4CYOuED6
         hMYYToGtTMTI7Gg7bq1eioq4SCcvL2YVg/DoNJpAHkjhQlSHAQgDuBGhwxXeKTCJ5cRq
         JCpVXQavBeyitruueILt/yNaRww7ciw+lzH9jR9Rm1SoB6/3i2R0QtSFgVIBKFJCCIwJ
         pN5r4GzrnzYhmzKUKeqeQwxNFxMolyi+BwQMAQHtk2BZAmMbrUOcgVKO2KU98AKT4ETb
         ai3w==
X-Forwarded-Encrypted: i=1; AFNElJ8Sielsc8lOxz88gNqxHRyDG/0QOjo0HVd4p77aSF5tJnwTHUy+B7prWnxRXssTDSxxWVXyrjVnxHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y35xzmSmgWOH2E8awMVwafUcEnyUcH/QMn6Hu0Ih8NhMVJJP
	M9wo6cpanhr8VNeGLwHGa81HgIky+STOJ1ZKYvwGno6kntXZPgV7BMsl96IZFVieuvg=
X-Gm-Gg: Acq92OEklXjYFJDIeQFfOFa8Dehz5BuA3Ksg8LUDAyjim7LtB1qKzlJo+fgBjDKdfxw
	vQns7xrQ80FN2zrUP+RzeO+gUcrwwph4N6a8JM0z4h+iwBn4TmEUEve1+4GJfrscXw+wlEqLFlk
	5cibQRdobJQH81KaO19RAI0J7+tJUy8bCtR8Aim/Wf4kZP/M9aAEteIfhwTi6QBL+yE5gNqMIRq
	ffNbQeBeuHqTTChZ9fzvWHBTa/Z0Y0Zy/MNusqNLTdoMrc4bZZnXpiRCs5vZ7vCKQY+/qTvOLep
	drc2V2mn+edK+2/gOuroJ/IxTvYLIWXjmz0GY8RRcHXWOcm1jM5/dcd6P2zHfMpY2E5q1GD7PBJ
	WbttbK/IbIqMZXegy6hu/WX3uZ1VVE60EXV0cJslJooB4rkj3K3gBwkO70visdBzyrrmLOi26xQ
	DEqxpJYDzVFvUKMu/o1IDQjvTbgXxzUSTNXsIZpTeAal4HAkipcFNQ+hO3AXWo2bPhT4+AdE+E
X-Received: by 2002:a05:6214:dce:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8cecde9c8admr53195506d6.15.1780501598131;
        Wed, 03 Jun 2026 08:46:38 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277070sm22665326d6.48.2026.06.03.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:46:37 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Wed,  3 Jun 2026 15:44:02 +0000
Message-ID: <20260603154402.468928-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-90784-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:pasha.tatashin@soleen.com,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[soleen.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,do_kexec.sh:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,soleen.com:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AEE6639722

Add a new luo_stress_files kexec test that verifies preserving and
retrieving 500 files across a kexec reboot.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../selftests/liveupdate/luo_stress_files.c   | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index ed7534468386..30689d22cb02 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -7,6 +7,7 @@ TEST_GEN_PROGS += liveupdate
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
+TEST_GEN_PROGS_EXTENDED += luo_stress_files
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_stress_files.c b/tools/testing/selftests/liveupdate/luo_stress_files.c
new file mode 100644
index 000000000000..0cdf9cd4bac7
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Validate that LUO can handle a large number of files per session across
+ * a kexec reboot.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "luo_test_utils.h"
+
+#define NUM_FILES 500
+#define STATE_SESSION_NAME "kexec_many_files_state"
+#define STATE_MEMFD_TOKEN 9999
+#define TEST_SESSION_NAME "many_files_session"
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int session_fd, i;
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_create_session");
+
+	ksft_print_msg("[STAGE 1] Preserving %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		if (create_and_preserve_memfd(session_fd, i, data) < 0)
+			fail_exit("create_and_preserve_memfd for index %d", i);
+	}
+
+	ksft_print_msg("[STAGE 1] Successfully preserved %d files.\n", NUM_FILES);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int session_fd;
+	int i, stage;
+
+	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2) {
+		fail_exit("Expected stage 2, but state file contains %d",
+			  stage);
+	}
+
+	ksft_print_msg("[STAGE 2] Retrieving test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_retrieve_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_retrieve_session");
+
+	ksft_print_msg("[STAGE 2] Verifying %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+		int fd;
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		fd = restore_and_verify_memfd(session_fd, i, data);
+		if (fd < 0)
+			fail_exit("restore_and_verify_memfd for index %d", i);
+		close(fd);
+	}
+
+	ksft_print_msg("[STAGE 2] Finishing test session...\n");
+	if (luo_session_finish(session_fd) < 0)
+		fail_exit("luo_session_finish for test session");
+	close(session_fd);
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- MANY-FILES KEXEC TEST PASSED (%d files) ---\n",
+		       NUM_FILES);
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
-- 
2.53.0


