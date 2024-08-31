Return-Path: <linux-doc+bounces-24272-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BC96714B
	for <lists+linux-doc@lfdr.de>; Sat, 31 Aug 2024 13:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DB61F225D5
	for <lists+linux-doc@lfdr.de>; Sat, 31 Aug 2024 11:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB3317DE2D;
	Sat, 31 Aug 2024 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="CVUYnasx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC9175D39
	for <linux-doc@vger.kernel.org>; Sat, 31 Aug 2024 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103949; cv=none; b=Js9DEK6jfHFsaF2teXRcD4XDDmo3OKA9vdJh6MXwb3ZDfxtEwbvs7XSS+63OVlK+bfE3Y2HmuHOl+9JW5LDNYNU/ZYf54TBbwExOPHykBQ2JEu9zc6aeWcl4nUHb18bSsa0IQW10yh3iXZff4mv+PCEqw8JBSjzFJIR6gm9avA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103949; c=relaxed/simple;
	bh=MfpzBkUI2SIjf1Ij8cczj9zf7DOV9/vZ1Hj7VLFx2i8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P6sXjVVZNiB5hgwRAvYlpTfaEMp+NqgFSOm0LPoGimipolG6LJ7K/hoPJzx7/tcMW6NxyZG/WETrv6mKPf4e3b+sX9zj/0hUy7dW9VR5DqRF63zAmAh9pr/rVO7iBlDuhk9V3wIx9xBBeRrfM8Z2x472ZAtxBgM+75s03Mq3+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=CVUYnasx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d5f5d8cc01so1908287a91.0
        for <linux-doc@vger.kernel.org>; Sat, 31 Aug 2024 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725103946; x=1725708746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGCk/6hTDajNFc2rj7m9UG3Rk2A6Wg+d9O29FknHW3o=;
        b=CVUYnasxQ8GEH1eVpDRS5kXIbJW/Oy9UWDNuBQHHUPUlRVY0BLiMfR+9/+oS1V+CaF
         1nD6WLRI5vI+tDl222QCrcXhmPGZ+5MPta13tyfFqFfrb2qCKVHLTnoS9GVlut67k6Wz
         +/UHzaK7PyyvtLjOMrxbdvmqcn7NX44atfahA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725103946; x=1725708746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGCk/6hTDajNFc2rj7m9UG3Rk2A6Wg+d9O29FknHW3o=;
        b=tqGWANU/ZLLICaXIrKFjCBuOyC6kFTknYW51GoTmdH1KE45f/2Ye4GOtqBMxG/wA9c
         0z0+Abnrk1XQnbGuCoYeX5TwGD2KGziNGXCQoyY7wD+78o+QHD0/Rj93Dumb6LG3SRVs
         wlKXw1d83Ig2vh6shHWEkw07F2kzkUsAttdPxp0gvJealarwy2EklcmSyT+46Wo/x3So
         5BMuc6lyxgdt0liI4tMVinLEX8SlYJtnCfgpbB7XxC+myWwQdTyL4ECjBcFBhS53bB9N
         viriAVt/M/NUZRjUTAEIiADrppO/OicP1RdonBtRqmdRjT7VGZmNO0L4ViN1qMzISaYE
         RrMA==
X-Forwarded-Encrypted: i=1; AJvYcCV9WRl3eU/fxNF0luZXpci3ILvh8A8BCTi7PbiwkeS9/7eH8qj8d34lfBX1gqWdfZO+i/92Gw94zWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4f0N3wxnt47gc4YEkO1ORnKVGHSRLseNkwVm6jo/n9UTAkvm
	nIWGhJ41H2f9Gq15Fjxoxb4HQhKUiheveSQ6c+Nj8+3FXvkMOsURHMrmaFuvWwc=
X-Google-Smtp-Source: AGHT+IGCh4g056FK7rVO6rKm6NZb2AutNP/iyfBJ35us76roXsVhFBcLl2jn+M8T/9RNvfrH0rJ51Q==
X-Received: by 2002:a17:90b:690:b0:2c9:5a71:1500 with SMTP id 98e67ed59e1d1-2d86a9175c0mr8100961a91.0.1725103946400;
        Sat, 31 Aug 2024 04:32:26 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445d5e91sm8139112a91.7.2024.08.31.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 04:32:25 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca,
	Joe Damato <jdamato@fastly.com>,
	stable@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: napi: Make napi_defer_irqs u32
Date: Sat, 31 Aug 2024 11:32:21 +0000
Message-Id: <20240831113223.9627-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
napi_defer_irqs was added to net_device and napi_defer_irqs_count was
added to napi_struct, both as type int.

This value never goes below zero. Change the type for both from int to
u32, and add an overflow check to sysfs to limit the value to S32_MAX.

Before this patch:

$ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
$ cat /sys/class/net/eth4/napi_defer_hard_irqs
-2147483647

After this patch:

$ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
bash: line 0: echo: write error: Numerical result out of range

Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
Cc: stable@kernel.org
Cc: Eric Dumazet <edumazet@google.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 2 +-
 include/linux/netdevice.h                              | 4 ++--
 net/core/net-sysfs.c                                   | 6 +++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 70c4fb9d4e5c..d68f37f5b1f8 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -98,7 +98,7 @@ unsigned_int                        num_rx_queues
 unsigned_int                        real_num_rx_queues      -                   read_mostly         get_rps_cpu
 struct_bpf_prog*                    xdp_prog                -                   read_mostly         netif_elide_gro()
 unsigned_long                       gro_flush_timeout       -                   read_mostly         napi_complete_done
-int                                 napi_defer_hard_irqs    -                   read_mostly         napi_complete_done
+u32                                 napi_defer_hard_irqs    -                   read_mostly         napi_complete_done
 unsigned_int                        gro_max_size            -                   read_mostly         skb_gro_receive
 unsigned_int                        gro_ipv4_max_size       -                   read_mostly         skb_gro_receive
 rx_handler_func_t*                  rx_handler              read_mostly         -                   __netif_receive_skb_core
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 607009150b5f..39eafd2e2368 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -356,7 +356,7 @@ struct napi_struct {
 
 	unsigned long		state;
 	int			weight;
-	int			defer_hard_irqs_count;
+	u32			defer_hard_irqs_count;
 	unsigned long		gro_bitmask;
 	int			(*poll)(struct napi_struct *, int);
 #ifdef CONFIG_NETPOLL
@@ -2091,7 +2091,7 @@ struct net_device {
 	unsigned int		real_num_rx_queues;
 	struct netdev_rx_queue	*_rx;
 	unsigned long		gro_flush_timeout;
-	int			napi_defer_hard_irqs;
+	u32			napi_defer_hard_irqs;
 	unsigned int		gro_max_size;
 	unsigned int		gro_ipv4_max_size;
 	rx_handler_func_t __rcu	*rx_handler;
diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 444f23e74f8e..b34d731524d5 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -32,6 +32,7 @@
 #ifdef CONFIG_SYSFS
 static const char fmt_hex[] = "%#x\n";
 static const char fmt_dec[] = "%d\n";
+static const char fmt_uint[] = "%u\n";
 static const char fmt_ulong[] = "%lu\n";
 static const char fmt_u64[] = "%llu\n";
 
@@ -425,6 +426,9 @@ NETDEVICE_SHOW_RW(gro_flush_timeout, fmt_ulong);
 
 static int change_napi_defer_hard_irqs(struct net_device *dev, unsigned long val)
 {
+	if (val > S32_MAX)
+		return -ERANGE;
+
 	WRITE_ONCE(dev->napi_defer_hard_irqs, val);
 	return 0;
 }
@@ -438,7 +442,7 @@ static ssize_t napi_defer_hard_irqs_store(struct device *dev,
 
 	return netdev_store(dev, attr, buf, len, change_napi_defer_hard_irqs);
 }
-NETDEVICE_SHOW_RW(napi_defer_hard_irqs, fmt_dec);
+NETDEVICE_SHOW_RW(napi_defer_hard_irqs, fmt_uint);
 
 static ssize_t ifalias_store(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t len)
-- 
2.25.1


