Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7F175B3EC
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jul 2023 18:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjGTQN1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Jul 2023 12:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTQN0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 12:13:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D4A114
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 09:13:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 98E8861B50
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 16:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF70C433C8;
        Thu, 20 Jul 2023 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689869605;
        bh=7ge2fOsjLfpNMD9+tTxQ3+5s+AaPVGRq3Y7BqSfrG8A=;
        h=From:To:Cc:Subject:Date:From;
        b=eDKJNB981Uy6+xAEBWEc69nBD6AXCer0/6bchvFbh9wf9ru8vQtjt/8jbwvkAHiIZ
         IDSpqZm7ZU8eLNBtOWEi6KYCWDjl5ehNiVJXD9fC+9styReQdSQt74mI1hCvq0hCya
         l7GKrR6/oBe9+hfn2ynagLi7c5q2OhWT6ClmDdwe35q9bytKUBqV4hHDq0Nsl8U6+Y
         o4kY3p+k6paIMCd+EKM0rr/wt1xzC/4Bbfs2V0/oPjS5F1l8W/hiyv+l7KEgsJ8Swn
         ky2MUv7+dsvmaBWRZ4ib/xmTkQdoCc+7Xef5nqyHvNam00LGiWgbjFTFRO7akfPiO0
         E55R0gHBwi7gA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: [PATCH net] docs: net: clarify the NAPI rules around XDP Tx
Date:   Thu, 20 Jul 2023 09:13:23 -0700
Message-ID: <20230720161323.2025379-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

page pool and XDP should not be accessed from IRQ context
which may happen if drivers try to clean up XDP TX with
NAPI budget of 0.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
---
 Documentation/networking/napi.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/napi.rst b/Documentation/networking/napi.rst
index a7a047742e93..7bf7b95c4f7a 100644
--- a/Documentation/networking/napi.rst
+++ b/Documentation/networking/napi.rst
@@ -65,15 +65,16 @@ argument - drivers can process completions for any number of Tx
 packets but should only process up to ``budget`` number of
 Rx packets. Rx processing is usually much more expensive.
 
-In other words, it is recommended to ignore the budget argument when
-performing TX buffer reclamation to ensure that the reclamation is not
-arbitrarily bounded; however, it is required to honor the budget argument
-for RX processing.
+In other words for Rx processing the ``budget`` argument limits how many
+packets driver can process in a single poll. Rx specific APIs like page
+pool or XDP cannot be used at all when ``budget`` is 0.
+skb Tx processing should happen regardless of the ``budget``, but if
+the argument is 0 driver cannot call any XDP (or page pool) APIs.
 
 .. warning::
 
-   The ``budget`` argument may be 0 if core tries to only process Tx completions
-   and no Rx packets.
+   The ``budget`` argument may be 0 if core tries to only process
+   skb Tx completions and no Rx or XDP packets.
 
 The poll method returns the amount of work done. If the driver still
 has outstanding work to do (e.g. ``budget`` was exhausted)
-- 
2.41.0

