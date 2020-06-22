Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E532043B4
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2020 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbgFVWfg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 18:35:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:39674 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730785AbgFVWfg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Jun 2020 18:35:36 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 63A1A738;
        Mon, 22 Jun 2020 22:35:36 +0000 (UTC)
Date:   Mon, 22 Jun 2020 16:35:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] docs: Don't push Sphinx upgrades quite so readily
Message-ID: <20200622163535.4921db5a@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The sphinx-pre-install script will put out a verbose message recommending
an upgrade for anybody running less than 2.4.4 - which was only released in
March.  So *everybody* will see that warning at this point.  Let's only
warn if the user is below our generally recommended version (1.7.9
currently).

It might be good to put out a warning if people are explicitly making PDF
files, but would need to be done in a different place and relatively few
people do that.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/sphinx-pre-install | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index c680c3efb176e..40fa6923e80ae 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -323,10 +323,6 @@ sub check_sphinx()
 		$rec_sphinx_upgrade = 1;
 		return;
 	}
-	if ($cur_version lt $min_pdf_version) {
-		$rec_sphinx_upgrade = 1;
-		return;
-	}
 
 	# On version check mode, just assume Sphinx has all mandatory deps
 	exit (0) if ($version_check);
-- 
2.26.2

