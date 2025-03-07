Return-Path: <linux-doc+bounces-40191-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4EA56626
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 12:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127C61896463
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 11:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53320213246;
	Fri,  7 Mar 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="T+towRxg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2181DC99A
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345325; cv=none; b=EUM5V03sihF8VaBS+tVn0nbC+fhtk/jqziAanxZF4iW41DNBYk+8n/j8HQJNkM1WsbhzNL6ma9Dlf/F2nnWvu/20TiXjPvQ2C/8F1lq3bTC4EP/QJQIKAKxZdF6eLpiWNNyVUHdKxQFadIcokXQNi9oVIIR9cYTL+LW6/bvEKPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345325; c=relaxed/simple;
	bh=mziiG82SdJboW77s7pX65yyPguMSrfimK1zsyJx+aec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=JSVKyLSnlNbp6TRifSAZELPU4Ali/FL4DfgCUGq6TOT0wwFUkzhXITxlqCr+lxdh1FlTNRHyYOwS75+1jq4pqkxUusbHiLmNXd0BM8AtEHJs5sGe2U8yUFcHUkZBr63mS8bK4cqdEihuC1mJYJYxWisiK5H+rQnt+CY5/XImRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=T+towRxg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22435603572so425845ad.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741345322; x=1741950122; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2crZ9WY74pa80AOhLDY9fQpdbgKpDe5+o3kFXwHn2Q=;
        b=T+towRxgko+9xTD9NHAYOkG6XsSP6opD2nKeFnuGMBgBi3MrrS+18V0VyBgDE/r9ZB
         +XX+lcoPE05kqUm+9hwOrL1RkBu67NmaHx5icmPLTpHEB7ie0kcVvpoEzVK+TiodQE20
         BW/kbnRrgni6sQTwiRfNMH3/zxQR7pcBbCGU3H9YpI+ZcEnmTYmF9TGmzHTb/LxDR9nR
         c3LBhfoHdI8mMO+JBOKi8HTWAiZ6+IosXXXhyPaCcRNruTpQmfRdh3KOj/hqtrkOItFU
         C8ErKWG9pK/hMxoDJzQd4Bg7+gMyzbqj9B9joRAWlwWp7cVpPVmhHk2l5K1uWkFMhK96
         rm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345322; x=1741950122;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2crZ9WY74pa80AOhLDY9fQpdbgKpDe5+o3kFXwHn2Q=;
        b=NPeBiW98l+6wOugEoC0ppaoYOwQ8PtZJsQsbUQB4yJ5GOhC9J5mO6R08DKeU8QjDeU
         q/jmoeExTKbVTZtK2vhUQU/L7icnUG4XZZwTSujHYfcrkozrYUnNbyZqdk1Ro/6f5DNP
         KAJoIPTs/INkRSQROhsMdMnSL5AU5sL8a/nU/EA7bN4qCb4WbmZ7mv+xoCRjbrYq2FZJ
         WDrtwXlWGmqaSZH9exxWyh3oO+ATSUSK42t1G4pYrEFQb+tpnfLQY3tvTZhf/eWt1Ug8
         ib3th5C8uw7D+E1UCkgtdLeS/sZV2cUd2U6tETbndnetuA2WNos35v5lZe5S3SwR1vZI
         ADkA==
X-Forwarded-Encrypted: i=1; AJvYcCXaV/6TsWb5OjlGN83i4OxQNPZjfYx9ezoNOIpr+m94NptCqnSDsqv1/YUPSaTHUz5Vu4bYKG2xHUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MJ0WqlkxHsj5aFfYD5yc5+wpNTUQozvfS1HOhi8aA4WiUE8d
	njc9lA2HLH6ajolq2Quq3PvR+4Yt8w+w1hjLTdvHqRxyuwn9nGbMS+eOKYUhlGI=
X-Gm-Gg: ASbGncsjwiTmVU640M17WDu69OEhW8O8sb5aCMNiKyvF6Y0fDECkVEFmqcPLL8CpXU4
	pWjCNDCGsVmBK2tKCeKfmL9XrQ8tLsvmOGXbWu2gQ7fySceiwNE1K2Kci7uAafORt7rdiVuw74p
	m9lvpxQ5Agd9AQO5Hd31gsBo6DJMa6hOOl8JkND5FOkWhqIvLZw6o1WMaQt5tg1Y7LfUizU11PE
	nvXasNxlzDubKraCuMKW2BzMJFT6xh22PHyZbdiTcrfqMlsf9/RUJKwd/dGSPxvbJnuszg/w9ks
	KUAw4IJ/K2h2YkEONP4myEzfxZH/YzkCU4LuIHMoERztxopR
X-Google-Smtp-Source: AGHT+IGxSBmuWo0bsFW/90SgWDvocI4Qct8v6JpqUZovm/ZB3bW6A5uBzG02Bt9xLc5a/DHgbB4sIg==
X-Received: by 2002:a05:6a21:514:b0:1f3:2c58:f3c with SMTP id adf61e73a8af0-1f544cbe9bamr6249116637.25.1741345322398;
        Fri, 07 Mar 2025 03:02:02 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af2810c1d24sm2729942a12.41.2025.03.07.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:02:02 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 20:01:21 +0900
Subject: [PATCH net-next v9 5/6] selftest: tun: Add tests for virtio-net
 hashing
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-rss-v9-5-df76624025eb@daynix.com>
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
In-Reply-To: <20250307-rss-v9-0-df76624025eb@daynix.com>
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

The added tests confirm tun can perform RSS and hash reporting, and
reject invalid configurations for them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 tools/testing/selftests/net/Makefile |   2 +-
 tools/testing/selftests/net/tun.c    | 584 ++++++++++++++++++++++++++++++++++-
 2 files changed, 576 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 73ee88d6b043004be23b444de667a1d99a6045de..9772f691a9a011d99212df32463cdb930cf0a1a0 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -123,6 +123,6 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
 $(OUTPUT)/tcp_mmap: LDLIBS += -lpthread -lcrypto
 $(OUTPUT)/tcp_inq: LDLIBS += -lpthread
 $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
-$(OUTPUT)/io_uring_zerocopy_tx: CFLAGS += -I../../../include/
+$(OUTPUT)/io_uring_zerocopy_tx $(OUTPUT)/tun: CFLAGS += -I../../../include/
 
 include bpf.mk
diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 463dd98f2b80b1bdcb398cee43c834e7dc5cf784..acadeea7194eaea9416a605b47f99f7a5f1f80cd 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -2,21 +2,38 @@
 
 #define _GNU_SOURCE
 
+#include <endian.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
+#include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
-#include <linux/if.h>
+#include <net/if.h>
+#include <netinet/ip.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <linux/compiler.h>
+#include <linux/icmp.h>
+#include <linux/if_arp.h>
 #include <linux/if_tun.h>
+#include <linux/ipv6.h>
 #include <linux/netlink.h>
 #include <linux/rtnetlink.h>
-#include <sys/ioctl.h>
-#include <sys/socket.h>
+#include <linux/sockios.h>
+#include <linux/tcp.h>
+#include <linux/udp.h>
+#include <linux/virtio_net.h>
 
 #include "../kselftest_harness.h"
 
+#define TUN_HWADDR_SOURCE { 0x02, 0x00, 0x00, 0x00, 0x00, 0x00 }
+#define TUN_HWADDR_DEST { 0x02, 0x00, 0x00, 0x00, 0x00, 0x01 }
+#define TUN_IPADDR_SOURCE htonl((172 << 24) | (17 << 16) | 0)
+#define TUN_IPADDR_DEST htonl((172 << 24) | (17 << 16) | 1)
+
 static int tun_attach(int fd, char *dev)
 {
 	struct ifreq ifr;
@@ -39,7 +56,7 @@ static int tun_detach(int fd, char *dev)
 	return ioctl(fd, TUNSETQUEUE, (void *) &ifr);
 }
 
-static int tun_alloc(char *dev)
+static int tun_alloc(char *dev, short flags)
 {
 	struct ifreq ifr;
 	int fd, err;
@@ -52,7 +69,8 @@ static int tun_alloc(char *dev)
 
 	memset(&ifr, 0, sizeof(ifr));
 	strcpy(ifr.ifr_name, dev);
-	ifr.ifr_flags = IFF_TAP | IFF_NAPI | IFF_MULTI_QUEUE;
+	ifr.ifr_flags = flags | IFF_TAP | IFF_NAPI | IFF_NO_PI |
+			IFF_MULTI_QUEUE;
 
 	err = ioctl(fd, TUNSETIFF, (void *) &ifr);
 	if (err < 0) {
@@ -64,6 +82,40 @@ static int tun_alloc(char *dev)
 	return fd;
 }
 
+static bool tun_add_to_bridge(int local_fd, const char *name)
+{
+	struct ifreq ifreq = {
+		.ifr_name = "xbridge",
+		.ifr_ifindex = if_nametoindex(name)
+	};
+
+	if (!ifreq.ifr_ifindex) {
+		perror("if_nametoindex");
+		return false;
+	}
+
+	if (ioctl(local_fd, SIOCBRADDIF, &ifreq)) {
+		perror("SIOCBRADDIF");
+		return false;
+	}
+
+	return true;
+}
+
+static bool tun_set_flags(int local_fd, const char *name, short flags)
+{
+	struct ifreq ifreq = { .ifr_flags = flags };
+
+	strcpy(ifreq.ifr_name, name);
+
+	if (ioctl(local_fd, SIOCSIFFLAGS, &ifreq)) {
+		perror("SIOCSIFFLAGS");
+		return false;
+	}
+
+	return true;
+}
+
 static int tun_delete(char *dev)
 {
 	struct {
@@ -102,6 +154,156 @@ static int tun_delete(char *dev)
 	return ret;
 }
 
+static uint32_t tun_sum(const void *buf, size_t len)
+{
+	const uint16_t *sbuf = buf;
+	uint32_t sum = 0;
+
+	while (len > 1) {
+		sum += *sbuf++;
+		len -= 2;
+	}
+
+	if (len)
+		sum += *(uint8_t *)sbuf;
+
+	return sum;
+}
+
+static uint16_t tun_build_ip_check(uint32_t sum)
+{
+	return ~((sum & 0xffff) + (sum >> 16));
+}
+
+static uint32_t tun_build_ip_pseudo_sum(const void *iphdr)
+{
+	uint16_t tot_len = ntohs(((struct iphdr *)iphdr)->tot_len);
+
+	return tun_sum((char *)iphdr + offsetof(struct iphdr, saddr), 8) +
+	       htons(((struct iphdr *)iphdr)->protocol) +
+	       htons(tot_len - sizeof(struct iphdr));
+}
+
+static uint32_t tun_build_ipv6_pseudo_sum(const void *ipv6hdr)
+{
+	return tun_sum((char *)ipv6hdr + offsetof(struct ipv6hdr, saddr), 32) +
+	       ((struct ipv6hdr *)ipv6hdr)->payload_len +
+	       htons(((struct ipv6hdr *)ipv6hdr)->nexthdr);
+}
+
+static void tun_build_ethhdr(struct ethhdr *ethhdr, uint16_t proto)
+{
+	*ethhdr = (struct ethhdr) {
+		.h_dest = TUN_HWADDR_DEST,
+		.h_source = TUN_HWADDR_SOURCE,
+		.h_proto = htons(proto)
+	};
+}
+
+static void tun_build_iphdr(void *dest, uint16_t len, uint8_t protocol)
+{
+	struct iphdr iphdr = {
+		.ihl = sizeof(iphdr) / 4,
+		.version = 4,
+		.tot_len = htons(sizeof(iphdr) + len),
+		.ttl = 255,
+		.protocol = protocol,
+		.saddr = TUN_IPADDR_SOURCE,
+		.daddr = TUN_IPADDR_DEST
+	};
+
+	iphdr.check = tun_build_ip_check(tun_sum(&iphdr, sizeof(iphdr)));
+	memcpy(dest, &iphdr, sizeof(iphdr));
+}
+
+static void tun_build_ipv6hdr(void *dest, uint16_t len, uint8_t protocol)
+{
+	struct ipv6hdr ipv6hdr = {
+		.version = 6,
+		.payload_len = htons(len),
+		.nexthdr = protocol,
+		.saddr = {
+			.s6_addr32 = {
+				htonl(0xffff0000), 0, 0, TUN_IPADDR_SOURCE
+			}
+		},
+		.daddr = {
+			.s6_addr32 = {
+				htonl(0xffff0000), 0, 0, TUN_IPADDR_DEST
+			}
+		},
+	};
+
+	memcpy(dest, &ipv6hdr, sizeof(ipv6hdr));
+}
+
+static void tun_build_tcphdr(void *dest, uint32_t sum)
+{
+	struct tcphdr tcphdr = {
+		.source = htons(9),
+		.dest = htons(9),
+		.fin = 1,
+		.doff = sizeof(tcphdr) / 4,
+	};
+	uint32_t tcp_sum = tun_sum(&tcphdr, sizeof(tcphdr));
+
+	tcphdr.check = tun_build_ip_check(sum + tcp_sum);
+	memcpy(dest, &tcphdr, sizeof(tcphdr));
+}
+
+static void tun_build_udphdr(void *dest, uint32_t sum)
+{
+	struct udphdr udphdr = {
+		.source = htons(9),
+		.dest = htons(9),
+		.len = htons(sizeof(udphdr)),
+	};
+	uint32_t udp_sum = tun_sum(&udphdr, sizeof(udphdr));
+
+	udphdr.check = tun_build_ip_check(sum + udp_sum);
+	memcpy(dest, &udphdr, sizeof(udphdr));
+}
+
+static bool tun_vnet_hash_check(int source_fd, const int *dest_fds,
+				const void *buffer, size_t len,
+				uint8_t flags,
+				uint16_t hash_report, uint32_t hash_value)
+{
+	size_t read_len = sizeof(struct virtio_net_hdr_v1_hash) + len;
+	struct virtio_net_hdr_v1_hash *read_buffer;
+	struct virtio_net_hdr_v1_hash hdr = {
+		.hdr = { .flags = flags },
+		.hash_value = htole32(hash_value),
+		.hash_report = htole16(hash_report)
+	};
+	int ret;
+	int txq = hash_report ? hash_value & 1 : 2;
+
+	if (write(source_fd, buffer, len) != len) {
+		perror("write");
+		return false;
+	}
+
+	read_buffer = malloc(read_len);
+	if (!read_buffer) {
+		perror("malloc");
+		return false;
+	}
+
+	ret = read(dest_fds[txq], read_buffer, read_len);
+	if (ret != read_len) {
+		perror("read");
+		free(read_buffer);
+		return false;
+	}
+
+	ret = !memcmp(read_buffer, &hdr, sizeof(*read_buffer)) &&
+	      !memcmp(read_buffer + 1, buffer, len);
+
+	free(read_buffer);
+	return ret;
+}
+
 FIXTURE(tun)
 {
 	char ifname[IFNAMSIZ];
@@ -112,10 +314,10 @@ FIXTURE_SETUP(tun)
 {
 	memset(self->ifname, 0, sizeof(self->ifname));
 
-	self->fd = tun_alloc(self->ifname);
+	self->fd = tun_alloc(self->ifname, 0);
 	ASSERT_GE(self->fd, 0);
 
-	self->fd2 = tun_alloc(self->ifname);
+	self->fd2 = tun_alloc(self->ifname, 0);
 	ASSERT_GE(self->fd2, 0);
 }
 
@@ -168,7 +370,7 @@ FIXTURE(tun_deleted)
 FIXTURE_SETUP(tun_deleted)
 {
 	self->ifname[0] = 0;
-	self->fd = tun_alloc(self->ifname);
+	self->fd = tun_alloc(self->ifname, 0);
 	ASSERT_LE(0, self->fd);
 
 	ASSERT_EQ(0, tun_delete(self->ifname))
@@ -233,4 +435,368 @@ TEST_F(tun_deleted, setvnethash)
 	EXPECT_EQ(EBADFD, errno);
 }
 
-TEST_HARNESS_MAIN
+FIXTURE(tun_vnet_hash)
+{
+	int local_fd;
+	int source_fd;
+	int dest_fds[3];
+};
+
+FIXTURE_SETUP(tun_vnet_hash)
+{
+	static const struct {
+		struct tun_vnet_hash hdr;
+		struct tun_vnet_hash_rss rss;
+		uint16_t rss_indirection_table[2];
+		uint8_t rss_key[40];
+	} vnet_hash = {
+		.hdr = {
+			.flags = TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
+			.types = VIRTIO_NET_RSS_HASH_TYPE_IPv4 |
+				VIRTIO_NET_RSS_HASH_TYPE_TCPv4 |
+				VIRTIO_NET_RSS_HASH_TYPE_UDPv4 |
+				VIRTIO_NET_RSS_HASH_TYPE_IPv6 |
+				VIRTIO_NET_RSS_HASH_TYPE_TCPv6 |
+				VIRTIO_NET_RSS_HASH_TYPE_UDPv6
+		},
+		.rss = { .indirection_table_mask = 1, .unclassified_queue = 5 },
+		.rss_indirection_table = { 3, 4 },
+		.rss_key = {
+			0x6d, 0x5a, 0x56, 0xda, 0x25, 0x5b, 0x0e, 0xc2,
+			0x41, 0x67, 0x25, 0x3d, 0x43, 0xa3, 0x8f, 0xb0,
+			0xd0, 0xca, 0x2b, 0xcb, 0xae, 0x7b, 0x30, 0xb4,
+			0x77, 0xcb, 0x2d, 0xa3, 0x80, 0x30, 0xf2, 0x0c,
+			0x6a, 0x42, 0xb7, 0x3b, 0xbe, 0xac, 0x01, 0xfa
+		}
+	};
+
+	struct {
+		struct virtio_net_hdr_v1_hash vnet_hdr;
+		struct ethhdr ethhdr;
+		struct arphdr arphdr;
+		unsigned char sender_hwaddr[6];
+		uint32_t sender_ipaddr;
+		unsigned char target_hwaddr[6];
+		uint32_t target_ipaddr;
+	} __packed packet = {
+		.ethhdr = {
+			.h_source = TUN_HWADDR_SOURCE,
+			.h_dest = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff },
+			.h_proto = htons(ETH_P_ARP)
+		},
+		.arphdr = {
+			.ar_hrd = htons(ARPHRD_ETHER),
+			.ar_pro = htons(ETH_P_IP),
+			.ar_hln = ETH_ALEN,
+			.ar_pln = 4,
+			.ar_op = htons(ARPOP_REQUEST)
+		},
+		.sender_hwaddr = TUN_HWADDR_DEST,
+		.sender_ipaddr = TUN_IPADDR_DEST,
+		.target_ipaddr = TUN_IPADDR_DEST
+	};
+
+	struct tun_vnet_hash cap;
+	char source_ifname[IFNAMSIZ] = "";
+	char dest_ifname[IFNAMSIZ] = "";
+	int i;
+
+	self->local_fd = socket(AF_LOCAL, SOCK_STREAM, 0);
+	ASSERT_LE(0, self->local_fd);
+
+	self->source_fd = tun_alloc(source_ifname, 0);
+	ASSERT_LE(0, self->source_fd) {
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	i = ioctl(self->source_fd, TUNGETVNETHASHCAP, &cap);
+	if (i == -1 && errno == EINVAL) {
+		EXPECT_EQ(0, close(self->local_fd));
+		SKIP(return, "TUNGETVNETHASHCAP not supported");
+	}
+
+	ASSERT_EQ(0, i)
+		EXPECT_EQ(0, close(self->local_fd));
+
+	if ((cap.flags & vnet_hash.hdr.flags) != vnet_hash.hdr.flags) {
+		EXPECT_EQ(0, close(self->local_fd));
+		SKIP(return, "Lacks some hash flag support");
+	}
+
+	if ((cap.types & vnet_hash.hdr.types) != vnet_hash.hdr.types) {
+		EXPECT_EQ(0, close(self->local_fd));
+		SKIP(return, "Lacks some hash type support");
+	}
+
+	ASSERT_TRUE(tun_set_flags(self->local_fd, source_ifname, IFF_UP))
+		EXPECT_EQ(0, close(self->local_fd));
+
+	self->dest_fds[0] = tun_alloc(dest_ifname, IFF_VNET_HDR);
+	ASSERT_LE(0, self->dest_fds[0]) {
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	i = sizeof(struct virtio_net_hdr_v1_hash);
+	ASSERT_EQ(0, ioctl(self->dest_fds[0], TUNSETVNETHDRSZ, &i)) {
+		EXPECT_EQ(0, close(self->dest_fds[0]));
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	i = 1;
+	ASSERT_EQ(0, ioctl(self->dest_fds[0], TUNSETVNETLE, &i)) {
+		EXPECT_EQ(0, close(self->dest_fds[0]));
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_TRUE(tun_set_flags(self->local_fd, dest_ifname, IFF_UP)) {
+		EXPECT_EQ(0, close(self->dest_fds[0]));
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_EQ(sizeof(packet),
+		  write(self->dest_fds[0], &packet, sizeof(packet))) {
+		EXPECT_EQ(0, close(self->dest_fds[0]));
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_EQ(0, ioctl(self->dest_fds[0], TUNSETVNETHASH, &vnet_hash)) {
+		EXPECT_EQ(0, close(self->dest_fds[0]));
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	for (i = 1; i < ARRAY_SIZE(self->dest_fds); i++) {
+		self->dest_fds[i] = tun_alloc(dest_ifname, IFF_VNET_HDR);
+		ASSERT_LE(0, self->dest_fds[i]) {
+			while (i) {
+				i--;
+				EXPECT_EQ(0, close(self->local_fd));
+			}
+
+			EXPECT_EQ(0, close(self->source_fd));
+			EXPECT_EQ(0, close(self->local_fd));
+		}
+	}
+
+	ASSERT_EQ(0, ioctl(self->local_fd, SIOCBRADDBR, "xbridge")) {
+		EXPECT_EQ(0, ioctl(self->local_fd, SIOCBRDELBR, "xbridge"));
+
+		for (i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+			EXPECT_EQ(0, close(self->dest_fds[i]));
+
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_TRUE(tun_add_to_bridge(self->local_fd, source_ifname)) {
+		EXPECT_EQ(0, ioctl(self->local_fd, SIOCBRDELBR, "xbridge"));
+
+		for (i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+			EXPECT_EQ(0, close(self->dest_fds[i]));
+
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_TRUE(tun_add_to_bridge(self->local_fd, dest_ifname)) {
+		EXPECT_EQ(0, ioctl(self->local_fd, SIOCBRDELBR, "xbridge"));
+
+		for (i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+			EXPECT_EQ(0, close(self->dest_fds[i]));
+
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	ASSERT_TRUE(tun_set_flags(self->local_fd, "xbridge", IFF_UP)) {
+		EXPECT_EQ(0, ioctl(self->local_fd, SIOCBRDELBR, "xbridge"));
+
+		for (i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+			EXPECT_EQ(0, close(self->dest_fds[i]));
+
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+}
+
+FIXTURE_TEARDOWN(tun_vnet_hash)
+{
+	ASSERT_TRUE(tun_set_flags(self->local_fd, "xbridge", 0)) {
+		for (size_t i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+			EXPECT_EQ(0, close(self->dest_fds[i]));
+
+		EXPECT_EQ(0, close(self->source_fd));
+		EXPECT_EQ(0, close(self->local_fd));
+	}
+
+	EXPECT_EQ(0, ioctl(self->local_fd, SIOCBRDELBR, "xbridge"));
+
+	for (size_t i = 0; i < ARRAY_SIZE(self->dest_fds); i++)
+		EXPECT_EQ(0, close(self->dest_fds[i]));
+
+	EXPECT_EQ(0, close(self->source_fd));
+	EXPECT_EQ(0, close(self->local_fd));
+}
+
+TEST_F(tun_vnet_hash, unclassified)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct iphdr iphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_LOOPBACK);
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet), 0,
+					VIRTIO_NET_HASH_REPORT_NONE, 0));
+}
+
+TEST_F(tun_vnet_hash, ipv4)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct iphdr iphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IP);
+	tun_build_iphdr(&packet.iphdr, 0, 253);
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet), 0,
+					VIRTIO_NET_HASH_REPORT_IPv4,
+					0x6e45d952));
+}
+
+TEST_F(tun_vnet_hash, tcpv4)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct iphdr iphdr;
+		struct tcphdr tcphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IP);
+	tun_build_iphdr(&packet.iphdr, sizeof(struct tcphdr), IPPROTO_TCP);
+
+	tun_build_tcphdr(&packet.tcphdr,
+			 tun_build_ip_pseudo_sum(&packet.iphdr));
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet),
+					VIRTIO_NET_HDR_F_DATA_VALID,
+					VIRTIO_NET_HASH_REPORT_TCPv4,
+					0xfb63539a));
+}
+
+TEST_F(tun_vnet_hash, udpv4)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct iphdr iphdr;
+		struct udphdr udphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IP);
+	tun_build_iphdr(&packet.iphdr, sizeof(struct udphdr), IPPROTO_UDP);
+
+	tun_build_udphdr(&packet.udphdr,
+			 tun_build_ip_pseudo_sum(&packet.iphdr));
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet),
+					VIRTIO_NET_HDR_F_DATA_VALID,
+					VIRTIO_NET_HASH_REPORT_UDPv4,
+					0xfb63539a));
+}
+
+TEST_F(tun_vnet_hash, ipv6)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct ipv6hdr ipv6hdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IPV6);
+	tun_build_ipv6hdr(&packet.ipv6hdr, 0, 253);
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet), 0,
+					VIRTIO_NET_HASH_REPORT_IPv6,
+					0xd6eb560f));
+}
+
+TEST_F(tun_vnet_hash, tcpv6)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct ipv6hdr ipv6hdr;
+		struct tcphdr tcphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IPV6);
+	tun_build_ipv6hdr(&packet.ipv6hdr, sizeof(struct tcphdr), IPPROTO_TCP);
+
+	tun_build_tcphdr(&packet.tcphdr,
+			 tun_build_ipv6_pseudo_sum(&packet.ipv6hdr));
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet),
+					VIRTIO_NET_HDR_F_DATA_VALID,
+					VIRTIO_NET_HASH_REPORT_TCPv6,
+					0xc2b9f251));
+}
+
+TEST_F(tun_vnet_hash, udpv6)
+{
+	struct {
+		struct ethhdr ethhdr;
+		struct ipv6hdr ipv6hdr;
+		struct udphdr udphdr;
+	} __packed packet;
+
+	tun_build_ethhdr(&packet.ethhdr, ETH_P_IPV6);
+	tun_build_ipv6hdr(&packet.ipv6hdr, sizeof(struct udphdr), IPPROTO_UDP);
+
+	tun_build_udphdr(&packet.udphdr,
+			 tun_build_ipv6_pseudo_sum(&packet.ipv6hdr));
+
+	EXPECT_TRUE(tun_vnet_hash_check(self->source_fd, self->dest_fds,
+					&packet, sizeof(packet),
+					VIRTIO_NET_HDR_F_DATA_VALID,
+					VIRTIO_NET_HASH_REPORT_UDPv6,
+					0xc2b9f251));
+}
+
+int main(int argc, char **argv)
+{
+	FILE *file;
+
+	if (unshare(CLONE_NEWNET)) {
+		perror("unshare");
+		return KSFT_FAIL;
+	}
+
+	file = fopen("/proc/sys/net/ipv6/conf/default/disable_ipv6", "w");
+	if (file) {
+		if (fputc('1', file) != '1') {
+			perror("fputc");
+			return KSFT_FAIL;
+		}
+
+		if (fclose(file)) {
+			perror("fclose");
+			return KSFT_FAIL;
+		}
+	} else if (errno != ENOENT) {
+		perror("fopen");
+		return KSFT_FAIL;
+	}
+
+	return test_harness_run(argc, argv);
+}

-- 
2.48.1


