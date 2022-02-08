Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEF24AD69D
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 12:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349443AbiBHL1H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Feb 2022 06:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355721AbiBHJwr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 04:52:47 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBB8C03FEC1;
        Tue,  8 Feb 2022 01:52:47 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 4EEA8202A2; Tue,  8 Feb 2022 17:46:34 +0800 (AWST)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     netdev@vger.kernel.org
Cc:     Matt Johnston <matt@codeconstruct.com.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org
Subject: [PATCH net-next 3/5] mctp: Add helper for address match checking
Date:   Tue,  8 Feb 2022 17:46:15 +0800
Message-Id: <20220208094617.3675511-4-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208094617.3675511-1-jk@codeconstruct.com.au>
References: <20220208094617.3675511-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, we have a couple of paths that check that an EID matches, or
the match value is MCTP_ADDR_ANY.

Rather than open coding this, add a little helper.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 include/net/mctp.h | 5 +++++
 net/mctp/route.c   | 8 +++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/net/mctp.h b/include/net/mctp.h
index 7e35ec79b909..706d329dd8e8 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -45,6 +45,11 @@ static inline bool mctp_address_ok(mctp_eid_t eid)
 	return eid >= 8 && eid < 255;
 }
 
+static inline bool mctp_address_matches(mctp_eid_t match, mctp_eid_t eid)
+{
+	return match == eid || match == MCTP_ADDR_ANY;
+}
+
 static inline struct mctp_hdr *mctp_hdr(struct sk_buff *skb)
 {
 	return (struct mctp_hdr *)skb_network_header(skb);
diff --git a/net/mctp/route.c b/net/mctp/route.c
index 8d9f4ff3e285..654467a7aeae 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -64,8 +64,7 @@ static struct mctp_sock *mctp_lookup_bind(struct net *net, struct sk_buff *skb)
 		if (msk->bind_type != type)
 			continue;
 
-		if (msk->bind_addr != MCTP_ADDR_ANY &&
-		    msk->bind_addr != mh->dest)
+		if (!mctp_address_matches(msk->bind_addr, mh->dest))
 			continue;
 
 		return msk;
@@ -616,9 +615,8 @@ static struct mctp_sk_key *mctp_alloc_local_tag(struct mctp_sock *msk,
 		if (tmp->tag & MCTP_HDR_FLAG_TO)
 			continue;
 
-		if (!((tmp->peer_addr == daddr ||
-		       tmp->peer_addr == MCTP_ADDR_ANY) &&
-		       tmp->local_addr == saddr))
+		if (!(mctp_address_matches(tmp->peer_addr, daddr) &&
+		      tmp->local_addr == saddr))
 			continue;
 
 		spin_lock(&tmp->lock);
-- 
2.34.1

