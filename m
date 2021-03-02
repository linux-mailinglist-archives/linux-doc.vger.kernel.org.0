Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149BE32B6FF
	for <lists+linux-doc@lfdr.de>; Wed,  3 Mar 2021 12:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhCCKby (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Mar 2021 05:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347838AbhCBTL1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 14:11:27 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E77C0698CF
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 09:20:47 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id e3so10257682pfj.6
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 09:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmdTY77liaK5SCzblCmMtRzezZEYkkZ3aYrvDg9Bb+E=;
        b=p9hHu6afCZiTeY1E2o7wqOBNpd4yP9RN7pqA9fb8WlkZPV30o1OCEflhsc5apRPWv4
         iMPtN5VkEsGOdttYFE5L+1Yt2IF4l15BtvKhXHmM/AOAtIepywDnEoFZH99Hkdxze+IO
         x7Vzhvw0CeSQhBlu3znvB4qUMuvygCNfjHUhwlSC7/bub5rtE24XV9muUvlWYk5MIwCj
         F0dwgDhTkY4tkWXKxYgGKpa7z17B9yC2O/h2UwS53Unuw6oh2FOe5uyyR9hzRI3nS3Mu
         4Y7I609pruhVIOhhWGR9iEwcX293Uxuf6Q40VU/LQcymk7P0zlT+PeClA05jA5PR+K1V
         2/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmdTY77liaK5SCzblCmMtRzezZEYkkZ3aYrvDg9Bb+E=;
        b=k/JF6eif+NScPVeOLRAS9NdTjl/tKle2k5X1KDBM/rOHGCkzPQSufhzbI48ZTypR3B
         Y0EPchLODS+WMOCSnUdK8e4yMRZMtTLqECBMHQLJP7mVcXFnDyEQD8sgrhx2FUmGMIf5
         p7KX1vyyQ4Y8MGnTIdY9QYg1z7QEnTFtqq/JwiJHIswvnfLOe3GdfgEQoXPrgJGFSEj4
         GduG+9VVgfaeZWmBEfWz4ds+Ptpwirc4G8V5JOegKhhtuOm0FBWMtN5MKp98JwB9shPL
         3V5XDV9RPnmq3gMk2Eu4nk+hzPRks2T+oOffDoOmsp+XEUQJPdDgIr8Oo/ShSzCokZXL
         /RUA==
X-Gm-Message-State: AOAM533fi1OTVMCVHK2Bi8Om9KTYRvCjuVUEEmeMhhkgGkMNb05B8Ut5
        I9wJQk6WusuUgnmWhyves+qFWQ==
X-Google-Smtp-Source: ABdhPJxzMU6Z6i/uOCRFlao8nR5bI1iSGEHnPO+VSAqFodLOhv1U+lT+DkshsxXusKr2knhcrf6mpA==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr18634644pgf.254.1614705647537;
        Tue, 02 Mar 2021 09:20:47 -0800 (PST)
Received: from localhost.localdomain (c-73-93-5-123.hsd1.ca.comcast.net. [73.93.5.123])
        by smtp.gmail.com with ESMTPSA id b15sm20073923pgg.85.2021.03.02.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:20:47 -0800 (PST)
From:   Joe Stringer <joe@cilium.io>
To:     bpf@vger.kernel.org
Cc:     daniel@iogearbox.net, ast@kernel.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>
Subject: [PATCHv2 bpf-next 12/15] selftests/bpf: Templatize man page generation
Date:   Tue,  2 Mar 2021 09:19:44 -0800
Message-Id: <20210302171947.2268128-13-joe@cilium.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302171947.2268128-1-joe@cilium.io>
References: <20210302171947.2268128-1-joe@cilium.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Previously, the Makefile here was only targeting a single manual page so
it just hardcoded a bunch of individual rules to specifically handle
build, clean, install, uninstall for that particular page.

Upcoming commits will generate manual pages for an additional section,
so this commit prepares the makefile first by converting the existing
targets into an evaluated set of targets based on the manual page name
and section.

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
Reviewed-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Joe Stringer <joe@cilium.io>
---
 tools/testing/selftests/bpf/Makefile.docs | 40 ++++++++++++++---------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile.docs b/tools/testing/selftests/bpf/Makefile.docs
index 546c4a763b46..f39ad19317c8 100644
--- a/tools/testing/selftests/bpf/Makefile.docs
+++ b/tools/testing/selftests/bpf/Makefile.docs
@@ -39,24 +39,34 @@ $(OUTPUT)bpf-$1.rst: ../../../../include/uapi/linux/bpf.h
 	$$(QUIET_GEN)../../../../scripts/bpf_doc.py $1 \
 		--filename $$< > $$@
 
-$(OUTPUT)%.7: $(OUTPUT)%.rst
+$(OUTPUT)%.$2: $(OUTPUT)%.rst
 ifndef RST2MAN_DEP
-	$(error "rst2man not found, but required to generate man pages")
+	$$(error "rst2man not found, but required to generate man pages")
 endif
-	$(QUIET_GEN)rst2man $< > $@
+	$$(QUIET_GEN)rst2man $$< > $$@
 
-docs-clean:
-	$(call QUIET_CLEAN, eBPF_helpers-manpage)
-	$(Q)$(RM) $(DOC_MAN7) $(OUTPUT)$(HELPERS_RST)
+docs-clean-$1:
+	$$(call QUIET_CLEAN, eBPF_$1-manpage)
+	$(Q)$(RM) $$(DOC_MAN$2) $(OUTPUT)bpf-$1.rst
 
-docs-install: helpers
-	$(call QUIET_INSTALL, eBPF_helpers-manpage)
-	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(man7dir)
-	$(Q)$(INSTALL) -m 644 $(DOC_MAN7) $(DESTDIR)$(man7dir)
+docs-install-$1: docs
+	$$(call QUIET_INSTALL, eBPF_$1-manpage)
+	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$$(man$2dir)
+	$(Q)$(INSTALL) -m 644 $$(DOC_MAN$2) $(DESTDIR)$$(man$2dir)
 
-docs-uninstall:
-	$(call QUIET_UNINST, eBPF_helpers-manpage)
-	$(Q)$(RM) $(addprefix $(DESTDIR)$(man7dir)/,$(_DOC_MAN7))
-	$(Q)$(RMDIR) $(DESTDIR)$(man7dir)
+docs-uninstall-$1:
+	$$(call QUIET_UNINST, eBPF_$1-manpage)
+	$(Q)$(RM) $$(addprefix $(DESTDIR)$$(man$2dir)/,$$(_DOC_MAN$2))
+	$(Q)$(RMDIR) $(DESTDIR)$$(man$2dir)
 
-.PHONY: docs docs-clean docs-install docs-uninstall
+.PHONY: $1 docs-clean-$1 docs-install-$1 docs-uninstall-$1
+endef
+
+# Create the make targets to generate manual pages by name and section
+$(eval $(call DOCS_RULES,helpers,7))
+
+docs-clean: $(foreach doctarget,$(DOCTARGETS), docs-clean-$(doctarget))
+docs-install: $(foreach doctarget,$(DOCTARGETS), docs-install-$(doctarget))
+docs-uninstall: $(foreach doctarget,$(DOCTARGETS), docs-uninstall-$(doctarget))
+
+.PHONY: docs docs-clean docs-install docs-uninstall man7
-- 
2.27.0

