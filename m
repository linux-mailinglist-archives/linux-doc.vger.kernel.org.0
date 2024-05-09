Return-Path: <linux-doc+bounces-16077-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D68C0A92
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 06:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613C51C20FC1
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 04:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB88C13C3CC;
	Thu,  9 May 2024 04:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EtdeSNEc"
X-Original-To: linux-doc@vger.kernel.org
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38D2747D;
	Thu,  9 May 2024 04:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715230075; cv=none; b=Sm8TkQhfR91Mq7vIoF2vcbwy3vZ9RrlsMEJZSS8p7rbopxqOOs0N0cKW53QfkBdh6XjKh5jZQ/am6zkLEJkKewmDzsPqjMz06LTf6ZE8cBEYvbQxEEU8nL+IeIzHIhYzjwIsHSVmqqjaO9fDnVrxkWqnBykTlvLttHBAaIK2JEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715230075; c=relaxed/simple;
	bh=yn6z4Xu9XJe8+P4siS+L9oLNEb1Nb0vrz6xd5dESRII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YQztXGN1x6e/c0d6xJn50NHx/lg+oeJRhT+btf24pvPbDJW7Rgu5NCf7E8DGlU27pdYVih4Jiu4YRteAghzIIVtk2hW/bFOg8cLH7qJUj/rPRxXS4ywVPqtHJWAjZW94sjroS6z+hrhiCslveGbEqKHEQ2HNnPnoeZwloVwCAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EtdeSNEc; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1715230070; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=biTs5kQqplTbXx0OlRbtoUu3wlnUGsDxGs20ybVbVGY=;
	b=EtdeSNEco2rwksBTwYNIFcyzNZj/VfN4PPTM2dWvWXcYu8fphMWoWVDx7KxJx9Tw00SV0CXUk63S42CuvLZKV9O/bNZP6Q/Ke25R5DErqIRqnlcZbWlGC1t2qq6ElJ9bxkJpFJyiBLnRJ83cdDzIQHooM0IeiDfBxfiROJOR8OA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045075189;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0W65g812_1715230067;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W65g812_1715230067)
          by smtp.aliyun-inc.com;
          Thu, 09 May 2024 12:47:48 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: netdev@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Brett Creeley <bcreeley@amd.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Tal Gilboa <talgi@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	justinstitt@google.com,
	donald.hunter@gmail.com
Subject: [PATCH net-next v13 0/4] ethtool: provide the dim profile fine-tuning channel
Date: Thu,  9 May 2024 12:47:43 +0800
Message-Id: <20240509044747.101237-1-hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetDIM library provides excellent acceleration for many modern
network cards. However, the default profiles of DIM limits its maximum
capabilities for different NICs, so providing a way which the NIC can
be custom configured is necessary.

Currently, the way is based on the commonly used "ethtool -C".

Please review, thank you very much!

Changelog
=====
v12->v13:
  - Rebase net-next to fix the one-line conflict.
  - Update tiny comments.
  - Config ETHTOOL_NETLINK to select DIMLIB.

v11->v12:
  - Remove the use of IS_ENABLED(DIMLIB).
  - Update Simon's htmldoc hint.

v10->v11:
  - Fix and clean up some issues from Kuba, thanks.
  - Rebase net-next/main

v9->v10:
  - Collect dim related flags/mode/work into one place.
  - Use rx_profile + tx_profile instead of four profiles.
  - Add several helps.
  - Update commit logs.

v8->v9:
  - Fix the compilation error of conflicting names of rx_profile in
    dim.h and ice driver: in dim.h, rx_profile is replaced with
    dim_rx_profile. So does tx_profile.

v7->v8:
  - Use kmemdup() instead of kzalloc()/memcpy() in dev_dim_profile_init().

v6->v7:
  - A new wrapper struct pointer is used in struct net_device.
  - Add IS_ENABLED(CONFIG_DIMLIB) to avoid compiler warnings.
  - Profile fields changed from u16 to u32.

v5->v6:
  - Place the profile in netdevice to bypass the driver.
    The interaction code of ethtool <-> kernel has not changed at all,
    only the interaction part of kernel <-> driver has changed.

v4->v5:
  - Update some snippets from Kuba.

v3->v4:
  - Some tiny updates and patch 1 only add a new comment.

v2->v3:
  - Break up the attributes to avoid the use of raw c structs.
  - Use per-device profile instead of global profile in the driver.

v1->v2:
  - Use ethtool tool instead of net-sysfs.

Heng Qi (4):
  linux/dim: move useful macros to .h file
  ethtool: provide customized dim profile management
  dim: add new interfaces for initialization and getting results
  virtio-net: support dim profile fine-tuning

 Documentation/netlink/specs/ethtool.yaml     |  31 +++
 Documentation/networking/ethtool-netlink.rst |   4 +
 Documentation/networking/net_dim.rst         |  42 +++
 drivers/net/virtio_net.c                     |  47 +++-
 include/linux/dim.h                          | 113 ++++++++
 include/linux/ethtool.h                      |   4 +-
 include/linux/netdevice.h                    |   3 +
 include/uapi/linux/ethtool_netlink.h         |  22 ++
 lib/dim/net_dim.c                            | 144 +++++++++-
 net/Kconfig                                  |   1 +
 net/ethtool/coalesce.c                       | 263 ++++++++++++++++++-
 11 files changed, 658 insertions(+), 16 deletions(-)

-- 
2.32.0.3.g01195cf9f


