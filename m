Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A250015C9E6
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 19:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgBMSEn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 13:04:43 -0500
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:38366 "EHLO
        1.mo173.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgBMSEn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 13:04:43 -0500
Received: from player715.ha.ovh.net (unknown [10.108.35.27])
        by mo173.mail-out.ovh.net (Postfix) with ESMTP id C18AD13030D
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 18:48:44 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id F049AF2A66E8;
        Thu, 13 Feb 2020 17:48:33 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 3/6] docs: drop l2cr from sysctl/kernel.rst
Date:   Thu, 13 Feb 2020 18:46:58 +0100
Message-Id: <20200213174701.3200366-4-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213174701.3200366-1-steve@sk2.org>
References: <20200213174701.3200366-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10086937267792268677
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpkeekrdduvddvrdduvdeirdduudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The l2cr sysctl entry was removed in commit c2f3dabefa73 ("sysctl:
kill binary sysctl KERN_PPC_L2CR"), this removes the corresponding
documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 1aacd7a24f5a..9221366901af 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -378,13 +378,6 @@ When ``kptr_restrict`` is set to 2, kernel pointers printed using
 %pK will be replaced with 0s regardless of privileges.
 
 
-l2cr (PPC only)
-===============
-
-This flag controls the L2 cache of G3 processor boards. If
-0, the cache is disabled. Enabled if nonzero.
-
-
 modprobe
 ========
 
-- 
2.24.1

