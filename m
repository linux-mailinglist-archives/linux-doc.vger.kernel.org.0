Return-Path: <linux-doc+bounces-85295-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB2nLpEb82kLxQEAu9opvQ
	(envelope-from <linux-doc+bounces-85295-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 11:06:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA09949F9B6
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 11:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 535243002D15
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 09:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B011A6810;
	Thu, 30 Apr 2026 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FpOLyU0m"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED33750D6;
	Thu, 30 Apr 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539975; cv=none; b=CThae1wLpe5D6FIfCh7aW9PvvS6E8UIfP7nd8JuY/UMR7QdDqJKtXeEw4JXPaN5ORKqaoEitUZfv7IUPP0/xTmCXKPCpvFECSD91Xar9hqrtKYEyfBWoiKF+VINjsqbNzjL5imv8vnMKJQk5SxbiMzVf+UXnDNU5HNW2Klfc8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539975; c=relaxed/simple;
	bh=O0kNZNME6liz/PDiFhx17G1oocdPgEZotIhQ2QvF/Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FORT/LHdRx365b3X/wIILH0pzGYytmguOg90cbi2HmvTcHSkiDi7L9xKcZN/9oBXJOh5Lp4EiADBbK+TwjIIYfUGwhsJuoSsJi5ZLkgWashC0k3AMjksW4Up0BP8WFWhE5S2XdGioAB8yh+tkm5PWp+uyE9wDVu84FCxB8osxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FpOLyU0m; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777539972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psV3t89J4TYPxkXy1/CDffDJ8IP5u3Jv6+y4DGwPsJ4=;
	b=FpOLyU0mpZPwFkcF6k1NUo3Uc6UvCelLgc/8buJxDcA/i8iclap2bvE7G1lROhJ+qO3ItZ
	hM5eIImbNKg5EpmZMVix/ZWABNMyvD8d2/gnrUQWT/8tl1+kuRlb8yvNyrB/9nLpwD0s1U
	PfE1S+m/zlP1wtYgB9mYVE6+4ZuVWCQ=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH net-next 3/3] docs: update ppp_generic.rst for API changes
Date: Thu, 30 Apr 2026 17:05:23 +0800
Message-ID: <20260430090532.244758-3-qingfang.deng@linux.dev>
In-Reply-To: <20260430090532.244758-1-qingfang.deng@linux.dev>
References: <20260430090532.244758-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: AA09949F9B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85295-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Document the new ppp_channel_conf struct and ppp_channel lifecycle
management changes.

Assisted-by: Gemini:gemini-3-flash
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 Documentation/networking/ppp_generic.rst | 33 ++++++++++--------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/Documentation/networking/ppp_generic.rst b/Documentation/networking/ppp_generic.rst
index 5a10abce5964..8d63f997fb3f 100644
--- a/Documentation/networking/ppp_generic.rst
+++ b/Documentation/networking/ppp_generic.rst
@@ -124,18 +124,19 @@ presented to the start_xmit() function contain only the 2-byte
 protocol number and the data, and the skbuffs presented to ppp_input()
 must be in the same format.
 
-The channel must provide an instance of a ppp_channel struct to
-represent the channel.  The channel is free to use the ``private`` field
-however it wishes.  The channel should initialize the ``mtu`` and
-``hdrlen`` fields before calling ppp_register_channel() and not change
-them until after ppp_unregister_channel() returns.  The ``mtu`` field
-represents the maximum size of the data part of the PPP frames, that
-is, it does not include the 2-byte protocol number.
+The channel must provide an instance of a ppp_channel_conf struct to
+describe the channel during registration.  The generic layer will
+allocate a ppp_channel struct and return a pointer to it.  The
+ppp_channel struct is opaque to the channel driver.  The ``mtu`` field
+(if multilink is enabled) represents the maximum size of the data part
+of the PPP frames, that is, it does not include the 2-byte protocol
+number.  ppp_channel_update_mtu() can be called by the channel driver
+to update the ``mtu`` field once LCP MRU negotiation is complete.
 
 If the channel needs some headroom in the skbuffs presented to it for
 transmission (i.e., some space free in the skbuff data area before the
 start of the PPP frame), it should set the ``hdrlen`` field of the
-ppp_channel struct to the amount of headroom required.  The generic
+ppp_channel_conf struct to the amount of headroom required.  The generic
 PPP layer will attempt to provide that much headroom but the channel
 should still check if there is sufficient headroom and copy the skbuff
 if there isn't.
@@ -199,20 +200,12 @@ The PPP generic layer has been designed to be SMP-safe.  Locks are
 used around accesses to the internal data structures where necessary
 to ensure their integrity.  As part of this, the generic layer
 requires that the channels adhere to certain requirements and in turn
-provides certain guarantees to the channels.  Essentially the channels
-are required to provide the appropriate locking on the ppp_channel
-structures that form the basis of the communication between the
-channel and the generic layer.  This is because the channel provides
-the storage for the ppp_channel structure, and so the channel is
-required to provide the guarantee that this storage exists and is
-valid at the appropriate times.
+provides certain guarantees to the channels.  The generic layer manages
+the ppp_channel object, ensuring it exists and is valid while the
+channel is registered.
 
 The generic layer requires these guarantees from the channel:
 
-* The ppp_channel object must exist from the time that
-  ppp_register_channel() is called until after the call to
-  ppp_unregister_channel() returns.
-
 * No thread may be in a call to any of ppp_input(), ppp_input_error(),
   ppp_output_wakeup(), ppp_channel_index() or ppp_unit_number() for a
   channel at the time that ppp_unregister_channel() is called for that
@@ -453,4 +446,4 @@ an interface unit are:
   fragments is disabled.  This ioctl is only available if the
   CONFIG_PPP_MULTILINK option is selected.
 
-Last modified: 7-feb-2002
+Last modified: 16-apr-2026
-- 
2.43.0


