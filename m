Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316EA63555D
	for <lists+linux-doc@lfdr.de>; Wed, 23 Nov 2022 10:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbiKWJSQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Nov 2022 04:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237386AbiKWJR4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:17:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA13A87578
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669194984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CWnd1irc68q6Hao6FJ5tfiG87wtoff6EE+eKHivxtgg=;
        b=WcqE1eDMnHxwDZJDH5F5/w9RAQkgR9xBxnvbiG3Tw1VI0lXuj71zELYt0UxbrPfMqyv8rZ
        dtjD3iVeDWNhdN2l8GY0lgq3zr+N5OkVkC22vR7ceEqsL0ujFODsqZcwJ65GG+JA0XInP9
        FLnhvjsOW27P8e8Fk4ndGYSYVW9BFBw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-asU4Qx6cPOK1Ge-Fm7dbcA-1; Wed, 23 Nov 2022 04:16:23 -0500
X-MC-Unique: asU4Qx6cPOK1Ge-Fm7dbcA-1
Received: by mail-wm1-f69.google.com with SMTP id ay40-20020a05600c1e2800b003cf8aa16377so9351497wmb.7
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWnd1irc68q6Hao6FJ5tfiG87wtoff6EE+eKHivxtgg=;
        b=e0Nn9e53QIQOe3EvcZzK1MbRyHrXejs5rLvyO9JNJRCTDHc5kE4jMr/3HgbTepqSM9
         1vnsoQ0f/I4snmjRWORav49QpVDBA6UT9obEyQhy1B1rJZTHqnqoRQ14K8UyDS4D2/OO
         8WCMqWJrCIZxz1SJ7YTQYpl/Uf3M+fYmZvuv6EARJdh2w2yRjGg7/ikiAKcJCX9UBk1l
         +fMN0G0k0EhebW6Gt+7kvRjvs6IkMQQehy5ao7SlqkJpM7xrr3WG9YK6F3e7wJsvRjCz
         tArc+8iDwVSbhOZKVrO1/LQ2v9tJ5s1P341mk4fHhum1GBm795x2I+Mxk3XX91j/1aMX
         k5dA==
X-Gm-Message-State: ANoB5pliuqpvJLR51uiaWF8xxTu6rPPc37d3MuASG9aIOA5KJlfW+oH+
        gSDUDXXrqCYDFP4gkBwf4t0+b4hcJWCmSe7EfksB4y/J+sVaXQwB/bRQBWi9hRJlIXhyrFAHd3y
        aQ4/fACJKaaBmtSTLZzVF
X-Received: by 2002:a5d:56c9:0:b0:236:5d8b:dd9c with SMTP id m9-20020a5d56c9000000b002365d8bdd9cmr8588671wrw.283.1669194981596;
        Wed, 23 Nov 2022 01:16:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf767KSQolEcID7pbg6ywHT25xXeIs5tRpkwhd0Gmbfahq9HuFAVEg6+doTgZNyGHzX2guWoDw==
X-Received: by 2002:a5d:56c9:0:b0:236:5d8b:dd9c with SMTP id m9-20020a5d56c9000000b002365d8bdd9cmr8588648wrw.283.1669194981278;
        Wed, 23 Nov 2022 01:16:21 -0800 (PST)
Received: from localhost.localdomain ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm16008369wrx.11.2022.11.23.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 01:16:20 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>,
        David Vernet <void@manifault.com>
Subject: [PATCH bpf-next v2 2/2] docs: fix sphinx warnings for devmap
Date:   Wed, 23 Nov 2022 09:15:20 +0000
Message-Id: <20221123091520.87289-3-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123091520.87289-1-mtahhan@redhat.com>
References: <20221123091520.87289-1-mtahhan@redhat.com>
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

Sphinx version >=3.3 warns about duplicate function declarations in the
DEVMAP documentation. This is because the function name is the same for
kernel and user space BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
Acked-by: David Vernet <void@manifault.com>
---
 Documentation/bpf/map_devmap.rst | 68 ++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/Documentation/bpf/map_devmap.rst b/Documentation/bpf/map_devmap.rst
index f64da348dbfe..927312c7b8c8 100644
--- a/Documentation/bpf/map_devmap.rst
+++ b/Documentation/bpf/map_devmap.rst
@@ -29,8 +29,11 @@ Usage
 =====
 Kernel BPF
 ----------
-.. c:function::
-     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+bpf_redirect_map()
+^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
+    long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
 
 Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
 For ``BPF_MAP_TYPE_DEVMAP`` and ``BPF_MAP_TYPE_DEVMAP_HASH`` this map contains
@@ -56,26 +59,32 @@ lower bits of the ``flags`` argument if the map lookup fails.
 
 More information about redirection can be found :doc:`redirect`
 
-.. c:function::
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
    void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
 
 Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
 helper.
 
-Userspace
----------
+User space
+----------
 .. note::
     DEVMAP entries can only be updated/deleted from user space and not
     from an eBPF program. Trying to call these functions from a kernel eBPF
     program will result in the program failing to load and a verifier warning.
 
-.. c:function::
+bpf_map_update_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
    int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
 
- Net device entries can be added or updated using the ``bpf_map_update_elem()``
- helper. This helper replaces existing elements atomically. The ``value`` parameter
- can be ``struct bpf_devmap_val`` or a simple ``int ifindex`` for backwards
- compatibility.
+Net device entries can be added or updated using the ``bpf_map_update_elem()``
+helper. This helper replaces existing elements atomically. The ``value`` parameter
+can be ``struct bpf_devmap_val`` or a simple ``int ifindex`` for backwards
+compatibility.
 
  .. code-block:: c
 
@@ -87,35 +96,42 @@ Userspace
         } bpf_prog;
     };
 
- The ``flags`` argument can be one of the following:
-
+The ``flags`` argument can be one of the following:
   - ``BPF_ANY``: Create a new element or update an existing element.
   - ``BPF_NOEXIST``: Create a new element only if it did not exist.
   - ``BPF_EXIST``: Update an existing element.
 
- DEVMAPs can associate a program with a device entry by adding a ``bpf_prog.fd``
- to ``struct bpf_devmap_val``. Programs are run after ``XDP_REDIRECT`` and have
- access to both Rx device and Tx device. The  program associated with the ``fd``
- must have type XDP with expected attach type ``xdp_devmap``.
- When a program is associated with a device index, the program is run on an
- ``XDP_REDIRECT`` and before the buffer is added to the per-cpu queue. Examples
- of how to attach/use xdp_devmap progs can be found in the kernel selftests:
+DEVMAPs can associate a program with a device entry by adding a ``bpf_prog.fd``
+to ``struct bpf_devmap_val``. Programs are run after ``XDP_REDIRECT`` and have
+access to both Rx device and Tx device. The  program associated with the ``fd``
+must have type XDP with expected attach type ``xdp_devmap``.
+When a program is associated with a device index, the program is run on an
+``XDP_REDIRECT`` and before the buffer is added to the per-cpu queue. Examples
+of how to attach/use xdp_devmap progs can be found in the kernel selftests:
 
- - ``tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c``
- - ``tools/testing/selftests/bpf/progs/test_xdp_with_devmap_helpers.c``
+- ``tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c``
+- ``tools/testing/selftests/bpf/progs/test_xdp_with_devmap_helpers.c``
+
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
 .. c:function::
    int bpf_map_lookup_elem(int fd, const void *key, void *value);
 
- Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
- helper.
+Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
+helper.
+
+bpf_map_delete_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
 .. c:function::
    int bpf_map_delete_elem(int fd, const void *key);
 
- Net device entries can be deleted using the ``bpf_map_delete_elem()``
- helper. This helper will return 0 on success, or negative error in case of
- failure.
+Net device entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
 
 Examples
 ========
-- 
2.34.1

