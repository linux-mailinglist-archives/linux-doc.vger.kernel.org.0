Return-Path: <linux-doc+bounces-1615-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0467DF324
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 14:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8B31C20DE7
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 13:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803296FC5;
	Thu,  2 Nov 2023 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="d5vhxMYv"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D716FBE
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 13:02:12 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF792FB;
	Thu,  2 Nov 2023 06:02:07 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6AE201F8C8;
	Thu,  2 Nov 2023 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698930126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nwOAu+lvDKzMgzPr8m1BY5NSLiFclCMWdwSry0oMoMQ=;
	b=d5vhxMYvPTW6u7j/olDef3dOle+DhmrULu1M0lAstoMmV+ZsdiD8j4j03gEpbMhPRPv6Lo
	6/Uz6kqZfJDWB7+T82ab+9ARKGgx5Fqrq+6v8QwMH8aOdqRn2LSQcrBcMiu4NMcPKZ23Gh
	n0llD+JxFPkggRxYt4S3/u0EAj7v6QM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02AE813584;
	Thu,  2 Nov 2023 13:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CZivOc2dQ2XQWgAAMHmgww
	(envelope-from <nik.borisov@suse.com>); Thu, 02 Nov 2023 13:02:05 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: corbet@lwn.net
Cc: tglx@linutronix.de,
	bp@alien8.de,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] docs: Remove reference to syscall trampoline in PTI
Date: Thu,  2 Nov 2023 15:02:04 +0200
Message-Id: <20231102130204.41043-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bf904d2762ee ("x86/pti/64: Remove the SYSCALL64 entry trampoline")
removed the syscall trampoline and instead opted to enable using the
default syscall64 entry point by mapping the percpu TSS. Unfortunately
the PTI documentation wasn't updated when the respective changes were
made, so let's bring the doc up to speed.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 Documentation/arch/x86/pti.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/x86/pti.rst b/Documentation/arch/x86/pti.rst
index 4b858a9bad8d..e08d35177bc0 100644
--- a/Documentation/arch/x86/pti.rst
+++ b/Documentation/arch/x86/pti.rst
@@ -81,11 +81,9 @@ Protection against side-channel attacks is important.  But,
      and exit (it can be skipped when the kernel is interrupted,
      though.)  Moves to CR3 are on the order of a hundred
      cycles, and are required at every entry and exit.
-  b. A "trampoline" must be used for SYSCALL entry.  This
-     trampoline depends on a smaller set of resources than the
-     non-PTI SYSCALL entry code, so requires mapping fewer
-     things into the userspace page tables.  The downside is
-     that stacks must be switched at entry time.
+  b. Percpu TSS is mapped into the user page tables to allow SYSCALL64 path
+     to work under PTI. This doesn't have a direct runtime cost but it can
+     be argued it opens certain timing attack scenarios.
   c. Global pages are disabled for all kernel structures not
      mapped into both kernel and userspace page tables.  This
      feature of the MMU allows different processes to share TLB
@@ -167,7 +165,7 @@ that are worth noting here.
  * Failures of the selftests/x86 code.  Usually a bug in one of the
    more obscure corners of entry_64.S
  * Crashes in early boot, especially around CPU bringup.  Bugs
-   in the trampoline code or mappings cause these.
+   in the mappings cause these.
  * Crashes at the first interrupt.  Caused by bugs in entry_64.S,
    like screwing up a page table switch.  Also caused by
    incorrectly mapping the IRQ handler entry code.
--
2.34.1


