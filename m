Return-Path: <linux-doc+bounces-4854-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8680FA0E
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 23:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C67BB21061
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 22:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735DF64724;
	Tue, 12 Dec 2023 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dunyrwLc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D356BB3;
	Tue, 12 Dec 2023 14:16:36 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33638e7f71aso43319f8f.1;
        Tue, 12 Dec 2023 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702419395; x=1703024195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu7zuUOhyRqM3tfmUwz0DGtPsLVtk8tuiEIzfS/Rvv4=;
        b=dunyrwLcRsVSvhMlZbBAPTk9j/LdD6fcBk/MN+0t7olIDHwAfXWuDkDlEx8M0OO6Ie
         NHg/L/DR34Evpki60NAnYYQWZQ1PiPsHJtp7QNgZGzhS2cI//NF+/u/bE3ihgQoWM2bj
         KYVzO3KKeoC77rIo4OSIss4GXOPCD4mTJ4dE3hlTMkDTYWvC+zUUtZLk+ZOD+aKby972
         trt171WH6/MZomvz++nMSxvI+Kk4oghW217TDsojGCsgFm5/IFZGgXKulhF7JWCXs9Nd
         mPh6+UMTt5YZChVxypBAd2OI+ci8SVrC1SZnfciUVh1WPHJ/qJRwRpq+Smft4yJkNS4J
         Qv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702419395; x=1703024195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu7zuUOhyRqM3tfmUwz0DGtPsLVtk8tuiEIzfS/Rvv4=;
        b=JGkIKiQGRuTPQOJ7TPBq6+y/kyz4A8Q+WMXRkKlR/1k0/2X0ZRjjjiinRJOdHp7ZiY
         TvcNhHrlqAlo/tDLGUH4TGe5nFCWdUYLaTm2gMqj3xPh0GooRXvj+H42OO/RnXrWiO+i
         RMdkmfoTMvOGUQnGMVanfYgwlX3U3A4g006anGc4l0eIMui2JV7ihLAD7JbLMmbhnDHj
         qb3xVUIGdg40YWNuXHWlj9rXEuLSNKzxCFS4qvi09l4f3qOE3WOvRR0ahp1Y+BSrLACl
         GGjK3+SnuNRPEVaAwNv1uV8BjV5b7sLPR9of0iGT2bK0Qd+jjbBrjNCFSIJ+i9pvaVfg
         Asqg==
X-Gm-Message-State: AOJu0YwQJRawspuipsGdzkxPre8uOhkd0zrGTmebBi3e8hlWN6RCde3d
	MbQvJzFcbTnFApesKHwi5bURJUjF5GcRJA==
X-Google-Smtp-Source: AGHT+IFTRlcWN5Rt/KBzCiHvT3N5anWPgaOs6ydyIXQxpzo5BMWlOM4FdmnzHrpkhIqf1Q8HlE/F+w==
X-Received: by 2002:a5d:6a81:0:b0:32f:7ff9:b731 with SMTP id s1-20020a5d6a81000000b0032f7ff9b731mr3548387wru.1.1702419394703;
        Tue, 12 Dec 2023 14:16:34 -0800 (PST)
Received: from imac.fritz.box ([2a02:8010:60a0:0:a1a0:2c27:44f7:b972])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b00333415503a7sm11680482wrt.22.2023.12.12.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:16:33 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>
Cc: donald.hunter@redhat.com,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 06/13] doc/netlink/specs: Add sub-message type to rt_link family
Date: Tue, 12 Dec 2023 22:15:45 +0000
Message-ID: <20231212221552.3622-7-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212221552.3622-1-donald.hunter@gmail.com>
References: <20231212221552.3622-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using sub-message selectors in the rt_link spec for the
link-specific 'data' and 'slave-data' attributes.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/specs/rt_link.yaml | 436 ++++++++++++++++++++++-
 1 file changed, 432 insertions(+), 4 deletions(-)

diff --git a/Documentation/netlink/specs/rt_link.yaml b/Documentation/netlink/specs/rt_link.yaml
index d86a68f8475c..ea6a6157d718 100644
--- a/Documentation/netlink/specs/rt_link.yaml
+++ b/Documentation/netlink/specs/rt_link.yaml
@@ -82,6 +82,18 @@ definitions:
       -
         name: ifi-change
         type: u32
+  -
+    name: ifla-bridge-id
+    type: struct
+    members:
+      -
+        name: prio
+        type: u16
+      -
+        name: addr
+        type: binary
+        len: 6
+        display-hint: mac
   -
     name: ifla-cacheinfo
     type: struct
@@ -966,8 +978,9 @@ attribute-sets:
         type: string
       -
         name: data
-        type: binary
-        # kind specific nest, e.g. linkinfo-bridge-attrs
+        type: sub-message
+        sub-message: linkinfo-data-msg
+        selector: kind
       -
         name: xstats
         type: binary
@@ -976,10 +989,12 @@ attribute-sets:
         type: string
       -
         name: slave-data
-        type: binary
-        # kind specific nest
+        type: sub-message
+        sub-message: linkinfo-member-data-msg
+        selector: slave-kind
   -
     name: linkinfo-bridge-attrs
+    name-prefix: ifla-br-
     attributes:
       -
         name: forward-delay
@@ -1011,9 +1026,11 @@ attribute-sets:
       -
         name: root-id
         type: binary
+        struct: ifla-bridge-id
       -
         name: bridge-id
         type: binary
+        struct: ifla-bridge-id
       -
         name: root-port
         type: u16
@@ -1041,6 +1058,7 @@ attribute-sets:
       -
         name: group-addr
         type: binary
+        display-hint: mac
       -
         name: fdb-flush
         type: binary
@@ -1123,6 +1141,376 @@ attribute-sets:
       -
         name: mcast-querier-state
         type: binary
+  -
+    name: linkinfo-brport-attrs
+    name-prefix: ifla-brport-
+    attributes:
+      -
+        name: state
+        type: u8
+      -
+        name: priority
+        type: u16
+      -
+        name: cost
+        type: u32
+      -
+        name: mode
+        type: flag
+      -
+        name: guard
+        type: flag
+      -
+        name: protect
+        type: flag
+      -
+        name: fast-leave
+        type: flag
+      -
+        name: learning
+        type: flag
+      -
+        name: unicast-flood
+        type: flag
+      -
+        name: proxyarp
+        type: flag
+      -
+        name: learning-sync
+        type: flag
+      -
+        name: proxyarp-wifi
+        type: flag
+      -
+        name: root-id
+        type: binary
+        struct: ifla-bridge-id
+      -
+        name: bridge-id
+        type: binary
+        struct: ifla-bridge-id
+      -
+        name: designated-port
+        type: u16
+      -
+        name: designated-cost
+        type: u16
+      -
+        name: id
+        type: u16
+      -
+        name: "no"
+        type: u16
+      -
+        name: topology-change-ack
+        type: u8
+      -
+        name: config-pending
+        type: u8
+      -
+        name: message-age-timer
+        type: u64
+      -
+        name: forward-delay-timer
+        type: u64
+      -
+        name: hold-timer
+        type: u64
+      -
+        name: flush
+        type: flag
+      -
+        name: multicast-router
+        type: u8
+      -
+        name: pad
+        type: pad
+      -
+        name: mcast-flood
+        type: flag
+      -
+        name: mcast-to-ucast
+        type: flag
+      -
+        name: vlan-tunnel
+        type: flag
+      -
+        name: bcast-flood
+        type: flag
+      -
+        name: group-fwd-mask
+        type: u16
+      -
+        name: neigh-suppress
+        type: flag
+      -
+        name: isolated
+        type: flag
+      -
+        name: backup-port
+        type: u32
+      -
+        name: mrp-ring-open
+        type: flag
+      -
+        name: mrp-in-open
+        type: flag
+      -
+        name: mcast-eht-hosts-limit
+        type: u32
+      -
+        name: mcast-eht-hosts-cnt
+        type: u32
+      -
+        name: locked
+        type: flag
+      -
+        name: mab
+        type: flag
+      -
+        name: mcast-n-groups
+        type: u32
+      -
+        name: mcast-max-groups
+        type: u32
+      -
+        name: neigh-vlan-suppress
+        type: flag
+      -
+        name: backup-nhid
+        type: u32
+  -
+    name: linkinfo-gre-attrs
+    name-prefix: ifla-gre-
+    attributes:
+      -
+        name: link
+        type: u32
+      -
+        name: iflags
+        type: u16
+      -
+        name: oflags
+        type: u16
+      -
+        name: ikey
+        type: u32
+      -
+        name: okey
+        type: u32
+      -
+        name: local
+        type: binary
+        display-hint: ipv4
+      -
+        name: remote
+        type: binary
+        display-hint: ipv4
+      -
+        name: ttl
+        type: u8
+      -
+        name: tos
+        type: u8
+      -
+        name: pmtudisc
+        type: u8
+      -
+        name: encap-limit
+        type: u32
+      -
+        name: flowinfo
+        type: u32
+      -
+        name: flags
+        type: u32
+      -
+        name: encap-type
+        type: u16
+      -
+        name: encap-flags
+        type: u16
+      -
+        name: encap-sport
+        type: u16
+      -
+        name: encap-dport
+        type: u16
+      -
+        name: collect-metadata
+        type: flag
+      -
+        name: ignore-df
+        type: u8
+      -
+        name: fwmark
+        type: u32
+      -
+        name: erspan-index
+        type: u32
+      -
+        name: erspan-ver
+        type: u8
+      -
+        name: erspan-dir
+        type: u8
+      -
+        name: erspan-hwid
+        type: u16
+  -
+    name: linkinfo-geneve-attrs
+    name-prefix: ifla-geneve-
+    attributes:
+      -
+        name: id
+        type: u32
+      -
+        name: remote
+        type: binary
+        display-hint: ipv4
+      -
+        name: ttl
+        type: u8
+      -
+        name: tos
+        type: u8
+      -
+        name: port
+        type: u16
+      -
+        name: collect-metadata
+        type: flag
+      -
+        name: remote6
+        type: binary
+        display-hint: ipv6
+      -
+        name: udp-csum
+        type: u8
+      -
+        name: udp-zero-csum6-tx
+        type: u8
+      -
+        name: udp-zero-csum6-rx
+        type: u8
+      -
+        name: label
+        type: u32
+      -
+        name: ttl-inherit
+        type: u8
+      -
+        name: df
+        type: u8
+      -
+        name: inner-proto-inherit
+        type: flag
+  -
+    name: linkinfo-iptun-attrs
+    name-prefix: ifla-iptun-
+    attributes:
+      -
+        name: link
+        type: u32
+      -
+        name: local
+        type: binary
+        display-hint: ipv4
+      -
+        name: remote
+        type: binary
+        display-hint: ipv4
+      -
+        name: ttl
+        type: u8
+      -
+        name: tos
+        type: u8
+      -
+        name: encap-limit
+        type: u8
+      -
+        name: flowinfo
+        type: u32
+      -
+        name: flags
+        type: u16
+      -
+        name: proto
+        type: u8
+      -
+        name: pmtudisc
+        type: u8
+      -
+        name: 6rd-prefix
+        type: binary
+        display-hint: ipv6
+      -
+        name: 6rd-relay-prefix
+        type: binary
+        display-hint: ipv4
+      -
+        name: 6rd-prefixlen
+        type: u16
+      -
+        name: 6rd-relay-prefixlen
+        type: u16
+      -
+        name: encap-type
+        type: u16
+      -
+        name: encap-flags
+        type: u16
+      -
+        name: encap-sport
+        type: u16
+      -
+        name: encap-dport
+        type: u16
+      -
+        name: collect-metadata
+        type: flag
+      -
+        name: fwmark
+        type: u32
+  -
+    name: linkinfo-tun-attrs
+    name-prefix: ifla-tun-
+    attributes:
+      -
+        name: owner
+        type: u32
+      -
+        name: group
+        type: u32
+      -
+        name: type
+        type: u8
+      -
+        name: pi
+        type: u8
+      -
+        name: vnet-hdr
+        type: u8
+      -
+        name: persist
+        type: u8
+      -
+        name: multi-queue
+        type: u8
+      -
+        name: num-queues
+        type: u32
+      -
+        name: num-disabled-queues
+        type: u32
+  -
+    name: linkinfo-vrf-attrs
+    name-prefix: ifla-vrf-
+    attributes:
+      -
+        name: table
+        type: u32
   -
     name: xdp-attrs
     attributes:
@@ -1241,6 +1629,46 @@ attribute-sets:
         name: used
         type: u8
 
+sub-messages:
+  -
+    name: linkinfo-data-msg
+    formats:
+      -
+        value: bridge
+        attribute-set: linkinfo-bridge-attrs
+      -
+        value: erspan
+        attribute-set: linkinfo-gre-attrs
+      -
+        value: gre
+        attribute-set: linkinfo-gre-attrs
+      -
+        value: gretap
+        attribute-set: linkinfo-gre-attrs
+      -
+        value: geneve
+        attribute-set: linkinfo-geneve-attrs
+      -
+        value: ipip
+        attribute-set: linkinfo-iptun-attrs
+      -
+        value: sit
+        attribute-set: linkinfo-iptun-attrs
+      -
+        value: tun
+        attribute-set: linkinfo-tun-attrs
+      -
+        value: vrf
+        attribute-set: linkinfo-vrf-attrs
+  -
+    name: linkinfo-member-data-msg
+    formats:
+      -
+        value: bridge
+        attribute-set: linkinfo-brport-attrs
+      -
+        value: bond
+
 operations:
   enum-model: directional
   list:
-- 
2.42.0


