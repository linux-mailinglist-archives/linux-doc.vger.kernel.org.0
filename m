Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8465AAB6B
	for <lists+linux-doc@lfdr.de>; Fri,  2 Sep 2022 11:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbiIBJas (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Sep 2022 05:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbiIBJaH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 05:30:07 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B68DAB
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 02:29:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C71C6601F04;
        Fri,  2 Sep 2022 10:29:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1662110991;
        bh=IGSthkjGK+x+uEz78lDRCkbgYZPKC+28kY/8J767G2A=;
        h=From:To:Cc:Subject:Date:From;
        b=YZ8U4K6N+mkeF3Mdc78Vd/xH6iCMIHE67TAFgh6lul3LkUiRaMeflxYBPUvj47lDY
         Xslx1QrczLNMfm2DvLvNGU5MjCndnXqeIumCqGc6sszyDRcA1B6yPyoNSmR62R9om0
         JcfOLq70wcbcZO79QiELWiYJYS9AfZ9iALE581Y2e6VE9tG2Gn+kZfenEI4ZUQZIwQ
         OcDJ76ATLXmOTFoZ2h5Set9PlyMfN/6UlT7GEAr9uQK8mkiHz2qyO8EwnC1LWTS3I1
         5fFItewXSqLLbW8BtT3LHZXLMIo8OAWXHA7BlWzYfIQd0a88oZMeufswDTfV5E6Tg6
         mKG+zltFVptGQ==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     mst@redhat.com, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, bagasdotme@gmail.com,
        kernel@collabora.com
Subject: [PATCH v5 0/1] docs: driver-api: virtio: virtio on Linux
Date:   Fri,  2 Sep 2022 11:29:28 +0200
Message-Id: <20220902092929.955203-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Basic documentation about virtio in the kernel and a small tutorial for
virtio drivers.

Tested on kernel/git/mst/vhost.git (linux-next)

Changes in v5:
  - remove already merged patch
  - grammar fixes
  - clarify some API details
  - rework example code

Changes in v4:
  - reword the intro paragraphs
  - grammar fixes

Changes in v3:
  - fix commit message in patch 1
  - minor additional fixes to virtio kerneldocs
  - use proper Sphinx markup for links to references

Changes in v2:
  - virtio spec links updated to v1.2
  - simplify virtio.rst and remove most low level parts that are
    already covered by the spec
  - split the kerneldocs fixes to a separate patch
  - remove :c:func: rst formatting

Ricardo Cañuelo (1):
  docs: driver-api: virtio: virtio on Linux

 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/virtio/index.rst     |  11 +
 Documentation/driver-api/virtio/virtio.rst    | 144 +++++++++++++
 .../virtio/writing_virtio_drivers.rst         | 197 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/driver-api/virtio/index.rst
 create mode 100644 Documentation/driver-api/virtio/virtio.rst
 create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst

-- 
2.25.1

