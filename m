Return-Path: <linux-doc+bounces-4859-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5380FA16
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 23:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9850D1C20DFC
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 22:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2AD660E7;
	Tue, 12 Dec 2023 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kji1vY5y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C37D9C;
	Tue, 12 Dec 2023 14:16:40 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-336356d9092so566532f8f.2;
        Tue, 12 Dec 2023 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702419398; x=1703024198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+0fdttzHCNQOm7CvOl30hmbQOQPNsJezGPiwOFCytM=;
        b=Kji1vY5yq44eTlqjN+2SU2Ie4YMeGXlJbus7j/0QTYQoPhbB2cf5H23yqmHmkF4MN1
         Ys57Nrwdo0Y63J136ODCfSka3sZYQiYBot0W4NP8zxnatFq85pyFozzP4nkEzJ6i5q2G
         eaTKBUT+3B0LIowz4y2cuEQzT9MFQ7KSrgJD8E9+LNgcj6FGKiIFHt2mkfmGP2urrIwq
         Qq/hZwHF42qlgVY0lvXYimpzofya3RR1dfWtaVw0yTX47SOs34ttDrXT8TZbPcs/21d3
         Pcd/odNN/7y9s67El1DNOAYegNL9W5DqIonrrMFUVr2bk61gydK+bn+6KhBp47hCmAoW
         9Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702419398; x=1703024198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+0fdttzHCNQOm7CvOl30hmbQOQPNsJezGPiwOFCytM=;
        b=BVToemePeQ3DkCoKUIgniLwHk57dA0uBE1Fx4dKs0jBCely22+bgG8V+8B3vLbta8a
         IAgDfJqxn3K9bFpWWeL7QFJm93FKwmkoMxAQwXVPzzpg4t+XgYkldxRsE5I9HDwgBG1j
         UZUMjtx2ZPnmujzzOxsqRC3sKWWjSbRABI5bLi71MxZKj8dwVPn9lRwI37nJ9CnCqwDI
         nt/XgtFcIBy0B339d+mcxhgUgEWZP2CH4SFM8GBZ5bn5cPyoy09QFOAXaiTV96GBB+lY
         ad1hkWqNj5auike8XBY/rjwvSdzSw7yJ4BEfgH/Ovjbkidyxkw9GlXiId0N9BrLEFO3a
         Iy5g==
X-Gm-Message-State: AOJu0YwjsIMMP5moZHz+lu9H/0iday9d0UpIO9TwOVVe+TH8KDYTgjbj
	Xq7oFOy3XRG5WtLeW41iuE0cpnINr2lojw==
X-Google-Smtp-Source: AGHT+IG6LovzxyDg7UE7f457gpHf7zP1d6/tpldCp0dJRCFaeOQFC339uyStbddWEqZvq8OPwZatIQ==
X-Received: by 2002:a5d:6806:0:b0:333:39d6:8cb1 with SMTP id w6-20020a5d6806000000b0033339d68cb1mr3807344wru.109.1702419397610;
        Tue, 12 Dec 2023 14:16:37 -0800 (PST)
Received: from imac.fritz.box ([2a02:8010:60a0:0:a1a0:2c27:44f7:b972])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b00333415503a7sm11680482wrt.22.2023.12.12.14.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:16:36 -0800 (PST)
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
Subject: [PATCH net-next v3 08/13] doc/netlink/specs: Add a spec for tc
Date: Tue, 12 Dec 2023 22:15:47 +0000
Message-ID: <20231212221552.3622-9-donald.hunter@gmail.com>
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

This is a work-in-progress spec for tc that covers:
 - most of the qdiscs
 - the flower classifier
 - new, del, get for qdisc, chain, class and filter

Notable omissions:
 - most of the stats attrs are left as binary blobs
 - notifications are not yet implemented

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/specs/tc.yaml | 2037 +++++++++++++++++++++++++++
 1 file changed, 2037 insertions(+)
 create mode 100644 Documentation/netlink/specs/tc.yaml

diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
new file mode 100644
index 000000000000..898a1e1be6cf
--- /dev/null
+++ b/Documentation/netlink/specs/tc.yaml
@@ -0,0 +1,2037 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+name: tc
+protocol: netlink-raw
+protonum: 0
+
+doc:
+  Netlink raw family for tc qdisc, chain, class and filter configuration
+  over rtnetlink.
+
+definitions:
+  -
+    name: tcmsg
+    type: struct
+    members:
+      -
+        name: family
+        type: u8
+      -
+        name: pad
+        type: pad
+        len: 3
+      -
+        name: ifindex
+        type: s32
+      -
+        name: handle
+        type: u32
+      -
+        name: parent
+        type: u32
+      -
+        name: info
+        type: u32
+  -
+    name: tc-cls-flags
+    type: flags
+    entries:
+      - skip-hw
+      - skip-sw
+      - in-hw
+      - not-in-nw
+      - verbose
+  -
+    name: tc-stats
+    type: struct
+    members:
+      -
+        name: bytes
+        type: u64
+      -
+        name: packets
+        type: u32
+      -
+        name: drops
+        type: u32
+      -
+        name: overlimits
+        type: u32
+      -
+        name: bps
+        type: u32
+      -
+        name: pps
+        type: u32
+      -
+        name: qlen
+        type: u32
+      -
+        name: backlog
+        type: u32
+  -
+    name: tc-cbs-qopt
+    type: struct
+    members:
+      -
+        name: offload
+        type: u8
+      -
+        name: pad
+        type: pad
+        len: 3
+      -
+        name: hicredit
+        type: s32
+      -
+        name: locredit
+        type: s32
+      -
+        name: idleslope
+        type: s32
+      -
+        name: sendslope
+        type: s32
+  -
+    name: tc-etf-qopt
+    type: struct
+    members:
+      -
+        name: delta
+        type: s32
+      -
+        name: clockid
+        type: s32
+      -
+        name: flags
+        type: s32
+  -
+    name: tc-fifo-qopt
+    type: struct
+    members:
+      -
+        name: limit
+        type: u32
+  -
+    name: tc-htb-opt
+    type: struct
+    members:
+      -
+        name: rate
+        type: binary
+        len: 12
+      -
+        name: ceil
+        type: binary
+        len: 12
+      -
+        name: buffer
+        type: u32
+      -
+        name: cbuffer
+        type: u32
+      -
+        name: quantum
+        type: u32
+      -
+        name: level
+        type: u32
+      -
+        name: prio
+        type: u32
+  -
+    name: tc-htb-glob
+    type: struct
+    members:
+      -
+        name: version
+        type: u32
+      -
+        name: rate2quantum
+        type: u32
+      -
+        name: defcls
+        type: u32
+      -
+        name: debug
+        type: u32
+      -
+        name: direct-pkts
+        type: u32
+  -
+    name: tc-gred-qopt
+    type: struct
+    members:
+      -
+        name: limit
+        type: u32
+      -
+        name: qth-min
+        type: u32
+      -
+        name: qth-max
+        type: u32
+      -
+        name: DP
+        type: u32
+      -
+        name: backlog
+        type: u32
+      -
+        name: qave
+        type: u32
+      -
+        name: forced
+        type: u32
+      -
+        name: early
+        type: u32
+      -
+        name: other
+        type: u32
+      -
+        name: pdrop
+        type: u32
+      -
+        name: Wlog
+        type: u8
+      -
+        name: Plog
+        type: u8
+      -
+        name: Scell_log
+        type: u8
+      -
+        name: prio
+        type: u8
+      -
+        name: packets
+        type: u32
+      -
+        name: bytesin
+        type: u32
+  -
+    name: tc-gred-sopt
+    type: struct
+    members:
+      -
+        name: DPs
+        type: u32
+      -
+        name: def_DP
+        type: u32
+      -
+        name: grio
+        type: u8
+      -
+        name: flags
+        type: u8
+      -
+        name: pad
+        type: pad
+        len: 2
+  -
+    name: tc-hfsc-qopt
+    type: struct
+    members:
+      -
+        name: defcls
+        type: u16
+  -
+    name: tc-mqprio-qopt
+    type: struct
+    members:
+      -
+        name: num-tc
+        type: u8
+      -
+        name: prio-tc-map
+        type: binary
+        len: 16
+      -
+        name: hw
+        type: u8
+      -
+        name: count
+        type: binary
+        len: 32
+      -
+        name: offset
+        type: binary
+        len: 32
+  -
+    name: tc-multiq-qopt
+    type: struct
+    members:
+      -
+        name: bands
+        type: u16
+      -
+        name: max-bands
+        type: u16
+  -
+    name: tc-netem-qopt
+    type: struct
+    members:
+      -
+        name: latency
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: loss
+        type: u32
+      -
+        name: gap
+        type: u32
+      -
+        name: duplicate
+        type: u32
+      -
+        name: jitter
+        type: u32
+  -
+    name: tc-plug-qopt
+    type: struct
+    members:
+      -
+        name: action
+        type: s32
+      -
+        name: limit
+        type: u32
+  -
+    name: tc-prio-qopt
+    type: struct
+    members:
+      -
+        name: bands
+        type: u16
+      -
+        name: priomap
+        type: binary
+        len: 16
+  -
+    name: tc-red-qopt
+    type: struct
+    members:
+      -
+        name: limit
+        type: u32
+      -
+        name: qth-min
+        type: u32
+      -
+        name: qth-max
+        type: u32
+      -
+        name: Wlog
+        type: u8
+      -
+        name: Plog
+        type: u8
+      -
+        name: Scell-log
+        type: u8
+      -
+        name: flags
+        type: u8
+  -
+    name: tc-sfb-qopt
+    type: struct
+    members:
+      -
+        name: rehash-interval
+        type: u32
+      -
+        name: warmup-time
+        type: u32
+      -
+        name: max
+        type: u32
+      -
+        name: bin-size
+        type: u32
+      -
+        name: increment
+        type: u32
+      -
+        name: decrement
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: penalty-rate
+        type: u32
+      -
+        name: penalty-burst
+        type: u32
+  -
+    name: tc-sfq-qopt-v1 # TODO nested structs
+    type: struct
+    members:
+      -
+        name: quantum
+        type: u32
+      -
+        name: perturb-period
+        type: s32
+      -
+        name: limit
+        type: u32
+      -
+        name: divisor
+        type: u32
+      -
+        name: flows
+        type: u32
+      -
+        name: depth
+        type: u32
+      -
+        name: headdrop
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: qth-min
+        type: u32
+      -
+        name: qth-mac
+        type: u32
+      -
+        name: Wlog
+        type: u8
+      -
+        name: Plog
+        type: u8
+      -
+        name: Scell-log
+        type: u8
+      -
+        name: flags
+        type: u8
+      -
+        name: max-P
+        type: u32
+      -
+        name: prob-drop
+        type: u32
+      -
+        name: forced-drop
+        type: u32
+      -
+        name: prob-mark
+        type: u32
+      -
+        name: forced-mark
+        type: u32
+      -
+        name: prob-mark-head
+        type: u32
+      -
+        name: forced-mark-head
+        type: u32
+  -
+    name: tc-tbf-qopt
+    type: struct
+    members:
+      -
+        name: rate
+        type: binary # TODO nested struct tc_ratespec
+        len: 12
+      -
+        name: peakrate
+        type: binary # TODO nested struct tc_ratespec
+        len: 12
+      -
+        name: limit
+        type: u32
+      -
+        name: buffer
+        type: u32
+      -
+        name: mtu
+        type: u32
+  -
+    name: tc-sizespec
+    type: struct
+    members:
+      -
+        name: cell-log
+        type: u8
+      -
+        name: size-log
+        type: u8
+      -
+        name: cell-align
+        type: s16
+      -
+        name: overhead
+        type: s32
+      -
+        name: linklayer
+        type: u32
+      -
+        name: mpu
+        type: u32
+      -
+        name: mtu
+        type: u32
+      -
+        name: tsize
+        type: u32
+  -
+    name: gnet-estimator
+    type: struct
+    members:
+      -
+        name: interval
+        type: s8
+      -
+        name: ewma-log
+        type: u8
+attribute-sets:
+  -
+    name: tc-attrs
+    attributes:
+      -
+        name: kind
+        type: string
+      -
+        name: options
+        type: sub-message
+        sub-message: tc-options-msg
+        selector: kind
+      -
+        name: stats
+        type: binary
+        struct: tc-stats
+      -
+        name: xstats
+        type: binary
+      -
+        name: rate
+        type: binary
+        struct: gnet-estimator
+      -
+        name: fcnt
+        type: u32
+      -
+        name: stats2
+        type: nest
+        nested-attributes: tca-stats-attrs
+      -
+        name: stab
+        type: nest
+        nested-attributes: tca-stab-attrs
+      -
+        name: pad
+        type: pad
+      -
+        name: dump-invisible
+        type: flag
+      -
+        name: chain
+        type: u32
+      -
+        name: hw-offload
+        type: u8
+      -
+        name: ingress-block
+        type: u32
+      -
+        name: egress-block
+        type: u32
+      -
+        name: dump-flags
+        type: bitfield32
+      -
+        name: ext-warn-msg
+        type: string
+  -
+    name: tc-cake-attrs
+    attributes:
+      -
+        name: pad
+        type: pad
+      -
+        name: base-rate64
+        type: u64
+      -
+        name: diffserv-mode
+        type: u32
+      -
+        name: atm
+        type: u32
+      -
+        name: flow-mode
+        type: u32
+      -
+        name: overhead
+        type: u32
+      -
+        name: rtt
+        type: u32
+      -
+        name: target
+        type: u32
+      -
+        name: autorate
+        type: u32
+      -
+        name: memory
+        type: u32
+      -
+        name: nat
+        type: u32
+      -
+        name: raw
+        type: u32
+      -
+        name: wash
+        type: u32
+      -
+        name: mpu
+        type: u32
+      -
+        name: ingress
+        type: u32
+      -
+        name: ack-filter
+        type: u32
+      -
+        name: split-gso
+        type: u32
+      -
+        name: fwmark
+        type: u32
+  -
+    name: tc-cake-stats-attrs
+    attributes:
+      -
+        name: pad
+        type: pad
+      -
+        name: capacity-estimate64
+        type: u64
+      -
+        name: memory-limit
+        type: u32
+      -
+        name: memory-used
+        type: u32
+      -
+        name: avg-netoff
+        type: u32
+      -
+        name: min-netlen
+        type: u32
+      -
+        name: max-netlen
+        type: u32
+      -
+        name: min-adjlen
+        type: u32
+      -
+        name: max-adjlen
+        type: u32
+      -
+        name: tin-stats
+        type: binary
+      -
+        name: deficit
+        type: s32
+      -
+        name: cobalt-count
+        type: u32
+      -
+        name: dropping
+        type: u32
+      -
+        name: drop-next-us
+        type: s32
+      -
+        name: p-drop
+        type: u32
+      -
+        name: blue-timer-us
+        type: s32
+  -
+    name: tc-cbs-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-cbs-qopt
+  -
+    name: tc-choke-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-red-qopt
+      -
+        name: stab
+        type: binary
+      -
+        name: max-p
+        type: u32
+  -
+    name: tc-codel-attrs
+    attributes:
+      -
+        name: target
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: interval
+        type: u32
+      -
+        name: ecn
+        type: u32
+      -
+        name: ce-threshold
+        type: u32
+  -
+    name: tc-drr-attrs
+    attributes:
+      -
+        name: quantum
+        type: u32
+  -
+    name: tc-flower-attrs
+    attributes:
+      -
+        name: classid
+        type: u32
+      -
+        name: indev
+        type: string
+      -
+        name: act
+        type: array-nest
+        nested-attributes: tc-act-attrs
+      -
+        name: key-eth-dst
+        type: binary
+        display-hint: mac
+      -
+        name: key-eth-dst-mask
+        type: binary
+        display-hint: mac
+      -
+        name: key-eth-src
+        type: binary
+        display-hint: mac
+      -
+        name: key-eth-src-mask
+        type: binary
+        display-hint: mac
+      -
+        name: key-eth-type
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-ip-proto
+        type: u8
+      -
+        name: key-ipv4-src
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-ipv4-src-mask
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-ipv4-dst
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-ipv4-dst-mask
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-ipv6-src
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-ipv6-src-mask
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-ipv6-dst
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-ipv6-dst-mask
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-tcp-src
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-tcp-dst
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-udp-src
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-udp-dst
+        type: u16
+        byte-order: big-endian
+      -
+        name: flags
+        type: u32
+        enum: tc-cls-flags
+        enum-as-flags: true
+      -
+        name: key-vlan-id
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-vlan-prio
+        type: u8
+      -
+        name: key-vlan-eth-type
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-key-id
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-enc-ipv4-src
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-enc-ipv4-src-mask
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-enc-ipv4-dst
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-enc-ipv4-dst-mask
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+      -
+        name: key-enc-ipv6-src
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-enc-ipv6-src-mask
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-enc-ipv6-dst
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-enc-ipv6-dst-mask
+        type: binary
+        display-hint: ipv6
+      -
+        name: key-tcp-src-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-tcp-dst-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-udp-src-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-udp-dst-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-sctp-src-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-sctp-dst-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-sctp-src
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-sctp-dst
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-udp-src-port
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-udp-src-port-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-udp-dst-port
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-udp-dst-port-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-flags
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-flags-mask
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-icmpv4-code
+        type: u8
+      -
+        name: key-icmpv4-code-mask
+        type: u8
+      -
+        name: key-icmpv4-type
+        type: u8
+      -
+        name: key-icmpv4-type-mask
+        type: u8
+      -
+        name: key-icmpv6-code
+        type: u8
+      -
+        name: key-icmpv6-code-mask
+        type: u8
+      -
+        name: key-icmpv6-type
+        type: u8
+      -
+        name: key-icmpv6-type-mask
+        type: u8
+      -
+        name: key-arp-sip
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-arp-sip-mask
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-arp-tip
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-arp-tip-mask
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-arp-op
+        type: u8
+      -
+        name: key-arp-op-mask
+        type: u8
+      -
+        name: key-arp-sha
+        type: binary
+      -
+        name: key-arp-sha-mask
+        type: binary
+      -
+        name: key-arp-tha
+        type: binary
+      -
+        name: key-arp-tha-mask
+        type: binary
+      -
+        name: key-mpls-ttl
+        type: u8
+      -
+        name: key-mpls-bos
+        type: u8
+      -
+        name: key-mpls-tc
+        type: u8
+      -
+        name: key-mpls-label
+        type: u32
+        byte-order: big-endian
+      -
+        name: key-tcp-flags
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-tcp-flags-mask
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-ip-tos
+        type: u8
+      -
+        name: key-ip-tos-mask
+        type: u8
+      -
+        name: key-ip-ttl
+        type: u8
+      -
+        name: key-ip-ttl-mask
+        type: u8
+      -
+        name: key-cvlan-id
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-cvlan-prio
+        type: u8
+      -
+        name: key-cvlan-eth-type
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-enc-ip-tos
+        type: u8
+      -
+        name: key-enc-ip-tos-mask
+        type: u8
+      -
+        name: key-enc-ip-ttl
+        type: u8
+      -
+        name: key-enc-ip-ttl-mask
+        type: u8
+      -
+        name: key-enc-opts
+        type: binary
+      -
+        name: key-enc-opts-mask
+        type: binary
+      -
+        name: in-hw-count
+        type: u32
+      -
+        name: key-port-src-min
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-port-src-max
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-port-dst-min
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-port-dst-max
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-ct-state
+        type: u16
+      -
+        name: key-ct-state-mask
+        type: u16
+      -
+        name: key-ct-zone
+        type: u16
+      -
+        name: key-ct-zone-mask
+        type: u16
+      -
+        name: key-ct-mark
+        type: u32
+      -
+        name: key-ct-mark-mask
+        type: u32
+      -
+        name: key-ct-labels
+        type: binary
+      -
+        name: key-ct-labels-mask
+        type: binary
+      -
+        name: key-mpls-opts
+        type: binary
+      -
+        name: key-hash
+        type: u32
+      -
+        name: key-hash-mask
+        type: u32
+      -
+        name: key-num-of-vlans
+        type: u8
+      -
+        name: key-pppoe-sid
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-ppp-proto
+        type: u16
+        byte-order: big-endian
+      -
+        name: key-l2-tpv3-sid
+        type: u32
+        byte-order: big-endian
+  -
+    name: tc-gred-attrs
+    attributes:
+      -
+        name: parms
+        type: binary # array of struct: tc-gred-qopt
+      -
+        name: stab
+        type: binary
+        sub-type: u8
+      -
+        name: dps
+        type: binary
+        struct: tc-gred-sopt
+      -
+        name: max-p
+        type: binary
+        sub-type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: vq-list
+        type: nest
+        nested-attributes: tca-gred-vq-list-attrs
+  -
+    name: tca-gred-vq-list-attrs
+    attributes:
+      -
+        name: entry
+        type: nest
+        nested-attributes: tca-gred-vq-entry-attrs
+        multi-attr: true
+  -
+    name: tca-gred-vq-entry-attrs
+    attributes:
+      -
+        name: pad
+        type: pad
+      -
+        name: dp
+        type: u32
+      -
+        name: stat-bytes
+        type: u32
+      -
+        name: stat-packets
+        type: u32
+      -
+        name: stat-backlog
+        type: u32
+      -
+        name: stat-prob-drop
+        type: u32
+      -
+        name: stat-prob-mark
+        type: u32
+      -
+        name: stat-forced-drop
+        type: u32
+      -
+        name: stat-forced-mark
+        type: u32
+      -
+        name: stat-pdrop
+        type: u32
+      -
+        name: stat-other
+        type: u32
+      -
+        name: flags
+        type: u32
+  -
+    name: tc-hfsc-attrs
+    attributes:
+      -
+        name: rsc
+        type: binary
+      -
+        name: fsc
+        type: binary
+      -
+        name: usc
+        type: binary
+  -
+    name: tc-hhf-attrs
+    attributes:
+      -
+        name: backlog-limit
+        type: u32
+      -
+        name: quantum
+        type: u32
+      -
+        name: hh-flows-limit
+        type: u32
+      -
+        name: reset-timeout
+        type: u32
+      -
+        name: admit-bytes
+        type: u32
+      -
+        name: evict-timeout
+        type: u32
+      -
+        name: non-hh-weight
+        type: u32
+  -
+    name: tc-htb-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-htb-opt
+      -
+        name: init
+        type: binary
+        struct: tc-htb-glob
+      -
+        name: ctab
+        type: binary
+      -
+        name: rtab
+        type: binary
+      -
+        name: direct-qlen
+        type: u32
+      -
+        name: rate64
+        type: u64
+      -
+        name: ceil64
+        type: u64
+      -
+        name: pad
+        type: pad
+      -
+        name: offload
+        type: flag
+  -
+    name: tc-act-attrs
+    attributes:
+      -
+        name: kind
+        type: string
+      -
+        name: options
+        type: sub-message
+        sub-message: tc-act-options-msg
+        selector: kind
+      -
+        name: index
+        type: u32
+      -
+        name: stats
+        type: binary
+      -
+        name: pad
+        type: pad
+      -
+        name: cookie
+        type: binary
+      -
+        name: flags
+        type: bitfield32
+      -
+        name: hw-stats
+        type: bitfield32
+      -
+        name: used-hw-stats
+        type: bitfield32
+      -
+        name: in-hw-count
+        type: u32
+  -
+    name: tc-etf-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-etf-qopt
+  -
+    name: tc-ets-attrs
+    attributes:
+      -
+        name: nbands
+        type: u8
+      -
+        name: nstrict
+        type: u8
+      -
+        name: quanta
+        type: nest
+        nested-attributes: tc-ets-attrs
+      -
+        name: quanta-band
+        type: u32
+        multi-attr: true
+      -
+        name: priomap
+        type: nest
+        nested-attributes: tc-ets-attrs
+      -
+        name: priomap-band
+        type: u8
+        multi-attr: true
+  -
+    name: tc-fq-attrs
+    attributes:
+      -
+        name: plimit
+        type: u32
+      -
+        name: flow-plimit
+        type: u32
+      -
+        name: quantum
+        type: u32
+      -
+        name: initial-quantum
+        type: u32
+      -
+        name: rate-enable
+        type: u32
+      -
+        name: flow-default-rate
+        type: u32
+      -
+        name: flow-max-rate
+        type: u32
+      -
+        name: buckets-log
+        type: u32
+      -
+        name: flow-refill-delay
+        type: u32
+      -
+        name: orphan-mask
+        type: u32
+      -
+        name: low-rate-threshold
+        type: u32
+      -
+        name: ce-threshold
+        type: u32
+      -
+        name: timer-slack
+        type: u32
+      -
+        name: horizon
+        type: u32
+      -
+        name: horizon-drop
+        type: u8
+  -
+    name: tc-fq-codel-attrs
+    attributes:
+      -
+        name: target
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: interval
+        type: u32
+      -
+        name: ecn
+        type: u32
+      -
+        name: flows
+        type: u32
+      -
+        name: quantum
+        type: u32
+      -
+        name: ce-threshold
+        type: u32
+      -
+        name: drop-batch-size
+        type: u32
+      -
+        name: memory-limit
+        type: u32
+      -
+        name: ce-threshold-selector
+        type: u8
+      -
+        name: ce-threshold-mask
+        type: u8
+  -
+    name: tc-fq-pie-attrs
+    attributes:
+      -
+        name: limit
+        type: u32
+      -
+        name: flows
+        type: u32
+      -
+        name: target
+        type: u32
+      -
+        name: tupdate
+        type: u32
+      -
+        name: alpha
+        type: u32
+      -
+        name: beta
+        type: u32
+      -
+        name: quantum
+        type: u32
+      -
+        name: memory-limit
+        type: u32
+      -
+        name: ecn-prob
+        type: u32
+      -
+        name: ecn
+        type: u32
+      -
+        name: bytemode
+        type: u32
+      -
+        name: dq-rate-estimator
+        type: u32
+  -
+    name: tc-netem-attrs
+    attributes:
+      -
+        name: corr
+        type: binary
+      -
+        name: delay-dist
+        type: binary
+        sub-type: s16
+      -
+        name: reorder
+        type: binary
+      -
+        name: corrupt
+        type: binary
+      -
+        name: loss
+        type: binary
+      -
+        name: rate
+        type: binary
+      -
+        name: ecn
+        type: u32
+      -
+        name: rate64
+        type: u64
+      -
+        name: pad
+        type: u32
+      -
+        name: latency64
+        type: s64
+      -
+        name: jitter64
+        type: s64
+      -
+        name: slot
+        type: binary
+      -
+        name: slot-dist
+        type: binary
+        sub-type: s16
+  -
+    name: tc-pie-attrs
+    attributes:
+      -
+        name: target
+        type: u32
+      -
+        name: limit
+        type: u32
+      -
+        name: tupdate
+        type: u32
+      -
+        name: alpha
+        type: u32
+      -
+        name: beta
+        type: u32
+      -
+        name: ecn
+        type: u32
+      -
+        name: bytemode
+        type: u32
+      -
+        name: dq-rate-estimator
+        type: u32
+  -
+    name: tc-qfq-attrs
+    attributes:
+      -
+        name: weight
+        type: u32
+      -
+        name: lmax
+        type: u32
+  -
+    name: tc-red-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-red-qopt
+      -
+        name: stab
+        type: binary
+      -
+        name: max-p
+        type: u32
+      -
+        name: flags
+        type: binary
+      -
+        name: early-drop-block
+        type: u32
+      -
+        name: mark-block
+        type: u32
+  -
+    name: tc-taprio-attrs
+    attributes:
+      -
+        name: priomap
+        type: binary
+        struct: tc-mqprio-qopt
+      -
+        name: sched-entry-list
+        type: nest
+        nested-attributes: tc-taprio-sched-entry-list
+      -
+        name: sched-base-time
+        type: s64
+      -
+        name: sched-single-entry
+        type: nest
+        nested-attributes: tc-taprio-sched-entry
+      -
+        name: sched-clockid
+        type: s32
+      -
+        name: pad
+        type: pad
+      -
+        name: admin-sched
+        type: binary
+      -
+        name: sched-cycle-time
+        type: s64
+      -
+        name: sched-cycle-time-extension
+        type: s64
+      -
+        name: flags
+        type: u32
+      -
+        name: txtime-delay
+        type: u32
+      -
+        name: tc-entry
+        type: nest
+        nested-attributes: tc-taprio-tc-entry-attrs
+  -
+    name: tc-taprio-sched-entry-list
+    attributes:
+      -
+        name: entry
+        type: nest
+        nested-attributes: tc-taprio-sched-entry
+  -
+    name: tc-taprio-sched-entry
+    attributes:
+      -
+        name: index
+        type: u32
+      -
+        name: cmd
+        type: u8
+      -
+        name: gate-mask
+        type: u32
+      -
+        name: interval
+        type: u32
+  -
+    name: tc-taprio-tc-entry-attrs
+    attributes:
+      -
+        name: index
+        type: u32
+      -
+        name: max-sdu
+        type: u32
+      -
+        name: fp
+        type: u32
+  -
+    name: tc-tbf-attrs
+    attributes:
+      -
+        name: parms
+        type: binary
+        struct: tc-tbf-qopt
+      -
+        name: rtab
+        type: binary
+      -
+        name: ptab
+        type: binary
+      -
+        name: rate64
+        type: u64
+      -
+        name: prate4
+        type: u64
+      -
+        name: burst
+        type: u32
+      -
+        name: pburst
+        type: u32
+      -
+        name: pad
+        type: pad
+  -
+    name: tca-gact-attrs
+    attributes:
+      -
+        name: tm
+        type: binary
+      -
+        name: parms
+        type: binary
+      -
+        name: prob
+        type: binary
+      -
+        name: pad
+        type: pad
+  -
+    name: tca-stab-attrs
+    attributes:
+      -
+        name: base
+        type: binary
+        struct: tc-sizespec
+      -
+        name: data
+        type: binary
+  -
+    name: tca-stats-attrs
+    attributes:
+      -
+        name: basic
+        type: binary
+      -
+        name: rate-est
+        type: binary
+      -
+        name: queue
+        type: binary
+      -
+        name: app
+        type: binary # TODO sub-message needs 2+ level deep lookup
+        sub-message: tca-stats-app-msg
+        selector: kind
+      -
+        name: rate-est64
+        type: binary
+      -
+        name: pad
+        type: pad
+      -
+        name: basic-hw
+        type: binary
+      -
+        name: pkt64
+        type: binary
+
+sub-messages:
+  -
+    name: tc-options-msg
+    formats:
+      -
+        value: bfifo
+        fixed-header: tc-fifo-qopt
+      -
+        value: cake
+        attribute-set: tc-cake-attrs
+      -
+        value: cbs
+        attribute-set: tc-cbs-attrs
+      -
+        value: choke
+        attribute-set: tc-choke-attrs
+      -
+        value: clsact # no content
+      -
+        value: codel
+        attribute-set: tc-codel-attrs
+      -
+        value: drr
+        attribute-set: tc-drr-attrs
+      -
+        value: etf
+        attribute-set: tc-etf-attrs
+      -
+        value: ets
+        attribute-set: tc-ets-attrs
+      -
+        value: fq
+        attribute-set: tc-fq-attrs
+      -
+        value: fq_codel
+        attribute-set: tc-fq-codel-attrs
+      -
+        value: fq_pie
+        attribute-set: tc-fq-pie-attrs
+      -
+        value: flower
+        attribute-set: tc-flower-attrs
+      -
+        value: gred
+        attribute-set: tc-gred-attrs
+      -
+        value: hfsc
+        fixed-header: tc-hfsc-qopt
+      -
+        value: hhf
+        attribute-set: tc-hhf-attrs
+      -
+        value: htb
+        attribute-set: tc-htb-attrs
+      -
+        value: ingress # no content
+      -
+        value: mq # no content
+      -
+        value: mqprio
+        fixed-header: tc-mqprio-qopt
+      -
+        value: multiq
+        fixed-header: tc-multiq-qopt
+      -
+        value: netem
+        fixed-header: tc-netem-qopt
+        attribute-set: tc-netem-attrs
+      -
+        value: pfifo
+        fixed-header: tc-fifo-qopt
+      -
+        value: pfifo_fast
+        fixed-header: tc-prio-qopt
+      -
+        value: pfifo_head_drop
+        fixed-header: tc-fifo-qopt
+      -
+        value: pie
+        attribute-set: tc-pie-attrs
+      -
+        value: plug
+        fixed-header: tc-plug-qopt
+      -
+        value: prio
+        fixed-header: tc-prio-qopt
+      -
+        value: qfq
+        attribute-set: tc-qfq-attrs
+      -
+        value: red
+        attribute-set: tc-red-attrs
+      -
+        value: sfb
+        fixed-header: tc-sfb-qopt
+      -
+        value: sfq
+        fixed-header: tc-sfq-qopt-v1
+      -
+        value: taprio
+        attribute-set: tc-taprio-attrs
+      -
+        value: tbf
+        attribute-set: tc-tbf-attrs
+  -
+    name: tc-act-options-msg
+    formats:
+      -
+        value: gact
+        attribute-set: tca-gact-attrs
+  -
+    name: tca-stats-app-msg
+    formats:
+      -
+        value: bfifo
+      -
+        value: blackhole
+      -
+        value: cake
+        attribute-set: tc-cake-stats-attrs
+      -
+        value: cbs
+      -
+        value: choke
+      -
+        value: clsact
+      -
+        value: codel
+      -
+        value: drr
+      -
+        value: etf
+      -
+        value: ets
+      -
+        value: fq
+      -
+        value: fq_codel
+      -
+        value: fq_pie
+      -
+        value: flower
+      -
+        value: gred
+      -
+        value: hfsc
+      -
+        value: hhf
+      -
+        value: htb
+      -
+        value: ingress
+      -
+        value: mq
+      -
+        value: mqprio
+      -
+        value: multiq
+      -
+        value: netem
+      -
+        value: noqueue
+      -
+        value: pfifo
+      -
+        value: pfifo_fast
+      -
+        value: pfifo_head_drop
+      -
+        value: pie
+      -
+        value: plug
+      -
+        value: prio
+      -
+        value: qfq
+      -
+        value: red
+      -
+        value: sfb
+      -
+        value: sfq
+      -
+        value: taprio
+      -
+        value: tbf
+
+operations:
+  enum-model: directional
+  list:
+    -
+      name: newqdisc
+      doc: Create new tc qdisc.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 36
+          attributes: &create-params
+            - tcm-family
+            - tcm-ifindex
+            - tcm-handle
+            - tcm-parent
+            - tca-kind
+            - tca-options
+            - tca-rate
+            - tca-stab
+            - tca-chain
+            - tca-ingress-block
+            - tca-egress-block
+    -
+      name: delqdisc
+      doc: Delete existing tc qdisc.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 37
+          attributes: &lookup-params
+            - tcm-family
+            - tcm-ifindex
+            - tcm-handle
+            - tcm-parent
+    -
+      name: getqdisc
+      doc: Get / dump tc qdisc information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 38
+          attributes:
+            - tcm-family
+            - tcm-ifindex
+            - tcm-handle
+            - tcm-parent
+            - tca-dump-invisible
+            - tca-dump-flags
+        reply:
+          value: 36
+          attributes: &tc-all
+            - tcm-family
+            - tcm-ifindex
+            - tcm-handle
+            - tcm-parent
+            - tca-kind
+            - tca-options
+            - tca-stats
+            - tca-xstats
+            - tca-rate
+            - tca-fcnt
+            - tca-stats2
+            - tca-stab
+            - tca-chain
+            - tca-ingress-block
+            - tca-egress-block
+    -
+      name: newtclass
+      doc: Get / dump tc traffic class information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 40
+          attributes: *create-params
+    -
+      name: deltclass
+      doc: Get / dump tc traffic class information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 41
+          attributes: *lookup-params
+    -
+      name: gettclass
+      doc: Get / dump tc traffic class information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 42
+          attributes: *lookup-params
+        reply:
+          value: 40
+          attributes: *tc-all
+    -
+      name: newtfilter
+      doc: Get / dump tc filter information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 44
+          attributes: *create-params
+    -
+      name: deltfilter
+      doc: Get / dump tc filter information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 45
+          attributes: *lookup-params
+    -
+      name: gettfilter
+      doc: Get / dump tc filter information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 46
+          attributes: *lookup-params
+        reply:
+          value: 44
+          attributes: *tc-all
+    -
+      name: newchain
+      doc: Get / dump tc chain information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 100
+          attributes: *create-params
+    -
+      name: delchain
+      doc: Get / dump tc chain information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 101
+          attributes: *lookup-params
+    -
+      name: getchain
+      doc: Get / dump tc chain information.
+      attribute-set: tc-attrs
+      fixed-header: tcmsg
+      do:
+        request:
+          value: 102
+          attributes: *lookup-params
+        reply:
+          value: 100
+          attributes: *tc-all
+
+mcast-groups:
+  list:
+    -
+      name: rtnlgrp-tc
+      value: 4
-- 
2.42.0


