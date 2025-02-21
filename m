Return-Path: <linux-doc+bounces-38869-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C79A3EA01
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 02:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 647DB7A93C4
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 01:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF791AD3E1;
	Fri, 21 Feb 2025 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QCAX5AbV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACC70821
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740101374; cv=none; b=Pvl7ZtCQQg1cdTn7vxzV/3ps2OGMSM9RwfAYs9EwVDKIzoKTBnyGqSn5TTj9v3NIugnj5wv8WLWJVdROdAXIRG3pOIX5HcF0phcsgQ719vYgWDKxl0AMtCj/2jn5JVRdHH2fu2xkbVuBQowljLgtV5rosNq0g3CINjp8ZtOr/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740101374; c=relaxed/simple;
	bh=ndXTYWnD0dGmJ/CTps1hj3PgFz/Squ4fkXCPkynjP7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjeaHvkZIl2DaXyxNJ1/wfE8PCks1w0J3G3/OUdBfllh/ScJK4SsSNE6ws5sPGjfleQZuwIflvPgY+tbwDxueixUul6Y5MUBzpeSE542iHv+fjvcuIOZhRqRV2oIR8HwrauTBr4h2wcVsg0GMbM3h9N9UVMYp8cWB8FyA6jNA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QCAX5AbV; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6e65a00556aso13032956d6.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740101372; x=1740706172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkZ3MuwsfFvPuUcCGF9IbI3/TlNqWSAvIHqD4D2Ewrs=;
        b=QCAX5AbVmCAq7LShtgcnYhPPTaEqE3oI43y+O3PtT1qedJtp530nQXh6T6uXjOv7lD
         WNtr3CY6F2FwOzfQcNeW/e4kd3sKQAViq/kRSYDn6y+IfK0WKPkPsRWWoLoUHzutuKzq
         lL68kg4xaRb98K/uk0ge3WUEsNwQRsb/VwiuY/CvlLKWhnOczrEZR2GH5V93xIRxpxB5
         h6tty09nixLbH28p5XqDyQPL+PAHX1AM5NoTxdmnfp1r5S/PNjFtEyWZuf3gXaaW3o5Y
         TMHOPgKFHv/4tpqo4ns17bYabbVGZBwJFgAMlCwbwdB5O5faFEJ4Qk20lRwD41TLqTfh
         cVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101372; x=1740706172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkZ3MuwsfFvPuUcCGF9IbI3/TlNqWSAvIHqD4D2Ewrs=;
        b=i7CJsGBi9GFlu5mhXocF6Rgng10Ia13IaJvpxBMBfIAs6YKMBjifp90ijvSflw1KRF
         u6HRD6xRq1pJGjwhfMtx84DD2CUHj15odf2YG7VBX0Kso19SsXvMovrzv8iiJA752hHM
         rtBTumB7zup+P5iGeXwrFV2kua0bKomzXhnwWT3HMky3hYrRp9NvKtxram+JZk4+9ZIA
         ZRAn//YGrt95kwZ+LYvFLgFW+vO44MlOJoBczR3zsAGuHlV8nA959jhHG7+0FZvTAf7b
         0oKgSiQZur3T6PSQW0Ns9TEnWMaat3gRCrUxPDY+SgPPV2PYN+dijoi6wBq4a4NWPovM
         LCdg==
X-Forwarded-Encrypted: i=1; AJvYcCU1C9xROaFT8qWSjM16vQBRfKFW9VSfrgeFWg9WUULTNabbQ1WAkbN2QE0i4nTpY4EFYlgrVxw174k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaT+42CTaPXcZb6wjsQ8ipMYeIlntMLrfUS577wqo+XoqjmYm
	C+Or1S1LKcOGV3tmoMv7OelOo12Q7ZCDZHf+HpMaW2lscfVY1EdRZcR2J4QSDiaMjX1E/HaBEsz
	/ctT3Jz4swBznML7M4l1GhWYF2+fdL2fhti+wVMOfSPCnwkh3
X-Gm-Gg: ASbGncvPUGdF3jNb9UIOIGoaL75/54BC+LrTonUS7dsAUWxWDgu1s4U7yKv9ropN04z
	Frh19UORfpBhDP+KLHoOXDPHLgLPzgti1byRFmaEBbSIQ/EY6V7/W90WChDl7+Zk4gSf/Q1OLoa
	0VZItddHDBw22g/Famp9DdJtRZ6LcIWlQogFwCuBy6tIfRqno6NFDZuMbMgvJAF6GWqDaHfV0FN
	03uI73S3/pXmR4UK7YngQIFZiyOz3xKzW05C3dIZJ3G/pKdAr+AgLQopwj0dRWigCZ7cFVsk6tZ
	09lk0SMEFpOvCxwuG+leFtWIzr+JyGlyPjk=
X-Google-Smtp-Source: AGHT+IEa3vOQr99biY5aI/mCrtL5nOIl2f7qIkNP4WURSdEvcIztDurG/2JnI2tlgCrBA+xw2s3dSrIaNNsw
X-Received: by 2002:ad4:5fcc:0:b0:6e6:6a93:10fd with SMTP id 6a1803df08f44-6e6aea1b96amr21883416d6.45.1740101371745;
        Thu, 20 Feb 2025 17:29:31 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6e65d73479fsm6496886d6.16.2025.02.20.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:29:31 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 86C90340216;
	Thu, 20 Feb 2025 18:29:30 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 7B3CCE55F29; Thu, 20 Feb 2025 18:29:29 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Thu, 20 Feb 2025 18:29:21 -0700
Subject: [PATCH net-next v5 2/2] netconsole: allow selection of egress
 interface via MAC address
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-netconsole-v5-2-4aeafa71debf@purestorage.com>
References: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
In-Reply-To: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Currently, netconsole has two methods of configuration - module
parameter and configfs. The former interface allows for netconsole
activation earlier during boot (by specifying the module parameter on
the kernel command line), so it is preferred for debugging issues which
arise before userspace is up/the configfs interface can be used. The
module parameter syntax requires specifying the egress interface name.
This requirement makes it hard to use for a couple reasons:
- The egress interface name can be hard or impossible to predict. For
  example, installing a new network card in a system can change the
  interface names assigned by the kernel.
- When constructing the module parameter, one may have trouble
  determining the original (kernel-assigned) name of the interface
  (which is the name that should be given to netconsole) if some stable
  interface naming scheme is in effect. A human can usually look at
  kernel logs to determine the original name, but this is very painful
  if automation is constructing the parameter.

For these reasons, allow selection of the egress interface via MAC
address when configuring netconsole using the module parameter. Update
the netconsole documentation with an example of the new syntax.
Selection of egress interface by MAC address via configfs is far less
interesting (since when this interface can be used, one should be able
to easily convert between MAC address and interface name), so it is left
unimplemented.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Tested-by: Breno Leitao <leitao@debian.org>
---
 Documentation/networking/netconsole.rst |  6 +++-
 include/linux/netpoll.h                 |  6 ++++
 net/core/netpoll.c                      | 51 +++++++++++++++++++++++++--------
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 84803c59968a3237012fab821f432eb531aba45c..4b0f32ed5c635dbce594bc09e5d25c7654350779 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -47,7 +47,7 @@ following format::
 	r             if present, prepend kernel version (release) to the message
 	src-port      source for UDP packets (defaults to 6665)
 	src-ip        source IP to use (interface address)
-	dev           network interface (eth0)
+	dev           network interface name (eth0) or MAC address
 	tgt-port      port for logging agent (6666)
 	tgt-ip        IP address for logging agent
 	tgt-macaddr   ethernet MAC address for logging agent (broadcast)
@@ -64,6 +64,10 @@ or using IPv6::
 
  insmod netconsole netconsole=@/,@fd00:1:2:3::1/
 
+or using a MAC address to select the egress interface::
+
+   linux netconsole=4444@10.0.0.1/22:33:44:55:66:77,9353@10.0.0.2/12:34:56:78:9a:bc
+
 It also supports logging to multiple remote agents by specifying
 parameters for the multiple agents separated by semicolons and the
 complete string enclosed in "quotes", thusly::
diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index f91e50a76efd4b016381c632456397eea1ea877f..1ade65b59be49cfdcf86ed6e938287b949aa9f58 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -25,7 +25,13 @@ union inet_addr {
 struct netpoll {
 	struct net_device *dev;
 	netdevice_tracker dev_tracker;
+	/*
+	 * Either dev_name or dev_mac can be used to specify the local
+	 * interface - dev_name is used if it is a nonempty string, else
+	 * dev_mac is used.
+	 */
 	char dev_name[IFNAMSIZ];
+	u8 dev_mac[ETH_ALEN];
 	const char *name;
 
 	union inet_addr local_ip, remote_ip;
diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index 62b4041aae1ae8c7dc47c89fb40b14bbd4ad0e0e..64c08b845c92bb2a2165de6dfba95dede2b581db 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -501,7 +501,8 @@ void netpoll_print_options(struct netpoll *np)
 		np_info(np, "local IPv6 address %pI6c\n", &np->local_ip.in6);
 	else
 		np_info(np, "local IPv4 address %pI4\n", &np->local_ip.ip);
-	np_info(np, "interface '%s'\n", np->dev_name);
+	np_info(np, "interface name '%s'\n", np->dev_name);
+	np_info(np, "local ethernet address '%pM'\n", np->dev_mac);
 	np_info(np, "remote port %d\n", np->remote_port);
 	if (np->ipv6)
 		np_info(np, "remote IPv6 address %pI6c\n", &np->remote_ip.in6);
@@ -570,11 +571,18 @@ int netpoll_parse_options(struct netpoll *np, char *opt)
 	cur++;
 
 	if (*cur != ',') {
-		/* parse out dev name */
+		/* parse out dev_name or dev_mac */
 		if ((delim = strchr(cur, ',')) == NULL)
 			goto parse_failed;
 		*delim = 0;
-		strscpy(np->dev_name, cur, sizeof(np->dev_name));
+
+		np->dev_name[0] = '\0';
+		eth_broadcast_addr(np->dev_mac);
+		if (!strchr(cur, ':'))
+			strscpy(np->dev_name, cur, sizeof(np->dev_name));
+		else if (!mac_pton(cur, np->dev_mac))
+			goto parse_failed;
+
 		cur = delim;
 	}
 	cur++;
@@ -679,27 +687,45 @@ int __netpoll_setup(struct netpoll *np, struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(__netpoll_setup);
 
+/*
+ * Returns a pointer to a string representation of the identifier used
+ * to select the egress interface for the given netpoll instance. buf
+ * must be a buffer of length at least MAC_ADDR_STR_LEN + 1.
+ */
+static char *egress_dev(struct netpoll *np, char *buf)
+{
+	if (np->dev_name[0])
+		return np->dev_name;
+
+	snprintf(buf, MAC_ADDR_STR_LEN, "%pM", np->dev_mac);
+	return buf;
+}
+
 int netpoll_setup(struct netpoll *np)
 {
+	struct net *net = current->nsproxy->net_ns;
+	char buf[MAC_ADDR_STR_LEN + 1];
 	struct net_device *ndev = NULL;
 	bool ip_overwritten = false;
 	struct in_device *in_dev;
 	int err;
 
 	rtnl_lock();
-	if (np->dev_name[0]) {
-		struct net *net = current->nsproxy->net_ns;
+	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);
-	}
+	else if (is_valid_ether_addr(np->dev_mac))
+		ndev = dev_getbyhwaddr(net, ARPHRD_ETHER, np->dev_mac);
+
 	if (!ndev) {
-		np_err(np, "%s doesn't exist, aborting\n", np->dev_name);
+		np_err(np, "%s doesn't exist, aborting\n", egress_dev(np, buf));
 		err = -ENODEV;
 		goto unlock;
 	}
 	netdev_hold(ndev, &np->dev_tracker, GFP_KERNEL);
 
 	if (netdev_master_upper_dev_get(ndev)) {
-		np_err(np, "%s is a slave device, aborting\n", np->dev_name);
+		np_err(np, "%s is a slave device, aborting\n",
+		       egress_dev(np, buf));
 		err = -EBUSY;
 		goto put;
 	}
@@ -707,7 +733,8 @@ int netpoll_setup(struct netpoll *np)
 	if (!netif_running(ndev)) {
 		unsigned long atmost;
 
-		np_info(np, "device %s not up yet, forcing it\n", np->dev_name);
+		np_info(np, "device %s not up yet, forcing it\n",
+			egress_dev(np, buf));
 
 		err = dev_open(ndev, NULL);
 
@@ -741,7 +768,7 @@ int netpoll_setup(struct netpoll *np)
 			if (!ifa) {
 put_noaddr:
 				np_err(np, "no IP address for %s, aborting\n",
-				       np->dev_name);
+				       egress_dev(np, buf));
 				err = -EDESTADDRREQ;
 				goto put;
 			}
@@ -772,13 +799,13 @@ int netpoll_setup(struct netpoll *np)
 			}
 			if (err) {
 				np_err(np, "no IPv6 address for %s, aborting\n",
-				       np->dev_name);
+				       egress_dev(np, buf));
 				goto put;
 			} else
 				np_info(np, "local IPv6 %pI6c\n", &np->local_ip.in6);
 #else
 			np_err(np, "IPv6 is not supported %s, aborting\n",
-			       np->dev_name);
+			       egress_dev(np, buf));
 			err = -EINVAL;
 			goto put;
 #endif

-- 
2.34.1


