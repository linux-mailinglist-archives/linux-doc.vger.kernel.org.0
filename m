Return-Path: <linux-doc+bounces-34509-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F8A06E85
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 08:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1245F167996
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 07:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171A321480E;
	Thu,  9 Jan 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="2gLmysC9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9FF214A65
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736405964; cv=none; b=YOk4d2FHmfXWLSki93jERhFcS6h188uegB0wQKWWq+xB2Va72JBGDa0+fhA88WaWHYfmLPP+gEG1GiBjpd8U3q+2j0K5pkrSHEw7o4SAGHqma/NQ31OgXlRGxHUOfyeJlI2lEv2xs+hJu16YzKdJSKvvRBiphH6QPALcfK35XII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736405964; c=relaxed/simple;
	bh=j9JT4BCL5ue3sxQx0JMGybwFg69W5Wt0V1JljWQGcRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=mw0WfadJQyUWhYV8tDLEpgqYB6iXPCSO5+2NCg9/LRAw5D65MZo1fg2FrfzR92ZCJqYRkXziryBGw7zhTbHNZ74WUmqAgh4sc3o7nNPJSB+yyaTvkc/2RRZh5JbDpfQ9IbPEtaEE8hYaD025cL8ejpljO5FQKiFQtTu7QYEISL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=2gLmysC9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso6953955ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 22:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736405962; x=1737010762; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcMFqPOnaXF/Vbm6gaswrNROks4WBDypVrONtYlYR6g=;
        b=2gLmysC9/Ia9v0W4wp1PVTCW9QB3MDDSB5JTdeHBtXbtC3MsVIWwsMe9np8SJ871Zh
         qb9Y97NflonPdPvU0yVRM1UGodmdvuR/GVfZRr4cEOa9oSxWWnKFWuDuWKfe4TQyLIxf
         GHLSnaVEJM3ci5JPtH7Nuhaj+uskIdPmU1M6JD05AH12Rqx5+77jN/ol3Twe23AvXD2z
         /YY1SBfvzT5vqTKZyvYjGm11fVRp1YPVbnTrP0/XGigynHRgZqBLGWGOFZxXC79h0sX4
         maEPLoYZ5bFchr6brfQ41iM+jlmn4dxkhnEuzCUbQG1300kmNJY6u//FZLQr+vaCMSTH
         xFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736405962; x=1737010762;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcMFqPOnaXF/Vbm6gaswrNROks4WBDypVrONtYlYR6g=;
        b=v1KPWKfIcCtXpJhqmZ9Rs9mQoyaj3nyFicRiVTOvww7lRyghf0QJvCAezXTBV16BnB
         5uRoEmtR7ki/czyfo7wYQme/hXyE5gZ4J6M8N9S2Jbh0NKB1t2YurqO93Lr41pZJ5LF8
         1wZprhWZeu//pOgVCkYyRy95tFPiWWpF2YIFSgrTLXnHyUtOX4yv3tFvFw464wyB8oXq
         R50zGLSKK/YGMSLwq6OO6ec3MPABQ+Br7JPviVvSdseHuDMEe4z1XjM3REuQlclTO0c6
         oZ6aPpNhmBPaEqLAtljHU9VHM6JtGPsTpBBM9t3kcfuI95dE3sxDbU25q7hXK2tHJLK/
         p86A==
X-Forwarded-Encrypted: i=1; AJvYcCWNCHbKDy1P4ZCCoDbB9KlVE46pS0r/CUPscGl/TrtpKDhWSf7xCKU2gfR9RGRrGS13D3x5PMcobI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMlZEvw4ogrBR+7Tb2clPBATowZllCR7Uhv/CMdyX4UEcCV6k
	uTC2giE/YB7jTekLC5DpINVtfPTxH43j0FkSJIU3ZaXAywyT5kp67R+eAU5eG/A=
X-Gm-Gg: ASbGncvb/CMiaCPMx3YKlGnbmXH5LRUt/adGJZVqduggJIjMdWP4uBnx49u6fd2Xn5S
	6Evtvn1UzWI6FinpOhXerjV+YbMjOmltrYaLeOWzJuW07aGMV3Ji2WtvtlQJEo+pcofygHQmMUT
	Z+CSHcJ0LpxgDFOjZ3TzsjHRbNHVTr12lI1hQpwK+UImTV/q8jGX4iphLI5BHL8xgKsAkIB+jWn
	cidrBpyDgWK1KLCCz8mX9r6C7XkX6W4CStVP6EveYfFxuBqitiHzdaylN4=
X-Google-Smtp-Source: AGHT+IEJP35PzzPUa5d42ylaSKRGrOzMFsCH1VQGbqQMF8wzgrB57rbB+fwdI4blxhYKLVyvTAVjLQ==
X-Received: by 2002:a17:902:fc84:b0:216:84f0:e33c with SMTP id d9443c01a7336-21a8d6c7b93mr34039715ad.20.1736405961688;
        Wed, 08 Jan 2025 22:59:21 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca02589sm338316855ad.257.2025.01.08.22.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 22:59:21 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 09 Jan 2025 15:58:45 +0900
Subject: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-tun-v2-3-388d7d5a287a@daynix.com>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
In-Reply-To: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
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
X-Mailer: b4 0.14-dev-fd6e3

The specification says the device MUST set num_buffers to 1 if
VIRTIO_NET_F_MRG_RXBUF has not been negotiated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c      |  2 +-
 drivers/net/tun.c      |  6 ++++--
 drivers/net/tun_vnet.c | 14 +++++++++-----
 drivers/net/tun_vnet.h |  4 ++--
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 60804855510b..fe9554ee5b8b 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -713,7 +713,7 @@ static ssize_t tap_put_user(struct tap_queue *q,
 	int total;
 
 	if (q->flags & IFF_VNET_HDR) {
-		struct virtio_net_hdr vnet_hdr;
+		struct virtio_net_hdr_v1 vnet_hdr;
 
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
 
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dbf0dee92e93..f211d0580887 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1991,7 +1991,9 @@ static ssize_t tun_put_user_xdp(struct tun_struct *tun,
 	size_t total;
 
 	if (tun->flags & IFF_VNET_HDR) {
-		struct virtio_net_hdr gso = { 0 };
+		struct virtio_net_hdr_v1 gso = {
+			.num_buffers = __virtio16_to_cpu(true, 1)
+		};
 
 		vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
 		ret = tun_vnet_hdr_put(vnet_hdr_sz, iter, &gso);
@@ -2044,7 +2046,7 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 	}
 
 	if (vnet_hdr_sz) {
-		struct virtio_net_hdr gso;
+		struct virtio_net_hdr_v1 gso;
 
 		ret = tun_vnet_hdr_from_skb(tun->flags, tun->dev, skb, &gso);
 		if (ret < 0)
diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
index ffb2186facd3..a7a7989fae56 100644
--- a/drivers/net/tun_vnet.c
+++ b/drivers/net/tun_vnet.c
@@ -130,15 +130,17 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
 EXPORT_SYMBOL_GPL(tun_vnet_hdr_get);
 
 int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
-		     const struct virtio_net_hdr *hdr)
+		     const struct virtio_net_hdr_v1 *hdr)
 {
+	int content_sz = MIN(sizeof(*hdr), sz);
+
 	if (iov_iter_count(iter) < sz)
 		return -EINVAL;
 
-	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
+	if (copy_to_iter(hdr, content_sz, iter) != content_sz)
 		return -EFAULT;
 
-	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
+	if (iov_iter_zero(sz - content_sz, iter) != sz - content_sz)
 		return -EFAULT;
 
 	return 0;
@@ -154,11 +156,11 @@ EXPORT_SYMBOL_GPL(tun_vnet_hdr_to_skb);
 
 int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
 			  const struct sk_buff *skb,
-			  struct virtio_net_hdr *hdr)
+			  struct virtio_net_hdr_v1 *hdr)
 {
 	int vlan_hlen = skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
 
-	if (virtio_net_hdr_from_skb(skb, hdr,
+	if (virtio_net_hdr_from_skb(skb, (struct virtio_net_hdr *)hdr,
 				    tun_vnet_is_little_endian(flags), true,
 				    vlan_hlen)) {
 		struct skb_shared_info *sinfo = skb_shinfo(skb);
@@ -176,6 +178,8 @@ int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
 		return -EINVAL;
 	}
 
+	hdr->num_buffers = 1;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tun_vnet_hdr_from_skb);
diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index 2dfdbe92bb24..d8fd94094227 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -12,13 +12,13 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
 		     struct virtio_net_hdr *hdr);
 
 int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
-		     const struct virtio_net_hdr *hdr);
+		     const struct virtio_net_hdr_v1 *hdr);
 
 int tun_vnet_hdr_to_skb(unsigned int flags, struct sk_buff *skb,
 			const struct virtio_net_hdr *hdr);
 
 int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
 			  const struct sk_buff *skb,
-			  struct virtio_net_hdr *hdr);
+			  struct virtio_net_hdr_v1 *hdr);
 
 #endif /* TUN_VNET_H */

-- 
2.47.1


