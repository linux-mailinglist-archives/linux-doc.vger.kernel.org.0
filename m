Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E530597CBB
	for <lists+linux-doc@lfdr.de>; Thu, 18 Aug 2022 06:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242799AbiHREFg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Aug 2022 00:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242829AbiHREFf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 00:05:35 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10BBABF13
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 21:05:32 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso3590786pjl.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Aug 2022 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=taJ95rkw893RGTNr4hK9cGQ+mt/GpwmRWjI5ZnffZzc=;
        b=oqkMhP/GbhgGYOfPcSLFqjGWgw59egI8oyjoLcNHNCsS71iq6lEpBMNYu80aUUqjYw
         wZNjqqoXZ3N05PesnBOhvQagiXUwiOIuBgk0eK3hFbyrPDomusJCE5/RtxbEmx+0U8R4
         Sl6GCzUcZkX4KVf91menqARo5WVv3+t0amkeTqPHAkQqOLsTuItQgN+q+RYLAxoCnhC/
         aX+Nl1w9v7dausv6zPJRUpYYiW/7d0ngQWQsMX+6RXMS9TZQg4ztbyX7MwZbPKxk9jun
         0ZHwP/iF1Kk78HMyEZls54GeJaYEMt1RxNXEYIa76MzsuwBHEX4JJfu1Zi1E3zO2Jpdl
         4vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=taJ95rkw893RGTNr4hK9cGQ+mt/GpwmRWjI5ZnffZzc=;
        b=hQ2UV0AuIuarAUxE0rsjNesJUCEJbyARp6nfonNO2AopdQHtl2tCJhFPYqasIMxuHm
         6z029riyZE0ugOn/C4Z+bXX5/v5syOdP/aK6q7Zyo6/tzNlvoi1WxOWLsJzQ/UwlsnZ6
         yr31oM+OrL0HFTR850WT1D49b61zSPryjjCOoLh6ufI+DsWaDf7kUNL+0WyrgiOCSEpi
         DkuUtCv2dLexJfsJcz8PO0SGrkZPJiDgkLOtU4yW3J3VNxQ3uLQXgZyQXWK39xsbfzVB
         vnCPx73BHWcXm9psuWiAcmLnjIs8vqNUHvWH0+4SSeqCtX+j1zPdK+O++7lpqhqy/NfS
         2VRw==
X-Gm-Message-State: ACgBeo0lES/VIQVk2q6nM457CC71bfTDrCPhcZWDT78BKFlCGWvUutqs
        ljvbKooUag4UOVo88CKYL4hnwWz77hJaeKqeXwVpBA==
X-Google-Smtp-Source: AA6agR4ewj769dPt0ASFp2EbNb5UttmsNegbRatIffsoM+ey6vGvgcH4dcA7adNBPeabmztptp3kLh+1edV1bOmPKwI=
X-Received: by 2002:a17:903:4ce:b0:171:2cbb:ba27 with SMTP id
 jm14-20020a17090304ce00b001712cbbba27mr1255952plb.72.1660795532231; Wed, 17
 Aug 2022 21:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220818023504.105565-1-kuba@kernel.org> <20220818023504.105565-2-kuba@kernel.org>
In-Reply-To: <20220818023504.105565-2-kuba@kernel.org>
From:   Stanislav Fomichev <sdf@google.com>
Date:   Wed, 17 Aug 2022 21:05:21 -0700
Message-ID: <CAKH8qBv7zoD6NyYBUeb3o9KjG2KpX8iw8aCpNNsoUa=oJA=VsA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] docs: netlink: basic introduction to Netlink
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        johannes@sipsolutions.net, stephen@networkplumber.org,
        ecree.xilinx@gmail.com, benjamin.poirier@gmail.com,
        idosch@idosch.org, f.fainelli@gmail.com, jiri@resnulli.us,
        dsahern@kernel.org, fw@strlen.de, linux-doc@vger.kernel.org,
        jhs@mojatatu.com, tgraf@suug.ch, jacob.e.keller@intel.com,
        svinota.saveliev@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 17, 2022 at 7:35 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Provide a bit of a brain dump of netlink related information
> as documentation. Hopefully this will be useful to people
> trying to navigate implementing YAML based parsing in languages
> we won't be able to help with.
>
> I started writing this doc while trying to figure out what
> it'd take to widen the applicability of YAML to good old rtnl,
> but the doc grew beyond that as it usually happens.
>
> In all honesty a lot of this information is new to me as I usually
> follow the "copy an existing example, drink to forget" process
> of writing netlink user space, so reviews will be much appreciated.

Super interesting read, thank you! Especially the parts about best
practices (always ack, extended ack, etc).
I left one spelling nit suggestion (and a small question about using
classing families over genetlink).

> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --
> Jon, I'm putting this in userspace-api/ I think it fits reasonably
> well there but please don't hesitate to suggest a better home.
>
> CC: corbet@lwn.net
> CC: johannes@sipsolutions.net
> CC: stephen@networkplumber.org
> CC: sdf@google.com
> CC: ecree.xilinx@gmail.com
> CC: benjamin.poirier@gmail.com
> CC: idosch@idosch.org
> CC: f.fainelli@gmail.com
> CC: jiri@resnulli.us
> CC: dsahern@kernel.org
> CC: fw@strlen.de
> CC: linux-doc@vger.kernel.org
> CC: jhs@mojatatu.com
> CC: tgraf@suug.ch
> CC: jacob.e.keller@intel.com
> CC: svinota.saveliev@gmail.com
> ---
>  Documentation/userspace-api/netlink/index.rst |  12 +
>  Documentation/userspace-api/netlink/intro.rst | 538 ++++++++++++++++++
>  2 files changed, 550 insertions(+)
>  create mode 100644 Documentation/userspace-api/netlink/index.rst
>  create mode 100644 Documentation/userspace-api/netlink/intro.rst
>
> diff --git a/Documentation/userspace-api/netlink/index.rst b/Documentation/userspace-api/netlink/index.rst
> new file mode 100644
> index 000000000000..c2ef21dce6e7
> --- /dev/null
> +++ b/Documentation/userspace-api/netlink/index.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: BSD-3-Clause
> +
> +================
> +Netlink Handbook
> +================
> +
> +Netlink documentation.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   intro
> diff --git a/Documentation/userspace-api/netlink/intro.rst b/Documentation/userspace-api/netlink/intro.rst
> new file mode 100644
> index 000000000000..1e6154e7bea6
> --- /dev/null
> +++ b/Documentation/userspace-api/netlink/intro.rst
> @@ -0,0 +1,538 @@
> +.. SPDX-License-Identifier: BSD-3-Clause
> +
> +=======================
> +Introduction to Netlink
> +=======================
> +
> +Netlink is often described as an ioctl() replacement.
> +It aims to replace fixed-format C structures as supplied
> +to ioctl() with a format which allows an easy way to add
> +or extended the arguments.
> +
> +To achieve this Netlink uses a minimal fixed-format metadata header
> +followed by multiple attributes in the TLV (type, length, value) format.
> +
> +Unfortunately the protocol has evolved over the years, in an organic
> +and undocumented fashion, making it hard to coherently explain.
> +To make the most practical sense this document starts by describing
> +netlink as it is used today and dives into more "historical" uses
> +in later sections.
> +
> +Opening a socket
> +================
> +
> +Netlink communication happens over sockets, a socket needs to be
> +opened first:
> +
> +.. code-block:: c
> +
> +  fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
> +
> +The use of sockets allows for a natural way of exchanging information
> +in both directions (to and from the kernel). The operations are still
> +performed synchronously when applications send() the request but
> +a separate recv() system call is needed to read the reply.
> +
> +A very simplified flow of a Netlink "call" will therefore look
> +something like:
> +
> +.. code-block:: c
> +
> +  fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
> +
> +  /* format the request */
> +  send(fd, &request, sizeof(request));
> +  n = recv(fd, &response, RSP_BUFFER_SIZE);
> +  /* interpret the response */
> +
> +Netlink also provides natural support for "dumping", i.e. communicating
> +to user space all objects of a certain type (e.g. dumping all network
> +interfaces).
> +
> +.. code-block:: c
> +
> +  fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
> +
> +  /* format the dump request */
> +  send(fd, &request, sizeof(request));
> +  while (1) {
> +    n = recv(fd, &buffer, RSP_BUFFER_SIZE);
> +    /* one recv() call can read multiple messages, hence the loop below */
> +    for (nl_msg in buffer) {
> +      if (nl_msg.nlmsg_type == NLMSG_DONE)
> +        goto dump_finished;
> +      /* process the object */
> +    }
> +  }
> +  dump_finished:
> +
> +The first two arguments of the socket() call require little explanation -
> +it is opening a Netlink socket, with all headers provided by the user
> +(hence NETLINK, RAW). The last argument is the protocol within Netlink.
> +This field used to identify the subsystem with which the socket will
> +communicate.
> +
> +Classic vs Generic Netlink
> +--------------------------
> +
> +Initial implementation of Netlink depended on a static allocation
> +of IDs to subsystems and provided little supporting infrastructure.
> +Let us refer to those protocols collectively as **Classic Netlink**.
> +The list of them is defined on top of the ``include/uapi/linux/netlink.h``
> +file, they include among others - general networking (NETLINK_ROUTE),
> +iSCSI (NETLINK_ISCSI), and audit (NETLINK_AUDIT).
> +
> +**Generic Netlink** (introduced in 2005) allows for dynamic registration of
> +subsystems (and subsystem ID allocation), introspection and simplifies
> +implementing the kernel side of the interface.
> +
> +The following section describes how to use Generic Netlink, as the
> +number of subsystems using Generic Netlink outnumbers the older
> +protocols by an order of magnitude. There are also no plans for adding
> +more Classic Netlink protocols to the kernel.
> +Basic information on how communicating with core networking parts of
> +the Linux kernel (or another of the 20 subsystems using Classic
> +Netlink) differs from Generic Netlink is provided later in this document.
> +
> +Generic Netlink
> +===============
> +
> +In addition to the Netlink fixed metadata header each Netlink protocol
> +defines its own fixed metadata header. (Similarly to how network
> +headers stack - Ethernet > IP > TCP we have Netlink > Generic N. > Family.)
> +
> +A Netlink message always starts with struct nlmsghdr, which is followed
> +by a protocol-specific header. In case of Generic Netlink the protocol
> +header is struct genlmsghdr.
> +
> +The practical meaning of the fields in case of Generic Netlink is as follows:
> +
> +.. code-block:: c
> +
> +  struct nlmsghdr {
> +       __u32   nlmsg_len;      /* Length of message including headers */
> +       __u16   nlmsg_type;     /* Generic Netlink Family (subsystem) ID */
> +       __u16   nlmsg_flags;    /* Flags - request or dump */
> +       __u32   nlmsg_seq;      /* Sequence number */
> +       __u32   nlmsg_pid;      /* Endpoint ID, set to 0 */
> +  };
> +  struct genlmsghdr {
> +       __u8    cmd;            /* Command, as defined by the Family */
> +       __u8    version;        /* Irrelevant, set to 1 */
> +       __u16   reserved;       /* Reserved, set to 0 */
> +  };
> +  /* TLV attributes follow... */
> +
> +In Classic Netlink :c:member:`nlmsghdr.nlmsg_type` used to identify
> +which operation within the subsystem the message was referring to
> +(e.g. get information about a netdev). Generic Netlink needs to mux
> +multiple subsystems in a single protocol so it uses this field to
> +identify the subsystem, and :c:member:`genlmsghdr.cmd` identifies
> +the operation instead. (See :ref:`res_fam` for
> +information on how to find the Family ID of the subsystem of interest.)
> +Note that the first 16 values (0 - 15) of this field are reserved for
> +control messages both in Classic Netlink and Generic Netlink.
> +See :ref:`nl_msg_type` for more details.
> +
> +There are 3 usual types of message exchanges on a Netlink socket:
> +
> + - performing a single action (``do``);
> + - dumping information (``dump``);
> + - getting asynchronous notifications (``multicast``).
> +
> +Classic Netlink is very flexible and presumably allows other types
> +of exchanges to happen, but in practice those are the three that get
> +used.
> +
> +Asynchronous notifications are sent by the kernel and received by
> +the user sockets which subscribed to them. ``do`` and ``dump`` requests
> +are initiated by the user. :c:member:`nlmsghdr.nlmsg_flags` should
> +be set as follows:
> +
> + - for ``do``: ``NLM_F_REQUEST | NLM_F_ACK``
> + - for ``dump``: ``NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP``
> +
> +:c:member:`nlmsghdr.nlmsg_seq` should be a set to a monotonically
> +increasing value. The value gets echoed back in responses and doesn't
> +matter in practice, but setting it to an increasing value for each
> +message sent is considered good hygiene. The purpose of the field is
> +matching responses to requests. Asynchronous notifications will have
> +:c:member:`nlmsghdr.nlmsg_seq` of ``0``.
> +
> +:c:member:`nlmsghdr.nlmsg_pid` is the Netlink equivalent of an address.
> +This field can be set to ``0`` when talking to the kernel.
> +See :ref:`nlmsg_pid` for the (uncommon) uses of the field.
> +
> +The expected use for :c:member:`genlmsghdr.version` was to allow
> +versioning of the APIs provided by the subsystems. No subsystem to
> +date made significant use of this field, so setting it to ``1`` seems
> +like a safe bet.
> +
> +.. _nl_msg_type:
> +
> +Netlink message types
> +---------------------
> +
> +As previously mentioned :c:member:`nlmsghdr.nlmsg_type` carries
> +protocol specific values but the first 16 identifiers are reserved
> +(first subsystem specific message type should be equal to
> +``NLMSG_MIN_TYPE`` which is ``0x10``).
> +
> +There are only 4 Netlink control messages defined:
> +
> + - ``NLMSG_NOOP`` - ignore the message, not used in practice;
> + - ``NLMSG_ERROR`` - carries the return code of an operation;
> + - ``NLMSG_DONE`` - marks the end of a dump;
> + - ``NLMSG_OVERRUN`` - socket buffer has overflown.
> +
> +``NLMSG_ERROR`` and ``NLMSG_DONE`` are of practical importance.
> +They carry return codes for operations. Note that unless
> +the ``NLM_F_ACK`` flag is set on the request Netlink will not respond
> +with ``NLMSG_ERROR`` if there is no error. To avoid having to special-case
> +this quirk it is recommended to always set ``NLM_F_ACK``.
> +
> +The format of ``NLMSG_ERROR`` is described by struct nlmsgerr::
> +
> +  ----------------------------------------------
> +  | struct nlmsghdr - response header          |
> +  ----------------------------------------------
> +  |    int error                               |
> +  ----------------------------------------------
> +  | struct nlmsghdr - original request header |
> +  ----------------------------------------------
> +  | ** optionally (1) payload of the request   |
> +  ----------------------------------------------
> +  | ** optionally (2) extended ACK             |
> +  ----------------------------------------------
> +
> +There are two instances of struct nlmsghdr here, first of the response
> +and second of the request. ``NLMSG_ERROR`` carries the information about
> +the request which led to the error. This could be useful when trying
> +to match requests to responses or re-parse the request to dump it into
> +logs.
> +
> +The payload of the request is not echoed in messages reporting success
> +(``error == 0``) or if ``NETLINK_CAP_ACK`` setsockopt() was set.
> +The latter is common
> +and perhaps recommended as having to read a copy of every request back
> +from the kernel is rather wasteful. The absence of request payload
> +is indicated by ``NLM_F_CAPPED`` in :c:member:`nlmsghdr.nlmsg_flags`.
> +
> +The second optional element of ``NLMSG_ERROR`` are the extended ACK
> +attributes. See :ref:`ext_ack` for more details. The presence
> +of extended ACK is indicated by ``NLM_F_ACK_TLVS`` in
> +:c:member:`nlmsghdr.nlmsg_flags`.
> +
> +``NLMSG_DONE`` is simpler, the request is never echoed but the extended
> +ACK attributes may be present::
> +
> +  ----------------------------------------------
> +  | struct nlmsghdr - response header          |
> +  ----------------------------------------------
> +  |    int error                               |
> +  ----------------------------------------------
> +  | ** optionally extended ACK                 |
> +  ----------------------------------------------
> +
> +.. _res_fam:
> +
> +Resolving the Family ID
> +-----------------------
> +
> +This sections explains how to find the Family ID of a subsystem.

s/sections/section/ ?

> +It also serves as an example of Generic Netlink communication.
> +
> +Generic Netlink is itself a subsystem exposed via the Generic Netlink API.
> +To avoid a circular dependency Generic Netlink has a statically allocated
> +Family ID (``GENL_ID_CTRL`` which is equal to ``NLMSG_MIN_TYPE``).
> +The Generic Netlink family implements a command used to find out information
> +about other families (``CTRL_CMD_GETFAMILY``).
> +
> +To get information about the Generic Netlink family named for example
> +``"test1"`` we need to send a message on the previously opened Generic Netlink
> +socket. The message should target the Generic Netlink Family (1), be a
> +``do`` (2) call to ``CTRL_CMD_GETFAMILY`` (3). A ``dump`` version of this
> +call would make the kernel respond with information about *all* the families
> +it knows about. Last but not least the name of the family in question has
> +to be specified (4) as an attribute with the appropriate type::
> +
> +  struct nlmsghdr:
> +    __u32 nlmsg_len:   32
> +    __u16 nlmsg_type:  GENL_ID_CTRL               // (1)
> +    __u16 nlmsg_flags: NLM_F_REQUEST | NLM_F_ACK  // (2)
> +    __u32 nlmsg_seq:   1
> +    __u32 nlmsg_pid:   0
> +
> +  struct genlmsghdr:
> +    __u8 cmd:          CTRL_CMD_GETFAMILY         // (3)
> +    __u8 version:      2 /* or 1, doesn't matter */
> +    __u16 reserved:    0
> +
> +  struct nlattr:                                   // (4)
> +    __u16 nla_len:     10
> +    __u16 nla_type:    CTRL_ATTR_FAMILY_NAME
> +    char data:                 test1\0
> +
> +  (padding:)
> +    char data:         \0\0
> +
> +The length fields in Netlink (:c:member:`nlmsghdr.nlmsg_len`
> +and :c:member:`nlattr.nla_len`) always *include* the header.
> +Headers in netlink must be aligned to 4 bytes from the start of the message,
> +hence the extra ``\0\0`` at the end of the message. The attribute lengths
> +*exclude* the padding.
> +
> +If the family is found kernel will reply with two messages, the response
> +with all the information about the family::
> +
> +  /* Message #1 - reply */
> +  struct nlmsghdr:
> +    __u32 nlmsg_len:   136
> +    __u16 nlmsg_type:  GENL_ID_CTRL
> +    __u16 nlmsg_flags: 0
> +    __u32 nlmsg_seq:   1    /* echoed from our request */
> +    __u32 nlmsg_pid:   5831 /* The PID of our user space process */
> +
> +  struct genlmsghdr:
> +    __u8 cmd:          CTRL_CMD_GETFAMILY
> +    __u8 version:      2
> +    __u16 reserved:    0
> +
> +  struct nlattr:
> +    __u16 nla_len:     10
> +    __u16 nla_type:    CTRL_ATTR_FAMILY_NAME
> +    char data:                 test1\0
> +
> +  (padding:)
> +    data:              \0\0
> +
> +  struct nlattr:
> +    __u16 nla_len:     6
> +    __u16 nla_type:    CTRL_ATTR_FAMILY_ID
> +    __u16:             123  /* The Family ID we are after */
> +
> +  (padding:)
> +    char data:         \0\0
> +
> +  struct nlattr:
> +    __u16 nla_len:     9
> +    __u16 nla_type:    CTRL_ATTR_FAMILY_VERSION
> +    __u16:             1
> +
> +  /* ... etc, more attributes will follow. */
> +
> +And the error code (success) since ``NLM_F_ACK`` had been set on the request::
> +
> +  /* Message #2 - the ACK */
> +  struct nlmsghdr:
> +    __u32 nlmsg_len:   36
> +    __u16 nlmsg_type:  NLMSG_ERROR
> +    __u16 nlmsg_flags: NLM_F_CAPPED /* There won't be a payload */
> +    __u32 nlmsg_seq:   1    /* echoed from our request */
> +    __u32 nlmsg_pid:   5831 /* The PID of our user space process */
> +
> +  int error:           0
> +
> +  struct nlmsghdr: /* Copy of the request header as we sent it */
> +    __u32 nlmsg_len:   32
> +    __u16 nlmsg_type:  GENL_ID_CTRL
> +    __u16 nlmsg_flags: NLM_F_REQUEST | NLM_F_ACK
> +    __u32 nlmsg_seq:   1
> +    __u32 nlmsg_pid:   0
> +
> +The order of attributes (struct nlattr) is not guaranteed so the user
> +has to walk the attributes and parse them.
> +
> +Note that Generic Netlink sockets are not associated or bound to a single
> +family. A socket can be used to exchange messages with many different
> +families, selecting the recipient family on message-by-message basis using
> +the :c:member:`nlmsghdr.nlmsg_type` field.
> +
> +.. _ext_ack:
> +
> +Extended ACK
> +------------
> +
> +Extended ACK controls reporting of additional error/warning TLVs
> +in ``NLMSG_ERROR`` and ``NLMSG_DONE`` messages. To maintain backward
> +compatibility this feature has to be explicitly enabled by setting
> +the ``NETLINK_EXT_ACK`` setsockopt() to ``1``.
> +
> +Types of extended ack attributes are defined in enum nlmsgerr_attrs.
> +The two most commonly used attributes are ``NLMSGERR_ATTR_MSG``
> +and ``NLMSGERR_ATTR_OFFS``.
> +
> +``NLMSGERR_ATTR_MSG`` carries a message in English describing
> +the encountered problem. These messages are far more detailed
> +than what can be expressed thru standard UNIX error codes.
> +
> +``NLMSGERR_ATTR_OFFS`` points to the attribute which caused the problem.
> +
> +Extended ACKs can be reported on errors as well as in case of success.
> +The latter should be treated as a warning.
> +
> +Extended ACKs greatly improve the usability of Netlink and should
> +always be enabled, appropriately parsed and reported to the user.
> +
> +Dump consistency
> +----------------
> +
> +Some of the data structures kernel uses for storing objects make
> +it hard to provide an atomic snapshot of all the objects in a dump
> +(without impacting the fast-paths updating them).
> +
> +Kernel may set the ``NLM_F_DUMP_INTR`` flag on any message in a dump
> +(including the ``NLMSG_DONE`` message) if the dump was interrupted and
> +may be inconsistent (e.g. missing objects). User space should retry
> +the dump if it sees the flag set.
> +
> +Introspection
> +-------------
> +
> +The basic introspection abilities are enabled by access to the Family
> +object as reported in :ref:`res_fam`. User can query information about
> +the Generic Netlink family, including which operations are supported
> +by the kernel and what attributes the kernel understands.
> +Family information includes the highest ID of an attribute kernel can parse,
> +a separate command (``CTRL_CMD_GETPOLICY``) provides detailed information
> +about supported attributes, including ranges of values the kernel accepts.
> +
> +Querying family information is useful in rare cases when user space needs
> +to make sure that the kernel has support for a feature before issuing
> +a request.
> +
> +.. _nlmsg_pid:
> +
> +nlmsg_pid
> +---------
> +
> +:c:member:`nlmsghdr.nlmsg_pid` is called PID because the protocol predates
> +wide spread use of multi-threading and the initial recommendation was
> +to use process ID in this field. Process IDs start from 1 hence the use
> +of ``0`` to mean "allocate automatically".
> +
> +The field is still used today in rare cases when kernel needs to send
> +a unicast notification. User space application can use bind() to associate
> +its socket with a specific PID (similarly to binding to a UDP port),
> +it then communicates its PID to the kernel.
> +The kernel can now reach the user space process.
> +
> +This sort of communication is utilized in UMH (user mode helper)-like
> +scenarios when kernel needs to trigger user space logic or ask user
> +space for a policy decision.
> +
> +Kernel will automatically fill the field with process ID when responding
> +to a request sent with the :c:member:`nlmsghdr.nlmsg_pid` value of ``0``.
> +
> +Classic Netlink
> +===============
> +
> +The main differences between Classic and Generic Netlink are the dynamic
> +allocation of subsystem identifiers and availability of introspection.
> +In theory the protocol does not differ significantly, however, in practice
> +Classic Netlink experimented with concepts which were abandoned in Generic
> +Netlink (really, they usually only found use in a small corner of a single
> +subsystem). This section is meant as an explainer of a few of such concepts,
> +with the explicit goal of giving the Generic Netlink
> +users the confidence to ignore them when reading the uAPI headers.
> +
> +Most of the concepts and examples here refer to the ``NETLINK_ROUTE`` family,
> +which covers much of the configuration of the Linux networking stack.
> +Real documentation of that family, deserves a chapter (or a book) of its own.
> +

I'm assuming the answer is "no", but nonetheless: is it possible to
use classic families over generic netlink (discover/get policy/etc)?
So we can just assume everything is genetlink and safely ignore all
old quirks of the classic variant?

> +Families
> +--------
> +
> +Netlink refers to subsystems as families. This is a remnant of using
> +sockets and the concept of protocol families, which are part of message
> +demultiplexing in ``NETLINK_ROUTE``.
> +
> +Sadly every layer of encapsulation likes to refer to whatever it's carrying
> +as "families" making the term very confusing:
> +
> + 1. AF_NETLINK is a bona fide socket protocol family
> + 2. AF_NETLINK's documentation refers to what comes after its own
> +    header (struct nlmsghdr) in a message as a "Family Header"
> + 3. Generic Netlink is a family for AF_NETLINK (struct genlmsghdr follows
> +    struct nlmsghdr), yet it also calls its users "Families".
> +
> +Note that the Generic Netlink Family IDs are in a different "ID space"
> +and overlap with Classic Netlink protocol numbers (e.g. ``NETLINK_CRYPTO``
> +has the Classic Netlink protocol ID of 21 which Generic Netlink will
> +happily allocate to one of its families as well).
> +
> +Strict checking
> +---------------
> +
> +The ``NETLINK_GET_STRICT_CHK`` socket option enables strict input checking
> +in ``NETLINK_ROUTE``. It was needed because historically kernel did not
> +validate the fields of structures it didn't process. This made it impossible
> +to start using those fields later without risking regressions in applications
> +which initialized them incorrectly or not at all.
> +
> +``NETLINK_GET_STRICT_CHK`` declares that the application is initializing
> +all fields correctly. It also opts into validating that message does not
> +contain trailing data and requests that kernel rejects attributes with
> +type higher than largest attribute type known to the kernel.
> +
> +``NETLINK_GET_STRICT_CHK`` is not used outside of ``NETLINK_ROUTE``.
> +
> +Unknown attributes
> +------------------
> +
> +Historically Netlink ignored all unknown attributes. The thinking was that
> +it would free the application from having to probe what kernel supports.
> +The application could make a request to change the state and check which
> +parts of the request "stuck".
> +
> +This is no longer the case for new Generic Netlink families and those opting
> +in to strict checking. See enum netlink_validation for validation types
> +performed.
> +
> +Fixed metadata and structures
> +-----------------------------
> +
> +Classic Netlink made liberal use of fixed-format structures within
> +the messages. Messages would commonly have a structure with
> +a considerable number of fields after struct nlmsghdr. It was also
> +common to put structures with multiple members inside attributes,
> +without breaking each member into an attribute of its own.
> +
> +Request types
> +-------------
> +
> +``NETLINK_ROUTE`` categorized requests into 4 types ``NEW``, ``DEL``, ``GET``,
> +and ``SET``. Each object can handle all or some of those requests
> +(objects being netdevs, routes, addresses, qdiscs etc.) Request type
> +is defined by the 2 lowest bits of the message type, so commands for
> +new objects would always be allocated with a stride of 4.
> +
> +Each object would also have it's own fixed metadata shared by all request
> +types (e.g. struct ifinfomsg for netdev requests, struct ifaddrmsg for address
> +requests, struct tcmsg for qdisc requests).
> +
> +Even though other protocols and Generic Netlink commands often use
> +the same verbs in their message names (``GET``, ``SET``) the concept
> +of request types did not find wider adoption.
> +
> +Message flags
> +-------------
> +
> +The earlier section has already covered the basic request flags
> +(``NLM_F_REQUEST``, ``NLM_F_ACK``, ``NLM_F_DUMP``) and the ``NLMSG_ERROR`` /
> +``NLMSG_DONE`` flags (``NLM_F_CAPPED``, ``NLM_F_ACK_TLVS``).
> +Dump flags were also mentioned (``NLM_F_MULTI``, ``NLM_F_DUMP_INTR``).
> +
> +Those are the main flags of note, with a small exception (of ``ieee802154``)
> +Generic Netlink does not make use of other flags. If the protocol needs
> +to communicate special constraints for a request it should use
> +an attribute, not the flags in struct nlmsghdr.
> +
> +Classic Netlink, however, defined various flags for its ``GET``, ``NEW``
> +and ``DEL`` requests. Since request types have not been generalized
> +the request type specific flags should not be used either.
> +
> +uAPI reference
> +==============
> +
> +.. kernel-doc:: include/uapi/linux/netlink.h
> --
> 2.37.2
>
