Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67FC788752
	for <lists+linux-doc@lfdr.de>; Fri, 25 Aug 2023 14:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244804AbjHYM3X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Aug 2023 08:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244933AbjHYM3P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 08:29:15 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B952726;
        Fri, 25 Aug 2023 05:28:52 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so7984875e9.0;
        Fri, 25 Aug 2023 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966501; x=1693571301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p9Kons2ptJMEk8lj0h0VkJ+4iOvpUveT9QwsEiF77w=;
        b=WxFoMzozzJY9cnBq34PJOlXvoBb05065zGy3j5glTpQAEyOPtfVxhk8eJFnzs3CdYF
         MwzIb+TYzQ2lBE7o88CRHASSXatve0MbsnWPoGgvYBAeL2AUvgYxSmOgrPlxBxZqUl/T
         a/d11ILWgrt9KkQkWbwuHFmb/5RVozcwK5kjSqbLGMGmRu20bOOUxn3e0ggF0hWWKaiC
         HlD7y1aL90Uwx3TPKM6wbdJYEv41j+tUXAh+ZlErxs0rj09N9BuO57befshMTO4bV4y3
         PtTX19w8egAO2VCdVMEFUJHiRbZYOQ7WnsgTbeoa/WIdVuvxQl+qHBas5Hb2himh8QJ3
         hEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966501; x=1693571301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p9Kons2ptJMEk8lj0h0VkJ+4iOvpUveT9QwsEiF77w=;
        b=QPQkV6dNwamfr5WoFJjrjow91CxXkQB8TrH99vPZuhkW5b6Kk8ctkgY6YPMFbnbiaN
         ZelhlSUTyE7c0sPTCDMH7VWyTpeZJiKAcBhwvcjCyAXkNBC6H/a0qfuiKx+Xo8ozmuW3
         yf0PTVOR4DWMU3gmPEChFt++JqL+6nAYZyf5QFMvMHaf5TvFJRoM/eaiuig+lOexyExp
         PulJnse++/hVHHlsPPqvCW2fM0tFTRSaoTlnxsBPfu7boNS/m45ZCLWqnbEQz+KpnFd5
         MjlDvtmSWX+Kb7NmvSIkjRbXOlmuPTb0DJ1t1K4Lw1I4KExhoZiGtbqHpUfE4xr3tal8
         5cEg==
X-Gm-Message-State: AOJu0YwnzMwnotyensnuMwboDkIxxbUcfcwuvQEbhXRZdt2wWrkEI3OF
        JttdJkgexbiGiyFSgb6nZSCe2xBYslSShw==
X-Google-Smtp-Source: AGHT+IEXQgNOQy4xGsEMONUeYB6Tfz0BLDLZujax0FdLalUzPfUm3zm7kg9wsX8F1VqeRJgoCGtq7w==
X-Received: by 2002:a7b:cb41:0:b0:3fe:1f93:8cf4 with SMTP id v1-20020a7bcb41000000b003fe1f938cf4mr14286359wmj.8.1692966501390;
        Fri, 25 Aug 2023 05:28:21 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm2089561wmf.16.2023.08.25.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:28:20 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v6 11/12] doc/netlink: Add spec for rt link messages
Date:   Fri, 25 Aug 2023 13:27:54 +0100
Message-ID: <20230825122756.7603-12-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
References: <20230825122756.7603-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add schema for rt link with support for newlink, dellink, getlink,
setlink and getstats.

A dummy link can be created like this:

sudo ./tools/net/ynl/cli.py \
    --spec Documentation/netlink/specs/rt_link.yaml \
    --do newlink --create \
    --json '{"ifname": "dummy0", "linkinfo": {"kind": "dummy"}}'

For example, offload stats can be fetched like this:

./tools/net/ynl/cli.py \
    --spec Documentation/netlink/specs/rt_link.yaml \
    --dump getstats --json '{ "filter-mask": 8 }'

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 Documentation/netlink/specs/rt_link.yaml | 1432 ++++++++++++++++++++++
 1 file changed, 1432 insertions(+)
 create mode 100644 Documentation/netlink/specs/rt_link.yaml

diff --git a/Documentation/netlink/specs/rt_link.yaml b/Documentation/netlink/specs/rt_link.yaml
new file mode 100644
index 000000000000..d86a68f8475c
--- /dev/null
+++ b/Documentation/netlink/specs/rt_link.yaml
@@ -0,0 +1,1432 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+name: rt-link
+protocol: netlink-raw
+protonum: 0
+
+doc:
+  Link configuration over rtnetlink.
+
+definitions:
+  -
+    name: ifinfo-flags
+    type: flags
+    entries:
+      -
+        name: up
+      -
+        name: broadcast
+      -
+        name: debug
+      -
+        name: loopback
+      -
+        name: point-to-point
+      -
+        name: no-trailers
+      -
+        name: running
+      -
+        name: no-arp
+      -
+        name: promisc
+      -
+        name: all-multi
+      -
+        name: master
+      -
+        name: slave
+      -
+        name: multicast
+      -
+        name: portsel
+      -
+        name: auto-media
+      -
+        name: dynamic
+      -
+        name: lower-up
+      -
+        name: dormant
+      -
+        name: echo
+
+  -
+    name: rtgenmsg
+    type: struct
+    members:
+      -
+        name: family
+        type: u8
+  -
+    name: ifinfomsg
+    type: struct
+    members:
+      -
+        name: ifi-family
+        type: u8
+      -
+        name: padding
+        type: u8
+      -
+        name: ifi-type
+        type: u16
+      -
+        name: ifi-index
+        type: s32
+      -
+        name: ifi-flags
+        type: u32
+        enum: ifinfo-flags
+        enum-as-flags: true
+      -
+        name: ifi-change
+        type: u32
+  -
+    name: ifla-cacheinfo
+    type: struct
+    members:
+      -
+        name: max-reasm-len
+        type: u32
+      -
+        name: tstamp
+        type: u32
+      -
+        name: reachable-time
+        type: s32
+      -
+        name: retrans-time
+        type: u32
+  -
+    name: rtnl-link-stats
+    type: struct
+    members:
+      -
+        name: rx-packets
+        type: u32
+      -
+        name: tx-packets
+        type: u32
+      -
+        name: rx-bytes
+        type: u32
+      -
+        name: tx-bytes
+        type: u32
+      -
+        name: rx-errors
+        type: u32
+      -
+        name: tx-errors
+        type: u32
+      -
+        name: rx-dropped
+        type: u32
+      -
+        name: tx-dropped
+        type: u32
+      -
+        name: multicast
+        type: u32
+      -
+        name: collisions
+        type: u32
+      -
+        name: rx-length-errors
+        type: u32
+      -
+        name: rx-over-errors
+        type: u32
+      -
+        name: rx-crc-errors
+        type: u32
+      -
+        name: rx-frame-errors
+        type: u32
+      -
+        name: rx-fifo-errors
+        type: u32
+      -
+        name: rx-missed-errors
+        type: u32
+      -
+        name: tx-aborted-errors
+        type: u32
+      -
+        name: tx-carrier-errors
+        type: u32
+      -
+        name: tx-fifo-errors
+        type: u32
+      -
+        name: tx-heartbeat-errors
+        type: u32
+      -
+        name: tx-window-errors
+        type: u32
+      -
+        name: rx-compressed
+        type: u32
+      -
+        name: tx-compressed
+        type: u32
+      -
+        name: rx-nohandler
+        type: u32
+  -
+    name: rtnl-link-stats64
+    type: struct
+    members:
+      -
+        name: rx-packets
+        type: u64
+      -
+        name: tx-packets
+        type: u64
+      -
+        name: rx-bytes
+        type: u64
+      -
+        name: tx-bytes
+        type: u64
+      -
+        name: rx-errors
+        type: u64
+      -
+        name: tx-errors
+        type: u64
+      -
+        name: rx-dropped
+        type: u64
+      -
+        name: tx-dropped
+        type: u64
+      -
+        name: multicast
+        type: u64
+      -
+        name: collisions
+        type: u64
+      -
+        name: rx-length-errors
+        type: u64
+      -
+        name: rx-over-errors
+        type: u64
+      -
+        name: rx-crc-errors
+        type: u64
+      -
+        name: rx-frame-errors
+        type: u64
+      -
+        name: rx-fifo-errors
+        type: u64
+      -
+        name: rx-missed-errors
+        type: u64
+      -
+        name: tx-aborted-errors
+        type: u64
+      -
+        name: tx-carrier-errors
+        type: u64
+      -
+        name: tx-fifo-errors
+        type: u64
+      -
+        name: tx-heartbeat-errors
+        type: u64
+      -
+        name: tx-window-errors
+        type: u64
+      -
+        name: rx-compressed
+        type: u64
+      -
+        name: tx-compressed
+        type: u64
+      -
+        name: rx-nohandler
+        type: u64
+      -
+        name: rx-otherhost-dropped
+        type: u64
+  -
+    name: rtnl-link-ifmap
+    type: struct
+    members:
+      -
+        name: mem-start
+        type: u64
+      -
+        name: mem-end
+        type: u64
+      -
+        name: base-addr
+        type: u64
+      -
+        name: irq
+        type: u16
+      -
+        name: dma
+        type: u8
+      -
+        name: port
+        type: u8
+  -
+    name: ipv4-devconf
+    type: struct
+    members:
+      -
+        name: forwarding
+        type: u32
+      -
+        name: mc-forwarding
+        type: u32
+      -
+        name: proxy-arp
+        type: u32
+      -
+        name: accept-redirects
+        type: u32
+      -
+        name: secure-redirects
+        type: u32
+      -
+        name: send-redirects
+        type: u32
+      -
+        name: shared-media
+        type: u32
+      -
+        name: rp-filter
+        type: u32
+      -
+        name: accept-source-route
+        type: u32
+      -
+        name: bootp-relay
+        type: u32
+      -
+        name: log-martians
+        type: u32
+      -
+        name: tag
+        type: u32
+      -
+        name: arpfilter
+        type: u32
+      -
+        name: medium-id
+        type: u32
+      -
+        name: noxfrm
+        type: u32
+      -
+        name: nopolicy
+        type: u32
+      -
+        name: force-igmp-version
+        type: u32
+      -
+        name: arp-announce
+        type: u32
+      -
+        name: arp-ignore
+        type: u32
+      -
+        name: promote-secondaries
+        type: u32
+      -
+        name: arp-accept
+        type: u32
+      -
+        name: arp-notify
+        type: u32
+      -
+        name: accept-local
+        type: u32
+      -
+        name: src-vmark
+        type: u32
+      -
+        name: proxy-arp-pvlan
+        type: u32
+      -
+        name: route-localnet
+        type: u32
+      -
+        name: igmpv2-unsolicited-report-interval
+        type: u32
+      -
+        name: igmpv3-unsolicited-report-interval
+        type: u32
+      -
+        name: ignore-routes-with-linkdown
+        type: u32
+      -
+        name: drop-unicast-in-l2-multicast
+        type: u32
+      -
+        name: drop-gratuitous-arp
+        type: u32
+      -
+        name: bc-forwarding
+        type: u32
+      -
+        name: arp-evict-nocarrier
+        type: u32
+  -
+    name: ipv6-devconf
+    type: struct
+    members:
+      -
+        name: forwarding
+        type: u32
+      -
+        name: hoplimit
+        type: u32
+      -
+        name: mtu6
+        type: u32
+      -
+        name: accept-ra
+        type: u32
+      -
+        name: accept-redirects
+        type: u32
+      -
+        name: autoconf
+        type: u32
+      -
+        name: dad-transmits
+        type: u32
+      -
+        name: rtr-solicits
+        type: u32
+      -
+        name: rtr-solicit-interval
+        type: u32
+      -
+        name: rtr-solicit-delay
+        type: u32
+      -
+        name: use-tempaddr
+        type: u32
+      -
+        name: temp-valid-lft
+        type: u32
+      -
+        name: temp-prefered-lft
+        type: u32
+      -
+        name: regen-max-retry
+        type: u32
+      -
+        name: max-desync-factor
+        type: u32
+      -
+        name: max-addresses
+        type: u32
+      -
+        name: force-mld-version
+        type: u32
+      -
+        name: accept-ra-defrtr
+        type: u32
+      -
+        name: accept-ra-pinfo
+        type: u32
+      -
+        name: accept-ra-rtr-pref
+        type: u32
+      -
+        name: rtr-probe-interval
+        type: u32
+      -
+        name: accept-ra-rt-info-max-plen
+        type: u32
+      -
+        name: proxy-ndp
+        type: u32
+      -
+        name: optimistic-dad
+        type: u32
+      -
+        name: accept-source-route
+        type: u32
+      -
+        name: mc-forwarding
+        type: u32
+      -
+        name: disable-ipv6
+        type: u32
+      -
+        name: accept-dad
+        type: u32
+      -
+        name: force-tllao
+        type: u32
+      -
+        name: ndisc-notify
+        type: u32
+      -
+        name: mldv1-unsolicited-report-interval
+        type: u32
+      -
+        name: mldv2-unsolicited-report-interval
+        type: u32
+      -
+        name: suppress-frag-ndisc
+        type: u32
+      -
+        name: accept-ra-from-local
+        type: u32
+      -
+        name: use-optimistic
+        type: u32
+      -
+        name: accept-ra-mtu
+        type: u32
+      -
+        name: stable-secret
+        type: u32
+      -
+        name: use-oif-addrs-only
+        type: u32
+      -
+        name: accept-ra-min-hop-limit
+        type: u32
+      -
+        name: ignore-routes-with-linkdown
+        type: u32
+      -
+        name: drop-unicast-in-l2-multicast
+        type: u32
+      -
+        name: drop-unsolicited-na
+        type: u32
+      -
+        name: keep-addr-on-down
+        type: u32
+      -
+        name: rtr-solicit-max-interval
+        type: u32
+      -
+        name: seg6-enabled
+        type: u32
+      -
+        name: seg6-require-hmac
+        type: u32
+      -
+        name: enhanced-dad
+        type: u32
+      -
+        name: addr-gen-mode
+        type: u8
+      -
+        name: disable-policy
+        type: u32
+      -
+        name: accept-ra-rt-info-min-plen
+        type: u32
+      -
+        name: ndisc-tclass
+        type: u32
+      -
+        name: rpl-seg-enabled
+        type: u32
+      -
+        name: ra-defrtr-metric
+        type: u32
+      -
+        name: ioam6-enabled
+        type: u32
+      -
+        name: ioam6-id
+        type: u32
+      -
+        name: ioam6-id-wide
+        type: u32
+      -
+        name: ndisc-evict-nocarrier
+        type: u32
+      -
+        name: accept-untracked-na
+        type: u32
+  -
+    name: ifla-icmp6-stats
+    type: struct
+    members:
+      -
+        name: inmsgs
+        type: u64
+      -
+        name: inerrors
+        type: u64
+      -
+        name: outmsgs
+        type: u64
+      -
+        name: outerrors
+        type: u64
+      -
+        name: csumerrors
+        type: u64
+      -
+        name: ratelimithost
+        type: u64
+  -
+    name: ifla-inet6-stats
+    type: struct
+    members:
+      -
+        name: inpkts
+        type: u64
+      -
+        name: inoctets
+        type: u64
+      -
+        name: indelivers
+        type: u64
+      -
+        name: outforwdatagrams
+        type: u64
+      -
+        name: outpkts
+        type: u64
+      -
+        name: outoctets
+        type: u64
+      -
+        name: inhdrerrors
+        type: u64
+      -
+        name: intoobigerrors
+        type: u64
+      -
+        name: innoroutes
+        type: u64
+      -
+        name: inaddrerrors
+        type: u64
+      -
+        name: inunknownprotos
+        type: u64
+      -
+        name: intruncatedpkts
+        type: u64
+      -
+        name: indiscards
+        type: u64
+      -
+        name: outdiscards
+        type: u64
+      -
+        name: outnoroutes
+        type: u64
+      -
+        name: reasmtimeout
+        type: u64
+      -
+        name: reasmreqds
+        type: u64
+      -
+        name: reasmoks
+        type: u64
+      -
+        name: reasmfails
+        type: u64
+      -
+        name: fragoks
+        type: u64
+      -
+        name: fragfails
+        type: u64
+      -
+        name: fragcreates
+        type: u64
+      -
+        name: inmcastpkts
+        type: u64
+      -
+        name: outmcastpkts
+        type: u64
+      -
+        name: inbcastpkts
+        type: u64
+      -
+        name: outbcastpkts
+        type: u64
+      -
+        name: inmcastoctets
+        type: u64
+      -
+        name: outmcastoctets
+        type: u64
+      -
+        name: inbcastoctets
+        type: u64
+      -
+        name: outbcastoctets
+        type: u64
+      -
+        name: csumerrors
+        type: u64
+      -
+        name: noectpkts
+        type: u64
+      -
+        name: ect1-pkts
+        type: u64
+      -
+        name: ect0-pkts
+        type: u64
+      -
+        name: cepkts
+        type: u64
+      -
+        name: reasm-overlaps
+        type: u64
+  - name: br-boolopt-multi
+    type: struct
+    members:
+      -
+        name: optval
+        type: u32
+      -
+        name: optmask
+        type: u32
+  -
+    name: if_stats_msg
+    type: struct
+    members:
+      -
+        name: family
+        type: u8
+      -
+        name: pad1
+        type: u8
+      -
+        name: pad2
+        type: u16
+      -
+        name: ifindex
+        type: u32
+      -
+        name: filter-mask
+        type: u32
+
+
+attribute-sets:
+  -
+    name: link-attrs
+    name-prefix: ifla-
+    attributes:
+      -
+        name: address
+        type: binary
+        display-hint: mac
+      -
+        name: broadcast
+        type: binary
+        display-hint: mac
+      -
+        name: ifname
+        type: string
+      -
+        name: mtu
+        type: u32
+      -
+        name: link
+        type: u32
+      -
+        name: qdisc
+        type: string
+      -
+        name: stats
+        type: binary
+        struct: rtnl-link-stats
+      -
+        name: cost
+        type: string
+      -
+        name: priority
+        type: string
+      -
+        name: master
+        type: u32
+      -
+        name: wireless
+        type: string
+      -
+        name: protinfo
+        type: string
+      -
+        name: txqlen
+        type: u32
+      -
+        name: map
+        type: binary
+        struct: rtnl-link-ifmap
+      -
+        name: weight
+        type: u32
+      -
+        name: operstate
+        type: u8
+      -
+        name: linkmode
+        type: u8
+      -
+        name: linkinfo
+        type: nest
+        nested-attributes: linkinfo-attrs
+      -
+        name: net-ns-pid
+        type: u32
+      -
+        name: ifalias
+        type: string
+      -
+        name: num-vf
+        type: u32
+      -
+        name: vfinfo-list
+        type: nest
+        nested-attributes: vfinfo-attrs
+      -
+        name: stats64
+        type: binary
+        struct: rtnl-link-stats64
+      -
+        name: vf-ports
+        type: nest
+        nested-attributes: vf-ports-attrs
+      -
+        name: port-self
+        type: nest
+        nested-attributes: port-self-attrs
+      -
+        name: af-spec
+        type: nest
+        nested-attributes: af-spec-attrs
+      -
+        name: group
+        type: u32
+      -
+        name: net-ns-fd
+        type: u32
+      -
+        name: ext-mask
+        type: u32
+      -
+        name: promiscuity
+        type: u32
+      -
+        name: num-tx-queues
+        type: u32
+      -
+        name: num-rx-queues
+        type: u32
+      -
+        name: carrier
+        type: u8
+      -
+        name: phys-port-id
+        type: binary
+      -
+        name: carrier-changes
+        type: u32
+      -
+        name: phys-switch-id
+        type: binary
+      -
+        name: link-netnsid
+        type: s32
+      -
+        name: phys-port-name
+        type: string
+      -
+        name: proto-down
+        type: u8
+      -
+        name: gso-max-segs
+        type: u32
+      -
+        name: gso-max-size
+        type: u32
+      -
+        name: pad
+        type: pad
+      -
+        name: xdp
+        type: nest
+        nested-attributes: xdp-attrs
+      -
+        name: event
+        type: u32
+      -
+        name: new-netnsid
+        type: s32
+      -
+        name: target-netnsid
+        type: s32
+      -
+        name: carrier-up-count
+        type: u32
+      -
+        name: carrier-down-count
+        type: u32
+      -
+        name: new-ifindex
+        type: s32
+      -
+        name: min-mtu
+        type: u32
+      -
+        name: max-mtu
+        type: u32
+      -
+        name: prop-list
+        type: nest
+        nested-attributes: link-attrs
+      -
+        name: alt-ifname
+        type: string
+        multi-attr: true
+      -
+        name: perm-address
+        type: binary
+        display-hint: mac
+      -
+        name: proto-down-reason
+        type: string
+      -
+        name: parent-dev-name
+        type: string
+      -
+        name: parent-dev-bus-name
+        type: string
+      -
+        name: gro-max-size
+        type: u32
+      -
+        name: tso-max-size
+        type: u32
+      -
+        name: tso-max-segs
+        type: u32
+      -
+        name: allmulti
+        type: u32
+      -
+        name: devlink-port
+        type: binary
+      -
+        name: gso-ipv4-max-size
+        type: u32
+      -
+        name: gro-ipv4-max-size
+        type: u32
+  -
+    name: af-spec-attrs
+    attributes:
+      -
+        name: "inet"
+        type: nest
+        value: 2
+        nested-attributes: ifla-attrs
+      -
+        name: "inet6"
+        type: nest
+        value: 10
+        nested-attributes: ifla6-attrs
+      -
+        name: "mctp"
+        type: nest
+        value: 45
+        nested-attributes: mctp-attrs
+  -
+    name: vfinfo-attrs
+    attributes: []
+  -
+    name: vf-ports-attrs
+    attributes: []
+  -
+    name: port-self-attrs
+    attributes: []
+  -
+    name: linkinfo-attrs
+    attributes:
+      -
+        name: kind
+        type: string
+      -
+        name: data
+        type: binary
+        # kind specific nest, e.g. linkinfo-bridge-attrs
+      -
+        name: xstats
+        type: binary
+      -
+        name: slave-kind
+        type: string
+      -
+        name: slave-data
+        type: binary
+        # kind specific nest
+  -
+    name: linkinfo-bridge-attrs
+    attributes:
+      -
+        name: forward-delay
+        type: u32
+      -
+        name: hello-time
+        type: u32
+      -
+        name: max-age
+        type: u32
+      -
+        name: ageing-time
+        type: u32
+      -
+        name: stp-state
+        type: u32
+      -
+        name: priority
+        type: u16
+      -
+        name: vlan-filtering
+        type: u8
+      -
+        name: vlan-protocol
+        type: u16
+      -
+        name: group-fwd-mask
+        type: u16
+      -
+        name: root-id
+        type: binary
+      -
+        name: bridge-id
+        type: binary
+      -
+        name: root-port
+        type: u16
+      -
+        name: root-path-cost
+        type: u32
+      -
+        name: topology-change
+        type: u8
+      -
+        name: topology-change-detected
+        type: u8
+      -
+        name: hello-timer
+        type: u64
+      -
+        name: tcn-timer
+        type: u64
+      -
+        name: topology-change-timer
+        type: u64
+      -
+        name: gc-timer
+        type: u64
+      -
+        name: group-addr
+        type: binary
+      -
+        name: fdb-flush
+        type: binary
+      -
+        name: mcast-router
+        type: u8
+      -
+        name: mcast-snooping
+        type: u8
+      -
+        name: mcast-query-use-ifaddr
+        type: u8
+      -
+        name: mcast-querier
+        type: u8
+      -
+        name: mcast-hash-elasticity
+        type: u32
+      -
+        name: mcast-hash-max
+        type: u32
+      -
+        name: mcast-last-member-cnt
+        type: u32
+      -
+        name: mcast-startup-query-cnt
+        type: u32
+      -
+        name: mcast-last-member-intvl
+        type: u64
+      -
+        name: mcast-membership-intvl
+        type: u64
+      -
+        name: mcast-querier-intvl
+        type: u64
+      -
+        name: mcast-query-intvl
+        type: u64
+      -
+        name: mcast-query-response-intvl
+        type: u64
+      -
+        name: mcast-startup-query-intvl
+        type: u64
+      -
+        name: nf-call-iptables
+        type: u8
+      -
+        name: nf-call-ip6-tables
+        type: u8
+      -
+        name: nf-call-arptables
+        type: u8
+      -
+        name: vlan-default-pvid
+        type: u16
+      -
+        name: pad
+        type: pad
+      -
+        name: vlan-stats-enabled
+        type: u8
+      -
+        name: mcast-stats-enabled
+        type: u8
+      -
+        name: mcast-igmp-version
+        type: u8
+      -
+        name: mcast-mld-version
+        type: u8
+      -
+        name: vlan-stats-per-port
+        type: u8
+      -
+        name: multi-boolopt
+        type: binary
+        struct: br-boolopt-multi
+      -
+        name: mcast-querier-state
+        type: binary
+  -
+    name: xdp-attrs
+    attributes:
+      -
+        name: fd
+        type: s32
+      -
+        name: attached
+        type: u8
+      -
+        name: flags
+        type: u32
+      -
+        name: prog-id
+        type: u32
+      -
+        name: drv-prog-id
+        type: u32
+      -
+        name: skb-prog-id
+        type: u32
+      -
+        name: hw-prog-id
+        type: u32
+      -
+        name: expected-fd
+        type: s32
+  -
+    name: ifla-attrs
+    attributes:
+      -
+        name: conf
+        type: binary
+        struct: ipv4-devconf
+  -
+    name: ifla6-attrs
+    attributes:
+      -
+        name: flags
+        type: u32
+      -
+        name: conf
+        type: binary
+        struct: ipv6-devconf
+      -
+        name: stats
+        type: binary
+        struct: ifla-inet6-stats
+      -
+        name: mcast
+        type: binary
+      -
+        name: cacheinfo
+        type: binary
+        struct: ifla-cacheinfo
+      -
+        name: icmp6-stats
+        type: binary
+        struct: ifla-icmp6-stats
+      -
+        name: token
+        type: binary
+      -
+        name: addr-gen-mode
+        type: u8
+      -
+        name: ra-mtu
+        type: u32
+  -
+    name: mctp-attrs
+    attributes:
+      -
+        name: mctp-net
+        type: u32
+  -
+    name: stats-attrs
+    name-prefix: ifla-stats-
+    attributes:
+      -
+        name: link-64
+        type: binary
+        struct: rtnl-link-stats64
+      -
+        name: link-xstats
+        type: binary
+      -
+        name: link-xstats-slave
+        type: binary
+      -
+        name: link-offload-xstats
+        type: nest
+        nested-attributes: link-offload-xstats
+      -
+        name: af-spec
+        type: binary
+  -
+    name: link-offload-xstats
+    attributes:
+      -
+        name: cpu-hit
+        type: binary
+      -
+        name: hw-s-info
+        type: array-nest
+        nested-attributes: hw-s-info-one
+      -
+        name: l3-stats
+        type: binary
+  -
+    name: hw-s-info-one
+    attributes:
+      -
+        name: request
+        type: u8
+      -
+        name: used
+        type: u8
+
+operations:
+  enum-model: directional
+  list:
+    -
+      name: newlink
+      doc: Create a new link.
+      attribute-set: link-attrs
+      fixed-header: ifinfomsg
+      do:
+        request:
+          value: 16
+          attributes: &link-new-attrs
+            - ifi-index
+            - ifname
+            - net-ns-pid
+            - net-ns-fd
+            - target-netnsid
+            - link-netnsid
+            - linkinfo
+            - group
+            - num-tx-queues
+            - num-rx-queues
+            - address
+            - broadcast
+            - mtu
+            - txqlen
+            - operstate
+            - linkmode
+            - group
+            - gso-max-size
+            - gso-max-segs
+            - gro-max-size
+            - gso-ipv4-max-size
+            - gro-ipv4-max-size
+            - af-spec
+    -
+      name: dellink
+      doc: Delete an existing link.
+      attribute-set: link-attrs
+      fixed-header: ifinfomsg
+      do:
+        request:
+          value: 17
+          attributes:
+            - ifi-index
+            - ifname
+    -
+      name: getlink
+      doc: Get / dump information about a link.
+      attribute-set: link-attrs
+      fixed-header: ifinfomsg
+      do:
+        request:
+          value: 18
+          attributes:
+            - ifi-index
+            - ifname
+            - alt-ifname
+            - ext-mask
+            - target-netnsid
+        reply:
+          value: 16
+          attributes: &link-all-attrs
+            - ifi-family
+            - ifi-type
+            - ifi-index
+            - ifi-flags
+            - ifi-change
+            - address
+            - broadcast
+            - ifname
+            - mtu
+            - link
+            - qdisc
+            - stats
+            - cost
+            - priority
+            - master
+            - wireless
+            - protinfo
+            - txqlen
+            - map
+            - weight
+            - operstate
+            - linkmode
+            - linkinfo
+            - net-ns-pid
+            - ifalias
+            - num-vf
+            - vfinfo-list
+            - stats64
+            - vf-ports
+            - port-self
+            - af-spec
+            - group
+            - net-ns-fd
+            - ext-mask
+            - promiscuity
+            - num-tx-queues
+            - num-rx-queues
+            - carrier
+            - phys-port-id
+            - carrier-changes
+            - phys-switch-id
+            - link-netnsid
+            - phys-port-name
+            - proto-down
+            - gso-max-segs
+            - gso-max-size
+            - pad
+            - xdp
+            - event
+            - new-netnsid
+            - if-netnsid
+            - target-netnsid
+            - carrier-up-count
+            - carrier-down-count
+            - new-ifindex
+            - min-mtu
+            - max-mtu
+            - prop-list
+            - alt-ifname
+            - perm-address
+            - proto-down-reason
+            - parent-dev-name
+            - parent-dev-bus-name
+            - gro-max-size
+            - tso-max-size
+            - tso-max-segs
+            - allmulti
+            - devlink-port
+            - gso-ipv4-max-size
+            - gro-ipv4-max-size
+      dump:
+        request:
+          value: 18
+          attributes:
+            - target-netnsid
+            - ext-mask
+            - master
+            - linkinfo
+        reply:
+          value: 16
+          attributes: *link-all-attrs
+    -
+      name: setlink
+      doc: Set information about a link.
+      attribute-set: link-attrs
+      fixed-header: ifinfomsg
+      do:
+        request:
+          value: 19
+          attributes: *link-all-attrs
+    -
+      name: getstats
+      doc: Get / dump link stats.
+      attribute-set: stats-attrs
+      fixed-header: if_stats_msg
+      do:
+        request:
+          value: 94
+          attributes:
+            - ifindex
+        reply:
+          value: 92
+          attributes: &link-stats-attrs
+            - family
+            - ifindex
+            - filter-mask
+            - link-64
+            - link-xstats
+            - link-xstats-slave
+            - link-offload-xstats
+            - af-spec
+      dump:
+        request:
+          value: 94
+        reply:
+          value: 92
+          attributes: *link-stats-attrs
+
+mcast-groups:
+  list:
+    -
+      name: rtnlgrp-link
+      value: 1
+    -
+      name: rtnlgrp-stats
+      value: 36
-- 
2.41.0

