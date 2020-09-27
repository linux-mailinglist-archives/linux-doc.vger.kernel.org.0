Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0693327A3C0
	for <lists+linux-doc@lfdr.de>; Sun, 27 Sep 2020 22:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgI0UA5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 27 Sep 2020 16:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgI0T5Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Sep 2020 15:57:24 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD8DC0613D4
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2020 12:57:24 -0700 (PDT)
Message-Id: <20200927194921.137019811@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601236641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=8s7EX2UsQWBhynqUTDd/u8Iv0n6j36sPbMtmCyDJsXY=;
        b=lzOEqmioF//DgrijcaJYSRsf+YV01CsScdcw9tX79nttFriGA1I6hu2IkEtbuhvmNFVtEm
        C83RACdG8DHmRN6Otr4E0ijc94wqzv5/KkGesIsSnKU9m9raro0j7Rx4W4yzzr7s9nUUxL
        s8DcnuH9LuUX0ZQyqOrU5YY807/jTAloRukEG7CL+w/8udtzFa0IPSA0vdsFE4pDs2F1Lh
        FnBI7fewv/INchgNbCQ/5kWUZZBBUFiTVmtyduitqW2P96GVxQAvbmQCBPBeIsgGqDstEe
        +A/mlgwlVnexXesZzRSa5TVlhQG6vtEFGHYhUXfpbzGqC9YtNUJ2Z9WnFIk/aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601236641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=8s7EX2UsQWBhynqUTDd/u8Iv0n6j36sPbMtmCyDJsXY=;
        b=wUWF39OM0ztNTR2+gM6mKrXzVKN6S4B2BfM4TaXs0ECeVzREBTC4rxvaUxiISx1zOW+6zr
        65wFpaA5Hiqb5GBQ==
Date:   Sun, 27 Sep 2020 21:48:59 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
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
Subject: [patch 13/35] net: mdiobus: Remove WARN_ON_ONCE(in_interrupt())
References: <20200927194846.045411263@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

in_interrupt() is ill defined and does not provide what the name
suggests. The usage especially in driver code is deprecated and a tree wide
effort to clean up and consolidate the (ab)usage of in_interrupt() and
related checks is happening.

In this case the check covers only parts of the contexts in which these
functions cannot be called. It fails to detect preemption or interrupt
disabled invocations.

As the functions which contain these warnings invoke mutex_lock() which
contains a broad variety of checks (always enabled or debug option
dependent) and therefore covers all invalid conditions already, there is no
point in having inconsistent warnings in those drivers. The conditional
return is not really valuable in practice either.

Just remove them.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org

---
 drivers/net/phy/mdio_bus.c |   15 ---------------
 1 file changed, 15 deletions(-)

--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -825,9 +825,6 @@ int mdiobus_read_nested(struct mii_bus *
 {
 	int retval;
 
-	if (WARN_ON_ONCE(in_interrupt()))
-		return -EINVAL;
-
 	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
 	retval = __mdiobus_read(bus, addr, regnum);
 	mutex_unlock(&bus->mdio_lock);
@@ -850,9 +847,6 @@ int mdiobus_read(struct mii_bus *bus, in
 {
 	int retval;
 
-	if (WARN_ON_ONCE(in_interrupt()))
-		return -EINVAL;
-
 	mutex_lock(&bus->mdio_lock);
 	retval = __mdiobus_read(bus, addr, regnum);
 	mutex_unlock(&bus->mdio_lock);
@@ -879,9 +873,6 @@ int mdiobus_write_nested(struct mii_bus
 {
 	int err;
 
-	if (WARN_ON_ONCE(in_interrupt()))
-		return -EINVAL;
-
 	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
 	err = __mdiobus_write(bus, addr, regnum, val);
 	mutex_unlock(&bus->mdio_lock);
@@ -905,9 +896,6 @@ int mdiobus_write(struct mii_bus *bus, i
 {
 	int err;
 
-	if (WARN_ON_ONCE(in_interrupt()))
-		return -EINVAL;
-
 	mutex_lock(&bus->mdio_lock);
 	err = __mdiobus_write(bus, addr, regnum, val);
 	mutex_unlock(&bus->mdio_lock);
@@ -929,9 +917,6 @@ int mdiobus_modify(struct mii_bus *bus,
 {
 	int err;
 
-	if (WARN_ON_ONCE(in_interrupt()))
-		return -EINVAL;
-
 	mutex_lock(&bus->mdio_lock);
 	err = __mdiobus_modify_changed(bus, addr, regnum, mask, set);
 	mutex_unlock(&bus->mdio_lock);

