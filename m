Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D0B5B495A
	for <lists+linux-doc@lfdr.de>; Sat, 10 Sep 2022 23:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiIJVTG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 10 Sep 2022 17:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiIJVSU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Sep 2022 17:18:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8E84C608;
        Sat, 10 Sep 2022 14:17:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9359B60EBC;
        Sat, 10 Sep 2022 21:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2765BC433C1;
        Sat, 10 Sep 2022 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844631;
        bh=54RdefYutBM/Gw3iVNj/W+hkwOzEHl/9vNlS+w2lrfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ovYwvZg1DH9RMvHKRSstn/kaviXXpk3SInrbZjsRMDKUZCibt1Qsn/DjfGSi4iyB1
         /za5LFzgvFb+oYAekePjtonZqvRTuOUirfEKCOHxIbU+G1y9FU/ORrPhCtSjSoDt2J
         ZNflwPLHArJjtxa3oMdbh2+jKue1nAWF9RlCbrrCNj7QBK0TjwyQfYZAwGvqgEk7I6
         NcyXmoXbd4pWtx8XHWh7bOqblt3cf7z+Fp7oy3Di6R1FkMCGY7uxw4yWIRCBS0SSno
         +7zP4hZpkwewyOraVnvlRdAjLHluiMDG0HPPf1zjiwPJnoSqRvB106F5i56PfKIboy
         3zMz2Lod/xeoQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Tulli <greg.iforce@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 23/38] Input: iforce - add support for Boeder Force Feedback Wheel
Date:   Sat, 10 Sep 2022 17:16:08 -0400
Message-Id: <20220910211623.69825-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211623.69825-1-sashal@kernel.org>
References: <20220910211623.69825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Greg Tulli <greg.iforce@gmail.com>

[ Upstream commit 9c9c71168f7979f3798b61c65b4530fbfbcf19d1 ]

Add a new iforce_device entry to support the Boeder Force Feedback Wheel
device.

Signed-off-by: Greg Tulli <greg.iforce@gmail.com>
Link: https://lore.kernel.org/r/3256420-c8ac-31b-8499-3c488a9880fd@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/input/joydev/joystick.rst     | 1 +
 drivers/input/joystick/iforce/iforce-main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/input/joydev/joystick.rst b/Documentation/input/joydev/joystick.rst
index f615906a0821b..6d721396717a2 100644
--- a/Documentation/input/joydev/joystick.rst
+++ b/Documentation/input/joydev/joystick.rst
@@ -517,6 +517,7 @@ All I-Force devices are supported by the iforce module. This includes:
 * AVB Mag Turbo Force
 * AVB Top Shot Pegasus
 * AVB Top Shot Force Feedback Racing Wheel
+* Boeder Force Feedback Wheel
 * Logitech WingMan Force
 * Logitech WingMan Force Wheel
 * Guillemot Race Leader Force Feedback
diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
index b2a68bc9f0b4d..b86de1312512b 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -50,6 +50,7 @@ static struct iforce_device iforce_device[] = {
 	{ 0x046d, 0xc291, "Logitech WingMan Formula Force",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x020a, "AVB Top Shot Pegasus",			btn_joystick_avb, abs_avb_pegasus, ff_iforce },
 	{ 0x05ef, 0x8884, "AVB Mag Turbo Force",			btn_wheel, abs_wheel, ff_iforce },
+	{ 0x05ef, 0x8886, "Boeder Force Feedback Wheel",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",	btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc0a4, "ACT LABS Force RS",                          btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc084, "ACT LABS Force RS",				btn_wheel, abs_wheel, ff_iforce },
-- 
2.35.1

