Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA84834BD56
	for <lists+linux-doc@lfdr.de>; Sun, 28 Mar 2021 18:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhC1QtX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Mar 2021 12:49:23 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:25891 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229538AbhC1QtC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Mar 2021 12:49:02 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Mar 2021 12:49:01 EDT
X-Halon-ID: 96223711-8fe4-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 96223711-8fe4-11eb-b73f-0050569116f7;
        Sun, 28 Mar 2021 18:42:53 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] docs: pin-control: Fix error path for control state example
Date:   Sun, 28 Mar 2021 18:42:22 +0200
Message-Id: <20210328164222.720525-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The error is constructed using the wrong variable.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index c905b273e8331e8a..e2474425fb0c2ba6 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1235,7 +1235,7 @@ default state like this::
 		foo->s = pinctrl_lookup_state(foo->p, PINCTRL_STATE_DEFAULT);
 		if (IS_ERR(foo->s)) {
 			/* FIXME: clean up "foo" here */
-			return PTR_ERR(s);
+			return PTR_ERR(foo->s);
 		}
 
 		ret = pinctrl_select_state(foo->s);
-- 
2.31.1

