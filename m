Return-Path: <linux-doc+bounces-40192-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE59A5662F
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 12:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07363AF6F8
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 11:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B686F215F46;
	Fri,  7 Mar 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="BV8lPg2W"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C01A215774
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345330; cv=none; b=aFl7J6hKa6okFnFAdlcaBwRJbnvt1ZE9ZM2TCpCl2AAOdr765SWuFTXqa3NtCo/WUbJ4IgioiEh1m6kVjiyrKNVDDG+VTZ0wIkB6ZrSRxBy+l9YVABgA0H9fD6iiyjc8ijLSSZVzdqJkd+wijrP/y5/noNDFcOHogJ4hqNKpAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345330; c=relaxed/simple;
	bh=bUqgi3dszTeuIO6Jayt7FNCSfLxGF0Q3vs9yEXuCbLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=gsre34SeXIcTOHXvcVqnoOwv80o/Y70LTey5+VdYxglKa1zTR1GiF74jz4bYH9U3Z/4sUMFKcDXeRCXCe0jkA76cc+P++Ejp81LmnIBDltDbisPdXFSe7ZmU+an2J1E62LN/kmAkmXIy9IzWy1SsjoT2jns7CqRcIJpwxHe6vAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=BV8lPg2W; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so33441585ad.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741345328; x=1741950128; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y12vdXD8IUD5lnVxvCmdhC+FVPs9nLD3u7Whh+JFE1I=;
        b=BV8lPg2W+w8JYUuHvukENfQu1yEcqAfhTffhdX84e9KY40mWidZAHKVgite9chElwl
         565JSX43tcP+myeQSpriEqik41rF+49s27l9Bs9I63gnt7xAr75bkYd2ofHi01ApKBnR
         tYo5xZjmPnyCU0X/r3W0Mtn1vQ26v875DGlGOVgq5k/OB4pDwIDGqR6pe2qKg0pfeb7r
         guT/kuRyEa1z76tXhAK9rdHJSiy+fIczLF+0HkKnkh3PUgA5ZAmKrjYoRGm++P5Box3w
         4QJ80cMva+6bc1BrKw3ELlcY5UmOKKA4H4hJFtyAEZxISJX6UarGhJw6f69rvQ6vVeVK
         meMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345328; x=1741950128;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y12vdXD8IUD5lnVxvCmdhC+FVPs9nLD3u7Whh+JFE1I=;
        b=qK2Dr2MwJCk2YIoHAFLUqZ1XCj1yizIdNflFXyyxs8cHzwvNwERYAqnDvnXhY5WyJa
         FhAKskJs5Ul+rnK9ZwTofupdhpQGe3Hy3KbHjpFk2Es81VCvkw2sh2y1oMKpACJQpx1E
         pg0teKfvUSqFulgzrajsrcFLjGRgsezm82Wy7jiaX747SAKpUPByNKvyYvUSMp4+8Eq8
         /xMq+o9Ci0Jqzf5NQyNZBtle+fE7oQ28T8dJJjwtunzwFfttAAQuw0oehpAhugJ8fihI
         /eQGzChxoM9SEv/tWtgmFmfwwW/8Qz0OuOI++JZen2x8h4VTNrfcgpVGrup7PFvqgi1R
         3/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7fLBexusXlVEqLSQfs2ip1vMji3YsOUIn12nsZ8RiKTXqPc3bzKJEAWPb43ce2ax5wIgCjohJ1is=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGqo4wg5Dq1gxJy0OjRVYrLEuF5BAg+aVwGqTVPCrh0wzAe5Y
	upUiWm4xLeBcewXUUz2Xtx42hx3AIEaZfXyXQ0pNxzsyf5Om0xTjZ3IyD2PI6MY=
X-Gm-Gg: ASbGncuptghlwuusejJxzuIdcAa9pUSeX6AlO2CDlykDGPXtjeNevyvXap48L4+Nh6E
	ZlkSZnWbWMqM3FK768z1VDM3qlEdY0FfDhnBl19pMnSmK4QZNx2+sRiO0Q7xBV6+K55Tr87Vy3o
	/nraRqVg3nbk+r4H/OFIyJXd5fPx1+r2rmBUD534+iDskzomOoj46JE9IV6WCDNPc1vpYmqPSon
	JfRkVp1akX9hyQP6ZTE71MKcD4pEl5khcIiNH4j+7ebp+N1zPE+fiewfPpTUgoNY7YLVmcmms8v
	SHW6tzai/3dDKAIRSJyCG+Hr4RrLS3hBTLm3bk3dLv3KQYeU
X-Google-Smtp-Source: AGHT+IF6zWuYi6fdLJEcdg62jGV3EWL/4omMjcZtlNvZShjxdxWSb6A2HX3eGBs7ZpbGb0lfsNdgeA==
X-Received: by 2002:a17:903:283:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-224288974admr56342095ad.12.1741345328248;
        Fri, 07 Mar 2025 03:02:08 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-224109ddfd2sm27280985ad.39.2025.03.07.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:02:07 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 20:01:22 +0900
Subject: [PATCH net-next v9 6/6] vhost/net: Support
 VIRTIO_NET_F_HASH_REPORT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-rss-v9-6-df76624025eb@daynix.com>
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

VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
hash values (i.e., the hash_report member is always set to
VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
underlying socket will be reported.

VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
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


