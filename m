Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA8B63553F
	for <lists+linux-doc@lfdr.de>; Wed, 23 Nov 2022 10:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237383AbiKWJQo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Nov 2022 04:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbiKWJQ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 04:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6DA107E64
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669194927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oRXRsO8/e/+wD/x2i3+RJoWx0WjJz2M9yYxlaD5dpSA=;
        b=c+joJQdCIPcAUkFo2o9LKqlNNWg++OTqGnJGfRQVwtGnzF7r+vpUllPsZNwbx1YrK29ZSJ
        kaWu3gTgAWIx0NLfqqfDcez3LwpLdqb3QWvG+9TRK2JevT5Pf6f7kjmGRR8Xw78rSbO0/u
        jOl5mTc/LFZNjQ2cVRz1r6lHVoqGegc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-D4IkgLKKMyS8A9mu3Xnbjg-1; Wed, 23 Nov 2022 04:15:26 -0500
X-MC-Unique: D4IkgLKKMyS8A9mu3Xnbjg-1
Received: by mail-wm1-f71.google.com with SMTP id q12-20020a1ce90c000000b003d00f3fe1e7so587767wmc.4
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 01:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRXRsO8/e/+wD/x2i3+RJoWx0WjJz2M9yYxlaD5dpSA=;
        b=HmtNTyNGxKd/KyiTH/bZumCfVn3V3AQ0TOz4ukZrSHoYZukBux0RrwBRc2/Z8xVs3E
         1lC9P5ZMxDAlPSdwFo3ux6sL8oxpblWDT+ATfImLYG1V3E1gXbBXo7lgaZ/lCRotDWkY
         U5tk6I3/FmvD0Q8u4BOeSkmNTtWCsksutYaLM+dlCltsQUIB47mmSjHC7nNXcgeVfV+a
         ehxxm+m669ojFAMPUBrevQ435b97+QI2J9KUHelhAqRHL5MUv1/LapJfWbgjE8Ksbd+g
         VEEDy1KIjCJVQNeEvMvC9f+W+5dXvphPwuGFdDQTKRe1zGDTlJssY9qgfrwdVJI3q13v
         WWNw==
X-Gm-Message-State: ANoB5pkEcQjcDAQ3OWHM2/fPr/fzsxzxbqm2yHhtPt6oAorQaN0pDcmG
        Q1106ejXmji0M9KFL7vFLrm4TmWdcB1Xo1yu3Je9bqM1hsSGJxwuAXuS52ctn4Ov86dfunyRtgB
        l85JQWnKvgOvom5vx0Kgv
X-Received: by 2002:adf:ef0c:0:b0:241:e4cc:f03d with SMTP id e12-20020adfef0c000000b00241e4ccf03dmr3882687wro.43.1669194925089;
        Wed, 23 Nov 2022 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf78YyUnqWUmXurkk9eBK0p6XvhtGOBou0NH1pECyUrbB8XshQZzNOF44CUDFcWuiTYX0y3Y3w==
X-Received: by 2002:adf:ef0c:0:b0:241:e4cc:f03d with SMTP id e12-20020adfef0c000000b00241e4ccf03dmr3882667wro.43.1669194924859;
        Wed, 23 Nov 2022 01:15:24 -0800 (PST)
Received: from localhost.localdomain ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm16008369wrx.11.2022.11.23.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 01:15:24 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>,
        David Vernet <void@manifault.com>
Subject: [PATCH bpf-next v2 1/2] docs: fix sphinx warnings for cpumap
Date:   Wed, 23 Nov 2022 09:15:19 +0000
Message-Id: <20221123091520.87289-2-mtahhan@redhat.com>
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
CPUMAP documentation. This is because the function name is the same for
kernel and user space BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
Acked-by: David Vernet <void@manifault.com>
---
 Documentation/bpf/map_cpumap.rst | 56 +++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/Documentation/bpf/map_cpumap.rst b/Documentation/bpf/map_cpumap.rst
index 61a797a86342..923cfc8ab51f 100644
--- a/Documentation/bpf/map_cpumap.rst
+++ b/Documentation/bpf/map_cpumap.rst
@@ -30,29 +30,35 @@ Usage
 
 Kernel BPF
 ----------
-.. c:function::
+bpf_redirect_map()
+^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
      long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
 
- Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
- For ``BPF_MAP_TYPE_CPUMAP`` this map contains references to CPUs.
+Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
+For ``BPF_MAP_TYPE_CPUMAP`` this map contains references to CPUs.
 
- The lower two bits of ``flags`` are used as the return code if the map lookup
- fails. This is so that the return value can be one of the XDP program return
- codes up to ``XDP_TX``, as chosen by the caller.
+The lower two bits of ``flags`` are used as the return code if the map lookup
+fails. This is so that the return value can be one of the XDP program return
+codes up to ``XDP_TX``, as chosen by the caller.
 
-Userspace
----------
+User space
+----------
 .. note::
     CPUMAP entries can only be updated/looked up/deleted from user space and not
     from an eBPF program. Trying to call these functions from a kernel eBPF
     program will result in the program failing to load and a verifier warning.
 
-.. c:function::
+bpf_map_update_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
     int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
 
- CPU entries can be added or updated using the ``bpf_map_update_elem()``
- helper. This helper replaces existing elements atomically. The ``value`` parameter
- can be ``struct bpf_cpumap_val``.
+CPU entries can be added or updated using the ``bpf_map_update_elem()``
+helper. This helper replaces existing elements atomically. The ``value`` parameter
+can be ``struct bpf_cpumap_val``.
 
  .. code-block:: c
 
@@ -64,23 +70,29 @@ Userspace
         } bpf_prog;
     };
 
- The flags argument can be one of the following:
+The flags argument can be one of the following:
   - BPF_ANY: Create a new element or update an existing element.
   - BPF_NOEXIST: Create a new element only if it did not exist.
   - BPF_EXIST: Update an existing element.
 
-.. c:function::
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
     int bpf_map_lookup_elem(int fd, const void *key, void *value);
 
- CPU entries can be retrieved using the ``bpf_map_lookup_elem()``
- helper.
+CPU entries can be retrieved using the ``bpf_map_lookup_elem()``
+helper.
+
+bpf_map_delete_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
-.. c:function::
     int bpf_map_delete_elem(int fd, const void *key);
 
- CPU entries can be deleted using the ``bpf_map_delete_elem()``
- helper. This helper will return 0 on success, or negative error in case of
- failure.
+CPU entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
 
 Examples
 ========
@@ -141,8 +153,8 @@ The following code snippet shows how to declare a ``BPF_MAP_TYPE_CPUMAP`` called
         return bpf_redirect_map(&cpu_map, cpu_dest, 0);
     }
 
-Userspace
----------
+User space
+----------
 
 The following code snippet shows how to dynamically set the max_entries for a
 CPUMAP to the max number of cpus available on the system.
-- 
2.34.1

