Return-Path: <linux-doc+bounces-37929-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B040FA33840
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 07:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352533A7031
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 06:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA7C207DF1;
	Thu, 13 Feb 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="K6QsZx6s"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90085207A11
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739429658; cv=none; b=H5PvxbAWqiwpa2qJCg20WNcQ6DmV2Hbsg2G9BBl90ZPZTBO+O0jOjJsapDlyh7YmhBPTBY+GNO8toQXJfwla/UgL72Au3TRTvTfMPpXrXqxMb7+t0IJeksys6KDYLOEK+d4yCAunpPp5fpMqc0wgHmngXyKejwTo6JLmP3nmYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739429658; c=relaxed/simple;
	bh=/yzdYtH4YY0bjMwJcW3eRmS8j75+nWXBCn9ujfFhxSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PSAxEQdcFdC5A3VOgww6n5/aphxdkEAyw+84Mi+U3SJaDYw3V80B1dydZf2RC2OeRdfBLQjIre0nE3dPxJ/OJSObAfgEkOSWQLH+ys0nCv5tqdfgiaeGKwomOOeVTM33AFbyEnwXgf2gALmH2W3QMjasOd5KhA9liYIz6mI/9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=K6QsZx6s; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c92c857aso8516875ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 22:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1739429655; x=1740034455; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVRbFgdW3C2VjPS6glvqhPThuCYMsgRY+pw4xzl9/Z0=;
        b=K6QsZx6soGddqHHAQ8vVPNDEHzYML3wLdMO08D8d6RJyCZTohRlL2UxBsBN1HSOFd3
         nbxXMFpbZj6uHLYHa4UZllFiEXk3X/UbqQRi7X7QfbJTdUMdUudwzQhm8RrhgXd7bcTe
         TrflT0JP9HO/kJVCSa57mPtb//9Aj2X2vfUNU5FeDwwnIdZiWTpxmaT1yx+E4+RbPTMl
         3WqD+gCLA6YYPn1yfUP3FbhLMSnzZoqenRk9XGKJKhNBU9Z3aWFCVKuRi9FBr3Eyje9p
         dKm1JYp6OVzil9CCa3PLkjQhiAplUymD4COTLiBfjKNk6jTdE8bWO7pxBytuSd2ipozz
         WUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739429655; x=1740034455;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVRbFgdW3C2VjPS6glvqhPThuCYMsgRY+pw4xzl9/Z0=;
        b=FXkyagHtsudSyvp2XTi32q90VW/WfNaLUE/tAaz+hDpRzJ4uzqMyvfepQhO1bGXVOX
         Qia+8Eedo3m65whOq9yMURGmml+UTpRaWSUP+F/9QGeQ7Jil58u9ay6v/jmnNO5RqRdr
         mMskFhy0y4Mo4EDmaqQ0ru39Lk7VaaBXzmqEAYRxdyfkb82wDfO75fXrLGhgSG33LJz4
         hoqjLAXzTgliOfPS9X2ck3lcbP6E7jRP5T3B1SsF2LEbCpmlYqrb7pyU1cuLP3coEbmm
         MVBUmvL3VKMRxGmefDrz7CHXUCnrrS9Sx11B+eEMbzu3eaotOABX1V3fkSjbR/0a7maC
         b1ig==
X-Forwarded-Encrypted: i=1; AJvYcCWK6C4SyClr7z9qCcokkhvSjyuFakDSViWR53FLXUgiQfXBLNvSActx9TliWJWCHfxZ/qjIiEXtCyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Qqx1jmr9YFwYEuLKBVsIgWndHEgq3g3Czg8gvnsq2oINm2bI
	9NOnlHSTv2j2AbZv6mELmhuMz2FUab+WdeFeSAezjA/is8d1ZOe8yy2d6fFkfHc=
X-Gm-Gg: ASbGncsME0MA0qzwjOj78ua8TKak7rfTkFiu3+MiSY0dKw9lovNjExPEN9jlfMh6YHD
	qnM+K/VLkL+OtDvp781WOGLGh5FGpujudhoTq9XUqP7CnDYycvCCy5VrEj2cks9bW7sxFm3X9W1
	Hw6GtlVgOhMVHcfEWTd/7Uo21bdz/DrDfxk7EKqPNTEFkVlhcu8ptw7rC5onUIUoNNoIFsag9Hm
	3ovjALgZO08Lccx4iBNeC0GRycA5xfJLfDKkHJEhaVtwCT9AS+nNLIjR9bRevqEsIFW+fPyULUS
	MPrOCNpjfd4GM+WUdkE=
X-Google-Smtp-Source: AGHT+IHM0So4p/83DwxmEtYjGdBS7+MraFx0suhYHvvs65nwUSgOl1qYUwzLV/IIAGbVQphJY2u2vg==
X-Received: by 2002:a05:6a20:7351:b0:1ee:5cf2:9c01 with SMTP id adf61e73a8af0-1ee6c61abe9mr2996634637.5.1739429654761;
        Wed, 12 Feb 2025 22:54:14 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-adb57d542f1sm516772a12.2.2025.02.12.22.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 22:54:14 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Feb 2025 15:54:06 +0900
Subject: [PATCH net-next] tun: Pad virtio headers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-buffers-v1-1-ec4a0821957a@daynix.com>
X-B4-Tracking: v=1; b=H4sIAA2XrWcC/z3MywrCMBCF4VcJszYwSWOkeRXpookTzSZqLqVQ+
 u4dVFwe/sO3QaWSqIITGxRaUk3PzEOdBITHnO8k0403aNRnVMpK32OkUuVoSRkfUQ8xAL9fhWJ
 aP9IVMjWZaW0wfUuhd2e6/fJfdoJdo/SAsvUsLZs4m9FjuLjFwrTvB//iwYOhAAAA
X-Change-ID: 20250116-buffers-96e14bf023fc
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
 devel@daynix.com
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

tun used to simply advance iov_iter when it needs to pad virtio header,
which leaves the garbage in the buffer as is. This is especially
problematic when tun starts to allow enabling the hash reporting
feature; even if the feature is enabled, the packet may lack a hash
value and may contain a hole in the virtio header because the packet
arrived before the feature gets enabled or does not contain the
header fields to be hashed. If the hole is not filled with zero, it is
impossible to tell if the packet lacks a hash value.

In theory, a user of tun can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tun.

The specification also says the device MUST set num_buffers to 1 when
the field is present so set it when the specified header size is big
enough to contain the field.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c      |  2 +-
 drivers/net/tun.c      |  6 ++++--
 drivers/net/tun_vnet.h | 14 +++++++++-----
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 1287e241f4454fb8ec4975bbaded5fbaa88e3cc8..d96009153c316f669e626d95002e5fe8add3a1b2 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -711,7 +711,7 @@ static ssize_t tap_put_user(struct tap_queue *q,
 	int total;
 
 	if (q->flags & IFF_VNET_HDR) {
-		struct virtio_net_hdr vnet_hdr;
+		struct virtio_net_hdr_v1 vnet_hdr;
 
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
 
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index b14231a743915c2851eaae49d757b763ec4a8841..a3aed7e42c63d8b8f523c0141c7d970ab185178c 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1987,7 +1987,9 @@ static ssize_t tun_put_user_xdp(struct tun_struct *tun,
 	ssize_t ret;
 
 	if (tun->flags & IFF_VNET_HDR) {
-		struct virtio_net_hdr gso = { 0 };
+		struct virtio_net_hdr_v1 gso = {
+			.num_buffers = cpu_to_tun_vnet16(tun->flags, 1)
+		};
 
 		vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
 		ret = tun_vnet_hdr_put(vnet_hdr_sz, iter, &gso);
@@ -2040,7 +2042,7 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 	}
 
 	if (vnet_hdr_sz) {
-		struct virtio_net_hdr gso;
+		struct virtio_net_hdr_v1 gso;
 
 		ret = tun_vnet_hdr_from_skb(tun->flags, tun->dev, skb, &gso);
 		if (ret)
diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index fd7411c4447ffb180e032fe3e22f6709c30da8e9..b4f406f522728f92266898969831c26a87930f6a 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -135,15 +135,17 @@ static inline int tun_vnet_hdr_get(int sz, unsigned int flags,
 }
 
 static inline int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
-				   const struct virtio_net_hdr *hdr)
+				   const struct virtio_net_hdr_v1 *hdr)
 {
+	int content_sz = MIN(sizeof(*hdr), sz);
+
 	if (unlikely(iov_iter_count(iter) < sz))
 		return -EINVAL;
 
-	if (unlikely(copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr)))
+	if (unlikely(copy_to_iter(hdr, content_sz, iter) != content_sz))
 		return -EFAULT;
 
-	iov_iter_advance(iter, sz - sizeof(*hdr));
+	iov_iter_zero(sz - content_sz, iter);
 
 	return 0;
 }
@@ -157,11 +159,11 @@ static inline int tun_vnet_hdr_to_skb(unsigned int flags, struct sk_buff *skb,
 static inline int tun_vnet_hdr_from_skb(unsigned int flags,
 					const struct net_device *dev,
 					const struct sk_buff *skb,
-					struct virtio_net_hdr *hdr)
+					struct virtio_net_hdr_v1 *hdr)
 {
 	int vlan_hlen = skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
 
-	if (virtio_net_hdr_from_skb(skb, hdr,
+	if (virtio_net_hdr_from_skb(skb, (struct virtio_net_hdr *)hdr,
 				    tun_vnet_is_little_endian(flags), true,
 				    vlan_hlen)) {
 		struct skb_shared_info *sinfo = skb_shinfo(skb);
@@ -179,6 +181,8 @@ static inline int tun_vnet_hdr_from_skb(unsigned int flags,
 		return -EINVAL;
 	}
 
+	hdr->num_buffers = cpu_to_tun_vnet16(flags, 1);
+
 	return 0;
 }
 

---
base-commit: f54eab84fc17ef79b701e29364b7d08ca3a1d2f6
change-id: 20250116-buffers-96e14bf023fc
prerequisite-change-id: 20241230-tun-66e10a49b0c7:v6
prerequisite-patch-id: 871dc5f146fb6b0e3ec8612971a8e8190472c0fb
prerequisite-patch-id: 2797ed249d32590321f088373d4055ff3f430a0e
prerequisite-patch-id: ea3370c72d4904e2f0536ec76ba5d26784c0cede
prerequisite-patch-id: 837e4cf5d6b451424f9b1639455e83a260c4440d
prerequisite-patch-id: ea701076f57819e844f5a35efe5cbc5712d3080d
prerequisite-patch-id: 701646fb43ad04cc64dd2bf13c150ccbe6f828ce
prerequisite-patch-id: 53176dae0c003f5b6c114d43f936cf7140d31bb5

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


