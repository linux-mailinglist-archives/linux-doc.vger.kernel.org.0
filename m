Return-Path: <linux-doc+bounces-25053-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66597666B
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 12:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F5A71F228BF
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8FF19F417;
	Thu, 12 Sep 2024 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="IBFC8+Cp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFE19EEA1
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135689; cv=none; b=CdfcSCQyhxMdCThfaQNgtFvQHAEkwvdGNqG1q4/0PDQAwUOlu+v05Yq5EnF/Llpfy/XQH90XREjC90QM0RdWf4fRJuTCVlrhArrwrsCoC8qLXicNAwkjX1RlhJDYGRKaKQA/7NgsYRRFzVE4MyQeF3gRs8amUyU+03kXYuRSCpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135689; c=relaxed/simple;
	bh=4ZQE9Qs3OE9w9UGIaZLn3f/hNIjZOPmSAKQWuMkCnzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YnEa6FAz0GMOB0UebTFeDhwGgUJ/rZxJYy5LS3X63VkaFFJl4c7pjxzY22d3aJoxZC/S5Uplh58dcMkFYeg7AreZ2X4s3K/1LdG0W0SvU8qdRb7w6wjbyok1CopL5u2hIAPs1y4T4hxiH1Nq/1/O2GnOrBmOn3gyHe0S0FZbXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=IBFC8+Cp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-206aee4073cso8749385ad.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1726135686; x=1726740486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PVZ1wWxmUqdr15g7rRz4uMIuAyEAsumdC0ciN7xpoQ=;
        b=IBFC8+CpsvihZAPoCsNp3ivbuxycuGkE5aLthe9KvxdoBEb/GU7d2drUCW6NovAJny
         A2eh2uNcP3UqX3FvB1riQih7yKSQ6Y2fJplCbKB9W7DOSyg///+xhr6A8Vpx9yQa+TmY
         86ApCAkYIGbtfklDPJDYog1IcbTy30TMfe3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135686; x=1726740486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PVZ1wWxmUqdr15g7rRz4uMIuAyEAsumdC0ciN7xpoQ=;
        b=B2QlG0WEhvqEUZaWVOcJ3Cwa171a9ufmVdE0cLwo9zmsO7tizdyjQJRYEX2gD6rbVE
         tb6iZ3aaFlGvfOCosKW/4nJjcDAmSEaVBLeYTEXg3Dheg6zTwyG+YYlu0ulHwhDEmmDl
         pucUUsm2zS3tCiaiMaEoNnVoiLSAYW+tzqO50/0GQEw29gLJYtq2dBa4XYSRZppGFMp0
         1+a2weAwtlm4VnageNkepMEBPagJ8CkfaF2YSRO6cDxAK7vQPqju2yvAZtEO6I5KkznF
         1+mzqO/e/+XM+mZPOYsRwYphmakfUIOCTfsUWbYx6Mqlw7OUcyYRdyvvvy1n7qZdttNo
         LqCw==
X-Forwarded-Encrypted: i=1; AJvYcCXeqhO7isEoamO1m9oy8NNRJPsFcEqhQecS18auVneMMwA0Pxyg3VecoBfR5JwCmP3Yi5xGS3BxvKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcxXsx7Vm9Y3bvQZ+onJ+g5/RWAgMiuUcx8cRCypAbVUqDahA
	X0pPDKdL403VI3MlqvEkGdKg5+QOQSrhXUAsB5F95Vw8Pde6e59yIwQsOZkRKiE=
X-Google-Smtp-Source: AGHT+IFuDTysEWLcoSQXczhJXMmmkaEElIQcq6l9lUB7UALlX5/szi8vgFAEhCvs8RbO3DilKaCUKA==
X-Received: by 2002:a17:903:181:b0:206:aac4:b844 with SMTP id d9443c01a7336-2076e308708mr43284545ad.6.1726135685649;
        Thu, 12 Sep 2024 03:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe9da3sm11583795ad.239.2024.09.12.03.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 03:08:05 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca,
	kuba@kernel.org,
	skhawaja@google.com,
	sdf@fomichev.me,
	bjorn@rivosinc.com,
	amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Daniel Jurgens <danielj@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-rdma@vger.kernel.org (open list:MELLANOX MLX4 core VPI driver),
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tariq Toukan <tariqt@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [RFC net-next v3 0/9] Add support for per-NAPI config via netlink
Date: Thu, 12 Sep 2024 10:07:08 +0000
Message-Id: <20240912100738.16567-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Welcome to RFC v3.

This implementation allocates an array of "struct napi_config" in
net_device and each NAPI instance is assigned an index into the config
array.

Per-NAPI settings like:
  - NAPI ID
  - gro_flush_timeout
  - defer_hard_irqs

are persisted in napi_config and restored on napi_disable/napi_enable
respectively.

To help illustrate how this would end up working, I've added patches for
3 drivers, of which I have access to only 1:
  - mlx5 which is the basis of the examples below
  - mlx4 which has TX only NAPIs, just to highlight that case. I have
    only compile tested this patch; I don't have this hardware.
  - bnxt which I have only compiled tested. I don't have this
    hardware.

NOTE: I only tested this on mlx5; I have no access to the other hardware
for which I provided patches. Hopefully other folks can help test :)

This iteration seems to persist NAPI IDs and settings even when resizing
queues, see below, so I think maybe this is getting close to where we
want to land?

Here's an example of how it works on my mlx5:

# start with 2 queues

$ ethtool -l eth4 | grep Combined | tail -1
Combined:	2

First, output the current NAPI settings:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[{'defer-hard-irqs': 0,
  'gro-flush-timeout': 0,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 0,
  'gro-flush-timeout': 0,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Now, set the global sysfs parameters:

$ sudo bash -c 'echo 20000 >/sys/class/net/eth4/gro_flush_timeout'
$ sudo bash -c 'echo 100 >/sys/class/net/eth4/napi_defer_hard_irqs'

Output current NAPI settings again:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[{'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Now set NAPI ID 345, via its NAPI ID to specific values:

$ sudo ./tools/net/ynl/cli.py \
          --spec Documentation/netlink/specs/netdev.yaml \
          --do napi-set \
          --json='{"id": 345,
                   "defer-hard-irqs": 111,
                   "gro-flush-timeout": 11111}'
None

Now output current NAPI settings again to ensure only NAPI ID 345
changed:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'

[{'defer-hard-irqs': 111,
  'gro-flush-timeout': 11111,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Now, increase gro-flush-timeout only:

$ sudo ./tools/net/ynl/cli.py \
       --spec Documentation/netlink/specs/netdev.yaml \
       --do napi-set --json='{"id": 345,
                              "gro-flush-timeout": 44444}'
None

Now output the current NAPI settings once more:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[{'defer-hard-irqs': 111,
  'gro-flush-timeout': 44444,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Now set NAPI ID 345 to have gro_flush_timeout of 0:

$ sudo ./tools/net/ynl/cli.py \
       --spec Documentation/netlink/specs/netdev.yaml \
       --do napi-set --json='{"id": 345,
                              "gro-flush-timeout": 0}'
None

Check that NAPI ID 345 has a value of 0:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'

[{'defer-hard-irqs': 111,
  'gro-flush-timeout': 0,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Change the queue count, ensuring that NAPI ID 345 retains its settings:

$ sudo ethtool -L eth4 combined 4

Check that the new queues have the system wide settings but that NAPI ID
345 remains unchanged:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'

[{'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 347,
  'ifindex': 7,
  'irq': 529},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 346,
  'ifindex': 7,
  'irq': 528},
 {'defer-hard-irqs': 111,
  'gro-flush-timeout': 0,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Now reduce the queue count below where NAPI ID 345 is indexed:

$ sudo ethtool -L eth4 combined 1

Check the output:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[{'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Re-increase the queue count to ensure NAPI ID 345 is re-assigned the same
values:

$ sudo ethtool -L eth4 combined 2

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[{'defer-hard-irqs': 111,
  'gro-flush-timeout': 0,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Create new queues to ensure the sysfs globals are used for the new NAPIs
but that NAPI ID 345 is unchanged:

$ sudo ethtool -L eth4 comabined 8

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'
[...]
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 346,
  'ifindex': 7,
  'irq': 528},
 {'defer-hard-irqs': 111,
  'gro-flush-timeout': 0,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 100,
  'gro-flush-timeout': 20000,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Last, but not least, let's try writing the sysfs parameters to ensure
all NAPIs are rewritten:

$ sudo bash -c 'echo 33333 >/sys/class/net/eth4/gro_flush_timeout'
$ sudo bash -c 'echo 222 >/sys/class/net/eth4/napi_defer_hard_irqs'

Check that worked:

$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml \
                         --dump napi-get --json='{"ifindex": 7}'

[...]
 {'defer-hard-irqs': 222,
  'gro-flush-timeout': 33333,
  'id': 346,
  'ifindex': 7,
  'irq': 528},
 {'defer-hard-irqs': 222,
  'gro-flush-timeout': 33333,
  'id': 345,
  'ifindex': 7,
  'irq': 527},
 {'defer-hard-irqs': 222,
  'gro-flush-timeout': 33333,
  'id': 344,
  'ifindex': 7,
  'irq': 327}]

Thanks,
Joe

rfcv3:
  - Renamed napi_storage to napi_config
  - Reordered patches
  - Added defer_hard_irqs and gro_flush_timeout to napi_struct
  - Attempt to save and restore settings on napi_disable/napi_enable
  - Removed weight as a parameter to netif_napi_add_storage
  - Updated driver patches to no longer pass in weight

rfcv2:
  - Almost total rewrite from v1

Joe Damato (9):
  net: napi: Make napi_defer_hard_irqs per-NAPI
  netdev-genl: Dump napi_defer_hard_irqs
  net: napi: Make gro_flush_timeout per-NAPI
  netdev-genl: Dump gro_flush_timeout
  net: napi: Add napi_config
  netdev-genl: Support setting per-NAPI config values
  bnxt: Add support for napi storage
  mlx5: Add support for napi storage
  mlx4: Add support for napi storage to RX CQs

 Documentation/netlink/specs/netdev.yaml       | 25 ++++++
 .../networking/net_cachelines/net_device.rst  |  5 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  3 +-
 drivers/net/ethernet/mellanox/mlx4/en_cq.c    |  3 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  2 +-
 include/linux/netdevice.h                     | 40 ++++++++-
 include/uapi/linux/netdev.h                   |  3 +
 net/core/dev.c                                | 90 +++++++++++++++----
 net/core/dev.h                                | 87 ++++++++++++++++++
 net/core/net-sysfs.c                          |  4 +-
 net/core/netdev-genl-gen.c                    | 14 +++
 net/core/netdev-genl-gen.h                    |  1 +
 net/core/netdev-genl.c                        | 55 ++++++++++++
 tools/include/uapi/linux/netdev.h             |  3 +
 14 files changed, 310 insertions(+), 25 deletions(-)

-- 
2.25.1


