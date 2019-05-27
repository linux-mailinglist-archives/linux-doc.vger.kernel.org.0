Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140B92BBF3
	for <lists+linux-doc@lfdr.de>; Tue, 28 May 2019 00:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfE0W1F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:58680 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfE0W1F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 85739728;
        Mon, 27 May 2019 22:27:04 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/7] docs: Fix a misdirected kerneldoc directive
Date:   Mon, 27 May 2019 16:26:53 -0600
Message-Id: <20190527222658.27304-3-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The stratix10 service layer documentation tried to include a kerneldoc
comments for a nonexistent struct; leading to a "no structured comments
found" message.  Switch it to stratix10_svc_command_config_type, which
appears at that spot in the sequence and was not included.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/firmware/other_interfaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index a4ac54b5fd79..b81794e0cfbb 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -33,7 +33,7 @@ of the requests on to a secure monitor (EL3).
    :functions: stratix10_svc_client_msg
 
 .. kernel-doc:: include/linux/firmware/intel/stratix10-svc-client.h
-   :functions: stratix10_svc_command_reconfig_payload
+   :functions: stratix10_svc_command_config_type
 
 .. kernel-doc:: include/linux/firmware/intel/stratix10-svc-client.h
    :functions: stratix10_svc_cb_data
-- 
2.21.0

