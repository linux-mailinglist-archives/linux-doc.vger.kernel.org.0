Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF7A633A57
	for <lists+linux-doc@lfdr.de>; Tue, 22 Nov 2022 11:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbiKVKnK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Nov 2022 05:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiKVKmn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 05:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112F02660
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669113426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3NEjkqbxjUkxEUDTyrpzLYFI17mtBkMyjAUYIkxW6Fo=;
        b=ihalkN1AENKp6/Rt0C2f0SNGAaJ/xUAEn26TxZGzAymP+QmNOgtaTK/n1VchzlO6BjCJ6i
        8sfcpDaZdybq2xkhTwLyIMxVs5DZO1Zq0ODbB/FXoQn+49s5Eq6X6Tc5NAPFnmo1TlCXjE
        Ib63noS2dMDKCkQl5QVGYydlEju0AxM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-21gwgtT9Psm42Qdh8DRI4g-1; Tue, 22 Nov 2022 05:37:05 -0500
X-MC-Unique: 21gwgtT9Psm42Qdh8DRI4g-1
Received: by mail-wm1-f69.google.com with SMTP id l42-20020a05600c1d2a00b003cf8e70c1ecso10802578wms.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NEjkqbxjUkxEUDTyrpzLYFI17mtBkMyjAUYIkxW6Fo=;
        b=RT3svAuYEdu4Iszr7NxQj07DGxM+Pa7/WoypHRsnuRtumXf+YYHjWNdLZ28dvxiBUN
         L+gTIkjo2pnGMnr4QKFOViRlYRuSlYXC10pJfJEjQbvlDsME1LpwDeEQVX8Gh+p5DTf+
         PXUfODjk5ltdx9B2ZygsMoq2B+bC/GFUM8KKUQhGe+6AJGxwfY6yVNai8mmL3NZM6ZQx
         vX27YM+mY/wZNMKl2YooA++Jcp2YlKrNen4SiOTIqgTSsoUzuVZWkri1szBhiByi3V7a
         svWAXqLKXhwUUBApelv9WzblNHrTuNHjux6re9eLrCl7IPDTHPmiz04+LflQ57YpkSMv
         Tvkg==
X-Gm-Message-State: ANoB5pmgVe0rB9VtkqPOVx2DLjef4YmYYb5qS8KW013IsbawUmpmnxa+
        iFLFLN4G8OwrLCaRPTRKuf/+7HWbZEGIeWWY8y3zNc2QCzru4dVpdeV0RFaUr2x8YhOBryTLdwg
        /Hcp/DHvX216whEp3vb9r
X-Received: by 2002:a05:600c:6012:b0:3cf:cb16:f242 with SMTP id az18-20020a05600c601200b003cfcb16f242mr7435588wmb.82.1669113423795;
        Tue, 22 Nov 2022 02:37:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6p8D5VvgjIBwkbfqp5sV7dS94mBbEnmIlEhp+QED3grOzUggm/iAI1wJbifUS0hpxf5d+tcw==
X-Received: by 2002:a05:600c:6012:b0:3cf:cb16:f242 with SMTP id az18-20020a05600c601200b003cfcb16f242mr7435565wmb.82.1669113423501;
        Tue, 22 Nov 2022 02:37:03 -0800 (PST)
Received: from teaching-eagle.redhat.com ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6f1732f65sm24013332wmp.38.2022.11.22.02.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:37:03 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        magnus.karlsson@gmail.com, akiyks@gmail.com,
        Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v4 1/1] docs: BPF_MAP_TYPE_XSKMAP
Date:   Tue, 22 Nov 2022 10:37:01 +0000
Message-Id: <20221122103701.65867-1-mtahhan@redhat.com>
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
v4:
- Add more details about AF_XDP sockets and where to find
  relevant info.
- Fixup typos.
- Remove ``c:function::`` block directives.
- Replace spaces with tabs in code blocks.

v3:
- Fixed duplicate function warnings from Sphinx >= 3.3.

v2:
- Fixed typos + incorrect return type references.
- Adjusted examples to use __u32 and fixed references to key_size.
- Changed `AF_XDP socket` references to XSK.
- Added note re map key and value size.
---
 Documentation/bpf/map_xskmap.rst | 192 +++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/bpf/map_xskmap.rst

diff --git a/Documentation/bpf/map_xskmap.rst b/Documentation/bpf/map_xskmap.rst
new file mode 100644
index 000000000000..990010952d2f
--- /dev/null
+++ b/Documentation/bpf/map_xskmap.rst
@@ -0,0 +1,192 @@
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
+This map type redirects raw XDP frames to `AF_XDP`_ sockets (XSKs), a new type of
+address family in the Kernel that allows redirection of frames from a driver to
+userspace without having to traverse the full network stack. An AF_XDP socket
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
+    |  | BPF     |-- redirect -->+-------------+-------------+
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
+.. note::
+    Both the map key and map value size must be 4 bytes.
+
+Usage
+=====
+
+Kernel BPF
+----------
+bpf_redirect_map()
+^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
+    long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
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
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
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
+    an BPF program. Trying to call these functions from a kernel BPF program will
+    result in the program failing to load and a verifier warning.
+
+bpf_map_update_elem()
+^^^^^^^^^^^^^^^^^^^^^
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
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
+    int bpf_map_lookup_elem(int fd, const void *key, void *value)
+
+Returns ``struct xdp_sock *`` or negative error in case of failure.
+
+bpf_map_delete_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
+    int bpf_map_delete_elem(int fd, const void *key)
+
+XSK entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
+
+.. note::
+    When `libxdp`_ deletes an XSK it also removes the associated socket
+    entry from the XSKMAP.
+
+Examples
+========
+Kernel
+------
+
+The following code snippet shows how to declare a ``BPF_MAP_TYPE_XSKMAP`` called
+``xsks_map`` and how to redirect packets to an XSK.
+
+.. code-block:: c
+
+	struct {
+		__uint(type, BPF_MAP_TYPE_XSKMAP);
+		__type(key, __u32);
+		__type(value, __u32);
+		__uint(max_entries, 64);
+	} xsks_map SEC(".maps");
+
+
+	SEC("xdp")
+	int xsk_redir_prog(struct xdp_md *ctx)
+	{
+		__u32 index = ctx->rx_queue_index;
+
+		if (bpf_map_lookup_elem(&xsks_map, &index))
+			return bpf_redirect_map(&xsks_map, index, 0);
+		return XDP_PASS;
+	}
+
+Userspace
+---------
+
+The following code snippet shows how to update an XSKMAP with an XSK entry.
+
+.. code-block:: c
+
+	int update_xsks_map(struct bpf_map *xsks_map, int queue_id, int xsk_fd)
+	{
+		int ret;
+
+		ret = bpf_map_update_elem(bpf_map__fd(xsks_map), &queue_id, &xsk_fd, 0);
+		if (ret < 0)
+			fprintf(stderr, "Failed to update xsks_map: %s\n", strerror(errno));
+
+		return ret;
+	}
+
+For an example on how create AF_XDP sockets, please see the AF_XDP-example and
+AF_XDP-forwarding programs in the `bpf-examples`_ directory in the `libxdp`_ repository.
+For a detailed explaination of the AF_XDP interface please see:
+
+- `libxdp-readme`_.
+- `AF_XDP`_ Kernel documentation.
+
+.. note::
+    The most comprehensive resource for using XSKMAPs and AF_XDP is `libxdp`_.
+
+.. _libxdp: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp
+.. _AF_XDP: https://www.kernel.org/doc/html/latest/networking/af_xdp.html
+.. _bpf-examples: https://github.com/xdp-project/bpf-examples
+.. _libxdp-readme: https://github.com/xdp-project/xdp-tools/tree/master/lib/libxdp#using-af_xdp-sockets
-- 
2.34.1

