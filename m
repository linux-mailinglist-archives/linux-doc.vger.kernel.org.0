Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0678A4873F0
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jan 2022 09:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbiAGINR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jan 2022 03:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345550AbiAGINR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 03:13:17 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23030C0611FF
        for <linux-doc@vger.kernel.org>; Fri,  7 Jan 2022 00:13:16 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t28so2783050wrb.4
        for <linux-doc@vger.kernel.org>; Fri, 07 Jan 2022 00:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5vv85VvwS9MS7JlafP+Njn1B1aPbUU7IaGWNQUgbis=;
        b=iL8oFfe43QgftfpgHnQgjVBubyyuLqUpSLqUuyf72+AdnVY5pkBhR2O1qtoN8yBp2K
         3A2ayZWo16ycvCobtZkcAr10oKUS3kiB3Syngs28BfMwZyba3NTBiaKqnrPZzd4sqmIV
         AMuNWq3z2ioyIpUNGZOSvSTEV8BKw82l+Ucr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5vv85VvwS9MS7JlafP+Njn1B1aPbUU7IaGWNQUgbis=;
        b=q93tiPHyrmd1jfhKPH7OVEvRgij/IrQzjtC2RjdfS7VNBdjAnAIIkNNFtfUchFTHLU
         fnlegGez2zHzvf9QGmpYOol6bWu2N5a8yR5VjTynC7QA3bQLfFrvE6GQpUXZ87DooZcY
         BrPdE9p573OSbVkn7GTYYs7npfB1gEhzsJZuAtFjMuei/uL7fO0IP6vwCaEocEahm5r4
         20f0a8sFhmoziJWjRhT+d7bTGRJzFjXiA4nd0BHk6oA/U/FKs3PPCpXOlI3cp3jpwc9T
         f4fAsnk/OmenShCAyx6OMb4+AqXAal/iAdA+IKDy+Ybb+7VOn6VcX+gHQWoktqTuZy//
         WZtQ==
X-Gm-Message-State: AOAM531LxFWUoS2Wzd4pneQqOSh4eVgVB4tPm0FDwOgCyNRBuXAP9aPq
        nUusNLk2MHmCMxb5reubtUp8Jg==
X-Google-Smtp-Source: ABdhPJyPwaMZa0yQeRjywazx6ncmfSazFg4h+xLedFtfm2vQlCvyJNrBejHstFH3Rpo0cAI3CmiyTA==
X-Received: by 2002:a5d:4525:: with SMTP id j5mr9452235wra.519.1641543194804;
        Fri, 07 Jan 2022 00:13:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (mob-5-90-38-18.net.vodafone.it. [5.90.38.18])
        by smtp.gmail.com with ESMTPSA id w17sm4280633wmc.14.2022.01.07.00.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 00:13:14 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: [RFC PATCH 1/2] docs: networking: device drivers: add can sub-folder
Date:   Fri,  7 Jan 2022 09:13:05 +0100
Message-Id: <20220107081306.3681899-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220107081306.3681899-1-dario.binacchi@amarulasolutions.com>
References: <20220107081306.3681899-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the container for CAN drivers documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../networking/device_drivers/can/index.rst    | 18 ++++++++++++++++++
 .../networking/device_drivers/index.rst        |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/can/index.rst

diff --git a/Documentation/networking/device_drivers/can/index.rst b/Documentation/networking/device_drivers/can/index.rst
new file mode 100644
index 000000000000..218276818968
--- /dev/null
+++ b/Documentation/networking/device_drivers/can/index.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+Controller Area Network (CAN) Device Drivers
+============================================
+
+Device drivers for CAN devices.
+
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index 3a5a1d46e77e..5f5cfdb2a300 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -11,6 +11,7 @@ Contents:
    appletalk/index
    atm/index
    cable/index
+   can/index
    cellular/index
    ethernet/index
    fddi/index
-- 
2.32.0

