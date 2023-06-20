Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A70737018
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jun 2023 17:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbjFTPPP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jun 2023 11:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233735AbjFTPOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 11:14:36 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6331704
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 08:14:11 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b50d7b4aaaso20819895ad.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687274049; x=1689866049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4+x+nHT/B45E7UNnOquSwSO/h9YI0Q8rRdwe69B63Q=;
        b=RqtNAe1RFUQMvzoORbX6DkZQi3UCv6ODu+PrzEzpYSbBftvYU2zYVD47PcImmkCIe7
         BKQM7uPqi2PLFoKjz6oKM07HnmCNSiGOM9BPK6LGvIHrdADRMqW3EA7bHIQlaSA4aCaH
         K4ZagfAuaP18sbIGdxUoH2jYTicucMLlHh5Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274049; x=1689866049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4+x+nHT/B45E7UNnOquSwSO/h9YI0Q8rRdwe69B63Q=;
        b=HFeTHU0HEd84FrhLCH6VnI86BaN57B5eH/3Jj13BjLVXnZ0Wx7Gq2XZMvhXOCecnrc
         JTK96qTWwoCcHwxwRfUfuS0L0dw0S+SAN0yiXGTcXvQSGCawfuJBhmslUkG0H4QaWEwO
         XD6hCEAOphAr7bnQmazS132TBf/XBAJr/0niBv3eVqLjI5GHNHHSCpZv5GibzUuzsgi+
         7Q327ad0MLMdRJ7127ff0B8nal9cbK6zJNV5Nd3lVxD8/duM3AFS+MFsJZOAfpGsYHoA
         Y86mbsPVS7ijQ5G/n0T8cawwFiKNd1lH96epR1vJTNCeSM2v9A7EA2BnDQ+WVxozG9i0
         XO8A==
X-Gm-Message-State: AC+VfDzSVa6Gfwo8YHBMeJ3OO7uziCiyAPZGXa9aPnqZj2lyl/Re7J0B
        kpGWlAJ8PH2fwFPpgE4KihH1Hw==
X-Google-Smtp-Source: ACHHUZ7Rq928JI13B91Bwvj3KipWu3jBQaQgSh0KVxwME+Q4LkNUZdGe807jnxk5uiZldi6heglgvQ==
X-Received: by 2002:a17:903:124e:b0:1b1:dfbd:a18c with SMTP id u14-20020a170903124e00b001b1dfbda18cmr8932980plh.39.1687274048672;
        Tue, 20 Jun 2023 08:14:08 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:e87e:41e3:d762:f8a8])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902ec8900b001aaf370b1c7sm1731872plg.278.2023.06.20.08.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:14:08 -0700 (PDT)
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
Subject: [PATCH 3/3] virtiofs: Add negative_dentry_timeout option
Date:   Wed, 21 Jun 2023 00:13:16 +0900
Message-ID: <20230620151328.1637569-4-keiichiw@chromium.org>
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

Add negative_dentry_timeout mount option to virtiofs to caching negative
dentry on the guest side. When the host virito-fs device has an exclusive
access to the file system and the machine has enough memory, one can
specify a long time as the timeout.

This option saves ~1 second per 10,000 stat request for non-existing paths.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---

 Documentation/filesystems/virtiofs.rst | 4 ++++
 fs/fuse/virtio_fs.c                    | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/filesystems/virtiofs.rst b/Documentation/filesystems/virtiofs.rst
index fdec5a7840f7..b045ef2223de 100644
--- a/Documentation/filesystems/virtiofs.rst
+++ b/Documentation/filesystems/virtiofs.rst
@@ -48,6 +48,10 @@ ro, rw, context, etc. Also, virtiofs has its own options.
 dax[=always,never,inode]
   Enable direct access for files. See :ref:`virtiofs-dax`.
 
+negative_dentry_timeout=N
+  Set the time in seconds to keep negative dentry cache. Same as the FUSE's
+  mount option.
+
 atime behavior
 ^^^^^^^^^^^^^^
 
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 4d8d4f16c727..bbbd840510f9 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -99,11 +99,13 @@ static const struct constant_table dax_param_enums[] = {
 enum {
 	OPT_DAX,
 	OPT_DAX_ENUM,
+	OPT_NEGATIVE_DENTRY_TIMEOUT,
 };
 
 static const struct fs_parameter_spec virtio_fs_parameters[] = {
 	fsparam_flag("dax", OPT_DAX),
 	fsparam_enum("dax", OPT_DAX_ENUM, dax_param_enums),
+	fsparam_u32 ("negative_dentry_timeout", OPT_NEGATIVE_DENTRY_TIMEOUT),
 	{}
 };
 
@@ -125,6 +127,9 @@ static int virtio_fs_parse_param(struct fs_context *fsc,
 	case OPT_DAX_ENUM:
 		ctx->dax_mode = result.uint_32;
 		break;
+	case OPT_NEGATIVE_DENTRY_TIMEOUT:
+		ctx->negative_dentry_timeout = result.uint_32;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1416,6 +1421,7 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
 	struct super_block *sb;
 	struct fuse_conn *fc = NULL;
 	struct fuse_mount *fm;
+	struct fuse_fs_context *ffc;
 	unsigned int virtqueue_size;
 	int err = -EIO;
 
@@ -1468,6 +1474,8 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
 
 		sb->s_flags |= SB_ACTIVE;
 	}
+	ffc = fsc->fs_private;
+	fm->negative_dentry_timeout = ffc->negative_dentry_timeout;
 
 	WARN_ON(fsc->root);
 	fsc->root = dget(sb->s_root);
-- 
2.41.0.185.g7c58973941-goog

