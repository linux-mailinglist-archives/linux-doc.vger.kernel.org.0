Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B734873F6
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jan 2022 09:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345545AbiAGINS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jan 2022 03:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345544AbiAGINR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 03:13:17 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8000DC061201
        for <linux-doc@vger.kernel.org>; Fri,  7 Jan 2022 00:13:14 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q8so9499590wra.12
        for <linux-doc@vger.kernel.org>; Fri, 07 Jan 2022 00:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqdRj1EmconcuS8b1F/rCY0dKZJIq6ZhPGwfLyW4b+Y=;
        b=WPfeUfOnlhSOfGOHgN5PeWWc/KjXHsBD3ggQsMA5SngsdPvUDeylLDbubRb9YbKDGk
         QO0UWkkK70YiTrGqaG5onQYmQ1E+gkQ2JD2tubl/p4bPAWJjDsDMEciF2w5fbAXKeEmv
         fZw6HeDHavCBcle6tFSb7rCSNIc8k0pTuyhYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqdRj1EmconcuS8b1F/rCY0dKZJIq6ZhPGwfLyW4b+Y=;
        b=7l2PiQLkw5MX/QTigvlSEZ1cA25N5Ji68Mnlr/vkB5rVja/yXqLYmb0+dXIZRC5+Lf
         fSzhrXLbk96n0QS6hg3TrioHPIq5jN7Y5IJj09cdyYnF8YHYq4y3JLj5XXhiFm+XCAuS
         qbfXKeEebzueiDpeRxtpr5tM3RrVphXjv5K4mFXZPSM0TnoLLU+sg+pNaQIpn7VKM76t
         ic+yGHUIL+4GPw8+lSP0Rtg/71lRV1kOCG3UawmXUbH8p2+JjoD+fngvik2ezfZDsPgj
         yMqGI/S6yrRAGzHOOcW5PUgSTEluLLsoEv7Z6EtTP/j6ijAJ7R7tjfHvRYL+v0Rl20dF
         WvIQ==
X-Gm-Message-State: AOAM5307cfGYsiCsDyX4r0kkJ1d5XVlqhTlWkGCEhNjkj66Z7ad3eC9e
        voz6zLIrXSfhUgI5UuP6UGfBlg==
X-Google-Smtp-Source: ABdhPJyJ/bwB16MM5ozIXq1cXUNN7h5qKXxouxf4Co5jB+HxWmwlFvBPg/aC1WWQZKL0O8FlOg86Lg==
X-Received: by 2002:a05:6000:382:: with SMTP id u2mr55089116wrf.331.1641543193020;
        Fri, 07 Jan 2022 00:13:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (mob-5-90-38-18.net.vodafone.it. [5.90.38.18])
        by smtp.gmail.com with ESMTPSA id w17sm4280633wmc.14.2022.01.07.00.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 00:13:12 -0800 (PST)
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
Subject: [RFC PATCH 0/2] Add the first documentation for a CAN driver
Date:   Fri,  7 Jan 2022 09:13:04 +0100
Message-Id: <20220107081306.3681899-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The series was born from the need to document the enabling at runtime
reception of RTR frames for the Flexcan CAN controller.
For more details see https://lore.kernel.org/all/20220106105415.pdmrdgnx6p2tyff6@pengutronix.de/


Dario Binacchi (2):
  docs: networking: device drivers: add can sub-folder
  docs: networking: device drivers: can: add flexcan

 .../device_drivers/can/freescale/flexcan.rst  | 25 +++++++++++++++++++
 .../networking/device_drivers/can/index.rst   | 20 +++++++++++++++
 .../networking/device_drivers/index.rst       |  1 +
 3 files changed, 46 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/can/freescale/flexcan.rst
 create mode 100644 Documentation/networking/device_drivers/can/index.rst

-- 
2.32.0

