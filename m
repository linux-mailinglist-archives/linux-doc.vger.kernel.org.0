Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2222616269A
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2020 14:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgBRNAe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Feb 2020 08:00:34 -0500
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:52379 "EHLO
        8.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgBRNAe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 08:00:34 -0500
Received: from player779.ha.ovh.net (unknown [10.110.115.67])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id B69E515A7E1
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2020 14:00:31 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player779.ha.ovh.net (Postfix) with ESMTPSA id 688AEF7773C0;
        Tue, 18 Feb 2020 13:00:19 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 4/8] docs: add missing IPC documentation in sysctl/kernel.rst
Date:   Tue, 18 Feb 2020 13:59:19 +0100
Message-Id: <20200218125923.685-5-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218125923.685-1-steve@sk2.org>
References: <20200218125923.685-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16136115993363828101
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekkedruddvvddruddviedrudduieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds short descriptions of msgmax, msgmnb, msgmni, and shmmni,
which were previously listed in kernel.rst but not described.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d4fa06cab255..76ff10f6f63a 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -409,6 +409,15 @@ to false.  Generally used with the `kexec_load_disabled`_ toggle.
 msgmax, msgmnb, and msgmni
 ==========================
 
+``msgmax`` is the maximum size of an IPC message, in bytes. 8192 by
+default (``MSGMAX``).
+
+``msgmnb`` is the maximum size of an IPC queue, in bytes. 16384 by
+default (``MSGMNB``).
+
+``msgmni`` is the maximum number of IPC queues. 32000 by default
+(``MSGMNI``).
+
 
 msg_next_id, sem_next_id, and shm_next_id (System V IPC)
 ========================================================
@@ -957,6 +966,9 @@ kernel.  This value defaults to ``SHMMAX``.
 shmmni
 ======
 
+This value determines the maximum number of shared memory segments.
+4096 by default (``SHMMNI``).
+
 
 shm_rmid_forced
 ===============
-- 
2.20.1

