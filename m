Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A4332C6F3
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 02:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245431AbhCDAaf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Mar 2021 19:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383013AbhCCNjl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 08:39:41 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6562CC06121F
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 05:38:50 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by baptiste.telenet-ops.be with bizsmtp
        id bpen2400X4huzR801penuR; Wed, 03 Mar 2021 14:38:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRiB-004Q0k-FE; Wed, 03 Mar 2021 14:38:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRiA-00GWpZ-TS; Wed, 03 Mar 2021 14:38:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] docs: driver-model: device: Add helper macro examples
Date:   Wed,  3 Mar 2021 14:38:43 +0100
Message-Id: <20210303133845.3939403-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

	Hi Jon, Greg, Rafael,

The DEVICE_ATTR_* and ATTRIBUTE_GROUPS() helper macros have existed for
more than a decade, but are still not mentioned in the driver-model
device documentation.  Hence this patch series adds them, including
examples, to the documentation.

Thanks for your comments!

Geert Uytterhoeven (2):
  docs: driver-model: device: Add DEVICE_ATTR_{RO,RW} examples
  docs: driver-model: device: Add ATTRIBUTE_GROUPS() example

 .../driver-api/driver-model/device.rst        | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
