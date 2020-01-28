Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6D814BBE0
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2020 15:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgA1Otw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jan 2020 09:49:52 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:59266 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA1OAq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 09:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/hfBTm+pwI/qMUzI6610HUXH01FV0FRb49kTIzGz0Ww=; b=E/bWrY8g75zMz0ST+qe+W7HFkj
        wDMeKMTZMTAyuysD4oyzDqiPBfq5PJjaqrBHRbO3DRwETGjT76NiTJ+IDOMcElzDWhEGVr0YMtfgb
        Clq9k7LePmOncq0P8ZEpqRb4REj15uCz1EE3YO/SQx7Te3aX6CBCynK+ysJpcYHSeApyw70qoM2FZ
        CygR3aUEr9lg6MIKD0scM8wD3QBwwk1XO81cIcUdFdBrMDw8SKV1R3NrFnsnmCuKVVR1x3S50fLpY
        ev1Ps5YqW1PODTcpYMtybxkqWu9DCRG1cTwVDZKrG4uz8OS7M4zwQegY/h4bWibcDsKxbLZ6dt7Ny
        MU2bgp0A==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRQ5-0007iZ-9c; Tue, 28 Jan 2020 14:00:45 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRPp-001BNG-6Z; Tue, 28 Jan 2020 15:00:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 01/27] docs: kvm: add arm/pvtime.rst to index.rst
Date:   Tue, 28 Jan 2020 15:00:02 +0100
Message-Id: <8efe846ddd76d97a62a150a997619e5d7d992774.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add this file to a new kvm/arm index.rst, in order for it to
be shown as part of the virt book.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/arm/index.rst | 10 ++++++++++
 Documentation/virt/kvm/index.rst     |  2 ++
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/virt/kvm/arm/index.rst

diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
new file mode 100644
index 000000000000..e039d9b1e076
--- /dev/null
+++ b/Documentation/virt/kvm/arm/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===
+ARM
+===
+
+.. toctree::
+   :maxdepth: 2
+
+   pvtime
diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index ada224a511fe..488c6370a447 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -10,3 +10,5 @@ KVM
    amd-memory-encryption
    cpuid
    vcpu-requests
+
+   arm/index
-- 
2.24.1

