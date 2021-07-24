Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102CD3D4A2A
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jul 2021 23:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhGXVHn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 24 Jul 2021 17:07:43 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:43788
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229588AbhGXVHm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:07:42 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EE4ED3F32A
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163291;
        bh=G9KCxkZ1DdC15NET5kZk+LZOMEIZ/z14F2Hvsqu6jDI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=B7vUvW/Tjh1TtkoJt7Afz8uplxaIOXkFLpL2kh6Nc1fpa/nsbADuc82c5dnrXhsgs
         JhkZJ9lnpRo6qCbrSgY/fFs0dsmwyxNQPcfVTSyrU3xySqLYZSvzbv/+fFrqKB5ILo
         YnEpaiZg2zeUqItk/eImtXQ2iQhKShxTJohHuwk4kJdaKAjsXvbY48YT6ET+mSlihy
         LJJq1d8yd84Zo2g53ORxCzSJh19OBDNqkzN8zmM+Nfokls0wDZemOamAxowoqTcpms
         EmOmpFBw56uuIqvRuicQn5sh2e2EGdI0st6TAIrmhFmcwM8E7U0nRkH6tjUEaJkhaP
         KC16kOkpc13Ow==
Received: by mail-ed1-f69.google.com with SMTP id f24-20020a0564021618b02903954c05c938so2813286edv.3
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G9KCxkZ1DdC15NET5kZk+LZOMEIZ/z14F2Hvsqu6jDI=;
        b=KfnndZEEq3mEN9z8HArgz5a68pjonly0pBgYQ3NmZr5phUnPRJStSz2lV3ALEG8DF3
         80I2TTKLFukyY/G+QWSqj3AhFy6sANMaDY360hSCFZP1dFToaVBYSZrtAhndKujr/FhO
         QsESWKIUT2PRAQejojzCInF6bED+HnlDb3+PSzK+b9JjKRRJ80Rq6Q87L65pvvWpcQhE
         MygLu3N0KJMfhPHQTdERsheICFS3mrJAo+4kkH4g2sKC2rTmejilxdd+ON+CX1a2Msxz
         xLtcnyZBbfbNjn24WKcFpt8OQKN0tU7jsExvc7o3eJ7ANnQIsBj6K/Bj+OKzg/owO/vp
         0v7Q==
X-Gm-Message-State: AOAM533kVRJIOaVL1WE4G4mvtv13CgqnIEQgbY36ht1Pa6ZpIRVz4AN6
        r0Yrno4+rg61lUqLNLrw8CZDrQF6QGfNLNv4r11uIFVLCV2IQodBDuVpjFb2UDa85Om90dH4xSC
        ekWJ67WtdVyXYRrBs4NjoTnHyRwmM6M/qAg9/0g==
X-Received: by 2002:a17:906:8047:: with SMTP id x7mr46588ejw.453.1627163286816;
        Sat, 24 Jul 2021 14:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOmFVBri8CQWcWZUF1IqokLpZwOavdWOwnGXxKa0UI7mA9/SGqL9hAGuBdFfYDwRxhCsOSoA==
X-Received: by 2002:a17:906:8047:: with SMTP id x7mr46579ejw.453.1627163286677;
        Sat, 24 Jul 2021 14:48:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id j5sm8383005edv.10.2021.07.24.14.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:48:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Gorand <charles.gorand@effinnov.com>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Bongsu Jeon <bongsu.jeon@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH 00/12] nfc: constify data structures
Date:   Sat, 24 Jul 2021 23:47:31 +0200
Message-Id: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Constify pointers to several data structures which are not modified by
NFC core or by drivers to make it slightly safer.  No functional impact
expected.

Best regards,
Krzysztof


Krzysztof Kozlowski (12):
  nfc: constify payload argument in nci_send_cmd()
  nfc: constify nci_ops
  nfc: s3fwrn5: constify nci_ops
  nfc: constify nci_driver_ops (prop_ops and core_ops)
  nfc: constify nfc_phy_ops
  nfc: st21nfca: constify file-scope arrays
  nfc: constify pointer to nfc_vendor_cmd
  nfc: constify nfc_hci_gate
  nfc: constify nfc_ops
  nfc: constify nfc_hci_ops
  nfc: constify nfc_llc_ops
  nfc: constify nfc_digital_ops

 Documentation/driver-api/nfc/nfc-hci.rst |  2 +-
 drivers/nfc/fdp/fdp.c                    | 11 ++++++-----
 drivers/nfc/fdp/fdp.h                    |  2 +-
 drivers/nfc/fdp/i2c.c                    |  2 +-
 drivers/nfc/mei_phy.c                    |  2 +-
 drivers/nfc/mei_phy.h                    |  2 +-
 drivers/nfc/microread/i2c.c              |  2 +-
 drivers/nfc/microread/microread.c        | 12 ++++++------
 drivers/nfc/microread/microread.h        |  6 +++---
 drivers/nfc/nfcmrvl/main.c               |  2 +-
 drivers/nfc/nfcsim.c                     |  2 +-
 drivers/nfc/nxp-nci/core.c               |  2 +-
 drivers/nfc/pn533/pn533.c                |  2 +-
 drivers/nfc/pn544/i2c.c                  |  2 +-
 drivers/nfc/pn544/pn544.c                | 13 ++++++------
 drivers/nfc/pn544/pn544.h                |  7 ++++---
 drivers/nfc/port100.c                    |  2 +-
 drivers/nfc/s3fwrn5/core.c               |  7 +++----
 drivers/nfc/s3fwrn5/nci.c                |  8 +-------
 drivers/nfc/s3fwrn5/nci.h                |  2 +-
 drivers/nfc/st-nci/core.c                |  5 +++--
 drivers/nfc/st-nci/i2c.c                 |  2 +-
 drivers/nfc/st-nci/ndlc.c                |  6 +++---
 drivers/nfc/st-nci/ndlc.h                |  8 ++++----
 drivers/nfc/st-nci/spi.c                 |  2 +-
 drivers/nfc/st-nci/vendor_cmds.c         |  2 +-
 drivers/nfc/st21nfca/core.c              |  6 +++---
 drivers/nfc/st21nfca/i2c.c               |  6 +++---
 drivers/nfc/st21nfca/st21nfca.h          |  4 ++--
 drivers/nfc/st21nfca/vendor_cmds.c       |  2 +-
 drivers/nfc/st95hf/core.c                |  2 +-
 drivers/nfc/trf7970a.c                   |  2 +-
 drivers/nfc/virtual_ncidev.c             |  2 +-
 include/net/nfc/digital.h                |  4 ++--
 include/net/nfc/hci.h                    |  6 +++---
 include/net/nfc/nci_core.h               | 12 ++++++------
 include/net/nfc/nfc.h                    |  8 ++++----
 net/nfc/core.c                           |  2 +-
 net/nfc/digital_core.c                   |  4 ++--
 net/nfc/hci/core.c                       |  6 +++---
 net/nfc/hci/llc.c                        |  2 +-
 net/nfc/hci/llc.h                        |  6 +++---
 net/nfc/hci/llc_nop.c                    |  2 +-
 net/nfc/hci/llc_shdlc.c                  |  2 +-
 net/nfc/nci/core.c                       | 25 ++++++++++++------------
 net/nfc/netlink.c                        |  2 +-
 46 files changed, 108 insertions(+), 112 deletions(-)

-- 
2.27.0

