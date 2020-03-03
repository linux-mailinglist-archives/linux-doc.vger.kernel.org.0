Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA873177B0A
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2020 16:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgCCPuu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Mar 2020 10:50:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730242AbgCCPuu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:50 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C49A6206E2;
        Tue,  3 Mar 2020 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250650;
        bh=+shblSsqCNpI+F1Vxv+7A0G+8FOQYxCRqXy2XQEABdI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jezWVwCYJ1CLqc9CuTO65ctCrb1XuK1y7eR0tc6Q4UMwfwbtsO3bzkFJJw+Kq3CRN
         HIL1e86bEf4MEiddlX0f08ghL04bWyd7xGvmp5+Bto2RcoZVfbz9nFATFMLP/HEL6z
         ocGJNgFM3VKJky+HCV/BI0dwA7X0jF7+66abqwEA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZOu-G7; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 4/9] docs: driver.rst: supress two ReSt warnings
Date:   Tue,  3 Mar 2020 16:50:34 +0100
Message-Id: <8356b02547087979f57cb71fbefb5e5f636c78f4.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Get rid of those, by marking a literal block as such:

	Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected indentation.
	Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/driver-model/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/driver.rst b/Documentation/driver-api/driver-model/driver.rst
index baa6a85c8287..63887b813005 100644
--- a/Documentation/driver-api/driver-model/driver.rst
+++ b/Documentation/driver-api/driver-model/driver.rst
@@ -210,7 +210,7 @@ probed.
 While the typical use case for sync_state() is to have the kernel cleanly take
 over management of devices from the bootloader, the usage of sync_state() is
 not restricted to that. Use it whenever it makes sense to take an action after
-all the consumers of a device have probed.
+all the consumers of a device have probed::
 
 	int 	(*remove)	(struct device *dev);
 
-- 
2.24.1

