Return-Path: <linux-doc+bounces-91029-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lmtmO8VDImrVUQEAu9opvQ
	(envelope-from <linux-doc+bounces-91029-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:34:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99030644E3A
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=fpwL7b4m;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91029-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91029-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFA9F301414F
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 03:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28963F0A9E;
	Fri,  5 Jun 2026 03:34:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2273BB139
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630465; cv=none; b=S0/8Rnq3slL3eaDoF6+HWpdujwpSfOjgqEuMhfSyzMz3dC0WlMqIa8Tu10HW6AZVfgB+FLH1mvK2zRARz65UpIWi8KNSkBbeyFgIC/gm3qoShe1VsDca8sXMAN02jU6lq0Mo4trfC+I1Gi/RR60KQP8wsaMFeceSNnQl/irleg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630465; c=relaxed/simple;
	bh=EryfO6BIhkEjNjxl4nuOnpJQVHpd6RmCotJcy7+BaGQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GY957zLnMCFkQAYvhuGx2Q5KaNBnkK6tqkt8WMI8MMQZLy7kA7lO8r6VAqYUQIvsdTAUuTHQpEXuPKhCQYCxcxDmoqTbCODtpBG5s4Ste0xSvCPhZutXyP0MPlWNt/JjlP3drwIrjuriEiQPQ7H3dLHQyW6KJ8CPbiEXH+7E7t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fpwL7b4m; arc=none smtp.client-ip=209.85.160.180
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51764768c36so20941931cf.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630463; x=1781235263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfxlNkzCx8TA3SebJdSu06wI/is0K0+hQNvlMemiJzs=;
        b=fpwL7b4mVbU5SWWgO7SMj/OjXxWa785AG4w3MSGrnRIBYHpNpz3QZRhK7EvOP96BzM
         89Ep7ecmEBt1skBHo3gW3OBBseh91kz75FC3z6aOVnx0utwLmcmRGHpzovaZxwrpLmBo
         +3nATnatQF4+QDE/0Wh8t09jaBDtHxVwboemJu7RofMpZhSmaF1TCgQFDZ7X4+MLwY1D
         sff4Uu1SBOVncw92VZ1WHAy8MlBj8k2NYg22YwjcZB0z2UdXZHPOLRD0JdpU7kGkzP59
         fnDVDYTeskdhJ8KVqWftlhEErYj4rMOwpsm6CfnPyACWhyN26ee/JAAebnslaGSmmUMw
         YchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630463; x=1781235263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rfxlNkzCx8TA3SebJdSu06wI/is0K0+hQNvlMemiJzs=;
        b=VNOUsvxvnilb6eNkmrFg0f3GYVPQcgYaiHUKp88d7UZCCPJLOerybJU2LagqDuQClC
         MU6a8ZrR9Gkqi3CNIJArBn4hR6Bshn78o4tqPlSyOcjmm/dPE7LUhMkZYzAHDEqLFbsc
         CEV22BtaZHPHpo/XsJPir/BDQH/6iFY+1cmezB5Y9Ybx/mC7mPnizDYhFr9kFNzHXjtv
         pmo8+Fl4cbcwK8yDqkrv5eZBXFoWJSp6R9reKLFq4x11s+z24tGl16bJA3OrEHpgGRsE
         iqYcPw4xFQeCidrtINC26aMKG5Qbnp185wQUtTWSvaSlcVzTiM3R/3KL6nYwACsz+LYm
         zdLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GzAG31ILTS2GEpYNWhJXnXY1A0eZJE0jv5+l0od1UjyVztosDo/GfU7FtzhoIibWAiyoDQRGw8+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLfERiW4EgnPC5LexVZpPsrl7BsH1UMYdA9+B6xCjl6n7VTjE
	jDPu799pkZKtoQXskwx9Rmevci+b3W2TxAxFyYY3guWo/ruVnZ3WR7bVDuyVazuoMYk=
X-Gm-Gg: Acq92OHgWlnEyBMoEQNysISN4iIl8ER5BCqhGiZ95mI5gMbwE5dsZycY7SbAY/phR2k
	v9y3oM2Nwmev1S49EA1QpYlknuZNK+xRLlp8Q+FQ5S0pdCGzB1bNiTd4azQlp4uuOxBep1wkqTB
	F433M1s3nZzz61cHZ26BGUoOx6ULhFOqb3N20byIU7b1x6Qopgxd8y2m2v+C8OvS7zvkJdEx39w
	+iIhllhCXyeNG5cAHT9F2mZpXB+X2mosTiQUOAa56D9gFzMvvZ3AOFNtKMVWD5NG0WrNxQK5f/I
	87lad9qOcukvjnCS+rhWZGbjs0SfV73O4tnl/T58Fwxpf42y85jgmtXoNJL0gPe2tpx+DgvMPuC
	BtshkRJ8D5MDDdSCM0W0f5S8KMyMPas5xT7Td41rb9o5J/8pYMtdPAynxpA73SyBtRnrD2ehj0r
	nJbqhCiIZXZCIEZth5r2I9MDhAbp/f4IYPR+5SHBlgqguVNUmkgWXWAOrcHYlBoA==
X-Received: by 2002:a05:622a:4106:b0:517:6665:2a9a with SMTP id d75a77b69052e-51795c920f2mr28080531cf.50.1780630463488;
        Thu, 04 Jun 2026 20:34:23 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775df4dd6sm67871381cf.27.2026.06.04.20.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:34:23 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 9/9] liveupdate: add KUnit test to verify alphabetical order of compatibility strings
Date: Fri,  5 Jun 2026 03:32:35 +0000
Message-ID: <20260605033235.717351-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-91029-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,soleen.com:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99030644E3A

Introduce a KUnit test suite to verify that composite compatibility
strings are formatted correctly, specifically ensuring that all KHO
sub-component compatibility strings are unique and strictly sorted
in alphabetical order.

Maintaining alphabetical order in composite compatibility strings
is required to guarantee consistent, predictable, and reproducible
compatibility string representation across different system configurations.

The test suite validates:
- KHO_FDT_COMPATIBLE (the root composite compatibility string)
- LUO_ABI_COMPATIBLE (the LUO composite compatibility string)
- MEMFD_LUO_FH_COMPATIBLE (the memfd file handler composite compatibility string)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/Kconfig                 | 15 ++++++
 kernel/liveupdate/Makefile                |  2 +
 kernel/liveupdate/liveupdate_test.c       | 56 +++++++++++++++++++++++
 tools/testing/selftests/liveupdate/config |  1 +
 4 files changed, 74 insertions(+)
 create mode 100644 kernel/liveupdate/liveupdate_test.c

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index c13af38ba23a..617a31dcee73 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -86,4 +86,19 @@ config LIVEUPDATE_MEMFD
 
 	  If unsure, say N.
 
+config LIVEUPDATE_KUNIT_TEST
+	tristate "KUnit tests for LUO and KHO" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on LIVEUPDATE
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for LUO and KHO. These tests verify that the
+	  composite KHO, LUO, and memfd compatibility strings remain unique
+	  and sorted alphabetically.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index b481e21a311a..5e0deb85e1b1 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -17,3 +17,5 @@ obj-$(CONFIG_KEXEC_HANDOVER_DEBUG)	+= kexec_handover_debug.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
+obj-$(CONFIG_LIVEUPDATE_KUNIT_TEST)		+= liveupdate_test.o
+
diff --git a/kernel/liveupdate/liveupdate_test.c b/kernel/liveupdate/liveupdate_test.c
new file mode 100644
index 000000000000..15688d69735e
--- /dev/null
+++ b/kernel/liveupdate/liveupdate_test.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit test for Live Update compatibility strings.
+ */
+#include <kunit/test.h>
+#include <linux/string.h>
+#include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho/abi/luo.h>
+#include <linux/kho/abi/memfd.h>
+
+/* Verify that compatibility sub-components are unique and sorted alphabetically */
+static bool is_alphabetical_unique(const char *compat)
+{
+	char buf[1024];
+	char *string = buf;
+	char *token;
+	char *prev = NULL;
+	char *sub;
+
+	strscpy(buf, compat, sizeof(buf));
+
+	sub = strchr(string, ';');
+	if (!sub)
+		return true;
+
+	sub++;
+
+	while ((token = strsep(&sub, ";")) != NULL) {
+		if (prev && strcmp(prev, token) >= 0)
+			return false;
+		prev = token;
+	}
+
+	return true;
+}
+
+static void test_compatibility_alphabetical(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(KHO_FDT_COMPATIBLE));
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(LUO_ABI_COMPATIBLE));
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(MEMFD_LUO_FH_COMPATIBLE));
+}
+
+static struct kunit_case liveupdate_test_cases[] = {
+	KUNIT_CASE(test_compatibility_alphabetical),
+	{}
+};
+
+static struct kunit_suite liveupdate_test_suite = {
+	.name = "liveupdate-compatibility",
+	.test_cases = liveupdate_test_cases,
+};
+
+kunit_test_suite(liveupdate_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 91d03f9a6a39..28c54bb473b8 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -6,6 +6,7 @@ CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
 CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
+CONFIG_LIVEUPDATE_KUNIT_TEST=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
 CONFIG_SHMEM=y
-- 
2.53.0


