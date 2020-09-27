Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA58727A38E
	for <lists+linux-doc@lfdr.de>; Sun, 27 Sep 2020 22:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgI0UAU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 27 Sep 2020 16:00:20 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:42356 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgI0T5k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Sep 2020 15:57:40 -0400
Message-Id: <20200927194922.339094192@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601236657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=/+NkNOFDTNEsvHtoYwvS6e5nGIUJrGWmdKgKhxRiVZQ=;
        b=i78WD85gnPsh4yApNHz3h3EICTPouYnGaz+NdutFRPbC2g+LBAcgEA98gYYIX3sePKbFX+
        aW6RGh5H09EzI4Mh8ZGonbj10TDbUh88wm+nuSWh0w6x0ukPIBOVFSlYpnFSjWBxQjlZEA
        dZI6i6EWFK+FBWwouC5ZuuhW9CnV5nLv8LhAgo7DsP3tITCApkBoZ1LPbMQ6YjxHyMUQNJ
        5O75Y0akslY+Xq0qZkfH7GiDGSsj28B/BRTnTUypspy3QzORsPtT6Riihm2xR7i/BkvTmL
        ZEnONAaKfjRm5aWqs7k+mRPEqyYX90JEwPgqEsFVirCImtSG3RtsouMS5jDjKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601236657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=/+NkNOFDTNEsvHtoYwvS6e5nGIUJrGWmdKgKhxRiVZQ=;
        b=bEZ1EtrwXR8uDmg72J7X+Vd/1z0e293HU/+nyHmJTJvWOPAbHzbrLxBBfts2sKcnlYSZ/x
        DWEDgLoXEIFxOaDQ==
Date:   Sun, 27 Sep 2020 21:49:11 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com, netdev@vger.kernel.org,
        Christian Benvenuti <benve@cisco.com>,
        Govindarajulu Varadarajan <_govind@gmx.com>,
        Dave Miller <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Jay Cliburn <jcliburn@gmail.com>,
        Chris Snook <chris.snook@gmail.com>,
        Vishal Kulkarni <vishal@chelsio.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org,
        Shannon Nelson <snelson@pensando.io>,
        Pensando Drivers <drivers@pensando.io>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
        Edward Cree <ecree@solarflare.com>,
        Martin Habets <mhabets@solarflare.com>,
        Jon Mason <jdmason@kudzu.us>, Daniel Drake <dsd@gentoo.org>,
        Ulrich Kunitz <kune@deine-taler.de>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        Wright Feng <wright.feng@cypress.com>,
        Stanislav Yakovlev <stas.yakovlev@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Johannes Berg <johannes.berg@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Luca Coelho <luciano.coelho@intel.com>,
        Intel Linux Wireless <linuxwifi@intel.com>,
        Jouni Malinen <j@w1.fi>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Ganapathi Bhat <ganapathi.bhat@nxp.com>,
        Xinming Hu <huxinming820@gmail.com>,
        libertas-dev@lists.infradead.org,
        Pascal Terjan <pterjan@google.com>,
        Ping-Ke Shih <pkshih@realtek.com>
Subject: [patch 25/35] net: brcmfmac: Use netif_rx_any_context().
References: <20200927194846.045411263@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

The usage of in_interrupt() in non-core code is phased out. Ideally the
information of the calling context should be passed by the callers or the
functions be split as appropriate.

brcmfmac uses in_interupt() to select the netif_rx*() variant which matches
the calling context. The attempt to consolidate the code by passing an
arguemnt or by distangling it failed due lack of knowledge about this
driver and because the call chains are convoluted and hard to follow.

As a stop gap use netif_rx_any_context() which invokes the correct code
path depending on context which confines the usage of in_interrupt() to
core code.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Franky Lin <franky.lin@broadcom.com>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com
Cc: brcm80211-dev-list@cypress.com
Cc: netdev@vger.kernel.org

---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -418,14 +418,7 @@ void brcmf_netif_rx(struct brcmf_if *ifp
 	ifp->ndev->stats.rx_packets++;
 
 	brcmf_dbg(DATA, "rx proto=0x%X\n", ntohs(skb->protocol));
-	if (in_interrupt())
-		netif_rx(skb);
-	else
-		/* If the receive is not processed inside an ISR,
-		 * the softirqd must be woken explicitly to service
-		 * the NET_RX_SOFTIRQ.  This is handled by netif_rx_ni().
-		 */
-		netif_rx_ni(skb);
+	netif_rx_any_context(skb);
 }
 
 void brcmf_netif_mon_rx(struct brcmf_if *ifp, struct sk_buff *skb)

