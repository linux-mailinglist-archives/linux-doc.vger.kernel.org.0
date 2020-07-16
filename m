Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2942221D1A
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jul 2020 09:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgGPHPT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Jul 2020 03:15:19 -0400
Received: from seldsegrel01.sonyericsson.com ([37.139.156.29]:14502 "EHLO
        SELDSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgGPHPT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jul 2020 03:15:19 -0400
From:   Peter Enderborg <peter.enderborg@sony.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
CC:     Peter Enderborg <peter.enderborg@sony.com>
Subject: [PATCH 1/2] tracefs: Remove unnecessary debug_fs checks.
Date:   Thu, 16 Jul 2020 09:15:10 +0200
Message-ID: <20200716071511.26864-2-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716071511.26864-1-peter.enderborg@sony.com>
References: <20200617133738.6631-1-peter.enderborg@sony.com>
 <20200716071511.26864-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Type: text/plain
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CszBjUwD c=1 sm=1 tr=0 a=Jtaq2Av1iV2Yg7i8w6AGMw==:117 a=_RQrkK6FrEwA:10 a=QyXUC8HyAAAA:8 a=z6gsHLkEAAAA:8 a=ag1SF4gXAAAA:8 a=meVymXHHAAAA:8 a=g-dhFznQ5d8k2vTQpKYA:9 a=d-OLMTCWyvARjPbQ-enb:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=2JgSa4NbpEOStq-L5dxp:22
X-SEG-SpamProfiler-Score: 0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a preparation for debugfs restricted mode.
We don't need debugfs to trace, the removed check stop tracefs to work
if debugfs is not initialised. We instead tries to automount within
debugfs and relay on it's handling. The code path is to create a
backward compatibility from when tracefs was part of debugfs, it is now
standalone and does not need debugfs. When debugfs is in restricted
it is compiled in but not active and return EPERM to clients and
tracefs wont work if it assumes it is active it is compiled in
kernel.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index bb62269724d5..848f67a5f16d 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8945,9 +8945,7 @@ struct dentry *tracing_init_dentry(void)
 	if (tr->dir)
 		return NULL;
 
-	if (WARN_ON(!tracefs_initialized()) ||
-		(IS_ENABLED(CONFIG_DEBUG_FS) &&
-		 WARN_ON(!debugfs_initialized())))
+	if (WARN_ON(!tracefs_initialized()))
 		return ERR_PTR(-ENODEV);
 
 	/*
-- 
2.17.1

