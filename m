Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C83737011
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jun 2023 17:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbjFTPOn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jun 2023 11:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjFTPO2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 11:14:28 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B8B1FDA
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 08:14:03 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b52132181aso24013295ad.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687274040; x=1689866040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRb96LJgR72xVeW8oewPH/vIoAVz/LQLwg+4m06vZkc=;
        b=XKfp2wc7nAI8DCwXu8AhLAR5wD/2txHmlVMHGvKvNUaTw24+5WQRKQY0Xhr4S6HgiZ
         GRTW4OLWcisOfwkiy06oWmwYPHjfI2rB+H0ltRtxXHomXz841Ao/7ERSbBkQk1WNDx8L
         RqeqommVxKAl1E0YcwBImX9LSeUv3JGSoYIgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274040; x=1689866040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRb96LJgR72xVeW8oewPH/vIoAVz/LQLwg+4m06vZkc=;
        b=IfEEOz3Onysf4zLPNfonm7cIfsXToFpKP8pv9qOI2SxcL3F4zu79caSTI0/+cHdPW3
         /c9TKJbsQlE8gE1NklHB5SoFEVhR+ecwxR0RfI6uvygItPcPmyyW0dn/Oga5uCsvZK6u
         l3E/lKjsXYC40YQzhi3Xl2Fg1HpJc1mL5Lw3kxqb0/793PCIwpU5xqzkJw+pKS0znObz
         Ns19+VL5ZEll+1lStQQzqGpaT2bfq0Gz93/CDq79yoyQslzUPeVIJgNzeLfAjAUChlTV
         hJmFmki+2yMUIFnFN1PN791Ld0lXQB4+OT/+h4DtRh2WMnskZFZTP7C+QWNP618Vpnfm
         ru1g==
X-Gm-Message-State: AC+VfDzGF9KuyyR82FyLoAxcifQv2LbH/K6YRXOuXsE2w397l8+EFNKi
        d5nEr2bnsW8z2FfWgDd/X4EO8w==
X-Google-Smtp-Source: ACHHUZ7vDNz9Cx5BItNVohrwafUr0euSnM4MHgJv4ESsQf5sFBe9OMU343gsncNkMmM7BVjOusovJA==
X-Received: by 2002:a17:902:ecc2:b0:1b5:561a:5c9a with SMTP id a2-20020a170902ecc200b001b5561a5c9amr4465646plh.39.1687274040118;
        Tue, 20 Jun 2023 08:14:00 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:e87e:41e3:d762:f8a8])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902ec8900b001aaf370b1c7sm1731872plg.278.2023.06.20.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:13:59 -0700 (PDT)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     mhiramat@google.com, takayas@chromium.org, drosen@google.com,
        sarthakkukreti@google.com, uekawa@chromium.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH 1/3] docs: virtiofs: Fix descriptions about virtiofs mount option
Date:   Wed, 21 Jun 2023 00:13:14 +0900
Message-ID: <20230620151328.1637569-2-keiichiw@chromium.org>
X-Mailer: git-send-email 2.41.0.185.g7c58973941-goog
In-Reply-To: <20230620151328.1637569-1-keiichiw@chromium.org>
References: <20230620151328.1637569-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since virtiofs and FUSE don't share mount options, fixes the
description. Also, explains DAX option as the only virtiofs-specific
option so far.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---

 Documentation/filesystems/dax.rst      | 1 +
 Documentation/filesystems/virtiofs.rst | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
index c04609d8ee24..77c5d4550ecd 100644
--- a/Documentation/filesystems/dax.rst
+++ b/Documentation/filesystems/dax.rst
@@ -167,6 +167,7 @@ Setting the `FS_XFLAG_DAX` flag (specifically or through inheritance) occurs eve
 if the underlying media does not support dax and/or the filesystem is
 overridden with a mount option.
 
+.. _virtiofs-dax:
 
 Enabling DAX on virtiofs
 ----------------------------
diff --git a/Documentation/filesystems/virtiofs.rst b/Documentation/filesystems/virtiofs.rst
index fd4d2484e949..fdec5a7840f7 100644
--- a/Documentation/filesystems/virtiofs.rst
+++ b/Documentation/filesystems/virtiofs.rst
@@ -43,7 +43,10 @@ Mount options
 -------------
 
 virtiofs supports general VFS mount options, for example, remount,
-ro, rw, context, etc. It also supports FUSE mount options.
+ro, rw, context, etc. Also, virtiofs has its own options.
+
+dax[=always,never,inode]
+  Enable direct access for files. See :ref:`virtiofs-dax`.
 
 atime behavior
 ^^^^^^^^^^^^^^
-- 
2.41.0.185.g7c58973941-goog

