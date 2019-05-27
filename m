Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886422BBF5
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2019 00:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfE0W1F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:58682 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727018AbfE0W1F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id BF60D6D6;
        Mon, 27 May 2019 22:27:04 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/7] docs: Do not seek kerneldoc comments in hw-consumer.h
Date:   Mon, 27 May 2019 16:26:54 -0600
Message-Id: <20190527222658.27304-4-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are no kerneldoc comments here, so looking for them just yields a
warning in the docs build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/iio/hw-consumer.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/iio/hw-consumer.rst b/Documentation/driver-api/iio/hw-consumer.rst
index e0fe0b98230e..819fb9edc005 100644
--- a/Documentation/driver-api/iio/hw-consumer.rst
+++ b/Documentation/driver-api/iio/hw-consumer.rst
@@ -45,7 +45,6 @@ A typical IIO HW consumer setup looks like this::
 
 More details
 ============
-.. kernel-doc:: include/linux/iio/hw-consumer.h
 .. kernel-doc:: drivers/iio/buffer/industrialio-hw-consumer.c
    :export:
 
-- 
2.21.0

