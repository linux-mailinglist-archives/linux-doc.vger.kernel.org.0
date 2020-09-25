Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3DB278170
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 09:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgIYHYV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 03:24:21 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:1070 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgIYHYV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 03:24:21 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 305184E1942;
        Fri, 25 Sep 2020 15:24:17 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Qing <wangqing@vivo.com>,
        Wang Wenhu <wenhu.wang@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chucheng Luo <luochucheng@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4] doc: zh_CN: add translatation for btrfs
Date:   Fri, 25 Sep 2020 15:22:42 +0800
Message-Id: <1601018642-31711-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGEJJT00dGE4eHRlIVkpNS0pLSkNNTkxOTUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nww6Tyo6TT8fMAIqFCEaEEIj
        EQkwCTlVSlVKTUtKS0pDTU5DS0NIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFIT0NKNwY+
X-HM-Tid: 0a74c425fad79376kuws305184e1942
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/filesystems/btrfs.rst into Chinese.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 .../translations/zh_CN/filesystems/btrfs.rst       | 37 ++++++++++++++++++++++
 .../translations/zh_CN/filesystems/index.rst       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/filesystems/btrfs.rst

diff --git a/Documentation/translations/zh_CN/filesystems/btrfs.rst b/Documentation/translations/zh_CN/filesystems/btrfs.rst
new file mode 100644
index 0000000..8b8cca2
--- /dev/null
+++ b/Documentation/translations/zh_CN/filesystems/btrfs.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/filesystems/ext3.rst <ext3_index>`
+
+translated by 王擎 Wang Qing<wangqing@vivo.com>
+
+=====
+BTRFS
+=====
+
+Btrfs是一个写时复制更新的文件系统，它注重容错、修复和易于管理。
+Btrfs由多家公司联合开发，并获得GPL许可，免费开放给所有人。
+
+Btrfs的主要功能包括：
+
+    *扩展大小的文件存储（文件最大支持2^64）
+    *填充方式使小文件更节省空间
+    *索引目录的方式更节省空间
+    *动态的索引节点分配方式
+    *可写快照的特性
+    *支持子卷（独立的内部根文件系统）
+    *对象级别的镜像克隆
+    *基于数据和元数据的校验和（支持多种算法）
+    *支持压缩
+    *內建多种磁盘阵列算法，支持多种设备
+    *支持离线的文件系统检查
+    *高效的增量备份和文件系统镜像
+    *在线文件系统碎片整理
+
+更多有关信息，请参阅Wiki
+
+  https://btrfs.wiki.kernel.org
+
+维护信息包含管理任务、常见问题、用例、挂载选项、变更日志、
+特性、手册、源码仓、联系人等。
diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
index 186501d..47e86397
--- a/Documentation/translations/zh_CN/filesystems/index.rst
+++ b/Documentation/translations/zh_CN/filesystems/index.rst
@@ -25,4 +25,5 @@ Linux Kernel中的文件系统
 
    virtiofs
    debugfs
+   btrfs
 
-- 
2.7.4

