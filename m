Return-Path: <linux-doc+bounces-8661-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1D84DDCA
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 11:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7961C27F28
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 10:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2076D74E0C;
	Thu,  8 Feb 2024 10:03:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from davidv.dev (mail.davidv.dev [78.46.233.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D076DCFB
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.233.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386596; cv=none; b=FWOQviANTpHbPOu6eoZOOVJsbnBNYAciKc0AxACTPx2jrIA3rAXx1MRexgVc+HQJzwTSnNc06vIQB/D01WnyQ1z7B2Bdmig4ivD020cuzDn/GCF27eAb0d9XOmYm+3khANPdAOQtNnXv89XkFlhLWkO/5Pi65dFN6OmYBnvpSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386596; c=relaxed/simple;
	bh=WTA+UDK0EaxEUPjb7YY9WTShoJNOU9Pzb4SP9T7Km8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K5AzopYuQ9727OcUj4dTLTjjQ0Q0T6z9GkHoWr7qdq0ABsEP0I6tTV+jPO0GwldARmComzIy3Ft4MOxiJi/u78R7eB7ibOha9qJHpU3E67/cMu89Zoxxlk5ofJJ5PSurWe5iFGilz9LWrsGwzdKEubjg7sYoBeTU25k5bNvJpXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidv.dev; spf=pass smtp.mailfrom=davidv.dev; arc=none smtp.client-ip=78.46.233.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidv.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidv.dev
Received: from framework.labs
	by mail.davidv.dev (chasquid) with ESMTPSA
	tls TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
	(over submission+TLS, TLS-1.2, envelope from "david@davidv.dev")
	; Thu, 08 Feb 2024 11:03:11 +0100
From: David Ventura <david@davidv.dev>
To: david@davidv.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 2/2] net: Change default delay on IP autoconfig to 0ms
Date: Thu,  8 Feb 2024 11:03:04 +0100
Message-Id: <20240208100304.253337-1-david@davidv.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208093722.246930-1-david@davidv.dev>
References: <20240208093722.246930-1-david@davidv.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the default settle time from 10ms to 0ms, based on previous discussions (
https://lore.kernel.org/netdev/1305696161-18277-1-git-send-email-micha@neli.hopto.org/t/
https://lore.kernel.org/netdev/580001e3-17ef-4f24-8fd8-bc14110e874e@lunn.ch/
) ARP and DHCP retries are expected to handle any lost transmissions.

This patch depends on 1f0aa0c947eeb4edb60add141a5bc2309f2dc8dd ("
net: make driver settling time configurable").

Signed-off-by: David Ventura <david@davidv.dev>
---
 Documentation/admin-guide/nfs/nfsroot.rst | 2 +-
 net/ipv4/ipconfig.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index f26f7a342af6..fce610a4ec54 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -225,7 +225,7 @@ ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns
 
 ip.dev_wait_ms=<value>
   Set the number of milliseconds to delay after opening the network device
-  which will be autoconfigured. Defaults to 10 milliseconds.
+  which will be autoconfigured. Defaults to 0 milliseconds.
 
 nfsrootdebug
   This parameter enables debugging messages to appear in the kernel
diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index cbf35163b973..8b7d08649b09 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -99,7 +99,7 @@
 
 /* Wait for carrier timeout default in seconds */
 static unsigned int carrier_timeout = 120;
-static unsigned int dev_wait_ms = 10;
+static unsigned int dev_wait_ms = 0;
 
 /*
  * Public IP configuration
-- 
2.39.2


