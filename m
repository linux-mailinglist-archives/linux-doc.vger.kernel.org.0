Return-Path: <linux-doc+bounces-26866-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F94995C81
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 02:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5A871F258D1
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 00:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161A715E8B;
	Wed,  9 Oct 2024 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="l0A7LuWB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD962837B
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 00:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728435346; cv=none; b=JF1JJHLG+ciN3ffSlyShkRbQnwy0SDxW3QxItYlFCeWMk+EbyVNyUjTuAOCmFqTsbd2Iqb22giB4mOMzCQ7NEI7czBBQGF5ukKduii+B4h2w/bXtptubtXD6vdbBy0GUEHKIfSTlGgabatmzRxTPdz4HcVogJDDM7cQD7wql7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728435346; c=relaxed/simple;
	bh=OSjhYgCraL1pjtRCrrLJx+dP50hJvvrgzBqU+eXq8xE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=erP5h7m4eW2Cc6BnzfSiYSiwlE8RtlLgEX6DHG3KYU+NbUWl6VVq2VA7299DpQGrJ11NNXBPJT+OO4sQNCgUYLGeFgPoygUdAweGseuR3puy5g1RWM6ZVHfahQCD1RI23gVhb7N3t3VbOMYxt915iN+jTRcOfOXsY39HrSTt85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=l0A7LuWB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20bb610be6aso68921805ad.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 17:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728435343; x=1729040143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deg8XZq5zNjaBqZWSFjh4SCyJKHLBliWqnssKGJsyB8=;
        b=l0A7LuWBzgJAzgoYPXk86O0N5RQ0rMFx2V78rdUiOaFbLrPBUUNjxcVrHYX7J011UX
         CHACp7P210GACD6hrMgr/NDJAU0uDm9+3uxhH0ttz4VHAt5u2VMHkikqjIxF4WIkA5MI
         VoCH7+HLOBZeeOhdc0btZ7q93rR98u84i45g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728435343; x=1729040143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deg8XZq5zNjaBqZWSFjh4SCyJKHLBliWqnssKGJsyB8=;
        b=I30OggCx/IqwX+YM8OsEHnoZ/z5BkLn57ZTz+f3SQ17cFnTAfvmlsj0z7q417v0R4S
         6RrPxDS32I8NoO9iytdwHX0+4drKM0DMHiA+Xsp5X6FFZc19r1wWtePfYgxKlAYy6CVt
         o2C0HcbGN2QACYawvES8ZkOXjljQ9gON2iK0GJe/SsJ5Rqni3bbhq4ZpxnUeW+4InvGg
         f28Ee5HMMH0v0hoTWXJo6OOgoKae0kXBAPEbBuYvDlrRe3Hi+FL+ANObzB/PB8nZH7Xk
         9CHYqqObOYDyx1E4/UBXaENM6itxZX4Cwi9crgOWf6Ae+j7vP3XR28FnDaB6kwLeMGpc
         3MHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvIua/eemVbf2Qw80SfwEGtT+uOS3CTcSmoMWo0kp4nSMf3vAwojfXg7iHGAgQ6VV/kxb+DTASuUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2M9tCTtY6smLf7w+Yi745OeSCpOr7U/sAuQz88lGKN9+aXym
	IRk793GdgvPr/jiN8+jBOkpQCy3b6TzVAOSveGfMINBQHi6Jix/jPcevZn1pxSo=
X-Google-Smtp-Source: AGHT+IG7nsJEQbRVf1GCMMh5naPYCm+uYaFdo+uqFeHXyzS5A7OHYrSNQySa5p3gC3x8esQTp16VRw==
X-Received: by 2002:a17:903:2289:b0:20c:5263:247a with SMTP id d9443c01a7336-20c637809c9mr18295855ad.38.1728435343546;
        Tue, 08 Oct 2024 17:55:43 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec92sm60996045ad.101.2024.10.08.17.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:55:43 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca,
	skhawaja@google.com,
	sdf@fomichev.me,
	bjorn@rivosinc.com,
	amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	willemdebruijn.kernel@gmail.com,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [net-next v5 1/9] net: napi: Make napi_defer_hard_irqs per-NAPI
Date: Wed,  9 Oct 2024 00:54:55 +0000
Message-Id: <20241009005525.13651-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009005525.13651-1-jdamato@fastly.com>
References: <20241009005525.13651-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defer_hard_irqs to napi_struct in preparation for per-NAPI
settings.

The existing sysfs parameter is respected; writes to sysfs will write to
all NAPI structs for the device and the net_device defer_hard_irq field.
Reads from sysfs show the net_device field.

The ability to set defer_hard_irqs on specific NAPI instances will be
added in a later commit, via netdev-genl.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 .../networking/net_cachelines/net_device.rst  |  2 +-
 include/linux/netdevice.h                     |  3 +-
 net/core/dev.c                                | 10 +++---
 net/core/dev.h                                | 36 +++++++++++++++++++
 net/core/net-sysfs.c                          |  2 +-
 5 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 556711c4d3cf..d78b1362f12a 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -100,7 +100,6 @@ unsigned_int                        num_rx_queues
 unsigned_int                        real_num_rx_queues      -                   read_mostly         get_rps_cpu
 struct_bpf_prog*                    xdp_prog                -                   read_mostly         netif_elide_gro()
 unsigned_long                       gro_flush_timeout       -                   read_mostly         napi_complete_done
-u32                                 napi_defer_hard_irqs    -                   read_mostly         napi_complete_done
 unsigned_int                        gro_max_size            -                   read_mostly         skb_gro_receive
 unsigned_int                        gro_ipv4_max_size       -                   read_mostly         skb_gro_receive
 rx_handler_func_t*                  rx_handler              read_mostly         -                   __netif_receive_skb_core
@@ -185,3 +184,4 @@ struct_dpll_pin*                    dpll_pin
 struct hlist_head                   page_pools
 struct dim_irq_moder*               irq_moder
 u64                                 max_pacing_offload_horizon
+u32                                 napi_defer_hard_irqs
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 3baf8e539b6f..9042920cdd1a 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -373,6 +373,7 @@ struct napi_struct {
 	unsigned int		napi_id;
 	struct hrtimer		timer;
 	struct task_struct	*thread;
+	u32			defer_hard_irqs;
 	/* control-path-only fields follow */
 	struct list_head	dev_list;
 	struct hlist_node	napi_hash_node;
@@ -2077,7 +2078,6 @@ struct net_device {
 	unsigned int		real_num_rx_queues;
 	struct netdev_rx_queue	*_rx;
 	unsigned long		gro_flush_timeout;
-	u32			napi_defer_hard_irqs;
 	unsigned int		gro_max_size;
 	unsigned int		gro_ipv4_max_size;
 	rx_handler_func_t __rcu	*rx_handler;
@@ -2405,6 +2405,7 @@ struct net_device {
 	struct dim_irq_moder	*irq_moder;
 
 	u64			max_pacing_offload_horizon;
+	u32			napi_defer_hard_irqs;
 
 	u8			priv[] ____cacheline_aligned
 				       __counted_by(priv_len);
diff --git a/net/core/dev.c b/net/core/dev.c
index ea5fbcd133ae..3487eec284a6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6231,7 +6231,7 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 	if (work_done) {
 		if (n->gro_bitmask)
 			timeout = READ_ONCE(n->dev->gro_flush_timeout);
-		n->defer_hard_irqs_count = READ_ONCE(n->dev->napi_defer_hard_irqs);
+		n->defer_hard_irqs_count = napi_get_defer_hard_irqs(n);
 	}
 	if (n->defer_hard_irqs_count > 0) {
 		n->defer_hard_irqs_count--;
@@ -6369,7 +6369,7 @@ static void busy_poll_stop(struct napi_struct *napi, void *have_poll_lock,
 	bpf_net_ctx = bpf_net_ctx_set(&__bpf_net_ctx);
 
 	if (flags & NAPI_F_PREFER_BUSY_POLL) {
-		napi->defer_hard_irqs_count = READ_ONCE(napi->dev->napi_defer_hard_irqs);
+		napi->defer_hard_irqs_count = napi_get_defer_hard_irqs(napi);
 		timeout = READ_ONCE(napi->dev->gro_flush_timeout);
 		if (napi->defer_hard_irqs_count && timeout) {
 			hrtimer_start(&napi->timer, ns_to_ktime(timeout), HRTIMER_MODE_REL_PINNED);
@@ -6651,6 +6651,7 @@ void netif_napi_add_weight(struct net_device *dev, struct napi_struct *napi,
 	INIT_HLIST_NODE(&napi->napi_hash_node);
 	hrtimer_init(&napi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
 	napi->timer.function = napi_watchdog;
+	napi_set_defer_hard_irqs(napi, READ_ONCE(dev->napi_defer_hard_irqs));
 	init_gro_hash(napi);
 	napi->skb = NULL;
 	INIT_LIST_HEAD(&napi->rx_list);
@@ -11057,7 +11058,7 @@ void netdev_sw_irq_coalesce_default_on(struct net_device *dev)
 
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
 		dev->gro_flush_timeout = 20000;
-		dev->napi_defer_hard_irqs = 1;
+		netdev_set_defer_hard_irqs(dev, 1);
 	}
 }
 EXPORT_SYMBOL_GPL(netdev_sw_irq_coalesce_default_on);
@@ -11995,7 +11996,6 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, real_num_rx_queues);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, _rx);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, gro_flush_timeout);
-	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, napi_defer_hard_irqs);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, gro_max_size);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, gro_ipv4_max_size);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, rx_handler);
@@ -12007,7 +12007,7 @@ static void __init net_dev_struct_check(void)
 #ifdef CONFIG_NET_XGRESS
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, tcx_ingress);
 #endif
-	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_rx, 104);
+	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_rx, 100);
 }
 
 /*
diff --git a/net/core/dev.h b/net/core/dev.h
index 5654325c5b71..b3792219879b 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -138,6 +138,42 @@ static inline void netif_set_gro_ipv4_max_size(struct net_device *dev,
 	WRITE_ONCE(dev->gro_ipv4_max_size, size);
 }
 
+/**
+ * napi_get_defer_hard_irqs - get the NAPI's defer_hard_irqs
+ * @n: napi struct to get the defer_hard_irqs field from
+ *
+ * Return: the per-NAPI value of the defar_hard_irqs field.
+ */
+static inline u32 napi_get_defer_hard_irqs(const struct napi_struct *n)
+{
+	return READ_ONCE(n->defer_hard_irqs);
+}
+
+/**
+ * napi_set_defer_hard_irqs - set the defer_hard_irqs for a napi
+ * @n: napi_struct to set the defer_hard_irqs field
+ * @defer: the value the field should be set to
+ */
+static inline void napi_set_defer_hard_irqs(struct napi_struct *n, u32 defer)
+{
+	WRITE_ONCE(n->defer_hard_irqs, defer);
+}
+
+/**
+ * netdev_set_defer_hard_irqs - set defer_hard_irqs for all NAPIs of a netdev
+ * @netdev: the net_device for which all NAPIs will have defer_hard_irqs set
+ * @defer: the defer_hard_irqs value to set
+ */
+static inline void netdev_set_defer_hard_irqs(struct net_device *netdev,
+					      u32 defer)
+{
+	struct napi_struct *napi;
+
+	WRITE_ONCE(netdev->napi_defer_hard_irqs, defer);
+	list_for_each_entry(napi, &netdev->napi_list, dev_list)
+		napi_set_defer_hard_irqs(napi, defer);
+}
+
 int rps_cpumask_housekeeping(struct cpumask *mask);
 
 #if defined(CONFIG_DEBUG_NET) && defined(CONFIG_BPF_SYSCALL)
diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 05cf5347f25e..25125f356a15 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -429,7 +429,7 @@ static int change_napi_defer_hard_irqs(struct net_device *dev, unsigned long val
 	if (val > S32_MAX)
 		return -ERANGE;
 
-	WRITE_ONCE(dev->napi_defer_hard_irqs, val);
+	netdev_set_defer_hard_irqs(dev, (u32)val);
 	return 0;
 }
 
-- 
2.34.1


