Return-Path: <linux-doc+bounces-40672-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E598A5EC5E
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 08:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7670F189FF8C
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 07:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBF11FDA6B;
	Thu, 13 Mar 2025 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="dqDAFYC3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F11FDA86
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849317; cv=none; b=Fa/gK2h6mjq4KZJQ6qzzlNvqwvlhnWkplk6INsHFaeT0nBh/LmlviXf7m/7d8sQk4QLhTVRrY42+rnn3SD+EMVgynK79elOxWZNiLYW/XhW/qkCIcktoZGwo4oZNhEDt9exLKBdz3uQUrGh139mLn6zCTSlS8b1AYTNFik7hpLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849317; c=relaxed/simple;
	bh=fAsNygmBH4vEFfwnr1O256Ehqy/tj24JUzQEngxqzTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=seGj9+pmPB6Gk0jt9Jp9jPFT5EJrtzXRyxQsALufFnsOVs9JWwrGBpfBTFPlRF50eqG7H+AKQPH1u2Esd6+R2LmUVCJ3esNiFS1kzxU3U5eHBPfeQEPtpPNv2yRN2pk3HluTOuxzlzEGUgvQawmwHmnnhpNAIYO+3fB12qsvM2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=dqDAFYC3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22435603572so10765245ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849315; x=1742454115; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEx1oB+WR7O6v2TIINfyTS8xxjNqfeRuV0OaAnQT/3s=;
        b=dqDAFYC3FI27Lq8swyujI9KWapP3mNM9Cr3I7YN7BsWKhW48xN+3OivsqDxl4heFio
         Jjhypw1gSs9gti7hTe1932GkVEpc4/u+FHtNpDevJpMm259CCoWH3TIxNp1JGN3yleTe
         MxVHlJP2kaKv3u6cxuoX4kghqDXzW7kXwuZgdAV/g8At4+PR/gsnE84t+fYX1iftslBt
         JkVbW+NUHDnB9r5tr2rGMC9n01cHBue3rHtJJJsLloMyy0X9kCK+XL65fPa4I9KRt8Kf
         j6cgMwVS8EvK+6rzO6WyICX3BDgXJSZvNLKJgQJ39AMWF4MvY9bTl2Vw6IYl3TMDHoa7
         ompQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849315; x=1742454115;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEx1oB+WR7O6v2TIINfyTS8xxjNqfeRuV0OaAnQT/3s=;
        b=QzsmrsFJydy/0x26PIpcZJ6dF/D3h91HlP2kBJWIOQt42qW5cunaVVac4T3p8DE683
         kfm3zMX0/zA8wQTTCtGA7Zl7WKj+kjrWBX9pr/rWCt5caM/i4JmSr73xARBq/Micu78e
         SjXSKKY/3qgeC/kqn+sK+T259C1Q3cNuXdpnMYCJ0gZ/MaKkOxQnVpyx+rGmPzFI+6K/
         V1UVA9MuFui5/EE1fP2QLNS7ih+zzOTpBF1qNmXvN2aTJ2HHLb36upy5D3Niu9KLCify
         iL2vLyy8GaDY+zazjMqCS1HNw2gW9QuIbe8zY9wsA1wTgEt0HfPpnthaDAkaTDwd2U2A
         t2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUjKU/Hf+cN6NZ7WacTAcaPB2rsLW0DS+vyhuGZSjQUf1/bGbZyXU1sZH+qfEgDJGnDX74hMwmOKhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKm4FX4SKyy87otf97x6Utjpb+jClPlobc2NJFs4uRqe5nYLsd
	uuV6zMcSuxaWWfXD1jEQ9CpUEhjQePTTejYWXU1Fx3IuJz+BHNrE3NOJ33tAmQvtRQUwaPhamHh
	QZQQ=
X-Gm-Gg: ASbGncsmguXST2uH5fl19l4mv9AA089gf79FnV6yOny0HaO1KyK5vMRvFBpwTZ4Y61W
	nxx62oUpjf5PVq87LEPKFnst4GNh6q5qrhV8E7x5rP7ck1uUVQWsQPMn14N0iPNlHsGg2ztehS9
	NJYibvIM88wxi8dqOIvRWfco/yagFl8/+cep9eXuZxToXhn0z89aW5hXayRmGEKPIlbt8+ZkFcx
	Wyz7MJqShCx4gxL1kOWBWuFHqB5d3gVzI0beochZZ/twIW63vD9XeiSA9bqzfXh16jiU94oERhF
	HtJeu5vydRvRi61AP/eSQjuFn40jUH7WyHB1LocxWSk5xYmiYO4AqbaJLwA=
X-Google-Smtp-Source: AGHT+IFxYhCxmO0r82s2kBmNT4izOERTLgrLPNuxMZ4nqqb1ELCFYiVGwW2lZs8BLOwjEz2BJgVjGw==
X-Received: by 2002:a17:902:d50e:b0:223:4d7e:e523 with SMTP id d9443c01a7336-22428c24321mr304711965ad.50.1741849315481;
        Thu, 13 Mar 2025 00:01:55 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6ba6c8dsm6485835ad.156.2025.03.13.00.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:01:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 16:01:08 +0900
Subject: [PATCH net-next v10 05/10] tun: Introduce virtio-net hash feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-rss-v10-5-3185d73a9af0@daynix.com>
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

Add ioctls and storage required for the virtio-net hash feature to TUN.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/Kconfig    |  1 +
 drivers/net/tun.c      | 54 ++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/skbuff.h |  3 +++
 net/core/skbuff.c      |  4 ++++
 4 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 1fd5acdc73c6..aecfd244dd83 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -395,6 +395,7 @@ config TUN
 	tristate "Universal TUN/TAP device driver support"
 	depends on INET
 	select CRC32
+	select SKB_EXTENSIONS
 	help
 	  TUN/TAP provides packet reception and transmission for user space
 	  programs.  It can be viewed as a simple Point-to-Point or Ethernet
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 03d47799e9bd..b2d74e0ec932 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -209,6 +209,7 @@ struct tun_struct {
 	struct bpf_prog __rcu *xdp_prog;
 	struct tun_prog __rcu *steering_prog;
 	struct tun_prog __rcu *filter_prog;
+	struct tun_vnet_hash_container __rcu *vnet_hash;
 	struct ethtool_link_ksettings link_ksettings;
 	/* init args */
 	struct file *file;
@@ -451,9 +452,14 @@ static inline void tun_flow_save_rps_rxhash(struct tun_flow_entry *e, u32 hash)
 		e->rps_rxhash = hash;
 }
 
+static struct virtio_net_hash *tun_add_hash(struct sk_buff *skb)
+{
+	return skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
+}
+
 static const struct virtio_net_hash *tun_find_hash(const struct sk_buff *skb)
 {
-	return NULL;
+	return skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
 }
 
 /* We try to identify a flow through its rxhash. The reason that
@@ -462,14 +468,21 @@ static const struct virtio_net_hash *tun_find_hash(const struct sk_buff *skb)
  * the userspace application move between processors, we may get a
  * different rxq no. here.
  */
-static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
+static u16 tun_automq_select_queue(struct tun_struct *tun,
+				   const struct tun_vnet_hash_container *vnet_hash,
+				   struct sk_buff *skb)
 {
+	struct flow_keys keys;
+	struct flow_keys_basic keys_basic;
 	struct tun_flow_entry *e;
 	u32 txq, numqueues;
 
 	numqueues = READ_ONCE(tun->numqueues);
 
-	txq = __skb_get_hash_symmetric(skb);
+	memset(&keys, 0, sizeof(keys));
+	skb_flow_dissect(skb, &flow_keys_dissector_symmetric, &keys, 0);
+
+	txq = flow_hash_from_keys(&keys);
 	e = tun_flow_find(&tun->flows[tun_hashfn(txq)], txq);
 	if (e) {
 		tun_flow_save_rps_rxhash(e, txq);
@@ -478,6 +491,13 @@ static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
 		txq = reciprocal_scale(txq, numqueues);
 	}
 
+	keys_basic = (struct flow_keys_basic) {
+		.control = keys.control,
+		.basic = keys.basic
+	};
+	tun_vnet_hash_report(vnet_hash, skb, &keys_basic, skb->l4_hash ? skb->hash : txq,
+			     tun_add_hash);
+
 	return txq;
 }
 
@@ -513,8 +533,15 @@ static u16 tun_select_queue(struct net_device *dev, struct sk_buff *skb,
 	u16 ret;
 
 	rcu_read_lock();
-	if (!tun_ebpf_select_queue(tun, skb, &ret))
-		ret = tun_automq_select_queue(tun, skb);
+	if (!tun_ebpf_select_queue(tun, skb, &ret)) {
+		struct tun_vnet_hash_container *vnet_hash = rcu_dereference(tun->vnet_hash);
+
+		if (vnet_hash && (vnet_hash->common.flags & TUN_VNET_HASH_RSS))
+			ret = tun_vnet_rss_select_queue(READ_ONCE(tun->numqueues), vnet_hash,
+							skb, tun_add_hash);
+		else
+			ret = tun_automq_select_queue(tun, vnet_hash, skb);
+	}
 	rcu_read_unlock();
 
 	return ret;
@@ -2235,6 +2262,7 @@ static void tun_free_netdev(struct net_device *dev)
 	security_tun_dev_free_security(tun->security);
 	__tun_set_ebpf(tun, &tun->steering_prog, NULL);
 	__tun_set_ebpf(tun, &tun->filter_prog, NULL);
+	kfree_rcu_mightsleep(rcu_access_pointer(tun->vnet_hash));
 }
 
 static void tun_setup(struct net_device *dev)
@@ -3014,16 +3042,22 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 	} else {
 		memset(&ifr, 0, sizeof(ifr));
 	}
-	if (cmd == TUNGETFEATURES) {
+	switch (cmd) {
+	case TUNGETFEATURES:
 		/* Currently this just means: "what IFF flags are valid?".
 		 * This is needed because we never checked for invalid flags on
 		 * TUNSETIFF.
 		 */
 		return put_user(IFF_TUN | IFF_TAP | IFF_NO_CARRIER |
 				TUN_FEATURES, (unsigned int __user*)argp);
-	} else if (cmd == TUNSETQUEUE) {
+
+	case TUNSETQUEUE:
 		return tun_set_queue(file, &ifr);
-	} else if (cmd == SIOCGSKNS) {
+
+	case TUNGETVNETHASHCAP:
+		return tun_vnet_ioctl_gethashcap(argp);
+
+	case SIOCGSKNS:
 		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
 			return -EPERM;
 		return open_related_ns(&net->ns, get_net_ns);
@@ -3264,6 +3298,10 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 		ret = open_related_ns(&net->ns, get_net_ns);
 		break;
 
+	case TUNSETVNETHASH:
+		ret = tun_vnet_ioctl_sethash(&tun->vnet_hash, argp);
+		break;
+
 	default:
 		ret = tun_vnet_ioctl(&tun->vnet_hdr_sz, &tun->flags, cmd, argp);
 		break;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index bb2b751d274a..cdd793f1c360 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4842,6 +4842,9 @@ enum skb_ext_id {
 #endif
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	SKB_EXT_MCTP,
+#endif
+#if IS_ENABLED(CONFIG_TUN)
+	SKB_EXT_TUN_VNET_HASH,
 #endif
 	SKB_EXT_NUM, /* must be last */
 };
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 7b03b64fdcb2..aa2a091b649f 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -64,6 +64,7 @@
 #include <linux/mpls.h>
 #include <linux/kcov.h>
 #include <linux/iov_iter.h>
+#include <linux/virtio_net.h>
 
 #include <net/protocol.h>
 #include <net/dst.h>
@@ -4969,6 +4970,9 @@ static const u8 skb_ext_type_len[] = {
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	[SKB_EXT_MCTP] = SKB_EXT_CHUNKSIZEOF(struct mctp_flow),
 #endif
+#if IS_ENABLED(CONFIG_TUN)
+	[SKB_EXT_TUN_VNET_HASH] = SKB_EXT_CHUNKSIZEOF(struct virtio_net_hash),
+#endif
 };
 
 static __always_inline unsigned int skb_ext_total_length(void)

-- 
2.48.1


