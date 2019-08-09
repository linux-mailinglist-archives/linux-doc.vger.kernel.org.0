Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD423886F6
	for <lists+linux-doc@lfdr.de>; Sat, 10 Aug 2019 01:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfHIXhe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Aug 2019 19:37:34 -0400
Received: from mail3.marvil07.net ([139.162.190.158]:49216 "EHLO
        mail3.marvil07.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfHIXhe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Aug 2019 19:37:34 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Aug 2019 19:37:34 EDT
Received: from localhost.localdomain (unknown [179.6.221.43])
        by mail3.marvil07.net (Postfix) with ESMTPSA id 6F7CB1EF3B;
        Fri,  9 Aug 2019 23:29:38 +0000 (UTC)
From:   Marco Villegas <git@marvil07.net>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marco Villegas <git@marvil07.net>
Subject: [PATCH] docs: Fix typo on pull requests guide
Date:   Fri,  9 Aug 2019 18:29:07 -0500
Message-Id: <20190809232907.5432-1-git@marvil07.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Marco Villegas <git@marvil07.net>
---
 Documentation/maintainer/pull-requests.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/maintainer/pull-requests.rst b/Documentation/maintainer/pull-requests.rst
index 22b271de0304..1a2f99b67d25 100644
--- a/Documentation/maintainer/pull-requests.rst
+++ b/Documentation/maintainer/pull-requests.rst
@@ -29,7 +29,7 @@ request to.
 In order to create the pull request you must first tag the branch that you
 have just created. It is recommended that you choose a meaningful tag name,
 in a way that you and others can understand, even after some time.  A good
-practice is to include in the name an indicator of the sybsystem of origin
+practice is to include in the name an indicator of the subsystem of origin
 and the target kernel version.
 
 Greg offers the following. A pull request with miscellaneous stuff for
-- 
2.20.1

