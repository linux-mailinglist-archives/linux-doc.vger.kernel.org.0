Return-Path: <linux-doc+bounces-24477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DBF96C290
	for <lists+linux-doc@lfdr.de>; Wed,  4 Sep 2024 17:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7AD9B21F86
	for <lists+linux-doc@lfdr.de>; Wed,  4 Sep 2024 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800B71DA63A;
	Wed,  4 Sep 2024 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="kDZ1p/+j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBB1DCB09
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464081; cv=none; b=s3BFHzaaXed3XyFEUwa0Geqelhu8cxxL48a6hOIi0muto97quF287ddqi6s3aPTBNcv3IquKl5Y8jRaNkoT9KLt8RXuq3PLoNGJNxoBkSj61HyP0dN7lxhgk0edSY1P7NHuXGX8KH3WmxPqAUQ4qEYkFAR0y1u0mU8O7eYjQGX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464081; c=relaxed/simple;
	bh=ZU9vZwT89o1iKio4bN3J8NlZEc9NScXwgl8b1nfNZec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IQPDwNfb1Wp1IZQd/V6NPE4iJGyMOeCfdVk+ZSW9GMODf9DXQLl8+66y0kaKahhHuhHbM+Rxxqo7fSuJfn2GyMKH4qijULydFUl5M5hdUQYS1Yyq4QApY9+gyap/3Ho5Mp/zC0zn8Rjo2c++JV8CUynLTAliHD+eGzGiuLWaoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=kDZ1p/+j; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71774dcd09aso1415816b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725464079; x=1726068879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH+KdHQTY7QVJ226D5GvmxgS7Q6HRq/bVnsBLH7x4nk=;
        b=kDZ1p/+jndsutOn+DyPpHfX93BJqpUbTc5fvhERCmQZmZqER6UgoNYjOpGUeB1CgRc
         NuoR+UNCBM8TFeLT7Z8V12WtfnZtuYEU2SSgKO//sX93kpdTNymh4vop+Cfsx0XjdIC6
         WyJFQtEg4UtvHPWL3rUZawpA3xIOfd1NDN3aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464079; x=1726068879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH+KdHQTY7QVJ226D5GvmxgS7Q6HRq/bVnsBLH7x4nk=;
        b=bYYTBCwifFdBgVphVmtmcqoljKLqX7h4MkDBKO6gYBKI5rEoUrMCW032JJdaJjDIfj
         CiQ91xoXYVy4VtIwOmTx/LB3Bor34i+Jlk46wTIRb2srrxoNj1szMmB30w/LtQU5FUKJ
         2B4x6D9N99DN69hlJJdRWWsV+3qn1e/O0CHxPd04lHJZ+DWxEf6Ze/MWgepxpUniOVdo
         eDhEU8TDug80OVUYECQ4nsLWf59UcKFbmN1IJmO3ci6dldl0WB8CN32YUd8VRWJU2ctm
         xYA+s/2/kCS9BDJyKIjbOcawDrDdPgc3mDxkexDQrljK7ZdJPHerXXe1zmDu8uBhWxug
         qzAg==
X-Forwarded-Encrypted: i=1; AJvYcCUKckB2QSn18RVJpUvVY2If3CigK71P1UQjzT+Ua3ED9laiTTKOhMZscuojZaafmb+Ir0JFU0tSx8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtTMd5WlhFXk4hqgKcDG09ZCdUVY8exfcB11uiTD9qVHm6bSxl
	YzZ+MtEr2EgMAJID+L6kn2IaIBTGsgB7HTsrmtCr6PflILYopshhDDCLn6SP40U=
X-Google-Smtp-Source: AGHT+IEL2LW4TA+CxU0CaYqbUrt/kpk0xSA3do08Wcc3MJwhwvpPcxzBoLhGzc/ghR+S5yCYdwHzwg==
X-Received: by 2002:a05:6a00:3a1a:b0:702:3e36:b7c4 with SMTP id d2e1a72fcca58-7173fa0aae2mr14542401b3a.5.1725464078961;
        Wed, 04 Sep 2024 08:34:38 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778533261sm1748028b3a.71.2024.09.04.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:34:38 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca,
	Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jamie Bainbridge <jamie.bainbridge@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2] net: napi: Prevent overflow of napi_defer_hard_irqs
Date: Wed,  4 Sep 2024 15:34:30 +0000
Message-Id: <20240904153431.307932-1-jdamato@fastly.com>
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

This value never goes below zero, so there is not reason for it to be a
signed int. Change the type for both from int to u32, and add an
overflow check to sysfs to limit the value to S32_MAX.

The limit of S32_MAX was chosen because the practical limit before this
patch was S32_MAX (anything larger was an overflow) and thus there are
no behavioral changes introduced. If the extra bit is needed in the
future, the limit can be raised.

Before this patch:

$ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
$ cat /sys/class/net/eth4/napi_defer_hard_irqs
-2147483647

After this patch:

$ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
bash: line 0: echo: write error: Numerical result out of range

Similarly, /sys/class/net/XXXXX/tx_queue_len is defined as unsigned:

include/linux/netdevice.h:      unsigned int            tx_queue_len;

And has an overflow check:

dev_change_tx_queue_len(..., unsigned long new_len):

  if (new_len != (unsigned int)new_len)
          return -ERANGE;

Cc: Eric Dumazet <edumazet@google.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 2 +-
 include/linux/netdevice.h                              | 4 ++--
 net/core/net-sysfs.c                                   | 6 +++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index a0e0fab8161a..615baddb398c 100644
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
index fce70990b209..971a24a2d117 100644
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
@@ -2065,7 +2065,7 @@ struct net_device {
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


