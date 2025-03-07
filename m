Return-Path: <linux-doc+bounces-40186-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A7A5660B
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 12:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BDF016C2D4
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804D521322B;
	Fri,  7 Mar 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="taNJNlDz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BA20C024
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345298; cv=none; b=YUfOjKDObDiycVuShNUXloFZbRf5ClrqncHJh3ghTHeOw2BkoKBBZgyPZwm51gT8bXus6ntv4N8N0q0mwQZOE9y56ZbGgjgv0NxpUCL93jRBFV1ylo00P3zcvs4hpCj2KBZquw0CBixbhTW1oqdeP6EKhH1MPaF9lsVM+9f1VdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345298; c=relaxed/simple;
	bh=/g1GkLCKmv9y6KA7+eQLnMk39ax2rDsN2Scy3l2VLdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=VIaBU+bF7xdxXD3ekK6RtzxdY8GMComZJkPdeny6l7uG8ayMmJutUNSpk5+jZNDBAkWM1yHvL/D2n9ywunsE4F92WpUsJak04gCfmczgiHrqnORGUJAG2JBw6gU+NZfdW2dlCooO1uSZXgjq9j3fPo/Vwdey7Nl4II3NDs0mvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=taNJNlDz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22356471820so27396555ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 03:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741345293; x=1741950093; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzMVlPOa3s/zB/a5VwTHDVG6oc6JLPQwIH8h0o1qpiY=;
        b=taNJNlDzobekaGuJ8jefR1WgVul0nx6KSzIh4Gwe0wQh22fVJiVA2yqYK17y0b/1Kx
         OyfmvV3Ao7eERMI39xIxi9wAA4fz3CiSmbgT/j9UzvNECDhSJ4KdLC47hU90OOqsxlHC
         ZB9Z4NyVdPuxQu5NoDjbWDG4/U/mTFqoIhIUL4g8cdRexIbNtNzAT4V7Qgof98APcmLM
         LOt+oHU7UIy8FdgzwIC67eCf9YLL8RmUOVcrN2mPoZY8mV6P+uQbMltzYizBBZ/otih3
         3gIuhmiQ18K+1UpUYa/NayritsPiV14wgUiA4rtzVpZWPHFSbn1T1cExyUjLpjjm0TO3
         rCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345293; x=1741950093;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzMVlPOa3s/zB/a5VwTHDVG6oc6JLPQwIH8h0o1qpiY=;
        b=RV99SvVJgByfiVBu29GdHgbU/9qtMgebh7dGZPmNGFiYILKEFKeKq8pXy+bIHOikM8
         1mQ4rfZ1TPLWu6ZJhbhRgCkm4+5lfs16pBt5TxXR5eVENm76/vwQ08NGWsOHs7W3L98I
         j5+3F0Gi7BuexR9qiZlg7yGkqeUTIp8yPCgBaFhGErX2smru0TNh0d9HvRT1dUZxqyPk
         Got2I/EnrJJ+HB0dq0JaBfwxnPYQCSlljcleMnanFTwn0Y5LiWfbWu0O/FrF9sRV5Igf
         e72uNXVSfoJOHNRgw/pz6kweZUxb0ri92Ubkz1HYE/ca6HLf+qQtg4XWV44q+xbCId5F
         huIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDMLGEue14nUM3TArz1VdjlQxDUapoSu9p4ZjOadDt8Ib1YXf2sqkqMLPz8NsiiQ+Qx8wdGxyU4OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6nP8PFs7jjUfXsxYFhxUImVrYNZs9gl0aj2DwUJu0BEanMsl
	+RX/CIPQqvFP88HjxjcnWef5TXVt+kkH8Z5R+ZKYNP0Bl/rnakF1r86Zgdx1Iwg=
X-Gm-Gg: ASbGncuWrBvVHNySAxwZguoqZvT90QxaWLgSMRptN3uFI9RJfJD+LCuyuXHVa/2KZqX
	TW6N4NCetIwUl3fWh74Tqc5aiINLMNdZamqcIn5VvsTk0NZ+0SdpHZWdXWZUmDlxBWQ1bKrGisc
	XIj8+1Gkxy++PvcDbfgDZw/rcx1RcNKTSd8RN40j95G4Hn0Hyst2wzQVILlmuR5ziUoucP5hIny
	NrSfmgKbMEJZ52A34oIEu3N37D16DUMUmQRnYt/XG+/D1R0udQXok/bs64sxpBP6W4qnIChVZLU
	J7HogfVPTZH1BDeDT/WyNwuA/ntancVq2P39D/lAtjqbMr8E
X-Google-Smtp-Source: AGHT+IEWkspRFr7qHdskSRCnrxIpvvKyP779SqlsxZvyyYMDg2Rlwude0Tz7fnHYA8IOQruaEpUCgQ==
X-Received: by 2002:a05:6a00:1887:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-736aaae0343mr4694000b3a.18.1741345293154;
        Fri, 07 Mar 2025 03:01:33 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73698206a8csm3054423b3a.19.2025.03.07.03.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:01:32 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH net-next v9 0/6] tun: Introduce virtio-net hashing feature
Date: Fri, 07 Mar 2025 20:01:16 +0900
Message-Id: <20250307-rss-v9-0-df76624025eb@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzRymcC/4XSzW7kIAwA4FcZ5VxGBoyBnPY9Vnvgt4OqJt0kM
 5qq6rvXTfozVQ69gfBnbNkv3VymVuauP7x0U7m0uY0DX/zdoUunMNwX0TLfOwUKAUGLaZ5Fsdp
 m50sN1nYc+TSV2q5rlr/dUBYxlOvS/eOXU5uXcXpe01/k+s6ZtARwYJQEeZSIqJSQIjy0U3sYj
 2Pm058cnod2Pabxcc1zUTdWGomSEI+KgJB+tfrTInhp1g4uWoBIpIGT5QhO7RDeIIUbQkYOi9e
 qJCiUdsh8ofcON2QYVZ0quVwBTN4h+kQGJPgNEaMok4eQLbhKO2S/kVIfP9m1PFRgUow575H7R
 hpoQ46RDRGroVpR6R/odRvuVP6feTOWjwl/LUZ/WFtVGsRyHgRRkRDQR0i257Zud2gN5QYliXi
 utUyz8ByOsfJIa+p5wBwew1wE//zYlv6Qs9PW2EqFHAUlnfPepmhcNN6aahFjtNYRl/n6BmFlA
 ofIAgAA
X-Change-ID: 20240403-rss-e737d89efa77
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
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

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

The patches for QEMU to use this new feature was submitted as RFC and
is available at:
https://patchew.org/QEMU/20240915-hash-v3-0-79cb08d28647@daynix.com/

This work was presented at LPC 2024:
https://lpc.events/event/18/contributions/1963/

V1 -> V2:
  Changed to introduce a new BPF program type.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v9:
- Added a missing return statement in patch
  "tun: Introduce virtio-net hash feature".
- Link to v8: https://lore.kernel.org/r/20250306-rss-v8-0-7ab4f56ff423@daynix.com

Changes in v8:
- Disabled IPv6 to eliminate noises in tests.
- Added a branch in tap to avoid unnecessary dissection when hash
  reporting is disabled.
- Removed unnecessary rtnl_lock().
- Extracted code to handle new ioctls into separate functions to avoid
  adding extra NULL checks to the code handling other ioctls.
- Introduced variable named "fd" to __tun_chr_ioctl().
- s/-/=/g in a patch message to avoid confusing Git.
- Link to v7: https://lore.kernel.org/r/20250228-rss-v7-0-844205cbbdd6@daynix.com

Changes in v7:
- Ensured to set hash_report to VIRTIO_NET_HASH_REPORT_NONE for
  VHOST_NET_F_VIRTIO_NET_HDR.
- s/4/sizeof(u32)/ in patch "virtio_net: Add functions for hashing".
- Added tap_skb_cb type.
- Rebased.
- Link to v6: https://lore.kernel.org/r/20250109-rss-v6-0-b1c90ad708f6@daynix.com

Changes in v6:
- Extracted changes to fill vnet header holes into another series.
- Squashed patches "skbuff: Introduce SKB_EXT_TUN_VNET_HASH", "tun:
  Introduce virtio-net hash reporting feature", and "tun: Introduce
  virtio-net RSS" into patch "tun: Introduce virtio-net hash feature".
- Dropped the RFC tag.
- Link to v5: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com

Changes in v5:
- Fixed a compilation error with CONFIG_TUN_VNET_CROSS_LE.
- Optimized the calculation of the hash value according to:
  https://git.dpdk.org/dpdk/commit/?id=3fb1ea032bd6ff8317af5dac9af901f1f324cab4
- Added patch "tun: Unify vnet implementation".
- Dropped patch "tap: Pad virtio header with zero".
- Added patch "selftest: tun: Test vnet ioctls without device".
- Reworked selftests to skip for older kernels.
- Documented the case when the underlying device is deleted and packets
  have queue_mapping set by TC.
- Reordered test harness arguments.
- Added code to handle fragmented packets.
- Link to v4: https://lore.kernel.org/r/20240924-rss-v4-0-84e932ec0e6c@daynix.com

Changes in v4:
- Moved tun_vnet_hash_ext to if_tun.h.
- Renamed virtio_net_toeplitz() to virtio_net_toeplitz_calc().
- Replaced htons() with cpu_to_be16().
- Changed virtio_net_hash_rss() to return void.
- Reordered variable declarations in virtio_net_hash_rss().
- Removed virtio_net_hdr_v1_hash_from_skb().
- Updated messages of "tap: Pad virtio header with zero" and
  "tun: Pad virtio header with zero".
- Fixed vnet_hash allocation size.
- Ensured to free vnet_hash when destructing tun_struct.
- Link to v3: https://lore.kernel.org/r/20240915-rss-v3-0-c630015db082@daynix.com

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
Akihiko Odaki (6):
      virtio_net: Add functions for hashing
      net: flow_dissector: Export flow_keys_dissector_symmetric
      tun: Introduce virtio-net hash feature
      selftest: tun: Test vnet ioctls without device
      selftest: tun: Add tests for virtio-net hashing
      vhost/net: Support VIRTIO_NET_F_HASH_REPORT

 Documentation/networking/tuntap.rst  |   7 +
 drivers/net/Kconfig                  |   1 +
 drivers/net/tap.c                    |  68 +++-
 drivers/net/tun.c                    |  98 +++++-
 drivers/net/tun_vnet.h               | 159 ++++++++-
 drivers/vhost/net.c                  |  49 +--
 include/linux/if_tap.h               |   2 +
 include/linux/skbuff.h               |   3 +
 include/linux/virtio_net.h           | 188 ++++++++++
 include/net/flow_dissector.h         |   1 +
 include/uapi/linux/if_tun.h          |  75 ++++
 net/core/flow_dissector.c            |   3 +-
 net/core/skbuff.c                    |   4 +
 tools/testing/selftests/net/Makefile |   2 +-
 tools/testing/selftests/net/tun.c    | 656 ++++++++++++++++++++++++++++++++++-
 15 files changed, 1255 insertions(+), 61 deletions(-)
---
base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
change-id: 20240403-rss-e737d89efa77
prerequisite-change-id: 20241230-tun-66e10a49b0c7:v6
prerequisite-patch-id: 871dc5f146fb6b0e3ec8612971a8e8190472c0fb
prerequisite-patch-id: 2797ed249d32590321f088373d4055ff3f430a0e
prerequisite-patch-id: ea3370c72d4904e2f0536ec76ba5d26784c0cede
prerequisite-patch-id: 837e4cf5d6b451424f9b1639455e83a260c4440d
prerequisite-patch-id: ea701076f57819e844f5a35efe5cbc5712d3080d
prerequisite-patch-id: 701646fb43ad04cc64dd2bf13c150ccbe6f828ce
prerequisite-patch-id: 53176dae0c003f5b6c114d43f936cf7140d31bb5
prerequisite-change-id: 20250116-buffers-96e14bf023fc:v2
prerequisite-patch-id: 25fd4f99d4236a05a5ef16ab79f3e85ee57e21cc

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


