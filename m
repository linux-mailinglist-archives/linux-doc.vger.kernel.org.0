Return-Path: <linux-doc+bounces-39689-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB5A492D1
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2025 09:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 453087A999A
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2025 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC331DFDA3;
	Fri, 28 Feb 2025 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Gqh3G4y2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78621DF733
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729584; cv=none; b=dqrFepLJnE/CYL5XZbq7LcT75mJ70AGHuXBYZCow9JPXmEPl+ckiaGBzpQzOUKt+PaL4ExaSXbE50irlYsEP6dND9tdVXsIF3UxHvZJLh3/6U5vkggFgXx2Fhj4sNzUWs04Q4sa0EvmnLcnT80Vrueap0xMIPhC+IdmnzmrsE7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729584; c=relaxed/simple;
	bh=efUQp3xn6WYS8yAIVpG+8nNESAbDYNoZwtefI4rJo8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=SPWj/X4DVNLVipE5UBOm8QS9DkdKvxvehpJ3fwPjLnagAIXw6uTxp0xYmOT3DOMxiC1A1jl/CKl2YJDEEgrwNWD/3riD0cLm+E0BvN62+H4tkeumCAZ8HundA/WOhyz6KUFaT33g9OWqDQ9nRnhdMPOgVjKsjBmGxgHWveq6KQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Gqh3G4y2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2234e4b079cso33851125ad.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1740729582; x=1741334382; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnuaMjhFxZ/6ziAA9dAFSZFZKEXkUeKJopwW9aMJd8c=;
        b=Gqh3G4y2yorBO/wUaz28DqJk6URfzL07YhwzAUL57IgGeCHg6O6DSkNejc9o2yZ7fH
         flsoO6pzdk3tR/aSXtXLRxfSEXnEHdItVrWOre62JaOKjXmCjTj25BAYYyjsKniEZzGS
         sNazzvKEdKrXHt1+/oWpILl0SCqG3UR+WL8Gv944EroJBOlO4mOPFnEZc5RhjbIyOlo5
         9kjqG30zibL60i3DGe7f5ZCgb7wrL8hzTA7gdHN3nS2sQwo8mG/lWFvo9IGTRP53D1aL
         DKHud9VDFXR6C9hzCivxtuJx9SZrBQJlxY5BE69XolHh6Eyb25tDGgpDOdVNapQFpG3c
         9Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740729582; x=1741334382;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnuaMjhFxZ/6ziAA9dAFSZFZKEXkUeKJopwW9aMJd8c=;
        b=snP5G1k1nrZ8DrYl9mgCnp0COMa6FhpfzwdV2QBKNZpLsjM+ryjEPNHYd7YiR1upqL
         sfgBBkQaxbH5Q/coAcb62UJ9epPQfloQq2n1NpAL5uS6/Dbw4MOj0MQxmYmTBrXMJAsO
         Gf7jGHRyecUMdjHGraIzpupXnzFhXyKbWhcZ3Bvr2ZoCyD0COVZ/wFHzLxRjXjd5jLpk
         HSKZQWFq3U7LwMoRTY36LGXVsUh/LpDyNrZ3S3jPJwUkDAKDtOizNeo87UJkpqJZ8+YE
         e0uQYB1BXHrCfb2B3bo234eQ0rz7N+LqVzENDZaSCLWB50Qx03Ddw6fWC1vzAOPydftN
         DPsA==
X-Forwarded-Encrypted: i=1; AJvYcCVlqFSwISjZF0+tECpsKpTMSO/fMOv39mHQN3WFwXdsHLNFX+0A5yqAwjG498DmsV73xP0yV90OC44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVB8VmU5wDE3ZaziUy5OL557VqacqgJBTHS4U9ukJ5hYJHYFxJ
	AiMUboiOBZvxw4UZDS0gidVUUvXwf3ocFMXAuMeKgWr5a7W3AZO4gXw0eN5hrd4=
X-Gm-Gg: ASbGnctXZTC/MEpbRVD4H7Gj+Kc/8KNuOndLwvgaGFH/a6OhEUGFOyaFgW8NkBE6Juz
	AFkRgYrn4YRcW9kkrOQM0nQLS1sXxIHSKq+w8bDjNJmJSJH8x/i52UzFbO/Jm1e7Ile59XK7gHD
	kUGqrvtOIYmNtMeE1nKxXFUnq1h5bcaLoJ+3mu84eq0MLtDsEA053GqL3DDqGEo4vpjf37LrZcP
	aa1x3Rkmqq42UP3HE1ihr1YMmtcj0zSDrPlekXQqWBd/T+XlcC20EuhdWaxO57N8I1QoghojIA0
	AMR8D7kfEhl1tM8ph19IYmm/6KUp/A==
X-Google-Smtp-Source: AGHT+IEHq9KgafAA2Kp/V3wkg5JFswjExpfT3tDMSfV41fmOxWgxIOQNfI70dD7nhe9dRE8LZJt4RQ==
X-Received: by 2002:a17:902:ce91:b0:223:64bb:f657 with SMTP id d9443c01a7336-2236922352bmr33953935ad.46.1740729582283;
        Thu, 27 Feb 2025 23:59:42 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2235050f18bsm27632835ad.213.2025.02.27.23.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 23:59:41 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 28 Feb 2025 16:58:52 +0900
Subject: [PATCH net-next v7 6/6] vhost/net: Support
 VIRTIO_NET_F_HASH_REPORT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-rss-v7-6-844205cbbdd6@daynix.com>
References: <20250228-rss-v7-0-844205cbbdd6@daynix.com>
In-Reply-To: <20250228-rss-v7-0-844205cbbdd6@daynix.com>
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
 Lei Yang <leiyang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
hash values (i.e., the hash_report member is always set to
VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
underlying socket will be reported.

VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/vhost/net.c | 49 +++++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index b9b9e9d40951856d881d77ac74331d914473cd56..16b241b44f89820a42c302f3586ea6bb5e0d4289 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -73,6 +73,7 @@ enum {
 	VHOST_NET_FEATURES = VHOST_FEATURES |
 			 (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
 			 (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
+			 (1ULL << VIRTIO_NET_F_HASH_REPORT) |
 			 (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
 			 (1ULL << VIRTIO_F_RING_RESET)
 };
@@ -1097,9 +1098,11 @@ static void handle_rx(struct vhost_net *net)
 		.msg_controllen = 0,
 		.msg_flags = MSG_DONTWAIT,
 	};
-	struct virtio_net_hdr hdr = {
-		.flags = 0,
-		.gso_type = VIRTIO_NET_HDR_GSO_NONE
+	struct virtio_net_hdr_v1_hash hdr = {
+		.hdr = {
+			.flags = 0,
+			.gso_type = VIRTIO_NET_HDR_GSO_NONE
+		}
 	};
 	size_t total_len = 0;
 	int err, mergeable;
@@ -1110,7 +1113,6 @@ static void handle_rx(struct vhost_net *net)
 	bool set_num_buffers;
 	struct socket *sock;
 	struct iov_iter fixup;
-	__virtio16 num_buffers;
 	int recv_pkts = 0;
 
 	mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
@@ -1191,30 +1193,30 @@ static void handle_rx(struct vhost_net *net)
 			vhost_discard_vq_desc(vq, headcount);
 			continue;
 		}
+		hdr.hdr.num_buffers = cpu_to_vhost16(vq, headcount);
 		/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
 		if (unlikely(vhost_hlen)) {
-			if (copy_to_iter(&hdr, sizeof(hdr),
-					 &fixup) != sizeof(hdr)) {
+			if (copy_to_iter(&hdr, vhost_hlen,
+					 &fixup) != vhost_hlen) {
 				vq_err(vq, "Unable to write vnet_hdr "
 				       "at addr %p\n", vq->iov->iov_base);
 				goto out;
 			}
-		} else {
+		} else if (likely(set_num_buffers)) {
 			/* Header came from socket; we'll need to patch
 			 * ->num_buffers over if VIRTIO_NET_F_MRG_RXBUF
 			 */
-			iov_iter_advance(&fixup, sizeof(hdr));
+			iov_iter_advance(&fixup, offsetof(struct virtio_net_hdr_v1, num_buffers));
+
+			if (copy_to_iter(&hdr.hdr.num_buffers, sizeof(hdr.hdr.num_buffers),
+					 &fixup) != sizeof(hdr.hdr.num_buffers)) {
+				vq_err(vq, "Failed num_buffers write");
+				vhost_discard_vq_desc(vq, headcount);
+				goto out;
+			}
 		}
 		/* TODO: Should check and handle checksum. */
 
-		num_buffers = cpu_to_vhost16(vq, headcount);
-		if (likely(set_num_buffers) &&
-		    copy_to_iter(&num_buffers, sizeof num_buffers,
-				 &fixup) != sizeof num_buffers) {
-			vq_err(vq, "Failed num_buffers write");
-			vhost_discard_vq_desc(vq, headcount);
-			goto out;
-		}
 		nvq->done_idx += headcount;
 		if (nvq->done_idx > VHOST_NET_BATCH)
 			vhost_net_signal_used(nvq);
@@ -1607,10 +1609,13 @@ static int vhost_net_set_features(struct vhost_net *n, u64 features)
 	size_t vhost_hlen, sock_hlen, hdr_len;
 	int i;
 
-	hdr_len = (features & ((1ULL << VIRTIO_NET_F_MRG_RXBUF) |
-			       (1ULL << VIRTIO_F_VERSION_1))) ?
-			sizeof(struct virtio_net_hdr_mrg_rxbuf) :
-			sizeof(struct virtio_net_hdr);
+	if (features & (1ULL << VIRTIO_NET_F_HASH_REPORT))
+		hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
+	else if (features & ((1ULL << VIRTIO_NET_F_MRG_RXBUF) |
+			     (1ULL << VIRTIO_F_VERSION_1)))
+		hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
+	else
+		hdr_len = sizeof(struct virtio_net_hdr);
 	if (features & (1 << VHOST_NET_F_VIRTIO_NET_HDR)) {
 		/* vhost provides vnet_hdr */
 		vhost_hlen = hdr_len;
@@ -1691,6 +1696,10 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		if (features & ~VHOST_NET_FEATURES)
 			return -EOPNOTSUPP;
+		if ((features & ((1ULL << VIRTIO_F_VERSION_1) |
+				 (1ULL << VIRTIO_NET_F_HASH_REPORT))) ==
+		    (1ULL << VIRTIO_NET_F_HASH_REPORT))
+			return -EINVAL;
 		return vhost_net_set_features(n, features);
 	case VHOST_GET_BACKEND_FEATURES:
 		features = VHOST_NET_BACKEND_FEATURES;

-- 
2.48.1


