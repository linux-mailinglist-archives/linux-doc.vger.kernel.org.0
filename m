Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5603A4CF35C
	for <lists+linux-doc@lfdr.de>; Mon,  7 Mar 2022 09:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbiCGIQI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Mar 2022 03:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiCGIQI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:16:08 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792FE5C646
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:15:14 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id z15so13070917pfe.7
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=AZgDMym0YEBStA/zabHTEyyJsPkQ/V4SdG//7v0f6CwnurLEtn8wX5+bHreeK534zC
         su5GYQPEkHW9DZjgi9dw5R3qkdE3tkfMC3L+0z1e+pz4pQ+beG+Sd0Kne14E4Qw1rBxS
         zyReY29EICnf1aS3s3EohjEvGLniSRXVnLvUETBh00tUn8xeUmFpGP8u+a1BbG6Cc06q
         x070vTV13O8Oc9YGfov89JsHwXvlrktDI92IZQnaZl1d6zZjNUmV5v5qdtLC8WlvN0D9
         /n7zzuEInrYZcd5Ek0OnFimcrp4rfg00HTleIqpPanNAsUPk52p2Hbf4lbjWcoDCFpOq
         ZXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=cTtAxGOF61NFNPbdLX0NlZgti8/vKF1Uza6TylvW72x6KoyNXMbWkn1mnvm1PYdKZ1
         btqKP04QJrc2tTcWrYtQVRPpPwIjw5RlfjMX7RfxD0RgAc62KjOSCFxfe0nbu3nqYLAj
         03RrmPuZWQAMRkX75OPzWIc6N4H1YtjvFFIf2OJBD6Uh/oJvfOAqU3EL5XEKPJKqd0KS
         NQ6CLOsZmG2QD4/rUt1X3/z6RfDSlyFnfdS6NylGlazgcSAa4ZSR+/+K8lIVtc6OR8RY
         ia1ooNQSOqgR9XzXPjNDNTvi/e+bgYuB467iI58vjef1JDq+itEMbD/ZVrCLDf8knYz4
         IouQ==
X-Gm-Message-State: AOAM531vve3LNOtD+5UwpXzkhMzkP0A2jZ9DHXfnq9wUsTDIbmrZ+hsD
        pc2NHYxJjOGi1vKnM+Zzp/s=
X-Google-Smtp-Source: ABdhPJwDcvTyYURaAwaDIbXegs2hr1mv5kP9jOFYa8JIQNt8LRKxjXcqWBPfROCHTtZd4w3mCyfDCQ==
X-Received: by 2002:a65:4003:0:b0:37f:f658:8fd1 with SMTP id f3-20020a654003000000b0037ff6588fd1mr1452477pgp.214.1646640914012;
        Mon, 07 Mar 2022 00:15:14 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id w17-20020a056a0014d100b004f1063290basm15426309pfu.15.2022.03.07.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:15:13 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, yang.yang29@zte.com.cn,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Mon,  7 Mar 2022 16:16:07 +0800
Message-Id: <166e00d325fc1355e455fb26686abce8f9fa90c0.1646634928.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646634928.git.siyanteng@loongson.cn>
References: <cover.1646634928.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

Translate Documentation/admin-guide/mm/index.rst into Chinese.
Update Documentation/admin-guide/index.rst.

Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 .../zh_CN/admin-guide/mm/index.rst            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 548e57f4b3f1..763055f161dd 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -69,6 +69,7 @@ Todolist:
    lockup-watchdogs
    unicode
    sysrq
+   mm/index
 
 Todolist:
 
@@ -105,7 +106,6 @@ Todolist:
    LSM/index
    md
    media/index
-   mm/index
    module-signing
    mono
    namespaces/index
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
new file mode 100644
index 000000000000..44f66a45859d
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
@@ -0,0 +1,49 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original:   Documentation/admin-guide/mm/index.rst
+
+:翻译:
+
+  徐鑫 xu xin <xu.xin16@zte.com.cn>
+
+
+========
+内存管理
+========
+
+Linux内存管理子系统，顾名思义，是负责系统中的内存管理。它包括了虚拟内存与请求
+分页的实现，内核内部结构和用户空间程序的内存分配、将文件映射到进程地址空间以
+及许多其他很酷的事情。
+
+Linux内存管理是一个具有许多可配置设置的复杂系统, 且这些设置中的大多数都可以通
+过 ``/proc`` 文件系统获得，并且可以使用 ``sysctl`` 进行查询和调整。这些API接
+口被描述在Documentation/admin-guide/sysctl/vm.rst文件和 `man 5 proc`_ 中。
+
+.. _man 5 proc: http://man7.org/linux/man-pages/man5/proc.5.html
+
+Linux内存管理有它自己的术语，如果你还不熟悉它，请考虑阅读下面参考：
+:ref:`Documentation/admin-guide/mm/concepts.rst <mm_concepts>`.
+
+在此目录下，我们详细描述了如何与Linux内存管理中的各种机制交互。
+
+.. toctree::
+   :maxdepth: 1
+
+   ksm
+
+Todolist:
+* concepts
+* cma_debugfs
+* damon/index
+* hugetlbpage
+* idle_page_tracking
+* memory-hotplug
+* nommu-mmap
+* numa_memory_policy
+* numaperf
+* pagemap
+* soft-dirty
+* swap_numa
+* transhuge
+* userfaultfd
+* zswap
-- 
2.27.0

