Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDC794A3E
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2019 18:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbfHSQdd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Aug 2019 12:33:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:55470 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727930AbfHSQcH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Aug 2019 12:32:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 468D4B60E;
        Mon, 19 Aug 2019 16:32:04 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v5 09/17] net: sgi: ioc3-eth: use defines for constants dealing with desc rings
Date:   Mon, 19 Aug 2019 18:31:32 +0200
Message-Id: <20190819163144.3478-10-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20190819163144.3478-1-tbogendoerfer@suse.de>
References: <20190819163144.3478-1-tbogendoerfer@suse.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Descriptor ring sizes of the IOC3 are more or less fixed size. To
make clearer where there is a relation to ring sizes use defines.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 42 +++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index e81e5bb37ac6..c875640926d6 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -61,10 +61,16 @@
 #include <asm/sn/ioc3.h>
 #include <asm/pci/bridge.h>
 
-/* 64 RX buffers.  This is tunable in the range of 16 <= x < 512.  The
- * value must be a power of two.
+/* Number of RX buffers.  This is tunable in the range of 16 <= x < 512.
+ * The value must be a power of two.
  */
-#define RX_BUFFS 64
+#define RX_BUFFS		64
+#define RX_RING_ENTRIES		512		/* fixed in hardware */
+#define RX_RING_MASK		(RX_RING_ENTRIES - 1)
+
+/* 128 TX buffers (not tunable) */
+#define TX_RING_ENTRIES		128
+#define TX_RING_MASK		(TX_RING_ENTRIES - 1)
 
 #define ETCSR_FD   ((17 << ETCSR_IPGR2_SHIFT) | (11 << ETCSR_IPGR1_SHIFT) | 21)
 #define ETCSR_HD   ((21 << ETCSR_IPGR2_SHIFT) | (21 << ETCSR_IPGR1_SHIFT) | 21)
@@ -76,8 +82,8 @@ struct ioc3_private {
 	u32 *ssram;
 	unsigned long *rxr;		/* pointer to receiver ring */
 	struct ioc3_etxd *txr;
-	struct sk_buff *rx_skbs[512];
-	struct sk_buff *tx_skbs[128];
+	struct sk_buff *rx_skbs[RX_RING_ENTRIES];
+	struct sk_buff *tx_skbs[TX_RING_ENTRIES];
 	int rx_ci;			/* RX consumer index */
 	int rx_pi;			/* RX producer index */
 	int tx_ci;			/* TX consumer index */
@@ -573,10 +579,10 @@ static inline void ioc3_rx(struct net_device *dev)
 		ip->rx_skbs[n_entry] = new_skb;
 		rxr[n_entry] = cpu_to_be64(ioc3_map(rxb, 1));
 		rxb->w0 = 0;				/* Clear valid flag */
-		n_entry = (n_entry + 1) & 511;		/* Update erpir */
+		n_entry = (n_entry + 1) & RX_RING_MASK;	/* Update erpir */
 
 		/* Now go on to the next ring entry.  */
-		rx_entry = (rx_entry + 1) & 511;
+		rx_entry = (rx_entry + 1) & RX_RING_MASK;
 		skb = ip->rx_skbs[rx_entry];
 		rxb = (struct ioc3_erxbuf *)(skb->data - RX_OFFSET);
 		w0 = be32_to_cpu(rxb->w0);
@@ -598,7 +604,7 @@ static inline void ioc3_tx(struct net_device *dev)
 	spin_lock(&ip->ioc3_lock);
 	etcir = readl(&regs->etcir);
 
-	tx_entry = (etcir >> 7) & 127;
+	tx_entry = (etcir >> 7) & TX_RING_MASK;
 	o_entry = ip->tx_ci;
 	packets = 0;
 	bytes = 0;
@@ -610,17 +616,17 @@ static inline void ioc3_tx(struct net_device *dev)
 		dev_consume_skb_irq(skb);
 		ip->tx_skbs[o_entry] = NULL;
 
-		o_entry = (o_entry + 1) & 127;		/* Next */
+		o_entry = (o_entry + 1) & TX_RING_MASK;	/* Next */
 
 		etcir = readl(&regs->etcir);		/* More pkts sent?  */
-		tx_entry = (etcir >> 7) & 127;
+		tx_entry = (etcir >> 7) & TX_RING_MASK;
 	}
 
 	dev->stats.tx_packets += packets;
 	dev->stats.tx_bytes += bytes;
 	ip->txqlen -= packets;
 
-	if (ip->txqlen < 128)
+	if (netif_queue_stopped(dev) && ip->txqlen < TX_RING_ENTRIES)
 		netif_wake_queue(dev);
 
 	ip->tx_ci = o_entry;
@@ -765,10 +771,10 @@ static inline void ioc3_clean_rx_ring(struct ioc3_private *ip)
 		ip->rx_skbs[ip->rx_pi] = ip->rx_skbs[ip->rx_ci];
 		ip->rxr[ip->rx_pi++] = ip->rxr[ip->rx_ci++];
 	}
-	ip->rx_pi &= 511;
-	ip->rx_ci &= 511;
+	ip->rx_pi &= RX_RING_MASK;
+	ip->rx_ci &= RX_RING_MASK;
 
-	for (i = ip->rx_ci; i != ip->rx_pi; i = (i + 1) & 511) {
+	for (i = ip->rx_ci; i != ip->rx_pi; i = (i + 1) & RX_RING_MASK) {
 		skb = ip->rx_skbs[i];
 		rxb = (struct ioc3_erxbuf *)(skb->data - RX_OFFSET);
 		rxb->w0 = 0;
@@ -780,7 +786,7 @@ static inline void ioc3_clean_tx_ring(struct ioc3_private *ip)
 	struct sk_buff *skb;
 	int i;
 
-	for (i = 0; i < 128; i++) {
+	for (i = 0; i < TX_RING_ENTRIES; i++) {
 		skb = ip->tx_skbs[i];
 		if (skb) {
 			ip->tx_skbs[i] = NULL;
@@ -812,7 +818,7 @@ static void ioc3_free_rings(struct ioc3_private *ip)
 			if (skb)
 				dev_kfree_skb_any(skb);
 
-			n_entry = (n_entry + 1) & 511;
+			n_entry = (n_entry + 1) & RX_RING_MASK;
 		}
 		free_page((unsigned long)ip->rxr);
 		ip->rxr = NULL;
@@ -1425,13 +1431,13 @@ static netdev_tx_t ioc3_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	mb(); /* make sure all descriptor changes are visible */
 
 	ip->tx_skbs[produce] = skb;			/* Remember skb */
-	produce = (produce + 1) & 127;
+	produce = (produce + 1) & TX_RING_MASK;
 	ip->tx_pi = produce;
 	writel(produce << 7, &ip->regs->etpir);		/* Fire ... */
 
 	ip->txqlen++;
 
-	if (ip->txqlen >= 127)
+	if (ip->txqlen >= (TX_RING_ENTRIES - 1))
 		netif_stop_queue(dev);
 
 	spin_unlock_irq(&ip->ioc3_lock);
-- 
2.13.7

