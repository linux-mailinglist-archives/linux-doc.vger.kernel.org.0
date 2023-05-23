Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2601870CE7D
	for <lists+linux-doc@lfdr.de>; Tue, 23 May 2023 01:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjEVXJV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 May 2023 19:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjEVXJU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 19:09:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49266C6
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 16:09:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D93E962CA0
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA959C433D2;
        Mon, 22 May 2023 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684796958;
        bh=Wrav6ArXr6FrlYNmND7DFocrKkrHXfOrYo7K3ROROIo=;
        h=From:To:Cc:Subject:Date:From;
        b=lFEaHWzV5mmnxiOZ+DHOSWTBlNvHwxMaPPLaegTQIm0qJaN2S6GG0UOgIS/wTfsFK
         /+HrGTXU6vG+GTxXZ/iz1F69DNoNuJ+DqVBOBMS6eJNiKoR//tUZFmF0+ZVLDB82t/
         RnEmJOtb0Yp2LHD/hDZzGfzwB5dkTr9ijBsFA7GIHL7WdDMLS/V2cr2Tnlxi9uCbGA
         jzyqI/ZPCtcbOnD13zWROGIf7frurlmIT36n34DcQaj9wi08RKMpGWxjkhHy6WmZTO
         ET2wodggGvI2HlfIXkUwnVM5lfPyeT7KVqzLUfPj3WAwqKAIEB3lbqJpkLUHXYwEB4
         m0XxPw1wjeigA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        andrew@lunn.ch, Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: [PATCH net] docs: netdev: document the existence of the mail bot
Date:   Mon, 22 May 2023 16:09:03 -0700
Message-Id: <20230522230903.1853151-1-kuba@kernel.org>
X-Mailer: git-send-email 2.40.1
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

We had a good run, but after 4 weeks of use we heard someone
asking about pw-bot commands. Let's explain its existence
in the docs. It's not a complete documentation but hopefully
it's enough for the casual contributor. The project and scope
are in flux so the details would likely become out of date,
if we were to document more in depth.

Link: https://lore.kernel.org/all/20230522140057.GB18381@nucnuc.mle/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
---
 Documentation/process/maintainer-netdev.rst | 33 ++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index f73ac9e175a8..83614cec9328 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -127,13 +127,32 @@ the value of ``Message-ID`` to the URL above.
 Updating patch status
 ~~~~~~~~~~~~~~~~~~~~~
 
-It may be tempting to help the maintainers and update the state of your
-own patches when you post a new version or spot a bug. Please **do not**
-do that.
-Interfering with the patch status on patchwork will only cause confusion. Leave
-it to the maintainer to figure out what is the most recent and current
-version that should be applied. If there is any doubt, the maintainer
-will reply and ask what should be done.
+Contributors and reviewers do not have the permissions to update patch
+state directly in patchwork. Patchwork doesn't expose much information
+about the history of the state of patches, therefore having multiple
+people update the state leads to confusion.
+
+Instead of delegating patchwork permissions netdev uses a simple mail
+bot which looks for special commands/lines within the emails sent to
+the mailing list. For example to mark a series as Changes Requested
+one needs to send the following line anywhere in the email thread::
+
+  pw-bot: changes-requested
+
+As a result the bot will set the entire series to Changes Requested.
+This may be useful when author discovers a bug in their own series
+and wants to prevent it from getting applied.
+
+The use of the bot is entirely optional, if in doubt ignore its existence
+completely. Maintainers will classify and update the state of the patches
+themselves. No email should ever be sent to the list with the main purpose
+of communicating with the bot, the bot commands should be seen as metadata.
+
+The use of the bot is restricted to authors of the patches (the ``From:``
+header on patch submission and command must match!), maintainers themselves
+and a handful of senior reviewers. Bot records its activity here:
+
+  https://patchwork.hopto.org/pw-bot.html
 
 Review timelines
 ~~~~~~~~~~~~~~~~
-- 
2.40.1

