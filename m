Return-Path: <linux-doc+bounces-35681-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE3A168AC
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 10:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D03373A7BDE
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBAA1B85D6;
	Mon, 20 Jan 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="DWjI4dZu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AB1B85E4
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363673; cv=none; b=godSR7zwNgSkt9PhpcgjhD6zOA8pQMu+yyLHUlMFxpqrX84Ma4qydBBVjsZTX5IrogovuUuoIwQfiUfZk+ViXnVYdDY7pznjy+xSgt0rlFyP4wbdcZTTFFwXMGXTyaKbL3/Ctz8gIQnCYpLhajuNY55m3M9fA0diTvLiXT8Dz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363673; c=relaxed/simple;
	bh=Wy78D9osTgnmZ1Aldc44OjfkVB3juIqeFpS5f9QXkOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=RtC/5nLTZ7vfrU5i2MRlczs1aSmPxZbUNpnL9EDtoaTz2utTBEhLquMg/zOdKrFvmcqD+raEIvT7dYzOTQZ3K7T8oeIKBD9xzg92EIWKGFlG5we1Y+aHlC7QK3FVr/6xmwhY9A8WeELAFSkGqwNe9jOZ2s3Cu/bWj3PiXuKIahE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=DWjI4dZu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166651f752so99350265ad.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 01:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737363670; x=1737968470; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF+KQrcZuP5hO5eQ5cn9Np1CO3hUJpXzV3jjOV/OfxM=;
        b=DWjI4dZu5Bir81YcPUt3PkZPk6hdCDMg7SCr9C74ENp+HYmM9zOBEHCDOBRzyJzLgd
         IR3hB9jwB3D5Dy4QUky+MR79AXUXCcwJokbeiNwCHQ13JtxgowFvYvQesGFFIFvPONen
         h4HQURoV2x4ERqfICFIOPQjlC3XqXyT2HnDyh5gPQGv0a+xJhFsY49U6pqLqLLwyB+3n
         d6WMfXDvjQtNST+0WJQePHZvFi4nQ3QiBfbbVNwz1daeqegWZ5RwMpC+h/NpkcPW76B0
         E2pRwdOgMDThY/CvdkliC4ZTOAAC2VxpLIfqN78exoncRIeJ7z9fgC2dsv3lxIu3S33M
         /+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363671; x=1737968471;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HF+KQrcZuP5hO5eQ5cn9Np1CO3hUJpXzV3jjOV/OfxM=;
        b=c9PyyM3+jmfrcxK3VeCS1c6V1ibIcdwQkyHaUbhN/a23JQG5PQmFDHEL4rVjMtC37R
         V6QI+rEcddZLF9QuK2gL+hLFyCqFyWf8gd1CQXLN9uIofYSUEhTqlRpCHuVHN8dHWEZl
         BOaUJbYIOubDBJrE0fEc8y1hQHdpXCD/hqIiNSUOlqKhI/t3egzj6yoq15+9xKf3rW44
         ciILZGjwPwXaTxylQYRqMnybIMVvEzOITiAj3cnSQ/QDgtqt3m33+VKdrcj74rF8f9RI
         sB6Zuzsm4XKFVajqgN4BimggvsF3hPq43zLdrFdGOR8g3pF8EwEJGkjz7iU9JKyrSdQq
         Rc8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuDhY5bg4apySfNeyC+Kl/HyvZtjSVM3lt75qsxpALX3ICtT9DwpkVnkcfPB5fpxCBZagrAiQ2NlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhplbF2KojQttWsnOMfZoJnVlP/BBuL7zCL9woXqIVFLKuo17
	ZeMd0wbfbO7puvXoKHJyM31mve60vaVatyDPLnVpZFfcLwcQufm98TNlzby/1KE=
X-Gm-Gg: ASbGnctVJj6Jqijj6BITsx3OW/+Fb2O7TQWEnHSqb3VlM9YPCT5CaKt4pKFwa4N4Gw2
	aoUuQQNjZvxsofTgMAafAng6yVXOPYFQeyfQtu2Pvg43nTgg9noRQGYixSzq4htOQg/EJw9ovFw
	+J3lllfsVsGxmu8TjbP62lr9oCvMHsYu/Z2UoKETT5IOye+biw/ktAOwUO5n/yGHbP2Id39nC91
	Nfy/AwpHFJsROCHHSbaKdfZhwqos/IhU/3EkBgAJbA4SMQbzVTBqUyaYWF4oZTeFs+ndQxg
X-Google-Smtp-Source: AGHT+IHClEpu/rTG4Zm/KfL0aactcXixISl+sw4HjjuZY0iYfziL4qKBRDtkCJTBVJ0AW6hgOJpXuQ==
X-Received: by 2002:a17:903:41c5:b0:212:63db:bb15 with SMTP id d9443c01a7336-21c355eec18mr213147485ad.38.1737363670024;
        Mon, 20 Jan 2025 01:01:10 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-a9bdd4f7797sm6408642a12.53.2025.01.20.01.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 01:01:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 20 Jan 2025 18:00:13 +0900
Subject: [PATCH net-next v4 4/9] tun: Decouple vnet from tun_struct
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-tun-v4-4-ee81dda03d7f@daynix.com>
References: <20250120-tun-v4-0-ee81dda03d7f@daynix.com>
In-Reply-To: <20250120-tun-v4-0-ee81dda03d7f@daynix.com>
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
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

Decouple vnet-related functions from tun_struct so that we can reuse
them for tap in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tun.c | 53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index ec56ac86584813f990fabf4633e4d96ca81176ae..add09dfdada5f76da87ae568072d121c2fc21caf 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -298,16 +298,16 @@ static bool tun_napi_frags_enabled(const struct tun_file *tfile)
 	return tfile->napi_frags_enabled;
 }
 
-static inline bool tun_legacy_is_little_endian(struct tun_struct *tun)
+static inline bool tun_legacy_is_little_endian(unsigned int flags)
 {
 	return !(IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
-		 (tun->flags & TUN_VNET_BE)) &&
+		 (flags & TUN_VNET_BE)) &&
 		virtio_legacy_is_little_endian();
 }
 
-static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_get_vnet_be(unsigned int flags, int __user *argp)
 {
-	int be = !!(tun->flags & TUN_VNET_BE);
+	int be = !!(flags & TUN_VNET_BE);
 
 	if (!IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE))
 		return -EINVAL;
@@ -318,7 +318,7 @@ static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
 	return 0;
 }
 
-static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_set_vnet_be(unsigned int *flags, int __user *argp)
 {
 	int be;
 
@@ -329,27 +329,26 @@ static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
 		return -EFAULT;
 
 	if (be)
-		tun->flags |= TUN_VNET_BE;
+		*flags |= TUN_VNET_BE;
 	else
-		tun->flags &= ~TUN_VNET_BE;
+		*flags &= ~TUN_VNET_BE;
 
 	return 0;
 }
 
-static inline bool tun_is_little_endian(struct tun_struct *tun)
+static inline bool tun_is_little_endian(unsigned int flags)
 {
-	return tun->flags & TUN_VNET_LE ||
-		tun_legacy_is_little_endian(tun);
+	return flags & TUN_VNET_LE || tun_legacy_is_little_endian(flags);
 }
 
-static inline u16 tun16_to_cpu(struct tun_struct *tun, __virtio16 val)
+static inline u16 tun16_to_cpu(unsigned int flags, __virtio16 val)
 {
-	return __virtio16_to_cpu(tun_is_little_endian(tun), val);
+	return __virtio16_to_cpu(tun_is_little_endian(flags), val);
 }
 
-static inline __virtio16 cpu_to_tun16(struct tun_struct *tun, u16 val)
+static inline __virtio16 cpu_to_tun16(unsigned int flags, u16 val)
 {
-	return __cpu_to_virtio16(tun_is_little_endian(tun), val);
+	return __cpu_to_virtio16(tun_is_little_endian(flags), val);
 }
 
 static inline u32 tun_hashfn(u32 rxhash)
@@ -1764,6 +1763,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 
 	if (tun->flags & IFF_VNET_HDR) {
 		int vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
+		int flags = tun->flags;
 
 		if (iov_iter_count(from) < vnet_hdr_sz)
 			return -EINVAL;
@@ -1772,12 +1772,12 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 			return -EFAULT;
 
 		if ((gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) &&
-		    tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2 > tun16_to_cpu(tun, gso.hdr_len))
-			gso.hdr_len = cpu_to_tun16(tun, tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2);
+		    tun16_to_cpu(flags, gso.csum_start) + tun16_to_cpu(flags, gso.csum_offset) + 2 > tun16_to_cpu(flags, gso.hdr_len))
+			gso.hdr_len = cpu_to_tun16(flags, tun16_to_cpu(flags, gso.csum_start) + tun16_to_cpu(flags, gso.csum_offset) + 2);
 
-		if (tun16_to_cpu(tun, gso.hdr_len) > iov_iter_count(from))
+		if (tun16_to_cpu(flags, gso.hdr_len) > iov_iter_count(from))
 			return -EINVAL;
-		hdr_len = tun16_to_cpu(tun, gso.hdr_len);
+		hdr_len = tun16_to_cpu(flags, gso.hdr_len);
 		iov_iter_advance(from, vnet_hdr_sz - sizeof(gso));
 	}
 
@@ -1854,7 +1854,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		}
 	}
 
-	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		err = -EINVAL;
 		goto free_skb;
@@ -2108,23 +2108,24 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 
 	if (vnet_hdr_sz) {
 		struct virtio_net_hdr gso;
+		int flags = tun->flags;
 
 		if (iov_iter_count(iter) < vnet_hdr_sz)
 			return -EINVAL;
 
 		if (virtio_net_hdr_from_skb(skb, &gso,
-					    tun_is_little_endian(tun), true,
+					    tun_is_little_endian(flags), true,
 					    vlan_hlen)) {
 			struct skb_shared_info *sinfo = skb_shinfo(skb);
 
 			if (net_ratelimit()) {
 				netdev_err(tun->dev, "unexpected GSO type: 0x%x, gso_size %d, hdr_len %d\n",
-					   sinfo->gso_type, tun16_to_cpu(tun, gso.gso_size),
-					   tun16_to_cpu(tun, gso.hdr_len));
+					   sinfo->gso_type, tun16_to_cpu(flags, gso.gso_size),
+					   tun16_to_cpu(flags, gso.hdr_len));
 				print_hex_dump(KERN_ERR, "tun: ",
 					       DUMP_PREFIX_NONE,
 					       16, 1, skb->head,
-					       min((int)tun16_to_cpu(tun, gso.hdr_len), 64), true);
+					       min((int)tun16_to_cpu(flags, gso.hdr_len), 64), true);
 			}
 			WARN_ON_ONCE(1);
 			return -EINVAL;
@@ -2493,7 +2494,7 @@ static int tun_xdp_one(struct tun_struct *tun,
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
 	skb_put(skb, xdp->data_end - xdp->data);
 
-	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		kfree_skb(skb);
 		ret = -EINVAL;
@@ -3322,11 +3323,11 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 		break;
 
 	case TUNGETVNETBE:
-		ret = tun_get_vnet_be(tun, argp);
+		ret = tun_get_vnet_be(tun->flags, argp);
 		break;
 
 	case TUNSETVNETBE:
-		ret = tun_set_vnet_be(tun, argp);
+		ret = tun_set_vnet_be(&tun->flags, argp);
 		break;
 
 	case TUNATTACHFILTER:

-- 
2.47.1


