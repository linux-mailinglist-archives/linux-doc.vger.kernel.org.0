Return-Path: <linux-doc+bounces-266-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E117C90D9
	for <lists+linux-doc@lfdr.de>; Sat, 14 Oct 2023 00:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8642BB20AD3
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 22:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D992D2C841;
	Fri, 13 Oct 2023 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJlRoAmU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5C2C845
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 22:49:26 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E6110DB;
	Fri, 13 Oct 2023 15:48:58 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35135b79b6aso9493165ab.0;
        Fri, 13 Oct 2023 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697237336; x=1697842136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7BOhkrkHITitY1j/kRDjansJLSo7hGc2Ealdbve1QE=;
        b=VJlRoAmUB2NHCeDgw6hrA+8rl+t1G1pEKNxvMA2F6wOuEAqtJWKu/sQ5mnnXX3DLwj
         cpYglMg7aMmCzX7rwv7igWhbrjPgpsgpzUVtWDgpIN3nU2GkM8jo7kJ/O9CXyVy+AEy8
         h8ZMNYdCmhzRgMtZPsNd6iJ322SfUzCanY3vML8AFFTJ5QH9x/NBvuIctELP+uH/hXIL
         DqjqI/LI32ujWeFONivAqFOt4XfLpnlChbtNbsLlBh2FszhwqSvEvoAF3vHS/6CmqP1b
         PH3Ds3ZiuYVPOBnhRrVcCDD6b7w3r+uoy+j5Cxjnh2vMzV8BCU7/OJI2iSX9G0EJ1GMY
         RZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697237336; x=1697842136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7BOhkrkHITitY1j/kRDjansJLSo7hGc2Ealdbve1QE=;
        b=wM54W59ZPB2KaFwGr9vJBECzojc17K3kMFa1e3rJ72zLf1aKqfeMzxbiXKMOSxkpu9
         H29tpprT5x2EL5Djj2tX/4jTK9nMx3EeB389HWlIvp+ZnELzhSQwhfMbbUv6hPwIs0tr
         Zb5vxezxFRoKZA0o4mlsoVWSpFqgGxKh9KzeNoPbP9zJnvVM2n9Q56f+r2vM8i5gHXwx
         /A8QYBh+Gt+xLw8DRrKfkHIX20l2ofLFp0X71j12SqqZQtuajanqI8n/Q/b7YYHwZCUn
         KRbWP1zKJJYhbrarxTiFWv3QXHXVhQaVmxwKfxUWRwvbB6mX8Tsf3swxIypER5qBgDaA
         vElw==
X-Gm-Message-State: AOJu0YxT55INUtgcG891g2ROXoIS7OZLGSVVLX8yICrEgcKj0ynUmyI0
	7eVBRyX8J+ftol5u64chwZoTQ9f7oqw+7w==
X-Google-Smtp-Source: AGHT+IHV+1dejqWmVluHB1YabEHlzoSNnK4D52lGGpz4zveUJlfgzCoJ9RoCMzdJ/fWCyvcjW3aAIA==
X-Received: by 2002:a92:c56e:0:b0:351:50f1:1f98 with SMTP id b14-20020a92c56e000000b0035150f11f98mr31025480ilj.32.1697237335751;
        Fri, 13 Oct 2023 15:48:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 15:48:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: lb@semihalf.com,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7b 21/25] dyndbg: refactor *dynamic_emit_prefix
Date: Fri, 13 Oct 2023 16:48:13 -0600
Message-ID: <20231013224818.3456409-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Refactor the split of duties between outer & inner fns.

The outer fn was previously just an inline unlikely forward to inner,
which did all the work.

Now, outer handles +t and +l flags itself, and calls inner only when
_DPRINTK_FLAGS_INCL_LOOKUP is needed.

No functional change.

But it does make the results of the inner-fn more cache-friendly
(fewer entries, reused more often):

1- no spurious [TID] or <intr> noise
2- no LINE-number to bloat the cache (avg 9 pr_debugs/fn)
3- only LOOKUP stuff

Currently LOOKUPs are descriptor-field refs but could be replaced by
accessor functions.  This would allow the __dyndbg_sites section to be
de-duplicated and reclaimed; currently module, filename fields are
~90% repeated.  As the accessors get more expensive, the value of
caching part of the prefix goes up.

Also change inner-fn to return count of extra chars written to the
buffer, and drop "inline" from outer, let the compiler decide.  Maybe
also change name accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
fixup whitespace
---
 lib/dynamic_debug.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 17eefb35ac96..5825b58043a6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -777,11 +777,28 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_prefix(const struct _ddebug *desc, char *buf, int pos)
+{
+	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				desc->modname);
+	if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				desc->function);
+	if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				trim_prefix(desc->filename));
+	return pos;
+}
+
+static char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
 	int pos_after_tid;
 	int pos = 0;
 
+	if (likely(!(desc->flags & _DPRINTK_FLAGS_INCL_ANY)))
+		return buf;
+
 	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
 		if (in_interrupt())
 			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
@@ -790,15 +807,10 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 					task_pid_vnr(current));
 	}
 	pos_after_tid = pos;
-	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->modname);
-	if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->function);
-	if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				trim_prefix(desc->filename));
+
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+		pos += __dynamic_emit_prefix(desc, buf, pos);
+
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
@@ -810,13 +822,6 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	return buf;
 }
 
-static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
-{
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
-		return __dynamic_emit_prefix(desc, buf);
-	return buf;
-}
-
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 {
 	va_list args;
-- 
2.41.0


