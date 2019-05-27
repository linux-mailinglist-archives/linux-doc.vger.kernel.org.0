Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FA72BBF7
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2019 00:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfE0W1F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:58680 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfE0W1F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 0345A6A2;
        Mon, 27 May 2019 22:27:04 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/7] docs: No structured comments in target_core_device.c
Date:   Mon, 27 May 2019 16:26:55 -0600
Message-Id: <20190527222658.27304-5-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/driver-api/target.rst is seeking kerneldoc comments in
drivers/target/target_core_device.c, but no such comments exist.  Take out
the kernel-doc directive and eliminate one warning from the build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/target.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/target.rst b/Documentation/driver-api/target.rst
index 4363611dd86d..620ec6173a93 100644
--- a/Documentation/driver-api/target.rst
+++ b/Documentation/driver-api/target.rst
@@ -10,8 +10,8 @@ TBD
 Target core device interfaces
 =============================
 
-.. kernel-doc:: drivers/target/target_core_device.c
-    :export:
+This section is blank because no kerneldoc comments have been added to
+drivers/target/target_core_device.c.
 
 Target core transport interfaces
 ================================
-- 
2.21.0

