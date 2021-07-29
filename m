Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA39E3D9BC2
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jul 2021 04:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhG2C0q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jul 2021 22:26:46 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]:36008 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbhG2C0p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 22:26:45 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Jul 2021 22:26:45 EDT
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 7F6FD2149A; Thu, 29 Jul 2021 10:21:10 +0800 (AWST)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     netdev@vger.kernel.org
Cc:     Matt Johnston <matt@codeconstruct.com.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH net-next v4 15/15] mctp: Add MCTP overview document
Date:   Thu, 29 Jul 2021 10:20:53 +0800
Message-Id: <20210729022053.134453-16-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729022053.134453-1-jk@codeconstruct.com.au>
References: <20210729022053.134453-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This change adds a brief document about the sockets API provided for
sending and receiving MCTP messages from userspace.

This is roughly based on the OpenBMC design document, at:

  https://github.com/openbmc/docs/blob/master/designs/mctp/mctp-kernel.md

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - Controller -> component
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/mctp.rst  | 213 +++++++++++++++++++++++++++++
 MAINTAINERS                        |   1 +
 3 files changed, 215 insertions(+)
 create mode 100644 Documentation/networking/mctp.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index a91a2739f8ed..58bc8cd367c6 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -69,6 +69,7 @@ Contents:
    l2tp
    lapb-module
    mac80211-injection
+   mctp
    mpls-sysctl
    mptcp-sysctl
    multiqueue
diff --git a/Documentation/networking/mctp.rst b/Documentation/networking/mctp.rst
new file mode 100644
index 000000000000..6100cdc220f6
--- /dev/null
+++ b/Documentation/networking/mctp.rst
@@ -0,0 +1,213 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+Management Component Transport Protocol (MCTP)
+==============================================
+
+net/mctp/ contains protocol support for MCTP, as defined by DMTF standard
+DSP0236. Physical interface drivers ("bindings" in the specification) are
+provided in drivers/net/mctp/.
+
+The core code provides a socket-based interface to send and receive MCTP
+messages, through an AF_MCTP, SOCK_DGRAM socket.
+
+Structure: interfaces & networks
+================================
+
+The kernel models the local MCTP topology through two items: interfaces and
+networks.
+
+An interface (or "link") is an instance of an MCTP physical transport binding
+(as defined by DSP0236, section 3.2.47), likely connected to a specific hardware
+device. This is represented as a ``struct netdevice``.
+
+A network defines a unique address space for MCTP endpoints by endpoint-ID
+(described by DSP0236, section 3.2.31). A network has a user-visible identifier
+to allow references from userspace. Route definitions are specific to one
+network.
+
+Interfaces are associated with one network. A network may be associated with one
+or more interfaces.
+
+If multiple networks are present, each may contain endpoint IDs (EIDs) that are
+also present on other networks.
+
+Sockets API
+===========
+
+Protocol definitions
+--------------------
+
+MCTP uses ``AF_MCTP`` / ``PF_MCTP`` for the address- and protocol- families.
+Since MCTP is message-based, only ``SOCK_DGRAM`` sockets are supported.
+
+.. code-block:: C
+
+    int sd = socket(AF_MCTP, SOCK_DGRAM, 0);
+
+The only (current) value for the ``protocol`` argument is 0.
+
+As with all socket address families, source and destination addresses are
+specified with a ``sockaddr`` type, with a single-byte endpoint address:
+
+.. code-block:: C
+
+    typedef __u8		mctp_eid_t;
+
+    struct mctp_addr {
+            mctp_eid_t		s_addr;
+    };
+
+    struct sockaddr_mctp {
+            unsigned short int	smctp_family;
+            int			smctp_network;
+            struct mctp_addr	smctp_addr;
+            __u8		smctp_type;
+            __u8		smctp_tag;
+    };
+
+    #define MCTP_NET_ANY	0x0
+    #define MCTP_ADDR_ANY	0xff
+
+
+Syscall behaviour
+-----------------
+
+The following sections describe the MCTP-specific behaviours of the standard
+socket system calls. These behaviours have been chosen to map closely to the
+existing sockets APIs.
+
+``bind()`` : set local socket address
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Sockets that receive incoming request packets will bind to a local address,
+using the ``bind()`` syscall.
+
+.. code-block:: C
+
+    struct sockaddr_mctp addr;
+
+    addr.smctp_family = AF_MCTP;
+    addr.smctp_network = MCTP_NET_ANY;
+    addr.smctp_addr.s_addr = MCTP_ADDR_ANY;
+    addr.smctp_type = MCTP_TYPE_PLDM;
+    addr.smctp_tag = MCTP_TAG_OWNER;
+
+    int rc = bind(sd, (struct sockaddr *)&addr, sizeof(addr));
+
+This establishes the local address of the socket. Incoming MCTP messages that
+match the network, address, and message type will be received by this socket.
+The reference to 'incoming' is important here; a bound socket will only receive
+messages with the TO bit set, to indicate an incoming request message, rather
+than a response.
+
+The ``smctp_tag`` value will configure the tags accepted from the remote side of
+this socket. Given the above, the only valid value is ``MCTP_TAG_OWNER``, which
+will result in remotely "owned" tags being routed to this socket. Since
+``MCTP_TAG_OWNER`` is set, the 3 least-significant bits of ``smctp_tag`` are not
+used; callers must set them to zero.
+
+A ``smctp_network`` value of ``MCTP_NET_ANY`` will configure the socket to
+receive incoming packets from any locally-connected network. A specific network
+value will cause the socket to only receive incoming messages from that network.
+
+The ``smctp_addr`` field specifies a local address to bind to. A value of
+``MCTP_ADDR_ANY`` configures the socket to receive messages addressed to any
+local destination EID.
+
+The ``smctp_type`` field specifies which message types to receive. Only the
+lower 7 bits of the type is matched on incoming messages (ie., the
+most-significant IC bit is not part of the match). This results in the socket
+receiving packets with and without a message integrity check footer.
+
+``sendto()``, ``sendmsg()``, ``send()`` : transmit an MCTP message
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+An MCTP message is transmitted using one of the ``sendto()``, ``sendmsg()`` or
+``send()`` syscalls. Using ``sendto()`` as the primary example:
+
+.. code-block:: C
+
+    struct sockaddr_mctp addr;
+    char buf[14];
+    ssize_t len;
+
+    /* set message destination */
+    addr.smctp_family = AF_MCTP;
+    addr.smctp_network = 0;
+    addr.smctp_addr.s_addr = 8;
+    addr.smctp_tag = MCTP_TAG_OWNER;
+    addr.smctp_type = MCTP_TYPE_ECHO;
+
+    /* arbitrary message to send, with message-type header */
+    buf[0] = MCTP_TYPE_ECHO;
+    memcpy(buf + 1, "hello, world!", sizeof(buf) - 1);
+
+    len = sendto(sd, buf, sizeof(buf), 0,
+                    (struct sockaddr_mctp *)&addr, sizeof(addr));
+
+The network and address fields of ``addr`` define the remote address to send to.
+If ``smctp_tag`` has the ``MCTP_TAG_OWNER``, the kernel will ignore any bits set
+in ``MCTP_TAG_VALUE``, and generate a tag value suitable for the destination
+EID. If ``MCTP_TAG_OWNER`` is not set, the message will be sent with the tag
+value as specified. If a tag value cannot be allocated, the system call will
+report an errno of ``EAGAIN``.
+
+The application must provide the message type byte as the first byte of the
+message buffer passed to ``sendto()``. If a message integrity check is to be
+included in the transmitted message, it must also be provided in the message
+buffer, and the most-significant bit of the message type byte must be 1.
+
+The ``sendmsg()`` system call allows a more compact argument interface, and the
+message buffer to be specified as a scatter-gather list. At present no ancillary
+message types (used for the ``msg_control`` data passed to ``sendmsg()``) are
+defined.
+
+Transmitting a message on an unconnected socket with ``MCTP_TAG_OWNER``
+specified will cause an allocation of a tag, if no valid tag is already
+allocated for that destination. The (destination-eid,tag) tuple acts as an
+implicit local socket address, to allow the socket to receive responses to this
+outgoing message. If any previous allocation has been performed (to for a
+different remote EID), that allocation is lost.
+
+Sockets will only receive responses to requests they have sent (with TO=1) and
+may only respond (with TO=0) to requests they have received.
+
+``recvfrom()``, ``recvmsg()``, ``recv()`` : receive an MCTP message
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+An MCTP message can be received by an application using one of the
+``recvfrom()``, ``recvmsg()``, or ``recv()`` system calls. Using ``recvfrom()``
+as the primary example:
+
+.. code-block:: C
+
+    struct sockaddr_mctp addr;
+    socklen_t addrlen;
+    char buf[14];
+    ssize_t len;
+
+    addrlen = sizeof(addr);
+
+    len = recvfrom(sd, buf, sizeof(buf), 0,
+                    (struct sockaddr_mctp *)&addr, &addrlen);
+
+    /* We can expect addr to describe an MCTP address */
+    assert(addrlen >= sizeof(buf));
+    assert(addr.smctp_family == AF_MCTP);
+
+    printf("received %zd bytes from remote EID %d\n", rc, addr.smctp_addr);
+
+The address argument to ``recvfrom`` and ``recvmsg`` is populated with the
+remote address of the incoming message, including tag value (this will be needed
+in order to reply to the message).
+
+The first byte of the message buffer will contain the message type byte. If an
+integrity check follows the message, it will be included in the received buffer.
+
+The ``recv()`` system call behaves in a similar way, but does not provide a
+remote address to the application. Therefore, these are only useful if the
+remote address is already known, or the message does not require a reply.
+
+Like the send calls, sockets will only receive responses to requests they have
+sent (TO=1) and may only respond (TO=0) to requests they have received.
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ca73465e690..73beb91891ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11037,6 +11037,7 @@ M:	Jeremy Kerr <jk@codeconstruct.com.au>
 M:	Matt Johnston <matt@codeconstruct.com.au>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/networking/mctp.rst
 F:	drivers/net/mctp/
 F:	include/net/mctp.h
 F:	include/net/mctpdevice.h
-- 
2.30.2

