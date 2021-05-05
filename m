Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66C03742DE
	for <lists+linux-doc@lfdr.de>; Wed,  5 May 2021 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhEEQsy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 May 2021 12:48:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235523AbhEEQqk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 May 2021 12:46:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF2C61928;
        Wed,  5 May 2021 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620232597;
        bh=ERJ+4n35S3SGwZ4ZOJm4ZD5xaa7Bpc5wcytaSRt+5y4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gPV5G3wboSrWpMcIQvLQwD+JbEgZtpIj7j2iMQ7AJU2WeXETnNhkXcXAQULV3wXke
         c3ODE9GYGpxgIQDL2dx3a3QabM8yT5ZuYrpavkw0zOBIHLos2Y0dtzMz8CFRCC1Qjv
         T3FWXjC1guFDbGH4YD84OTu2TYT338nRbVj3uAUSmAE1Y1pmv1L8+YVqgG5BsZuiZN
         mGUDEtFg9jtQ0dmssp+/x22dfF5fPnax4hKIYYQPcGZQTGUMPhoUfTo3crO43kQFKC
         ispRkslPk/zbM9HhVmoj8Vxvr6p48OmDTZF9cK/tOBw+OzfB1arL6j/CQWWKs/ZR4A
         n7G13so7KncNw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 098/104] kbuild: generate Module.symvers only when vmlinux exists
Date:   Wed,  5 May 2021 12:34:07 -0400
Message-Id: <20210505163413.3461611-98-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 69bc8d386aebbd91a6bb44b6d33f77c8dfa9ed8c ]

The external module build shows the following warning if Module.symvers
is missing in the kernel tree.

  WARNING: Symbol version dump "Module.symvers" is missing.
           Modules may not have dependencies or modversions.

I think this is an important heads-up because the resulting modules may
not work as expected. This happens when you did not build the entire
kernel tree, for example, you might have prepared the minimal setups
for external modules by 'make defconfig && make modules_preapre'.

A problem is that 'make modules' creates Module.symvers even without
vmlinux. In this case, that warning is suppressed since Module.symvers
already exists in spite of its incomplete content.

The incomplete (i.e. invalid) Module.symvers should not be created.

This commit changes the second pass of modpost to dump symbols into
modules-only.symvers. The final Module.symvers is created by
concatenating vmlinux.symvers and modules-only.symvers if both exist.

Module.symvers is supposed to collect symbols from both vmlinux and
modules. It might be a bit confusing, and I am not quite sure if it
is an official interface, but presumably it is difficult to rename it
because some tools (e.g. kmod) parse it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .gitignore               |  1 +
 Documentation/dontdiff   |  1 +
 Makefile                 |  2 +-
 scripts/Makefile.modpost | 15 ++++++++++++++-
 scripts/mod/modpost.c    | 15 +--------------
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..67d2f3503128 100644
--- a/.gitignore
+++ b/.gitignore
@@ -55,6 +55,7 @@ modules.order
 /tags
 /TAGS
 /linux
+/modules-only.symvers
 /vmlinux
 /vmlinux.32
 /vmlinux.symvers
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index e361fc95ca29..82e3eee7363b 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -178,6 +178,7 @@ mktables
 mktree
 mkutf8data
 modpost
+modules-only.symvers
 modules.builtin
 modules.builtin.modinfo
 modules.nsdeps
diff --git a/Makefile b/Makefile
index 6cf79e492f72..a0432dc5c29f 100644
--- a/Makefile
+++ b/Makefile
@@ -1482,7 +1482,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_FILES += include/ksym vmlinux.symvers \
+CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json
 
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f54b6ac37ac2..12a87be0fb44 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -65,7 +65,20 @@ else
 ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
-output-symdump := Module.symvers
+output-symdump := modules-only.symvers
+
+quiet_cmd_cat = GEN     $@
+      cmd_cat = cat $(real-prereqs) > $@
+
+ifneq ($(wildcard vmlinux.symvers),)
+
+__modpost: Module.symvers
+Module.symvers: vmlinux.symvers modules-only.symvers FORCE
+	$(call if_changed,cat)
+
+targets += Module.symvers
+
+endif
 
 else
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d6c81657d695..5f9d8d9147d0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2469,19 +2469,6 @@ static void read_dump(const char *fname)
 	fatal("parse error in symbol dump file\n");
 }
 
-/* For normal builds always dump all symbols.
- * For external modules only dump symbols
- * that are not read from kernel Module.symvers.
- **/
-static int dump_sym(struct symbol *sym)
-{
-	if (!external_module)
-		return 1;
-	if (sym->module->from_dump)
-		return 0;
-	return 1;
-}
-
 static void write_dump(const char *fname)
 {
 	struct buffer buf = { };
@@ -2492,7 +2479,7 @@ static void write_dump(const char *fname)
 	for (n = 0; n < SYMBOL_HASH_SIZE ; n++) {
 		symbol = symbolhash[n];
 		while (symbol) {
-			if (dump_sym(symbol)) {
+			if (!symbol->module->from_dump) {
 				namespace = symbol->namespace;
 				buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
 					   symbol->crc, symbol->name,
-- 
2.30.2

