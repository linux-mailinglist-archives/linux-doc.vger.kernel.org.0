Return-Path: <linux-doc+bounces-26868-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4C995C8B
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 02:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2D3F1C203A6
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 00:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E684F218;
	Wed,  9 Oct 2024 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="rHS5XO8d"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F843AD2
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728435366; cv=none; b=lrqOe5TVzow8mH+mk5lMzjZcAP4yAh2U8z0fmn96VDtF3gRmUqurpIa6DgTnklFlnD/CeNzLr/BBd62V3PyQ23IHN2gA8bZlDomlJMYI6ngcGC/28jI0NFpwSQ0A8CMT5UNGW1/jlG85nw7e+HML+9LvrpJEXYG7wNT25yuf/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728435366; c=relaxed/simple;
	bh=OgnU7jGlYOZ4RgUbpwTEE1doBCYt+nNNnswKcF5DWLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YzhZUX1z5OluJ0qmb6YQi8g6cCOO5mSmdINQW5PWZ/Mlqi1TB+ewRc9ffvvgtrZ6wCzwaUwiScVOpI5sqyFIjj8XG7QWrvZ+DfNmKyNeIksHkMpNDqo8PHKylMSOJ0pI3jaOKxjc8IZEW756/0ZyGG8FrIbq4zoQ9lFR2mDV0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=rHS5XO8d; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c544d345cso2798685ad.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 17:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728435364; x=1729040164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n16XhemzbXx7qwcaB9LPA7EkmnNUbtxincb4Rdb9OsI=;
        b=rHS5XO8dkUU3o7d/3kMT1rFjpuzKmRr8/+yrpDMpZBSWuKBr/2nGo90dBlT1T8MrWh
         jtG01oIW3CBI85VRbrDE5XfIyHpRllm+fic9XEknqMGdawqAwExoJJlAwhpzqHSW0Eqe
         L2FIQoJosTfs/c8rbzA8UpuPufEiRo6BcNvmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728435364; x=1729040164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n16XhemzbXx7qwcaB9LPA7EkmnNUbtxincb4Rdb9OsI=;
        b=H+mgtJ2Fbn3Cc+4MMDHCKFhtx7UU0Z0/rWqnkw3sVqqGO5QY4Q1u1fTitCVyT5Z/e7
         pfDUMgHaI8yd7932P7X++IvISVPrWcU5GFwTotIuW5bi3+Dq6rUUeESJPXukdVQFu+9R
         j+tBL3G+Rq6RM/YUEc3q02lJfuxCfGodU+54eELC9wO2kmi/B1NopFPJ0/sr5q6Oi0Dj
         AaD45nns0c15C4o39P9WJ2nxS5UN8AHRrDFFIL9QJH0iAkLjyFDreqmpt7Fb8GQAUucN
         ttHgSllRHPfNTNunfp23VIba4Ep3hIlUgQuKxYCsp/UkD7crjVLKzrp4+28aQguapEWr
         1jtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlBQpB+cea5dz7e1C54X0+X4sLUoqwaiK6hL5DNJHxDZCDahQSN36GhjbiybPxv6kNEzFjqLh1t4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mOio5SY8CK9X9dDjGHUoABlGAuRXFi3AtTxat0pNWMNV5SH2
	a5LbZvllAa0g1wGkKao1e8Mhpx8Ms+sHaiZLORH7xyQZxt/RBpJZDtQI9bmN0Sw=
X-Google-Smtp-Source: AGHT+IHR1SIa8oY4V7UBXp5AdvZXp4JzGRwj4HelaMVkmT5XlbsItqb8H1RCUr8fzXvBNtNPuWtGqw==
X-Received: by 2002:a17:903:124d:b0:205:5c06:39e6 with SMTP id d9443c01a7336-20c4e19d98emr86680775ad.0.1728435364214;
        Tue, 08 Oct 2024 17:56:04 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec92sm60996045ad.101.2024.10.08.17.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:56:03 -0700 (PDT)
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
	Kory Maincent <kory.maincent@bootlin.com>,
	Johannes Berg <johannes.berg@intel.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [net-next v5 5/9] net: napi: Add napi_config
Date: Wed,  9 Oct 2024 00:54:59 +0000
Message-Id: <20241009005525.13651-6-jdamato@fastly.com>
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

Add a persistent NAPI config area for NAPI configuration to the core.
Drivers opt-in to setting the persistent config for a NAPI by passing an
index when calling netif_napi_add_config.

napi_config is allocated in alloc_netdev_mqs, freed in free_netdev
(after the NAPIs are deleted).

Drivers which call netif_napi_add_config will have persistent per-NAPI
settings: NAPI IDs, gro_flush_timeout, and defer_hard_irq settings.

Per-NAPI settings are saved in napi_disable and restored in napi_enable.

Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 include/linux/netdevice.h                     | 36 ++++++++-
 net/core/dev.c                                | 79 +++++++++++++++++--
 net/core/dev.h                                | 12 +++
 4 files changed, 118 insertions(+), 10 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 3ab663b6cf16..9d86720cb722 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -183,5 +183,6 @@ struct_dpll_pin*                    dpll_pin
 struct hlist_head                   page_pools
 struct dim_irq_moder*               irq_moder
 u64                                 max_pacing_offload_horizon
+struct_napi_config*                 napi_config
 unsigned_long                       gro_flush_timeout
 u32                                 napi_defer_hard_irqs
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 4239a4a9d295..b65a901ab4e7 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -342,6 +342,15 @@ struct gro_list {
  */
 #define GRO_HASH_BUCKETS	8
 
+/*
+ * Structure for per-NAPI config
+ */
+struct napi_config {
+	u64 gro_flush_timeout;
+	u32 defer_hard_irqs;
+	unsigned int napi_id;
+};
+
 /*
  * Structure for NAPI scheduling similar to tasklet but with weighting
  */
@@ -379,6 +388,8 @@ struct napi_struct {
 	struct list_head	dev_list;
 	struct hlist_node	napi_hash_node;
 	int			irq;
+	int			index;
+	struct napi_config	*config;
 };
 
 enum {
@@ -1860,9 +1871,6 @@ enum netdev_reg_state {
  *				allocated at register_netdev() time
  *	@real_num_rx_queues: 	Number of RX queues currently active in device
  *	@xdp_prog:		XDP sockets filter program pointer
- *	@gro_flush_timeout:	timeout for GRO layer in NAPI
- *	@napi_defer_hard_irqs:	If not zero, provides a counter that would
- *				allow to avoid NIC hard IRQ, on busy queues.
  *
  *	@rx_handler:		handler for received packets
  *	@rx_handler_data: 	XXX: need comments on this one
@@ -2012,6 +2020,11 @@ enum netdev_reg_state {
  *		   where the clock is recovered.
  *
  *	@max_pacing_offload_horizon: max EDT offload horizon in nsec.
+ *	@napi_config: An array of napi_config structures containing per-NAPI
+ *		      settings.
+ *	@gro_flush_timeout:	timeout for GRO layer in NAPI
+ *	@napi_defer_hard_irqs:	If not zero, provides a counter that would
+ *				allow to avoid NIC hard IRQ, on busy queues.
  *
  *	FIXME: cleanup struct net_device such that network protocol info
  *	moves out.
@@ -2405,6 +2418,7 @@ struct net_device {
 	struct dim_irq_moder	*irq_moder;
 
 	u64			max_pacing_offload_horizon;
+	struct napi_config	*napi_config;
 	unsigned long		gro_flush_timeout;
 	u32			napi_defer_hard_irqs;
 
@@ -2657,6 +2671,22 @@ netif_napi_add_tx_weight(struct net_device *dev,
 	netif_napi_add_weight(dev, napi, poll, weight);
 }
 
+/**
+ * netif_napi_add_config - initialize a NAPI context with persistent config
+ * @dev: network device
+ * @napi: NAPI context
+ * @poll: polling function
+ * @index: the NAPI index
+ */
+static inline void
+netif_napi_add_config(struct net_device *dev, struct napi_struct *napi,
+		      int (*poll)(struct napi_struct *, int), int index)
+{
+	napi->index = index;
+	napi->config = &dev->napi_config[index];
+	netif_napi_add_weight(dev, napi, poll, NAPI_POLL_WEIGHT);
+}
+
 /**
  * netif_napi_add_tx() - initialize a NAPI context to be used for Tx only
  * @dev:  network device
diff --git a/net/core/dev.c b/net/core/dev.c
index fca2295f4d95..bd87232f7b37 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6503,6 +6503,22 @@ EXPORT_SYMBOL(napi_busy_loop);
 
 #endif /* CONFIG_NET_RX_BUSY_POLL */
 
+static void __napi_hash_add_with_id(struct napi_struct *napi,
+				    unsigned int napi_id)
+{
+	napi->napi_id = napi_id;
+	hlist_add_head_rcu(&napi->napi_hash_node,
+			   &napi_hash[napi->napi_id % HASH_SIZE(napi_hash)]);
+}
+
+static void napi_hash_add_with_id(struct napi_struct *napi,
+				  unsigned int napi_id)
+{
+	spin_lock(&napi_hash_lock);
+	__napi_hash_add_with_id(napi, napi_id);
+	spin_unlock(&napi_hash_lock);
+}
+
 static void napi_hash_add(struct napi_struct *napi)
 {
 	if (test_bit(NAPI_STATE_NO_BUSY_POLL, &napi->state))
@@ -6515,10 +6531,8 @@ static void napi_hash_add(struct napi_struct *napi)
 		if (unlikely(++napi_gen_id < MIN_NAPI_ID))
 			napi_gen_id = MIN_NAPI_ID;
 	} while (napi_by_id(napi_gen_id));
-	napi->napi_id = napi_gen_id;
 
-	hlist_add_head_rcu(&napi->napi_hash_node,
-			   &napi_hash[napi->napi_id % HASH_SIZE(napi_hash)]);
+	__napi_hash_add_with_id(napi, napi_gen_id);
 
 	spin_unlock(&napi_hash_lock);
 }
@@ -6641,6 +6655,28 @@ void netif_queue_set_napi(struct net_device *dev, unsigned int queue_index,
 }
 EXPORT_SYMBOL(netif_queue_set_napi);
 
+static void napi_restore_config(struct napi_struct *n)
+{
+	n->defer_hard_irqs = n->config->defer_hard_irqs;
+	n->gro_flush_timeout = n->config->gro_flush_timeout;
+	/* a NAPI ID might be stored in the config, if so use it. if not, use
+	 * napi_hash_add to generate one for us. It will be saved to the config
+	 * in napi_disable.
+	 */
+	if (n->config->napi_id)
+		napi_hash_add_with_id(n, n->config->napi_id);
+	else
+		napi_hash_add(n);
+}
+
+static void napi_save_config(struct napi_struct *n)
+{
+	n->config->defer_hard_irqs = n->defer_hard_irqs;
+	n->config->gro_flush_timeout = n->gro_flush_timeout;
+	n->config->napi_id = n->napi_id;
+	napi_hash_del(n);
+}
+
 void netif_napi_add_weight(struct net_device *dev, struct napi_struct *napi,
 			   int (*poll)(struct napi_struct *, int), int weight)
 {
@@ -6651,8 +6687,6 @@ void netif_napi_add_weight(struct net_device *dev, struct napi_struct *napi,
 	INIT_HLIST_NODE(&napi->napi_hash_node);
 	hrtimer_init(&napi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
 	napi->timer.function = napi_watchdog;
-	napi_set_defer_hard_irqs(napi, READ_ONCE(dev->napi_defer_hard_irqs));
-	napi_set_gro_flush_timeout(napi, READ_ONCE(dev->gro_flush_timeout));
 	init_gro_hash(napi);
 	napi->skb = NULL;
 	INIT_LIST_HEAD(&napi->rx_list);
@@ -6670,7 +6704,13 @@ void netif_napi_add_weight(struct net_device *dev, struct napi_struct *napi,
 	set_bit(NAPI_STATE_SCHED, &napi->state);
 	set_bit(NAPI_STATE_NPSVC, &napi->state);
 	list_add_rcu(&napi->dev_list, &dev->napi_list);
-	napi_hash_add(napi);
+
+	/* default settings from sysfs are applied to all NAPIs. any per-NAPI
+	 * configuration will be loaded in napi_enable
+	 */
+	napi_set_defer_hard_irqs(napi, READ_ONCE(dev->napi_defer_hard_irqs));
+	napi_set_gro_flush_timeout(napi, READ_ONCE(dev->gro_flush_timeout));
+
 	napi_get_frags_check(napi);
 	/* Create kthread for this napi if dev->threaded is set.
 	 * Clear dev->threaded if kthread creation failed so that
@@ -6702,6 +6742,11 @@ void napi_disable(struct napi_struct *n)
 
 	hrtimer_cancel(&n->timer);
 
+	if (n->config)
+		napi_save_config(n);
+	else
+		napi_hash_del(n);
+
 	clear_bit(NAPI_STATE_DISABLE, &n->state);
 }
 EXPORT_SYMBOL(napi_disable);
@@ -6717,6 +6762,11 @@ void napi_enable(struct napi_struct *n)
 {
 	unsigned long new, val = READ_ONCE(n->state);
 
+	if (n->config)
+		napi_restore_config(n);
+	else
+		napi_hash_add(n);
+
 	do {
 		BUG_ON(!test_bit(NAPI_STATE_SCHED, &val));
 
@@ -6746,7 +6796,11 @@ void __netif_napi_del(struct napi_struct *napi)
 	if (!test_and_clear_bit(NAPI_STATE_LISTED, &napi->state))
 		return;
 
-	napi_hash_del(napi);
+	if (napi->config) {
+		napi->index = -1;
+		napi->config = NULL;
+	}
+
 	list_del_rcu(&napi->dev_list);
 	napi_free_frags(napi);
 
@@ -11083,6 +11137,8 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 		unsigned int txqs, unsigned int rxqs)
 {
 	struct net_device *dev;
+	size_t napi_config_sz;
+	unsigned int maxqs;
 
 	BUG_ON(strlen(name) >= sizeof(dev->name));
 
@@ -11096,6 +11152,8 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 		return NULL;
 	}
 
+	maxqs = max(txqs, rxqs);
+
 	dev = kvzalloc(struct_size(dev, priv, sizeof_priv),
 		       GFP_KERNEL_ACCOUNT | __GFP_RETRY_MAYFAIL);
 	if (!dev)
@@ -11170,6 +11228,11 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	if (!dev->ethtool)
 		goto free_all;
 
+	napi_config_sz = array_size(maxqs, sizeof(*dev->napi_config));
+	dev->napi_config = kvzalloc(napi_config_sz, GFP_KERNEL_ACCOUNT);
+	if (!dev->napi_config)
+		goto free_all;
+
 	strscpy(dev->name, name);
 	dev->name_assign_type = name_assign_type;
 	dev->group = INIT_NETDEV_GROUP;
@@ -11231,6 +11294,8 @@ void free_netdev(struct net_device *dev)
 	list_for_each_entry_safe(p, n, &dev->napi_list, dev_list)
 		netif_napi_del(p);
 
+	kvfree(dev->napi_config);
+
 	ref_tracker_dir_exit(&dev->refcnt_tracker);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	free_percpu(dev->pcpu_refcnt);
diff --git a/net/core/dev.h b/net/core/dev.h
index 26e598aa56c3..f22cb532de7a 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -167,11 +167,17 @@ static inline void napi_set_defer_hard_irqs(struct napi_struct *n, u32 defer)
 static inline void netdev_set_defer_hard_irqs(struct net_device *netdev,
 					      u32 defer)
 {
+	unsigned int count = max(netdev->num_rx_queues,
+				 netdev->num_tx_queues);
 	struct napi_struct *napi;
+	int i;
 
 	WRITE_ONCE(netdev->napi_defer_hard_irqs, defer);
 	list_for_each_entry(napi, &netdev->napi_list, dev_list)
 		napi_set_defer_hard_irqs(napi, defer);
+
+	for (i = 0; i < count; i++)
+		netdev->napi_config[i].defer_hard_irqs = defer;
 }
 
 /**
@@ -207,11 +213,17 @@ static inline void napi_set_gro_flush_timeout(struct napi_struct *n,
 static inline void netdev_set_gro_flush_timeout(struct net_device *netdev,
 						unsigned long timeout)
 {
+	unsigned int count = max(netdev->num_rx_queues,
+				 netdev->num_tx_queues);
 	struct napi_struct *napi;
+	int i;
 
 	WRITE_ONCE(netdev->gro_flush_timeout, timeout);
 	list_for_each_entry(napi, &netdev->napi_list, dev_list)
 		napi_set_gro_flush_timeout(napi, timeout);
+
+	for (i = 0; i < count; i++)
+		netdev->napi_config[i].gro_flush_timeout = timeout;
 }
 
 int rps_cpumask_housekeeping(struct cpumask *mask);
-- 
2.34.1


