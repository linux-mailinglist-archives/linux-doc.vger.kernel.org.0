Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE306325AF
	for <lists+linux-doc@lfdr.de>; Mon, 21 Nov 2022 15:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiKUOYf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Nov 2022 09:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiKUOXt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 09:23:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE456427
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 06:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669040568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Mt/4kG5u+q4960OnggQxBF4VwJ0IyUcVyeLIY1/apXs=;
        b=fHOTLZk0h8g/TL/BkwmlU9PtJA49Qs3bHZx1nSKYB+iif8W/BbwoWQwZcbDl07c++CK2uS
        iDc3JR/nKraEs0mycodukmjug+1poOk8UfzEE+1+NenTMELPtoe868id3thb/O2G++wJLS
        vS7iDM9yTdqdcmd3X+KCDIu+UY6Z1Gg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-iX_Y_f5UO2KgzplPikYAeg-1; Mon, 21 Nov 2022 09:22:47 -0500
X-MC-Unique: iX_Y_f5UO2KgzplPikYAeg-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso6568037wmb.4
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 06:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt/4kG5u+q4960OnggQxBF4VwJ0IyUcVyeLIY1/apXs=;
        b=AufnTpAuQYr74P29wgyYVB7D3Hzas5aFfeohwwnP233GXN3JL/g2irytT/IuiCgBhk
         06ERUMUtgGZ5N5tlismqgTvS8qpYCefvoavCCoCbQq/di5CWQgVicpwJKL4Mw6zcfact
         3Mn1k6z8uGRq6Ig6FjH4/VpiVmOITF+RiZV/U7mlaSS6lzKCnJHte5K2+WQ6vcx6pFFY
         7I3lbJYkaXcMfCbcsjxWvh100XKAcnpUM4zSJLNyr1WeEcoDdQjRAYa2859zaADcprci
         tmmaGVz6N8jrHPctGQBLbXULGbacD52nf4iRfuWq3BcoeE8REavQlGdo2AdaknZaJSZ3
         pfTA==
X-Gm-Message-State: ANoB5pnqfySsM5zG9yl6Z2gHqD1GjsDjQw5d1AL1omiSzDXSX++XATDE
        G/eN1o9Vhui9iMFEi29tkbKtg2CvaOwlq9+ouE3A3o4TekJSngBl5e6vakywpKULoiiRshH6mZg
        1FHXdHP149F9FxmancYo1
X-Received: by 2002:a05:6000:1107:b0:241:7e9f:8afd with SMTP id z7-20020a056000110700b002417e9f8afdmr10729100wrw.228.1669040565652;
        Mon, 21 Nov 2022 06:22:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7R+Jzyu/C3zQr7x2WM7RqaRKzuhQfg0A1yIfohGwllv722tp2HcGvXS1b+IJ8ixClmDL9Ouw==
X-Received: by 2002:a05:6000:1107:b0:241:7e9f:8afd with SMTP id z7-20020a056000110700b002417e9f8afdmr10729090wrw.228.1669040565421;
        Mon, 21 Nov 2022 06:22:45 -0800 (PST)
Received: from teaching-eagle.redhat.com ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm20212480wmq.1.2022.11.21.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 06:22:44 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        magnus.karlsson@gmail.com, akiyks@gmail.com,
        Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v3 1/1] docs: BPF_MAP_TYPE_XSKMAP
Date:   Mon, 21 Nov 2022 14:22:40 +0000
Message-Id: <20221121142240.40451-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_XSKMAP
including kernel version introduced, usage
and examples.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>

---
v3:
- Fixed duplicate function warnings from Sphinx >= 3.3.

v2:
- Fixed typos + incorrect return type references.
- Adjusted examples to use __u32 and fixed references to key_size.
- Changed `AF_XDP socket` references to XSK.
- Added note re map key and value size.
---
 Documentation/bpf/map_xskmap.rst | 173 +++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/bpf/map_xskmap.rst

diff --git a/Documentation/bpf/map_xskmap.rst b/Documentation/bpf/map_xskmap.rst
new file mode 100644
index 000000000000..8715034600d4
--- /dev/null
+++ b/Documentation/bpf/map_xskmap.rst
@@ -0,0 +1,173 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2022 Red Hat, Inc.
+
+===================
+BPF_MAP_TYPE_XSKMAP
+===================
+
+.. note::
+   - ``BPF_MAP_TYPE_XSKMAP`` was introduced in kernel version 4.18
+
+The ``BPF_MAP_TYPE_XSKMAP`` is used as a backend map for XDP BPF helper
+call ``bpf_redirect_map()`` and ``XDP_REDIRECT`` action, like 'devmap' and 'cpumap'.
+This map type redirects raw XDP frames to AF_XDP sockets (XSKs). An AF_XDP socket
+binds to a single netdev queue. A mapping of XSKs to queues is shown below:
+
+.. code-block:: none
+
+    +---------------------------------------------------+
+    |     xsk A      |     xsk B       |      xsk C     |<---+ Userspace
+    =========================================================|==========
+    |    Queue 0     |     Queue 1     |     Queue 2    |    |  Kernel
+    +---------------------------------------------------+    |
+    |                  Netdev eth0                      |    |
+    +---------------------------------------------------+    |
+    |                            +=============+        |    |
+    |                            | key |  xsk  |        |    |
+    |  +---------+               +=============+        |    |
+    |  |         |               |  0  | xsk A |        |    |
+    |  |         |               +-------------+        |    |
+    |  |         |               |  1  | xsk B |        |    |
+    |  | eBPF    |-- redirect -->+-------------+-------------+
+    |  | prog    |               |  2  | xsk C |        |
+    |  |         |               +-------------+        |
+    |  |         |                                      |
+    |  |         |                                      |
+    |  +---------+                                      |
+    |                                                   |
+    +---------------------------------------------------+
+
+.. note::
+    An AF_XDP socket that is bound to a certain <netdev/queue_id> will *only*
+    accept XDP frames from that <netdev/queue_id>. If an XDP program tries to redirect
+    from a <netdev/queue_id> other than what the socket is bound to, the frame will
+    not be received on the socket.
+
+Typically a XSKMAP is created per netdev. This map contains an array of XSK File
+Descriptors (FDs). The number of array elements is typically set or adjusted using
+the ``max_entries`` map parameter. For AF_XDP ``max_entries`` is equal to the number
+of queues supported by the netdev.
+
+.. note::
+    Both the map key and map value size must be 4 bytes.
+
+Usage
+=====
+
+Kernel BPF
+----------
+
+.. code-block:: c
+
+     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+
+Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
+For ``BPF_MAP_TYPE_XSKMAP`` this map contains references to XSK FDs
+for sockets attached to a netdev's queues.
+
+.. note::
+    If the map is empty at an index, the packet is dropped. This means that it is
+    necessary to have an XDP program loaded with at least one XSK in the
+    XSKMAP to be able to get any traffic to user space through the socket.
+
+.. code-block:: c
+
+    void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
+
+XSK entry references of type ``struct xdp_sock *`` can be retrieved using the
+``bpf_map_lookup_elem()`` helper.
+
+Userspace
+---------
+.. note::
+    XSK entries can only be updated/deleted from user space and not from
+    an eBPF program. Trying to call these functions from a kernel eBPF program will
+    result in the program failing to load and a verifier warning.
+
+.. code-block:: c
+
+	int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags)
+
+XSK entries can be added or updated using the ``bpf_map_update_elem()``
+helper. The ``key`` parameter is equal to the queue_id of the queue the XSK
+is attaching to. And the ``value`` parameter is the FD value of that socket.
+
+Under the hood, the XSKMAP update function uses the XSK FD value to retrieve the
+associated ``struct xdp_sock`` instance.
+
+The flags argument can be one of the following:
+
+- BPF_ANY: Create a new element or update an existing element.
+- BPF_NOEXIST: Create a new element only if it did not exist.
+- BPF_EXIST: Update an existing element.
+
+.. code-block:: c
+
+    int bpf_map_lookup_elem(int fd, const void *key, void *value)
+
+Returns ``struct xdp_sock *`` or negative error in case of failure.
+
+.. code-block:: c
+
+    int bpf_map_delete_elem(int fd, const void *key)
+
+XSK entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
+
+.. note::
+    When `libxdp`_ deletes a XSK it also removes the associated socket
+    entry from the XSKMAP.
+
+Examples
+========
+Kernel
+------
+
+The following code snippet shows how to declare a ``BPF_MAP_TYPE_XSKMAP`` called
+``xsks_map`` and how to redirect packets to a XSK.
+
+.. code-block:: c
+
+   struct {
+        __uint(type, BPF_MAP_TYPE_XSKMAP);
+        __type(key, __u32);
+        __type(value, __u32);
+        __uint(max_entries, 64);
+    } xsks_map SEC(".maps");
+
+
+    SEC("xdp")
+    int xsk_redir_prog(struct xdp_md *ctx)
+    {
+        __u32 index = ctx->rx_queue_index;
+
+        if (bpf_map_lookup_elem(&xsks_map, &index))
+            return bpf_redirect_map(&xsks_map, index, 0);
+        return XDP_PASS;
+    }
+
+Userspace
+---------
+
+The following code snippet shows how to update a XSKMAP with a XSK entry.
+
+.. code-block:: c
+
+    int update_xsks_map(struct bpf_map *xsks_map, int queue_id, int xsk_fd)
+    {
+        int ret;
+
+        ret = bpf_map_update_elem(bpf_map__fd(xsks_map), &queue_id, &xsk_fd, 0);
+        if (ret < 0) {
+            fprintf(stderr, "Failed to update xsks_map: %s\n",
+                strerror(errno));
+        }
+
+        return ret;
+    }
+
+.. note::
+    The most comprehensive resource for using XSKMAPs is `libxdp`_.
+
+.. _libxdp: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp
-- 
2.34.1

