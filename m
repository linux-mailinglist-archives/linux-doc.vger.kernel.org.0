Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10356166C17
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2020 01:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbgBUAsz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Feb 2020 19:48:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46453 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729365AbgBUAsz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Feb 2020 19:48:55 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 48NtBF05Wbz9sRl; Fri, 21 Feb 2020 11:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1582246133;
        bh=qnBDIU3ClKj8LI+H5LWYwrMiiSASHJw9umw0hGd2zjY=;
        h=From:To:Cc:Subject:Date:From;
        b=QJihoD3rosrgvwZ17Qb9f+INJumUUNZlehOwdLKk1Ri8WSSQhM5ENnFvDFUV5K/un
         zYmFq5JluyNw2rae+U9ecAKRfy7e8fC8DFY5KsMoO/R2BNAEolMQeysbvIhkTEaS4q
         a0IZjQn5q3OjCPDyPZ0M4np2CxtrUWIHRqE3Fxg1SGVHzfXQuL6nxibkyF4vr5zUHD
         8CqkBoZ+dbjzk2Z0hcBHh3gyKHnfIvcGPqEAMarRvI4Vzm0nNsMrZE8v+2o6kcjR1E
         PauAbml+tDQzZdqD6tG7Aqt2TZWNdB+iBUoF6c8KpHiDPI37nvEvGJZ2o8yfSMYcBX
         1aNWJRqf2stTg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, keescook@chromium.org
Subject: [PATCH] docs/core-api: Add Fedora instructions for GCC plugins
Date:   Fri, 21 Feb 2020 11:48:43 +1100
Message-Id: <20200221004843.1709-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an example of how to install the necessary packages for GCC
plugins on Fedora.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/core-api/gcc-plugins.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/gcc-plugins.rst b/Documentation/core-api/gcc-plugins.rst
index 8502f24396fb..4b1c10f88e30 100644
--- a/Documentation/core-api/gcc-plugins.rst
+++ b/Documentation/core-api/gcc-plugins.rst
@@ -72,6 +72,10 @@ You must install the gcc plugin headers for your gcc version,
 
 	apt-get install gcc-4.9-plugin-dev
 
+Or on Fedora::
+
+	dnf install gcc-plugin-devel
+
 Enable a GCC plugin based feature in the kernel config::
 
 	CONFIG_GCC_PLUGIN_CYC_COMPLEXITY = y
-- 
2.21.1

