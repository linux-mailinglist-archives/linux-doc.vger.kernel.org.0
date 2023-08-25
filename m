Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DE5788750
	for <lists+linux-doc@lfdr.de>; Fri, 25 Aug 2023 14:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241325AbjHYM3V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Aug 2023 08:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244856AbjHYM3B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 08:29:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E3F210D;
        Fri, 25 Aug 2023 05:28:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ffae5bdc9aso1331949e87.1;
        Fri, 25 Aug 2023 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692966491; x=1693571291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr6Z0KjbLtXrx/+nXqqp9mz6pHwXEui3z1GvcE4Z0T8=;
        b=HwZb97Z0npMqIQAGHdpTUlkDGr5vd8r/qnnj32K7owPj30p3jC2OaZxMvbQTffthGT
         dBxBOxTd4G1pKpVUDj/3opvnMOt3Wx0PWncxM9iNSrQeiPZUjdfjLl3Esxph5Z/UDfMh
         iSf20xZOHx/cK4/dvyOi11002FDeTTbimrO/i1rw1DMlVtFTWBUqLoHZSvW9gK1sPkKP
         4xxy2yUPTvsTV3LVD3mfSdV3Dy0/3m//X3A5SqoCgzIg38Ejd8Q4aVjOzs5Fru3+9WBq
         ymJAvBM1yG44GxQ/uUmXGRmeyTnijyUlBPynqR/lFZkmJEx3LFPZfp9tzXJt4v3A+nz7
         G4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966491; x=1693571291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr6Z0KjbLtXrx/+nXqqp9mz6pHwXEui3z1GvcE4Z0T8=;
        b=k+EvXLXDRbALkEpMF0HPMjcFC2xlpES32WzDWnBiAOT+S9A58MNnonN9tDPi8Ur8rw
         RpctaDMHZN+6OMAplWzlz7jFWCWQKRg/0XwpjHux0BwliRts2+9E44TLFkCMJAZRXvjF
         ZirIpqZoplUuKtL4pv702jM/7xjrNYh26Yk3EPpMprrSAeFlxMbm+7naQgShK9saqxdP
         NjaD9NsnDuACjTIHPisH3rtvzg7KsufzHZBrpn/seR2PqbtpoqZG9p+SG6hiRpMpxn29
         cenOM/yG1vDg47RWJWlZiDsXcB4o4xPG1MSS+pX+2Gzok3gWNihrsZu2PWRtFhzl1k9Y
         HnCg==
X-Gm-Message-State: AOJu0YwKS9J8L5Dh3++j/2vZe3g5OFhWQT6qd/BtlVBdhzDf6UH5WOC8
        EpgvA/h682AFt4xJTwVd/anDFknj+ZVCGQ==
X-Google-Smtp-Source: AGHT+IH1B7U5eJc9IPNHkPJmED3OA7g6rGWPvSZ9EZ5XY6O77uxxj2eQnIFBjvDhmcACu3FwNojSJw==
X-Received: by 2002:a05:6512:a94:b0:4fe:c4e:709f with SMTP id m20-20020a0565120a9400b004fe0c4e709fmr15846601lfu.20.1692966490877;
        Fri, 25 Aug 2023 05:28:10 -0700 (PDT)
Received: from imac.taild7a78.ts.net ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm2089561wmf.16.2023.08.25.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 05:28:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 03/12] doc/netlink: Update genetlink-legacy documentation
Date:   Fri, 25 Aug 2023 13:27:46 +0100
Message-ID: <20230825122756.7603-4-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
References: <20230825122756.7603-1-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for recently added genetlink-legacy schema attributes.
Remove statements about 'work in progress' and 'todo'.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 Documentation/core-api/netlink.rst            |  9 ++++---
 .../netlink/genetlink-legacy.rst              | 26 ++++++++++++-------
 Documentation/userspace-api/netlink/specs.rst | 13 ++++++++++
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/netlink.rst b/Documentation/core-api/netlink.rst
index e4a938a05cc9..9f692b02bfe6 100644
--- a/Documentation/core-api/netlink.rst
+++ b/Documentation/core-api/netlink.rst
@@ -67,10 +67,11 @@ Globals
 kernel-policy
 ~~~~~~~~~~~~~
 
-Defines if the kernel validation policy is per operation (``per-op``)
-or for the entire family (``global``). New families should use ``per-op``
-(default) to be able to narrow down the attributes accepted by a specific
-command.
+Defines whether the kernel validation policy is ``global`` i.e. the same for all
+operations of the family, defined for each operation individually - ``per-op``,
+or separately for each operation and operation type (do vs dump) - ``split``.
+New families should use ``per-op`` (default) to be able to narrow down the
+attributes accepted by a specific command.
 
 checks
 ------
diff --git a/Documentation/userspace-api/netlink/genetlink-legacy.rst b/Documentation/userspace-api/netlink/genetlink-legacy.rst
index 802875a37a27..40b82ad5d54a 100644
--- a/Documentation/userspace-api/netlink/genetlink-legacy.rst
+++ b/Documentation/userspace-api/netlink/genetlink-legacy.rst
@@ -8,11 +8,8 @@ This document describes the many additional quirks and properties
 required to describe older Generic Netlink families which form
 the ``genetlink-legacy`` protocol level.
 
-The spec is a work in progress, some of the quirks are just documented
-for future reference.
-
-Specification (defined)
-=======================
+Specification
+=============
 
 Attribute type nests
 --------------------
@@ -156,16 +153,27 @@ it will be allocated 3 for the request (``a`` is the previous operation
 with a request section and the value of 2) and 8 for response (``c`` is
 the previous operation in the "from-kernel" direction).
 
-Other quirks (todo)
-===================
+Other quirks
+============
 
 Structures
 ----------
 
 Legacy families can define C structures both to be used as the contents of
 an attribute and as a fixed message header. Structures are defined in
-``definitions``  and referenced in operations or attributes. Note that
-structures defined in YAML are implicitly packed according to C
+``definitions``  and referenced in operations or attributes.
+
+members
+~~~~~~~
+
+ - ``name`` - The attribute name of the struct member
+ - ``type`` - One of the scalar types ``u8``, ``u16``, ``u32``, ``u64``, ``s8``,
+   ``s16``, ``s32``, ``s64``, ``string`` or ``binary``.
+ - ``byte-order`` - ``big-endian`` or ``little-endian``
+ - ``doc``, ``enum``, ``enum-as-flags``, ``display-hint`` - Same as for
+   :ref:`attribute definitions <attribute_properties>`
+
+Note that structures defined in YAML are implicitly packed according to C
 conventions. For example, the following struct is 4 bytes, not 6 bytes:
 
 .. code-block:: c
diff --git a/Documentation/userspace-api/netlink/specs.rst b/Documentation/userspace-api/netlink/specs.rst
index 2e4acde890b7..cc4e2430997e 100644
--- a/Documentation/userspace-api/netlink/specs.rst
+++ b/Documentation/userspace-api/netlink/specs.rst
@@ -68,6 +68,10 @@ The following sections describe the properties of the most modern ``genetlink``
 schema. See the documentation of :doc:`genetlink-c <c-code-gen>`
 for information on how C names are derived from name properties.
 
+See also :ref:`Documentation/core-api/netlink.rst <kernel_netlink>` for
+information on the Netlink specification properties that are only relevant to
+the kernel space and not part of the user space API.
+
 genetlink
 =========
 
@@ -180,6 +184,8 @@ attributes
 
 List of attributes in the set.
 
+.. _attribute_properties:
+
 Attribute properties
 --------------------
 
@@ -264,6 +270,13 @@ a C array of u32 values can be specified with ``type: binary`` and
 ``sub-type: u32``. Binary types and legacy array formats are described in
 more detail in :doc:`genetlink-legacy`.
 
+display-hint
+~~~~~~~~~~~~
+
+Optional format indicator that is intended only for choosing the right
+formatting mechanism when displaying values of this type. Currently supported
+hints are ``hex``, ``mac``, ``fddi``, ``ipv4``, ``ipv6`` and ``uuid``.
+
 operations
 ----------
 
-- 
2.41.0

