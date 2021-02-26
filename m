Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF47326079
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 10:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhBZJta (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 04:49:30 -0500
Received: from mga03.intel.com ([134.134.136.65]:41195 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230292AbhBZJtZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Feb 2021 04:49:25 -0500
IronPort-SDR: Uo81ltxHP9kJPszsP06w/KvOs6C4MZqEkrYdbPPNs0g9j4uo07eN94IKhe+jpRGdQeZZKh60wb
 u46xK2wMurpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185882641"
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="185882641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 01:48:44 -0800
IronPort-SDR: wz3J5nREN8FYG6yk1HK8EEoVt29n6/JZczKHTIWeO8OxURIh1jbT9iYeCVcg14crLCDixbjY2U
 87Pimi4qa0EQ==
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="365793283"
Received: from ciparjol-mobl.amr.corp.intel.com (HELO khuang2-desk.gar.corp.intel.com) ([10.255.230.175])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 01:48:42 -0800
From:   Kai Huang <kai.huang@intel.com>
To:     kvm@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     pbonzini@redhat.com, corbet@lwn.net,
        Kai Huang <kai.huang@intel.com>
Subject: [PATCH] KVM: Documentation: Fix index for KVM_CAP_PPC_DAWR1
Date:   Fri, 26 Feb 2021 22:48:32 +1300
Message-Id: <20210226094832.380394-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It should be 7.23 instead of 7.22, which has already been taken by
KVM_CAP_X86_BUS_LOCK_EXIT.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index aed52b0fc16e..9639fe1e5cae 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6217,7 +6217,7 @@ the bus lock vm exit can be preempted by a higher priority VM exit, the exit
 notifications to userspace can be KVM_EXIT_BUS_LOCK or other reasons.
 KVM_RUN_BUS_LOCK flag is used to distinguish between them.
 
-7.22 KVM_CAP_PPC_DAWR1
+7.23 KVM_CAP_PPC_DAWR1
 ----------------------
 
 :Architectures: ppc
-- 
2.29.2

