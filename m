Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F451647AD
	for <lists+linux-doc@lfdr.de>; Wed, 19 Feb 2020 16:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgBSPB6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Feb 2020 10:01:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55676 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgBSPB6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:01:58 -0500
Received: from fencepost.gnu.org ([2001:470:142:3::e]:39023)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <lxsameer@gnu.org>)
        id 1j4QrN-0000Zm-MC; Wed, 19 Feb 2020 10:01:57 -0500
Received: from [159.253.226.146] (port=47876 helo=localhost.localdomain)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.82)
        (envelope-from <lxsameer@gnu.org>)
        id 1j4QrL-0000Fc-TH; Wed, 19 Feb 2020 10:01:56 -0500
From:   lxsameer@gnu.org
To:     corbet@lwn.net
Cc:     rdunlap@infradead.org, linux-doc@vger.kernel.org,
        Sameer Rahmani <lxsameer@gnu.org>
Subject: [PATCH v2 2/2] Documentation: kobject.txt has been moved to core-api/kobject.rst
Date:   Wed, 19 Feb 2020 15:02:07 +0000
Message-Id: <20200219150207.2811054-2-lxsameer@gnu.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219150207.2811054-1-lxsameer@gnu.org>
References: <20200219150207.2811054-1-lxsameer@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sameer Rahmani <lxsameer@gnu.org>

Moved the `kobject.txt` to `core-api/kobject.rst` and updated the `core-api` index
to point to it.

Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
---
 Documentation/core-api/index.rst                    | 1 +
 Documentation/{kobject.txt => core-api/kobject.rst} | 0
 2 files changed, 1 insertion(+)
 rename Documentation/{kobject.txt => core-api/kobject.rst} (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index a501dc1c90d0..65035d60f5ee 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -11,6 +11,7 @@ Core utilities
 .. toctree::
    :maxdepth: 1
 
+   kobject
    kernel-api
    assoc_array
    atomic_ops
diff --git a/Documentation/kobject.txt b/Documentation/core-api/kobject.rst
similarity index 100%
rename from Documentation/kobject.txt
rename to Documentation/core-api/kobject.rst
-- 
2.25.0

