Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40FDC15CA57
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 19:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBMS1K (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 13:27:10 -0500
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:48829 "EHLO
        1.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbgBMS1K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 13:27:10 -0500
Received: from player715.ha.ovh.net (unknown [10.110.208.131])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6191D158DFD
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 18:47:55 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id E5037F2A64BB;
        Thu, 13 Feb 2020 17:47:44 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 0/6] docs: sysctl/kernel.rst rework
Date:   Thu, 13 Feb 2020 18:46:55 +0100
Message-Id: <20200213174701.3200366-1-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10073144994123304325
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekkedruddvvddruddviedrudduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

A recent discussion about differences in the "panic" description in
sysctl/kernel.rst led me to look into completing that file, and it
turned out that more work was needed than documenting "panic". This
patch series is the first batch, making the resulting documentation
hopefully nicer and more accurate. It doesn't add fields that are
present in 5.5 but not documented, that's the subject of another
series of patches I haven't started working on yet...

Regards,

Stephen


Stephen Kitt (6):
  docs: pretty up sysctl/kernel.rst
  docs: merge debugging-modules.txt into sysctl/kernel.rst
  docs: drop l2cr from sysctl/kernel.rst
  docs: add missing IPC documentation in sysctl/kernel.rst
  docs: document stop-a in sysctl/kernel.rst
  docs: document panic fully in sysctl/kernel.rst

 Documentation/admin-guide/sysctl/kernel.rst | 1026 ++++++++++---------
 Documentation/debugging-modules.txt         |   22 -
 2 files changed, 530 insertions(+), 518 deletions(-)
 delete mode 100644 Documentation/debugging-modules.txt


base-commit: 359c92c02bfae1a6f1e8e37c298e518fd256642c
-- 
2.24.1

