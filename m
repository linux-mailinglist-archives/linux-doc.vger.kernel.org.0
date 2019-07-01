Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF46F2BBF6
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2019 00:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfE0W1G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 May 2019 18:27:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:58690 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfE0W1G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:06 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 753276D6;
        Mon, 27 May 2019 22:27:05 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/7] docs: No structured comments in include/linux/interconnect.h
Date:   Mon, 27 May 2019 16:26:57 -0600
Message-Id: <20190527222658.27304-7-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the kernel-doc directive for this file, since there's nothing there
and it generates a warning.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/interconnect/interconnect.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
index b8107dcc4cd3..c3e004893796 100644
--- a/Documentation/interconnect/interconnect.rst
+++ b/Documentation/interconnect/interconnect.rst
@@ -89,6 +89,5 @@ Interconnect consumers
 
 Interconnect consumers are the clients which use the interconnect APIs to
 get paths between endpoints and set their bandwidth/latency/QoS requirements
-for these interconnect paths.
-
-.. kernel-doc:: include/linux/interconnect.h
+for these interconnect paths.  These interfaces are not currently
+documented.
-- 
2.21.0

