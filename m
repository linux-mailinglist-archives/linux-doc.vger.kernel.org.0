Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7750074E5E9
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jul 2023 06:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGKEgk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jul 2023 00:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjGKEgj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 00:36:39 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52902E56
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:38 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8ad8383faso38760265ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1689050198; x=1691642198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYyneuFOya7q2sTcPQVJeQ03ke3KB9TyjkGjVTDlnv0=;
        b=US+yv14lPeyTCnFdCgqlMbJNwE5KFha2iFb4bUJz85g79tWQwveWhVddRTdv1h409z
         sTqEZOWjzTPRfgsJPWBR7Xx5TMSMfStlFaNsHvHzD2rRTGfDherNOCKdeLsuMxgINzR2
         RQ/zGyLXnd+lNknbGvcDuOHlIVtsGnIVwOVpXPUZtRNkx761pJZXbBpAEj6JPPSqf78Y
         thC7FMr85gmT+MdH6x1W87SMix0tqX2IT2CXnXTw0rGKCjfu9FSlEa2NOjTvXSK9JIpO
         x4C5KSu2PyHdX8/MP4lTcW1T5X3bIbebYofTJvZNNZEApZEH8RJguPodrK/KFIeniH2p
         hCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689050198; x=1691642198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYyneuFOya7q2sTcPQVJeQ03ke3KB9TyjkGjVTDlnv0=;
        b=NLVova54vpr0QABargC2z8LAKW56FEuwpxDQzM6kXQQnruDZUHviMJy6R4DVxTh7SJ
         KZ1wZjZ0ApGa756hFKTyVjTzVH3aLXrmomv76dna0Va2mxY8HCcneKFc4caqQ8qfQ1tY
         K/IbxJZWCxDARm1OdsTwgxr0OMN2B78kq9201bVt6f5e6X4mVu0q7ESDRaVrefsVVpIp
         XVp8IQsuAf+Oo7tbBh6xERkrxv+p8G71dtYPTHQWNP/IsSo2TCyncYY+sPIySlNh67Hb
         AUfiTAChABG6iNCyu7xmgOxzOkhAicgLB2IMt7ipf2b+Eo7Rvo2J46SkciGNtG8fqDl8
         dfKQ==
X-Gm-Message-State: ABy/qLYgKiOJ2J015BWM9rO1vbo6CVhHdbBSgPzyeh117duC184SMAKj
        Ezcp5dvaCSaJUYanhLgtZVpezg==
X-Google-Smtp-Source: APBJJlHIf59vPvuJkt+nHEjvyzXHNkLoYRaEdMaHVely1xqgzY3bc4iYFFavqAdHFMoBUkKWqV62rg==
X-Received: by 2002:a17:902:e88b:b0:1b8:1d4b:f5fc with SMTP id w11-20020a170902e88b00b001b81d4bf5fcmr17269445plg.30.1689050197840;
        Mon, 10 Jul 2023 21:36:37 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id ij9-20020a170902ab4900b001b9de67285dsm755259plb.156.2023.07.10.21.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 21:36:37 -0700 (PDT)
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To:     Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     me@jcix.top, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: [PATCH 3/5] fuse: add FOPEN_INVAL_ATTR
Date:   Tue, 11 Jul 2023 12:34:03 +0800
Message-Id: <20230711043405.66256-4-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add FOPEN_INVAL_ATTR so that the fuse daemon can ask kernel to invalidate
the attr cache on file open.

The fi->attr_version should be increased when handling FOPEN_INVAL_ATTR.
Because if a FUSE request returning attributes (getattr, setattr, lookup,
and readdirplus) starts before a FUSE_OPEN replying FOPEN_INVAL_ATTR, but
finishes after the FUSE_OPEN, staled attributes will be set to the inode
and falsely clears the inval_mask.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
---
 fs/fuse/file.c            | 10 ++++++++++
 include/uapi/linux/fuse.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index de37a3a06a71..412824a11b7b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -215,6 +215,16 @@ void fuse_finish_open(struct inode *inode, struct file *file)
 		file_update_time(file);
 		fuse_invalidate_attr_mask(inode, FUSE_STATX_MODSIZE);
 	}
+
+	if (ff->open_flags & FOPEN_INVAL_ATTR) {
+		struct fuse_inode *fi = get_fuse_inode(inode);
+
+		spin_lock(&fi->lock);
+		fi->attr_version = atomic64_inc_return(&fc->attr_version);
+		fuse_invalidate_attr(inode);
+		spin_unlock(&fi->lock);
+	}
+
 	if ((file->f_mode & FMODE_WRITE) && fc->writeback_cache)
 		fuse_link_write_file(file);
 }
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index b3fcab13fcd3..1a24c11637a4 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -315,6 +315,7 @@ struct fuse_file_lock {
  * FOPEN_STREAM: the file is stream-like (no file position at all)
  * FOPEN_NOFLUSH: don't flush data cache on close (unless FUSE_WRITEBACK_CACHE)
  * FOPEN_PARALLEL_DIRECT_WRITES: Allow concurrent direct writes on the same inode
+ * FOPEN_INVAL_ATTR: invalidate the attr cache on open
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -323,6 +324,7 @@ struct fuse_file_lock {
 #define FOPEN_STREAM		(1 << 4)
 #define FOPEN_NOFLUSH		(1 << 5)
 #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
+#define FOPEN_INVAL_ATTR	(1 << 7)
 
 /**
  * INIT request/reply flags
-- 
2.20.1

