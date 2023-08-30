Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22DD978D166
	for <lists+linux-doc@lfdr.de>; Wed, 30 Aug 2023 02:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbjH3AuB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Aug 2023 20:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241531AbjH3Ats (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Aug 2023 20:49:48 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67482CCE
        for <linux-doc@vger.kernel.org>; Tue, 29 Aug 2023 17:49:44 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-57124ee486dso3003176eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Aug 2023 17:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693356583; x=1693961383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=via/b64rRT/FAfyvThbExEJ7JcUZLeffgNRrzpR/58I=;
        b=hXD8pyTKPHZ2bzc53WU+YwosiloJHqHE/43unAfF77pzbRBoXu/I67HlOurw6rHkXW
         +ZOyZbNjVE1rLQK8krItQ1hOAW2V8CS/KG2sUMNZ5TdmzWyZze7vOpQ11TkUbLtUjnTN
         XMLCHPfbM8CMuhIpeaTWGU2p+er4km0rtw8hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693356583; x=1693961383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=via/b64rRT/FAfyvThbExEJ7JcUZLeffgNRrzpR/58I=;
        b=Hd21mEgh+ff7YXvX85hFaKQLN2PRRgtCxsVBgJG2jsLAUQVqHKChQlNWeiuMYS+hve
         DMAVvEJiKERNHmQKE1zJqPkiHrAJlYtnnEik8s4p9wH95pJtA0HQVHClq9XGYtn28qrj
         q+i/5YnqeIxXXIrjxz/dq7FYjJw8AavTqPO654zvM9x4+/jx0NdUSVLeY7PmawsMZM+N
         OhZALMbtMPpBja2tmsC4Hw6/1UtcGmR9dW9s2aFFqNem887DrcXY+nIaiSUwQbPosBeh
         M3cFhT36oddj687YuH5CNyqQwSuXYC+vzQNZkEXGbBpAtdjGVoFH6cDOguMKzTdSbXCY
         sAXA==
X-Gm-Message-State: AOJu0Ywvdbz8ESYRK+8HKcH9pLs6FWRl3MwWuJmGZfBW83MbulWck5Ko
        mbY66LeUfWmo9fkcG0UNhzykYA==
X-Google-Smtp-Source: AGHT+IEbFb8kIdRZ7Xq2JR1MjpzSFhzbrp4qqpjheQl+A9rBj9UvjIxkJ2/Nu1Rv94okveUdTWygVw==
X-Received: by 2002:a05:6808:1450:b0:3a7:5a6:e0b1 with SMTP id x16-20020a056808145000b003a705a6e0b1mr943648oiv.10.1693356583728;
        Tue, 29 Aug 2023 17:49:43 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:dcca:2774:b0c2:d030])
        by smtp.gmail.com with ESMTPSA id 3-20020aa79203000000b0066f37665a6asm8946722pfo.117.2023.08.29.17.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 17:49:43 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] kconfig: add warn-unknown-symbols sanity check
Date:   Wed, 30 Aug 2023 09:49:36 +0900
Message-ID: <20230830004937.2938195-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce KCONFIG_WARN_UNKNOWN_SYMBOLS environment variable,
which makes Kconfig warn about unknown config symbols.

This is especially useful for continuous kernel uprevs when
some symbols can be either removed or renamed between kernel
releases (which can go unnoticed otherwise).

By default KCONFIG_WARN_UNKNOWN_SYMBOLS generates warnings,
which are non-terminal. There is an additional environment
variable KCONFIG_WERROR that overrides this behaviour and
turns warnings into errors.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/kbuild/kconfig.rst |  9 +++++++++
 scripts/kconfig/confdata.c       | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index 6530ecd99da3..c946eb44bd13 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -56,6 +56,15 @@ KCONFIG_OVERWRITECONFIG
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
+KCONFIG_WARN_UNKNOWN_SYMBOLS
+----------------------------
+This environment variable makes Kconfig warn about all unrecognized
+symbols in the config input.
+
+KCONFIG_WERROR
+--------------
+If set, Kconfig treats warnings as errors.
+
 `CONFIG_`
 ---------
 If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 992575f1e976..4a6811d77d18 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -349,7 +349,11 @@ int conf_read_simple(const char *name, int def)
 	char *p, *p2;
 	struct symbol *sym;
 	int i, def_flags;
+	const char *warn_unknown;
+	const char *werror;
 
+	warn_unknown = getenv("KCONFIG_WARN_UNKNOWN_SYMBOLS");
+	werror = getenv("KCONFIG_WERROR");
 	if (name) {
 		in = zconf_fopen(name);
 	} else {
@@ -437,6 +441,10 @@ int conf_read_simple(const char *name, int def)
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 2 + strlen(CONFIG_));
 				if (!sym) {
+					if (warn_unknown)
+						conf_warning("unknown symbol: %s",
+							     line + 2 + strlen(CONFIG_));
+
 					conf_set_changed(true);
 					continue;
 				}
@@ -471,7 +479,7 @@ int conf_read_simple(const char *name, int def)
 
 			sym = sym_find(line + strlen(CONFIG_));
 			if (!sym) {
-				if (def == S_DEF_AUTO)
+				if (def == S_DEF_AUTO) {
 					/*
 					 * Reading from include/config/auto.conf
 					 * If CONFIG_FOO previously existed in
@@ -479,8 +487,13 @@ int conf_read_simple(const char *name, int def)
 					 * include/config/FOO must be touched.
 					 */
 					conf_touch_dep(line + strlen(CONFIG_));
-				else
+				} else {
+					if (warn_unknown)
+						conf_warning("unknown symbol: %s",
+							     line + strlen(CONFIG_));
+
 					conf_set_changed(true);
+				}
 				continue;
 			}
 
@@ -519,6 +532,10 @@ int conf_read_simple(const char *name, int def)
 	}
 	free(line);
 	fclose(in);
+
+	if (conf_warnings && werror)
+		exit(1);
+
 	return 0;
 }
 
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

