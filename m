Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE9A58E9C7
	for <lists+linux-doc@lfdr.de>; Wed, 10 Aug 2022 11:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbiHJJki (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Aug 2022 05:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbiHJJkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 05:40:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45ADBB3F
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 02:40:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DDBAC6601BAA;
        Wed, 10 Aug 2022 10:40:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660124427;
        bh=YZX+kiIG4cpbYyR+Bn8w24YD+SYOlAt7Tw6up4li+iw=;
        h=From:To:Cc:Subject:Date:From;
        b=gHLcINrw7JjoyZee1siZFL6E1O6XKFzOIv/AP6JtubcafdMt9Kox07B7qQs+gvYMl
         LlV1F1OWuAEIlEtZ6C+Z5Xaa+kpc4RMCmMpw6YkmslquRyKom66x3tc04yAKVMzmw9
         t1J/F57a0Pef7uJv97PtsJgaqxYd/ViOPm4Sn53egxvUGt/zp2MryI5op23eCBi+Bw
         8s8iiMhI6KYRlzmwMDYo8MmxqrSTQULznIZ+KSJdotEMp9jg3WhHomWCDNlk1MPY+V
         FSL8JN5fx/e6lvWMOfOiQSdwPGMeSvMzQM+S/LjNwzVFuzxd/vg83eXrGi0uzvA0Ru
         QJGPPKsN5TAUg==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com,
        bagasdotme@gmail.com
Subject: [PATCH v4 0/2] docs: driver-api: virtio: virtio on Linux
Date:   Wed, 10 Aug 2022 11:40:02 +0200
Message-Id: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
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

Tested on linux-next (next-20220802)

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

Ricardo Cañuelo (2):
  virtio: kerneldocs fixes and enhancements
  docs: driver-api: virtio: virtio on Linux

 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/virtio/index.rst     |  11 ++
 Documentation/driver-api/virtio/virtio.rst    | 144 ++++++++++++++
 .../virtio/writing_virtio_drivers.rst         | 186 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/virtio/virtio_ring.c                  |   8 +
 include/linux/virtio.h                        |   6 +-
 include/linux/virtio_config.h                 |   6 +-
 include/uapi/linux/virtio_ring.h              |  16 +-
 9 files changed, 368 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/driver-api/virtio/index.rst
 create mode 100644 Documentation/driver-api/virtio/virtio.rst
 create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst

-- 
2.25.1

