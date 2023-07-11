Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90EC974E5EE
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jul 2023 06:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjGKEg7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jul 2023 00:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjGKEgy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 00:36:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A0090
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:29 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a1ebb85f99so4614423b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1689050188; x=1691642188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq3lPXWT5aXljLcGjDhakg0e9OKm0kYjlfzX3G1YySM=;
        b=U/k0gmhKprSH8HHPSLhEKtiEwMpj3UCthlCHSjtbF4pXeTx53Jd5X+28zSCp3EQVWN
         gXH2/NxX1zWMZCkwtk1MolZBOeamaf25jM/L7DL/3kmjblno55kjVz0wZa6B6lfv2fEY
         gYjG8h/brzAri8nVPWa/vxt9zxQcmjY+Yv3+TGwJuhyLNCOHN+3PR5VG8+qY/EixG2AY
         OV/2xCqVSI81tQmCUeAcc1ZyLSQo8kSipb74slZE04gzTTzObNMQVx6jfu9EojvDiX+X
         Q7NDao/lscWvdSB3CkmJM9vpJyKRn4RqjJ7mDz85hJYD2PixQfn3Xx3V7DzZNj/Lofcy
         q+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689050188; x=1691642188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq3lPXWT5aXljLcGjDhakg0e9OKm0kYjlfzX3G1YySM=;
        b=ESjXTiBrpcudlgtw8uEVSh3vC+XH9IBt9PY1bCFKwmFppqwGJ/Bvl5pn1fG1RfKKvG
         31EBarT2lur7R/OrzXMcbCDKW2x0o5Iy8D0bTvARvRU+uNf3wZF8sMAe198D80889suR
         FowDwS26PjhTwQVlZOZUmksdcsWI0OuQPO6Osl984VGeFenNoaV3zs9XFniHfu5h1W5Q
         ToMYYXe0C6QovcpkEV9D7OtDzepRXeWDpYVY3iWtiPTU4q1XlvDvPOeqXYuCHfL4asZy
         ReysWjUcLUC2U43bnLYoEbVJp4uMqHtWQVdG3/eVVh/7IXDCtSJpuDBesV16RUac+RyF
         ejFQ==
X-Gm-Message-State: ABy/qLYzar50RcwPnpC+OgrtkUfm9T8Sm+2IBOT6is1BYZ0F93BKg6Tb
        jUwH6UhL7o4quQiEIyAtX4WrCw==
X-Google-Smtp-Source: APBJJlG/BcxDe+NZs8OlImStJRESCa7bKcOOGDXXexFkijj4ysQOckROCY3jTsXmvPKD+bullkwFKg==
X-Received: by 2002:a05:6358:9910:b0:134:ddad:2b4f with SMTP id w16-20020a056358991000b00134ddad2b4fmr14191945rwa.18.1689050188217;
        Mon, 10 Jul 2023 21:36:28 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id ij9-20020a170902ab4900b001b9de67285dsm755259plb.156.2023.07.10.21.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 21:36:27 -0700 (PDT)
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To:     Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     me@jcix.top, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: [PATCH 0/5] FUSE consistency improvements
Date:   Tue, 11 Jul 2023 12:34:00 +0800
Message-Id: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset resends some patches that related to FUSE consistency
improvements in the mailing list.

The 1st patch fixes a staleness-checking issue, which is the v2 version
of the patch[1].

The 2nd patch is a resend version of the patch[2] with its commit message
rewritten.

The 3rd and 4th patches are new versions of the patch[3] and the patch[4],
FUSE filesystems are able to implement the close-to-open (CTO) consistency
semantics with the help of these two patches. The 5th patch is a new
patch which improves the explanation of FUSE cache mode and consistency
models in the documentation.


[1] [PATCH] fuse: initialize attr_version of new fuse inodes by fc->attr_version,
https://lore.kernel.org/lkml/20221111093702.80975-1-zhangjiachen.jaycee@bytedance.com/
[2] [PATCH] fuse: invalidate dentry on EEXIST creates or ENOENT deletes,
https://lore.kernel.org/lkml/20220805131823.83544-1-zhangjiachen.jaycee@bytedance.com/
[3] [PATCH] fuse: add FOPEN_INVAL_ATTR,
https://lore.kernel.org/lkml/20220608104202.19461-1-zhangjiachen.jaycee@bytedance.com/
[4] [PATCH] fuse: writeback_cache consistency enhancement (writeback_cache_v2),
https://lore.kernel.org/lkml/20220624055825.29183-1-zhangjiachen.jaycee@bytedance.com/


Jiachen Zhang (5):
  fuse: check attributes staleness on fuse_iget()
  fuse: invalidate dentry on EEXIST creates or ENOENT deletes
  fuse: add FOPEN_INVAL_ATTR
  fuse: writeback_cache consistency enhancement (writeback_cache_v2)
  docs: fuse: improve FUSE consistency explanation

 Documentation/filesystems/fuse-io.rst | 32 +++++++++++++++--
 fs/fuse/dir.c                         | 11 +++---
 fs/fuse/file.c                        | 35 +++++++++++++++++++
 fs/fuse/fuse_i.h                      |  6 ++++
 fs/fuse/inode.c                       | 49 +++++++++++++++++++++++++--
 include/uapi/linux/fuse.h             | 11 +++++-
 6 files changed, 135 insertions(+), 9 deletions(-)

-- 
2.20.1

