Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1507785ED
	for <lists+linux-doc@lfdr.de>; Fri, 11 Aug 2023 05:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjHKDRo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Aug 2023 23:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjHKDRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 23:17:34 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 94E2E30E3;
        Thu, 10 Aug 2023 20:17:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [39.174.92.167])
        by mail-app3 (Coremail) with SMTP id cC_KCgB3XIkNqNVkODScDA--.6319S4;
        Fri, 11 Aug 2023 11:16:31 +0800 (CST)
From:   Lin Ma <linma@zju.edu.cn>
To:     corbet@lwn.net, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, rdunlap@infradead.org,
        void@manifault.com, jani.nikula@intel.com, horms@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v3] docs: net: add netlink attrs best practices
Date:   Fri, 11 Aug 2023 11:15:49 +0800
Message-Id: <20230811031549.2011622-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgB3XIkNqNVkODScDA--.6319S4
X-Coremail-Antispam: 1UD129KBjvAXoWftr18AFWkZw18ury8tFyrZwb_yoW5tr1Uuo
        WS9w45Cr48tr13CFWktr1kAF9xA3yDWF1xJr4a9398W3WDX3ZIk3y5Cw48Wa43AF45Kanr
        Aa4UJ3y8JFn3tF95n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYz7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
        Jr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
        J5UUUUU
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide some suggestions that who deal with Netlink code could follow
(of course using the word "best-practices" may sound somewhat
exaggerate).

According to my recent practices, the parsing of the Netlink attributes
lacks documents for kernel developers. Since recently the relevant docs
for Netlink user space get replenished, I guess is a good chance for
kernel space part to catch with.

First time to write a document and any reviews are appreciated.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
v1 -> v2: fix some typos in FOO example,
          add extra section "About General Netlink Case" to avoid any
          confusion for new code users.
v2 -> v3: move from staging to the networking directory and polish this document
          with the suggestions from Simon and Randy, including:
          * fix typos
          * wrap lines
          * use kernel-doc to refer to the parsers function
          * add an example for strict_start_type

 Documentation/networking/index.rst            |   1 +
 .../netlink-attrs-best-practices.rst          | 772 ++++++++++++++++++
 2 files changed, 773 insertions(+)
 create mode 100644 Documentation/networking/netlink-attrs-best-practices.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 5b75c3f7a137..48e26c8f0489 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -80,6 +80,7 @@ Contents:
    netdevices
    netfilter-sysctl
    netif-msg
+   netlink-attrs-best-practices
    nexthop-group-resilient
    nf_conntrack-sysctl
    nf_flowtable
diff --git a/Documentation/networking/netlink-attrs-best-practices.rst b/Documentation/networking/netlink-attrs-best-practices.rst
new file mode 100644
index 000000000000..38cbd47b2c99
--- /dev/null
+++ b/Documentation/networking/netlink-attrs-best-practices.rst
@@ -0,0 +1,772 @@
+.. SPDX-License-Identifier: BSD-3-Clause
+
+=================================
+Netlink Attributes Best Practices
+=================================
+
+Introduction
+============
+
+This document serves as a guide to the best practices, or cautions, for parsing
+user-space-provided Netlink attributes in kernel space. The intended audience
+is those who want to leverage the powerful Netlink interface
+(mainly for classic or legacy Netlink and the general Netlink users basically
+don't worry about these, see penultimate section) in their code. Additionally,
+for those who are curious about the parsing of Netlink attributes but may feel
+apprehensive about delving into the code itself, this document can serve as an
+excellent starting point.
+
+However, if you are concerned about how to prepare Netlink messages from a user
+space socket instead of writing kernel code, it is recommended to read the
+`Netlink Handbook <https://docs.kernel.org/userspace-api/netlink/intro.html>`_
+first. And after finishing reading this, remember to also read the brief
+introduction to `Generic Netlink <https://docs.kernel.org/networking/generic_netlink.html>`_.
+
+Background
+==========
+
+Data Structures
+---------------
+
+So what is a Netlink attribute? In simple terms, **the Netlink attribute is the
+structural payload carried by the Netlink message in TLV (Type-Length-Value)
+format** (At least it is suggested to do so). One can straightly read the
+comment and the code in ``include/net/netlink.h`` (most of the below content is
+derived from there). The following graph demonstrates the structure for the
+majority of messages.
+
+.. code-block::
+
+   +-----------------+------------+--------------------------
+   | Netlink Msg Hdr | Family Hdr |  Netlink Attributes  ...
+   +-----------------+------------+--------------------------
+                     ^            ^
+
+The ``^`` part will be padded to align to ``NLMSG_ALIGNTO`` (4 bytes for the
+Linux kernel).
+
+The term **majority** is used here because the structure is dependent on the
+specific Netlink family you are dealing with. For example, the general Netlink
+family (NETLINK_GENERIC) puts ``struct genlmsghdr`` in the Family Hdr location
+and is strictly followed by specified Netlink attributes TLV. As a
+counterexample, the connector Netlink family (NETLINK_CONNECTOR) does not use
+Netlink attributes for transiting the payload, but, rather, places a naked data
+structure immediately after its family header ``struct cn_msg``. In general,
+when working with Netlink-powered code, most developers opt for Netlink
+attributes due to their convenience and ease of maintenance. This means it is
+definitely okay to overlook the corner cases which may eventually be
+incorporated into Netlink attributes in the future.
+
+The Netlink attribute in the Linux kernel conforms to the following structure.
+
+.. code-block:: c
+
+   // >------- nla header --------<
+   // +-------------+-------------+----------- - - - ----------+
+   // |  Attr Len   |  Attr Type  |          Attr Data         |
+   // +-------------+-------------+----------- - - - ----------+
+   // >-- 2 bytes --|-- 2 bytes --|------ Attr Len bytes ------<
+
+   struct nlattr {
+       __u16           nla_len;
+       __u16           nla_type;
+   };
+
+The 2 bytes attr len (\ ``nla_len``\ ) indicates the entire attribute length
+(includes the nla header) and the other 2 bytes attr type (\ ``nla_type``\ )
+is used by the kernel code to identify the expected attribute. To process
+these attributes, the kernel code needs to locate the specific attribute and
+extract the payload from it, a process known as attribute parsing. This
+procedure can be tedious and error-prone when done manually, so the interface
+provides parsers to simplify the process.
+
+*It is worth mentioning that if you choose to use general Netlink without a
+nested data structure, you don't even need to call any parsers as the
+interface already does this and your task will be simplified to handling the
+parsed result.*
+
+Parsers
+-------
+
+There are several parsers available, each designed to handle a specific type
+of object being parsed. If you have a pointer to a Netlink message,
+specifically a (\ ``struct nlmsghdr *``\ ), it's likely that you'll want to
+call the ``nlmsg_parse`` function. The prototype for this function is as
+follows:
+
+.. kernel-doc:: include/net/netlink.h
+   :identifiers: nlmsg_parse
+
+Otherwise, if you have a pointer to Netlink attribute (\ ``struct nlattr *``\ )
+already, the ``nla_parse``\ , or  ``nla_parse_nested`` may be used.
+
+.. kernel-doc:: include/net/netlink.h
+   :identifiers: nla_parse
+
+.. kernel-doc:: include/net/netlink.h
+   :identifiers: nla_parse_nested
+
+Upon closer inspection, one will notice that the parameters for the various
+parsers bear a striking resemblance to one another. In fact, they share a
+commonality that goes beyond mere coincidence, as they all ultimately call
+upon the same internal parsing helper function, namely ``__nla_parse``.
+
+.. code-block:: c
+
+   int __nla_parse(struct nlattr **tb, int maxtype, const struct nlattr *head,
+           int len, const struct nla_policy *policy, unsigned int validate,
+           struct netlink_ext_ack *extack);
+
+The idea is straightforward since we know that adding an offset to either
+the Netlink message header or the nested attribute will yield the TLV format
+of the attributes. On this basis, we will learn how to utilize those parsers.
+
+The parser functions mentioned above require two inputs from the user: a
+destination array, ``tb``, and a maximum attribute type, ``maxtype``. Rest
+assured that the parsers will take care of clearing the buffer by calling
+memset, so you don't need to worry about any dirty data.  After the parsing,
+parsers will store the parsed pointer in the provided array, allowing you to
+easily access the parsed data later on.  For clarity, you can refer to the
+example below to see how the parsed result is organized.
+
+.. code-block:: c
+
+   enum {
+       EXAMPLEA_1,
+       EXAMPLEA_2,
+       EXAMPLEA_3,
+       EXAMPLEA_4,
+       __EXAMPLEA_MAX
+
+   #define EXAMPLEA_MAX (__EXAMPLEA_MAX - 1)
+   };
+
+   /*
+    *     attributes being parsed and pointers:
+    *
+    *     +---+------------+- - -+---+------------+- - -+---+------------+- - -+
+    *     | X | EXAMPLEA_1 | ... | Y | EXAMPLEA_4 | ... | Z | EXAMPLEA_2 | ... |
+    *     +---+------------+- - -+---+------------+- - -+---+------------+- - -+
+    *     ^                      ^                      ^
+    *     |                      |                      |
+    *     ptr1                   |                      |
+    *     ptr2 -----------------------------------------+
+    *     ptr3 = NULL            |
+    *     ptr4 ------------------+
+    */
+
+   struct nlattr *tb[EXAMPLEA_MAX+1];
+   nla_parse(tb, EXAMPLEA_MAX, ....);
+   // After the parser returns, the tb contains the data shown below,
+   // with each pointer holding the value indicated in the above diagram.
+   // tb == {
+   //      ptr1, // EXAMPLEA_1
+   //      ptr2, // EXAMPLEA_2
+   //      NULL, // EXAMPLEA_3
+   //      ptr4, // EXAMPLEA_4
+   // };
+
+The Linux kernel's attribute parsing mechanism is notably flexible, enabling
+attributes to be presented in any order, regardless of their specific type
+(e.g., ``EXAMPLE_4`` can precede ``EXAMPLE_2``). This flexibility is not always
+the case in other Netlink implementations, such as FreeBSD, where attributes
+may be required to follow a specific order.
+
+With the parsing process complete, the kernel code can readily access the
+parsed attribute using the attribute pointer. To illustrate, let's say we
+anticipate the ``EXAMPLEA_2`` attribute to hold a ``u16`` value. In that case,
+we can derive it in the following manner:
+
+.. code-block:: c
+
+   u16 val;
+   if (tb[EXAMPLEA_2]) // check if user provides attribute EXAMPLEA_2
+       val = nla_get_u16(tb[EXAMPLEA_2]); // dereference it
+
+There are multiple helpers available to help us to derive the attribute, such
+as ``nla_get_u8/16/32/64``\ , ``nla_get_s8/16/32/64``\ , ``nla_get_flag``\ ,
+``nla_get_msecs``.
+
+Looks pretty good, right? However, the code still has a potential flaw, as it
+naively assumes that the user has indeed placed a ``u16`` value in the payload.
+We'll discuss this issue further in the #2 best practice.
+
+FOO example
+-----------
+
+In this part we will make a horizontal comparison to help readers better
+understand how to write a Netlink code to parse the user provided data. To
+begin with, let's take a look at how this is accomplished in ``ioctl``.
+
+.. code-block:: c
+
+   struct foo_d1 {
+       u32 a;
+       u32 b;
+   };
+
+   struct foo_d2 {
+       u32 c;
+       u32 d;
+       u8  haschild;
+       struct foo_d1 child; // optional
+   }
+
+   static long foo_ioctl(
+       struct file *flip, unsigned int cmd, unsigned long arg)
+   {
+       u32 s = offsetof(struct foo_d2, child);
+       struct foo_d2 *d2 = kmalloc(sizeof(struct foo_d2), GFP_KERNEL);
+       if (!d2) return -ENOMEM;
+
+       copy_from_user(d2, arg, s);
+       // access data like d2->c, d2->d
+
+       if (d2->haschild) {
+           copy_from_user(&d2->child, arg + s, sizeof(struct foo_d1));
+           // access data like d2->child.a, d2->child.b
+       }
+       // ...
+   }
+
+The ``ioctl`` code above reveals that two calls to ``copy_from_user`` are made,
+facilitating the transfer of data from user space to kernel space. After these
+calls, the code can manipulate values using pointers.
+
+In contrast, the second snippet showcases a similar solution when utilizing the
+Netlink interface. There are multiple ways to use the attributes to
+achieve the same outcome, the snippet below illustrates just one possible
+approach.
+
+.. code-block:: c
+
+
+   enum {
+       FOOCHILD_A,
+       FOOCHILD_B,
+       __FOOCHILD_MAX,
+
+   #define FOOCHILD_MAX (__FOOCHILD_MAX - 1)
+   };
+
+   enum {
+       FOOA_C,
+       FOOA_D,
+       FOOA_CHILD,
+       __FOOA_MAX,
+
+   #define FOOA_MAX (__FOOA_MAX - 1)
+   };
+
+   // just an example, different consumers have different handler prototype
+   static int foo_handler(struct nlmsghdr *nlh, struct netlink_ext_ack *extack)
+   {
+       struct nlattr *attrs[FOOA_MAX+1];
+       int err;
+       // ...
+       err = nlmsg_parse(nlh, FOOA_MAX, attrs, ..., extack);
+       // ...
+       if (!attrs[FOOA_C] || !attrs[FOOA_D])
+           return -EINVAL;
+       // access data via
+       // nla_get_u32(attrs[FOOA_C]) and nla_get_u32(attrs[FOOA_D])
+
+       // access child as nested
+       if (attrs[FOOA_CHILD])
+           err = foo_handler_internal(attrs[FOOA_ARRAY], extack);
+   }
+
+   static int foo_handler_internal(struct nlattr *nla,
+                                   struct netlink_ext_ack *extack)
+   {
+       struct nlattr *attrs[FOOCHILD_MAX+1];
+       int err;
+       // ...
+       err = nla_parse_nested(attrs, FOOCHILD_MAX, nla, ..., extack);
+       // access data via
+       // nla_get_u32(attrs[FOOCHILD_A]), nla_get_u32(attrs[FOOCHILD_B])
+   }
+
+By contrast, the Netlink version provides several benefits, including improved
+readability, thanks to the use of enums that clearly identify each value, and
+simplified writing, as the interface takes care of transferring data to kernel
+space, allowing programmers to focus on other parts of the code without
+worrying about bugs like double fetching.
+
+Now that we've covered the background information and basic data structure,
+it's time to dive deeper into the best practices for handling Netlink
+attributes. If you're interested in learning more about the underlying code,
+we recommend checking out the ``lib/nlattr.c`` file for additional details.
+With that said, let's move on to the tips and tricks for working with Netlink
+attributes.
+
+Best Practices
+==============
+
+#1 Use provided helpers to parse and access nlattr
+--------------------------------------------------
+
+As mentioned above, the Netlink attributes parsing procedure operates on
+pointers, which is rather error-prone. To avoid introducing bugs, as well as
+enhance code maintainability, it's recommended to utilize the provided parsers
+and helpers when working with Netlink attributes.
+
+While it's generally recommended to use existing parsers to parse Netlink
+attributes, there may be (old) cases where kernel code needs to manually parse
+the attributes. We'll discuss this further later on. Regardless, it's suggested
+to use helpers to perform the access action for better code maintainability and
+reliability.
+
+For example, one should never add the offset to the attribute pointer himself.
+
+.. code-block:: c
+
+   struct nlattr *nla = ...;
+   u8 *p;
+
+   p = (char*)nla + sizeof(struct nlattr); //  Correct but not suggested
+   p = nla_data(nla);  // Correct as well as concise
+
+Several helpers are particularly useful but often overlooked, including
+``nla_memcpy``\ , ``nla_memdup``\ , ``nla_memcmp``\ , and ``nla_strscpy``\ ,
+``nla_strdup``\ , ``nla_strcmp``. These helpers can greatly simplify the
+process of working with Netlink attributes and reduce the risk of errors.
+
+.. code-block:: c
+
+   struct nlattr *nla = ...;
+   u8 buffer[XXX];
+
+   memcpy(buffer, nla_data(nla), XXX);    // Wordy and could be buggy
+   nla_memcpy(buffer, nla, XXX);   // Concise and also safe
+
+When you need to access a Netlink attribute, it's recommended to check if
+there's already a helper function available in the ``include/net/netlink.h``
+header file. This will help you avoid introducing complex and error-prone
+pointer arithmetic into your code.
+
+
+#2 Never access nlattr without checking
+---------------------------------------
+
+Let's take another look at the example code for utilizing parsers.
+
+.. code-block:: c
+
+   u16 val;
+   if (tb[EXAMPLEA_2])
+       val = nla_get_u16(tb[EXAMPLEA_2]);
+
+Recall that we noted earlier that this access code has a bug since it naively
+trusts the input provided and assumes that a ``u16`` value is present. Now,
+imagine a scenario where a malicious user deliberately provides a malformed
+``EXAMPLEA_2``, as shown below.
+
+.. code-block::
+
+    nla_len   nla_type
+   +-------+------------+- - - - - - - - - +
+   |   0   | EXAMPLEA_2 |  Heap Dirty Data |
+   +-------+------------+- - - - - - - - - +
+                        ^
+             attributes end location
+
+In this scenario, the attribute ``EXAMPLEA_2`` is positioned as the final
+attribute, situated adjacent to the heap dirty data (since the nlmsg is
+allocated with the ``GFP_KERNEL`` flag without ``GFP_ZERO``\ ). Furthermore,
+although the nla_type is ``EXAMPLEA_2`` as expected, the nla_len is ``0``,
+rather than the expected ``sizeof(u16)``, in the malformed packet.
+
+The access code erroneously believes the parsed attribute has a valid length,
+leading to out-of-attribute access. This has serious consequences, as it causes
+the heap of dirty data to be loaded into the variable ``val``\ , which can be
+stored in a global state and accessed from user space. This leakage of heap
+information can be exploited by a skilled attacker using Heap Feng Shui, then
+gain unauthorized access to sensitive data, potentially allowing them to bypass
+protections like KASLR or SLAB_HARDEN.
+
+To prevent such a problem from occurring, it's essential to verify the
+attribute before attempting to access it. For instance, we can modify the
+example code as follows:
+
+.. code-block:: c
+
+   u16 val;
+   if (tb[EXAMPLEA_2] \
+       && nla_len(tb[EXAMPLEA_2]) >= sizeof(u16)) // length check
+       val = nla_get_u16(tb[EXAMPLEA_2]);
+
+The similar case is the example using ``memcpy`` to access the attribute.
+
+.. code-block:: c
+
+    u8 buffer[XXX];
+    memcpy(buffer, nla_data(nla), XXX);
+
+The code mistakenly assumes that the ``nla`` has a length of ``XXX``\ , leading
+to out-of-attribute access that potentially copies dirty data to the
+``buffer``\ . However, ``nla_memcpy`` is immune to such bugs because it
+internally calls ``nla_len`` to ensure that only data within the boundary is
+copied. This also underscores the importance of #1 best practice.
+
+While the length check, which ensures the attribute has enough data to be
+accessed by `nla_get_u16`, is a good starting point, it's not the most
+efficient approach to perform such checks extensively throughout the code.
+Moreover, there are other important factors to consider beyond data length,
+such as value ranges, when determining the validity of an attribute. In
+practice, data length is just one of the basic aspects we need to examine.
+
+To achieve more convenient and flexible validation, a very important data
+structure named ``nla_policy`` is employed.
+
+.. code-block:: c
+
+   struct nla_policy {
+       u8      type;
+       u8      validation_type;
+       u16     len;
+       union {
+           /**
+            * ... field for advanced validation ...
+            */
+       };
+   };
+
+There are two ways to employ ``nla_policy``: pass the policy to the parser,
+which will validate the parsing process (see the ``policy`` parameter in those
+parsers), or actively call validation helpers like ``nlmsg_validate`` and
+``nla_validate`` to check the attributes. The first option is generally
+preferred because it ensures that the pointer in the parsed destination array
+points to a valid attribute that can be safely accessed, eliminating the need
+for an additional check. Here's an example:
+
+.. code-block:: c
+
+   struct nla_policy example_policy[EXAMPLEA_MAX + 1] = {
+       [EXAMPLEA_2] = { .type = NLA_U8 },
+   };
+   // ...
+   struct nlattr *tb[EXAMPLEA_MAX+1];
+   u16 value;
+   nla_parse(tb, EXAMPLEA_MAX, nla, ..., example_policy, extack);
+
+   u16 val;
+   if (tb[EXAMPLEA_2]) // if not NULL, already pass the policy length check
+       val = nla_get_u16(tb[EXAMPLEA_2]);  // safe
+
+In addition to ``NLA_U8``\ , there are several other defined types, such as
+``NLA_BINARY`` and ``NLA_STRING``, that can be used to prepare a nla_policy.
+However, two attributes deserve special attention: ``NLA_NESTED`` and
+``NLA_NESTED_ARRAY``. These attributes are used to validate complex structures
+that contain nested elements, and they are particularly useful when dealing
+with hierarchical data structures. For instance, we can define a ``nla_policy``
+for the Foo example above using these attributes.
+
+.. code-block:: c
+
+   struct nla_policy foo_policy_nested[FOOCHILD_MAX + 1] = {
+       [FOOCHILD_A] = { .type = NLA_U32 },
+       [FOOCHILD_B] = { .type = NLA_U32 },
+   };
+
+   struct nla_policy foo_policy[EXAMPLEA_MAX + 1] = {
+       [FOOA_C] = { .type = NLA_U32 },
+       [FOOA_D] = { .type = NLA_U32 },
+       [FOOA_CHILD] = NLA_POLICY_NESTED(foo_policy_nested),
+   };
+
+``nla_policy`` by no means makes the validation clean and graceful hence should
+be employed first than manual checks. The general Netlink interface allows the
+user to specify the policy for each handler and finish the validation before
+calling it, we will talk more about this next section.
+
+While using ``nla_policy`` is generally straightforward and recommended, there
+are some important considerations to keep in mind.
+
+First and foremost, **Don't forget to update the nla_policy when a new
+attribute type is introduced**. There are cases when developers, no matter for
+classic Netlink or general Netlink interfaces, make such mistakes. If the
+parsing does not follow the strict mode (which will be discussed in #3), such a
+mistake will result in the out-of-attribute access bug.
+
+Second, **Perform manual checks for manual parsing**. Examine the kernel code,
+readers can find cases that prepare ``nla_policy`` in an unconventional manner
+such as the following.
+
+.. code-block:: c
+
+   // drivers/net/bonding/bond_netlink.c
+   static const struct nla_policy bond_policy[IFLA_BOND_MAX + 1] = {
+       // ...
+       [IFLA_BOND_ARP_IP_TARGET]   = { .type = NLA_NESTED },
+   };
+
+The attribute ``IFLA_BOND_ARP_IP_TARGET`` is defined with the ``NLA_NESTED``
+type, but without a nested ``nla_policy``. While it may seem logical to one to
+allow nested validation for this attribute, unfortunately, it is not.
+The code employs an undocumented and sophisticated approach to organizing
+attributes, where the array index is embedded within the attribute type.
+Currently, there is no validation mechanism available to handle such a case.
+
+Besides, there may be other cases where the kernel code also deviates from the
+conventional approach of using parsers and instead manually iterates through
+the attributes TLV, performing manual parsing.
+
+To validate cases where manual parsing is used, manual length checks based on
+``nla_len`` are required, as demonstrated in the parsing code for
+``IFLA_BOND_ARP_IP_TARGET`` below.
+
+.. code-block:: c
+
+   if (data[IFLA_BOND_ARP_IP_TARGET]) {
+       // ...
+       nla_for_each_nested(attr, data[IFLA_BOND_ARP_IP_TARGET], rem) {
+           __be32 target;
+
+           // manual length check here
+           if (nla_len(attr) < sizeof(target))
+               return -EINVAL;
+
+           target = nla_get_be32(attr);
+           // ...
+
+``NLA_POLICY_NESTED`` is just one of many helpful tools at your disposal. If
+you're looking to validate the value range of an attribute, consider using
+``NLA_POLICY_RANGE``\ , ``NLA_POLICY_MIN``\ , and ``NLA_POLICY_MAX``\ . And if
+you need to perform a strict length check, ``NLA_POLICY_EXACT_LEN`` is your
+best bet. Simply assigning a value to len in nla_policy will ensure that the
+attribute length is greater than or equal to your expected value, without
+strictly equaling it.
+
+#3 Embrace and take advantage of the strictness
+-----------------------------------------------
+
+In the previous section, we talked about **strict mode**, which is related to
+the last best practice we'll discuss. While reading through the helpers
+declared in ``include/net/netlink.h``\ , readers may have noticed some of them
+have the ``_deprecated`` suffix, such as ``nla_parse_deprecated`` and
+``nlmsg_parse_deprecated``. These deprecated functions are still widely used in
+the kernel, with over 300 call sites. This raises some questions: why are they
+marked as deprecated? What's the difference between them and the non-deprecated
+versions? And how do we choose between them?
+
+These deprecated functions in question were introduced in commit
+**8cb081746c03 ("netlink: make validation more configurable for future strictness")**,
+which aimed to enhance the configurability of parsing strictness. This commit
+split the parsing strictness into several options, as detailed in the commit
+message.
+
+* TRAILING     - check that there's no trailing data after parsing attributes (in message or nested)
+* MAXTYPE      - reject attrs greater than max known type
+* UNSPEC       - reject attributes with ``NLA_UNSPEC`` policy entries
+* STRICT_ATTRS - strictly validate attribute size
+
+and one more option follows up later
+
+* NESTED       - strictly validate ``NLA_F_NESTED``
+
+After the aforementioned commit, the code now features three distinct levels of
+strictness: Liberal, Deprecated Strict, and Strict. By examining the code, it
+becomes readily apparent which options are employed by each level.
+
+.. code-block:: c
+
+   enum netlink_validation {
+       NL_VALIDATE_LIBERAL = 0,
+       NL_VALIDATE_TRAILING = BIT(0),
+       NL_VALIDATE_MAXTYPE = BIT(1),
+       NL_VALIDATE_UNSPEC = BIT(2),
+       NL_VALIDATE_STRICT_ATTRS = BIT(3),
+       NL_VALIDATE_NESTED = BIT(4),
+   };
+
+   #define NL_VALIDATE_DEPRECATED_STRICT (NL_VALIDATE_TRAILING |\
+                          NL_VALIDATE_MAXTYPE)
+   #define NL_VALIDATE_STRICT (NL_VALIDATE_TRAILING |\
+                   NL_VALIDATE_MAXTYPE |\
+                   NL_VALIDATE_UNSPEC |\
+                   NL_VALIDATE_STRICT_ATTRS |\
+                   NL_VALIDATE_NESTED)
+
+The ``NL_VALIDATE_UNSPEC`` is interesting and deserves a note.. In the
+previous part, a buggy case caused by forgetting to update the policy is
+mentioned. Specifically, such a case only occurs when using the deprecated
+level. If choosing the latest strict level, which enables the
+``NL_VALIDATE_UNSPEC`` option, such a case can be prevented as the newly added
+attribute type will be directly rejected due to the absence of the policy. This
+is a compelling reason to use the modern strict level instead of the older ones.
+
+While the benefits of using ``NL_VALIDATE_STRICT`` are clear, simply replacing
+all deprecated parsers with this new option could result in compatibility
+issues due to the fact that older user space code may not follow a strict
+implementation. To address this concern, Johannes Berg, the author of the
+aforementioned commit, provided a subsequent commit
+**56738f460841 ("netlink: add strict parsing for future attributes")**,
+which introduces a new field, ``strict_start_type``, in the struct nla_policy
+structure. This new field allows for the definition of a "boundary type" for
+legacy code that utilizes deprecated parsers, thereby ensuring compatibility
+with older code while still providing the benefits of strict parsing.
+
+Let's see a good example, such as commit
+**1a432018c0cd ("net/sched: flower: Allow matching on layer 2 miss")**,
+to see how to add a new attribute type and update the policy with
+``strict_start_type``.
+
+.. code-block:: diff
+
+    @@ -594,6 +594,8 @@ enum {
+
+            TCA_FLOWER_KEY_L2TPV3_SID,      /* be32 */
+
+    +       TCA_FLOWER_L2_MISS,             /* u8 */
+    +
+            __TCA_FLOWER_MAX,
+    };
+
+    static const struct nla_policy fl_policy[TCA_FLOWER_MAX + 1] = {
+    -       [TCA_FLOWER_UNSPEC]             = { .type = NLA_UNSPEC },
+    +       [TCA_FLOWER_UNSPEC]             = { .strict_start_type =
+    +                                               TCA_FLOWER_L2_MISS },
+            [TCA_FLOWER_CLASSID]            = { .type = NLA_U32 },
+            [TCA_FLOWER_INDEV]              = { .type = NLA_STRING,
+                                                .len = IFNAMSIZ },
+    @@ -720,7 +724,7 @@ static const struct nla_policy fl_policy[TCA_FLOWER_MAX + 1] = {
+            [TCA_FLOWER_KEY_PPPOE_SID]      = { .type = NLA_U16 },
+            [TCA_FLOWER_KEY_PPP_PROTO]      = { .type = NLA_U16 },
+            [TCA_FLOWER_KEY_L2TPV3_SID]     = { .type = NLA_U32 },
+    -
+    +       [TCA_FLOWER_L2_MISS]            = NLA_POLICY_MAX(NLA_U8, 1),
+    };
+
+Because enforcing strict validation to the newly added attribute
+``TCA_FLOWER_L2_MISS`` raises no compatibility problems, this commit specifies
+the ``strict_start_type`` to ``fl_policy`` (for index 0 attribute only, see the
+comment in ``struct nla_policy``).    This approach allows the validation
+process to employ the ``NL_VALIDATE_STRICT`` strictness level for
+``TCA_FLOWER_L2_MISS`` and any future attribute types while keeping liberal for
+the old attributes, thereby ensuring compatibility and adhering to practice #3.
+
+
+About General Netlink Case
+==========================
+
+The aforementioned content primarily presents best practices based on the
+author's experience with classic Netlink. However, these practices may not be
+relevant or could potentially cause confusion when working with new code that
+employs general Netlink. In the following section, we will explore how users of
+general Netlink can address these concerns and identify additional
+considerations that need to be taken into account.
+
+Let's revisit the FOO example, where the general Netlink alternative would look
+something like this.
+
+.. code-block:: c
+
+    static const struct genl_split_ops foo_nl_ops[] = {
+        {
+            .cmd        = FOO_CMD_TEST,
+            .doit       = foo_nl_test_doit,
+            .policy     = foo_policy,
+            .maxattr    = EXAMPLEA_MAX,
+            .flags      = GENL_ADMIN_PERM,
+            // .validate    = GENL_DONT_VALIDATE_STRICT
+        },
+    };
+
+    int foo_nl_test_doit(struct sk_buff *skb, struct genl_info *info)
+    {
+        struct nlattr *tb_child[FOOCHILD_MAX + 1];
+
+        /* can access parsed result in info->attrs[] */
+        // nla_get_u32(info->attrs[FOOA_C])
+        if (info->attrs[FOOA_CHILD]) {
+            if (nla_parse_nested(tb_child, FOOCHILD_MAX,
+                                 info->attrs[FOOA_CHILD], foo_policy_nested, NULL))
+                return -EINVAL
+            /* can access nested parsed result in tb_child[] */
+            // nla_get_u32(tb_child[FOOCHILD_A])
+        }
+    }
+
+    /* omit and struct genl_family and call to genl_register_family */
+
+In contrast to the classic implementation, which primarily involves registering
+a callback function, general Netlink utilizes the ``genl_split_ops`` structure
+(or ``genl_ops``, ``genl_small_ops`` depending on the situation) to provide
+additional details such as privileges, concurrency, and more. In the example
+mentioned above, when the ``policy`` and ``maxattr`` are known, the Netlink
+core will perform validation and parsing tasks before invoking the ``doit``
+callback. For more details, refer to `Generic Netlink <https://docs.kernel.org/networking/generic_netlink.html>`_
+
+As a result, the general Netlink user inadvertently follows the second best
+practice once they specify the ``policy`` field. Furthermore, in the case of
+modern families where the specification is generated
+(see `Netlink spec C code generation <https://docs.kernel.org/userspace-api/netlink/c-code-gen.html>`_ ),
+the problem of forgetting to update the ``nla_policy`` should never occur.
+This feature is incredibly beneficial as it enhances maintainability. It is
+highly recommended to incorporate it into your Netlink code.
+
+However, the general Netlink user should still consider the #1 and #3 best
+practices as areas of concern.
+
+Regarding the first best practice, regardless of the interface you are currently
+working with, it is essential to handle Netlink attributes and make use of the
+available helpers. In particular, don't forget the ``nla_memcpy`` helper.
+
+Regarding the third best practice, general Netlink employs a modern strictness
+approach by default for parsing, utilizing the user-provided policy and
+maxattr, which is perfect. However, for the sake of flexibility (and
+compatibility), the interface also allows users to specify
+``GENL_DONT_VALIDATE_STRICT`` if they prefer a more liberal strictness.
+Additionally, there are additional validate flags available, see
+``genl_validate_flags`` enum.
+
+.. code-block:: c
+
+    enum genl_validate_flags {
+        GENL_DONT_VALIDATE_STRICT		= BIT(0),
+        GENL_DONT_VALIDATE_DUMP			= BIT(1),
+        GENL_DONT_VALIDATE_DUMP_STRICT		= BIT(2),
+    };
+
+To be honest, the developer should avoid those ``DONT`` flags as possible.
+However, the ``GENL_DONT_VALIDATE_STRICT`` flag, which enables liberal
+strictness, is used over 400 times in the Linux kernel code. This observation
+suggests that a significant portion of the codebase has not fully adopted
+modern strictness principles yet.
+
+Additionally, also illustrated by the FOO example, the user has to do local
+parsing when processing nested attributes. In such scenarios, please
+
+* leverage the parsers instead of manual parsing.
+* leverage the parsers which are not marked as deprecated to adhere to modern strictness.
+
+Summary
+=======
+
+This document provides an overview of the data structure and parsers for
+Netlink attributes, along with three best practices for parsing these
+attributes. The parsing discussed in this document only applies to the
+"RX channel" (most ``doit`` functions), where the kernel needs to parse user
+space-provided Netlink messages. The opposite channel, where the kernel
+prepares Netlink messages for user space (most ``dumpit`` functions), is not
+covered in this document as it is considered less prone to implementation
+errors.
+
+The first best practice is "use provided helper to parse and access nlattr",
+which can make the parsing easier and increase the code maintainability.
+The second one is "never access nlattr without checking", otherwise an
+out-of-attribute access bug could occur. The last one is "embrace and take
+advantage of the strictness", which has been a topic of discussion since
+2019 but has yet to be fully adopted.
+
+An extra section is used to discuss the general Netlink interface case.
+Fortunately, this interface has evolved rapidly, becoming safer and safer.
+The latest general Netlink allows for the generation of specifications and
+policy automatically from YAML, with the generated policy defaulting to modern
+strictness. However, users still have to concern about the #1 and #3 practices
+when dealing with the attributes.
+
+It's important to note that correctly parsing Netlink attributes is only the
+first step but definitely not the last step to keep your code away from the
+bugs.
-- 
2.17.1

