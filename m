Return-Path: <linux-doc+bounces-40673-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BAA5EC63
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 08:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8B53BB8C3
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 07:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E1A1FBCB5;
	Thu, 13 Mar 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="F/CrAVk8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BA202C3E
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849324; cv=none; b=mM7/VoannQVk8EyCXwr77296BuSp8FqaF8ZgE1tgO3okmvCsd3fBu++jGOZvU1PK51/wHBqD+GBjC8pjw0vTD9hqdQwQCm95M4czfZMIRUXDk3CyBGFWVqhAAKPOfHAhNPalfdvWZU+O6UnwjqRwDG0ZUsTmc9fsfAuGOSb6bLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849324; c=relaxed/simple;
	bh=HCjJw4xyhEzQ6zT8qCsmgUzt1olFBpZX2ZwL4amUYp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=EEENYOfqiiL4l6HsNlzZKdx9yR9h2/olkK3i/L+kov6jg+uM7pASCbwuf9o/qk1/RpjSMo1pCZl5o7NhQ9q/eL10Q3nV1QKOFQViWemlwU8XFnWWnt0vnoPeOGU9WeM//IrrrBsfmXhH/TVNdMmSWa0Q6wrUtqzNG2JsXjM3ssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=F/CrAVk8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2feb91a25bdso1135670a91.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849322; x=1742454122; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkGikd/Ad/tPfmKfWOKmNpfe6xZfSLW8Y3eIuF8D5nY=;
        b=F/CrAVk8xN1b3CJ5BbtJjJjQzf3qL7RZFEAOgHE/oeNDFmHTkBAgzgjNq66Lc2ipyo
         96xPRPjxeNqbMs38Cv/Ej96T9Hd6j9GaZnyhfYqTvorYdTDlhGVdaLg20ei7gMAZULOM
         b4aMpNDDSnrJTk9CfFHEqhDCVeoxKczcCX5oqZcClXKr3V+eHEzvYSrPYGCYMFvj3Tf+
         EyXgxBslmcdTn8cbfFyjAW5GkkwgWyfNK3CP7fhkKBkCFx0n45OA6MeLYtSXZ+Uy9Hwc
         4H9U7tWy24yClf5VxOyxDKW/sJW61jN6BD8gtKe3XGTjtd7nEARaSX+SY9+By/fHdbSY
         2FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849322; x=1742454122;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkGikd/Ad/tPfmKfWOKmNpfe6xZfSLW8Y3eIuF8D5nY=;
        b=ZMIsBggzzV2Ze2hpnivEdHGSR9z+t07f+3vpEiVJmDenb5+gAmf1BcaKg0azJjjvy9
         SCeg8+NOZIlRBA3Esd/L5NJXfqXY5sY7Bp558XIJFe3EXnT8vm7GXBRuGLTVsM0KRl1l
         QsYzpQOpCfI7NIXa9ay3ba1xi4Tr5qLEKC6NiOXCikPVeQR/S0U9Plllt17K0rFuACRg
         D06XuNdbZWS6LFabb1SBs9TXmtcPS08w7FB2lpUqDnBqhtr4aneKWBRAx8be8KL8Jf5v
         sArrUUlxNK4kUBFQsBe1DElUH4xVU0/26aB2AdwKyZkqSB3lzc77CUxqYyU5mPLO5eZM
         4FYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjf7AO54xouxijRbSvRZ7ak0gAWG4JtM7howrOAwan74RyCwLKzPUz4Z/KUvq0FxN6dnhGalACLqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHB8FfUQAGCEtBXaE5B8SPX54mFbEKlty7s4nklK8bxxqc7fK
	yvsXfhyaI1t/vW2kGz+4dcdlZ1HrsbiHGJ6YaU0YqEVsdAfNeWIIqYepnZ3fC6o=
X-Gm-Gg: ASbGncukOuL7mvrUJSBtyrRGXBYKa08l3OUINo1qgsKwiNoySxmun0O+i3o9hg4lSQ0
	6Wj7zaAkhvFHLn7tZoZrnQ9kJ0Fx4DR5364qOl8u5bg7HrXRF5U4HmsR6DUJA++KGkgAGTFXjkF
	KUsRYPFoxIpzoE3NPe4TwmpJq5Q8acszjX/GkuEeM6KQXbS3Mz9txrPS+FM4enAKcq/Fj7C4S0B
	UvOWn6MvLSn6KXpgbelLbQl56TCZ/CiGTb3d6oyXY6CvsgSu6Cf5/mUDBYKarakSBThKGA1iyk4
	XqzTW8Kvu2hRZ9cpUKZnXqNQea77cf2u5MrfA3lYVDKZhwUc
X-Google-Smtp-Source: AGHT+IHTpYDPSLT5yc7d72SDsCx1rUk7tGT6u0RLi/zmklDJcrhUC3W1KPTvb1y0wV1IhmZnoguH1A==
X-Received: by 2002:a17:90b:1c83:b0:2fe:a77b:d97e with SMTP id 98e67ed59e1d1-300ff0cadb2mr14806388a91.11.1741849321996;
        Thu, 13 Mar 2025 00:02:01 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3010342f135sm3173081a91.1.2025.03.13.00.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:02:01 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 16:01:09 +0900
Subject: [PATCH net-next v10 06/10] tap: Introduce virtio-net hash feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-rss-v10-6-3185d73a9af0@daynix.com>
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

Add ioctls and storage required for the virtio-net hash feature to TAP.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c      | 60 ++++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/if_tap.h |  2 ++
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 25c60ff2d3f2..86b5e7b88614 100644
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
@@ -998,6 +1044,16 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
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
index 553552fa635c..7334c46a3f10 100644
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

-- 
2.48.1


