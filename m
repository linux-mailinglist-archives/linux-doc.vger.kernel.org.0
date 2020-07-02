Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73350212963
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 18:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGBQ2M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jul 2020 12:28:12 -0400
Received: from sym2.noone.org ([178.63.92.236]:32828 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbgGBQ2M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 2 Jul 2020 12:28:12 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 49yNn64kMxzvjcZ; Thu,  2 Jul 2020 18:28:10 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>
Cc:     rcu@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: RCU: fix typo in function name
Date:   Thu,  2 Jul 2020 18:28:10 +0200
Message-Id: <20200702162810.31227-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s/sychronize_rcu/synchronize_rcu/

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/RCU/whatisRCU.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index c7f147b8034f..fb3ff76c3e73 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -360,7 +360,7 @@ order to amortize their overhead over many uses of the corresponding APIs.
 
 There are at least three flavors of RCU usage in the Linux kernel. The diagram
 above shows the most common one. On the updater side, the rcu_assign_pointer(),
-sychronize_rcu() and call_rcu() primitives used are the same for all three
+synchronize_rcu() and call_rcu() primitives used are the same for all three
 flavors. However for protection (on the reader side), the primitives used vary
 depending on the flavor:
 
-- 
2.27.0

