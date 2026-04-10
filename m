Return-Path: <linux-doc+bounces-83070-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP5KObt32WkkqAgAu9opvQ
	(envelope-from <linux-doc+bounces-83070-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 00:20:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6D3DD2C0
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 00:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 678753060D4F
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 22:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E1D3DFC9C;
	Fri, 10 Apr 2026 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH/J/hwS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383043DEFFB
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859188; cv=none; b=PkvB/vCkgXg0Fcfnq+0duIxB7IUQtzySnZFJXLLHHA2EU903cuuGoYJyjIdKLN8JCURRQ/56F566CHfOQB+YkCy5xLHtQbJbMeG05LLseBhTiSikj52qU+OdpC6ZVoC8NhdhzDlcHpww5YYTeAwKRVQ9cq7diIO8RZ2GfGfL65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859188; c=relaxed/simple;
	bh=QaN/2PunQ1R3wJZyKqY2gbgYlHT6Ws9qlntemVaF0iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHVc64Goq+TERDqkJ0uaOBgKPbYENfdKJ3bFmfIDbTQTQq27+e7Fm9cml0UQwaOuZQ/KwUhIVph4hiRPLavdzPFomtbZqnCS5ZRwIleYBZRTeffapZgRgFd3rIyxnIHcq7MlLZkE+1U0tJTG92YrVpcVDMCLA9mZC01qfob4igA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH/J/hwS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so914101a12.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775859186; x=1776463986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReVkam/qzqCEjrr/EAV6/YLmHzvOoDol2op4AuX2BSQ=;
        b=nH/J/hwS+KC0ItR9h/h0Bm0imy1ozDb5CEAmDHTY7nT6D28dBiV6WRgON+3hTbj+9g
         WRiXRwRSAB8TRIwwV3YSgRKKSd/Ktu8003fMJCUU1pwsJ9QJjI1QNG4G/VgVhokPQN0e
         /Wt3MASE1GKttcf9uW9PWyNPKvkSKaW+d7Nq97tqHiM6JbAe+VHURzNqV62AgHmx5klV
         beMnuMIU07D1ayPks2D9EC5wFmBTSbOIggclkXWrb6wtmEm8ZRS8JSVVrJ/IUopn11PL
         avtf6HydTF8yFV3ZxSt2LregX6EM21wNyc4gFXDd3g169lASiE48rErbT3QwPgf8RXIZ
         aRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859186; x=1776463986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReVkam/qzqCEjrr/EAV6/YLmHzvOoDol2op4AuX2BSQ=;
        b=d/IMswCY1+JYlsU5Dendoz7O59DSbkTEbw9uDsIeU8DYbrKtE0o8vuxd1LFMUbnNAV
         RV2DZwTAxGRPH5agm/Nu+vbovAMHYSVxaM6qfzdI4D08jgA7vnbhwjZ35/BNNzimaFsz
         C4kNvrum/cRgpR681k8oTkke+QtWmONT85nIG6KDEg0hRprHNidv2uZunQOYfDwvrPeK
         wMyTP6NDj+tjijDXB2WcrhpDkJtIg7f0qSKbSyhbNolHcsAC8n2EldUE18XBwVs6pvwn
         EsljZmQbi0tsmHwDlCsFo8ayTtWNqtHJihlRKd8P0+h5f92WZipwbqU+ldMnPNQ3R4ai
         zBvA==
X-Forwarded-Encrypted: i=1; AJvYcCWgIi45GLmbFKCTCDdQPuX493aYEkYx4B2ZMYqXTcIwoxCZ8wD9iJn0qYRkQ5lOHkZVWbmWBGLDmDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UfKqzJq958pKTsEhvgq5MsOE0dNMt0VC/ZO9gpFhWYxU7zeo
	G//DZx/lYEpdfTjrh28Cag+9siy5gPjp70V5GfcuRnX49/WA8qPVSq+G
X-Gm-Gg: AeBDieukkwS+lNcnCnta8SjIwIuY4k8pxRGKMliPRgkZXuFhY5U5RfJ90LeZVtk55Kn
	qctuYL3ls3DZyFLN/dLNheMJ+vA3lE65ebGNqP222fyTZMqk/Ov9tOTBQKpO9a8uz/vrp5E2Sm1
	mFchvOsEHbiSLE+UXj+JOUGeq0f/IQSNknilud7InJFKJ75FFyvq2PS8T5XGQVz8qz8b8qA12EC
	n2AFbsQvG62i7+vQ36VQX6rg41GlAASd1Gt0ruWFAWepypzYeXPzpT2TFgPMduRJ+2yunPP/l0S
	d++dfkYYFvbYjLWdBV5MkVVOJ+co+5KGnwOeyMjXmR+v2xA9B9zGeGrCtjUkRvfSN10j5YoyLnV
	3YUhd+33pwflHVRaMzhsVpwZgeX1L/NDipzjMm0QroqKoWQg9yigvbCww7O5t+RyiPfpx2yYwv7
	CctiI0QNSJLvEY9gh2/sOeTyxL8j8f645z/2yd1VTtp6s00OJYpJJhZdClyYG3ndRzxy86PFI1c
	g0X2NZXzbDOyDSm1tFx1vXRKfIT7XAJem3PC4kQ
X-Received: by 2002:a05:6a20:4312:b0:398:b619:b624 with SMTP id adf61e73a8af0-39fe3f1d752mr5445939637.29.1775859186488;
        Fri, 10 Apr 2026 15:13:06 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ff41dsm3142863a12.2.2026.04.10.15.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:13:06 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: document generation of offset header files
Date: Sat, 11 Apr 2026 03:42:54 +0530
Message-ID: <20260410221257.191517-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-83070-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piyushpatle228@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ravnborg.org:email,gmx.de:email,ruhr-uni-bochum.de:email]
X-Rspamd-Queue-Id: 90F6D3DD2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the placeholder reference with a description of how Kbuild
generates offset header files such as include/generated/asm-offsets.h.

Remove the corresponding TODO entry now that this is documented.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 Documentation/kbuild/makefiles.rst | 41 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 24a4708d26e8..7521cae7d56f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1285,8 +1285,39 @@ Example::
 In this example, the file target maketools will be processed
 before descending down in the subdirectories.
 
-See also chapter XXX-TODO that describes how kbuild supports
-generating offset header files.
+Generating offset header files
+------------------------------
+
+The ``include/generated/asm-offsets.h`` header exposes C structure
+member offsets and other compile-time constants to assembly code. It
+is generated from ``arch/$(SRCARCH)/kernel/asm-offsets.c``.
+
+The source file uses ``DEFINE()``, ``OFFSET()``, ``BLANK()`` and
+``COMMENT()`` from ``<linux/kbuild.h>``. These emit marker strings
+through inline asm that Kbuild extracts from the compiled assembly
+output.
+
+Example::
+
+  #include <linux/kbuild.h>
+  #include <linux/sched.h>
+
+  int main(void)
+  {
+          OFFSET(TSK_ACTIVE_MM, task_struct, active_mm);
+          DEFINE(THREAD_SIZE, THREAD_SIZE);
+          BLANK();
+          return 0;
+  }
+
+The rules are defined in the top-level ``Kbuild`` and
+``scripts/Makefile.lib``. The header is built during Kbuild's
+``prepare`` phase, after ``archprepare`` and before descending into
+subdirectories.
+
+The same mechanism generates ``include/generated/bounds.h`` from
+``kernel/bounds.c`` and ``include/generated/rq-offsets.h`` from
+``kernel/sched/rq-offsets.c``.
 
 List directories to visit when descending
 -----------------------------------------
@@ -1690,9 +1721,3 @@ Credits
 - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
 - Updates by Sam Ravnborg <sam@ravnborg.org>
 - Language QA by Jan Engelhardt <jengelh@gmx.de>
-
-TODO
-====
-
-- Generating offset header files.
-- Add more variables to chapters 7 or 9?
-- 
2.43.0


