Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37071EFCB4
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2020 17:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgFEPlk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Jun 2020 11:41:40 -0400
Received: from smtp.asem.it ([151.1.184.197]:51321 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgFEPlk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Jun 2020 11:41:40 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000300867.MSG 
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2020 17:41:29 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Jun
 2020 17:41:28 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Fri, 5 Jun 2020 17:41:28 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Johannes Berg <johannes@sipsolutions.net>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Johan Hovold <johan@kernel.org>,
        Saurav Girepunje <saurav.girepunje@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Luca Coelho <luciano.coelho@intel.com>
CC:     <linux-wireless@vger.kernel.org>, <b43-dev@lists.infradead.org>,
        Intel Linux Wireless <linuxwifi@intel.com>,
        <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/9] doc: networking: wireless: fix wiki website url
Date:   Fri, 5 Jun 2020 17:41:04 +0200
Message-ID: <20200605154112.16277-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605154112.16277-1-f.suligoi@asem.it>
References: <20200605154112.16277-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090215.5EDA67A8.0074,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the files:

- regulatory.rst
- mac80211-injection.rst

the wiki url is still the old "wireless.kernel.org"
instead of the new "wireless.wiki.kernel.org"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/networking/mac80211-injection.rst | 2 +-
 Documentation/networking/regulatory.rst         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/mac80211-injection.rst b/Documentation/networking/mac80211-injection.rst
index be65f886ff1f..63ba6611fdff 100644
--- a/Documentation/networking/mac80211-injection.rst
+++ b/Documentation/networking/mac80211-injection.rst
@@ -101,6 +101,6 @@ interface), along the following lines:::
 
 You can also find a link to a complete inject application here:
 
-http://wireless.kernel.org/en/users/Documentation/packetspammer
+https://wireless.wiki.kernel.org/en/users/Documentation/packetspammer
 
 Andy Green <andy@warmcat.com>
diff --git a/Documentation/networking/regulatory.rst b/Documentation/networking/regulatory.rst
index 8701b91e81ee..16782a95b74a 100644
--- a/Documentation/networking/regulatory.rst
+++ b/Documentation/networking/regulatory.rst
@@ -9,7 +9,7 @@ regulatory infrastructure works.
 
 More up to date information can be obtained at the project's web page:
 
-http://wireless.kernel.org/en/developers/Regulatory
+https://wireless.wiki.kernel.org/en/developers/Regulatory
 
 Keeping regulatory domains in userspace
 ---------------------------------------
@@ -37,7 +37,7 @@ expected regulatory domains will be respected by the kernel.
 A currently available userspace agent which can accomplish this
 is CRDA - central regulatory domain agent. Its documented here:
 
-http://wireless.kernel.org/en/developers/Regulatory/CRDA
+https://wireless.wiki.kernel.org/en/developers/Regulatory/CRDA
 
 Essentially the kernel will send a udev event when it knows
 it needs a new regulatory domain. A udev rule can be put in place
@@ -58,7 +58,7 @@ Who asks for regulatory domains?
 
 Users can use iw:
 
-http://wireless.kernel.org/en/users/Documentation/iw
+https://wireless.wiki.kernel.org/en/users/Documentation/iw
 
 An example::
 
-- 
2.17.1

