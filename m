Return-Path: <linux-doc+bounces-42418-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9BA7EB26
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 20:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5113C18918C6
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 18:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D925256C6A;
	Mon,  7 Apr 2025 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJsWGyQC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08122370A;
	Mon,  7 Apr 2025 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049817; cv=none; b=IZb6yAEj1x/3iRvHN0vp3bVhcx8RGhZjTUslxLZs0/TJx8F6Isc88N1mTBvOYBDDxen6PenLpomhqQC46XptYWKwH8LlMpestXUMxKbPH9oWnUyY4jb6W7yUkY89hol/CyeYP4scE8ZpNvIJlM6tqMJw4h6H/1aJRUHRtHIgHMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049817; c=relaxed/simple;
	bh=6Lf93JT3Xvu2Mb6ilt4pqZnmbF7Ya6FG/rpcM9omG3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D5IUzZu3BDS8Y4vNuPb7WOpL5WyzuzGUE6tPIiTD6ml9UIn1Ua1kEcgJrN9moCaK53MuS58UsGT+/W+FpNoGdfZ4t0RCnfTabT2J6xT22tAHfPK6Mo6tx3YrkgHK6r6T12/1oWHKPHiJ3jzgU3HOZqCu3IK4MI6NHQVZZJ7O+IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJsWGyQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E1BC4CEDD;
	Mon,  7 Apr 2025 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049816;
	bh=6Lf93JT3Xvu2Mb6ilt4pqZnmbF7Ya6FG/rpcM9omG3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJsWGyQCF4EyBFtcMUaQ0Imszai/+zIrUOvoRHRPy6h6bFPXIWK5KlvMwVSJFKfjR
	 0OLV5WVsRv6x+uGbJJ4AjErGCNd2aG8ymLyMJq2GTk8BJDGRo9EHH//1qAFutgN/DQ
	 8x6ZMH3YYlywzHFn+qhRuXP7vAL9wbwz5A2CvxEFs5OHcd5ZBGW4sg0F0u35tHCmlD
	 lZ56XobXkp5+S4JjctlUgd2bvdzqUdvqmbQVuya1SvsyZzZBKOOqaeSqvA0JAndYe6
	 m6hkbb5lRo6vsIEmwi//Zcvt4kAtslF0aRuvbXaf+GEcAh6h5gOhfTikkJlKAPClv+
	 fcHgdud3IyUUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Jann Horn <jannh@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net,
	paulmck@kernel.org,
	thuth@redhat.com,
	bp@alien8.de,
	ardb@kernel.org,
	gregkh@linuxfoundation.org,
	jpoimboe@kernel.org,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 8/9] tracing: Enforce the persistent ring buffer to be page aligned
Date: Mon,  7 Apr 2025 14:16:34 -0400
Message-Id: <20250407181635.3184105-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181635.3184105-1-sashal@kernel.org>
References: <20250407181635.3184105-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
Content-Transfer-Encoding: 8bit

From: Steven Rostedt <rostedt@goodmis.org>

[ Upstream commit c44a14f216f45d8bf1634b52854a699d7090f1e8 ]

Enforce that the address and the size of the memory used by the persistent
ring buffer is page aligned. Also update the documentation to reflect this
requirement.

Link: https://lore.kernel.org/all/CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com/

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vincent Donnefort <vdonnefort@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Jann Horn <jannh@google.com>
Link: https://lore.kernel.org/20250402144953.412882844@goodmis.org
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 Documentation/trace/debugging.rst               |  2 ++
 kernel/trace/trace.c                            | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec85..71861643ef143 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7241,6 +7241,8 @@
 			This is just one of many ways that can clear memory. Make sure your system
 			keeps the content of memory across reboots before relying on this option.
 
+			NB: Both the mapped address and size must be page aligned for the architecture.
+
 			See also Documentation/trace/debugging.rst
 
 
diff --git a/Documentation/trace/debugging.rst b/Documentation/trace/debugging.rst
index 54fb16239d703..d54bc500af80b 100644
--- a/Documentation/trace/debugging.rst
+++ b/Documentation/trace/debugging.rst
@@ -136,6 +136,8 @@ kernel, so only the same kernel is guaranteed to work if the mapping is
 preserved. Switching to a different kernel version may find a different
 layout and mark the buffer as invalid.
 
+NB: Both the mapped address and size must be page aligned for the architecture.
+
 Using trace_printk() in the boot instance
 -----------------------------------------
 By default, the content of trace_printk() goes into the top level tracing
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 0e6d517e74e0f..50aa6d5908329 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -10427,6 +10427,16 @@ __init static void enable_instances(void)
 		}
 
 		if (start) {
+			/* Start and size must be page aligned */
+			if (start & ~PAGE_MASK) {
+				pr_warn("Tracing: mapping start addr %pa is not page aligned\n", &start);
+				continue;
+			}
+			if (size & ~PAGE_MASK) {
+				pr_warn("Tracing: mapping size %pa is not page aligned\n", &size);
+				continue;
+			}
+
 			addr = map_pages(start, size);
 			if (addr) {
 				pr_info("Tracing: mapped boot instance %s at physical memory %pa of size 0x%lx\n",
-- 
2.39.5


