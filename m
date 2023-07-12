Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5DE750D9B
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jul 2023 18:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjGLQKS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Jul 2023 12:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGLQKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 12:10:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14677134;
        Wed, 12 Jul 2023 09:10:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A36B9617E4;
        Wed, 12 Jul 2023 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE722C433C8;
        Wed, 12 Jul 2023 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689178216;
        bh=jt61eYrGRcw7GpCYbg4kYqiuc58u1JV93PXN/l01opA=;
        h=From:To:Cc:Subject:Date:From;
        b=EA4Zuk2Ta0cvdCD4lpEWebWL+mlSAbIla2ap8oWfX4ouCaNP7V1q8p5mvqody6Q5G
         S5E+7MJX1VtDy+4rCW44aP4OT3uGfKeqBD287+xD3m/5DhsThDI2/K01XHj0Tr3SWS
         CozBeZcngCMvvyMPpDdhYqmfqLnOVTnU3+PND+jcKvgQfMD7ZenLUtuOCPHrag3Z2w
         2udKm+ViX9rHZc9mDLvwV4LGKM1G+P4yDAmRoCqHtVCCQg4/SwZwxQHUIqYe7x9q4F
         BPQbfSaGdcK6Ip4PK4Pd7i3r840jQxn/beiIvYpukEZYZQFSbo/lzAs/AmPCLWMvuV
         MyWd4B0lhL64w==
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as process docs
Date:   Wed, 12 Jul 2023 09:10:11 -0700
Message-ID: <20230712161011.1339829-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A handful of people got caught out by the recent changes in git
which changed the format of Message-ID and broke our recommended
applyhook for adding lore links.

This was fixed in the docs by commit 2bb19e740e9b ("Documentation:
update git configuration for Link: tag") but it seems like few people
have noticed. Add maintainer directory to the process entry so that
workflows@ gets CCed.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
TBH I wasn't aware / forgot this directory exists. I usually grep
Documentation/process. No real preference but I wanted to mention
the alternative of moving the directory under Documentation/process
instead..
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 99f18f6e8bc6..a04776f01186 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6274,6 +6274,7 @@ DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
 S:	Maintained
 F:	Documentation/process/
+F:	Documentation/maintainer/
 L:	workflows@vger.kernel.org
 
 DOCUMENTATION REPORTING ISSUES
-- 
2.41.0

