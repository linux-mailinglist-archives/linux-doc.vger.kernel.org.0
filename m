Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED3F62D788
	for <lists+linux-doc@lfdr.de>; Thu, 17 Nov 2022 10:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239349AbiKQJzU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Nov 2022 04:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239381AbiKQJzA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 04:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9CEBF6B
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 01:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668678806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=iDCB9fgd0Mu9h/tKpdz8x9GzaTGBDxvpI7X/JZuqRQo=;
        b=K30HaF6T+KfN2ATClJn5bGUaQIOCE3U3jeRT90MrPnD8SKaJpLgdATFVp1NkqO8r1DwypS
        jj+5c7e+qFU2d/6lW+uwykLAr8Uz68gPOWD1GXEc3yPag53Sbu4JqW+buexkzMBI9obqhZ
        LPB/vo6pDFXIClaI82ut36TtALgA25A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-gJIvtN8rMLWp9TfNL_1tGw-1; Thu, 17 Nov 2022 04:53:23 -0500
X-MC-Unique: gJIvtN8rMLWp9TfNL_1tGw-1
Received: by mail-qk1-f197.google.com with SMTP id h13-20020a05620a244d00b006fb713618b8so1614010qkn.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 01:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDCB9fgd0Mu9h/tKpdz8x9GzaTGBDxvpI7X/JZuqRQo=;
        b=bRHv4ngMbfMoJsUZO+V9W1w7Zv9oQl5kyPRF3/lVzXpOwdy6fljkJ2NzBWB5jcSRu0
         5Zdqq7muWHyYKVctrs2+MHaDxZ/aYQieeFcMIL34JxkidP3Ks+0oe7lyazM3YFV+p/NU
         Cf1arG+26EJTshSj0X+HAumUhU230H/kXLDUenpDjxKu9Mv1cEJLgPL66k0eCcJHY3jm
         AxXjA8K7198zk/CwQ9scVcfuMgWDtV6fkdM9dcejXQFLb10gzHMJXauLGTAEGMAolpCr
         QwIf7eKwg2AT0/szfIdSnJP/+dnYXANi2vDOR3BAUOuos0kF60bRQhHIycm6+mTAicxv
         I9jg==
X-Gm-Message-State: ANoB5pkFq+uWAlr1hYIirVqYUJ4i/U+AobFakb8QH83O5H1awQc36zjI
        R/zugJgyBLZDq/avfwlPRtoJ7Odv21QRGolo94qOfbbF0V30ThmXEWVjFRJ9gaH/TUGqNSyJOuv
        jGdhAPc1REwhaPxRwlPEI
X-Received: by 2002:a05:620a:15bc:b0:6fa:e58e:f006 with SMTP id f28-20020a05620a15bc00b006fae58ef006mr938785qkk.343.1668678803248;
        Thu, 17 Nov 2022 01:53:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4qw6LjK9buAd0lPa9YkFN6rXwB2g0BN1k58Cs+CL1eITY/UeS+G+34l2ziHZXW0JYik/SYug==
X-Received: by 2002:a05:620a:15bc:b0:6fa:e58e:f006 with SMTP id f28-20020a05620a15bc00b006fae58ef006mr938774qkk.343.1668678803014;
        Thu, 17 Nov 2022 01:53:23 -0800 (PST)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a451400b006ceb933a9fesm152083qkp.81.2022.11.17.01.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 01:53:22 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        magnus.karlsson@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v1 1/1] docs: BPF_MAP_TYPE_XSKMAP
Date:   Thu, 17 Nov 2022 05:50:44 -0500
Message-Id: <20221117105044.1935488-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
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
 Documentation/bpf/map_xskmap.rst | 161 +++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 Documentation/bpf/map_xskmap.rst

diff --git a/Documentation/bpf/map_xskmap.rst b/Documentation/bpf/map_xskmap.rst
new file mode 100644
index 000000000000..5699a89851ef
--- /dev/null
+++ b/Documentation/bpf/map_xskmap.rst
@@ -0,0 +1,161 @@
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
+call ``bpf_redirect_map()`` and XDP_REDIRECT action, like 'devmap' and 'cpumap'.
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
+Typically an XSKMAP is created per netdev. This map contains an array of XSK File
+Descriptors (FDs). The number of array elements is typically set or adjusted using
+the ``max_entries`` map parameter. For AF_XDP ``max_entries`` is equal to the number
+of queues supported by the netdev.
+
+Usage
+=====
+
+Kernel BPF
+----------
+.. c:function::
+     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+
+ Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
+ For ``BPF_MAP_TYPE_XSKMAP`` this map contains references to AF_XDP socket FDs
+ for sockets attached to a netdev's queues.
+
+ .. note::
+    If the map is empty at an index, the packet is dropped. This means that it is
+    mandatory to have an XDP program loaded (and one AF_XDP socket in the XSKMAP)
+    to be able to get any traffic to user space through the socket.
+
+.. c:function::
+    void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
+
+ XSK FD entries can be retrieved using the ``bpf_map_lookup_elem()`` helper.
+
+Userspace
+---------
+.. note::
+    AF_XDP socket entries can only be updated/deleted from user space and not from
+    an eBPF program. Trying to call these functions from a kernel eBPF program will
+    result in the program failing to load and a verifier warning.
+
+.. c:function::
+   int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags)
+
+ AF_XDP socket entries can be added or updated using the ``bpf_map_update_elem()``
+ helper. The ``key`` parameter is equal to the queue_id of the queue the AF_XDP
+ socket is attaching to. And the ``value`` parameter is the file descriptor (fd))
+ value of that socket.
+
+ Under the hood, the AF_XDP map update function uses the XSK FD value to retrieve the
+ associated ``struct xdp_sock`` instance.
+
+ The flags argument can be one of the following:
+  - BPF_ANY: Create a new element or update an existing element.
+  - BPF_NOEXIST: Create a new element only if it did not exist.
+  - BPF_EXIST: Update an existing element.
+
+.. c:function::
+    int bpf_map_lookup_elem(int fd, const void *key, void *value)
+
+ AF_XDP socket entries can be retrieved using the ``bpf_map_lookup_elem()``
+ helper.
+
+.. c:function::
+    int bpf_map_delete_elem(int fd, const void *key)
+
+ AF_XDP socket entries can be deleted using the ``bpf_map_delete_elem()``
+ helper. This helper will return 0 on success, or negative error in case of
+ failure.
+
+Examples
+========
+Kernel
+------
+
+The following code snippet shows how to declare a ``BPF_MAP_TYPE_XSKMAP`` called
+``xsks_map`` and how to redirect packets to an AF_XDP socket.
+
+.. code-block:: c
+
+   struct {
+        __uint(type, BPF_MAP_TYPE_XSKMAP);
+        __type(key_size, int);
+        __type(value_size, int);
+        __uint(max_entries, 64);
+    } xsks_map SEC(".maps");
+
+
+    SEC("xdp")
+    int xsk_redir_prog(struct xdp_md *ctx)
+    {
+        int index = ctx->rx_queue_id;
+
+        if (bpf_map_lookup_elem(&xsks_map, &index))
+            return bpf_redirect_map(&xsks_map, index, 0);
+        return XDP_PASS;
+    }
+
+Userspace
+---------
+
+The following code snippet shows how to update an XSK map with an AF_XDP socket
+entry.
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
2.38.1

