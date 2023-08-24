Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E1F786DAB
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 13:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240921AbjHXLUx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Aug 2023 07:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240405AbjHXLUW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 07:20:22 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6156110F3;
        Thu, 24 Aug 2023 04:20:19 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso101336731fa.3;
        Thu, 24 Aug 2023 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692876017; x=1693480817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjFlGgYJ/VcknJ4bSD+VlvLuImhlEceVylX6Iw9THjg=;
        b=BcJKEZxHEuoyqAlluItBaspKbtf/bSHt1q5xDQVvKnEI3/JPIjIjVN+FY1T4plvNj3
         Jx+AquFYeDKt3PMkHAJYmvbyUMFqsOV81JlunzcY1eH8OXlOPWXDPGQvDvIIaE2Jh28y
         l9l3jECbDbXGrUCRh+puyFwGqjeIocJiiEftQTUqgamGoib7z8KJoMmlEyLErWmwq9Hx
         Fivt1dXx0PRqqnMEEz7cXmwDDVcHrUkvDxYH0qBLQsfTrkWqbpTbEPx+aOV1dPYwuwN8
         waawkUWPZDsuV0JxMRvnumzqG73tDCQ1oYWZ6xxv+QdJWqwsmH95xbK5tvXJarBU8OY4
         QbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876017; x=1693480817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjFlGgYJ/VcknJ4bSD+VlvLuImhlEceVylX6Iw9THjg=;
        b=eQxxZRudPJtY6/SR4jDY46qQg8zjMitc4cSsShFYKrgNiv7qlvKK8uH1mPJsmwdwoK
         4dCeHgTqU3AOYFo4ZOnYMuG9wnp0k9yj9enqh55mpuEp0OYKoF2DyMWpvZLF1Gh6WEul
         SLBRWwQP00aA53iMLqZSdimxhCa3LahZZ7RQpvOBCJhiXHNT/y3H8gOVLgwWBYeClqek
         f2b9+wAMwoEPevP29VYpjVk8OEaaBN1TvYET4tr6LM6vstHY8up9wKc0+Tj7oHfJjWy3
         CUoTDZJ7iSbOsFSNDMynP9bamjy2Fcymw5GnjFStkE2XHmuOhZgASBkKAnGIIh8N+qV0
         NDKg==
X-Gm-Message-State: AOJu0YxYaKd4OW+QIDByS/ZjELbydDTo0ACiZstL2V2yvxPq7RQp/JS/
        1h87TFNCjboPmp1e21zpydGyEeQ7AjJrUA==
X-Google-Smtp-Source: AGHT+IHDXcTupMSrwHNAoB7kc+1UaLJPbzmoOCeGlW/obiu8wtvmSFiFAupE/+79+34I0J4k5ob9wQ==
X-Received: by 2002:a2e:888f:0:b0:2b9:cd79:8f94 with SMTP id k15-20020a2e888f000000b002b9cd798f94mr11900878lji.39.1692876016440;
        Thu, 24 Aug 2023 04:20:16 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:1a5:1436:c34c:226])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm21875295wru.54.2023.08.24.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:20:15 -0700 (PDT)
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
Subject: [PATCH net-next v5 02/12] doc/netlink: Add a schema for netlink-raw families
Date:   Thu, 24 Aug 2023 12:19:53 +0100
Message-ID: <20230824112003.52939-3-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824112003.52939-1-donald.hunter@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
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

This schema is largely a copy of the genetlink-legacy schema with the
following modifications:

 - change the schema id to netlink-raw
 - add a top-level protonum property, e.g. 0 (for NETLINK_ROUTE)
 - change the protocol enumeration to netlink-raw, removing the
   genetlink options.
 - replace doc references to generic netlink with raw netlink
 - add a value property to mcast-group definitions

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 Documentation/netlink/netlink-raw.yaml | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)
 create mode 100644 Documentation/netlink/netlink-raw.yaml

diff --git a/Documentation/netlink/netlink-raw.yaml b/Documentation/netlink/netlink-raw.yaml
new file mode 100644
index 000000000000..896797876414
--- /dev/null
+++ b/Documentation/netlink/netlink-raw.yaml
@@ -0,0 +1,410 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+%YAML 1.2
+---
+$id: http://kernel.org/schemas/netlink/netlink-raw.yaml#
+$schema: https://json-schema.org/draft-07/schema
+
+# Common defines
+$defs:
+  uint:
+    type: integer
+    minimum: 0
+  len-or-define:
+    type: [ string, integer ]
+    pattern: ^[0-9A-Za-z_]+( - 1)?$
+    minimum: 0
+
+# Schema for specs
+title: Protocol
+description: Specification of a raw netlink protocol
+type: object
+required: [ name, doc, attribute-sets, operations ]
+additionalProperties: False
+properties:
+  name:
+    description: Name of the netlink family.
+    type: string
+  doc:
+    type: string
+  protocol:
+    description: Schema compatibility level.
+    enum: [ netlink-raw ] # Trim
+  # Start netlink-raw
+  protonum:
+    description: Protocol number to use for netlink-raw
+    type: integer
+  # End netlink-raw
+  uapi-header:
+    description: Path to the uAPI header, default is linux/${family-name}.h
+    type: string
+  # Start genetlink-c
+  c-family-name:
+    description: Name of the define for the family name.
+    type: string
+  c-version-name:
+    description: Name of the define for the version of the family.
+    type: string
+  max-by-define:
+    description: Makes the number of attributes and commands be specified by a define, not an enum value.
+    type: boolean
+  # End genetlink-c
+  # Start genetlink-legacy
+  kernel-policy:
+    description: |
+      Defines if the input policy in the kernel is global, per-operation, or split per operation type.
+      Default is split.
+    enum: [ split, per-op, global ]
+  # End genetlink-legacy
+
+  definitions:
+    description: List of type and constant definitions (enums, flags, defines).
+    type: array
+    items:
+      type: object
+      required: [ type, name ]
+      additionalProperties: False
+      properties:
+        name:
+          type: string
+        header:
+          description: For C-compatible languages, header which already defines this value.
+          type: string
+        type:
+          enum: [ const, enum, flags, struct ] # Trim
+        doc:
+          type: string
+        # For const
+        value:
+          description: For const - the value.
+          type: [ string, integer ]
+        # For enum and flags
+        value-start:
+          description: For enum or flags the literal initializer for the first value.
+          type: [ string, integer ]
+        entries:
+          description: For enum or flags array of values.
+          type: array
+          items:
+            oneOf:
+              - type: string
+              - type: object
+                required: [ name ]
+                additionalProperties: False
+                properties:
+                  name:
+                    type: string
+                  value:
+                    type: integer
+                  doc:
+                    type: string
+        render-max:
+          description: Render the max members for this enum.
+          type: boolean
+        # Start genetlink-c
+        enum-name:
+          description: Name for enum, if empty no name will be used.
+          type: [ string, "null" ]
+        name-prefix:
+          description: For enum the prefix of the values, optional.
+          type: string
+        # End genetlink-c
+        # Start genetlink-legacy
+        members:
+          description: List of struct members. Only scalars and strings members allowed.
+          type: array
+          items:
+            type: object
+            required: [ name, type ]
+            additionalProperties: False
+            properties:
+              name:
+                type: string
+              type:
+                description: The netlink attribute type
+                enum: [ u8, u16, u32, u64, s8, s16, s32, s64, string, binary ]
+              len:
+                $ref: '#/$defs/len-or-define'
+              byte-order:
+                enum: [ little-endian, big-endian ]
+              doc:
+                description: Documentation for the struct member attribute.
+                type: string
+              enum:
+                description: Name of the enum type used for the attribute.
+                type: string
+              enum-as-flags:
+                description: |
+                  Treat the enum as flags. In most cases enum is either used as flags or as values.
+                  Sometimes, however, both forms are necessary, in which case header contains the enum
+                  form while specific attributes may request to convert the values into a bitfield.
+                type: boolean
+              display-hint: &display-hint
+                description: |
+                  Optional format indicator that is intended only for choosing
+                  the right formatting mechanism when displaying values of this
+                  type.
+                enum: [ hex, mac, fddi, ipv4, ipv6, uuid ]
+        # End genetlink-legacy
+
+  attribute-sets:
+    description: Definition of attribute spaces for this family.
+    type: array
+    items:
+      description: Definition of a single attribute space.
+      type: object
+      required: [ name, attributes ]
+      additionalProperties: False
+      properties:
+        name:
+          description: |
+            Name used when referring to this space in other definitions, not used outside of the spec.
+          type: string
+        name-prefix:
+          description: |
+            Prefix for the C enum name of the attributes. Default family[name]-set[name]-a-
+          type: string
+        enum-name:
+          description: Name for the enum type of the attribute.
+          type: string
+        doc:
+          description: Documentation of the space.
+          type: string
+        subset-of:
+          description: |
+            Name of another space which this is a logical part of. Sub-spaces can be used to define
+            a limited group of attributes which are used in a nest.
+          type: string
+        # Start genetlink-c
+        attr-cnt-name:
+          description: The explicit name for constant holding the count of attributes (last attr + 1).
+          type: string
+        attr-max-name:
+          description: The explicit name for last member of attribute enum.
+          type: string
+        # End genetlink-c
+        attributes:
+          description: List of attributes in the space.
+          type: array
+          items:
+            type: object
+            required: [ name, type ]
+            additionalProperties: False
+            properties:
+              name:
+                type: string
+              type: &attr-type
+                description: The netlink attribute type
+                enum: [ unused, pad, flag, binary, u8, u16, u32, u64, s32, s64,
+                        string, nest, array-nest, nest-type-value ]
+              doc:
+                description: Documentation of the attribute.
+                type: string
+              value:
+                description: Value for the enum item representing this attribute in the uAPI.
+                $ref: '#/$defs/uint'
+              type-value:
+                description: Name of the value extracted from the type of a nest-type-value attribute.
+                type: array
+                items:
+                  type: string
+              byte-order:
+                enum: [ little-endian, big-endian ]
+              multi-attr:
+                type: boolean
+              nested-attributes:
+                description: Name of the space (sub-space) used inside the attribute.
+                type: string
+              enum:
+                description: Name of the enum type used for the attribute.
+                type: string
+              enum-as-flags:
+                description: |
+                  Treat the enum as flags. In most cases enum is either used as flags or as values.
+                  Sometimes, however, both forms are necessary, in which case header contains the enum
+                  form while specific attributes may request to convert the values into a bitfield.
+                type: boolean
+              checks:
+                description: Kernel input validation.
+                type: object
+                additionalProperties: False
+                properties:
+                  flags-mask:
+                    description: Name of the flags constant on which to base mask (unsigned scalar types only).
+                    type: string
+                  min:
+                    description: Min value for an integer attribute.
+                    type: integer
+                  min-len:
+                    description: Min length for a binary attribute.
+                    $ref: '#/$defs/len-or-define'
+                  max-len:
+                    description: Max length for a string or a binary attribute.
+                    $ref: '#/$defs/len-or-define'
+              sub-type: *attr-type
+              display-hint: *display-hint
+              # Start genetlink-c
+              name-prefix:
+                type: string
+              # End genetlink-c
+              # Start genetlink-legacy
+              struct:
+                description: Name of the struct type used for the attribute.
+                type: string
+              # End genetlink-legacy
+
+      # Make sure name-prefix does not appear in subsets (subsets inherit naming)
+      dependencies:
+        name-prefix:
+          not:
+            required: [ subset-of ]
+        subset-of:
+          not:
+            required: [ name-prefix ]
+
+  operations:
+    description: Operations supported by the protocol.
+    type: object
+    required: [ list ]
+    additionalProperties: False
+    properties:
+      enum-model:
+        description: |
+          The model of assigning values to the operations.
+          "unified" is the recommended model where all message types belong
+          to a single enum.
+          "directional" has the messages sent to the kernel and from the kernel
+          enumerated separately.
+        enum: [ unified, directional ] # Trim
+      name-prefix:
+        description: |
+          Prefix for the C enum name of the command. The name is formed by concatenating
+          the prefix with the upper case name of the command, with dashes replaced by underscores.
+        type: string
+      enum-name:
+        description: Name for the enum type with commands.
+        type: string
+      async-prefix:
+        description: Same as name-prefix but used to render notifications and events to separate enum.
+        type: string
+      async-enum:
+        description: Name for the enum type with notifications/events.
+        type: string
+      # Start genetlink-legacy
+      fixed-header: &fixed-header
+        description: |
+          Name of the structure defining the optional fixed-length protocol
+          header. This header is placed in a message after the netlink and
+          genetlink headers and before any attributes.
+        type: string
+      # End genetlink-legacy
+      list:
+        description: List of commands
+        type: array
+        items:
+          type: object
+          additionalProperties: False
+          required: [ name, doc ]
+          properties:
+            name:
+              description: Name of the operation, also defining its C enum value in uAPI.
+              type: string
+            doc:
+              description: Documentation for the command.
+              type: string
+            value:
+              description: Value for the enum in the uAPI.
+              $ref: '#/$defs/uint'
+            attribute-set:
+              description: |
+                Attribute space from which attributes directly in the requests and replies
+                to this command are defined.
+              type: string
+            flags: &cmd_flags
+              description: Command flags.
+              type: array
+              items:
+                enum: [ admin-perm ]
+            dont-validate:
+              description: Kernel attribute validation flags.
+              type: array
+              items:
+                enum: [ strict, dump ]
+            # Start genetlink-legacy
+            fixed-header: *fixed-header
+            # End genetlink-legacy
+            do: &subop-type
+              description: Main command handler.
+              type: object
+              additionalProperties: False
+              properties:
+                request: &subop-attr-list
+                  description: Definition of the request message for a given command.
+                  type: object
+                  additionalProperties: False
+                  properties:
+                    attributes:
+                      description: |
+                        Names of attributes from the attribute-set (not full attribute
+                        definitions, just names).
+                      type: array
+                      items:
+                        type: string
+                    # Start genetlink-legacy
+                    value:
+                      description: |
+                        ID of this message if value for request and response differ,
+                        i.e. requests and responses have different message enums.
+                      $ref: '#/$defs/uint'
+                    # End genetlink-legacy
+                reply: *subop-attr-list
+                pre:
+                  description: Hook for a function to run before the main callback (pre_doit or start).
+                  type: string
+                post:
+                  description: Hook for a function to run after the main callback (post_doit or done).
+                  type: string
+            dump: *subop-type
+            notify:
+              description: Name of the command sharing the reply type with this notification.
+              type: string
+            event:
+              type: object
+              additionalProperties: False
+              properties:
+                attributes:
+                  description: Explicit list of the attributes for the notification.
+                  type: array
+                  items:
+                    type: string
+            mcgrp:
+              description: Name of the multicast group generating given notification.
+              type: string
+  mcast-groups:
+    description: List of multicast groups.
+    type: object
+    required: [ list ]
+    additionalProperties: False
+    properties:
+      list:
+        description: List of groups.
+        type: array
+        items:
+          type: object
+          required: [ name ]
+          additionalProperties: False
+          properties:
+            name:
+              description: |
+                The name for the group, used to form the define and the value of the define.
+              type: string
+            # Start genetlink-c
+            c-define-name:
+              description: Override for the name of the define in C uAPI.
+              type: string
+            # End genetlink-c
+            flags: *cmd_flags
+            # Start netlink-raw
+            value:
+              description: Value of the netlink multicast group in the uAPI.
+              type: integer
+            # End netlink-raw
-- 
2.39.2 (Apple Git-143)

