Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998FE27D914
	for <lists+linux-doc@lfdr.de>; Tue, 29 Sep 2020 22:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgI2Uko (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Sep 2020 16:40:44 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:48614 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbgI2Ufp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 16:35:45 -0400
Message-Id: <20200929203459.759549699@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601411742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=9gno+yzKOdLMuJ9Xz4faTO6ILG5b04BLHvO+JheY75g=;
        b=yiY42gneBjiDDqh0Y79DvBn3YqjkNpXchXD4e5CBIFn2QkSAqgIMEPREJCO8X9Kq3D176D
        jFnHDZKvazk50QBJBdOtZSUcTqLU9VBRYM+WRqpysnukd6P6CkcgWCXDciWZ9Fu2SK0n2r
        4Pcp0StXIFuSxY2o0/TgPe7hShkmc6K3lo6O03bsnZiTIIOco6NIHJIptMdz84OB67sc99
        nLxCK/dvG4VTSg9AmFz2HwFCpVu/l5STefw3m1/13gKhUEDnfk12sH5lrgfP7r8oVQf5RH
        jQYhL5BVFTVjpLC6jnX5mj7/YIRaOAnJZAHVe6CAfHIiVAcZ+F6Ejyd1lc9AoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601411742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=9gno+yzKOdLMuJ9Xz4faTO6ILG5b04BLHvO+JheY75g=;
        b=3/6QNokwXiifx/c6QT6thjfpjkax60IAdQdnv3k6ZHYGzaNff0p7Z8rVmKlXH8pDtcCSsC
        4g3HKTgLr4tZQcBA==
Date:   Tue, 29 Sep 2020 22:25:12 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Christian Benvenuti <benve@cisco.com>,
        Govindarajulu Varadarajan <_govind@gmx.com>,
        Dave Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
        Ulrich Kunitz <kune@deine-taler.de>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        Wright Feng <wright.feng@cypress.com>,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com,
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
Subject: [patch V2 03/36] net: Add netif_rx_any_context()
References: <20200929202509.673358734@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Quite some drivers make conditional decisions based on in_interrupt() to
invoke either netif_rx() or netif_rx_ni().

Conditionals based on in_interrupt() or other variants of preempt count
checks in drivers should not exist for various reasons and Linus clearly
requested to either split the code pathes or pass an argument to the
common functions which provides the context.

This is obviously the correct solution, but for some of the affected
drivers this needs a major rewrite due to their convoluted structure.

As in_interrupt() usage in drivers needs to be phased out, provide
netif_rx_any_context() as a stop gap for these drivers.

This confines the in_interrupt() conditional to core code which in turn
allows to remove the access to this check for driver code and provides one
central place to do further modifications once the driver maze is cleaned
up.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/netdevice.h |    1 +
 net/core/dev.c            |   15 +++++++++++++++
 2 files changed, 16 insertions(+)

--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3785,6 +3785,7 @@ void generic_xdp_tx(struct sk_buff *skb,
 int do_xdp_generic(struct bpf_prog *xdp_prog, struct sk_buff *skb);
 int netif_rx(struct sk_buff *skb);
 int netif_rx_ni(struct sk_buff *skb);
+int netif_rx_any_context(struct sk_buff *skb);
 int netif_receive_skb(struct sk_buff *skb);
 int netif_receive_skb_core(struct sk_buff *skb);
 void netif_receive_skb_list(struct list_head *head);
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4841,6 +4841,21 @@ int netif_rx_ni(struct sk_buff *skb)
 }
 EXPORT_SYMBOL(netif_rx_ni);
 
+int netif_rx_any_context(struct sk_buff *skb)
+{
+	/*
+	 * If invoked from contexts which do not invoke bottom half
+	 * processing either at return from interrupt or when softrqs are
+	 * reenabled, use netif_rx_ni() which invokes bottomhalf processing
+	 * directly.
+	 */
+	if (in_interrupt())
+		return netif_rx(skb);
+	else
+		return netif_rx_ni(skb);
+}
+EXPORT_SYMBOL(netif_rx_any_context);
+
 static __latent_entropy void net_tx_action(struct softirq_action *h)
 {
 	struct softnet_data *sd = this_cpu_ptr(&softnet_data);

