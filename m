Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD2424D1E8
	for <lists+linux-doc@lfdr.de>; Fri, 21 Aug 2020 12:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgHUKCz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Aug 2020 06:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbgHUKCt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Aug 2020 06:02:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BD8C061388
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2020 03:02:30 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w25so1184044ljo.12
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2020 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zq6O6XNtbvMJ85OSmttR2Y1SxK+5YaiE+8rmcNArx0=;
        b=SFQ3Sp3NHvIsGDthPzkjEFDi8Tet3ENIUgQ6XH9GFtNUt78oPw4osTvSZkyOmPV4Fu
         1IPyt2I/vq4sN9mMoDFgBLEXJ10S0cvBzw252bZLDhZMpuOre2P2AEiLHe1eEN7Ur7G6
         ek/cAepg4rRlYhGsQLqtkGuxZ/thXGAnSB5ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zq6O6XNtbvMJ85OSmttR2Y1SxK+5YaiE+8rmcNArx0=;
        b=LJbpuLwHLhgXAAN1ibmmsOjkHbrxk3xNPwoJq5HiHkGTSZMCDPc4k85ijQj2LYirfX
         J82Y8nLeYSL4IpH3OBlhI/q7FPPcijJ7+jvrp9lQ+AC690GLjocTYIA5k51DXipqc1YG
         O6KqsrEak5kEZeT8vCOoOxrLpkFAArA26Sj2D7eU3l8d0+Vi1fKifU/2aHueJs/4p48v
         8UV581/58WuQQy96gL4E1zi+AXzKv49zZjK5e3esekWaHsN2+Mr0S0ddJ3yvLzEOHRmn
         A7cQLgafQBI94p2qF1W5u6QmAPA5ZDczWybbEtNVzM7dwkvML9OLxyn/x+OGtfs0RazW
         yjvw==
X-Gm-Message-State: AOAM532hDpNRBBtf/NRcUqvt3NPyW8qi21XwXxdbULz5lUBvVYwCYsY9
        Xfk8/l3/hEUBy3+QWuEFURngj2eP8oZ2Vg==
X-Google-Smtp-Source: ABdhPJwABrPiP6Y65sRymDtE7PCvbRbx4RnVMkhd2+a8xd7U4712s3LREP06ZoJ4hF8AiWPmYWk1Wg==
X-Received: by 2002:a2e:7c18:: with SMTP id x24mr1131278ljc.402.1598004148054;
        Fri, 21 Aug 2020 03:02:28 -0700 (PDT)
Received: from cloudflare.com ([176.221.114.230])
        by smtp.gmail.com with ESMTPSA id g11sm288215lfc.46.2020.08.21.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:02:27 -0700 (PDT)
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     linux-doc@vger.kernel.org
Cc:     netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@cloudflare.com,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>
Subject: [PATCH] bpf: sk_lookup: Add user documentation
Date:   Fri, 21 Aug 2020 12:02:26 +0200
Message-Id: <20200821100226.403844-1-jakub@cloudflare.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Describe the purpose of BPF sk_lookup program, how it can be attached, when
it gets invoked, and what information gets passed to it. Point the reader
to examples and further documentation.

Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
---
 Documentation/bpf/index.rst          |  1 +
 Documentation/bpf/prog_sk_lookup.rst | 98 ++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/bpf/prog_sk_lookup.rst

diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 7df2465fd108..4f2874b729c3 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -52,6 +52,7 @@ Program types
    prog_cgroup_sysctl
    prog_flow_dissector
    bpf_lsm
+   prog_sk_lookup
 
 
 Map types
diff --git a/Documentation/bpf/prog_sk_lookup.rst b/Documentation/bpf/prog_sk_lookup.rst
new file mode 100644
index 000000000000..85a305c19bcd
--- /dev/null
+++ b/Documentation/bpf/prog_sk_lookup.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+=====================
+BPF sk_lookup program
+=====================
+
+BPF sk_lookup program type (``BPF_PROG_TYPE_SK_LOOKUP``) introduces programmability
+into the socket lookup performed by the transport layer when a packet is to be
+delivered locally.
+
+When invoked BPF sk_lookup program can select a socket that will receive the
+incoming packet by calling the ``bpf_sk_assign()`` BPF helper function.
+
+Hooks for a common attach point (``BPF_SK_LOOKUP``) exist for both TCP and UDP.
+
+Motivation
+==========
+
+BPF sk_lookup program type was introduced to address setup scenarios where
+binding sockets to an address with ``bind()`` socket call is impractical, such
+as:
+
+1. receiving connections on a range of IP addresses, e.g. 192.0.2.0/24, when
+   binding to a wildcard address ``INADRR_ANY`` is not possible due to a port
+   conflict,
+2. receiving connections on all or a wide range of ports, i.e. an L7 proxy use
+   case.
+
+Such setups would require creating and ``bind()``'ing one socket to each of the
+IP address/port in the range, leading to resource consumption and potential
+latency spikes during socket lookup.
+
+Attachment
+==========
+
+BPF sk_lookup program can be attached to a network namespace with
+``bpf(BPF_LINK_CREATE, ...)`` syscall using the ``BPF_SK_LOOKUP`` attach type and a
+netns FD as attachment ``target_fd``.
+
+Multiple programs can be attached to one network namespace. Programs will be
+invoked in the same order as they were attached.
+
+Hooks
+=====
+
+The attached BPF sk_lookup programs run whenever the transport layer needs to
+find a listening (TCP) or an unconnected (UDP) socket for an incoming packet.
+
+Incoming traffic to established (TCP) and connected (UDP) sockets is delivered
+as usual without triggering the BPF sk_lookup hook.
+
+The attached BPF programs must return with either ``SK_PASS`` or ``SK_DROP``
+verdict code. As for other BPF program types that are network filters,
+``SK_PASS`` signifies that the socket lookup should continue on to regular
+hashtable-based lookup, while ``SK_DROP`` causes the transport layer to drop the
+packet.
+
+A BPF sk_lookup program can also select a socket to receive the packet by
+calling ``bpf_sk_assign()`` BPF helper. Typically, the program looks up a socket
+in a map holding sockets, such as ``SOCKMAP`` or ``SOCKHASH``, and passes a
+``struct bpf_sock *`` to ``bpf_sk_assign()`` helper to record the
+selection. Selecting a socket only takes effect if the program has terminated
+with ``SK_PASS`` code.
+
+When multiple programs are attached, the end result is determined from return
+codes of all the programs according to the following rules:
+
+1. If any program returned ``SK_PASS`` and selected a valid socket, the socket
+   is used as the result of the socket lookup.
+2. If more than one program returned ``SK_PASS`` and selected a socket, the last
+   selection takes effect.
+3. If any program returned ``SK_DROP``, and no program returned ``SK_PASS`` and
+   selected a socket, socket lookup fails.
+4. If all programs returned ``SK_PASS`` and none of them selected a socket,
+   socket lookup continues on.
+
+API
+===
+
+In its context, an instance of ``struct bpf_sk_lookup``, BPF sk_lookup program
+receives information about the packet that triggered the socket lookup. Namely:
+
+* IP version (``AF_INET`` or ``AF_INET6``),
+* L4 protocol identifier (``IPPROTO_TCP`` or ``IPPROTO_UDP``),
+* source and destination IP address,
+* source and destination L4 port,
+* the socket that has been selected with ``bpf_sk_assign()``.
+
+Refer to ``struct bpf_sk_lookup`` declaration in ``linux/bpf.h`` user API
+header, and `bpf-helpers(7)
+<https://man7.org/linux/man-pages/man7/bpf-helpers.7.html>`_ man-page section
+for ``bpf_sk_assign()`` for details.
+
+Example
+=======
+
+See ``tools/testing/selftests/bpf/prog_tests/sk_lookup.c`` for the reference
+implementation.
-- 
2.25.4

