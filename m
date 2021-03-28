Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204D634BC98
	for <lists+linux-doc@lfdr.de>; Sun, 28 Mar 2021 16:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1Oaj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Mar 2021 10:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhC1Oag (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Mar 2021 10:30:36 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F39AC061756;
        Sun, 28 Mar 2021 07:30:36 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id g24so7639289qts.6;
        Sun, 28 Mar 2021 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUT1S2OjDoOPPhGzDB4EoWCqRdDjJ4UDo0htHObv0iE=;
        b=R+vKwahpev/khXqqKTjJkJvMHl4iM0ooAQtRemsYXrO/BSK0Iwkv0n5NVAnweUGXYf
         GVfyHYJmFZha0BCwbkM5uXawQpnvvfyxsKUvZs7R8OokCJ+pLf/3fa9+CRb9ohvG1t4d
         cgweKqfqDfZBTm7sW+9JB5B0sKczG2F9y7v4hRBx1T0VoC7mfW+bU3Jj2JLaKYvORO22
         qLC0TX50oe/ZxKc8PZO9dfNXIVI+Pltij/5SOBnkTBJXTI9FoMsjRBfUwXT4kSMEl8Ly
         AfP61WWhMZGIZK+vaIcrk/UbcugU9xPc3oYo0sEFmV6Ouf+PyieE1Ecy0sJaulcyLoqk
         GYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUT1S2OjDoOPPhGzDB4EoWCqRdDjJ4UDo0htHObv0iE=;
        b=is7aNy6z4zBwfT8CvqR9RIViIb9Xdqb/RP1fCc/QVnrbQY96HJu9ceZcYR/yQv+1uN
         7ocR0HtJMJLUFrIvbpaoRxblF8HgY6bSEG326qLQqaT7qk0hnXLsySxy60xO/p37NFkE
         XoywAK85hZ25Skt2ELsdapiBPL93O1dgcSZGwBeZUifZZLu2tWPZau6la/2Jx81EJpy9
         YhC1e1jmcrrd7tFBuEhdEP/yTGtUs6uN3poweQVc/b1MWtd35yOPq0166Cx58TXmTScx
         nzAMcCjww2Er+AVFNtBHrpQ77C/oypUviyQUaKdxPL/O9gAPRqJh6bLPvRKZzOiDxPot
         OaqA==
X-Gm-Message-State: AOAM533RpB7GwlZsXnjNQ4LVUAXjW9v0IL3eTvfWiM88XcLHvjFUhc/O
        6HDEG7cQi+I1W9Mjh0hF/ac=
X-Google-Smtp-Source: ABdhPJwSaOPE9pUZulvIR/Por0roErjCChtwSShSgUxUmqJaGpXbMUl5Jb3wLaRXiv15AAElSb216A==
X-Received: by 2002:ac8:4e51:: with SMTP id e17mr19497741qtw.204.1616941834529;
        Sun, 28 Mar 2021 07:30:34 -0700 (PDT)
Received: from shane-XPS-13-9380.attlocal.net ([2600:1700:4ca1:ade0:d373:7d57:15e2:e5f6])
        by smtp.gmail.com with ESMTPSA id s13sm11112571qkg.17.2021.03.28.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 07:30:33 -0700 (PDT)
From:   Xie He <xie.he.0141@gmail.com>
To:     Martin Schiller <ms@dev.tdt.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Halasa <khc@pm.waw.pl>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Xie He <xie.he.0141@gmail.com>
Subject: [PATCH net-next] net: x25: Queue received packets in the drivers instead of per-CPU queues
Date:   Sun, 28 Mar 2021 07:30:25 -0700
Message-Id: <20210328143025.516747-1-xie.he.0141@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

X.25 Layer 3 (the Packet Layer) expects layer 2 to provide a reliable
datalink service such that no packets are reordered or dropped. And
X.25 Layer 2 (the LAPB layer) is indeed designed to provide such service.

However, this reliability is not preserved when a driver calls "netif_rx"
to deliver the received packets to layer 3, because "netif_rx" will put
the packets into per-CPU queues before they are delivered to layer 3.
If there are multiple CPUs, the order of the packets may not be preserved.
The per-CPU queues may also drop packets if there are too many.

Therefore, we should not call "netif_rx" to let it queue the packets.
Instead, we should use our own queue that won't reorder or drop packets.

This patch changes all X.25 drivers to use their own queues instead of
calling "netif_rx". The patch also documents this requirement in the
"x25-iface" documentation.

Acked-by: Martin Schiller <ms@dev.tdt.de>
Signed-off-by: Xie He <xie.he.0141@gmail.com>
---

Change from RFC (March 5, 2021):
Rebased onto the latest net-next
(onto the ndo_stop racing fixes for the drivers).

---
 Documentation/networking/x25-iface.rst | 65 ++++----------------------
 drivers/net/wan/hdlc_x25.c             | 27 ++++++++++-
 drivers/net/wan/lapbether.c            | 44 +++++++++++++++--
 3 files changed, 75 insertions(+), 61 deletions(-)

diff --git a/Documentation/networking/x25-iface.rst b/Documentation/networking/x25-iface.rst
index df401891dce6..f34e9ec64937 100644
--- a/Documentation/networking/x25-iface.rst
+++ b/Documentation/networking/x25-iface.rst
@@ -70,60 +70,13 @@ First Byte = 0x03 (X25_IFACE_PARAMS)
 LAPB parameters. To be defined.
 
 
+Requirements for the device driver
+----------------------------------
 
-Possible Problems
-=================
-
-(Henner Eisen, 2000-10-28)
-
-The X.25 packet layer protocol depends on a reliable datalink service.
-The LAPB protocol provides such reliable service. But this reliability
-is not preserved by the Linux network device driver interface:
-
-- With Linux 2.4.x (and above) SMP kernels, packet ordering is not
-  preserved. Even if a device driver calls netif_rx(skb1) and later
-  netif_rx(skb2), skb2 might be delivered to the network layer
-  earlier that skb1.
-- Data passed upstream by means of netif_rx() might be dropped by the
-  kernel if the backlog queue is congested.
-
-The X.25 packet layer protocol will detect this and reset the virtual
-call in question. But many upper layer protocols are not designed to
-handle such N-Reset events gracefully. And frequent N-Reset events
-will always degrade performance.
-
-Thus, driver authors should make netif_rx() as reliable as possible:
-
-SMP re-ordering will not occur if the driver's interrupt handler is
-always executed on the same CPU. Thus,
-
-- Driver authors should use irq affinity for the interrupt handler.
-
-The probability of packet loss due to backlog congestion can be
-reduced by the following measures or a combination thereof:
-
-(1) Drivers for kernel versions 2.4.x and above should always check the
-    return value of netif_rx(). If it returns NET_RX_DROP, the
-    driver's LAPB protocol must not confirm reception of the frame
-    to the peer.
-    This will reliably suppress packet loss. The LAPB protocol will
-    automatically cause the peer to re-transmit the dropped packet
-    later.
-    The lapb module interface was modified to support this. Its
-    data_indication() method should now transparently pass the
-    netif_rx() return value to the (lapb module) caller.
-(2) Drivers for kernel versions 2.2.x should always check the global
-    variable netdev_dropping when a new frame is received. The driver
-    should only call netif_rx() if netdev_dropping is zero. Otherwise
-    the driver should not confirm delivery of the frame and drop it.
-    Alternatively, the driver can queue the frame internally and call
-    netif_rx() later when netif_dropping is 0 again. In that case, delivery
-    confirmation should also be deferred such that the internal queue
-    cannot grow to much.
-    This will not reliably avoid packet loss, but the probability
-    of packet loss in netif_rx() path will be significantly reduced.
-(3) Additionally, driver authors might consider to support
-    CONFIG_NET_HW_FLOWCONTROL. This allows the driver to be woken up
-    when a previously congested backlog queue becomes empty again.
-    The driver could uses this for flow-controlling the peer by means
-    of the LAPB protocol's flow-control service.
+Packets should not be reordered or dropped when delivering between the
+Packet Layer and the device driver.
+
+To avoid packets from being reordered or dropped when delivering from
+the device driver to the Packet Layer, the device driver should not
+call "netif_rx" to deliver the received packets. Instead, it should
+call "netif_receive_skb_core" from softirq context to deliver them.
diff --git a/drivers/net/wan/hdlc_x25.c b/drivers/net/wan/hdlc_x25.c
index 5a6a945f6c81..73184ed4034c 100644
--- a/drivers/net/wan/hdlc_x25.c
+++ b/drivers/net/wan/hdlc_x25.c
@@ -25,6 +25,8 @@ struct x25_state {
 	x25_hdlc_proto settings;
 	bool up;
 	spinlock_t up_lock; /* Protects "up" */
+	struct sk_buff_head rx_queue;
+	struct tasklet_struct rx_tasklet;
 };
 
 static int x25_ioctl(struct net_device *dev, struct ifreq *ifr);
@@ -34,10 +36,22 @@ static struct x25_state *state(hdlc_device *hdlc)
 	return hdlc->state;
 }
 
+static void x25_rx_queue_kick(struct tasklet_struct *t)
+{
+	struct x25_state *x25st = from_tasklet(x25st, t, rx_tasklet);
+	struct sk_buff *skb = skb_dequeue(&x25st->rx_queue);
+
+	while (skb) {
+		netif_receive_skb_core(skb);
+		skb = skb_dequeue(&x25st->rx_queue);
+	}
+}
+
 /* These functions are callbacks called by LAPB layer */
 
 static void x25_connect_disconnect(struct net_device *dev, int reason, int code)
 {
+	struct x25_state *x25st = state(dev_to_hdlc(dev));
 	struct sk_buff *skb;
 	unsigned char *ptr;
 
@@ -50,7 +64,9 @@ static void x25_connect_disconnect(struct net_device *dev, int reason, int code)
 	*ptr = code;
 
 	skb->protocol = x25_type_trans(skb, dev);
-	netif_rx(skb);
+
+	skb_queue_tail(&x25st->rx_queue, skb);
+	tasklet_schedule(&x25st->rx_tasklet);
 }
 
 
@@ -71,6 +87,7 @@ static void x25_disconnected(struct net_device *dev, int reason)
 
 static int x25_data_indication(struct net_device *dev, struct sk_buff *skb)
 {
+	struct x25_state *x25st = state(dev_to_hdlc(dev));
 	unsigned char *ptr;
 
 	if (skb_cow(skb, 1)) {
@@ -84,7 +101,10 @@ static int x25_data_indication(struct net_device *dev, struct sk_buff *skb)
 	*ptr = X25_IFACE_DATA;
 
 	skb->protocol = x25_type_trans(skb, dev);
-	return netif_rx(skb);
+
+	skb_queue_tail(&x25st->rx_queue, skb);
+	tasklet_schedule(&x25st->rx_tasklet);
+	return NET_RX_SUCCESS;
 }
 
 
@@ -223,6 +243,7 @@ static void x25_close(struct net_device *dev)
 	spin_unlock_bh(&x25st->up_lock);
 
 	lapb_unregister(dev);
+	tasklet_kill(&x25st->rx_tasklet);
 }
 
 
@@ -338,6 +359,8 @@ static int x25_ioctl(struct net_device *dev, struct ifreq *ifr)
 		memcpy(&state(hdlc)->settings, &new_settings, size);
 		state(hdlc)->up = false;
 		spin_lock_init(&state(hdlc)->up_lock);
+		skb_queue_head_init(&state(hdlc)->rx_queue);
+		tasklet_setup(&state(hdlc)->rx_tasklet, x25_rx_queue_kick);
 
 		/* There's no header_ops so hard_header_len should be 0. */
 		dev->hard_header_len = 0;
diff --git a/drivers/net/wan/lapbether.c b/drivers/net/wan/lapbether.c
index 45d74285265a..e321e7fa994b 100644
--- a/drivers/net/wan/lapbether.c
+++ b/drivers/net/wan/lapbether.c
@@ -53,6 +53,8 @@ struct lapbethdev {
 	struct net_device	*axdev;		/* lapbeth device (lapb#) */
 	bool			up;
 	spinlock_t		up_lock;	/* Protects "up" */
+	struct sk_buff_head	rx_queue;
+	struct napi_struct	napi;
 };
 
 static LIST_HEAD(lapbeth_devices);
@@ -83,6 +85,25 @@ static __inline__ int dev_is_ethdev(struct net_device *dev)
 
 /* ------------------------------------------------------------------------ */
 
+static int lapbeth_napi_poll(struct napi_struct *napi, int budget)
+{
+	struct lapbethdev *lapbeth = container_of(napi, struct lapbethdev, napi);
+	struct sk_buff *skb;
+	int processed = 0;
+
+	for (; processed < budget; ++processed) {
+		skb = skb_dequeue(&lapbeth->rx_queue);
+		if (!skb)
+			break;
+		netif_receive_skb_core(skb);
+	}
+
+	if (processed < budget)
+		napi_complete(napi);
+
+	return processed;
+}
+
 /*
  *	Receive a LAPB frame via an ethernet interface.
  */
@@ -135,6 +156,7 @@ static int lapbeth_rcv(struct sk_buff *skb, struct net_device *dev, struct packe
 
 static int lapbeth_data_indication(struct net_device *dev, struct sk_buff *skb)
 {
+	struct lapbethdev *lapbeth = netdev_priv(dev);
 	unsigned char *ptr;
 
 	if (skb_cow(skb, 1)) {
@@ -148,7 +170,10 @@ static int lapbeth_data_indication(struct net_device *dev, struct sk_buff *skb)
 	*ptr = X25_IFACE_DATA;
 
 	skb->protocol = x25_type_trans(skb, dev);
-	return netif_rx(skb);
+
+	skb_queue_tail(&lapbeth->rx_queue, skb);
+	napi_schedule(&lapbeth->napi);
+	return NET_RX_SUCCESS;
 }
 
 /*
@@ -233,6 +258,7 @@ static void lapbeth_data_transmit(struct net_device *ndev, struct sk_buff *skb)
 
 static void lapbeth_connected(struct net_device *dev, int reason)
 {
+	struct lapbethdev *lapbeth = netdev_priv(dev);
 	unsigned char *ptr;
 	struct sk_buff *skb = dev_alloc_skb(1);
 
@@ -245,11 +271,14 @@ static void lapbeth_connected(struct net_device *dev, int reason)
 	*ptr = X25_IFACE_CONNECT;
 
 	skb->protocol = x25_type_trans(skb, dev);
-	netif_rx(skb);
+
+	skb_queue_tail(&lapbeth->rx_queue, skb);
+	napi_schedule(&lapbeth->napi);
 }
 
 static void lapbeth_disconnected(struct net_device *dev, int reason)
 {
+	struct lapbethdev *lapbeth = netdev_priv(dev);
 	unsigned char *ptr;
 	struct sk_buff *skb = dev_alloc_skb(1);
 
@@ -262,7 +291,9 @@ static void lapbeth_disconnected(struct net_device *dev, int reason)
 	*ptr = X25_IFACE_DISCONNECT;
 
 	skb->protocol = x25_type_trans(skb, dev);
-	netif_rx(skb);
+
+	skb_queue_tail(&lapbeth->rx_queue, skb);
+	napi_schedule(&lapbeth->napi);
 }
 
 /*
@@ -293,6 +324,8 @@ static int lapbeth_open(struct net_device *dev)
 	struct lapbethdev *lapbeth = netdev_priv(dev);
 	int err;
 
+	napi_enable(&lapbeth->napi);
+
 	if ((err = lapb_register(dev, &lapbeth_callbacks)) != LAPB_OK) {
 		pr_err("lapb_register error: %d\n", err);
 		return -ENODEV;
@@ -317,6 +350,8 @@ static int lapbeth_close(struct net_device *dev)
 	if ((err = lapb_unregister(dev)) != LAPB_OK)
 		pr_err("lapb_unregister error: %d\n", err);
 
+	napi_disable(&lapbeth->napi);
+
 	return 0;
 }
 
@@ -374,6 +409,9 @@ static int lapbeth_new_device(struct net_device *dev)
 	lapbeth->up = false;
 	spin_lock_init(&lapbeth->up_lock);
 
+	skb_queue_head_init(&lapbeth->rx_queue);
+	netif_napi_add(ndev, &lapbeth->napi, lapbeth_napi_poll, 16);
+
 	rc = -EIO;
 	if (register_netdevice(ndev))
 		goto fail;
-- 
2.27.0

