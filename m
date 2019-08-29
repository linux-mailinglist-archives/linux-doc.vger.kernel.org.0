Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0565A1E08
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 16:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfH2OzQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 10:55:16 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36441 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfH2OzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:55:15 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 10497E0011;
        Thu, 29 Aug 2019 14:55:13 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] ALSA: doc: Fix PCM interface section typos
Date:   Thu, 29 Aug 2019 16:55:12 +0200
Message-Id: <20190829145512.3752-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix two mistakes in the PCM interface section:
1/ Members of the snd_pcm_hardware structure are channels_{min,max}
   and not channel_{min,max} (mind the 's').
2/ Another sentence is incomplete as the reference to one structure
   member (period_bytes_max) is missing.

There is no relevant 'Fixes:' tag to apply as both typos predate the
Git era.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 6b154dbb02cc..3488b8be5bd5 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1715,16 +1715,16 @@ Typically, you'll have a hardware descriptor as below:
 -  ``rate_min`` and ``rate_max`` define the minimum and maximum sample
    rate. This should correspond somehow to ``rates`` bits.
 
--  ``channel_min`` and ``channel_max`` define, as you might already
+-  ``channels_min`` and ``channels_max`` define, as you might already
    expected, the minimum and maximum number of channels.
 
 -  ``buffer_bytes_max`` defines the maximum buffer size in
    bytes. There is no ``buffer_bytes_min`` field, since it can be
    calculated from the minimum period size and the minimum number of
-   periods. Meanwhile, ``period_bytes_min`` and define the minimum and
-   maximum size of the period in bytes. ``periods_max`` and
-   ``periods_min`` define the maximum and minimum number of periods in
-   the buffer.
+   periods. Meanwhile, ``period_bytes_min`` and ``period_bytes_max``
+   define the minimum and maximum size of the period in bytes.
+   ``periods_max`` and ``periods_min`` define the maximum and minimum
+   number of periods in the buffer.
 
    The “period” is a term that corresponds to a fragment in the OSS
    world. The period defines the size at which a PCM interrupt is
-- 
2.20.1

