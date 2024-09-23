Return-Path: <linux-doc+bounces-25284-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F29793FA
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2024 03:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F66283248
	for <lists+linux-doc@lfdr.de>; Sun, 15 Sep 2024 01:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6F2748D;
	Sun, 15 Sep 2024 01:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="MB8JxnIv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C451FDD
	for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2024 01:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726363090; cv=none; b=qEA4HePxdqIF5arx8+x5loU5XmiXbDdza4B/b5cliz0BhgRnfbwxBlrSan47ShSwo0MWYKEO/vLMPkDqNYGbWHDqfbImBikdW0RB6tFt6LOlc6Y9Bg2c1CSaVg+tSqXJiqf2ow2ugB7r4/6nWbJSV2f1oCs51kOc5ZO0mItf5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726363090; c=relaxed/simple;
	bh=DjLACX6Izp1tDR7jnoxIGZpV6PDSLXserAQrHsvK6tI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=u4CHayVpYNDWt+MAJFTzo1+3/ZTW+F1E/BD2qL/f3glYPzV7nwJEfIBgPLk3otG04F0QppUXOm2DS1smDeNU4vPMy3RXnjRe82yNEZ5YLGihVGIku6iuk1tVAfUWuIK50u30xFrBosWa9NhuwiG0QBQnRVHylGTicPJxnwD1Eiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=MB8JxnIv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20696938f86so27779775ad.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 18:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1726363088; x=1726967888; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RlYLWTGEUWVMmH5uAZ3KmcTjt8vGdeFUKq4t4XgGZI=;
        b=MB8JxnIvPG1zgxFx0z664yagV4HCyoXFZRMK72RU/Fza2Wib+ymw0auV7RhRVhRr1f
         tIOYexepibcAayZ+jvfc6LAFXykIPErkafcFMLzHlEXJxlN7iimWhnMz9bH1coe9YUpT
         cFiqCUizHuU3Wkb1++WVAiaany4W2nxfVv6F+A4zOBdFja2umX0fOXxTQvEo8styrigP
         XLrgK3UhzV8koz3Gi3C7LH3rvJ+cP+nGM27jgfTNcv30aA1SHWatTx+WkGI30zMVQGD1
         fkYVrC1te5mnSXVfIHlO+uYJjwYHNWN7jm9w8JXQsCJ7n1t7pH1hu+oRzzjFSa8OQL7e
         7t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726363088; x=1726967888;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RlYLWTGEUWVMmH5uAZ3KmcTjt8vGdeFUKq4t4XgGZI=;
        b=duM07CXvrIjVhFHC6HHfcGK2/RW8N4wYLXtOV9nbkAkvJ0ilxwJY/N4byrKsBoYlem
         dap2Q1tDBhJPRQjesIDDNIl9soe2PY+/YBx7VvITkR7kscdsB9yLnElpOFTBJ5XkJQjj
         InSKFbTRWJIitK8qI6ZRe35PD/fO9A0TQIB8YrVF9eQKM5F+gJRJ580CiWElzy2zl/iP
         a10vRAYUw6bk9AtJb6IGmHTYUymyekL2xsgHHxSihE2QVbqGKrx2Fx/71PgT8scNhYpf
         tuM09afZFomJfTPhaht3hhwQTzJGwU43La5YSSiXfrpmEfXS90AUjQ+FUemNy8obhAdL
         Rd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn7NwQrYfzz1bZLfpXFI0pwl5FAylnZiPa+CXZKYXYDaf9kWztmFY0nNaknbcGl8wIiyB5RWKNARY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdyZ0s7kmWVqYWbsnJ3FDbJG2mXjmILgMfD5Wz/ndidHb8Grf
	7+r59lr30Hgtp859qKf8zzyX/fyUXprswUs1QdtxVXQ8KTXp1nDiqWzXi2qlPKPx9Kdc/Hjvko/
	n1YE=
X-Google-Smtp-Source: AGHT+IEiuSb5mz6nz0x+3ls5vJS2I1fqTIfJlWtcvvYAYRCP14NP9cyLAAgnz5CXLZHRFQsX1yZDwg==
X-Received: by 2002:a17:902:e842:b0:205:5f35:80a0 with SMTP id d9443c01a7336-2076e460c8bmr183980385ad.57.1726363088286;
        Sat, 14 Sep 2024 18:18:08 -0700 (PDT)
Received: from localhost ([210.160.217.68])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-207946d181fsm14749405ad.133.2024.09.14.18.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 18:18:07 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH RFC v3 0/9] tun: Introduce virtio-net hashing feature
Date: Sun, 15 Sep 2024 10:17:39 +0900
Message-Id: <20240915-rss-v3-0-c630015db082@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALM15mYC/32MuwrCMBSGX6VkNiEnOU2qkyD4AK7iEJrUHoqNJ
 FJaSt/d0MnJ7b9+K8shUcjsVK0shYkyxbEYfahY27vxGTj54pmSCiVKzVPOPFhtfXMMnbOWleU
 7hY7mnXJnt+uFPUrYU/7EtOzkCfaqQDRI2chagQQBiKgUB+4G6mmIIvqizt4tI82ija+dM6mfL
 9SAYBCFMtKg+fvdtu0LzTrgp98AAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

virtio-net have two usage of hashes: one is RSS and another is hash
reporting. Conventionally the hash calculation was done by the VMM.
However, computing the hash after the queue was chosen defeats the
purpose of RSS.

Another approach is to use eBPF steering program. This approach has
another downside: it cannot report the calculated hash due to the
restrictive nature of eBPF.

Introduce the code to compute hashes to the kernel in order to overcome
thse challenges.

An alternative solution is to extend the eBPF steering program so that it
will be able to report to the userspace, but it is based on context
rewrites, which is in feature freeze. We can adopt kfuncs, but they will
not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
and vhost_net).

QEMU patched to use this new feature is available at:
https://github.com/daynix/qemu/tree/akihikodaki/rss2

The QEMU patches will soon be submitted to the upstream as RFC too.

This work will be presented at LPC 2024:
https://lpc.events/event/18/contributions/1963/

V1 -> V2:
  Changed to introduce a new BPF program type.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v3:
- Reverted back to add ioctl.
- Split patch "tun: Introduce virtio-net hashing feature" into
  "tun: Introduce virtio-net hash reporting feature" and
  "tun: Introduce virtio-net RSS".
- Changed to reuse hash values computed for automq instead of performing
  RSS hashing when hash reporting is requested but RSS is not.
- Extracted relevant data from struct tun_struct to keep it minimal.
- Added kernel-doc.
- Changed to allow calling TUNGETVNETHASHCAP before TUNSETIFF.
- Initialized num_buffers with 1.
- Added a test case for unclassified packets.
- Fixed error handling in tests.
- Changed tests to verify that the queue index will not overflow.
- Rebased.
- Link to v2: https://lore.kernel.org/r/20231015141644.260646-1-akihiko.odaki@daynix.com

---
Akihiko Odaki (9):
      skbuff: Introduce SKB_EXT_TUN_VNET_HASH
      virtio_net: Add functions for hashing
      net: flow_dissector: Export flow_keys_dissector_symmetric
      tap: Pad virtio header with zero
      tun: Pad virtio header with zero
      tun: Introduce virtio-net hash reporting feature
      tun: Introduce virtio-net RSS
      selftest: tun: Add tests for virtio-net hashing
      vhost/net: Support VIRTIO_NET_F_HASH_REPORT

 Documentation/networking/tuntap.rst  |   7 +
 drivers/net/Kconfig                  |   1 +
 drivers/net/tap.c                    |   2 +-
 drivers/net/tun.c                    | 255 ++++++++++++--
 drivers/vhost/net.c                  |  16 +-
 include/linux/skbuff.h               |  10 +
 include/linux/virtio_net.h           | 198 +++++++++++
 include/net/flow_dissector.h         |   1 +
 include/uapi/linux/if_tun.h          |  71 ++++
 net/core/flow_dissector.c            |   3 +-
 net/core/skbuff.c                    |   3 +
 tools/testing/selftests/net/Makefile |   2 +-
 tools/testing/selftests/net/tun.c    | 666 ++++++++++++++++++++++++++++++++++-
 13 files changed, 1195 insertions(+), 40 deletions(-)
---
base-commit: 46a0057a5853cbdb58211c19e89ba7777dc6fd50
change-id: 20240403-rss-e737d89efa77

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


