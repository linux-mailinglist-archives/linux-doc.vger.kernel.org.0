Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A405164EC3
	for <lists+linux-doc@lfdr.de>; Wed, 19 Feb 2020 20:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgBSTVq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Feb 2020 14:21:46 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44217 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgBSTVq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 14:21:46 -0500
Received: from 2.general.alexhung.us.vpn ([10.172.65.255] helo=canonical.com)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <alex.hung@canonical.com>)
        id 1j4Uuf-0004eL-24; Wed, 19 Feb 2020 19:21:37 +0000
From:   Alex Hung <alex.hung@canonical.com>
To:     corbet@lwn.net, tglx@linutronix.de, mchehab+samsung@kernel.org,
        akpm@linux-foundation.org, pawan.kumar.gupta@linux.intel.com,
        jgross@suse.com, linux-doc@vger.kernel.org, alex.hung@canonical.com
Subject: [PATCH] Documentation: fix a typo for intel_iommu=nobounce
Date:   Wed, 19 Feb 2020 12:21:33 -0700
Message-Id: <20200219192133.7375-1-alex.hung@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"untrusted" was mis-spelled as "unstrusted"

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dbc22d684627..c8b7ec949453 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1775,7 +1775,7 @@
 			provided by tboot because it makes the system
 			vulnerable to DMA attacks.
 		nobounce [Default off]
-			Disable bounce buffer for unstrusted devices such as
+			Disable bounce buffer for untrusted devices such as
 			the Thunderbolt devices. This will treat the untrusted
 			devices as the trusted ones, hence might expose security
 			risks of DMA attacks.
-- 
2.17.1

