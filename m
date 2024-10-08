Return-Path: <linux-doc+bounces-26752-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8B994031
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 09:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A588E289FDC
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 07:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAD71EC01C;
	Tue,  8 Oct 2024 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="bbH3sJnM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F29F1EBFFD
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370536; cv=none; b=laaOTRa9XV9ViQEmA1ZHVK9mH0wfuEcHw+MRnKVoEyINNkHjNpborxdKWJeP7BoelsVOHQhUXUpTrYzIGk3kfc5qqFb+4keymninQtNa0XKaMmP2qt8rR90Nvku90gRCFBhLlyoU6y54/8vWS9FGlzOyRRQDP/3OTe+S43kvQqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370536; c=relaxed/simple;
	bh=xPXdqMNBwYBxjRVy67D/GdzAQuV+QqFH17klGcbYhos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=nXoQDSfNxdwRZLwHiP2ug/d5AXmQEHXrY7zompXEt/3x40+uU73InmeuzgXp4NNA6M8pafDJ6txNEALB+hVldw9Xu0DY/Gbcet3NStEGoRuE78j6tSJkOazFI7R+c/3B0p+wELiignlOk+RYS95v0C+0RG5+X8BMt7FXCsi6OYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=bbH3sJnM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e082bf1c7fso3607405a91.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728370534; x=1728975334; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNVaNoDirrDF/K5gG8N1Rw46L/tBZORPSDyk4tebyaM=;
        b=bbH3sJnM3ecJ5UeG8LgP5mWH2Yixw5L7kf+CJ6h0PTE1XXCg5GfKTpldDu3u2E6lps
         0d+XsuhfV1txtCcPJXK2jTmt2pfwJw82BC2BU7cEDMvsUkja2K+kiYq2gl7MWCQefDom
         TQa/EJv0adWdL+xnyqKfwB8p5s+5TkRsllawZ4csczyvEKPDebWxNRK5C5B/cCs+klwv
         xuJGUi4snW2efsrC+43CzN81eci9eWpCBIG/6jJXrh2miTNCgsgifVayT3MfU2+Yu3C0
         eUpOo0eDo4LcZvDo9280NXy/b7f1/yX7z6uvTKU+NnxoY5a46hgmuU3WUM4ShqVsGmnF
         uXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370534; x=1728975334;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNVaNoDirrDF/K5gG8N1Rw46L/tBZORPSDyk4tebyaM=;
        b=w7fT+dRJVJbYY3puNIDTh3mT+rnuvJFQgJ6Ng+dZwUO1h56sG0s+Xg2ebxOxB/Gs5i
         DY2vnpQIPP/doueAu7wA5A8ZIiEbAsQzWsmwify/1eb8V5XSbUpmtSDYBLG5YibIgzWT
         Y4S9CAc6y30wxC750v8vJP5i1bX+wZL67iCf9G5A6wdqVQYw7gJTdhZ4YVxqrdHJzgJV
         huezs4nMumgu/FNgnkBvEdpZPknIOBO+JXFoFxdqyixO0Tgx1kg7n2Md4xAZ7R4LI+lh
         16duISjP1BiL9aXO0B2T7wd2HF05hKGS0X0P9xs8FwuAUbvHf5gyD5pxketa0+ajWGFv
         UvsA==
X-Forwarded-Encrypted: i=1; AJvYcCVavhwQFl5uY2IQ4Y9rXVqbip/7PHqUS8xrRjrSIJQgY5Rkc01u5hw7+0EqneEOgAJxAiTmh8AegkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW8EIX3h+iRixGSE8pztNh6fpdtOpQy1TZPoSx9obGFASdRq4l
	yb6I+FkCdI7cBPNQn1/ymrmZRrnuJwauvGzDz1cle2apxXsUkCya4+149eKe399RiWlYDSuoqa7
	zajI=
X-Google-Smtp-Source: AGHT+IHkb1uMKsN/5XlbEXxGBI6s7AmtVvSir5FKrdkZc8sYxsL2ddqvfgRpOey0uZac+T06eJdEyg==
X-Received: by 2002:a17:90b:4a92:b0:2cb:4e14:fd5d with SMTP id 98e67ed59e1d1-2e1e627f3camr15847213a91.17.1728370534383;
        Mon, 07 Oct 2024 23:55:34 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e20b0f64cdsm6721041a91.35.2024.10.07.23.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:55:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 08 Oct 2024 15:54:30 +0900
Subject: [PATCH RFC v5 10/10] vhost/net: Support VIRTIO_NET_F_HASH_REPORT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-rss-v5-10-f3cf68df005d@daynix.com>
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
In-Reply-To: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
hash values (i.e., the hash_report member is always set to
VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
underlying socket will be reported.

VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/vhost/net.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index f16279351db5..ec1167a782ec 100644
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
@@ -1604,10 +1605,13 @@ static int vhost_net_set_features(struct vhost_net *n, u64 features)
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
@@ -1688,6 +1692,10 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
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
2.46.2


