Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309BD6A51B4
	for <lists+linux-doc@lfdr.de>; Tue, 28 Feb 2023 04:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjB1DNs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Feb 2023 22:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjB1DNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 22:13:47 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35CE16897
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 19:13:44 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536e8d6d9ceso181880007b3.12
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 19:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677554024;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6UOSWO+feCYZ3WxJ17vXN444yl542PP/Ra8QhWlg1E=;
        b=BVXvaAIO+k0MW9rbMLSLEL10JfJv/dqSvdauXeBmyVpNYdjfdOGp19/tANrYafzYyE
         LbhRzdL2lvTTAncxwGhgasgNaGccO4CT6trzGMtN4OyDVqq1yNRvKr8k6m0SyGzhQLf6
         62xJm5ZeHJZe2QcGqIHidAamjGA3cdLHPl2Vd4WJ/W/YHO1XRESmHk17nnsE851VuOIi
         Kn7qMoYRJwkl4eeph2+NygNkEAKludimbYssyp6p84lsBq54aUAGi1Mfjy/aPlwcmX4l
         vTBdnYLWidYqBDUjq4fijBm3IaF2hMCneHOe76SeRAoXID4FJGMHP7dV6xWbKKzHOYLg
         lUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677554024;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6UOSWO+feCYZ3WxJ17vXN444yl542PP/Ra8QhWlg1E=;
        b=cjJS9RLUfueHXbBAz5z6WEB81kJZkTgRWt5GzMkgZw5g4CdwSjQrLOIY/Ta818drUQ
         i+zWYzVm+zhtcrnYVboZnvSg0QXPQJMtX+hTfTYdScySzmWU65d2Bseu/Qm0wYoILJDR
         cT5SXSP5IEhObBmuwLwCj3/qRpfbLiMB8M9ybnosZlI9urVLY6q3G9ORYN5H8lKsJEVj
         cILmZXeuv/Bez0QbFl0lg4Bo3P7BEcsO3XzYsHfkIGyFTNOZetrVZQP9kTblNrDHPNx9
         AcJS7MxC3eZgWRgz88tXbRNrrkKE/Lie+nFSnCnzRKZJYnmmrCLj7dibzhyaC+fFWcEI
         u/zw==
X-Gm-Message-State: AO0yUKVQwgeIlIinDanlv2Q7e5pgIRSt93sKDIPqw6LuHXVBteIBdFUM
        Zk8V+YgGEvMbkort7w5UHYhqVXNz3AxCaQ==
X-Google-Smtp-Source: AK7set9/7oGN1cxLTSyivW/Lnm2hI66pvRCEncRFscnVFliFQ59tiscx9LiAIz1ONm2E9DLKuEu4Xv3lFA6dBw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:431c:0:b0:52e:b22b:f99 with SMTP id
 q28-20020a81431c000000b0052eb22b0f99mr623341ywa.4.1677554024082; Mon, 27 Feb
 2023 19:13:44 -0800 (PST)
Date:   Tue, 28 Feb 2023 11:13:18 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230228031317.3415484-1-davidgow@google.com>
Subject: [PATCH] Documentation: kbuild: Add note about using (subst m,y)
From:   David Gow <davidgow@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Sadiya Kazi <sadiyakazi@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

THe kbuild documentation already notes that, where there's an obj-y
target in a subdirectory, it will be orphaned if the subdirectory uses
obj-m. Suggest a way of forcing the directory to obj-y when it's based
on a config option which could be 'm'.

Linus made several suggestions as to how this is usually done here:
https://lore.kernel.org/linux-kselftest/CAHk-=wgK07PQ_DBBbAbSJ41t__6de1xZ6q7RRu-JS=2SU0wqLQ@mail.gmail.com/

This only documents the first one, which seems most common.

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/kbuild/makefiles.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index e67eb261c9b0..d9eb24799f52 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -254,6 +254,17 @@ from that directory will be linked into vmlinux. If the Makefile in
 that directory specifies obj-y, those objects will be left orphan.
 It is very likely a bug of the Makefile or of dependencies in Kconfig.
 
+This means that, if a directory contains both obj-y and obj-m targets,
+it should be added with obj-y. If this directory nevertheless should
+only be built when a config option is enabled (typically to support
+a module which requires one or two files to nevertheless be built-in),
+'subst m,y' can be used to ensure obj-y is used.
+
+Example::
+
+  #drivers/Makefile
+  obj-$(subst m,y,$(CONFIG_HYPERV)) += hv/
+
 Kbuild also supports dedicated syntax, subdir-y and subdir-m, for
 descending into subdirectories. It is a good fit when you know they
 do not contain kernel-space objects at all. A typical usage is to let
-- 
2.39.2.722.g9855ee24e9-goog

