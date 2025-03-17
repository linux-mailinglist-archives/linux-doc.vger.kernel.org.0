Return-Path: <linux-doc+bounces-41032-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB0A64B6D
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 12:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559391747C5
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 11:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AA023C8D7;
	Mon, 17 Mar 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="X7ui4gUM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8323CEF9
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209127; cv=none; b=QBBFwo4BHy5th9e8WcTt2JBro7s4GNqLFEsa+ol4XdVcDAEcZu35yqIe/V9bMctIKKWa6hnmw0eUMZ5M1YEYm3KLkM32Qsuog5Uh6lWOa/FHcnpbNYA/8zNEgA4auV1EBvvQ9P4he8UKBD7t1O5u+CV4v89rv+Uo4SPul6R1MUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209127; c=relaxed/simple;
	bh=NS1jt1Spbqe/VfrMauqyXz8DgcdsegUNVM2kZauxHEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=S5fJ0zpFC3BKcs8TO/6R7Sa7gACQ9wIwvci0q3A1g4yazZM6PriwjkqPaj2mdFrKtwjtQO7iu3TRHCzVKPchHpCCCuhCdQD1Ku+B9q1UHSCDxIw4HnznUEw/E4lIj+EajWSZbiu+2a8SvybpGt/1e9x82D+thNW6L+2c3jrLr28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=X7ui4gUM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224019ad9edso25218315ad.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742209125; x=1742813925; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps001jy6gq6KEYC80iaJaFVG/ugufazJsC0DDLWZiHk=;
        b=X7ui4gUM53QdwrrfcnYZHGQfoow3U7XxNoS0TwENXFM3Z/DfQ2WtHgnoUVR4AH5MDI
         Y+NaR2hmHplBkIQDQthrNRdq4MZvAr1Q7htDv5LDJKtKyThDy2A9nRkkfWgbylSac9vb
         LeAekfaPCxacOtf2AWcFmdGbi9trAUQMTBQ2OJ3AKkAB8YpHzM163hzZS6bJkpVYuv+u
         yBrnjekK05E91ZE0NdjhKAzOlG9ZBfSUhBV/hKimxQWK7U/jTuipWnKt0jYODxHpKhT1
         3D2zMz/EVJGJQD5nzOWpw7z9rShCZO0xUj/XHrbOT/Qu2+2T0wv3MQzYLm3X2bfYVGNP
         pdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209125; x=1742813925;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps001jy6gq6KEYC80iaJaFVG/ugufazJsC0DDLWZiHk=;
        b=Q2o090lNT+d2ZXBSLrwILOBOIZbR9EfvUgWRZhSB29OnMrgZhRuDLxc4wSe1OqqSMy
         F8o6O8O6mJuFXFuizTAOv2vCS0fPU3EY5z/f5kBIvB/K71NKNvFUJt7lSLQT4XniNwBV
         zQVaOLE8iyuYNsM0L9ki8we/87+HgxMeNGDqNAZtPmjM6qhn00LExwCLwZWR8xdvFmlV
         y55t/5PSLbFFghFkiZT73DD4hjnBMUtkNiF5oL1m+edWDmMcohIYIa7qXqZQUWTFkqp1
         DyKFLgucLfaLoWCCYYt3GkUizLZtPofym1AUF6ehPSwbGF8D/obyVd3jfcohJD66fNCR
         orWA==
X-Forwarded-Encrypted: i=1; AJvYcCVauZzquF4Sr+B1vz6oofzQEXoUPt900B1BIXKWWSSoeRCGyYKn60Qla6fwRl6u0GEJadAQB+gP7Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzcoyC/sLzCdEzF+YjpcUeNE8gy8iHvehlMyz8k5K17uHeYiI
	ddtgf5EiBPMXDzFbCxIVBRzBOTmyVR4SzIMmNA7jOWQZvphNQeYMCzEWGpSNNCs=
X-Gm-Gg: ASbGnctUHBwqIAshIU5ik8uT8RREeMYFIXTD1kgdr5nGKznokytW23LsGJZc6UlNYgY
	e2NVN4Mo6SegpmvWWe6Yq4vRDIab+1hrwgdPnJFKHyJyADH3M3PPCRxRHteYosD5FX9w1z3nDZm
	M5VX5IsI9PQjwoqilkfjqLA05kxqhqyGS3jqGc+OxNecNo0c6UHRIR6PsBkD/pBHHh20c5fskCV
	emQr/fdoYhQA7+nsgyaI4Hx5Mx0QrQc8HNZN0SYYNHHxA2Ljb56dLamZ+atDcfh1x2wuyfcHq9A
	wKKQi5jREywzTq7ykNlxIK7h0u9Rg6E1hSNI8pW25qXUX1JU
X-Google-Smtp-Source: AGHT+IG4tqeuOPRgYJpRA3znbIb40OfzfCTZrtqtBmMDFB3f6jddrhuXu4ka83knBKzypM1vMA3jXQ==
X-Received: by 2002:a17:902:cecd:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-225e0aff4e1mr149551595ad.42.1742209124818;
        Mon, 17 Mar 2025 03:58:44 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6ba70d2sm72331995ad.136.2025.03.17.03.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:58:44 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 17 Mar 2025 19:57:56 +0900
Subject: [PATCH net-next v11 06/10] tap: Introduce virtio-net hash feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-rss-v11-6-4cacca92f31f@daynix.com>
References: <20250317-rss-v11-0-4cacca92f31f@daynix.com>
In-Reply-To: <20250317-rss-v11-0-4cacca92f31f@daynix.com>
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

Add ioctls and storage required for the virtio-net hash feature to TAP.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/ipvlan/ipvtap.c |  2 +-
 drivers/net/macvtap.c       |  2 +-
 drivers/net/tap.c           | 70 +++++++++++++++++++++++++++++++++++++++++----
 include/linux/if_tap.h      |  4 ++-
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ipvlan/ipvtap.c b/drivers/net/ipvlan/ipvtap.c
index 1afc4c47be73..305438abf7ae 100644
--- a/drivers/net/ipvlan/ipvtap.c
+++ b/drivers/net/ipvlan/ipvtap.c
@@ -114,7 +114,7 @@ static void ipvtap_dellink(struct net_device *dev,
 	struct ipvtap_dev *vlan = netdev_priv(dev);
 
 	netdev_rx_handler_unregister(dev);
-	tap_del_queues(&vlan->tap);
+	tap_del(&vlan->tap);
 	ipvlan_link_delete(dev, head);
 }
 
diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
index 29a5929d48e5..e72144d05ef4 100644
--- a/drivers/net/macvtap.c
+++ b/drivers/net/macvtap.c
@@ -122,7 +122,7 @@ static void macvtap_dellink(struct net_device *dev,
 	struct macvtap_dev *vlantap = netdev_priv(dev);
 
 	netdev_rx_handler_unregister(dev);
-	tap_del_queues(&vlantap->tap);
+	tap_del(&vlantap->tap);
 	macvlan_dellink(dev, head);
 }
 
diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 25c60ff2d3f2..2213a2aa83a8 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -49,6 +49,10 @@ struct major_info {
 	struct list_head next;
 };
 
+struct tap_skb_cb {
+	struct virtio_net_hash hash;
+};
+
 #define GOODCOPY_LEN 128
 
 static const struct proto_ops tap_socket_ops;
@@ -179,9 +183,20 @@ static void tap_put_queue(struct tap_queue *q)
 	sock_put(&q->sk);
 }
 
+static struct tap_skb_cb *tap_skb_cb(const struct sk_buff *skb)
+{
+	BUILD_BUG_ON(sizeof(skb->cb) < sizeof(struct tap_skb_cb));
+	return (struct tap_skb_cb *)skb->cb;
+}
+
+static struct virtio_net_hash *tap_add_hash(struct sk_buff *skb)
+{
+	return &tap_skb_cb(skb)->hash;
+}
+
 static const struct virtio_net_hash *tap_find_hash(const struct sk_buff *skb)
 {
-	return NULL;
+	return &tap_skb_cb(skb)->hash;
 }
 
 /*
@@ -194,6 +209,7 @@ static const struct virtio_net_hash *tap_find_hash(const struct sk_buff *skb)
 static struct tap_queue *tap_get_queue(struct tap_dev *tap,
 				       struct sk_buff *skb)
 {
+	struct flow_keys_basic keys_basic;
 	struct tap_queue *queue = NULL;
 	/* Access to taps array is protected by rcu, but access to numvtaps
 	 * isn't. Below we use it to lookup a queue, but treat it as a hint
@@ -201,17 +217,47 @@ static struct tap_queue *tap_get_queue(struct tap_dev *tap,
 	 * racing against queue removal.
 	 */
 	int numvtaps = READ_ONCE(tap->numvtaps);
+	struct tun_vnet_hash_container *vnet_hash = rcu_dereference(tap->vnet_hash);
 	__u32 rxq;
 
+	*tap_skb_cb(skb) = (struct tap_skb_cb) {
+		.hash = { .report = VIRTIO_NET_HASH_REPORT_NONE }
+	};
+
 	if (!numvtaps)
 		goto out;
 
 	if (numvtaps == 1)
 		goto single;
 
+	if (vnet_hash) {
+		if ((vnet_hash->common.flags & TUN_VNET_HASH_RSS)) {
+			rxq = tun_vnet_rss_select_queue(numvtaps, vnet_hash, skb, tap_add_hash);
+			queue = rcu_dereference(tap->taps[rxq]);
+			goto out;
+		}
+
+		if (!skb->l4_hash && !skb->sw_hash) {
+			struct flow_keys keys;
+
+			skb_flow_dissect_flow_keys(skb, &keys, FLOW_DISSECTOR_F_STOP_AT_FLOW_LABEL);
+			rxq = flow_hash_from_keys(&keys);
+			keys_basic = (struct flow_keys_basic) {
+				.control = keys.control,
+				.basic = keys.basic
+			};
+		} else {
+			skb_flow_dissect_flow_keys_basic(NULL, skb, &keys_basic, NULL, 0, 0, 0,
+							 FLOW_DISSECTOR_F_STOP_AT_FLOW_LABEL);
+			rxq = skb->hash;
+		}
+	} else {
+		rxq = skb_get_hash(skb);
+	}
+
 	/* Check if we can use flow to select a queue */
-	rxq = skb_get_hash(skb);
 	if (rxq) {
+		tun_vnet_hash_report(vnet_hash, skb, &keys_basic, rxq, tap_add_hash);
 		queue = rcu_dereference(tap->taps[rxq % numvtaps]);
 		goto out;
 	}
@@ -234,10 +280,10 @@ static struct tap_queue *tap_get_queue(struct tap_dev *tap,
 
 /*
  * The net_device is going away, give up the reference
- * that it holds on all queues and safely set the pointer
- * from the queues to NULL.
+ * that it holds on all queues, safely set the pointer
+ * from the queues to NULL, and free vnet_hash.
  */
-void tap_del_queues(struct tap_dev *tap)
+void tap_del(struct tap_dev *tap)
 {
 	struct tap_queue *q, *tmp;
 
@@ -254,8 +300,10 @@ void tap_del_queues(struct tap_dev *tap)
 	BUG_ON(tap->numqueues);
 	/* guarantee that any future tap_set_queue will fail */
 	tap->numvtaps = MAX_TAP_QUEUES;
+
+	kfree_rcu_mightsleep(rtnl_dereference(tap->vnet_hash));
 }
-EXPORT_SYMBOL_GPL(tap_del_queues);
+EXPORT_SYMBOL_GPL(tap_del);
 
 rx_handler_result_t tap_handle_frame(struct sk_buff **pskb)
 {
@@ -998,6 +1046,16 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		rtnl_unlock();
 		return ret;
 
+	case TUNGETVNETHASHCAP:
+		return tun_vnet_ioctl_gethashcap(argp);
+
+	case TUNSETVNETHASH:
+		rtnl_lock();
+		tap = rtnl_dereference(q->tap);
+		ret = tap ? tun_vnet_ioctl_sethash(&tap->vnet_hash, argp) : -EBADFD;
+		rtnl_unlock();
+		return ret;
+
 	case SIOCGIFHWADDR:
 		rtnl_lock();
 		tap = tap_get_tap_dev(q);
diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
index 553552fa635c..9e8e02822d9c 100644
--- a/include/linux/if_tap.h
+++ b/include/linux/if_tap.h
@@ -31,6 +31,7 @@ static inline struct ptr_ring *tap_get_ptr_ring(struct file *f)
 #define MAX_TAP_QUEUES 256
 
 struct tap_queue;
+struct tun_vnet_hash_container;
 
 struct tap_dev {
 	struct net_device	*dev;
@@ -43,6 +44,7 @@ struct tap_dev {
 	int			numqueues;
 	netdev_features_t	tap_features;
 	int			minor;
+	struct tun_vnet_hash_container __rcu *vnet_hash;
 
 	void (*update_features)(struct tap_dev *tap, netdev_features_t features);
 	void (*count_tx_dropped)(struct tap_dev *tap);
@@ -74,7 +76,7 @@ struct tap_queue {
 };
 
 rx_handler_result_t tap_handle_frame(struct sk_buff **pskb);
-void tap_del_queues(struct tap_dev *tap);
+void tap_del(struct tap_dev *tap);
 int tap_get_minor(dev_t major, struct tap_dev *tap);
 void tap_free_minor(dev_t major, struct tap_dev *tap);
 int tap_queue_resize(struct tap_dev *tap);

-- 
2.48.1


