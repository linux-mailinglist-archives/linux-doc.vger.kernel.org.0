Return-Path: <linux-doc+bounces-40676-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25067A5EC73
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 08:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 253D517B9E5
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 07:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4735A20487E;
	Thu, 13 Mar 2025 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="i9r7FPxF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A2C2046A7
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849343; cv=none; b=DOD/+NcFgqgCAji4GmcrJG5Llb5f2QR8zt8dHho8yZvde+kXLTrmOpjzt1osWFRQQNWJyrNk9m8jlplaRO2uJxZ/o7SsagNAE2Hq561dKaiqBiesmXOtaZSjgKgIN2WtYp/R4t/7JbvJP+my/J4M6ZVyARATGK64zK+QjTkIf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849343; c=relaxed/simple;
	bh=ccfXZvxiSAaG5MPb2w/JWrekNXtLfO8PT1kfNykthKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=pfSDrSaZc11ld6wd4jY7m0P3/0W6weoQRUxHk819PxBjeuZgLiOC8jXgc7xc1HX3+vVmGbgSE/HM5STraX4JELJK2OmNqQ+J9zKdKdc2/ZxLFar4MjmoZwCvwC9yUliG8vj4ThVp+0+NkS6TnS+sOdTsqR6hds4p44IZ6owPPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=i9r7FPxF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so11269245ad.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 00:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849340; x=1742454140; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3BkVPEmJoa+6yr2vocUy5kvhLH0cmr2yCWFD5W/C7U=;
        b=i9r7FPxFX/fIVo7ZgYjXUEZDkqOg/OVEQcry6mg+cS+b9Ls4mad/yx0nwZY8CUmkNn
         ZlbDyxDtZw7eX7ZOiYK+Hz2VZUbBj4okO9JeJiqVvbJoXZ1NiWRx9b/PGhF+OGmrkL9i
         pTtMdRoqLo5lgRmN5wbx3JUE5wCmXy8ncvusvdXaFvyVg1cjbl6ZFgjdOA+POkN+hs2P
         EW5xAYjUEJYRplTnVCwTTjx3m66xmvf6RaJwe6bE5ne9GkpFbFVZ26v5bG6C3h9XC6JP
         DNuW1VnjyI1OZj9bFQ0J3KbgKPOUjpQslNlgdVI+f1tSX/appThPc20ZBUyA1AP+9W+X
         9OvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849340; x=1742454140;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3BkVPEmJoa+6yr2vocUy5kvhLH0cmr2yCWFD5W/C7U=;
        b=sH9ajwEwjaweHvjSsAJTTDH85k3lLqXUgWUZuKfB2XgE/XVfaD0V1sl2H6mr49KJ3D
         FvwfJbS9K4cUDerysu1cjph2CIYvT8JCcDzLM5TdQy3NYvuVjnKITtoEuo+beG8B2swK
         9/bsEySw/dSk4Knmy5MeF54ThbVonimMW0T9+8MNtXGsZWAr2GeAw2EyxkNTlcYYPD6y
         XOJTCm4QUY+bDGAKsLQRsKQ8L6bHzJ3IXK8IYklWOu3UVQyhNq/RmdHu2RsuXB8kz1xV
         5HBS+jlIWN7mlc1B5XpOXlkcVtg2hP7jjpyuTdYw1T0Pj4RTI19iP/9KTCN54R5e5t93
         ox0g==
X-Forwarded-Encrypted: i=1; AJvYcCUBt1w8Gk/X6wKf/p6uu4SEWkEaQfBOZvkCKUOVxvPV2AQctBvsAgRFnBi8or1aq9/6RCjWzjxWZiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1XABM0b9cOWhIKrrlDdTLHJyIBAW/TScz5eL70DhLO9y83Hi
	AjqwM0+6NohGZRgegnOb2VeXyQ/vC9G1XKJf0jlnh7ce0aiNlitIDaAX+YBPWko=
X-Gm-Gg: ASbGnct/tEMvq4zUg6CMWZVitXiJDFcFbUSUoV2yXW5IojPXTUmiExL8FP53v24PqNk
	e0uKFI3Q0tGDGw226mb5UTsVRqaphW0s34Xfw9kgBDXT6uzK+HKQU4ptNfBF9KKEapfh2HD+cNh
	VPs31wrkPUfCJE2S8d5WNqW2IuBFgrrVHNQWI1nwFDdEL6iik9zQngkwuJ+QH2P4S+mNiysRI8r
	/ByqhIn0tulWP7fAk5X8yU3qK38/SeipENG+RQ3hWvYqoGhGnvX0aBrnelTYaukQILJ4mvJsRJE
	GUOPNK2uqIoZPTeFYALcFnQUUOgc6mZYxOuBwZFpTQVsj8tv
X-Google-Smtp-Source: AGHT+IFaX1olq5WQi+7fcP4HReHGKVkvSZ9sg15FYUug/XHg7z4NmpOMBbEE1p5tCvq05aXsAHzDQQ==
X-Received: by 2002:a05:6a00:2d83:b0:736:a7ec:a366 with SMTP id d2e1a72fcca58-736eb7d882bmr12600967b3a.9.1741849340468;
        Thu, 13 Mar 2025 00:02:20 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73711695ee8sm632427b3a.154.2025.03.13.00.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:02:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 16:01:12 +0900
Subject: [PATCH net-next v10 09/10] selftest: tap: Add tests for virtio-net
 ioctls
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-rss-v10-9-3185d73a9af0@daynix.com>
References: <20250313-rss-v10-0-3185d73a9af0@daynix.com>
In-Reply-To: <20250313-rss-v10-0-3185d73a9af0@daynix.com>
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
X-Mailer: b4 0.15-dev-edae6

They only test the ioctls are wired up to the implementation common with
tun as it is already tested for tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/testing/selftests/net/tap.c | 97 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index 247c3b3ac1c9..fbd38b08fdfa 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -363,6 +363,7 @@ size_t build_test_packet_crash_tap_invalid_eth_proto(uint8_t *buf,
 FIXTURE(tap)
 {
 	int fd;
+	bool deleted;
 };
 
 FIXTURE_SETUP(tap)
@@ -387,8 +388,10 @@ FIXTURE_TEARDOWN(tap)
 	if (self->fd != -1)
 		close(self->fd);
 
-	ret = dev_delete(param_dev_tap_name);
-	EXPECT_EQ(ret, 0);
+	if (!self->deleted) {
+		ret = dev_delete(param_dev_tap_name);
+		EXPECT_EQ(ret, 0);
+	}
 
 	ret = dev_delete(param_dev_dummy_name);
 	EXPECT_EQ(ret, 0);
@@ -431,4 +434,94 @@ TEST_F(tap, test_packet_crash_tap_invalid_eth_proto)
 	ASSERT_EQ(errno, EINVAL);
 }
 
+TEST_F(tap, test_vnethdrsz)
+{
+	int sz = sizeof(struct virtio_net_hdr_v1_hash);
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_FALSE(ioctl(self->fd, TUNSETVNETHDRSZ, &sz));
+	sz = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETHDRSZ, &sz));
+	EXPECT_EQ(sizeof(struct virtio_net_hdr_v1_hash), sz);
+}
+
+TEST_F(tap, test_vnetle)
+{
+	int le = 1;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_FALSE(ioctl(self->fd, TUNSETVNETLE, &le));
+	le = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETLE, &le));
+	EXPECT_EQ(1, le);
+}
+
+TEST_F(tap, test_vnetbe)
+{
+	int be = 1;
+	int ret;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ret = ioctl(self->fd, TUNSETVNETBE, &be);
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return, "TUNSETVNETBE not supported");
+
+	ASSERT_FALSE(ret);
+	be = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETBE, &be));
+	EXPECT_EQ(1, be);
+}
+
+TEST_F(tap, test_getvnethashcap)
+{
+	static const struct tun_vnet_hash expected = {
+		.flags = TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
+		.types = VIRTIO_NET_RSS_HASH_TYPE_IPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_TCPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_UDPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_IPv6 |
+			 VIRTIO_NET_RSS_HASH_TYPE_TCPv6 |
+			 VIRTIO_NET_RSS_HASH_TYPE_UDPv6
+	};
+	struct tun_vnet_hash seen;
+	int ret;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ret = ioctl(self->fd, TUNGETVNETHASHCAP, &seen);
+
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return, "TUNGETVNETHASHCAP not supported");
+
+	EXPECT_FALSE(ret);
+	EXPECT_FALSE(memcmp(&expected, &seen, sizeof(expected)));
+}
+
+TEST_F(tap, test_setvnethash_alive)
+{
+	struct tun_vnet_hash hash = { .flags = 0 };
+
+	EXPECT_FALSE(ioctl(self->fd, TUNSETVNETHASH, &hash));
+}
+
+TEST_F(tap, test_setvnethash_deleted)
+{
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHASH));
+
+	if (errno == EINVAL)
+		SKIP(return, "TUNSETVNETHASH not supported");
+
+	EXPECT_EQ(EBADFD, errno);
+}
+
 TEST_HARNESS_MAIN

-- 
2.48.1


