Return-Path: <linux-doc+bounces-37327-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D272A2BB13
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 07:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA22166D3D
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 06:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3424B23499D;
	Fri,  7 Feb 2025 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="nDoZfe5f"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E951B393C
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 06:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908680; cv=none; b=OdLpPHv/32q5ytUZyoIIIf7FShCepXgyiKzCXFhoXOX7Q9ZKKKzFUtrIM1j0ZxSJLIQXNew+QHXFlUqJYBu8ufwMgckdVwWxxV1RknpP/FuEfwr5fyXQqIgOhfOTMkyjTdlZ+2AdPsK1xtfNRMUSiRiz3ZGEGykbH3+f5wZV0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908680; c=relaxed/simple;
	bh=jE35WmComX5JeKqlu8MY6L9RXnyoavgFojt+bgtRKqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JETBFxO4chfU+7KcyNtWpLOzGM2iXXKRLQTBKE6yw9ZcrkxY1U9PqZeUsc1XtJGgZDUnBWiDFPmM8BWw0rjd/abPj3Hc3RCh/OF2z9TJzt43jR2ARcA+vEo8+Jp6MP8pmrUiJnnQQwqe8tWYEquV43jvhb26TBENihWeMFit9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=nDoZfe5f; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa1fb3c445so1218785a91.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 22:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908676; x=1739513476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgBnzmCjscGqJo3YceNPZPrt+CM1bxg86tC2DNlkHjM=;
        b=nDoZfe5fNttKlPGp0pg8AHWIMQSrS//PVPZnkOL/zPNLcFJ9KS5JryBvAz9UAZ7ibO
         N4mpwvHHrkT24be8/dvDszXvXKsaD2ByR20q1elqKDW4JlBW27aTH5JbyGQQr7Frw+Hv
         lCYYuRbg9tl0SvxvCA4p9SxJ5XE9CTUxhc1qcfGYo354mBp1VH8y3zw8KWgQ/1q9/n6Q
         8tI7gFxXMtMBfQcEECxTTMX7xRHR8Zsc+w4ZbIaFGfmJ/sJ6egExGF8ig/OANUY6kZSr
         CUG/iZ3pqrF0ktdKftfZhc+AqkQIp2RLeTpGfrP7FrkKFjJ3Rssuv65jmyKgUzT3I2h5
         v69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908676; x=1739513476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgBnzmCjscGqJo3YceNPZPrt+CM1bxg86tC2DNlkHjM=;
        b=Ij9ZNHXUvsIHr3lEPtuF3RKpeM/2iskxrdmBMHd5dtIt1qneoUBpP9mWYcIP/3QY7z
         KPwKKyPsV/FREDhh0nF/iseTgfA+26tSNHUfBIlp/wC1LuzYOfykNYR178xtVKmItPYF
         znXEMZJbNDy4g/jk/mAqpAfckRCvCB8bwxlUFvVOuEkabhyrD2nzMQgBmJhw2DjUwOnF
         L8w7lypfSTHucSMEtlPC8OWMUiL1D3V6cOh3yU8ete6MdQ2WhMLcthzP3fqgj+v6YGhg
         IRGnBIUADCZThytSE6tckYwIuvrNmNel0O7fM/FDaHFju1BjCtY8ZK3+kODM7aq8Sfi/
         eQng==
X-Forwarded-Encrypted: i=1; AJvYcCWP3glT3X1q8uI2TzVWdqQ3W1nnTFdp2f4fC8e2k77mEjgnHxfaYliSGLeGbD4III0m4h2HWqU9UQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAfn875bUUvW65kTN4mDYfjW0mWuMXnem0pRmWV3tVuEWTj4S
	8n79/lCwoU5zMitd2seNMhFZ75D6Y7ax0K3Hxp/5qx11hhKjGmYe1Lzfmsbs1B0=
X-Gm-Gg: ASbGncvZNf5Y7YxkLMS5jU4YXbZe47A8/KljpJjmQF26ivBu94vTpQ6ukostLoNEjmG
	nzUDtdxWFMSFdJxNjUv/d6fJvHB0qJvEJHY3lRIBT3yj5hkeq9scmo77yX6p5k6rmuaHFB5NHk2
	Duw8IJynP09pp5y153rCzYwPuYdjVlcptLgeiJjGtNCrIbNV+s59/KyVt7i93hr4ymOqrUf8R/1
	yghzTMK2sJwgnHs593npugGjm7304Y29sx3tZZAIulUcJLEByj3ZhZNmPxb2sKWR2GZmOZPphbw
	WV6QS46qe8qPTbY9Lcw=
X-Google-Smtp-Source: AGHT+IHNm8Qe5PeRd2q8oSkdrncjlnlT7yuIXN9pgtXzJ5BMLmj/G1sZ2QlSRnuDA+GVs8YfE9jCcA==
X-Received: by 2002:a05:6a00:244e:b0:727:3c8f:3707 with SMTP id d2e1a72fcca58-7305d53a584mr3469430b3a.23.1738908676268;
        Thu, 06 Feb 2025 22:11:16 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048ad2623sm2302419b3a.60.2025.02.06.22.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Feb 2025 15:10:52 +0900
Subject: [PATCH net-next v6 2/7] tun: Keep hdr_len in tun_get_user()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-tun-v6-2-fb49cf8b103e@daynix.com>
References: <20250207-tun-v6-0-fb49cf8b103e@daynix.com>
In-Reply-To: <20250207-tun-v6-0-fb49cf8b103e@daynix.com>
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
Cc: Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.14.2

hdr_len is repeatedly used so keep it in a local variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/tun.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 4b189cbd28e63ec6325073d9a7678f4210bff3e1..c204c1c0d75bc7d336ec315099a5a60d5d70ea82 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1747,6 +1747,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	struct virtio_net_hdr gso = { 0 };
 	int good_linear;
 	int copylen;
+	int hdr_len = 0;
 	bool zerocopy = false;
 	int err;
 	u32 rxhash = 0;
@@ -1773,19 +1774,21 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		if (!copy_from_iter_full(&gso, sizeof(gso), from))
 			return -EFAULT;
 
-		if ((gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) &&
-		    tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2 > tun16_to_cpu(tun, gso.hdr_len))
-			gso.hdr_len = cpu_to_tun16(tun, tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2);
+		hdr_len = tun16_to_cpu(tun, gso.hdr_len);
 
-		if (tun16_to_cpu(tun, gso.hdr_len) > len)
+		if (gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+			hdr_len = max(tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2, hdr_len);
+			gso.hdr_len = cpu_to_tun16(tun, hdr_len);
+		}
+
+		if (hdr_len > len)
 			return -EINVAL;
 		iov_iter_advance(from, vnet_hdr_sz - sizeof(gso));
 	}
 
 	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP) {
 		align += NET_IP_ALIGN;
-		if (unlikely(len < ETH_HLEN ||
-			     (gso.hdr_len && tun16_to_cpu(tun, gso.hdr_len) < ETH_HLEN)))
+		if (unlikely(len < ETH_HLEN || (hdr_len && hdr_len < ETH_HLEN)))
 			return -EINVAL;
 	}
 
@@ -1798,9 +1801,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * enough room for skb expand head in case it is used.
 		 * The rest of the buffer is mapped from userspace.
 		 */
-		copylen = gso.hdr_len ? tun16_to_cpu(tun, gso.hdr_len) : GOODCOPY_LEN;
-		if (copylen > good_linear)
-			copylen = good_linear;
+		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
@@ -1821,10 +1822,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	} else {
 		if (!zerocopy) {
 			copylen = len;
-			if (tun16_to_cpu(tun, gso.hdr_len) > good_linear)
-				linear = good_linear;
-			else
-				linear = tun16_to_cpu(tun, gso.hdr_len);
+			linear = min(hdr_len, good_linear);
 		}
 
 		if (frags) {

-- 
2.48.1


