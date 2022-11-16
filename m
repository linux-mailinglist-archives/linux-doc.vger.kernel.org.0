Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D7862C8A2
	for <lists+linux-doc@lfdr.de>; Wed, 16 Nov 2022 20:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbiKPTCl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Nov 2022 14:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234459AbiKPTCk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 14:02:40 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9362658BE3
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:36 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id cg5so11303060qtb.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPRRmEJ5WfLpfgkiCHMXotzner1gUekJAWpmB9oPWHc=;
        b=o6NUKAooEKLxqJiu3h2GJEPlNWXn+5p6QjAy47yq4eZwHlKignmk+2ZgaY+8JMLGCL
         Rcg80ehjbUrnMxklHckNwYa+AWW+c+MLaTZ12s+Aqazjaau/RR40yfU4NkE24P+qxyQv
         EhS0DMPH0t0r5OdzTwxjdBSIk7RE2f/UgxH0IdxZPZaTTfG+hASE8Ln7MYoXu58gRtEl
         uIzHvfUPtIhqQLKvsedmiUPTf389rGRaOfgGi9kpE5eQalqZi4aquIv4Atfw1t5ApVEK
         PxlsXJj/K+61G0a0vdGAlFEsG98sjw3c8RiCu+hb5u+61g1+/tTETrsch1n6+7R/mLr9
         ze2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPRRmEJ5WfLpfgkiCHMXotzner1gUekJAWpmB9oPWHc=;
        b=in4ugC2s/goK5Icpb1ipWia0WP8Owao9uMD2yb2kBtxpxOFdkSpFsHqev1nmdXWoWG
         6YgDCaFJ8TQJLUQTgnO5Xl6Ki7YWOrgUdSYGm3/7h/VHguAxlJV6k//L9qjfKh4l0iLe
         W7SQzDjnwUdJiIrG9epD8LOpTM+oBwGq0wn+WFGAXuMSVuqV6iGHkPBaRP7w51t4jZrV
         FprFTBm2USK+CEcNpk17KUPFu5iMIKv/VeXrNy/UM/4mBmin3d6j8QLY2ceFDQN2dtEp
         VwI6zrmdCByebHRRV5X4XOQtNVFg4r8r/weEjlranzEq9u9Umvxs0hK06l21vNLdjaHD
         ZGNQ==
X-Gm-Message-State: ANoB5pkkzMoQN/SI8hs/MOxgzSUE8isE+KKgPPKv+Ny+QnsxHJlWDMsH
        kWVBXfwqCv8v25IWK74uorj747Tih13b9A==
X-Google-Smtp-Source: AA0mqf4Q10ShNYeArc8mCok2S9QKwNJ4be+oK+Uld06vqbD/X05yyF/atjbbz4ygzw8euBKtdP/zWQ==
X-Received: by 2002:ac8:670a:0:b0:3a5:8182:cce0 with SMTP id e10-20020ac8670a000000b003a58182cce0mr21733750qtp.446.1668625355344;
        Wed, 16 Nov 2022 11:02:35 -0800 (PST)
Received: from localhost.localdomain (dsl-10-133-21.b2b2c.ca. [72.10.133.21])
        by smtp.gmail.com with ESMTPSA id o5-20020ac87c45000000b003a494b61e67sm9256304qtv.46.2022.11.16.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:02:35 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: [PATCH v2 1/2] doc: add texinfodocs and infodocs targets
Date:   Wed, 16 Nov 2022 14:02:09 -0500
Message-Id: <20221116190210.28407-2-maxim.cournoyer@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx supports generating Texinfo sources and Info documentation,
which can be navigated easily and is convenient to search (via the
indexed nodes or anchors, for example).

Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
---
 Documentation/Makefile                     | 11 +++++++++++
 Documentation/userspace-api/media/Makefile |  3 ++-
 Makefile                                   |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 64d44c1ecad3..bb73dcb5ed05 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -95,6 +95,15 @@ htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
+texinfodocs:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,texinfo,$(var),texinfo,$(var)))
+
+# Note: the 'info' Make target is generated by sphinx itself when
+# running the texinfodocs target define above.
+infodocs: texinfodocs
+	$(MAKE) -C $(BUILDDIR)/texinfo info
+
 linkcheckdocs:
 	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
 
@@ -143,6 +152,8 @@ cleandocs:
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
 	@echo  '  htmldocs        - HTML'
+	@echo  '  texinfodocs     - Texinfo'
+	@echo  '  infodocs        - Info'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
 	@echo  '  epubdocs        - EPUB'
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 00922aa7efde..3d8aaf5c253b 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -47,10 +47,11 @@ $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exception
 
 # Media build rules
 
-.PHONY: all html epub xml latex
+.PHONY: all html texinfo epub xml latex
 
 all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
+texinfo: all
 epub: all
 xml: all
 latex: $(IMGPDF) all
diff --git a/Makefile b/Makefile
index 58cd4f5e1c3a..b3266c408b6c 100644
--- a/Makefile
+++ b/Makefile
@@ -1785,7 +1785,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs
+	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
-- 
2.38.1

