Return-Path: <linux-doc+bounces-35684-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4FA168C1
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 10:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8253A584A
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2025 09:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C0F1AE003;
	Mon, 20 Jan 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="FGFBhXFR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A563819D8B2
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363698; cv=none; b=awb/YIa56F41KewTeo7oDPTXLOUDeWzECz2i2XVcKzF8fqdmrhiwMna0p/SpGFNpWkHKNwwS5X+Ecf3bHsBUudQtEb3V9+0TRzEXJ33z0+l8UCnIO9l0dM/X4e6r+eZx4rLWuBkTjOv9NIuP/kr0qcR/tloSpj6wU1XapKrvBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363698; c=relaxed/simple;
	bh=tzwzEP03g8s7l3aneAZ0Ydoz3zLfOnTznPFsRRqr3Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=FE74jsk2tebWULLcLd2zstxNuCuepBetfRjS3AQldElztA+KxCoRIJoVrz35SkQ1QRMv+K05rkC0XNCrHPSmhlGr2M8imJk8lVS3KNRXHmAWzNOuG8GwNCHS2lABvGROSw6nxI5Ffd/pLuNbIAU+73xluL5Jel+OTIgFl+EMOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=FGFBhXFR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21675fd60feso90719815ad.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 01:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737363696; x=1737968496; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB97Bbr4B1xEv81orQhW1O95FjEA2Fdmfcgrx6OvObY=;
        b=FGFBhXFRD8twr3rnmLYJLg6sWURHzyDyWb1+IENvA+E6AkEiQtjUAHDL4PNMzuWVC0
         s6imSML9+IVAW/EtwMDImJlLhlAJviOCnO68cI92WYBqLASQU1CKvzqxNDLEyQf401S+
         Cx8vA+1k0HuLi9SNg+HdNeQIiiWOs9+zq1xUetaJMhnqVvsBbNAAggzWTIVS6XAvmyzp
         fV2FegcytoKvUIaexoKBc5I4bG1/89lRdI6rGYIlaK7+ZYNE7HN2Un8Ppr90CXVLk2z1
         bSnzTTmWbtk0UPz50RcsOIwIQEXkHK//ykBY1EZTz5REZ2s9xEd69UggJcQbIGfNfpXz
         OK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363696; x=1737968496;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB97Bbr4B1xEv81orQhW1O95FjEA2Fdmfcgrx6OvObY=;
        b=aHWb1PUl89fQCL28MVFSMoMBkb92Iq1900HRPfE7IzSRNOnx4FXdJNDa5iK6U6sQ8H
         4h73wbBw+nJGoUsNv9G4olNpJP+jWao0Vve67TtbFL4u+8iPWuw1zhBDK8szss0R5ees
         2Zt6ld3a/dw+N8mzehTNM2famDPU5QoS9jtLsQxiz+fKe8WypZHFmKrfBqnJ5j/B2oR5
         fNUJD+jRqjqglxN813FYEvwgI/uQlnympYBScZYqw3oCz6vBVhs/ubkyt9Q3qFhmyni7
         1MYoVuC7afVZw5e3CH0AE7P3A2xdTHa2rUOLZKyJWAggaAdMvDADL0rNR7VDTkBVCGWW
         ZdQg==
X-Forwarded-Encrypted: i=1; AJvYcCXnS6t+JyhxLkHFA7KGRTIiXBSSspnlFPR9RNGLHsxM2awbRwsHqtuSc+MvsOFeaMmwOovSXPkEFPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0qMSV8ET14jqgUjRLyl83OYPrZEhVhIEJLRdRbgAcYDqhJKQ
	Hu27AU/NpHpGI7HSvjnwsIGjBH8erV4ygYtx67G7MR8nbblDM86YN12OXStjb44=
X-Gm-Gg: ASbGncti2vGtbIEfrOhCuHXbqGBnooZ+njx+cWiEjsc+MXJvjcB2UllzHOX3olO9YBR
	1lHxOpioTJuAGniGG17Kgv+abIJuLYM+gtAjddHYF+hjlPAkZXUzG85F2vlM/DDkoUsxgdgSeKl
	YzgfiEsZq/uMOVE//UGwH11imRKHWxBHl30fintIUfH05hDWgi6WSXCWjPsnLJBauJGWuuESYOf
	3e+33wM+KBHHQte9MjtOoJnBrJRqHpv6/veRCrfMVzJmsKmn4TB2Esj9lyGabowqUyr3i9j
X-Google-Smtp-Source: AGHT+IG+qd2PcvmwKJh5HwzId2IyxwMl0s+fSQcG6B72BSMW0ku0ylKyrlMqZ+pwpjyyUJ0B3fOsrQ==
X-Received: by 2002:a05:6a21:8192:b0:1eb:3414:5d18 with SMTP id adf61e73a8af0-1eb34146070mr8643406637.22.1737363694522;
        Mon, 20 Jan 2025 01:01:34 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aab358fc6d8sm3149440a12.51.2025.01.20.01.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 01:01:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 20 Jan 2025 18:00:16 +0900
Subject: [PATCH net-next v4 7/9] tap: Avoid double-tracking iov_iter length
 changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-tun-v4-7-ee81dda03d7f@daynix.com>
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

tap_get_user() used to track the length of iov_iter with another
variable. We can use iov_iter_count() to determine the current length
to avoid such chores.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 5aa41d5f7765a6dcf185bccd3cba2299bad89398..061c2f27dfc83f5e6d0bea4da0e845cc429b1fd8 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -641,7 +641,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	struct sk_buff *skb;
 	struct tap_dev *tap;
 	unsigned long total_len = iov_iter_count(from);
-	unsigned long len = total_len;
+	unsigned long len;
 	int err;
 	struct virtio_net_hdr vnet_hdr = { 0 };
 	int vnet_hdr_len = 0;
@@ -655,9 +655,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
 
 		err = -EINVAL;
-		if (len < vnet_hdr_len)
+		if (iov_iter_count(from) < vnet_hdr_len)
 			goto err;
-		len -= vnet_hdr_len;
 
 		err = -EFAULT;
 		if (!copy_from_iter_full(&vnet_hdr, sizeof(vnet_hdr), from))
@@ -671,10 +670,12 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 				 tap16_to_cpu(q, vnet_hdr.csum_start) +
 				 tap16_to_cpu(q, vnet_hdr.csum_offset) + 2);
 		err = -EINVAL;
-		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > len)
+		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > iov_iter_count(from))
 			goto err;
 	}
 
+	len = iov_iter_count(from);
+
 	err = -EINVAL;
 	if (unlikely(len < ETH_HLEN))
 		goto err;

-- 
2.47.1


