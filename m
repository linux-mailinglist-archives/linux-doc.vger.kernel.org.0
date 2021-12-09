Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929ED46E5FF
	for <lists+linux-doc@lfdr.de>; Thu,  9 Dec 2021 10:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhLIJ7M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Dec 2021 04:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhLIJ7M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:59:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC6C061746;
        Thu,  9 Dec 2021 01:55:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95264B82411;
        Thu,  9 Dec 2021 09:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EE5C004DD;
        Thu,  9 Dec 2021 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639043736;
        bh=W7pXooK1kVAIY+RLt1VIpEkQiuX45GNgfUBx3j8LOw4=;
        h=From:To:Cc:Subject:Date:From;
        b=jr61v5g/Tr2SVx2Qb+qDaI6TyL6azG6o2chCU6Rmoel6iyGYtIWG/OqZoA7UrpuiK
         fJOgAhNVLPT7KYNNdHD2DLkC6U+Z1r31Ll8EuJmoZfb3nKadzS1UqOuIOIQ6oQArTK
         6SMlNaNv9kMYjSwQeOWn0JkElJdmMkk8RCPr3CiK+K+NlSyYO6EdkKoHA6wjLcJks+
         H7p6iZ8Di44CG2gAGZN4K/XrX7hbHcdYZa4EEN46HHEfbPaqc+8R6WMu/1EBT023dP
         E5ExyOieZvkVFrSOmPuKVhPzSYjW0D+KRAmPcSFzG+8Ov0SARf3pk8ltlOkKZ924vw
         Qv6cRuTz1ZEGg==
From:   alexs@kernel.org
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng01@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] doc/zh_CN: add Chinese document coding style reminder
Date:   Thu,  9 Dec 2021 17:55:28 +0800
Message-Id: <20211209095528.68875-1-alexs@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alex Shi <alexs@kernel.org>

The coding style requirement for Chinese document is easy to be overlooked.
Add the request as a remdiner.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <siyanteng01@gmail.com>
Cc: Tang Yizhou <tangyizhou@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/translations/zh_CN/index.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index a34e58733ac8..b01c04227d8a 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -23,6 +23,11 @@
 另外，随时欢迎您对内核文档进行改进；如果您想提供帮助，请加入vger.kernel.org
 上的linux-doc邮件列表。
 
+顺便说下，中文文档也需要遵守内核编码风格，风格中中文和英文的主要不同就是中文
+的字符标点占用两个英文字符宽度， 所以，当英文要求不要超过每行100个字符时，
+中文就不要超过50个字符。另外，也要注意'-'，'=' 等符号与相关标题的对齐。在将
+补丁提交到社区之前，一定要进行必要的checkpatch.pl检查和编译测试。
+
 许可证文档
 ----------
 
-- 
2.25.1

