Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A737856EA
	for <lists+linux-doc@lfdr.de>; Wed, 23 Aug 2023 13:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbjHWLmd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 07:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbjHWLmd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 07:42:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB18FE5D;
        Wed, 23 Aug 2023 04:42:30 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bbbda48904so66994351fa.2;
        Wed, 23 Aug 2023 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692790948; x=1693395748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQWgeaWQ/4hBL4NibSaXA04uIF2WfKhdxv+btB+gu2w=;
        b=PyBH8jbjfaOAug3YonQoZNE0BUphmuiH7N9Cia6ESwm7RcbZiEk2TXaF+VIrORnlXS
         8m0yfTFTqTgapTDMdSd/+ngtj9+ESbLw3muk+EbwSNpg2EnB0H5uqaJ1Jiv6BhmKXf5j
         wXNbFs/kpE7u2XmuCRTYEN2DGbIBx19zm07oGqwcF7GouoP68IOgrImoZo7qnWSYMG5K
         3mbjeTO2fhdDllJeRSoNzqxlqk2O+j0GPOhmFaEf1g+LLG32iQNg9159e6BLcMtUHiD2
         0V7N4bwcoJeepd5bYFOBr6X+UGxEOVqd9zLvQSkUyFkyGcPO8UwLkPfSUxukZ2vXapXp
         c0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692790948; x=1693395748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQWgeaWQ/4hBL4NibSaXA04uIF2WfKhdxv+btB+gu2w=;
        b=GJh3oixe46KvCa25g4T2HQ2UT/6T9buTcxEsgPwrGstACRus2jx1X4EP7WCG+zjR6x
         zsrRnWZFBEPwoBcIJeDUkgg9GC1oBw83lMUFllpeyupFrZ2uZilqQbN920YqrkEZX0eb
         1oKoWxhCy4dKzJXQjK9hJ+veX8AFnlETarXtp1rDrfPbKZtmBYYBQWtSEPJdqosCLT6o
         lioEkl3XyVG6cE8mouxENzJUA5dZjk2QqDxQMEV56fquS3FOaANLQGhj/wJWgkoZFdwJ
         9boyZ4hUEtyu97KCoCnCEt0tZio74uo1YD5MP0wHDk8GgxzcjPTdRi9CjXLCOzBlUVnF
         n6MA==
X-Gm-Message-State: AOJu0YyUB8K7fMfIA0FYw6+mIbpG6md/zzOHnJSpE4bYQBTgCMsJ9M1E
        HkJYdESDR9Obc0ax/NMAqvgWCHrC0k7Qnw==
X-Google-Smtp-Source: AGHT+IE8mupUI5CMOwDLKM6cAKywIfCmVVn0PnGa9Ss+78W5KUB0sHbyIEclbSM3yaSdrSpd+x2YMQ==
X-Received: by 2002:a2e:99ce:0:b0:2bc:b27f:4019 with SMTP id l14-20020a2e99ce000000b002bcb27f4019mr7454863ljj.6.1692790948460;
        Wed, 23 Aug 2023 04:42:28 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:e4cf:1132:7b40:4262])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003fed9b1a1f4sm559508wms.1.2023.08.23.04.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:42:27 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v4 12/12] doc/netlink: Add spec for rt route messages
Date:   Wed, 23 Aug 2023 12:42:01 +0100
Message-ID: <20230823114202.5862-13-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823114202.5862-1-donald.hunter@gmail.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add schema for rt route with support for getroute, newroute and
delroute.

Routes can be dumped with filter attributes like this:

./tools/net/ynl/cli.py \
    --spec Documentation/netlink/specs/rt_route.yaml \
    --dump getroute --json '{"rtm-family": 2, "rtm-table": 254}'

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/specs/rt_route.yaml | 327 ++++++++++++++++++++++
 1 file changed, 327 insertions(+)
 create mode 100644 Documentation/netlink/specs/rt_route.yaml

diff --git a/Documentation/netlink/specs/rt_route.yaml b/Documentation/netlink/specs/rt_route.yaml
new file mode 100644
index 000000000000..f4368be0caed
--- /dev/null
+++ b/Documentation/netlink/specs/rt_route.yaml
@@ -0,0 +1,327 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+name: rt-route
+protocol: netlink-raw
+protonum: 0
+
+doc:
+  Route configuration over rtnetlink.
+
+definitions:
+  -
+    name: rtm-type
+    name-prefix: rtn-
+    type: enum
+    entries:
+      - unspec
+      - unicast
+      - local
+      - broadcast
+      - anycast
+      - multicast
+      - blackhole
+      - unreachable
+      - prohibit
+      - throw
+      - nat
+      - xresolve
+  -
+    name: rtmsg
+    type: struct
+    members:
+      -
+        name: rtm-family
+        type: u8
+      -
+        name: rtm-dst-len
+        type: u8
+      -
+        name: rtm-src-len
+        type: u8
+      -
+        name: rtm-tos
+        type: u8
+      -
+        name: rtm-table
+        type: u8
+      -
+        name: rtm-protocol
+        type: u8
+      -
+        name: rtm-scope
+        type: u8
+      -
+        name: rtm-type
+        type: u8
+        enum: rtm-type
+      -
+        name: rtm-flags
+        type: u32
+  -
+    name: rta-cacheinfo
+    type: struct
+    members:
+      -
+        name: rta-clntref
+        type: u32
+      -
+        name: rta-lastuse
+        type: u32
+      -
+        name: rta-expires
+        type: u32
+      -
+        name: rta-error
+        type: u32
+      -
+        name: rta-used
+        type: u32
+
+attribute-sets:
+  -
+    name: route-attrs
+    attributes:
+      -
+        name: rta-dst
+        type: binary
+        display-hint: ipv4
+      -
+        name: rta-src
+        type: binary
+        display-hint: ipv4
+      -
+        name: rta-iif
+        type: u32
+      -
+        name: rta-oif
+        type: u32
+      -
+        name: rta-gateway
+        type: binary
+        display-hint: ipv4
+      -
+        name: rta-priority
+        type: u32
+      -
+        name: rta-prefsrc
+        type: binary
+        display-hint: ipv4
+      -
+        name: rta-metrics
+        type: nest
+        nested-attributes: rta-metrics
+      -
+        name: rta-multipath
+        type: binary
+      -
+        name: rta-protoinfo # not used
+        type: binary
+      -
+        name: rta-flow
+        type: u32
+      -
+        name: rta-cacheinfo
+        type: binary
+        struct: rta-cacheinfo
+      -
+        name: rta-session # not used
+        type: binary
+      -
+        name: rta-mp-algo # not used
+        type: binary
+      -
+        name: rta-table
+        type: u32
+      -
+        name: rta-mark
+        type: u32
+      -
+        name: rta-mfc-stats
+        type: binary
+      -
+        name: rta-via
+        type: binary
+      -
+        name: rta-newdst
+        type: binary
+      -
+        name: rta-pref
+        type: u8
+      -
+        name: rta-encap-type
+        type: u16
+      -
+        name: rta-encap
+        type: binary # tunnel specific nest
+      -
+        name: rta-expires
+        type: u32
+      -
+        name: rta-pad
+        type: binary
+      -
+        name: rta-uid
+        type: u32
+      -
+        name: rta-ttl-propagate
+        type: u8
+      -
+        name: rta-ip-proto
+        type: u8
+      -
+        name: rta-sport
+        type: u16
+      -
+        name: rta-dport
+        type: u16
+      -
+        name: rta-nh-id
+        type: u32
+  -
+    name: rta-metrics
+    attributes:
+      -
+        name: rtax-unspec
+        type: unused
+        value: 0
+      -
+        name: rtax-lock
+        type: u32
+      -
+        name: rtax-mtu
+        type: u32
+      -
+        name: rtax-window
+        type: u32
+      -
+        name: rtax-rtt
+        type: u32
+      -
+        name: rtax-rttvar
+        type: u32
+      -
+        name: rtax-ssthresh
+        type: u32
+      -
+        name: rtax-cwnd
+        type: u32
+      -
+        name: rtax-advmss
+        type: u32
+      -
+        name: rtax-reordering
+        type: u32
+      -
+        name: rtax-hoplimit
+        type: u32
+      -
+        name: rtax-initcwnd
+        type: u32
+      -
+        name: rtax-features
+        type: u32
+      -
+        name: rtax-rto-min
+        type: u32
+      -
+        name: rtax-initrwnd
+        type: u32
+      -
+        name: rtax-quickack
+        type: u32
+      -
+        name: rtax-cc-algo
+        type: string
+      -
+        name: rtax-fastopen-no-cookie
+        type: u32
+
+operations:
+  enum-model: directional
+  list:
+    -
+      name: getroute
+      doc: Dump route information.
+      attribute-set: route-attrs
+      fixed-header: rtmsg
+      do:
+        request:
+          value: 26
+          attributes:
+            - rtm-family
+            - rta-src
+            - rtm-src-len
+            - rta-dst
+            - rtm-dst-len
+            - rta-iif
+            - rta-oif
+            - rta-ip-proto
+            - rta-sport
+            - rta-dport
+            - rta-mark
+            - rta-uid
+        reply:
+          value: 24
+          attributes: &all-route-attrs
+            - rtm-family
+            - rtm-dst-len
+            - rtm-src-len
+            - rtm-tos
+            - rtm-table
+            - rtm-protocol
+            - rtm-scope
+            - rtm-type
+            - rtm-flags
+            - rta-dst
+            - rta-src
+            - rta-iif
+            - rta-oif
+            - rta-gateway
+            - rta-priority
+            - rta-prefsrc
+            - rta-metrics
+            - rta-multipath
+            - rta-flow
+            - rta-cacheinfo
+            - rta-table
+            - rta-mark
+            - rta-mfc-stats
+            - rta-via
+            - rta-newdst
+            - rta-pref
+            - rta-encap-type
+            - rta-encap
+            - rta-expires
+            - rta-pad
+            - rta-uid
+            - rta-ttl-propagate
+            - rta-ip-proto
+            - rta-sport
+            - rta-dport
+            - rta-nh-id
+      dump:
+        request:
+          value: 26
+          attributes:
+            - rtm-family
+        reply:
+          value: 24
+          attributes: *all-route-attrs
+    -
+      name: newroute
+      doc: Create a new route
+      attribute-set: route-attrs
+      fixed-header: rtmsg
+      do:
+        request:
+          value: 24
+          attributes: *all-route-attrs
+    -
+      name: delroute
+      doc: Delete an existing route
+      attribute-set: route-attrs
+      fixed-header: rtmsg
+      do:
+        request:
+          value: 25
+          attributes: *all-route-attrs
-- 
2.41.0

