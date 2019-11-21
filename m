Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C404104736
	for <lists+linux-doc@lfdr.de>; Thu, 21 Nov 2019 01:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUADV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Nov 2019 19:03:21 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32899 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfKUADN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 19:03:13 -0500
Received: by mail-pg1-f193.google.com with SMTP id h27so599489pgn.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 16:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x//g3D21vWGwG/RhBLblP0rKHJ6VZUOUfN3oNVWDiSE=;
        b=NJqzhMhLJICCf5qJMl+TNG+sSEH4R/DlE9aDYaGlbweivfvOOJQa6VQxDYNhcw/U9t
         YZBnJUjG+3AcvvO3yIKNSW4lCAPdVCpA5BPmA1YWjjpzaOAduVif+C5xVk+E/ryM7vd1
         uuTBP5iylemd6FFCSBjIPF1u5PAS9YbOLn9xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x//g3D21vWGwG/RhBLblP0rKHJ6VZUOUfN3oNVWDiSE=;
        b=H4n6+wdokTDJ1h0XjsnCq26MstT9XpQYaT+Q9lInMlm4mzuxfPQrDUwbsZBXIuDlJY
         BXV1baXYEZMV0kKt+KwZBL2ZRBZXrESNZEnxXAIAtfYGM0ZY5GIZjloRZOQ0VcPwBZJD
         f836BiBxkXFV4+S9X///FewMw8NnMUjF1283UzV0F0fEOYsD7tVsrZQ2a0vkrk8ZEUpw
         Ilcr+nxTnr5fxBhpeAq/s6D7WbNXCs7MZDl8GHfHZ74G0Yp29bU1FAMXSJ/YrjObYAYr
         zpFpR2zUigoccZj4rgpCUO8q/iX0ktM6/wEcjQkgQnkJmjdT2I/wKzLZGO4vF5hHJ1OQ
         fTkg==
X-Gm-Message-State: APjAAAWJQ27R8VF3f1Dx6hTMj8E2zC4k2YtXPLevv5JiiqPBadaudtTM
        Z/GDxjSxna4KPx86oExvs0Bv7Q==
X-Google-Smtp-Source: APXvYqwStyJTrur6Um6X5gdnLSs05KUM0vEvX7S95Lr4MJfOROwA8QgHHWEsLmoYwK5zC4lSNlbP5Q==
X-Received: by 2002:a63:101:: with SMTP id 1mr6069915pgb.336.1574294592164;
        Wed, 20 Nov 2019 16:03:12 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r28sm555496pfl.37.2019.11.20.16.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:03:09 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] docs, parallelism: Fix failure path and add comment
Date:   Wed, 20 Nov 2019 16:03:02 -0800
Message-Id: <20191121000304.48829-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121000304.48829-1-keescook@chromium.org>
References: <20191121000304.48829-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rasmus noted that the failure path didn't correctly exit. Fix this and
add another comment about GNU Make's job server environment variable
names over time.

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Link: https://lore.kernel.org/lkml/eb25959a-9ec4-3530-2031-d9d716b40b20@rasmusvillemoes.dk
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/jobserver-count | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/jobserver-count b/scripts/jobserver-count
index 0b482d6884d2..6e15b38df3d0 100755
--- a/scripts/jobserver-count
+++ b/scripts/jobserver-count
@@ -24,6 +24,8 @@ try:
 	flags = os.environ['MAKEFLAGS']
 
 	# Look for "--jobserver=R,W"
+	# Note that GNU Make has used --jobserver-fds and --jobserver-auth
+	# so this handles all of them.
 	opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
 
 	# Parse out R,W file descriptor numbers and set them nonblocking.
@@ -53,6 +55,7 @@ os.write(writer, jobs)
 # If the jobserver was (impossibly) full or communication failed, use default.
 if len(jobs) < 1:
 	print(default)
+	sys.exit(0)
 
 # Report available slots (with a bump for our caller's reserveration).
 print(len(jobs) + 1)
-- 
2.17.1

