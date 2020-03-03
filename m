Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3139177B06
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2020 16:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgCCPuq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Mar 2020 10:50:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:59912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729615AbgCCPuq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:46 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2716B205C9;
        Tue,  3 Mar 2020 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250645;
        bh=RMagY3Tqj95zViVvmt036N1M0PCbb11MoRNMSambxec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SHhXe8Co+xopJbjdy+T2m0NbgPJFn7lU3+Fja0CVZjLBaA5AW48N70C3W2dDkNr0j
         2ZViAy7CQKOS76uppQ2O8KnCBISb+9NNK6a7MceLbXz4XMtKuirNjqm/Ok1NDe729O
         0Vycwrctg5YOr98TcKYzd0NtC5NzlaJ8YfHd63TE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZPE-LX; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Antonio Gomez Iglesias <antonio.gomez.iglesias@intel.com>,
        Waiman Long <longman@redhat.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 9/9] docs: hw-vuln: tsx_async_abort.rst: get rid of an unused ref
Date:   Tue,  3 Mar 2020 16:50:39 +0100
Message-Id: <681c8e2916bf4943ac2277f181668bfbc5fdbc01.1583250595.git.mchehab+huawei@kernel.org>
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

The virt_mechanism reference there points to a section
called elsewhere (Virtualization mitigation). Also, it is
not used anywere.

Besides that, it conflicts with a label with the same name
inside:

	Documentation/admin-guide/hw-vuln/mds.rst

Perhaps added due to some cut-and-paste?

Anyway, as this is not used, let's just get rid of it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/hw-vuln/tsx_async_abort.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/tsx_async_abort.rst b/Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
index af6865b822d2..68d96f0e9c95 100644
--- a/Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
+++ b/Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
@@ -136,8 +136,6 @@ enables the mitigation by default.
 The mitigation can be controlled at boot time via a kernel command line option.
 See :ref:`taa_mitigation_control_command_line`.
 
-.. _virt_mechanism:
-
 Virtualization mitigation
 ^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.24.1

